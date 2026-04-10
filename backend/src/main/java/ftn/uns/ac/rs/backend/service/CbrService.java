package ftn.uns.ac.rs.backend.service;

import ftn.uns.ac.rs.backend.dto.CaseBasedReasoningDTO;
import lombok.AllArgsConstructor;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import org.springframework.stereotype.Service;

/**
 * CbrService (Case-Based Reasoning Service).
 * 
 * <p>
 * CBR is a problem-solving paradigm that retrieves similar past
 * legal cases to provide reasoning for current legal situations.
 * </p>
 * 
 * <p>
 * This service interfaces with a Python script that calculates similarity
 * using Jaccard indices and monetary value differences.
 * </p>
 */
@Service
@AllArgsConstructor
public class CbrService {

    private final CsvService csvService;

    /**
     * Executes the Case-Based Reasoning analysis by calling an external Python
     * script.
     * 
     * @param dto The features of the current case.
     * @return A JSON string containing the most similar cases found in the
     *         database.
     */
    public String generateReasoning(CaseBasedReasoningDTO dto) throws IOException {
        Path rootPath = csvService.getRootPath();
        Path scriptPath = rootPath.resolve("case_based_reasoning.py");
        Path exportPath = rootPath.resolve("cbr.txt");

        try {
            ProcessBuilder pb = new ProcessBuilder(
                    "python",
                    scriptPath.toString(),
                    dto.getValueOfStolenThings().toString(),
                    dto.getCriminalAct(),
                    dto.getIntention(),
                    dto.getStealWay());

            pb.redirectErrorStream(true);
            Process process = pb.start();
            process.waitFor();

        } catch (IOException | InterruptedException e) {
            throw new RuntimeException("Error executing CBR script", e);
        }

        if (Files.exists(exportPath)) {
            return Files.readString(exportPath, StandardCharsets.UTF_8);
        }
        return "[]";
    }
}
