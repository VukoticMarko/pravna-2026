package app.controller;

import app.CaseService;
import app.dto.CaseBasedReasoningDTO;
import app.dto.MetadataDTO;
import lombok.AllArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Map;

/**
 * REST Controller for managing and extracting data from Court Verdicts
 * (Presude).
 * 
 * <p>
 * Handles administrative tasks like fetching PDF files, extracting metadata
 * through NLP parsing, and creating new case records in the database.
 * </p>
 */
@RestController
@RequestMapping("/api/verdicts")
@CrossOrigin("*")
@AllArgsConstructor
public class VerdictController {

    private final CaseService caseService;

    /**
     * Downloads the original PDF document for a specific verdict.
     * 
     * @param caseNumber The formatted case number (e.g. K-123-20)
     * @return Binary stream of the PDF file.
     */
    @GetMapping(value = "/{caseNumber}/pdf", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity<byte[]> getVerdictPdf(@PathVariable String caseNumber) throws IOException {
        byte[] pdfContent = caseService.getCasePDF(caseNumber);
        return ResponseEntity.ok(pdfContent);
    }

    /**
     * Extracts structured metadata from a verdict PDF using Regex-based NLP.
     * 
     * @param caseNumber The case number to identify the file.
     * @return Extracted MetadataDTO or error.
     */
    @GetMapping("/{caseNumber}/extract")
    public ResponseEntity<?> extractVerdictMetadata(@PathVariable("caseNumber") String caseNumber) {
        try {
            // Priority 1: Check CSV for manually updated/stored data
            MetadataDTO existing = caseService.extractNewCaseMetadata(caseNumber);
            if (existing != null) {
                return ResponseEntity.ok(existing);
            }

            // Priority 2: Extract from PDF if exists
            if (caseService.caseExists(caseNumber)) {
                String text = caseService.getCaseText(caseNumber);
                MetadataDTO metadata = new MetadataDTO(
                        caseService.extractCourtName(text),
                        caseService.extractCaseNumber(text),
                        caseService.extractJudgeName(text),
                        caseService.extractDefendant(text),
                        caseService.extractCourtType(text),
                        caseService.extractStolenValue(text),
                        caseService.extractCriminalAct(text),
                        caseService.extractCriminalActArticles(text),
                        caseService.extractPunishmentArticles(text),
                        caseService.extractPunishment(text));
                return ResponseEntity.ok(metadata);
            }

            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.internalServerError()
                    .body(Map.of(
                            "error", e.getClass().getSimpleName(),
                            "message", e.getMessage() != null ? e.getMessage() : "Failed to extract metadata for: " + caseNumber,
                            "caseNumber", caseNumber));
        }
    }

    /**
     * Persists a newly analyzed verdict into the CSV database for future CBR
     * analysis.
     * 
     * @param dto The data to be saved.
     */
    @PostMapping
    public ResponseEntity<Void> registerNewVerdict(@RequestBody CaseBasedReasoningDTO dto) {
        caseService.createNewCase(dto);
        return ResponseEntity.ok().build();
    }
}
