import { NextRequest, NextResponse } from "next/server";
import { spawn } from "child_process";
import path from "path";

export async function POST(request: NextRequest) {
  try {
    const data = await request.json();
    
    return new Promise((resolve) => {
      // Create path to script in backend/scripts/llm folder
      const scriptPath = path.resolve(process.cwd(), "..", "backend", "scripts", "llm", "generate_judgement_llm.py");
      const pythonExe = "python";

      const pyProcess = spawn(pythonExe, [
        scriptPath,
        data.court || "",
        data.judge || "",
        data.defendant || "",
        data.criminalAct || "",
        data.articlesCriminalAct || "",
        data.valueOfStolenThings?.toString() || "0",
        data.intention || "",
        data.stealWay || ""
      ]);

      let outputData = "";
      let errorData = "";

      pyProcess.stdout.on("data", (chunk) => {
        outputData += chunk.toString();
      });

      pyProcess.stderr.on("data", (chunk) => {
        errorData += chunk.toString();
        // llama-cpp-python often outputs logs to stderr. We can capture it, but ignore non-critical logs.
      });

      pyProcess.on("close", (code) => {
        if (code !== 0) {
          console.error("Python script exited with code", code);
          console.error("Stderr:", errorData);
          resolve(NextResponse.json({ error: "Generation failed" }, { status: 500 }));
          return;
        }
        
        try {
          // Parse the JSON output from the python script
          const parsed = JSON.parse(outputData.trim());
          if (parsed.error) {
             resolve(NextResponse.json({ error: parsed.error }, { status: 500 }));
             return;
          }
           resolve(NextResponse.json(parsed));
        } catch (e) {
          console.error("Failed to parse python output:", outputData);
          resolve(NextResponse.json({ error: "Invalid JSON from LLM" }, { status: 500 }));
        }
      });
      
    });
  } catch (error) {
    console.error("Generate API error:", error);
    return NextResponse.json({ error: "Validation or server error" }, { status: 500 });
  }
}
