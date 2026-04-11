import { promises as fs } from "fs";
import path from "path";

export interface FilePath {
  stem: string;
  path: string;
}

export async function getFilePaths(publicDirPath: string, dirPath: string, filter: string): Promise<FilePath[]> {
  const filePaths: FilePath[] = [];

  const files = await fs.readdir(publicDirPath);
  for (const file of files.sort()) {
    if (path.extname(file).toLowerCase() === filter) {
      filePaths.push({ stem: path.parse(file).name, path: path.join(dirPath, file) });
    }
  }

  return filePaths;
}
