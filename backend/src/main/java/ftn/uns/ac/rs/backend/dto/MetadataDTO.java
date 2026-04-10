package ftn.uns.ac.rs.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Data Transfer Object for legal case metadata.
 * 
 * <p>
 * <b>Usage:</b> This DTO is primarily used as a response object in
 * {@link ftn.uns.ac.rs.backend.controller.CaseController}.
 * </p>
 * 
 * <p>
 * <b>When:</b> It is instantiated after the system extracts information from a
 * raw PDF file
 * (using {@code RegexParser}) or retrieves an existing record from the CSV
 * database (via {@code CsvService}).
 * </p>
 * 
 * <p>
 * <b>Why:</b> It serves to aggregate all structured data points extracted from
 * a legal verdict—such
 * as the judge's name, defendant initials, and the specific punishment—into a
 * single container
 * that the frontend can easily render for the user.
 * </p>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MetadataDTO {
    /** The full name of the court (e.g., "OSNOVNI SUD U PODGORICI"). */
    String courtName;

    /** The case reference number (e.g., "K 123/20"). */
    String caseNumber;

    /** The name of the presiding judge. */
    String judge;

    /** Initials or name of the defendant. */
    String defendant;

    /** The category of the court (osnovni, visi, etc.). */
    String courtType;

    /** The total calculated value of stolen items in Euros. */
    float stolenItemsValue;

    /** Description of the criminal act(s). */
    String criminalAct;

    /** Legal articles related to the criminal act itself. */
    String criminalActArticles;

    /** Legal articles cited for the final conviction. */
    String punishmentArticles;

    /** The final sentence or punishment imposed by the court. */
    String punishment;
}
