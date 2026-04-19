"use client";

import { ListItem } from "@/app/ui/list_item";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { ScrollArea } from "@/components/ui/scroll-area";
import { FilePath } from "@/lib/file_path";
import { FileText } from "lucide-react";
import { useEffect, useState, useRef } from "react";
import { useSearchParams } from "next/navigation";

export default function HTMLPresude() {
  const [presude, setPresude] = useState<FilePath[]>([]);
  const searchParams = useSearchParams();
  const didAutoSelect = useRef(false);

  const [selectedHTMLIndex, setSelectedHTMLIndex] = useState<number>(0);
  const [htmlText, setHtmlText] = useState<string>("");
  const [attributes, setAttributes] = useState<any>({});
  const [isEditing, setIsEditing] = useState<boolean>(false);
  const handleSelect = (index: number) => {
    setSelectedHTMLIndex(index);
  };
  const [editedAttributes, setEditedAttributes] = useState<any>({});

  const handleAttributeChange = (key: string, value: any) => {
    setEditedAttributes((prev: any) => ({ ...prev, [key]: value }));
  };

  const saveAttributes = async () => {
    // Map MetadataDTO fields to CaseBasedReasoningDTO
    const dto = {
      court: editedAttributes.court || attributes.court,
      caseNumber: editedAttributes.caseNumber || attributes.caseNumber,
      judge: editedAttributes.judge || attributes.judge,
      defendant: editedAttributes.defendant || attributes.defendant,
      plaintiff: editedAttributes.plaintiff || attributes.plaintiff || "Državni Tužilac",
      valueOfStolenThings: parseFloat(editedAttributes.stolenValue || attributes.stolenValue || 0),
      criminalAct: editedAttributes.criminalAct || attributes.criminalAct,
      articlesCriminalAct: editedAttributes.criminalActArticles || attributes.criminalActArticles,
      articlesCondemnation: editedAttributes.punishmentArticles || attributes.punishmentArticles,
      punishment: editedAttributes.punishment || attributes.punishment,
      intention: editedAttributes.intention || attributes.intention || "Direktan umišljaj",
      stealWay: editedAttributes.stealWay || attributes.stealWay || "Obijanjem"
    };

    try {
      const response = await fetch("http://localhost:8080/api/verdicts", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(dto),
      });
      if (response.ok) {
        setAttributes({ ...attributes, ...editedAttributes });
        setIsEditing(false);
        alert("Attributes saved successfully!");
      }
    } catch (error) {
      console.error("Error saving attributes:", error);
      alert("Failed to save attributes.");
    }
  };

  useEffect(() => {
    const getHtmlFiles = async () => {
      await fetch(`http://localhost:3000/api/htmls?dir=${encodeURI("/html/presude")}`)
        .then((res) => res.json())
        .then((data) => setPresude(data));
    };
    getHtmlFiles();
  }, []);

  // Auto-select case from ?case= query param
  useEffect(() => {
    if (presude.length === 0 || didAutoSelect.current) return;
    const caseParam = searchParams.get("case");
    if (!caseParam) return;
    const idx = presude.findIndex((f) => f.stem === caseParam);
    if (idx !== -1) {
      setSelectedHTMLIndex(idx);
      didAutoSelect.current = true;
    }
  }, [presude, searchParams]);

  useEffect(() => {
    const getHtmlText = async () => {
      fetch(`http://localhost:3000/api/htmls/get_text?file=${encodeURI(presude[selectedHTMLIndex].path)}`)
        .then((res) => res.json())
        .then((data) => {
          setHtmlText(data);
        });
    };
    if (presude[selectedHTMLIndex] !== undefined) {
      getHtmlText();
      setIsEditing(false);
      setEditedAttributes({});
      fetch(`http://localhost:8080/api/verdicts/${encodeURI(presude[selectedHTMLIndex].stem)}/extract`)
        .then((res) => res.json())
        .then((data) => {
          setAttributes(data);
        })
        .catch((err) => {});
    }
  }, [selectedHTMLIndex, presude]);

  return (
    <div className="flex h-full flex-row space-x-6 pr-2 pb-2">
      <Card className="h-full">
        <CardHeader>
          <CardTitle>HTML Judgements</CardTitle>
          <CardDescription>Browse judgements in HTML format.</CardDescription>
        </CardHeader>
        <CardContent className="h-[90%]">
          <ScrollArea
            className="w-96 h-full"
            type="always"
          >
            <div className="w-full pr-3">
              {presude.map((file, index) => (
                <ListItem
                  key={index}
                  text={file.stem}
                  isSelected={index === selectedHTMLIndex}
                  Icon={FileText}
                  onClick={() => handleSelect(index)}
                ></ListItem>
              ))}
            </div>
          </ScrollArea>
        </CardContent>
      </Card>
      <div className="flex flex-col flex-grow space-y-6 overflow-hidden">
        <ScrollArea className="w-full h-[65%] rounded-xl border border-gray-700 bg-white">
          <div
            className="flex-grow w-full p-8 text-gray-900"
            dangerouslySetInnerHTML={{ __html: htmlText }}
          />
        </ScrollArea>
        <Card className="w-full h-[35%] flex flex-col">
          <CardHeader className="p-3 flex flex-row items-center justify-between">
            <CardTitle className="text-lg">Judgement Attributes</CardTitle>
            <div className="space-x-2">
              {isEditing ? (
                <>
                  <button onClick={saveAttributes} className="px-3 py-1 bg-green-600 text-white rounded hover:bg-green-700 text-sm">Save</button>
                  <button onClick={() => setIsEditing(false)} className="px-3 py-1 bg-gray-600 text-white rounded hover:bg-gray-700 text-sm">Cancel</button>
                </>
              ) : (
                <button onClick={() => setIsEditing(true)} className="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700 text-sm">Edit Attributes</button>
              )}
            </div>
          </CardHeader>
          <CardContent className="flex-1 overflow-hidden">
            <ScrollArea
              className="w-full h-full"
              type="always"
            >
              <table className="min-w-full divide-y divide-gray-700">
                <tbody className="divide-y divide-gray-700">
                  {Object.entries(attributes).map(([key, value], idx) => (
                    <tr key={idx}>
                      <td className="px-4 py-2 whitespace-nowrap text-sm font-medium text-gray-400 w-1/3 italic capitalize">{key.replace(/([A-Z])/g, ' $1')}</td>
                      <td className="px-4 py-2 text-sm text-gray-200">
                        {isEditing ? (
                          <input 
                            type="text" 
                            className="bg-gray-800 border border-gray-600 text-white text-xs rounded p-1 w-full"
                            value={editedAttributes[key] !== undefined ? editedAttributes[key] : (value as string)}
                            onChange={(e) => handleAttributeChange(key, e.target.value)}
                          />
                        ) : (
                          <span>{String(value)}</span>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </ScrollArea>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
