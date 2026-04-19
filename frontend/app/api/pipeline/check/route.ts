import { NextResponse } from "next/server";
import fs from "fs";
import path from "path";

// Define the absolute paths based on project structure
// NextJS is inside `frontend`, PDFs are in `documents/akoma-ntoso/pdf/`
// HTMLs are mapped inside `frontend/public/html/judgements`

export async function GET() {
  try {
    const projectRoot = path.join(process.cwd(), "..", "documents", "akoma-ntoso");
    const pdfDir = path.join(projectRoot, "pdf");
    const xmlDir = projectRoot;

    // Check if directories exist
    if (!fs.existsSync(pdfDir) || !fs.existsSync(xmlDir)) {
      return NextResponse.json({ hasNewPdfs: false, error: "Directories missing" });
    }

    // Read PDFs
    const pdfFiles = fs
      .readdirSync(pdfDir)
      .filter((file) => file.toLowerCase().endsWith(".pdf"));

    // Check if any PDF has a corresponding XML generated. 
    // This is tricky because Odluka.pdf translates to K_70_2024.xml, so filenames don't match 1:1.
    // An alternative reliable way to detect unprocessed files is to check the last modified
    // time of the `xmlDir` compared to the newest PDF. If a PDF is newer than the newest XML, 
    // we assume it hasn't been processed yet.
    
    let newestPdfTime = 0;
    for (const file of pdfFiles) {
      const stats = fs.statSync(path.join(pdfDir, file));
      if (stats.mtimeMs > newestPdfTime) {
        newestPdfTime = stats.mtimeMs;
      }
    }

    if (pdfFiles.length > 0 && newestPdfTime > 0) {
      // Find the newest XML (excluding non-judgement reference files)
      const xmlFiles = fs
        .readdirSync(xmlDir)
        .filter((file) => file.toLowerCase().endsWith(".xml") && file.toLowerCase() !== "krivicni_zakon_crne_gore.xml");

      let newestXmlTime = 0;
      for (const file of xmlFiles) {
        const stats = fs.statSync(path.join(xmlDir, file));
        if (stats.mtimeMs > newestXmlTime) {
          newestXmlTime = stats.mtimeMs;
        }
      }

      // If the newest PDF in the folder is newer than the newest generated XML,
      // it means there's a new PDF waiting to be processed!
      // Provide a 5 second buffer to prevent race conditions during generation.
      if (newestPdfTime > newestXmlTime + 5000) {
        return NextResponse.json({ hasNewPdfs: true });
      }
    }

    return NextResponse.json({ hasNewPdfs: false });
  } catch (error) {
    console.error("Error checking PDF pipeline status:", error);
    return NextResponse.json({ hasNewPdfs: false, error: "Server check failed" });
  }
}
