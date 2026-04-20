package app.service;

import app.dto.CaseBasedReasoningDTO;
import app.dto.MetadataDTO;
import org.springframework.stereotype.Service;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Service responsible for CSV database operations (Persistence).
 */
@Service
public class CsvService {

    private static final String CSV_FILE = "scripts" + File.separator + "cbr" + File.separator + "nlp-output.csv";

    /**
     * Resolves the root project path from the execution directory.
     *
     * @return absolute path to project root
     */
    public Path getRootPath() {
        return Paths.get(System.getProperty("user.dir"));
    }

    /**
     * Appends a new case record to the central CSV database.
     *
     * @param dto data to save
     */
    public void saveCase(CaseBasedReasoningDTO dto) {
        Path path = getRootPath().resolve(CSV_FILE);
        String[] data = {
                dto.getCourt(), dto.getCaseNumber(), dto.getJudge(), dto.getDefendant(),
                dto.getPlaintiff(), String.valueOf(dto.getValueOfStolenThings()),
                dto.getCriminalAct(), dto.getArticlesCriminalAct(), dto.getArticlesCondemnation(),
                dto.getPunishment(), dto.getIntention(), dto.getStealWay()
        };

        try (PrintWriter pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(path.toFile(), true), StandardCharsets.UTF_8)))) {
            pw.println(formatAsCSV(data));
        } catch (IOException e) {
            throw new RuntimeException("CSV Save failed", e);
        }
    }

    /**
     * Searches the CSV for a specific case number and returns its metadata.
     *
     * @param caseNumber identifying number
     * @return mapped metadata or null if not found
     */
    public MetadataDTO findByCaseNumber(String caseNumber) {
        Path path = getRootPath().resolve(CSV_FILE);
        try (BufferedReader br = Files.newBufferedReader(path, StandardCharsets.UTF_8)) {
            String line = br.readLine(); // skip header
            while ((line = br.readLine()) != null) {
                if (line.isBlank()) continue;
                String[] parts = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");
                if (parts.length < 10) continue;
                // Column 1 is broj_slucaja (index 1)
                // Normalize: remove quotes, replace '/' with space to match stem format
                String currentCase = parts[1].trim().replace("\"", "").replace("/", " ");
                if (currentCase.equalsIgnoreCase(caseNumber)) {
                    return mapToMetadata(parts);
                }
            }
        } catch (Exception e) {
            System.err.println("CSV Read failed for case " + caseNumber + ": " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Joins data into a single CSV row, escaping special characters.
     *
     * @param data array of strings
     * @return formatted row
     */
    private String formatAsCSV(String[] data) {
        return Stream.of(data)
                .map(this::escapeCSV)
                .collect(Collectors.joining(","));
    }

    /**
     * Escapes commas, quotes and newlines for CSV safety.
     *
     * @param data cell content
     * @return escaped content
     */
    private String escapeCSV(String data) {
        if (data == null)
            return "";
        String escaped = data.replaceAll("\\R", " ");
        if (data.contains(",") || data.contains("\"") || data.contains("'")) {
            escaped = "\"" + data.replace("\"", "\"\"") + "\"";
        }
        return escaped;
    }

    /**
     * Maps an array of CSV columns to a MetadataDTO.
     *
     * @param p parts (columns)
     * @return MetadataDTO representation
     */
    private MetadataDTO mapToMetadata(String[] p) {
        float stolenValue = 0f;
        try {
            String raw = clean(p[5]);
            if (!raw.isEmpty()) stolenValue = Float.parseFloat(raw);
        } catch (NumberFormatException ignored) {
            // Leave as 0 if value is malformed
        }
        try {
            return new MetadataDTO(
                    clean(p[0]), clean(p[1]), clean(p[2]), clean(p[3]),
                    p.length > 4 ? clean(p[4]) : "",
                    stolenValue,
                    p.length > 6 ? clean(p[6]) : "",
                    p.length > 7 ? clean(p[7]) : "",
                    p.length > 8 ? clean(p[8]) : "",
                    p.length > 9 ? clean(p[9]) : "");
        } catch (Exception e) {
            System.err.println("Mapping failed: " + e.getMessage());
            return null;
        }
    }

    /**
     * Utility to remove artifacts like quotes from CSV reads.
     *
     * @param s raw string
     * @return cleaned string
     */
    private String clean(String s) {
        return s != null ? s.replace("\"", "").trim() : "";
    }
}
