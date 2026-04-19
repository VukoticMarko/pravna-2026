"use client";

import { usePdfStatus } from "@/app/ui/pdf_status_context";
import { X, FileWarning } from "lucide-react";

export function PdfNotification() {
  const { hasNewPdfs, isGenerating, generate, dismiss } = usePdfStatus();

  if (!hasNewPdfs) return null;

  return (
    <div className="fixed bottom-20 right-5 z-50 w-72 rounded-xl bg-gray-900 border border-purple-700 shadow-[0_0_20px_4px_rgba(147,51,234,0.3)] p-4 animate-slideUp">
      <div className="flex items-start justify-between mb-2">
        <div className="flex items-center gap-2 text-purple-400 font-semibold text-sm">
          <FileWarning className="w-4 h-4 animate-pulse" />
          New PDFs Detected
        </div>
        <button
          onClick={dismiss}
          className="text-gray-500 hover:text-white transition"
          aria-label="Dismiss"
        >
          <X className="w-4 h-4" />
        </button>
      </div>
      <p className="text-gray-400 text-xs mb-3">
        New PDF documents are waiting to be processed into Akoma Ntoso XML and HTML.
      </p>
      <button
        onClick={generate}
        disabled={isGenerating}
        className="w-full py-2 rounded-lg bg-purple-700 hover:bg-purple-600 text-white text-sm font-semibold transition disabled:opacity-60"
      >
        {isGenerating ? "Processing..." : "Generate Now"}
      </button>
    </div>
  );
}
