# Pravna Informatika — Legal Document Management System

> A full-stack legal document management system for Montenegrin courts. Converts raw PDF judgements into structured **Akoma Ntoso XML** and rendered **HTML** documents, with a React/Next.js web application for browsing, searching, and creating new judgements.

---

## 🚀 Quick Start — Running the App

You need **two terminal windows** to run the application.

### Terminal 1 — Java Backend (Spring Boot)

```powershell
cd backend
.\mvnw.cmd spring-boot:run
```

> Starts on **http://localhost:8080**
> First run will download Maven dependencies (~2 min). Subsequent runs are fast.

### Terminal 2 — Frontend (Next.js)

```powershell
cd frontend
npm run dev
```
&

```powershell
npm install       # Only needed on the first run/installation before npm run
```

> Starts on **http://localhost:3000**
> Open your browser to [http://localhost:3000](http://localhost:3000)

### Python Dependencies (one-time setup)

The PDF pipeline requires Python packages. Install them once:

```powershell
pip install pdfplumber
```

Or using the requirements file:

```powershell
pip install -r requirements.txt
```

---

## 🗂️ Project Structure

```
pravna-moja/
├── backend/                        # Spring Boot Java API (port 8080)
│   ├── src/main/java/...           # Java source code
│   ├── pdf_to_xml.py               # PDF → Akoma Ntoso XML conversion script
│   └── xml_to_html.py              # Akoma Ntoso XML → HTML conversion script
│
├── frontend/                       # Next.js web app (port 3000)
│   ├── app/
│   │   ├── api/                    # Next.js server-side API routes
│   │   │   ├── pdfs/               # GET /api/pdfs — list PDF documents
│   │   │   ├── htmls/              # GET /api/htmls — list HTML judgements
│   │   │   ├── save_case/          # POST /api/save_case — save new judgement
│   │   │   └── pipeline/
│   │   │       ├── check/          # GET /api/pipeline/check — detect new PDFs
│   │   │       └── generate/       # POST /api/pipeline/generate — run pipeline
│   │   ├── judgements/             # HTML judgement viewer page
│   │   ├── judgements_and_laws/    # PDF viewer page (judgements + laws tabs)
│   │   ├── laws/                   # Laws (Akoma Ntoso XML viewer)
│   │   ├── new_judgement/          # Form to create a new judgement
│   │   └── ui/                     # Sidebar, navigation components
│   └── public/
│       ├── html/presude/           # Generated HTML judgement files
│       └── pdf/                    # Source PDF documents
│
├── documents/
│   └── akoma-ntoso/
│       ├── pdf/                    # Input PDFs for the pipeline
│       ├── K *.xml                 # Generated Akoma Ntoso XML judgements (17 files)
│       └── krivicni_zakon_crne_gore.xml   # Criminal Code of Montenegro (law)
│
├── case_based_reasoning.py         # CBR system for similar case lookup
├── requirements.txt                # Python dependencies
└── README.md                       # This file
```

---

## ⚙️ How Everything Works

### Architecture Overview

```
                    ┌─────────────────────────────┐
                    │       Browser (port 3000)   │
                    │      Next.js Frontend        │
                    └──────────┬──────────────────┘
                               │ API calls
            ┌──────────────────┼──────────────────┐
            │                  │                  │
     GET /api/htmls    POST /api/pipeline    POST /api/save_case
            │                  │                  │
            ▼                  ▼                  ▼
   ┌─────────────────────────────────────────────────┐
   │         Next.js Server (API Routes)             │
   │  Reads files from filesystem, spawns Python     │
   └──────────┬──────────────────────────────────────┘
              │ child_process.exec
              ▼
   ┌─────────────────────────────────────────────────┐
   │         Python Pipeline                         │
   │  pdf_to_xml.py  →  xml_to_html.py              │
   └──────────┬──────────────────────────────────────┘
              │                   │
              ▼                   ▼
   documents/akoma-ntoso/    frontend/public/html/presude/
   K *.xml (Akoma Ntoso)     K *.html (rendered judgements)

   ┌──────────────────────────────────┐
   │   Spring Boot Backend (port 8080)│
   │   Attribute extraction, NLP      │
   └──────────────────────────────────┘
```

---

## 📄 The PDF → Akoma Ntoso Pipeline

The core feature of the system is the automated conversion of raw court PDF documents into structured legal XML using the **Akoma Ntoso** international standard.

### Step 1: PDF → Akoma Ntoso XML (`backend/pdf_to_xml.py`)

This script reads PDF judgement files and produces structured XML.

**Input:** `documents/akoma-ntoso/pdf/*.pdf`
**Output:** `documents/akoma-ntoso/K *.xml`

**What it does:**
1. **Extracts raw text** from the PDF using `pdfplumber`
2. **Sanitizes OCR errors** — some PDFs (especially `Odluke.pdf`) have OCR bugs where every character is interleaved with `c` (e.g. `cOcscncocvcncic`). A `sanitize_text()` function detects and repairs this automatically.
3. **Normalizes character encoding** — maps broken Montenegrin characters (`č`, `š`, `đ`, `ž`, `ć`) to their ASCII equivalents since some PDFs use non-standard encodings.
4. **Extracts legal entities** using regex patterns:
    - **Court name** (e.g. "Osnovni sud u Baru")
    - **Case number** (e.g. "K 70/2024")
    - **Judge name**
    - **Clerk name**
    - **Defendant name** (initials only, for privacy)
    - **Date of judgement**
5. **Generates Akoma Ntoso XML** — wraps the full judgement text and metadata in the standard schema. Named entities (court, parties) are tagged with `<organization>` and `<party>` elements inline within the judgment body.

**Run manually:**
```powershell
cd backend
python pdf_to_xml.py
```

### Step 2: Akoma Ntoso XML → HTML (`backend/xml_to_html.py`)

This script takes the structured XML and generates styled HTML files for the browser viewer.

**Input:** `documents/akoma-ntoso/K *.xml`
**Output:** `frontend/public/html/presude/K *.html`

**What it does:**
1. **Parses the Akoma Ntoso XML** and extracts the `<judgmentBody>` and metadata
2. **Converts inline XML tags** to HTML:
    - `<organization>` and `<party>` tags → `<a class="scoped">` (rendered as **blue highlighted** spans)
3. **Applies regex-based highlighting** to the full text:
    - 💰 **Monetary amounts** — any amount in euros (e.g. "460,22 eura")
    - ⚖️ **Law references** — citations like "čl. 239 st. 1 Krivičnog zakonika Crne Gore"
    - 👤 **Initials** — privacy-safe person references (e.g. "P. A.")
4. **Writes styled HTML** with embedded CSS, ready to be rendered in an iframe in the browser

> **Note:** `krivicni_zakon_crne_gore.xml` and placeholder stub XMLs are automatically **skipped** — only real judgement XMLs are processed.

**Run manually:**
```powershell
cd backend
python xml_to_html.py
```

### Running the Full Pipeline from the UI

You don't need to run the scripts manually! The frontend has a built-in pipeline trigger:

1. Place new PDF files in `documents/akoma-ntoso/pdf/`
2. The sidebar will show a **"New PDFs detected!"** alert (polls every 5 seconds)
3. Click **"Generate: PDF → Akoma"** in the sidebar
4. The button shows a loading spinner while both Python scripts run sequentially
5. New HTML files appear in the judgements list automatically

---

## 🌐 Frontend Pages

### `/judgements_and_laws` — PDF Viewer

Browse and view the **source PDF documents** directly in the browser. Two tabs:
- **Judgements** — criminal court cases (K *.pdf)
- **Laws** — legislation files (e.g. Criminal Code of Montenegro)

### `/judgements` — HTML Judgement Viewer

Browse the **rendered HTML versions** of processed judgements. Features:
- Sidebar list of all available judgements
- Full rendered document view in an iframe
- **Attribute extraction panel** — calls the Spring Boot backend (`localhost:8080`) to extract structured attributes (court, judge, defendant, article, etc.) from the HTML content
- Blue highlighted entities (court names, parties, legal citations, monetary amounts)

### `/laws` — Law Viewer

Displays law documents (currently the **Criminal Code of Montenegro**, Articles 239–242 covering theft offences). Rendered from the Akoma Ntoso XML with the same highlighting system.

### `/new_judgement` — Create New Judgement

A form to manually create and save a new HTML judgement. Fields include:
- Court name
- Case number (auto-formatted as `K {number}/2026`)
- Date
- Judge, Clerk, Defendant, Plaintiff, Defender names
- Criminal article (239 Theft, 240 Aggravated Theft, 241 Predatory Theft, 242 Robbery)
- Full judgement text body

On submission, the form calls `POST /api/save_case` which generates an HTML file and saves it to `frontend/public/html/presude/`.

---

## 🔧 Backend — Spring Boot (Java)

The Spring Boot backend runs on **port 8080** and provides:

- **Attribute extraction API** — parses HTML judgement content and returns structured legal attributes (court, judge, defendant, article, etc.) used by the "Judgement Attributes" panel in the frontend
- **NLP / entity recognition** — supports named entity extraction from the judgment text
- **Rule-Based & Case-Based Reasoning** — provides legal inference services via the `CbrController` and `RbrController`.

**Tech stack:** Java 17, Spring Boot, Maven Wrapper (`mvnw`)

---

## 🤖 AI Generation — LLM

The system includes a local AI generation feature that uses the **Meta-Llama-3.1-8B-Instruct** model to generate legal sanctions and explanations.

### Model Setup
The model should be placed in the `backend/models/` folder.

**Download link:** [Meta-Llama-3.1-8B-Instruct-Q5_K_S.gguf](https://huggingface.co/bartowski/Meta-Llama-3.1-8B-Instruct-GGUF/blob/main/Meta-Llama-3.1-8B-Instruct-Q5_K_S.gguf)

The Python script `backend/scripts/llm/generate_judgement_llm.py` uses `llama-cpp-python` to interact with this model. Ensure you have the necessary dependencies installed (`pip install llama-cpp-python`).


---

## 📐 Akoma Ntoso Standard

[Akoma Ntoso](http://www.akomantoso.org/) is an open XML standard for legal and parliamentary documents, developed under the OASIS standard. This project implements a subset of the standard for court judgements, using:

- `<akomaNtoso>` — root element
- `<judgment>` — encapsulates a single court decision
- `<meta>` → `<FRBRWork>` — document metadata (court, date, case number, country)
- `<references>` — defines named entities referenced in the body (court, judge, defendant roles)
- `<judgmentBody>` — full text of the judgement with inline entity markup

The generated XMLs conform to the **Akoma Ntoso 3.0 WD17** schema.

---

## 🗃️ Documents

The `documents/akoma-ntoso/` folder contains:

| File | Description |
|------|-------------|
| `K 93 2024.xml` | 2024 case |
| `K 108 2022.xml` | 2022 case |
| `K 298 2021.xml` | 2021 case |
| `K 144 2020.xml` | 2020 case |
| `K 96 2020.xml` | 2020 case |
| `K 788 2017.xml` | 2017 case |
| `K 855 2015.xml` | 2015 case |
| `K 103 2018.xml` | 2018 case |
| `K 13 2023.xml` | 2023 case |
| `K 82 2013.xml` | 2013 case |
| `K 309 2010.xml` | 2010 case |
| `K 457 2012.xml` | 2012 case |
| `K 834 2012.xml` | 2012 case |
| `K 772 2010.xml` | 2010 case |
| `K 60 2019.xml` | 2019 case |
| `krivicni_zakon_crne_gore.xml` | **Criminal Code of Montenegro** (Articles 239–242) |

---

## 🧪 Testing PDF Generation

If you want to test whether the PDF → Akoma Ntoso pipeline is working correctly, you can use the sample files in the `Testne Odluke` folder.

1. Copy a PDF from the `Testne Odluke/` directory.
2. Paste it into `documents/akoma-ntoso/pdf/`.
3. Go to the web application sidebar and wait for the **"New PDFs detected!"** notification.
4. Click **"Generate: PDF → Akoma"**.

## 🛠️ Tech Stack

| Component | Technology |
|-----------|-----------|
| Frontend UI | Next.js 14, React 18, TypeScript |
| UI Components | shadcn/ui, Radix UI, Tailwind CSS |
| Icons | Lucide React |
| Backend API | Spring Boot 3, Java 17, Maven |
| PDF Processing | Python 3, pdfplumber |
| XML Standard | Akoma Ntoso 3.0 |
| Form Handling | React Hook Form, Zod |

---

## ❓ Troubleshooting

### Port 3000 already in use
```powershell
# Kill all Node.js processes
Get-Process -Name "node" | Stop-Process -Force
# Then restart the frontend
npm run dev
```

### Port 8080 already in use
```powershell
# Kill all Java processes
Get-Process -Name "java" | Stop-Process -Force
# Then restart the backend
.\mvnw.cmd spring-boot:run
```

### Generated HTML not showing in browser
- The Next.js dev server serves static files from `frontend/public/`. If you add files while the server is running, they should appear immediately.
- Hard-refresh the page (`Ctrl+Shift+R`) to clear any browser cache.