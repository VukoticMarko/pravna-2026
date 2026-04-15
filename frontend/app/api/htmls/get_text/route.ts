import { getFileText } from "@/lib/file_utils";
import { NextRequest, NextResponse } from "next/server";
import path from "path";

export async function GET(request: NextRequest) {
  const filePath: string = request.nextUrl.searchParams.get("file") || "";
  const publicDirPath = path.join("public", filePath);

  try {
    return NextResponse.json(await getFileText(publicDirPath));
  } catch (error) {
    return NextResponse.json({ error: "Failed to retrieve file text" });
  }
}
