package ftn.uns.ac.rs.backend.service;

import ftn.uns.ac.rs.backend.dto.RuleBasedReasoningDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

/**
 * RbrService (Rule-Based Reasoning Service).
 * 
 * <p>
 * RBR is a formal logic-based approach where the system reaches conclusions
 * by applying a set of predefined legal rules (if-then statements) to the facts
 * of a case.
 * </p>
 * 
 * <p>
 * This service interfaces with the <b>DR-DEVICE</b> expert system engine.
 * It generates factual data in RDF format, executes the engine's inference
 * rules,
 * and parses the results back into human-readable legal qualifications.
 * </p>
 */
@Service
@AllArgsConstructor
public class RbrService {

    private final CsvService csvService;

    /**
     * Mappings of rule IDs to legal descriptions.
     * IMPORTANT: Keys must exactly match the tags exported by the DR-DEVICE expert
     * system.
     */
    private static final Map<String, String> LAW_MAPPINGS = Map.of(
            "robbery_lv1",
            "Član 241 Stavka 1: Upotreba sile protiv nekog lica ili pretnja da će neposredno napasti na život ili telo. Oduzimanje tuđe pokretne stvari u nameri da njenim prisvajanjem sebi ili drugom pribavi protivpravnu imovinsku korist.",
            "robbery_lv2",
            "Član 241 Stavka 2: Upotreba sile protiv nekog lica ili pretnja da će neposredno napasti na život ili telo. Oduzimanje tuđe pokretne stvari u nameri da njenim prisvajanjem sebi ili drugom pribavi protivpravnu imovinsku korist. Vrednost ukradenih stvari iznad 3000e.",
            "robbery_lv3",
            "Član 241 Stavka 3: Upotreba sile protiv nekog lica ili pretnja da će neposredno napasti na život ili telo. Oduzimanje tuđe pokretne stvari u nameri da njenim prisvajanjem sebi ili drugom pribavi protivpravnu imovinsku korist. Vrednost ukradenih stvari iznad 30000e.",
            "robbery_lv4",
            "Član 241 Stavka 4: Upotreba sile protiv nekog lica ili pretnja da će neposredno napasti na život ili telo. Oduzimanje tuđe pokretne stvari u nameri da njenim prisvajanjem sebi ili drugom pribavi protivpravnu imovinsku korist. Učinjeno od strane grupe ili je nekom licu sa umišljanjem nanesena teška telesna povreda.",
            "robbery_lv5",
            "Član 241 Stavka 5: Upotreba sile protiv nekog lica ili pretnja da će neposredno napasti na život ili telo. Oduzimanje tuđe pokretne stvari u nameri da njenim prisvajanjem sebi ili drugom pribavi protivpravnu imovinsku korist. Neko lice je sa umišljanjem lišeno života.",
            "robbery_lv6",
            "Član 241 Stavka 6: Upotreba sile protiv nekog lica ili pretnja da će neposredno napasti na život ili telo. Oduzimanje tuđe pokretne stvari u nameri da njenim prisvajanjem sebi ili drugom pribavi protivpravnu imovinsku korist. Vrednost ukradenih stvari ne prelazi 150e, a učinilac je išao za tim da pribavi malu imovinsku korist.");

    private static final Map<String, String> COMPETITION_MAPPINGS = Map.of(
            "competition_outcome_arrangement_lv1",
            "Član 244a Stavka 1: Dogovoren ishod sportskog ili drugog takmičenja u nameri da se sebi ili drugom pribavi korist.",
            "competition_outcome_arrangement_lv2",
            "Član 244a Stavka 2: Dogovoren ishod sportskog ili drugog takmičenja u nameri da se sebi ili drugom pribavi korist. Vrednost pribavljene imovinske koristi prelazi iznos od 10000e.",
            "competition_outcome_arrangement_lv3",
            "Član 244a Stavka 3: Dogovoren ishod sportskog ili drugog takmičenja u nameri da se sebi ili drugom pribavi korist. Vrednost pribavljene imovinske koristi prelazi iznos od 40000e.");

    private static final Map<String, String> PUNISHMENT_MAPPINGS = Map.ofEntries(
            Map.entry("min_imprisonment_robbery_1", " Minimalan broj godina u zatvoru je 1 godina."),
            Map.entry("max_imprisonment_robbery_1", " Maksimalan broj godina u zatvoru je 8 godina."),
            Map.entry("min_imprisonment_robbery_2", " Minimalan broj godina u zatvoru je 2 godine."),
            Map.entry("max_imprisonment_robbery_2", " Maksimalan broj godina u zatvoru je 10 godina."),
            Map.entry("min_imprisonment_robbery_3", " Minimalan broj godina u zatvoru je 3 godina."),
            Map.entry("max_imprisonment_robbery_3", " Maksimalan broj godina u zatvoru je 12 godina."),
            Map.entry("min_imprisonment_robbery_4", " Minimalan broj godina u zatvoru je 10 godina."),
            Map.entry("max_imprisonment_robbery_4", " Maksimalan broj godina u zatvoru je 15 godina."),
            Map.entry("max_imprisonment_robbery_5", " Maksimalan broj godina u zatvoru je doživotna kazna."),
            Map.entry("max_imprisonment_robbery_6", " Maksimalan broj godina u zatvoru je 3 godina."),
            Map.entry("min_imprisonment_competition_outcome_arrangement_1",
                    " Minimalan broj meseci u zatvoru je 6 meseci."),
            Map.entry("max_imprisonment_competition_outcome_arrangement_1",
                    " Maksimalan broj godina u zatvoru je 3 godine."),
            Map.entry("min_imprisonment_competition_outcome_arrangement_2",
                    " Minimalan broj godina u zatvoru je 1 godina."),
            Map.entry("max_imprisonment_competition_outcome_arrangement_2",
                    " Maksimalan broj godina u zatvoru je 10 godina."),
            Map.entry("max_imprisonment_competition_outcome_arrangement_3",
                    " Maksimalan broj godina u zatvoru je 10 godina."));

    /** Executes the rule-based reasoning workflow. */
    public String generateReasoning(RuleBasedReasoningDTO dto) throws IOException, InterruptedException {
        Path rootPath = csvService.getRootPath().getParent();
        Path drDevicePath = rootPath.resolve("dr-device");

        generateFactsRDF(drDevicePath.resolve("facts.rdf"), dto);
        runRuleEngine(drDevicePath);

        Path exportPath = drDevicePath.resolve("export.rdf");
        if (!Files.exists(exportPath))
            return "Rezultat nije pronađen.";

        String rawReasoning = Files.readString(exportPath, StandardCharsets.UTF_8);
        return parseResults(rawReasoning);
    }

    private void generateFactsRDF(Path path, RuleBasedReasoningDTO dto) throws IOException {
        String rdf = String.format(
                "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n" +
                        "<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"\n" +
                        "  xmlns:rdfs=\"http://www.w3.org/2000/01/rdf-schema#\"\n" +
                        "  xmlns:xsd=\"http://www.w3.org/2001/XMLSchema#\"\n" +
                        "  xmlns:lc=\"http://informatika.ftn.uns.ac.rs/legal-case.rdf#\">\n" +
                        "  <lc:case rdf:about=\"http://informatika.ftn.uns.ac.rs/legal-case.rdf#%s\">\n" +
                        "      <lc:name>%s</lc:name>\n" +
                        "      <lc:defendant>%s</lc:defendant>\n" +
                        "      <lc:money rdf:datatype=\"http://www.w3.org/2001/XMLSchema#integer\">%d</lc:money>\n" +
                        "      <lc:steal_type>%s</lc:steal_type>\n" +
                        "      <lc:intention>%s</lc:intention>\n" +
                        "      <lc:steal_way>%s</lc:steal_way>\n" +
                        "  </lc:case>\n" +
                        "</rdf:RDF>",
                dto.getName(), dto.getName(), dto.getDefendant(), dto.getMoney(),
                dto.getStealType(), dto.getIntention(), dto.getStealWay());
        Files.writeString(path, rdf, StandardCharsets.UTF_8);
    }

    private void runRuleEngine(Path drDevicePath) throws IOException, InterruptedException {
        File workingDir = drDevicePath.toFile();
        File batFile = new File(workingDir, "start.bat");

        if (batFile.exists()) {
            ProcessBuilder pb = new ProcessBuilder("cmd", "/c", batFile.getAbsolutePath());
            pb.directory(workingDir);
            pb.start().waitFor();
        }
    }

    private String parseResults(String raw) {
        StringBuilder reasoning = new StringBuilder("PREKRŠEN ZAKON: ");
        boolean found = false;

        // Check Law Mappings
        for (Map.Entry<String, String> entry : LAW_MAPPINGS.entrySet()) {
            if (raw.contains("<export:" + entry.getKey())) {
                reasoning.append(entry.getValue());
                found = true;
                break;
            }
        }

        // Check Competition Mappings
        if (!found) {
            for (Map.Entry<String, String> entry : COMPETITION_MAPPINGS.entrySet()) {
                if (raw.contains("<export:" + entry.getKey())) {
                    reasoning.append(entry.getValue());
                    found = true;
                    break;
                }
            }
        }

        if (!found)
            return "Za date podatke nije pronađen prekršen zakon.";

        reasoning.append(" KAZNA: ");
        for (Map.Entry<String, String> entry : PUNISHMENT_MAPPINGS.entrySet()) {
            if (raw.contains("<export:" + entry.getKey())) {
                reasoning.append(entry.getValue());
            }
        }

        return reasoning.toString();
    }
}
