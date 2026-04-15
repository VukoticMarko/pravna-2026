import { NextResponse } from "next/server";
import { exec } from "child_process";
import path from "path";
import util from "util";

const execPromise = util.promisify(exec);

export async function POST() {
  try {
    // We need to run these commands in the backend folder
    const backendPath = path.join(process.cwd(), "..", "backend");
    const pythonPath = path.join(process.cwd(), "..", ".venv", "Scripts", "python.exe");

    console.log("Starting PDF -> XML conversion...");
    const { stdout: xmlOut, stderr: xmlErr } = await execPromise(`"${pythonPath}" pdf_to_xml.py`, { cwd: backendPath });
    console.log(xmlOut);
    if (xmlErr) console.error("stderr pdf_to_xml:", xmlErr);

    console.log("Starting XML -> HTML conversion...");
    const { stdout: htmlOut, stderr: htmlErr } = await execPromise(`"${pythonPath}" xml_to_html.py`, { cwd: backendPath });
    console.log(htmlOut);
    if (htmlErr) console.error("stderr xml_to_html:", htmlErr);

    return NextResponse.json({ success: true, message: "Pipeline executed successfully" });
  } catch (error) {
    console.error("Pipeline generation failed:", error);
    return NextResponse.json(
        { success: false, error: "Failed to execute python pipeline. Check terminal logs." },
        { status: 500 }
    );
  }
}
