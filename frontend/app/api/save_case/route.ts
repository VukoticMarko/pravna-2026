import { writeToFile } from "@/lib/file_utils";
import { NextRequest, NextResponse } from "next/server";
import path from "path";
const pdf = require("html-pdf");

interface Case {
  court: string;
  caseNumber: string;
  judge: string;
  defendant: string;
  criminalAct: string;
  articlesCriminalAct: string;
  punishment: string;
  explanation: string;
  fileName: string;
  sanction: string;
}

export async function POST(request: NextRequest) {
  const caseToSave: Case = await request.json();
  // Extract article number for linking
  const articleMatch = caseToSave.articlesCriminalAct.match(/\d+/);
  const articleNumber = articleMatch ? articleMatch[0] : "";
  const lawLink = `/laws#art_${articleNumber}`;

  const htmlText: string = `
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
  </head>
  <style>
    body.scoped {
      font-size: 0.9rem;
      font-family: Source Sans Pro, sans-serif;
      line-height: 1.5;
      min-height: 100%;
      min-width: 100px;
    }

    a.scoped {
      color: #1e40af; /* blue-800 */
      background-color: #dbeafe; /* Tailwind blue-100 */
      font-weight: 500;
      padding: 0px 4px;
      border-radius: 4px;
      text-decoration: none;
    }

    a.scoped:hover {
      background-color: #bfdbfe; /* Tailwind blue-200 */
      text-decoration: underline;
    }

    p.scoped-p {
      margin: 0;
      padding: 1px 0;
      font-size: 0.95rem;
    }

    .header {
      text-align: center;
      margin-top: 2rem !important;
      margin-bottom: 2rem !important;
    }
  </style>

  <body class="scoped">
    <div style="padding: 20px 0; width: 100%; text-align: center; margin-bottom: 20px;">
      <p class="scoped-p" style="font-size: 0.8rem; line-height: 1rem; margin: auto">${caseToSave.court}</p>
      <p class="scoped-p" style="color: #245474; font-size: 2rem; font-weight: 700; line-height: 2rem; margin: auto">${caseToSave.caseNumber}</p>
      <p class="scoped-p" style="color: #555; font-size: 0.8rem; line-height: 1rem; margin: auto">08. Mart 2026.</p>
    </div>

    <article style="padding: 20px 10% 40px">
      <p class="scoped-p" style="text-align: right">K. br. ${caseToSave.caseNumber}</p>
      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p">&nbsp;</p>

      <p class="scoped-p header">U IME CRNE GORE</p>
      <p class="scoped-p">&nbsp;</p>

      <p class="scoped-p">
        ${caseToSave.court.toUpperCase()}, sudija ${caseToSave.judge}, sa zapisničarom Anom Ivanović, u krivičnom predmetu optuženog ${caseToSave.defendant}, zbog krivičnog djela - ${caseToSave.criminalAct} iz <a class="scoped" href="${lawLink}">${caseToSave.articlesCriminalAct} Krivičnog zakonika Crne Gore</a>, nakon održanog glavnog i javnog pretresa u prisustvu zastupnika optužbe donio je i javno objavio
      </p>

      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p header">P R E S U D U</p>
      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p">Optuženi,</p>
      <p class="scoped-p">&nbsp;</p>

      <p class="scoped-p">
        ${caseToSave.defendant}, državljanin C. G., lošeg imovnog stanja, neosuđivan,
      </p>

      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p header">K R I V J E</p>
      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p">Zato što je,</p>
      <p class="scoped-p">&nbsp;</p>
      
      <p class="scoped-p">
        ${caseToSave.sanction}
      </p>
      
      <p class="scoped-p">
        čime je izvršio krivično djelo iz <a class="scoped" href="${lawLink}">${caseToSave.articlesCriminalAct} Krivičnog zakonika Crne Gore</a>.
      </p>

      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p header">O S U Đ U J E</p>
      <p class="scoped-p">&nbsp;</p>

      <p class="scoped-p">
        Na kaznu zatvora u trajanju od ${caseToSave.punishment} i istovremeno određuje da će se ova kazna nakon pravnosnažnosti presude izvršiti tako što će je optuženi izdržavati u prostorijama u kojima stanuje.
      </p>

      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p header">O B R A Z L O Ž E Nj E</p>
      <p class="scoped-p">&nbsp;</p>

      <div style="text-align: justify; font-size: 0.95rem;">
        ${caseToSave.explanation}
      </div>

      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p">&nbsp;</p>
      <div style="width: 100%; display: flex; justify-content: space-between; font-size: 0.95rem;">
        <div>ZAPISNIČAR<br>Ana Ivanović, s.r.</div>
        <div style="text-align: right;">S U D I J A<br>${caseToSave.judge}, s.r.</div>
      </div>
      
      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p">
        PRAVNA POUKA: Protiv ove presude može se izjaviti žalba Višem sudu u Podgorici u roku od 15 dana od dana prijema pismenog otpravka, preko ovog suda u dva primjerka.
      </p>
      
      <p class="scoped-p">&nbsp;</p>
      <p class="scoped-p">DOSTAVITI:<br />
      - ODT Podgorica<br />
      - Okrivljenom u ZIKS-u<br />
      - Braniocu okrivljenog adv. Đ.D.</p>
    </article>
  </body>
</html>`;

  const xmlText: string = `<?xml version="1.0" encoding="UTF-8"?>
<akomaNtoso xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://docs.oasis-open.org/legaldocml/ns/akn/3.0/WD17 ../schemas/akomantoso30.xsd " xmlns="http://docs.oasis-open.org/legaldocml/ns/akn/3.0/WD17">
	<judgment>
		<meta>
			<identification source="#court">
				<FRBRWork>
					<FRBRauthor>${caseToSave.court}</FRBRauthor>
					<FRBRdate date="2026-03-08">2026-03-08</FRBRdate>
					<FRBRtitle>${caseToSave.caseNumber}</FRBRtitle>
					<FRBRcountry>CG</FRBRcountry>
				</FRBRWork>
			</identification>
		</meta>
		<judgmentBody>
			<p>
				<organization id="court">${caseToSave.court}</organization>, sudija <party as="#judge">${caseToSave.judge}</party>, optuženi <party as="#defendant">${caseToSave.defendant}</party>, krivično djelo <ref href="/pdf/krivicni-zakonik.html#art_${articleNumber}">${caseToSave.articlesCriminalAct}</ref>.
			</p>
			<p style="text-align: center;">P R E S U D U</p>
			<p>Okrivljeni <party as="#defendant">${caseToSave.defendant}</party> je KRIV.</p>
			<p>OSUĐUJE SE na ${caseToSave.punishment}.</p>
			<conclusions>
				<p>Obrazloženje: ${caseToSave.explanation}</p>
			</conclusions>
		</judgmentBody>
	</judgment>
</akomaNtoso>`;

  writeToFile(path.join("public", "html", "presude", `${caseToSave.fileName}.html`), htmlText);
  writeToFile(path.join("..", "documents", "akoma-ntoso", `${caseToSave.fileName}.xml`), xmlText);

  console.log("saved file");
  pdf
    .create(htmlText, {
      format: "A4",
      phantomPath: path.resolve(process.cwd(), "node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs"),
      script: path.resolve(process.cwd(), "node_modules/html-pdf/lib/scripts/pdf_a4_portrait.js"),
      childProcessOptions: {
        env: {
          OPENSSL_CONF: "/dev/null",
        },
      },
    })
    .toFile(path.resolve(process.cwd(), `public/pdf/presude/${caseToSave.fileName}.pdf`), (err: any, res: any) => {
      console.log("pdf error:", err);
      console.log("pdf res:", res);
    });

  try {
    return NextResponse.json({ success: "Case saved" });
  } catch (error) {
    return NextResponse.json({ error: "Failed save case" });
  }
}
