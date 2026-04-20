package app.controller;

import app.dto.CaseBasedReasoningDTO;
import app.service.CbrService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * REST Controller for CBR (Case-Based Reasoning) operations.
 * 
 * <p>
 * Exposes endpoints to trigger similarity-based analysis against
 * historical legal cases stored in the CSV database.
 * </p>
 */
@RestController
@RequestMapping("/api/cbr")
@CrossOrigin("*")
@AllArgsConstructor
public class CbrController {

    private final CbrService cbrService;

    /**
     * Finds and returns similar historical cases based on the provided case
     * features.
     * 
     * @param request Data containing the features of the current case.
     * @return JSON string containing a list of top similar cases.
     */
    @PostMapping("/reason")
    public ResponseEntity<String> performCbrAnalysis(@RequestBody CaseBasedReasoningDTO request) throws IOException {
        String result = cbrService.generateReasoning(request);
        return ResponseEntity.ok(result);
    }
}
