"use client";

import { LinkButton } from "@/app/ui/link_button";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { BookMarked, FilePlus, Gavel, Scale, PlayCircle, Loader2, FileWarning } from "lucide-react";
import { usePathname } from "next/navigation";
import { useState, useEffect } from "react";

interface SidebarProps extends React.HTMLAttributes<HTMLDivElement> {}

export function Sidebar({ className }: SidebarProps) {
  const pathname = usePathname();
  const [hasNewPdfs, setHasNewPdfs] = useState(false);
  const [isGenerating, setIsGenerating] = useState(false);

  useEffect(() => {
    // Poll every 5 seconds to check if there are newly added PDFs waiting to be processed
    const interval = setInterval(async () => {
      try {
        const res = await fetch("/api/pipeline/check");
        if (res.ok) {
          const data = await res.json();
          setHasNewPdfs(data.hasNewPdfs);
        }
      } catch (err) {
        // ignore network polling errors
      }
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  const handleGenerate = async () => {
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

  return (
    <div className={cn("pb-12", className)}>
      <h1 className="mb-2 px-4 pt-4 pb-2 text-2xl font-semibold">
        PRAVNA INFORMATIKA
      </h1>
      <div className="space-y-4 py-4">
        <div className="px-3 py-2">
          <h2 className="mb-2 px-4 text-xl font-semibold tracking-tight">
            PDF Documents
          </h2>
          <div className="space-y-1">
            <LinkButton
              text="Judgements and Laws"
              link="/judgements_and_laws"
              Icon={Scale}
              pathname={pathname}
            />
          </div>
        </div>
        <div className="px-3 py-2">
          <h2 className="mb-2 px-4 text-xl font-semibold tracking-tight">
            Akoma Ntoso
          </h2>
          <div className="space-y-1">
            <LinkButton
              text="Judgements"
              link="/judgements"
              Icon={Gavel}
              pathname={pathname}
            />
            <LinkButton
              text="Laws"
              link="/laws"
              Icon={BookMarked}
              pathname={pathname}
            />
          </div>
        </div>
        <div className="px-3 py-2">
          <h2 className="mb-2 px-4 text-xl font-semibold tracking-tight">
            Actions
          </h2>
          <div className="space-y-1">
            <LinkButton
              text="New Judgement"
              link="/new_judgement"
              Icon={FilePlus}
              pathname={pathname}
            />
          </div>
          <div className="mt-4 px-2">
            {hasNewPdfs ? (
              <div className="mb-2 flex items-center gap-2 rounded-md bg-blue-100 p-2 text-sm text-blue-800">
                <FileWarning className="h-4 w-4 animate-pulse" />
                New PDFs detected!
              </div>
            ) : null}
            <Button
              className="w-full justify-start text-left font-normal"
              variant="default"
              onClick={handleGenerate}
              disabled={isGenerating}
            >
              {isGenerating ? (
                <Loader2 className="mr-2 h-4 w-4 animate-spin" />
              ) : (
                <PlayCircle className="mr-2 h-4 w-4" />
              )}
              {isGenerating ? "Processing Pipeline..." : "Generate: PDF -> Akoma"}
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}
