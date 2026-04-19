"use client";

import React, { createContext, useContext, useEffect, useState } from "react";

interface PdfStatusContextType {
  hasNewPdfs: boolean;
  isGenerating: boolean;
  isNewlyDetected: boolean;
  generate: () => Promise<void>;
  dismiss: () => void;
}

const PdfStatusContext = createContext<PdfStatusContextType>({
  hasNewPdfs: false,
  isGenerating: false,
  isNewlyDetected: false,
  generate: async () => {},
  dismiss: () => {},
});

export function PdfStatusProvider({ children }: { children: React.ReactNode }) {
  const [hasNewPdfs, setHasNewPdfs] = useState(false);
  const [isNewlyDetected, setIsNewlyDetected] = useState(false);
  const [isGenerating, setIsGenerating] = useState(false);

  useEffect(() => {
    let timer: ReturnType<typeof setTimeout>;

    const check = async () => {
      try {
        const res = await fetch("/api/pipeline/check");
        if (res.ok) {
          const data = await res.json();
          
          // If a transition from false to true happens, trigger the 20s glow
          if (!hasNewPdfs && data.hasNewPdfs) {
            setIsNewlyDetected(true);
            if (timer) clearTimeout(timer);
            timer = setTimeout(() => {
              setIsNewlyDetected(false);
            }, 20000); // 20 seconds glow
          } else if (!data.hasNewPdfs) {
            setIsNewlyDetected(false);
          }
          
          setHasNewPdfs(data.hasNewPdfs);
        }
      } catch {
        // ignore network polling errors
      }
    };

    check();
    const interval = setInterval(check, 5000);
    return () => {
      clearInterval(interval);
      if (timer) clearTimeout(timer);
    };
  }, [hasNewPdfs]);

  const generate = async () => {
    if (isGenerating) return;
    setIsGenerating(true);
    try {
      const res = await fetch("/api/pipeline/generate", { method: "POST" });
      if (res.ok) {
        setHasNewPdfs(false);
      }
    } catch (err) {
      console.error("Error generating pipeline", err);
    } finally {
      setIsGenerating(false);
    }
  };

  const dismiss = () => setHasNewPdfs(false);

  return (
    <PdfStatusContext.Provider value={{ hasNewPdfs, isGenerating, isNewlyDetected, generate, dismiss }}>
      {children}
    </PdfStatusContext.Provider>
  );
}

export function usePdfStatus() {
  return useContext(PdfStatusContext);
}
