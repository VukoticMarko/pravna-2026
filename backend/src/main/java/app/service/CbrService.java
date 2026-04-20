package app.service;

import app.dto.CaseBasedReasoningDTO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Objects;
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
@RequiredArgsConstructor
public class CbrService {

    private static final Logger logger = LoggerFactory.getLogger(CbrService.class);

    @Value("${python.executable:python}")
    private String pythonExecutable;

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
        Path scriptPath = rootPath.resolve("scripts").resolve("cbr").resolve("case_based_reasoning.py");
        Path exportPath = rootPath.resolve("scripts").resolve("cbr").resolve("cbr.txt");

        try {
            ProcessBuilder pb = new ProcessBuilder(
                    pythonExecutable,
                    scriptPath.toString(),
                    dto.getValueOfStolenThings().toString(),
                    dto.getCriminalAct(),
                    dto.getIntention(),
                    dto.getStealWay(),
                    nullSafe(dto.getArticlesCriminalAct()),
                    nullSafe(dto.getArticlesCondemnation()),
                    nullSafe(dto.getCourt()),
                    nullSafe(dto.getPunishment()));

            pb.directory(rootPath.toFile());
            pb.redirectErrorStream(true);
            Process process = pb.start();

            // Read output line by line so it appears in the Spring Boot log
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
            String line;
            while ((line = reader.readLine()) != null) {
                logger.info("[CBR] {}", line);
            }

            int exitCode = process.waitFor();
            if (exitCode != 0) {
                throw new RuntimeException("CBR script failed (exit " + exitCode + ")");
            }

        } catch (IOException | InterruptedException e) {
            throw new RuntimeException("Error executing CBR script", e);
        }

        if (Files.exists(exportPath)) {
            return Files.readString(exportPath, StandardCharsets.UTF_8);
        }
        return "[]";
    }

    private String nullSafe(String value) {
        return value != null ? value : "";
    }
}
