# Literature Evidence Workflow

Read this only for literature discovery, source ingestion, citation import, or citation audit.

## Research Question and Search Record

Write down the question, population or domain, outcome or concept, date window, languages, source
types, and exclusions. Keep each search query and index visible enough to repeat. Prefer publisher,
repository, DOI, arXiv, standards-body, and official dataset pages over aggregators.

For each retained source, record:

- canonical DOI or arXiv identifier and the exact version inspected;
- title, authors, venue or repository, year, and stable URL;
- inspected pages, sections, figures, tables, or theorem labels;
- the exact claim it supports, contradicts, or leaves unresolved;
- limitations, population, method, and whether full text was available.

## DOI, arXiv, and Bibliography Gate

Tylina's Citation Manager can resolve DOI and arXiv identifiers, propose a key, detect canonical
identifier duplicates across known bibliography files, append a BibLaTeX record, and insert an
actual Typst citation. Use that workflow when it is available to the user. The Agent must still
inspect the returned metadata and must not treat a successful lookup as evidence for a claim.

When editing bibliography files directly, use authoritative metadata from the source record.
Preserve existing keys and hand-corrected fields. Before adding a record, compare canonical DOI,
canonical arXiv identifier, and then authors/title/year. Never merge records solely because their
titles look similar.

After editing, verify all of the following:

1. every new `@key` exists in a bibliography loaded by the current compiled document;
2. every retained bibliography entry represents the intended work and version;
3. quotations include an inspected page or section when the source has stable pagination;
4. bibliography warnings and unresolved labels are not hidden by a last-successful preview;
5. the bibliography renders in the selected style and no source was cited without inspection.

## PDFs and OCR

For a PDF, DOCX, PPTX, or XLSX already in the workspace, first read
`typst-authoring/references/source-ingestion.md` and use `document.import`. This shared Web, DSH,
Electron, and standalone SDK path needs no Python. Preserve its source artifact, receipt, warnings,
page count, and OCR policy with the working evidence record.

Prefer embedded PDF text when its reading order and characters survive a sample comparison with
the rendered pages. OCR is a fallback for scans, not an authority: retain the original PDF, page
number, extraction method, and uncertain spans. Compare equations, tables, footnotes, ligatures,
hyphenation, and multi-column order visually before quoting or converting them.

Do not turn extracted text directly into canonical prose. Keep three layers separate:

- immutable source artifact;
- extracted or OCR text with page provenance and confidence;
- authored synthesis in Typst.

If the active host cannot extract or render the supplied artifact, report that limitation and ask
for accessible text or pages. Do not simulate OCR or fill unreadable characters from context.

## Evidence Table

Use a working table with columns such as `source`, `location`, `method`, `claim`, `support`,
`limitations`, and `key`. It is a research aid, not necessarily part of the final document.
Conflicting results stay as separate rows until the difference in population, method, measure, or
version is explained.
