package app.service;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Service responsible for parsing raw legal text using Regular Expressions.
 */
@Service
public class RegexParser {

    /**
     * Extracts the introductory section of a court verdict.
     * 
     * @param text raw case text
     * @return the first paragraph containing court info
     */
    public String extractIntro(String text) {
        return extractWithRegex(text, "U IME CRNE GORE[-– ,.A-ZČĆŠĐŽa-zčćšđž0-9/]+P R E S U D U", 0);
    }

    /**
     * Extracts the full name of the court from the text.
     * 
     * @param text raw case text
     * @return found court name or "Not found"
     */
    public String extractCourtName(String text) {
        String intro = extractIntro(text);
        return extractWithRegex(intro, "([A-ZČĆŠĐŽ]+ SUD U [A-ZČĆŠĐŽ]+)|[A-ZČĆŠĐŽa-zčćšđž]+ sud u [A-ZČĆŠĐŽa-zčćšđž]+",
                0);
    }

    /**
     * Extracts the case identifier (e.g., K 123/20").
     * 
     * @param text raw case text
     * @return found case number or "Not found"
     */
    public String extractCaseNumber(String text) {
        return extractWithRegex(text, "K *[0-9]{1,5} */ *[0-9]{2,4}", 0);
    }

    /**
     * Extracts the presiding judge's name.
     * 
     * @param text raw case text
     * @return judge name or "Not found"
     */
    public String extractJudgeName(String text) {
        String intro = extractIntro(text);
        String judgePart = extractWithRegex(intro,
                "sudij[aei] +(pojedincu +)?(pojedinac +)?[A-ZČĆŠĐŽa-zčćšđž]+.? *[A-ZČĆŠĐŽa-zčćšđž]+.? *(-[A-ZČĆŠĐŽa-zčćšđž]+.? *)?,",
                0);
        if (judgePart.equals("Not found"))
            return judgePart;

        return extractWithRegex(judgePart,
                "[A-ZČĆŠĐŽ].?[a-zčćšđž]* *[A-ZČĆŠĐŽ].?[a-zčćšđž]* *(- *[A-ZČĆŠĐŽ][a-zčćšđž]*)?", 0)
                .replaceAll(" +", " ");
    }

    /**
     * Extracts the defendant info (usually initials).
     * 
     * @param text raw case text
     * @return defendant initials or "Not found"
     */
    public String extractDefendant(String text) {
        String intro = extractIntro(text);
        String defendantPart = extractWithRegex(intro,
                "((okrivljenog)|(optuženog)|(okrivljene)) +[A-ZČĆŠĐŽ] *\\.? *[A-ZČĆŠĐŽ] *\\.?", 0);
        if (defendantPart.equals("Not found"))
            return defendantPart;

        return extractWithRegex(defendantPart, "[A-ZČĆŠĐŽ] *\\.? *[A-ZČĆŠĐŽ] *\\.?", 0);
    }

    /**
     * Calculates the total value of stolen assets mentioned in the verdict.
     * 
     * @param text raw case text
     * @return sum of currency values found
     */
    public float extractStolenValue(String text) {
        float total = 0;
        String rangeRegex = "K R I V (A )?J E[-– ,.A-ZČĆŠĐŽa-zčćšđž0-9/’()„“”:;€\"!+]+O S U Đ U J E";
        Pattern pattern = Pattern.compile(rangeRegex);
        Matcher matcher = pattern.matcher(text);

        if (matcher.find()) {
            String paragraph = matcher.group();
            Pattern valuePattern = Pattern.compile("[0-9]+([.,][0-9]+)? ?((€)|(eura))");
            Matcher valueMatcher = valuePattern.matcher(paragraph);
            while (valueMatcher.find()) {
                total += parseCurrency(valueMatcher.group().trim());
            }
        }
        return total;
    }

    /**
     * Extracts the description of the criminal act (e.g., "krađa").
     * 
     * @param text raw case text
     * @return act types separated by semicolon
     */
    public String extractCriminalAct(String text) {
        List<String> acts = new ArrayList<>();
        Pattern pattern = Pattern.compile("((krivično djelo)|(kriv.djelo)) -?–? ?([a-zčćšđž ]+) iz");
        Matcher matcher = pattern.matcher(text);
        while (matcher.find()) {
            String act = matcher.group(4).trim();
            if (!acts.contains(act))
                acts.add(act);
        }
        return acts.isEmpty() ? "Not found" : String.join(";", acts);
    }

    /**
     * Extracts articles of the law related to the criminal act description.
     * 
     * @param text raw case text
     * @return articles separated by semicolon
     */
    public String extractActArticles(String text) {
        List<String> articles = new ArrayList<>();
        Pattern pattern = Pattern.compile(
                "((krivično djelo)|(kriv.djelo)) -?–? ?[a-zčćšđž ]+ iz ([A-ZČĆŠĐŽa-zčćšđž .0-9]+((Krivičnog [Zz]akonika( Crne Gore)?)|(KZCG)|(KZ(-a)?)))");
        Matcher matcher = pattern.matcher(text);
        while (matcher.find()) {
            String art = matcher.group(4).trim();
            if (!articles.contains(art))
                articles.add(art);
        }
        return articles.isEmpty() ? "Not found" : String.join(";", articles);
    }

    /**
     * Extracts articles used by the court to determine the specific punishment.
     * 
     * @param text raw case text
     * @return conviction articles separated by semicolon
     */
    public String extractPunishmentArticles(String text) {
        String rangeRegex = "[Pp]a ((ga [Ss]ud)|(mu [Ss]ud)|([Ss]ud)|(ga)|(je [Ss]ud)),? [-()A-ZČĆŠĐŽa-zčćšđž .,:;0-9]+O S U Đ U J E";
        Pattern pattern = Pattern.compile(rangeRegex);
        Matcher matcher = pattern.matcher(text);

        if (matcher.find()) {
            List<String> articles = new ArrayList<>();
            Pattern artPattern = Pattern.compile(
                    "čl.[0-9člstavi .,]+((Krivičnog [Zz]akonika( Crne Gore)?)|(Zakonika o krivičnom postupku)|(KZCG)|(KZ-a)|(ZKP(-a)?))");
            Matcher artMatcher = artPattern.matcher(matcher.group());
            while (artMatcher.find()) {
                String art = artMatcher.group().trim();
                if (!articles.contains(art))
                    articles.add(art);
            }
            return articles.isEmpty() ? "Not found" : String.join(";", articles);
        }
        return "Not found";
    }

    /**
     * Extracts the specific finalized sentence/punishment text.
     * 
     * @param text raw case text
     * @return punishment description or "Not found"
     */
    public String extractPunishment(String text) {
        String paragraph = extractWithRegex(text, "O S U Đ U J E[ ,.A-ZČĆŠĐŽa-zčćšđž0-9()]+", 0);
        if (paragraph.equals("Not found"))
            return paragraph;
        return extractWithRegex(paragraph,
                "kaznu zatvora u trajanju od [0-9]+ \\([a-zčćšđž ]+\\) ?[a-zčćšđž]*( i [0-9]+ \\([a-zčćšđž]+\\) [a-zčćšđž]+)?",
                0);
    }

    /**
     * Internal helper for generic regex matching.
     * 
     * @param text  source text
     * @param regex pattern
     * @param group group index
     * @return matched string or "Not found"
     */
    private String extractWithRegex(String text, String regex, int group) {
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(text);
        return m.find() ? m.group(group).trim() : "Not found";
    }

    /**
     * Converts currency strings into float values.
     * 
     * @param value raw value string
     * @return float representation
     */
    private float parseCurrency(String value) {
        String numeric = value.replaceAll("[^\\d,.]", "").replace(',', '.');
        return (float) Double.parseDouble(numeric);
    }
}
