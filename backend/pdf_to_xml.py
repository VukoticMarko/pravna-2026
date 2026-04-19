import os
import re
import pdfplumber
import xml.etree.ElementTree as ET
from xml.dom import minidom
from datetime import datetime

# Common mappings for broken PDF encoding of Montenegrin/Serbian characters
CHAR_MAP = {
    '': 'c', # This is a guess, sometimes it's c, s, z, d
    'æ': 'c',
    'è': 'c',
    'š': 's',
    'đ': 'dj',
    'ž': 'z',
    'č': 'c',
    'ć': 'c'
}

CHAR_MAP = {
    '\ufffd': 'c', # The replacement character 
    'ć': 'c',
    'č': 'c',
    'š': 's',
    'đ': 'dj',
    'ž': 'z'
}

def clean_text(text):
    if not text:
        return ""
    for char, replacement in CHAR_MAP.items():
        text = text.replace(char, replacement)
    return text

def parse_pdf(pdf_path):
    full_text = []
    try:
        with pdfplumber.open(pdf_path) as pdf:
            for page in pdf.pages:
                page_text = page.extract_text()
                if page_text:
                    full_text.append(clean_text(page_text))
    except Exception as e:
        print(f"Error reading {pdf_path}: {e}")
        return None
    return "\n".join(full_text)

def sanitize_text(text):
    # Odluke.pdf generated an OCR bug where every letter is prefixed by 'c' 
    # (e.g. cOcscncocvcncic cScucdc cuc cBcacrcuc). Let's detect and repair this.
    if re.search(r'cOcscncocvcncic cScucdc|c[A-Z]c[a-z]c[a-z]', text):
        # The text is interleaved with 'c'. We need to extract every other character.
        # However, it also intercepts spaces as ` c `, so let's handle it carefully.
        # 'c' followed by a character (including space).
        cleaned = re.sub(r'c(.)', r'\1', text)
        return cleaned
    return text

def extract_entities(text):
    text = sanitize_text(text)
    entities = {
        'court': 'Nepoznati Sud',
        'case_number': 'K Nepoznato',
        'date': 'Nepoznat Datum',
        'judge': 'Nepoznati Sudija',
        'clerk': 'Nepoznati Zapisnicar',
        'defendant': 'Nepoznati Okrivljeni',
        'plaintiff': 'Nepoznati Tuzilac',
        'defender': 'Nepoznati Branilac'
    }

    # Extract Court
    court_match = re.search(r'(?i)(osnovni\s+sud\s+u\s+[\wšđčćž]+|vrhovni\s+sud\s+cg)', text)
    if court_match:
        entities['court'] = court_match.group(1).strip().title()

    # Extract Case Number
    # Try to find the primary K 10002/2024 format first
    case_match_primary = re.search(r'(?i)^K\s+(\d+\s*/\s*\d{2,4})', text[:500], re.MULTILINE)
    if case_match_primary:
        entities['case_number'] = "K " + case_match_primary.group(1).replace(' ', '')
    else:
        # Fallback to K.br. or K br. formats
        case_match = re.search(r'(?i)K(?:\.br\.?|\s+br\.?|\s+)\s*(\d+\s*/\s*\d{2,4})', text)
        if case_match:
            entities['case_number'] = "K " + case_match.group(1).replace(' ', '').replace('/', '/')
    
    # Extract Date
    date_match = re.search(r'(\d{1,2}\.\s*(?:januar|februar|mart|april|maj|jun|jul|avgust|septembar|oktobar|novembar|decembar|[IVX]+)\s*\d{4}\.?)', text, re.IGNORECASE)
    if date_match:
        entities['date'] = date_match.group(1).strip()
    else:
        date_match = re.search(r'(\d{1,2}\.\d{1,2}\.\d{4}\.?)', text)
        if date_match:
            entities['date'] = date_match.group(1).strip()

    # Extract Judge
    judge_match = re.search(r'(?i)sudij[ea]\s+([A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+(?:\s+[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+|-[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+)?)', text)
    if judge_match:
        entities['judge'] = judge_match.group(1).strip()

    # Extract Clerk
    clerk_match = re.search(r'(?i)(?:uz\s+u[cč]e[sš][cč]e|zapisni[cč]ara)\s+(?:zapisni[cč]ara\s+)?([A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+\s+[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+)', text)
    if clerk_match:
        entities['clerk'] = clerk_match.group(1).strip()
    else:
         clerk_alt = re.search(r'(?i)zapisni[cč]ar(?:om|a)?\s+([A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+\s+[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+)', text)
         if clerk_alt:
             entities['clerk'] = clerk_alt.group(1).strip()

    # Extract Defendant (Look for "okrivljenog Name" or "Okrivljeni: Name")
    def_match = re.search(r'(?i)okrivljenog\s+([A-ZŠĐČĆŽ]\.\s*[A-ZŠĐČĆŽ]\.|[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+\s+(?:[A-ZŠĐČĆŽ]\.\s*)?[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+)', text)
    if def_match:
        entities['defendant'] = def_match.group(1).strip()
    else:
        def_match2 = re.search(r'(?i)Okrivljeni:?\s*\n?([A-ZŠĐČĆŽ]\.\s*[A-ZŠĐČĆŽ]\.|[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+\s+(?:[A-ZŠĐČĆŽ]\.\s*)?[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+)', text)
        if def_match2:
            entities['defendant'] = def_match2.group(1).strip()

    # Extract Plaintiff / Prosecutor
    plaintiff_match = re.search(r'(?i)tu[zž]ila[sš]tv[u|a]\s+([A-ZŠĐČĆŽ]\.\s*[A-ZŠĐČĆŽ]\.|[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+\s+[A-ZŠĐČĆŽ][a-zšđčćžćčšđžćčšđž]+)', text)
    if plaintiff_match:
         entities['plaintiff'] = plaintiff_match.group(1).strip()
    else:
        plaintiff_alt = re.search(r'(?i)(?:zastupala|zastupnik|zastupnika\s+optu[zž]be)(?:\s+)?(?:\n)?(?:[a-zšđčćžA-ZŠĐČĆŽ\s\.]+)?([A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+\s+[A-ZŠĐČĆŽ][a-zšđčćžćčšđžćčšđž]+)', text)
        if plaintiff_alt:
             name = plaintiff_alt.group(1).strip()
             if len(name.split()) == 2:
                 entities['plaintiff'] = name

    # Extract Defender / Adv
    defender_match = re.search(r'(?i)branioc[ea]\s+okrivljenog[a-z\s]+([A-ZŠĐČĆŽ]\.\s*[A-ZŠĐČĆŽ]\.|[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+\s+[A-ZŠĐČĆŽ][a-zšđčćžćčšđž]+)(?:\s*,\s*adv)', text)
    if defender_match:
        entities['defender'] = defender_match.group(1).strip()
    
    return entities

def generate_akoma_ntoso_xml(entities, full_text):
    root = ET.Element('akomaNtoso', {
        'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
        'xsi:schemaLocation': 'http://docs.oasis-open.org/legaldocml/ns/akn/3.0/WD17 ../schemas/akomantoso30.xsd ',
        'xmlns': 'http://docs.oasis-open.org/legaldocml/ns/akn/3.0/WD17',
        'xmlns:mods': 'http://www.loc.gov/standards/mods/v3/mods-3-6.xsd'
    })
    
    judgment = ET.SubElement(root, 'judgment')
    meta = ET.SubElement(judgment, 'meta')
    identification = ET.SubElement(meta, 'identification', {'source': '#court'})
    
    frbrwork = ET.SubElement(identification, 'FRBRWork')
    
    frbrauthor = ET.SubElement(frbrwork, 'FRBRauthor')
    frbrauthor.text = f"\n\t\t\t\t\t\t{entities['court']}\n\t\t\t\t\t"
    
    frbrdate = ET.SubElement(frbrwork, 'FRBRdate', {'date': entities['date']})
    frbrdate.text = f"\n\t\t\t\t\t\t{entities['date']}\n\t\t\t\t\t"
    
    frbrtitle = ET.SubElement(frbrwork, 'FRBRtitle')
    frbrtitle.text = f"\n\t\t\t\t\t\t{entities['case_number']}\n\t\t\t\t\t"
    
    frbrcountry = ET.SubElement(frbrwork, 'FRBRcountry')
    frbrcountry.text = "\n\t\t\t\t\t\tCG\n\t\t\t\t\t"
    
    references = ET.SubElement(meta, 'references')
    
    # Organization
    org_id = entities['court'].lower().replace(' ', '').replace('.', '')
    ET.SubElement(references, 'TLCOrganization', {'eId': org_id, 'href': f"/ontology/organization/{org_id}", 'showAs': entities['court']})

    # Persons
    def safe_id(n): return n.lower().replace(' ', '').replace('.', '')
    
    persons = [
        ('judge', entities['judge']),
        ('clerk', entities['clerk']),
        ('defendant', entities['defendant']),
        ('plaintiff', entities['plaintiff']),
        ('defender', entities['defender'])
    ]

    for role_id, name in persons:
        if name and "Nepoznati" not in name:
            p_id = safe_id(name)
            ET.SubElement(references, 'TLCPerson', {'eId': p_id, 'href': f"/ontology/person/{p_id}", 'showAs': name})

    # Roles
    for role_id in ['judge', 'clerk', 'defendant', 'plaintiff', 'defender']:
        ET.SubElement(references, 'TLCRole', {'eId': role_id, 'href': f"/ontology/role/{role_id}", 'showAs': role_id.capitalize()})

    # Body
    body = ET.SubElement(judgment, 'judgmentBody')
    
    # Split by exactly one newline to preserve the visual structure of the document
    paragraphs = [p.strip() for p in full_text.split('\n')]
    
    for p_text in paragraphs:
        escaped_p_text = p_text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
        
        if entities['court'] and "Nepoznati" not in entities['court']:
            escaped_p_text = escaped_p_text.replace(entities['court'], f'<organization id="{org_id}" refersTo="#{org_id}">{entities["court"]}</organization>')
            
        for role_id, name in persons:
            if name and "Nepoznati" not in name:
                p_id = safe_id(name)
                escaped_p_text = escaped_p_text.replace(name, f'<party id="{p_id}" refersTo="#{p_id}" as="#{role_id}">{name}</party>')
                
        try:
            p_elem = ET.fromstring(f'<p>{escaped_p_text}</p>')
            if len(p_text) < 50 and p_text.upper() in ["P R E S U D U", "K R I V J E", "O S U D U J E", "O S U Đ U J E", "O B R A Z L O Ž E NJ E"]:
                p_elem.set("style", "text-align: center;")
            body.append(p_elem)
        except Exception as e:
            # Fallback for parsing errors
            p_node = ET.SubElement(body, 'p')
            if len(p_text) < 50 and p_text.upper() in ["P R E S U D U", "K R I V J E", "O S U D U J E", "O S U Đ U J E", "O B R A Z L O Ž E NJ E"]:
                 p_node.set("style", "text-align: center;")
            p_node.text = p_text

    # Build XML String
    xml_str = ET.tostring(root, encoding='utf-8')
    parsed_xml = minidom.parseString(xml_str)
    
    # Prettify and clean up empty lines
    pretty_xml = parsed_xml.toprettyxml(indent='\t')
    pretty_xml = '\n'.join([line for line in pretty_xml.split('\n') if line.strip()])
    return pretty_xml

def convert_all_pdfs(pdf_dir, output_dir):
    if not os.path.exists(pdf_dir):
        return

    # Process all PDFs
    for filename in os.listdir(pdf_dir):
        if filename.lower().endswith(".pdf"):
            pdf_path = os.path.join(pdf_dir, filename)
            print(f"Processing: {filename}")
            
            full_text = parse_pdf(pdf_path)
            if not full_text:
                continue
    
            full_text = sanitize_text(full_text)
            
            entities = extract_entities(full_text)
            
            # Format filename
            safe_filename = entities['case_number'].replace("/", " ").replace(".", "")
            if not safe_filename.upper().startswith("K "):
                 safe_filename = "K " + safe_filename
            output_filename = f"{safe_filename}.xml"
            output_path = os.path.join(output_dir, output_filename)
            
            xml_content = generate_akoma_ntoso_xml(entities, full_text)
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(xml_content)
            
            print(f"Generated XML: {output_filename}")
            
            # TODO: Delete the PDF after conversion 
            # os.remove(pdf_path)
            # print(f"Deleted PDF: {filename}")

if __name__ == "__main__":
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    pdf_dir = os.path.join(base_dir, "documents", "akoma-ntoso", "pdf")
    output_dir = os.path.join(base_dir, "documents", "akoma-ntoso")
    convert_all_pdfs(pdf_dir, output_dir)
