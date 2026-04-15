import { getFilePaths } from "@/lib/file_path";
import { NextRequest, NextResponse } from "next/server";
import path from "path";

export async function GET(request: NextRequest) {
  const dirPath: string = request.nextUrl.searchParams.get("dir") || "/pdfs/presude";
  const publicDirPath = path.join("public", dirPath);

  try {
    return NextResponse.json(await getFilePaths(publicDirPath, dirPath, ".pdf"));
  } catch (error) {
    return NextResponse.json({ error: "Failed to retrieve PDF files" });
  }
}
