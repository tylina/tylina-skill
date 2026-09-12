#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
web_to_md.py - Web Page to Markdown Converter (Python Version)

Usage:
    python scripts/source_to_md/web_to_md.py <url>
    python scripts/source_to_md/web_to_md.py <url1> <url2> ...
    python scripts/source_to_md/web_to_md.py -f urls.txt
    python scripts/source_to_md/web_to_md.py <url> -o output.md

Dependencies:
    pip install requests beautifulsoup4

TLS fingerprint handling:
    Some sites (e.g., WeChat mp.weixin.qq.com) block Python's default 'requests'
    library based on TLS fingerprints (JA3). If 'curl_cffi' is installed, this script
    uses it to impersonate a modern Chrome fingerprint and bypass such blocks. If
    'curl_cffi' is unavailable, it silently falls back to plain 'requests' — so
    non-blocking sites still work without the extra dependency.

    Install for WeChat / Chinese-portal coverage:
        pip install curl_cffi

    If curl_cffi is unavailable, the converter uses plain requests and reports a
    controlled failure when a site requires browser-like TLS or JavaScript execution.
"""

from __future__ import annotations

import argparse
import hashlib
import datetime
import io
import os
import re
import sys
import time
from pathlib import Path
from urllib.parse import urljoin, urlparse

_SOURCE_TO_MD_DIR = Path(__file__).resolve().parent
if str(_SOURCE_TO_MD_DIR) not in sys.path:
    sys.path.insert(0, str(_SOURCE_TO_MD_DIR))

from conversion_receipt import (  # noqa: E402
    ConversionReceiptError,
    clear_receipts, OutputTransaction,
    validate_markdown_output,
    write_success_receipt,
)

CONVERTER_VERSION = "1.0.0"

try:
    import requests
    from bs4 import BeautifulSoup, NavigableString, Tag
except ImportError:
    requests = None  # type: ignore[assignment]
    BeautifulSoup = NavigableString = Tag = None  # type: ignore[assignment,misc]

# Prefer curl_cffi for TLS-fingerprint impersonation (bypasses JA3 blocking on
# sites like WeChat). Fall back to plain requests when it's not installed.
try:
    from curl_cffi import requests as curl_requests  # type: ignore
    _CURL_IMPERSONATE = "chrome120"
except ImportError:
    curl_requests = None
    _CURL_IMPERSONATE = None


def _http_get(url: str, *, headers: dict | None = None, timeout: int | None = None,
              verify: bool = False, stream: bool = False):
    """HTTP GET with curl_cffi preferred, requests fallback.

    Using curl_cffi lets this script fetch sites that reject Python's default
    TLS fingerprint (notably mp.weixin.qq.com). Signature mirrors the subset of
    requests.get() this script actually uses.
    """
    if curl_requests is not None:
        return curl_requests.get(
            url, headers=headers, timeout=timeout,
            verify=verify, impersonate=_CURL_IMPERSONATE, stream=stream,
        )
    _require_requests()
    return requests.get(url, headers=headers, timeout=timeout,
                        verify=verify, stream=stream)


def _require_requests() -> None:
    """Raise an actionable error only when a plain HTTP fetch is attempted."""
    if requests is None:
        raise RuntimeError(
            "Web conversion requires requests. Install it with: pip install requests beautifulsoup4"
        )


def _require_html_parser() -> None:
    """Raise an actionable error only when HTML-to-Markdown conversion starts."""
    if BeautifulSoup is None:
        raise RuntimeError(
            "Web conversion requires beautifulsoup4. Install it with: pip install requests beautifulsoup4"
        )

try:
    from PIL import Image
    PILLOW_AVAILABLE = True
except ImportError:
    PILLOW_AVAILABLE = False

# ============ Config ============
CONFIG = {
    "output_dir": "./projects",
    "timeout": 30,
    "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    # Specific content identifiers often found in Chinese CMS (Gov/News)
    "content_selectors": [
        {"class_": re.compile(r"tys-main-zt-show", re.I)},
        {"class_": re.compile(r"tys-main", re.I)},
        {"class_": "TRS_Editor"},
        {"class_": "TRS_UEDITOR"},
        {"class_": "ucontent"},
        {"class_": "article-content"},
        {"class_": "news-content"},
        {"class_": "detail-content"},
        {"class_": "content-text"},
        {"class_": "pages_content"},
        {"class_": "zwgk_content"},
        {"class_": "content_detail"},
        {"class_": "text_content"},
        {"class_": "main-content"},
        {"class_": "main_content"},
        {"class_": "view-content"},
        {"class_": "info-content"},
        {"id": "Zoom"},
        {"id": "content"},
        {"id": "article"},
        {"class_": "content"},
        {"name": "article"},  # tag name
        {"name": "main"},    # tag name
    ]
}


def fetch_url(url: str) -> tuple[bytes, str, str]:
    """Fetch a web page with explicit headers and encoding detection.

    Args:
        url: Target URL.

    Returns:
        A ``(raw_bytes, final_url, decoded_html)`` tuple. ``final_url`` is the
        URL after redirects, and ``decoded_html`` uses the response encoding.
    """
    headers = {
        "User-Agent": CONFIG["user_agent"],
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8"
    }

    try:
        response = _http_get(url, headers=headers,
                             timeout=CONFIG["timeout"], verify=False)
        response.raise_for_status()

        # Enhanced encoding detection (requests handles this well usually, but we force apparent_encoding for Chinese)
        # curl_cffi exposes the same .apparent_encoding attribute
        if hasattr(response, "apparent_encoding") and response.apparent_encoding:
            response.encoding = response.apparent_encoding

        raw = response.content
        return raw, str(getattr(response, "url", url) or url), response.text
    except Exception as e:
        raise Exception(f"Failed to fetch {url}: {str(e)}")


def clean_title(title: str) -> str:
    """Remove common site suffixes from a title."""
    if not title:
        return ""
    # Remove site name suffixes often found in Chinese titles
    clean = re.sub(r"[-_|].*?(政府|门户|网站|委员会).*$", "", title)
    return clean.strip()


def sanitize_filename(name: str) -> str:
    """Sanitize a string for filesystem-safe filenames."""
    # Replace whitespace with underscore first
    clean = re.sub(r'\s+', '_', name)
    # Remove all except Chinese, English, Numbers, Underscore
    clean = re.sub(r'[^\u4e00-\u9fa5a-zA-Z0-9_]', '', clean)
    # Collapse repeating underscores
    clean = re.sub(r'_+', '_', clean)
    return clean[:80]  # Truncate


def derive_base_name(title: str, url: str) -> str:
    """Derive a safe, non-empty basename from a title or URL."""
    base = sanitize_filename(title or "")
    if base:
        return base

    parsed = urlparse(url)
    path = parsed.path.strip('/')
    if path:
        candidate = f"{parsed.netloc}_{path}"
    else:
        candidate = parsed.netloc or "untitled"
    base = sanitize_filename(candidate)
    if base:
        return base

    ts = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"untitled_{ts}"


def build_image_filename(abs_url: str, seq: int, content_type: str | None = None) -> str:
    """Build a safe image filename from URL metadata."""
    parsed = urlparse(abs_url)
    basename = os.path.basename(parsed.path).split('?')[0]
    stem, ext = os.path.splitext(basename)
    if not ext or len(ext) > 5 or '/' in ext:
        ext = ""
    if not ext and content_type:
        ctype = content_type.split(';')[0].lower()
        ext_map = {
            "image/jpeg": ".jpg",
            "image/jpg": ".jpg",
            "image/png": ".png",
            "image/gif": ".gif",
            "image/webp": ".webp",
        }
        ext = ext_map.get(ctype, "")
    if not ext:
        ext = ".jpg"
    stem = sanitize_filename(stem) if stem else f"image_{seq}"
    return f"{stem}{ext}"


def download_and_rewrite_images(
    content_element: Tag | None,
    page_url: str,
    image_dir: str,
    rel_prefix: str,
    warnings: list[str] | None = None,
) -> int:
    """Download images under the main content node and rewrite `src` paths."""
    if content_element is None:
        return 0
    images = list(content_element.find_all("img"))
    if not images:
        return 0

    os.makedirs(image_dir, exist_ok=True)
    downloaded = {}
    saved = 0

    for idx, img in enumerate(images):
        # Prefer lazy-load attributes — WeChat, Zhihu, and many CMSes keep the
        # real image URL in data-src / data-original / data-lazy-src, with
        # `src` pointing at a 1x1 placeholder or a template literal.
        candidates = [
            img.get("data-src"),
            img.get("data-original"),
            img.get("data-lazy-src"),
            img.get("data-actualsrc"),
            img.get("src"),
        ]
        src = next((s for s in candidates
                    if s and not s.startswith("data:")
                    and s.startswith(("http://", "https://", "//", "/"))), None)
        if not src:
            continue

        # Promote the chosen URL into the element's src so downstream rewrite
        # (which matches on src) can retarget it to the local file.
        img["src"] = src

        abs_url = urljoin(page_url, src)
        if abs_url in downloaded:
            saved_name = downloaded[abs_url]
        else:
            try:
                resp = _http_get(
                    abs_url,
                    headers={"User-Agent": CONFIG["user_agent"]},
                    timeout=CONFIG["timeout"],
                    verify=False,
                )
                resp.raise_for_status()
                filename = build_image_filename(
                    abs_url, idx, resp.headers.get("Content-Type"))

                # Check if image is webp and convert to png
                stem, ext = os.path.splitext(filename)
                content_type = resp.headers.get("Content-Type", "").lower()
                is_webp = ext.lower() == ".webp" or "webp" in content_type

                if is_webp and PILLOW_AVAILABLE:
                    # Convert webp to png (optimized)
                    try:
                        img_data = io.BytesIO(resp.content)
                        pil_image = Image.open(img_data)

                        # Update filename to .png
                        filename = f"{stem}.png"
                        local_path = os.path.join(image_dir, filename)

                        # Avoid accidental overwrites if filenames collide
                        counter = 1
                        while os.path.exists(local_path):
                            local_path = os.path.join(
                                image_dir, f"{stem}_{counter}.png")
                            filename = os.path.basename(local_path)
                            counter += 1

                        # Save as PNG directly (Pillow auto-converts, no need for explicit mode conversion)
                        pil_image.save(local_path, 'PNG', optimize=False)
                        pil_image.close()
                        print(f"   [INFO] Converted webp to png: {filename}")
                    except Exception as convert_err:
                        print(
                            f"   [WARN] Failed to convert webp: {convert_err}, saving as-is")
                        if warnings is not None:
                            warnings.append(
                                f"WebP image was saved without PNG conversion: "
                                f"{abs_url} ({convert_err})"
                            )
                        local_path = os.path.join(image_dir, filename)
                        counter = 1
                        stem, ext = os.path.splitext(filename)
                        while os.path.exists(local_path):
                            local_path = os.path.join(
                                image_dir, f"{stem}_{counter}{ext}")
                            filename = os.path.basename(local_path)
                            counter += 1
                        with open(local_path, "wb") as f:
                            f.write(resp.content)
                else:
                    local_path = os.path.join(image_dir, filename)

                    # Avoid accidental overwrites if filenames collide
                    counter = 1
                    stem, ext = os.path.splitext(filename)
                    while os.path.exists(local_path):
                        local_path = os.path.join(
                            image_dir, f"{stem}_{counter}{ext}")
                        filename = os.path.basename(local_path)
                        counter += 1

                    with open(local_path, "wb") as f:
                        f.write(resp.content)
                downloaded[abs_url] = filename
                saved_name = filename
                saved += 1
            except Exception as e:
                print(f"   [WARN] Skip image {abs_url}: {e}")
                if warnings is not None:
                    warnings.append(f"Image could not be downloaded: {abs_url} ({e})")
                continue

        rel_path = os.path.join(
            rel_prefix, saved_name) if rel_prefix else saved_name
        img["src"] = rel_path

    return saved


def extract_metadata(soup: BeautifulSoup, url: str) -> dict[str, str]:
    """Extract page metadata such as title, date, description, and author."""

    # 1. Title
    title_tag = soup.title
    title = clean_title(title_tag.string if title_tag else "")

    # 2. Meta tags
    metas = {}
    for meta in soup.find_all("meta"):
        name = meta.get("name") or meta.get("property")
        content = meta.get("content")
        if name and content:
            metas[name.lower()] = content.strip()

    # 3. Date Extraction Strategies
    date = (
        metas.get("article:published_time") or
        metas.get("og:published_time") or
        metas.get("pubdate") or
        metas.get("publishdate") or
        metas.get("date")
    )

    if not date:
        # Try matching date patterns in the text
        text_content = soup.get_text()
        date_patterns = [
            r"发布[时日]间[：:]\s*(\d{4}[-\/年]\d{1,2}[-\/月]\d{1,2}[日]?)",
            r"日期[：:]\s*(\d{4}[-\/年]\d{1,2}[-\/月]\d{1,2}[日]?)",
            r"(\d{4}[-\/年]\d{1,2}[-\/月]\d{1,2}[日]?)\s*(?:发布|来源)",
            r"时间[：:]\s*(\d{4}[-\/]\d{1,2}[-\/]\d{1,2})"
        ]
        for pattern in date_patterns:
            match = re.search(pattern, text_content)
            if match:
                date = match.group(1).replace(
                    "年", "-").replace("月", "-").replace("日", "")
                break

    if not date:
        # Try URL matching
        match = re.search(r"(\d{4})(\d{2})[\/_](?:t\d+_)?", url)
        if match:
            date = f"{match.group(1)}-{match.group(2)}"
        else:
            match = re.search(r"(\d{4})[-\/](\d{2})[-\/](\d{2})", url)
            if match:
                date = f"{match.group(1)}-{match.group(2)}-{match.group(3)}"

    # 4. Description
    description = (
        metas.get("description") or
        metas.get("og:description") or
        metas.get("twitter:description") or
        ""
    )

    # 5. Author/Source
    author = metas.get("author") or metas.get("article:author")
    if not author:
        # Try common patterns
        source_patterns = [
            r"来源[：:]\s*([^\s<]+)",
            r"发布(?:单位|机构)[：:]\s*([^\s<]+)"
        ]
        for pattern in source_patterns:
            match = re.search(pattern, soup.get_text())
            if match:
                author = match.group(1)
                break

    return {
        "title": title or metas.get("og:title") or "Untitled",
        "date": date or "",
        "description": description,
        "author": author or "",
        "source_url": url
    }


def find_main_content(soup: BeautifulSoup) -> Tag | None:
    """Find the most likely main content container in a page."""
    # 1. Clean up first (remove known clutter)
    for tag in soup(["script", "style", "nav", "header", "footer", "aside", "noscript", "iframe"]):
        tag.decompose()

    best_element = None
    max_score = 0

    # 2. Strategy A: Check specific classes/ids
    for selector in CONFIG["content_selectors"]:
        if "name" in selector:
            # Tag name match (article, main)
            elements = soup.find_all(selector["name"])
        else:
            # Class or ID match
            elements = soup.find_all(attrs=selector)

        for el in elements:
            # Score based on text length and chinese character count
            text = el.get_text(strip=True)
            length = len(text)
            if length < 100:
                continue

            chinese_count = len(re.findall(r'[\u4e00-\u9fa5]', text))
            score = length + (chinese_count * 2)

            if score > max_score:
                max_score = score
                best_element = el

    # 3. Strategy B: If no specific container found, look for dense text areas with paragraphs
    if not best_element or max_score < 200:
        for div in soup.find_all("div"):
            p_count = len(div.find_all("p", recursive=False))
            # recursive=False ensures we don't just pick the top-level body by accident
            # but sometimes content is nested deep
            if p_count == 0:
                # Check if it has lots of text even without p tags (br tags?)
                pass

            text = div.get_text(strip=True)
            if len(text) > 200 and p_count >= 1:
                # Recalculate deep score
                chinese_count = len(re.findall(r'[\u4e00-\u9fa5]', text))
                score = len(text) + (chinese_count * 2) + (p_count * 50)
                if score > max_score:
                    max_score = score
                    best_element = div

    # Fallback to body
    return best_element if best_element else soup.body


def element_to_markdown(element: Tag | NavigableString | None) -> str:
    """Recursively convert a BeautifulSoup node to Markdown."""
    if element is None:
        return ""

    if isinstance(element, NavigableString):
        text = str(element).strip()
        return text if text else ""

    tag_name = element.name.lower()

    # Skip hidden/unwanted tags
    if tag_name in ['script', 'style', 'meta', 'link', 'input', 'button', 'select']:
        return ""

    content = ""
    for child in element.children:
        content += element_to_markdown(child)
        # Add spacing logic here if needed, but usually block elements handle it

    # Block handlers
    if tag_name in ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']:
        level = int(tag_name[1])
        return f"\n{'#' * level} {content}\n\n"

    elif tag_name == 'p':
        # Clean up internal whitespace
        content = re.sub(r'\s+', ' ', content).strip()
        return f"\n{content}\n\n" if content else ""

    elif tag_name == 'br':
        return "  \n"

    elif tag_name == 'hr':
        return "\n---\n"

    elif tag_name == 'div':
        return f"\n{content}\n"

    elif tag_name == 'blockquote':
        lines = content.strip().split('\n')
        quoted = '\n'.join([f"> {line}" for line in lines if line.strip()])
        return f"\n{quoted}\n\n"

    elif tag_name in ['ul', 'ol']:
        # This is tricky without "state" (knowing we are in a list)
        # For simplicity in this recursive version, we rely on LI handling
        return f"\n{content}\n"

    elif tag_name == 'li':
        # Simple list handling
        clean_content = content.strip()
        return f"- {clean_content}\n"

    elif tag_name == 'pre':
        return f"\n```\n{content}\n```\n\n"

    elif tag_name == 'code':
        # If parent is pre, handle in pre. If inline:
        parent = element.parent
        if parent and parent.name == 'pre':
            return content
        return f"`{content}`"

    elif tag_name == 'a':
        href = element.get('href', '')
        if href and not href.startswith('javascript:'):
            return f"[{content}]({href})"
        return content

    elif tag_name == 'img':
        src = element.get('src', '')
        alt = element.get('alt', '')
        if src:
            return f"![{alt}]({src})"
        return ""

    elif tag_name == 'table':
        # Basic table text extraction, full markdown table support is complex
        # Leaving as raw text or simplistic conversion for now
        # Ideally, we'd parse TRs and TDs
        return f"\n{content}\n"

    elif tag_name == 'tr':
        return f"{content}|\n"

    elif tag_name in ['td', 'th']:
        return f"| {content.strip()} "

    # Style formatting
    elif tag_name in ['strong', 'b']:
        return f"**{content}**"
    elif tag_name in ['em', 'i']:
        return f"*{content}*"
    elif tag_name in ['del', 's', 'strike']:
        return f"~~{content}~~"

    # Default for span, section, etc.
    return f"{content} "


def simple_html_to_markdown_traversal(soup: Tag | BeautifulSoup | None) -> str:
    """Convert HTML content to Markdown using BeautifulSoup traversal."""
    lines = []

    def traverse(node: Tag | NavigableString) -> str:
        if isinstance(node, NavigableString):
            text = str(node)
            # Normalize whitespace but keep single spaces
            text = re.sub(r'\s+', ' ', text)
            if text.strip():
                return text
            return ""

        if node.name in ['script', 'style', 'comment', 'meta', 'link']:
            return ""

        # Handle Block Elements
        is_block = node.name in ['p', 'div', 'h1', 'h2', 'h3', 'h4',
                                 'h5', 'h6', 'li', 'blockquote', 'pre', 'hr', 'table', 'tr']

        # Pre-processing
        prefix = ""
        suffix = ""

        if node.name in ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']:
            level = int(node.name[1])
            prefix = f"\n\n{'#' * level} "
            suffix = "\n\n"
        elif node.name == 'p':
            prefix = "\n\n"
            suffix = "\n\n"
        elif node.name == 'li':
            prefix = "\n- "
        elif node.name == 'blockquote':
            prefix = "\n> "
            suffix = "\n"
        elif node.name == 'hr':
            return "\n\n---\n\n"
        elif node.name == 'br':
            return "  \n"
        elif node.name == 'pre':
            # Extract raw text from pre to preserve formatting
            return f"\n\n```\n{node.get_text()}\n```\n\n"

        # Inline formatting
        if node.name in ['strong', 'b']:
            prefix, suffix = "**", "**"
        elif node.name in ['em', 'i']:
            prefix, suffix = "*", "*"
        elif node.name == 'code' and node.parent.name != 'pre':
            prefix, suffix = "`", "`"
        elif node.name == 'a':
            href = node.get('href')
            if href and not href.startswith('javascript:'):
                prefix = "["
                suffix = f"]({href})"
            else:
                prefix, suffix = "", ""
        elif node.name == 'img':
            src = node.get('src')
            alt = node.get('alt', '')
            if src:
                return f"![{alt}]({src})"
            return ""

        # Recurse
        inner_text = ""
        for child in node.children:
            res = traverse(child)
            if res:
                inner_text += res

        # Post-processing for tables (simplified)
        if node.name == 'tr':
            # count tds
            cells = [c.get_text(strip=True) for c in node.find_all(
                ['td', 'th'], recursive=False)]
            return f"| {' | '.join(cells)} |\n"
        if node.name == 'table':
            # Try to add a separator line after first row if it looks like a header
            rows = inner_text.strip().split('\n')
            if rows:
                cols_count = rows[0].count('|') - 1
                if cols_count > 0:
                    # rough approx
                    sep = "| " + " | ".join(["---"] * int(cols_count/2)) + " |"
                    # Actually, the traverse of TR returns newline terminated strings.
                    # Let's just return what we gathered.
                    pass
            return f"\n\n{inner_text}\n\n"

        return f"{prefix}{inner_text}{suffix}"

    # Actually, a simpler approach for this script is "just get string" but with markers?
    # Let's use a simplified approach: use get_text but with 'separator' logic?
    # text = soup.get_text(separator='\n\n')
    # But that loses links and boldness.

    # Recommendation: Let's stick to the traversal above which constructs a string.
    md = traverse(soup)

    # Cleanup Markdown
    if md:
        # Remove excessive newlines
        md = re.sub(r'\n{3,}', '\n\n', md)
        md = md.strip()
    return md or ""


def process_url(
    url: str,
    output_file: str | None = None,
    *,
    emit_receipt: bool = True,
    receipt_path: str | None = None,
) -> tuple[bool, str, str | None]:
    """Fetch, convert, and save one web page as Markdown."""
    print(f"\n[Fetching] {url}")
    resolved_output = output_file
    if resolved_output:
        try:
            clear_receipts(resolved_output, receipt_path)
        except ConversionReceiptError as exc:
            print(f"   [ERROR] {exc}")
            return False, url, str(exc)
    warnings: list[str] = []
    transaction: OutputTransaction | None = None
    try:
        _require_html_parser()
        fetched = fetch_url(url)
        # Retain compatibility with callers/tests that supplied decoded text.
        if isinstance(fetched, str):
            html, raw_bytes, final_url = fetched, fetched.encode("utf-8"), url
        else:
            raw_bytes, final_url, html = fetched
        if not html.strip():
            raise ConversionReceiptError("fetched response body is empty")
        soup = BeautifulSoup(html, 'html.parser')

        # Extract Metadata
        metadata = extract_metadata(soup, url)
        print(f"   [INFO] Title: {metadata['title']}")
        if metadata['date']:
            print(f"   [INFO] Date: {metadata['date']}")

        # Determine output path and image directory upfront
        if output_file:
            output_path = output_file
        else:
            base_name = derive_base_name(metadata['title'], final_url)
            candidate = os.path.join(CONFIG["output_dir"], f"{base_name}.md")
            reserved = CONFIG.setdefault("_reserved_outputs", set())
            if candidate in reserved or os.path.exists(candidate):
                base_name += "_" + hashlib.sha256(final_url.encode("utf-8")).hexdigest()[:10]
            reserved.add(os.path.join(CONFIG["output_dir"], f"{base_name}.md"))
            filename = f"{base_name}.md"
            output_path = os.path.join(CONFIG["output_dir"], filename)
        resolved_output = output_path
        clear_receipts(output_path, receipt_path)

        transaction = OutputTransaction(output_path)
        staged_output = str(transaction.staged_output)
        image_dir = str(transaction.staged_assets)
        rel_image_prefix = f"{Path(output_path).stem}_files"

        # Extract Content
        content_div = find_main_content(soup)

        # Download images and rewrite src before markdown conversion
        image_count = download_and_rewrite_images(
            content_div, url, image_dir, rel_image_prefix, warnings)
        if image_count:
            print(f"   [OK] Images: {image_count} saved to {image_dir}")

        # Convert to MD
        # Note: We pass the element to our traversal function
        markdown_text = simple_html_to_markdown_traversal(content_div)
        if not markdown_text.strip():
            raise ConversionReceiptError("no main-page Markdown content was extracted")
        print(f"   [INFO] Content: {len(markdown_text)} chars")

        # Construct content
        final_output = []
        final_output.append("<!--")
        final_output.append(f"  Source: {url}")
        final_output.append(
            f"  Crawled: {datetime.datetime.now().isoformat()}")
        if metadata['date']:
            final_output.append(f"  Published: {metadata['date']}")
        if metadata['author']:
            final_output.append(f"  Author: {metadata['author']}")
        final_output.append("-->\n")

        if metadata['title']:
            final_output.append(f"# {metadata['title']}\n")

        if metadata['description']:
            final_output.append(f"> {metadata['description']}\n")

        final_output.append(markdown_text)

        full_content = "\n".join(final_output)

        with open(staged_output, 'w', encoding='utf-8') as f:
            f.write(full_content)

        validate_markdown_output(staged_output, full_content)
        def issue_receipt():
            write_success_receipt(
                source_bytes=raw_bytes,
                source_uri=final_url,
                requested_uri=url,
                output_path=output_path,
                converter="web_to_md",
                version=CONVERTER_VERSION,
                warnings=warnings,
                receipt_path=receipt_path,
                expected_output=full_content,
            )
        transaction.publish(full_content, issue_receipt if emit_receipt else None)
        transaction.__exit__()
        transaction = None

        if warnings:
            print(
                f"   [WARN] Saved Markdown with {len(warnings)} warning(s): {output_path}"
            )
        else:
            print(f"   [OK] Saved: {output_path}")
        return True, url, None

    except Exception as e:
        if transaction is not None:
            transaction.__exit__()
        if resolved_output:
            try:
                clear_receipts(resolved_output, receipt_path)
            except ConversionReceiptError as cleanup_exc:
                print(f"   [ERROR] receipt cleanup failed: {cleanup_exc}")
        print(f"   [ERROR] {str(e)}")
        return False, url, str(e)


def main() -> None:
    """Run the CLI entry point."""
    parser = argparse.ArgumentParser(
        description="Web to Markdown Converter (Python)")
    parser.add_argument("urls", nargs="*", help="URLs to process")
    parser.add_argument(
        "-f", "--file", help="File containing URLs (one per line)")
    parser.add_argument("-o", "--output", help="Output file (single URL only)")
    parser.add_argument("-d", "--dir", help="Output directory")
    receipt_group = parser.add_mutually_exclusive_group()
    receipt_group.add_argument(
        "--receipt",
        metavar="PATH",
        help="Write the success receipt to PATH (single URL only)",
    )
    receipt_group.add_argument(
        "--no-receipt",
        action="store_true",
        help="Do not write conversion receipts",
    )

    args = parser.parse_args()

    # Suppress the expected warning only for an actual conversion. Keeping this
    # import here also makes ``--help`` independent of urllib3 installation.
    try:
        import urllib3
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
    except ImportError:
        pass

    if args.dir:
        CONFIG["output_dir"] = args.dir

    targets = []
    if args.urls:
        targets.extend(args.urls)

    if args.file:
        if os.path.exists(args.file):
            with open(args.file, 'r', encoding='utf-8') as f:
                lines = [l.strip() for l in f if l.strip()
                         and not l.strip().startswith("#")]
                targets.extend(lines)
        else:
            print(f"Error: File {args.file} not found")
            sys.exit(1)

    if not targets:
        parser.print_help()
        sys.exit(1)
    if args.output and len(targets) != 1:
        parser.error("--output can only be used with a single URL")
    if args.receipt and len(targets) != 1:
        parser.error("--receipt can only be used with a single URL")

    results = []
    for i, url in enumerate(targets):
        # Allow specific output file only if 1 URL
        out = args.output if (len(targets) == 1 and args.output) else None
        success, url, err = process_url(
            url,
            out,
            emit_receipt=not args.no_receipt,
            receipt_path=args.receipt if len(targets) == 1 else None,
        )
        results.append((success, url, err))

    # Summary
    success_count = sum(1 for r in results if r[0])
    fail_count = len(results) - success_count

    print("\n" + "="*50)
    print(
        f"[Done] Success: {success_count}/{len(results)}, Failed: {fail_count}")

    if fail_count > 0:
        print("\n[Failed URLs]:")
        for r in results:
            if not r[0]:
                print(f"   - {r[1]}: {r[2]}")
        sys.exit(1)


if __name__ == "__main__":
    main()
