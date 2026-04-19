"use client";

import { ListItem } from "@/app/ui/list_item";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { FilePath } from "@/lib/file_path";
import { FileText } from "lucide-react";
import { useEffect, useMemo, useState, useRef } from "react";
import { useSearchParams } from "next/navigation";

export default function PresudeIZakoni() {
  const [presude, setPresude] = useState<FilePath[]>([]);
  const [zakoni, setZakoni] = useState<FilePath[]>([]);
  const searchParams = useSearchParams();
  const didAutoSelect = useRef(false);

  const [tab, setTab] = useState<string>("presude");
  const onTabChange = (value: string) => {
    setTab(value);
  };

  const [selectedPDFIndex, setSelectedPDFIndex] = useState<number>(0);
  const handleSelect = (index: number) => {
    setSelectedPDFIndex(index);
  };

  useEffect(() => {
    const getPdfFiles = async () => {
      await fetch(`http://localhost:3000/api/pdfs?dir=${encodeURI("/pdf/presude")}`)
        .then((res) => res.json())
        .then((data) => setPresude(data));

      await fetch(`http://localhost:3000/api/pdfs?dir=${encodeURI("/pdf/zakoni")}`)
        .then((res) => res.json())
        .then((data) => setZakoni(data));
    };

    getPdfFiles();
  }, []);

  // Auto-select case from ?case= query param
  useEffect(() => {
    if (presude.length === 0 || didAutoSelect.current) return;
    const caseParam = searchParams.get("case");
    if (!caseParam) return;
    const idx = presude.findIndex((f) => f.stem === caseParam);
    if (idx !== -1) {
      setTab("presude");
      setSelectedPDFIndex(idx);
      didAutoSelect.current = true;
    }
  }, [presude, searchParams]);

  const pdfToShow = useMemo(() => {
    if (tab === "presude") {
      return presude[selectedPDFIndex]?.path;
    } else {
      return zakoni[selectedPDFIndex]?.path;
    }
  }, [tab, presude, selectedPDFIndex]);

  return (
    <div className="flex h-full flex-row overflow-hidden space-x-6 pr-2 pb-2">
      <Card className="h-full">
        <CardHeader>
          <CardTitle>Judgements and Law</CardTitle>
          <CardDescription>Browse judgements and law in PDF format.</CardDescription>
        </CardHeader>
        <CardContent className="h-[90%]">
          <Tabs
            value={tab}
            onValueChange={onTabChange}
            className="flex flex-col pl-3 py-3 w-96 h-full"
          >
            <div className="hack pb-4">
              <TabsList>
                <TabsTrigger value="presude">Judgements</TabsTrigger>
                <TabsTrigger value="zakoni">Law</TabsTrigger>
              </TabsList>
            </div>
            <TabsContent
              value="presude"
              className="flex-grow overflow-auto"
            >
              <ScrollArea
                className="h-full"
                type="always"
              >
                <div className="w-full pr-3">
                  {presude.map((file, index) => (
                    <ListItem
                      key={index}
                      text={file.stem}
                      isSelected={index === selectedPDFIndex}
                      Icon={FileText}
                      onClick={() => handleSelect(index)}
                    ></ListItem>
                  ))}
                </div>
              </ScrollArea>
            </TabsContent>
            <TabsContent
              value="zakoni"
              className="flex-grow overflow-auto"
            >
              <ScrollArea
                className="h-full"
                type="always"
              >
                <div className="w-full pr-3">
                  {zakoni.map((file, index) => (
                    <ListItem
                      key={index}
                      text={file.stem}
                      isSelected={index === selectedPDFIndex}
                      Icon={FileText}
                      onClick={() => handleSelect(index)}
                    ></ListItem>
                  ))}
                </div>
              </ScrollArea>
            </TabsContent>
          </Tabs>
        </CardContent>
      </Card>

      <iframe
        className="flex-grow"
        src={pdfToShow}
      />
    </div>
  );
}
