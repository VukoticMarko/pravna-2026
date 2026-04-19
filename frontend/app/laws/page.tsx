"use client";

import { useEffect, useState } from "react";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { FileText } from "lucide-react";

interface LawMetadata {
  title: string;
  publication: string;
  pubDate: string;
  pubNumber: string;
  classification: string;
  jurisdiction: string;
}

export default function Zakoni() {
  const [htmlText, setHtmlText] = useState<string>("");
  const [metadata, setMetadata] = useState<LawMetadata | null>(null);

  useEffect(() => {
    // Fetch HTML content
    fetch("/api/htmls/get_text?file=/html/krivicni-zakonik.html")
      .then((res) => res.json())
      .then((data) => setHtmlText(data));

    // Fetch Metadata
    fetch("/api/law_metadata")
      .then((res) => res.json())
      .then((data) => setMetadata(data));
  }, []);

  useEffect(() => {
    if (htmlText && window.location.hash) {
      const id = window.location.hash.substring(1);
      setTimeout(() => {
        const element = document.getElementById(id);
        if (element) {
          element.scrollIntoView({ behavior: "smooth", block: "start" });
          element.classList.add("bg-yellow-100"); // Highlight temporarily
          setTimeout(() => element.classList.remove("bg-yellow-100"), 3000);
        }
      }, 500);
    }
  }, [htmlText]);

  return (
    <div className="flex h-full flex-row space-x-6 pr-2 pb-2">
      <Card className="h-full w-96 flex-shrink-0">
        <CardHeader className="border-b border-gray-800 pb-3">
          <CardTitle className="text-xl font-bold text-gray-100 flex items-center">
            <FileText className="mr-2 h-5 w-5 text-blue-500" />
            Law Reference
          </CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          {metadata ? (
            <div className="space-y-6">
              <div className="group">
                <p className="text-[10px] font-bold text-blue-500 uppercase tracking-[0.2em] mb-1">Official Title</p>
                <p className="text-gray-100 text-sm leading-relaxed border-l-2 border-blue-900/50 pl-3 group-hover:border-blue-500 transition-colors">
                  {metadata.title}
                </p>
              </div>
              <div className="grid grid-cols-1 gap-4">
                <div>
                  <p className="text-[10px] font-bold text-gray-500 uppercase tracking-[0.2em] mb-1">Publication</p>
                  <p className="text-gray-300 text-sm font-medium">
                    {metadata.publication}
                    <span className="block text-[11px] text-gray-500 mt-0.5">Issue: {metadata.pubNumber}</span>
                  </p>
                </div>
                <div className="flex justify-between">
                  <div>
                    <p className="text-[10px] font-bold text-gray-500 uppercase tracking-[0.2em] mb-1">Enacted</p>
                    <p className="text-gray-300 text-sm">{metadata.pubDate}</p>
                  </div>
                  <div className="text-right">
                    <p className="text-[10px] font-bold text-gray-500 uppercase tracking-[0.2em] mb-1">Jurisdiction</p>
                    <p className="text-gray-300 text-sm uppercase">{metadata.jurisdiction || "CG"}</p>
                  </div>
                </div>
              </div>
              <div>
                <p className="text-[10px] font-bold text-gray-500 uppercase tracking-[0.2em] mb-1">Type</p>
                <div className="inline-flex items-center px-2 py-1 rounded-md bg-blue-500/10 border border-blue-500/20">
                  <span className="text-[11px] font-semibold text-blue-400 uppercase tracking-wider">{metadata.classification}</span>
                </div>
              </div>
            </div>
          ) : (
            <div className="flex items-center justify-center py-10">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
            </div>
          )}
        </CardContent>
      </Card>

      <div className="flex flex-col flex-grow">
        <div className="mb-4 pb-3 border-b border-gray-700">
          <h1 className="text-2xl font-bold text-white tracking-wide">
            {metadata?.title || "Montenegro Criminal Law"}
          </h1>
        </div>

        <ScrollArea className="flex-1 rounded-xl border border-gray-700 bg-white shadow-2xl">
          <div
            className="w-full max-w-4xl mx-auto px-10 py-8 text-gray-900 leading-relaxed law-content"
            dangerouslySetInnerHTML={{ __html: htmlText }}
          />
        </ScrollArea>
      </div>
    </div>
  );
}
