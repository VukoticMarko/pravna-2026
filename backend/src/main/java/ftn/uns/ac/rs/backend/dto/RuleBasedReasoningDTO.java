package ftn.uns.ac.rs.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Data Transfer Object for Rule-Based Reasoning (RBR) requests.
 * 
 * <p>
 * <b>Usage:</b> Passed as the request body to
 * {@link ftn.uns.ac.rs.backend.controller.RuleBasedReasoningController}.
 * </p>
 * 
 * <p>
 * <b>When:</b> Employed when the user wants to classify a new situation against
 * the
 * hard-coded legal rules within the DR-DEVICE expert system.
 * </p>
 * 
 * <p>
 * <b>Why:</b> It collects a specific subset of variables (monetary value,
 * intention,
 * steal way) required to generate RDF facts. These facts are then processed by
 * the
 * DR-DEVICE engine to determine which legal article was violated and what the
 * potential penalty is.
 * </p>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RuleBasedReasoningDTO {
    /** A label or name for the specific reasoning session. */
    private String name;

    /** Initials or name of the potential defendant. */
    private String defendant;

    /** The monetary amount involved in the act. */
    private Integer money;

    /** The type of theft/act as categorized by the user. */
    private String stealType;

    /** The intent of the actor. */
    private String intention;

    /** The specific circumstances of the act (e.g., "obijanje"). */
    private String stealWay;
}
