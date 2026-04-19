import { Navbar } from "@/app/ui/navbar";
import { GenerateButton } from "@/app/ui/generate_button";
import { PdfNotification } from "@/app/ui/pdf_notification";
import { PdfStatusProvider } from "@/app/ui/pdf_status_context";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Pravna Informatika",
  description: "Legal Informatics Platform — Montenegrin Court Judgements",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${inter.className} antialiased`} style={{ background: "#080c14" }}>
        <PdfStatusProvider>
          {/* Top Navbar */}
          <Navbar />

          {/* Page Content */}
          <main className="flex flex-col flex-grow h-[calc(100vh-56px)] overflow-y-auto p-4">
            {children}
          </main>

          {/* Global overlays */}
          <PdfNotification />
          <GenerateButton />
        </PdfStatusProvider>
      </body>
    </html>
  );
}
