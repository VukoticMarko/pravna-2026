package app;

import app.dto.CaseBasedReasoningDTO;
import app.dto.MetadataDTO;
import app.service.CsvService;
import app.service.RegexParser;
import lombok.AllArgsConstructor;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * Main facade service for handling Legal Cases.
 * Coordinates PDF extraction, text parsing and CSV persistence.
 */
@Service
@AllArgsConstructor
public class CaseService {

	private final ResourceLoader resourceLoader;
	private final RegexParser parser;
	private final CsvService csvService;

	/** Checks if a case PDF file exists in resources. */
	public boolean caseExists(String caseNumber) {
		String filename = caseNumber.replace('-', ' ');
		Resource resource = resourceLoader.getResource("classpath:cases/" + filename + ".pdf");
		return resource.exists();
	}

	/** Loads PDF bytes from resources. */
	public byte[] getCasePDF(String caseNumber) throws IOException {
		String filename = caseNumber.replace('-', ' ');
		Resource resource = resourceLoader.getResource("classpath:cases/" + filename + ".pdf");
		return resource.getInputStream().readAllBytes();
	}

	/** Converts PDF from resources to plain text. */
	public String getCaseText(String caseNumber) throws IOException {
		String filename = caseNumber.replace('-', ' ');
		Resource resource = resourceLoader.getResource("classpath:cases/" + filename + ".pdf");
		try (PDDocument document = PDDocument.load(resource.getInputStream())) {
			PDFTextStripper stripper = new PDFTextStripper();
			return stripper.getText(document).replaceAll("[\\s\\n\\r]+", " ");
		}
	}

	// Parser Delegation
	public String extractCourtName(String text) {
		return parser.extractCourtName(text);
	}

	public String extractCaseNumber(String text) {
		return parser.extractCaseNumber(text);
	}

	public String extractJudgeName(String text) {
		return parser.extractJudgeName(text);
	}

	public String extractDefendant(String text) {
		return parser.extractDefendant(text);
	}

	public String extractCriminalAct(String text) {
		return parser.extractCriminalAct(text);
	}

	public String extractCriminalActArticles(String text) {
		return parser.extractActArticles(text);
	}

	public String extractPunishmentArticles(String text) {
		return parser.extractPunishmentArticles(text);
	}

	public String extractPunishment(String text) {
		return parser.extractPunishment(text);
	}

	public float extractStolenValue(String text) {
		return parser.extractStolenValue(text);
	}

	/** Determines court type based on name. */
	public String extractCourtType(String text) {
		String court = parser.extractCourtName(text);
		if (court.equals("Not found"))
			return court;
		return court.split(" ")[0].toLowerCase().replace('š', 's');
	}

	// CSV Persistence Delegation
	public void createNewCase(CaseBasedReasoningDTO dto) {
		csvService.saveCase(dto);
	}

	public MetadataDTO extractNewCaseMetadata(String caseNumber) {
		return csvService.findByCaseNumber(caseNumber);
	}
}
