import { NextResponse } from "next/server";
import fs from "fs";
import path from "path";
import { XMLParser } from "fast-xml-parser";

export async function GET() {
  try {
    const xmlPath = path.join(process.cwd(), "..", "documents", "akoma-ntoso", "krivicni_zakon_crne_gore.xml");
    
    if (!fs.existsSync(xmlPath)) {
       console.error("XML file not found at:", xmlPath);
       return NextResponse.json({ error: "XML file not found" }, { status: 404 });
    }
    
    const xmlContent = fs.readFileSync(xmlPath, "utf-8");

    const parser = new XMLParser({
      ignoreAttributes: false,
      attributeNamePrefix: "@_",
      removeNSPrefix: true, // This is key for handling xmlns namespaces
    });
    const jsonObj = parser.parse(xmlContent);
    
    // Help find anything in a deeply nested object by key name, ignoring case or prefixes
    const findDeep = (obj: any, targetKey: string): any => {
      if (!obj || typeof obj !== "object") return null;
      
      const keys = Object.keys(obj);
      for (const key of keys) {
        // Match key ignoring namespace prefix (if any) or exact match
        const simpleKey = key.includes(":") ? key.split(":")[1] : key;
        if (simpleKey.toLowerCase() === targetKey.toLowerCase()) {
          return obj[key];
        }
        const found = findDeep(obj[key], targetKey);
        if (found) return found;
      }
      return null;
    };

    const pub = findDeep(jsonObj, "publication");
    const iden = findDeep(jsonObj, "identification");
    const act = findDeep(jsonObj, "act");
    const classif = findDeep(jsonObj, "classification");

    const metadata = {
      title: act?.["@_name"] || "Krivični zakonik Crne Gore",
      publication: pub?.["@_showAs"] || "Službeni list Crne Gore",
      pubDate: pub?.["@_date"] || "2008-08-11",
      pubNumber: pub?.["@_number"] || "76/2008",
      classification: findDeep(classif, "keyword")?.["@_showAs"] || classif?.["@_showAs"] || "Krivični",
      jurisdiction: findDeep(iden, "FRBRcountry")?.["@_value"] || "cg",
    };

    return NextResponse.json(metadata);
  } catch (error: any) {
    console.error("Error fetching law metadata:", error);
    return NextResponse.json({ error: error.message || "Failed to fetch law metadata" }, { status: 500 });
  }
}
