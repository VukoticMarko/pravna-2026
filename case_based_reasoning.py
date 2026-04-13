import argparse
import json
import re
from pathlib import Path
from typing import Any, Dict, Iterable, List, Set

import pandas as pd

# Path configuration
BASE_PATH = Path(__file__).parent.resolve()

# Columns that should not be used for similarity calculation
COLUMNS_TO_EXCLUDE = [
    "sud",
    "broj_slucaja",
    "sudija",
    "optuzeni",
    "tuzilac",
    "vr_ukradenih_stvari",
    "kazna",
    "clanovi_kriv_dela",
    "clanovi_osude",
]


def calc_jaccard_similarity(set1: Set[str], set2: Set[str]) -> float:
    """Calculates the Jaccard similarity between two sets of words."""
    intersection = len(set1.intersection(set2))
    union = len(set1.union(set2))
    return intersection / union if union > 0 else 0.0


def calc_modified_jaccard_similarity(
    jaccard_similarity: float,
    avg_value: float,
    threshold: float,
    value_diff: float,
) -> float:
    """Adjusts Jaccard similarity based on difference in stolen item values."""
    if value_diff <= threshold:
        # Boost similarity if values are very close
        modified_diff = (1 - (value_diff / threshold)) / 10  # max +0.1
        jaccard_similarity += modified_diff
    else:
        # Penalize similarity if values are far apart
        modified_diff = value_diff / (10 * avg_value) if avg_value > 0 else 0
        jaccard_similarity -= modified_diff

    return max(0.0, min(1.0, jaccard_similarity))


def get_case_set(values: Iterable[str]) -> Set[str]:
    """Tokenizes a set of strings into word sets for comparison."""
    full_text = " ".join(str(v) for v in values if v)
    return set(re.split(r"[.,\s]", string=full_text.lower()))


def get_case_dict(df: pd.DataFrame, index: int, similarity: float) -> Dict[str, Any]:
    """Converts a dataframe row into a dictionary with similarity score."""
    case_data = df.iloc[index].astype(str).to_dict()
    case_data["jaccard_similarity"] = round(float(similarity), 3)
    return case_data


def process_similarity_analysis(stolen_value: float, criminal_act: str, intention: str, steal_way: str):
    """Executes the CBR logic and exports top 5 matches to cbr.txt."""
    csv_path = BASE_PATH / "nlp-output.csv"
    if not csv_path.exists():
        print(f"Error: {csv_path} not found.")
        return

    df = pd.read_csv(csv_path)
    
    # Calculate statistics for normalization
    avg_value = df["vr_ukradenih_stvari"].mean() if not df.empty else 0
    threshold = avg_value / 5

    input_set = get_case_set([criminal_act, intention, steal_way])

    results: List[Dict[str, Any]] = []
    for index, row in df.iterrows():
        # 1. Base Jaccard on text features
        features = [str(val) for col, val in row.items() if col not in COLUMNS_TO_EXCLUDE]
        similarity = calc_jaccard_similarity(get_case_set(features), input_set)

        # 2. Refine based on monetary value
        row_value = float(row["vr_ukradenih_stvari"])
        similarity = calc_modified_jaccard_similarity(
            similarity,
            avg_value,
            threshold,
            value_diff=abs(row_value - stolen_value)
        )

        results.append(get_case_dict(df, index, similarity))

    # Sort and take top 5
    results.sort(key=lambda x: x["jaccard_similarity"], reverse=True)
    top_matches = results[:5]

    # Export to text file (JSON format)
    export_path = BASE_PATH / "cbr.txt"
    with open(export_path, "w", encoding="utf-8") as f:
        json.dump(top_matches, f, indent=4, ensure_ascii=False)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Case-Based Reasoning for Court Verdicts")
    parser.add_argument("stolen_value", type=float, help="Value of stolen assets")
    parser.add_argument("criminal_act", type=str, help="Name of the criminal act")
    parser.add_argument("intention", type=str, help="Legal intention level")
    parser.add_argument("steal_way", type=str, help="Modus operandi / Way of stealing")

    args = parser.parse_args()
    process_similarity_analysis(
        args.stolen_value, 
        args.criminal_act, 
        args.intention, 
        args.steal_way
    )
