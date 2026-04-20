package app.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.nio.file.Paths;

@Component
public class PdfToXmlRunner implements CommandLineRunner {

    @Value("${python.executable:python}")
    private String pythonExecutable;

    private static final Logger logger = LoggerFactory.getLogger(PdfToXmlRunner.class);

    @Override
    public void run(String... args) throws Exception {
        logger.info("Initializing PDF to Akoma Ntoso XML conversion...");
        try {
            // Path to python script (within the project backend root)
            String scriptPath = Paths.get(System.getProperty("user.dir"), "pdf_to_xml.py").toString();
            File scriptFile = new File(scriptPath);

            if (!scriptFile.exists()) {
                logger.warn("PDF conversion script not found at {}. Skipping conversion.", scriptPath);
                return;
            }

            ProcessBuilder processBuilder = new ProcessBuilder(pythonExecutable, scriptPath);
            // Run inside the python script's directory or the project root
            processBuilder.directory(scriptFile.getParentFile());

            Process process = processBuilder.start();

            // Read output
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                logger.info("[PDF-XML] " + line);
            }

            // Read errors
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            while ((line = errorReader.readLine()) != null) {
                logger.error("[PDF-XML ERROR] " + line);
            }

            int exitCode = process.waitFor();
            if (exitCode == 0) {
                logger.info("PDF to XML conversion completed successfully.");

                // Now run the XML to HTML conversion script
                String htmlScriptPath = Paths.get(System.getProperty("user.dir"), "xml_to_html.py").toString();
                File htmlScriptFile = new File(htmlScriptPath);

                if (htmlScriptFile.exists()) {
                    logger.info("Initializing Akoma Ntoso XML to HTML conversion...");
                    ProcessBuilder htmlProcessBuilder = new ProcessBuilder(pythonExecutable, htmlScriptPath);
                    htmlProcessBuilder.directory(htmlScriptFile.getParentFile());
                    Process htmlProcess = htmlProcessBuilder.start();

                    BufferedReader htmlReader = new BufferedReader(new InputStreamReader(htmlProcess.getInputStream()));
                    String htmlLine;
                    while ((htmlLine = htmlReader.readLine()) != null) {
                        logger.info("[XML-HTML] " + htmlLine);
                    }

                    BufferedReader htmlErrorReader = new BufferedReader(
                            new InputStreamReader(htmlProcess.getErrorStream()));
                    while ((htmlLine = htmlErrorReader.readLine()) != null) {
                        logger.error("[XML-HTML ERROR] " + htmlLine);
                    }

                    int htmlExitCode = htmlProcess.waitFor();
                    if (htmlExitCode == 0) {
                        logger.info("XML to HTML conversion completed successfully.");
                    } else {
                        logger.error("XML to HTML conversion failed with exit code: " + htmlExitCode);
                    }
                } else {
                    logger.warn("HTML conversion script not found at {}. Skipping HTML conversion.", htmlScriptPath);
                }

            } else {
                logger.error("PDF to XML conversion failed with exit code: " + exitCode);
            }
        } catch (Exception e) {
            logger.error("Exception occurred while running PDF to XML conversion", e);
        }
    }
}
