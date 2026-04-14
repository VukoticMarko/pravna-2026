import os
import re
import xml.etree.ElementTree as ET

def get_text_content(element):
    """
    Recursively extracts text and tail from an XML element, 
    preserving inner HTML-like tags (specifically <a> for highlights).
    """
    if element is None:
        return ""
        
    text = element.text or ""
    for child in element:
        # Strip namespace if present
        tag_name = child.tag.split('}')[-1] if '}' in child.tag else child.tag
        # If it's an organization or party tag, convert it to our scoped <a> tag
        if tag_name in ['organization', 'party']:
            inner_text = get_text_content(child)
            # Use span instead of <a> to avoid "where do they lead" confusion
            text += f'<span class="scoped-highlight">{inner_text}</span>'
            text += child.tail or ""
        else:
            # For any other tags, just extract the text
            text += get_text_content(child)
            text += child.tail or ""
            
    return text

def highlight_p_text(p_text):
    # Split by any HTML tag to avoid modifying attributes or inner text that's already styled
    parts = re.split(r'(<[^>]+>)', p_text)
    for i in range(len(parts)):
        # Only process text nodes (even indices in re.split with capture)
        if i % 2 == 0:
            t = parts[i]
            if not t.strip():
                continue
            # Money - added word boundary
            t = re.sub(r'\b(\d+(?:[.,]\d+)?\s*eura)\b', r'<a class="scoped">\1</a>', t, flags=re.IGNORECASE)
            # Laws - added word boundary and ensured it doesn't match inside tags
            law_pattern = r'\b((?:čl\.|cl\.|čl|cl|član\s+|clan\s+)[\d\s,i]*(?:st\.\s*\d+\s*)?(?:ta[cč]\.\s*\d+\s*)?(?:u\s*vezi\s*)?(?:čl\.|cl\.|čl|cl)?[\d\s,i]*(?:st\.\s*\d+\s*)?(?:ta[cč]\.\s*\d+\s*)?(?:Krivi[cč]nog\s+zakonika(?:\s+Crne\s+Gore)?|Krivi[cč]nom\s+zakoniku|Zakonika\s+o\s+krivi[cč]nom\s+postupku|ZKP-a|KZ\s*CG|KZ\s*RCG|KZ\s*RS|KZ)?)\b'
            
            def law_repl(match):
                text = match.group(1)
                art_match = re.search(r'\d+', text)
                if art_match:
                    art_num = art_match.group(0)
                    return f'<a class="scoped" href="/laws#art_{art_num}">{text}</a>'
                return f'<a class="scoped">{text}</a>'

            t = re.sub(law_pattern, law_repl, t, flags=re.IGNORECASE)
            # Initials - already has word boundaries but good to keep
            t = re.sub(r'\b([A-ZŠĐČĆŽ]\.\s?[A-ZŠĐČĆŽ]\.)\b', r'<a class="scoped">\1</a>', t)
            parts[i] = t
    return "".join(parts)

def convert_xml_to_html(xml_path, output_dir):
    try:
        # Register namespace to avoid the ns0: prefixes
        ns = {'akn': 'http://docs.oasis-open.org/legaldocml/ns/akn/3.0/WD17'}
        
        tree = ET.parse(xml_path)
        root = tree.getroot()
        
        # Find judgment root ignoring namespace if needed
        judgment = root.find('.//akn:judgment', ns)
        if judgment is None:
            judgment = root.find('.//judgment')
             
        if judgment is None:
            print(f"No <judgment> tag found in {xml_path}")
            return
            
        meta = judgment.find('.//akn:meta', ns)
        if meta is None:
            meta = judgment.find('.//meta')
        body = judgment.find('.//akn:judgmentBody', ns)
        if body is None:
            body = judgment.find('.//judgmentBody')
        
        if body is None:
            print(f"No <judgmentBody> found in {xml_path}")
            return
            
        # Extract basic metadata
        court = "Nepoznati Sud"
        case_number = "K Nepoznato"
        date = "Nepoznat Datum"
        
        if meta is not None:
             frbrwork = meta.find('.//akn:FRBRWork', ns) 
             if frbrwork is None:
                 frbrwork = meta.find('.//FRBRWork')
                 
             if frbrwork is not None:
                 author = frbrwork.find('.//akn:FRBRauthor', ns)
                 if author is None:
                     author = frbrwork.find('.//FRBRauthor')
                 if author is not None and author.text:
                     court = author.text.strip()
                     
                 # The date attribute
                 date_elem = frbrwork.find('.//akn:FRBRdate', ns)
                 if date_elem is None:
                     date_elem = frbrwork.find('.//FRBRdate')
                     
                 if date_elem is not None and date_elem.get('date'):
                     date = date_elem.get('date')
                 elif date_elem is not None and date_elem.text:
                     date = date_elem.text.strip()
                     
                 title = frbrwork.find('.//akn:FRBRtitle', ns)
                 if title is None:
                     title = frbrwork.find('.//FRBRtitle')
                 if title is not None and title.text:
                     case_number = title.text.strip()

        # Parse the judgment body paragraphs
        paragraphs_html = []
        for p in body.findall('.//akn:p', ns) or body.findall('.//p'):
            # Convert the paragraph content including the inline XML tags into HTML text
            p_text = get_text_content(p)
            
            # Apply additional regex highlighting
            p_text = highlight_p_text(p_text)
            
            # Check for centered headers
            style = p.get('style', '')
            if not p_text.strip():
                paragraphs_html.append('<p class="scoped-p">&nbsp;</p>')
            elif 'text-align: center' in style:
                paragraphs_html.append(f'<p class="scoped-p header">{p_text}</p>')
            else:
                paragraphs_html.append(f'<p class="scoped-p">{p_text}</p>')
                
        body_html = "".join(paragraphs_html)

        html_template = f"""<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <style>
    body.scoped {{
      font-size: 0.9rem;
      font-family: Source Sans Pro, sans-serif;
      line-height: 1.5;
      min-height: 100%;
      min-width: 100px;
    }}

    a.scoped {{
      color: #1e40af; /* blue-800 */
      background-color: #dbeafe; /* Tailwind blue-100 */
      font-weight: 500;
      padding: 0px 4px;
      border-radius: 4px;
      text-decoration: none;
    }}

    a.scoped:hover {{
      background-color: #bfdbfe; /* Tailwind blue-200 */
      text-decoration: underline;
    }}

    .scoped-highlight {{
      color: #1e40af; /* blue-800 */
      background-color: #f3f4f6; /* gray-100 */
      font-weight: 500;
      padding: 0px 4px;
      border-radius: 4px;
    }}

    p.scoped-p {{
      margin: 0;
      padding: 1px 0;
    }}

    .header {{
      text-align: center;
      margin-top: 2rem !important;
      margin-bottom: 2rem !important;
    }}
  </style>

  <body class="scoped">
    <div style="padding: 20px 0; width: 100%; text-align: center; margin-bottom: 20px;">
      <p class="scoped-p" style="font-size: 0.8rem; line-height: 1rem; margin: auto">{court}</p>
      <p class="scoped-p" style="color: #245474; font-size: 2rem; font-weight: 700; line-height: 2rem; margin: auto">{case_number}</p>
      <p class="scoped-p" style="color: #555; font-size: 0.8rem; line-height: 1rem; margin: auto">{date}</p>
    </div>

    <article style="padding: 20px 10% 40px">
      {body_html}
    </article>
  </body>
</html>
"""

        # Construct safe output filename
        safe_filename = case_number.replace("/", " ").replace(".", "")
        if not safe_filename.upper().startswith("K "):
             safe_filename = "K " + safe_filename
        output_filename = f"{safe_filename}.html"
        output_path = os.path.join(output_dir, output_filename)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(html_template)
            
        print(f"Generated HTML: {output_filename}")
        
    except Exception as e:
        print(f"Error converting {xml_path}: {e}")

def convert_all_xmls(xml_dir, output_dir):
    if not os.path.exists(xml_dir):
        print(f"XML directory does not exist: {xml_dir}")
        return
        
    os.makedirs(output_dir, exist_ok=True)

    # These XMLs are not individual judgments and should never be converted to HTML.
    # krivicni_zakon_crne_gore.xml is the full criminal code law file.
    # K Nepoznato.xml is a fallback stub that gets created when a PDF cannot be parsed.
    SKIP_XMLS = {
        "krivicni_zakon_crne_gore.xml",
        "K Nepoznato.xml",
    }

    for filename in os.listdir(xml_dir):
        if filename.lower().endswith(".xml"):
            if filename in SKIP_XMLS:
                print(f"Skipping non-judgment XML: {filename}")
                continue
            xml_path = os.path.join(xml_dir, filename)
            convert_xml_to_html(xml_path, output_dir)

if __name__ == "__main__":
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    xml_dir = os.path.join(base_dir, "documents", "akoma-ntoso")
    output_dir = os.path.join(base_dir, "frontend", "public", "html", "presude")
    convert_all_xmls(xml_dir, output_dir)
