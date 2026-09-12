# Source-to-Markdown converters

These Python converters create Markdown suitable for import into a Typst Slides project. By default, a successful single-file conversion writes a receipt beside the output:

```text
report.md
report.md.receipt.json
report_files/                 # when the converter extracted/downloaded media
```

The receipt uses `seaslides-source-conversion/v1`, fingerprints the source and Markdown output, records the converter/version and content profile, and has status `pass` or `pass_with_warnings`. Warnings describe degradation such as unsupported slide objects, truncated sheets, or failed image downloads; they do not make a successful conversion fail. Use `--receipt PATH` to choose a receipt location or `--no-receipt` to suppress it. A receipt is written only after the output and its assets are published successfully; failed conversions clear stale receipts and leave the prior published output intact.

For local files, the source is fingerprinted before conversion and checked again before publication. Web receipts fingerprint the fetched response and record both the requested URL and the final URL after redirects. Directory modes create the normal per-file default receipts; `--receipt` is single-input only.

When imported files and receipts live below `<project>/sources/`, the normal
project validator checks them as part of the final delivery gate:

```bash
python3 scripts/validate_project.py <project>
```

The Typst validator has no separate source-only CLI stage; run the command after
the project has its normal delivery inputs and compiled outputs. Receipts are
optional, but any present receipt is an integrity contract: malformed, stale,
missing-output, or unsafe receipts are errors. Validation does not re-fetch URL
sources.

## PDF: `pdf_to_md.py`

```bash
python3 scripts/source_to_md/pdf_to_md.py paper.pdf \
  [-o paper.md] [--images all|filtered|none] \
  [--backend auto|mineru|pymupdf] [--receipt PATH|--no-receipt]
```

The input may be one PDF or a directory of PDFs. `--images filtered` is the default; `all` keeps all extracted images and `none` skips image extraction.

- `auto` (default) uses MinerU only when configured. If MinerU is not configured, it stops with instructions to configure MinerU or explicitly select PyMuPDF.
- `mineru` requires MinerU configuration.
- `pymupdf` explicitly uses PyMuPDF and can degrade equations and complex layouts.

Set `MINERU_API_KEY` for MinerU's hosted API, or `MINERU_API_URL` for a self-hosted endpoint. Credentials are read only from the environment. MinerU needs `aiohttp`; PyMuPDF needs `PyMuPDF` (`fitz`). MinerU retries transient failures and, after a configured MinerU attempt fails, falls back to PyMuPDF with a Markdown notice and a `pass_with_warnings` receipt when it succeeds.

## Documents: `doc_to_md.py`

```bash
python3 scripts/source_to_md/doc_to_md.py input.docx \
  [-o output.md] [--receipt PATH|--no-receipt]
```

Native Python paths are `.docx` (`mammoth`), `.html`/`.htm` (`markdownify` and `beautifulsoup4`), `.epub` (`ebooklib` and `markdownify`), and `.ipynb` (`nbconvert`). `.doc`, `.odt`, `.rtf`, `.tex`, `.latex`, `.rst`, `.org`, and `.typ` use the system `pandoc` fallback. Extracted or copied media is placed in `<output-stem>_files/` with relative Markdown references.

## Excel: `excel_to_md.py`

```bash
python3 scripts/source_to_md/excel_to_md.py report.xlsx \
  [-o report.md] [--max-rows N] [--max-cols N] \
  [--receipt PATH|--no-receipt]
```

Supports `.xlsx` and `.xlsm` through `openpyxl`; legacy `.xls` is rejected. The converter exports visible sheets, merged-cell values, used ranges, and Markdown tables. Formula cells use cached workbook values and are not recalculated. Limits default to `0` (no limit); applying a row or column limit produces warnings and therefore normally `pass_with_warnings`.

## PowerPoint: `ppt_to_md.py`

```bash
python3 scripts/source_to_md/ppt_to_md.py deck.pptx \
  [-o deck.md] [--receipt PATH|--no-receipt]
```

The input may be one deck or a directory. Supports `.pptx`, `.pptm`, `.ppsx`, `.ppsm`, `.potx`, and `.potm` through `python-pptx`; `.ppt` is not parsed directly. It extracts text, tables, speaker notes, and pictures (to `<output-stem>_files/`). Unsupported charts and unextractable images are represented with placeholders and reported as warnings.

## Web pages: `web_to_md.py`

```bash
python3 scripts/source_to_md/web_to_md.py URL [URL ...] \
  [-f urls.txt] [-o output.md] [-d output-directory] \
  [--receipt PATH|--no-receipt]
```

`-o` and `--receipt` require exactly one URL. Without `-o`, generated filenames are written below `./projects/` (or `-d`). The Python converter fetches static HTML, extracts likely article content and metadata, converts it to Markdown, and downloads referenced content images to `<output-stem>_files/` when possible.

It requires `requests` and `beautifulsoup4` only when a conversion runs, so `--help` remains usable without them. Install with `pip install requests beautifulsoup4`. `curl_cffi` is optional; when installed it is preferred for Chrome-like TLS impersonation on sites that block the default Python TLS fingerprint. Pillow is optional for WebP-to-PNG conversion. JavaScript-rendered or access-controlled pages may need a browser-based workflow; this Python converter does not guarantee those pages will render or convert.

The separately maintained Node converter, if present in a deployment, has its own CLI and dependency contract. It is not covered by the Python receipt contract described here.
