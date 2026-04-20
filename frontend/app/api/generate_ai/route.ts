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

      console.log("[generate_ai] Spawning Python script:", scriptPath);
      console.log("[generate_ai] Input data:", JSON.stringify(data));

      let resolved = false;
      const safeResolve = (response: NextResponse) => {
        if (!resolved) {
          resolved = true;
          resolve(response);
        }
      };

      // Timeout after 120 seconds to avoid hanging forever
      const timeout = setTimeout(() => {
        console.error("[generate_ai] Timeout after 120 seconds");
        safeResolve(NextResponse.json({ error: "LLM generation timed out (120s)" }, { status: 504 }));
      }, 120_000);

      let pyProcess;
      try {
        pyProcess = spawn(pythonExe, [
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
      } catch (spawnError) {
        console.error("[generate_ai] Failed to spawn Python process:", spawnError);
        clearTimeout(timeout);
        safeResolve(NextResponse.json({ error: "Failed to start Python process" }, { status: 500 }));
        return;
      }

      let outputData = "";
      let errorData = "";

      pyProcess.stdout.on("data", (chunk) => {
        outputData += chunk.toString();
      });

      pyProcess.stderr.on("data", (chunk) => {
        errorData += chunk.toString();
      });

      // Handle spawn errors (e.g., python executable not found)
      pyProcess.on("error", (err) => {
        console.error("[generate_ai] Spawn error:", err.message);
        clearTimeout(timeout);
        safeResolve(NextResponse.json({ error: `Python process error: ${err.message}` }, { status: 500 }));
      });

      pyProcess.on("close", (code) => {
        clearTimeout(timeout);
        console.log("[generate_ai] Python exited with code", code);
        console.log("[generate_ai] Stdout length:", outputData.length);
        
        // Always try to extract JSON from stdout first.
        const start = outputData.indexOf("{");
        const end = outputData.lastIndexOf("}");
        if (start !== -1 && end > start) {
          try {
            const extracted = outputData.slice(start, end + 1);
            const parsed = JSON.parse(extracted);
            if (parsed.error) {
              safeResolve(NextResponse.json({ error: parsed.error }, { status: 500 }));
              return;
            }
            safeResolve(NextResponse.json(parsed));
            return;
          } catch (e) {
            console.error("[generate_ai] JSON extraction failed from:", outputData);
          }
        }
        // No JSON found — report failure
        console.error("[generate_ai] No valid JSON in output");
        console.error("[generate_ai] Stdout:", outputData);
        console.error("[generate_ai] Stderr:", errorData.slice(0, 500));
        safeResolve(NextResponse.json({ error: "Generation failed - no valid output from LLM" }, { status: 500 }));
      });
      
    });
  } catch (error) {
    console.error("[generate_ai] API error:", error);
    return NextResponse.json({ error: "Validation or server error" }, { status: 500 });
  }
}
