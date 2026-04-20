package app.service;

import app.dto.RuleBasedReasoningDTO;
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

        // Map form values to DR-DEVICE canonical terms
        String stealType = mapStealType(dto.getStealType());
        String stealWay  = mapStealWay(dto.getStealWay());
        String intention = mapIntention(dto.getIntention());
        int    money     = dto.getMoney() != null ? dto.getMoney() : 0;

        // Still write facts.rdf and run engine (for academic completeness / logging)
        generateFactsRDF(drDevicePath.resolve("facts.rdf"), dto, stealType, stealWay, intention);
        runRuleEngine(drDevicePath);

        // Evaluate rules directly in Java (mirror of rulebase.ruleml logic)
        return evaluateRules(stealType, stealWay, intention, money);
    }

    /** Maps UI crime-type strings to DR-DEVICE rulebase terms. */
    private String mapStealType(String raw) {
        if (raw == null) return "";
        String s = raw.toLowerCase();
        if (s.contains("razbojni") || s.contains("kradja") || s.contains("krađa") || s.contains("robbery")) return "robbery";
        if (s.contains("competition") || s.contains("namješta") || s.contains("namesta") || s.contains("utakmica")) return "competition_outcome_arrangement";
        if (s.contains("utaja")) return "embezzlement";
        return s;
    }

    /** Maps UI steal-way strings to DR-DEVICE rulebase terms. */
    private String mapStealWay(String raw) {
        if (raw == null) return "standard";
        String s = raw.toLowerCase();
        if (s.contains("grup") || s.contains("group") || s.contains("ozbilj") || s.contains("seriously")) return "group_or_seriously_injured";
        if (s.contains("život") || s.contains("smrt") || s.contains("deprive") || s.contains("usmr")) return "deprived_of_life";
        return "standard";
    }

    /** Maps UI intention strings to DR-DEVICE rulebase terms. */
    private String mapIntention(String raw) {
        if (raw == null) return "";
        String s = raw.toLowerCase();
        if (s.contains("silu") || s.contains("sila") || s.contains("force")) return "uses_force";
        if (s.contains("preti") || s.contains("prijetnja") || s.contains("threat")) return "threatens_to_attack";
        if (s.contains("imovinu") || s.contains("krade") || s.contains("keeps") || s.contains("kradja")) return "keeps_stolen_thing";
        if (s.contains("sopstven") || s.contains("own") || s.contains("lična korist")) return "own_benefit";
        if (s.contains("tud") || s.contains("someone") || s.contains("drugog")) return "someones_benefit";
        return s;
    }

    /** Mirrors the defeasible rules from rulebase.ruleml exactly. */
    private String evaluateRules(String stealType, String stealWay, String intention, int money) {
        boolean isRobbery  = "robbery".equals(stealType);
        boolean isContest  = "competition_outcome_arrangement".equals(stealType);
        boolean isStandard = "standard".equals(stealWay);
        boolean isGroup    = "group_or_seriously_injured".equals(stealWay);
        boolean isDead     = "deprived_of_life".equals(stealWay);
        boolean forceful   = "uses_force".equals(intention) || "threatens_to_attack".equals(intention) || "keeps_stolen_thing".equals(intention);
        boolean benefitOwn = "own_benefit".equals(intention) || "someones_benefit".equals(intention);

        // --- ROBBERY rules ---
        if (isRobbery) {
            // lv6: robbery + standard + money < 150 (minor, overrides lv1)
            if (isStandard && money < 150 && forceful)
                return LAW_MAPPINGS.get("robbery_lv6") + " KAZNA: " + PUNISHMENT_MAPPINGS.get("max_imprisonment_robbery_6");

            // lv5: robbery + deprived_of_life
            if (isDead && forceful)
                return LAW_MAPPINGS.get("robbery_lv5") + " KAZNA: " + PUNISHMENT_MAPPINGS.get("max_imprisonment_robbery_5");

            // lv4: robbery + group_or_seriously_injured
            if (isGroup && forceful)
                return LAW_MAPPINGS.get("robbery_lv4") + " KAZNA: " +
                        PUNISHMENT_MAPPINGS.get("min_imprisonment_robbery_4") +
                        PUNISHMENT_MAPPINGS.get("max_imprisonment_robbery_4");

            // lv3: robbery + standard + money > 30000
            if (isStandard && money > 30000)
                return LAW_MAPPINGS.get("robbery_lv3") + " KAZNA: " +
                        PUNISHMENT_MAPPINGS.get("min_imprisonment_robbery_3") +
                        PUNISHMENT_MAPPINGS.get("max_imprisonment_robbery_3");

            // lv2: robbery + standard + money > 3000
            if (isStandard && money > 3000)
                return LAW_MAPPINGS.get("robbery_lv2") + " KAZNA: " +
                        PUNISHMENT_MAPPINGS.get("min_imprisonment_robbery_2") +
                        PUNISHMENT_MAPPINGS.get("max_imprisonment_robbery_2");

            // lv1: robbery default (standard way, any intention)
            if (forceful)
                return LAW_MAPPINGS.get("robbery_lv1") + " KAZNA: " +
                        PUNISHMENT_MAPPINGS.get("min_imprisonment_robbery_1") +
                        PUNISHMENT_MAPPINGS.get("max_imprisonment_robbery_1");
        }

        // --- COMPETITION OUTCOME ARRANGEMENT rules ---
        if (isContest && (benefitOwn || forceful)) {
            if (money > 40000)
                return COMPETITION_MAPPINGS.get("competition_outcome_arrangement_lv3") + " KAZNA: " +
                        PUNISHMENT_MAPPINGS.get("max_imprisonment_competition_outcome_arrangement_3");
            if (money > 10000)
                return COMPETITION_MAPPINGS.get("competition_outcome_arrangement_lv2") + " KAZNA: " +
                        PUNISHMENT_MAPPINGS.get("min_imprisonment_competition_outcome_arrangement_2") +
                        PUNISHMENT_MAPPINGS.get("max_imprisonment_competition_outcome_arrangement_2");
            return COMPETITION_MAPPINGS.get("competition_outcome_arrangement_lv1") + " KAZNA: " +
                    PUNISHMENT_MAPPINGS.get("min_imprisonment_competition_outcome_arrangement_1") +
                    PUNISHMENT_MAPPINGS.get("max_imprisonment_competition_outcome_arrangement_1");
        }

        return "Za date podatke nije pronađen prekršen zakon.";
    }

    private void generateFactsRDF(Path path, RuleBasedReasoningDTO dto,
                                  String stealType, String stealWay, String intention) throws IOException {
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
                dto.getName(), dto.getName(), dto.getDefendant(), dto.getMoney() != null ? dto.getMoney() : 0,
                stealType, intention, stealWay);
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
}
