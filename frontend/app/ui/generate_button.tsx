"use client";

import { usePdfStatus } from "@/app/ui/pdf_status_context";
import { PlayCircle, Loader2 } from "lucide-react";

export function GenerateButton() {
  const { hasNewPdfs, isNewlyDetected, isGenerating, generate } = usePdfStatus();

  return (
    <button
      onClick={generate}
      disabled={isGenerating}
      className={`
        fixed bottom-5 right-5 z-50
        flex items-center gap-2
        px-5 py-3 rounded-xl font-semibold text-sm
        transition-all duration-300
        text-white border
        ${
          isNewlyDetected
            ? "bg-purple-700 border-purple-400 shadow-[0_0_20px_6px_rgba(147,51,234,0.55)] animate-pulse-glow"
            : hasNewPdfs
            ? "bg-purple-900/40 border-purple-500/50 shadow-md hover:bg-purple-800/60"
            : "bg-gray-800 border-gray-600 shadow-md hover:bg-gray-700"
        }
        disabled:opacity-60 disabled:cursor-not-allowed
      `}
      title="Generate: PDF → Akoma → HTML"
    >
      {isGenerating ? (
        <Loader2 className="w-4 h-4 animate-spin" />
      ) : (
        <PlayCircle className="w-4 h-4" />
      )}
      {isGenerating ? "Processing..." : "Generate: PDF → Akoma → HTML"}
    </button>
  );
}
