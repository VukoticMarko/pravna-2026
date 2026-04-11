import fs from "fs";

export async function getFileText(filePath: string) {
  return fs.readFileSync(filePath, "utf8");
}

export async function writeToFile(filePath: string, data: any) {
  fs.writeFileSync(filePath, data);
}
