package app.controller;

import app.dto.RuleBasedReasoningDTO;
import app.service.RbrService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * REST Controller for RBR (Rule-Based Reasoning) operations.
 * 
 * <p>
 * Handles requests to the DR-DEVICE expert system engine to
 * perform logical inference on legal rules.
 * </p>
 */
@RestController
@RequestMapping("/api/rbr")
@CrossOrigin("*")
@AllArgsConstructor
public class RbrController {

    private final RbrService rbrService;

    /**
     * Executes the legal rule engine to categorize the case and determine potential
     * penalties.
     * 
     * @param request The facts of the case formatted for the rule engine.
     * @return A textual legal conclusion including articles and suggested
     *         punishment.
     */
    @PostMapping("/reason")
    public ResponseEntity<String> performRbrAnalysis(@RequestBody RuleBasedReasoningDTO request)
            throws IOException, InterruptedException {
        String reasoning = rbrService.generateReasoning(request);
        return ResponseEntity.ok(reasoning);
    }
}
