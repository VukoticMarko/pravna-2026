package app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Data Transfer Object for Case-Based Reasoning (CBR) requests and case
 * persistence.
 * 
 * <p>
 * <b>Usage:</b>
 * 1. As a request body in
 * {@link app.controller.CaseBasedReasoningController}.
 * 2. As an input parameter for {@code CsvService#saveCase} when creating new
 * records.
 * </p>
 * 
 * <p>
 * <b>When:</b>
 * 1. When a user triggers the "Reasoning by Similarity" feature from the UI.
 * 2. When a user manually submits a form to add a new verdict to the system's
 * knowledge base.
 * </p>
 * 
 * <p>
 * <b>Why:</b> It captures the specific features (stolen value, intention,
 * method of stealing)
 * that the Python CBR script uses to calculate similarity scores against
 * historical cases.
 * It also encapsulates a full case record for CSV storage.
 * </p>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CaseBasedReasoningDTO {

    /** The sentence or punishment applied. */
    private String punishment;

    /** The level of intention (e.g., "direktan umišljaj"). */
    private String intention;

    /** The court name. */
    private String court;

    /** Legal articles describing the act. */
    private String articlesCriminalAct;

    /** The case identifier. */
    private String caseNumber;

    /** The judge's name. */
    private String judge;

    /** Articles related to sentencing/condemnation. */
    private String articlesCondemnation;

    /** The specific method used to perform the theft (e.g., "provaljivanjem"). */
    private String stealWay;

    /** Defendant information. */
    private String defendant;

    /** Description of the criminal act. */
    private String criminalAct;

    /** Total value of assets involved. */
    private Float valueOfStolenThings;

    /** The plaintiff or the party filing the case. */
    private String plaintiff;
}