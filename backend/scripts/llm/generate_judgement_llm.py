import argparse
import json
import os
import sys

try:
    from llama_cpp import Llama
except ImportError:
    print(json.dumps({"error": "llama-cpp-python not installed"}))
    sys.exit(1)

# Path to the specific GGUF model
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
MODEL_PATH = os.path.join(BASE_DIR, "..", "..", "models", "Meta-Llama-3.1-8B-Instruct-Q5_K_S.gguf")

def generate_judgement(court, judge, defendant, criminal_act, article, stolen_value, intention, steal_way):
    if not os.path.exists(MODEL_PATH):
        print(json.dumps({"error": f"Model not found at {MODEL_PATH}"}))
        sys.exit(1)

    # Load the model
    # n_ctx is context size. Using a moderate size to handle the output text and prompt.
    llm = Llama(model_path=MODEL_PATH, n_ctx=2048, verbose=False)

    # System instruction (Llama-3 instruct format)
    system_prompt = """Ti si profesionalni sudija u Crnoj Gori (Montenegro). Tvoj zadatak je da napises formalnu presudu na crnogorskom jeziku na osnovu zadatih cinjenica. 
Moras uvek da odgovoris iskljucivo unutar validnog JSON objekta koji sadrzi tacno dva kljuca:
1. "sankcija": Kratak i precizan tekst osude (npr. 'Na kaznu zatvora u trajanju od...').
2. "obrazlozenje": Detaljno obrazlozenje slucaja (npr. 'Uvidom u dokaze, sud je zakljucio...').
Tvoj JSON mora biti potpuno validan, bez dodatnog teksta."""

    user_prompt = f"""Cinjenice slucaja:
Sud: {court}
Sudija: {judge}
Optuzeni: {defendant}
Krivicno delo: {criminal_act} (Clanovi: {article})
Vrijednost ukradenih stvari: {stolen_value} EUR
Namera: {intention}
Nacin izvrsenja: {steal_way}

Napisi "sankcija" i "obrazlozenje". Odgovaraj samo u JSON formatu. Primer formata:
{{
  "sankcija": "tekst",
  "obrazlozenje": "tekst"
}}
"""

    prompt = f"<|begin_of_text|><|start_header_id|>system<|end_header_id|>\n\n{system_prompt}<|eot_id|><|start_header_id|>user<|end_header_id|>\n\n{user_prompt}<|eot_id|><|start_header_id|>assistant<|end_header_id|>\n\n"

    try:
        response = llm(
            prompt,
            max_tokens=600,
            temperature=0.4,
            top_p=0.9,
            stop=["<|eot_id|>", "```"]
        )
        output_text = response["choices"][0]["text"].strip()
        
        # Robust json extraction: find first '{' and last '}' to extract JSON block
        import re
        if output_text.count('{') > 0 and output_text.count('}') > 0:
            start_idx = output_text.find('{')
            end_idx = output_text.rfind('}') + 1
            if end_idx > start_idx:
                extracted_json_str = output_text[start_idx:end_idx]
                try:
                    parsed = json.loads(extracted_json_str) 
                    print(json.dumps(parsed))
                    return
                except json.JSONDecodeError:
                    pass
                
        # If regex failed or JSON was invalid, fallback to raw heuristic stripping
        if output_text.startswith("```json"):
            output_text = output_text[7:]
        if output_text.startswith("```"):
            output_text = output_text[3:]
        if output_text.endswith("```"):
            output_text = output_text[:-3]
            
        print(output_text.strip())
        
    except Exception as e:
        print(json.dumps({"error": str(e)}))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("court")
    parser.add_argument("judge")
    parser.add_argument("defendant")
    parser.add_argument("criminal_act")
    parser.add_argument("article")
    parser.add_argument("stolen_value")
    parser.add_argument("intention")
    parser.add_argument("steal_way")
    
    args = parser.parse_args()
    generate_judgement(args.court, args.judge, args.defendant, args.criminal_act, args.article, args.stolen_value, args.intention, args.steal_way)
