# Reconstructing a Thesis Template from Supplied Sources

Read this only when the user supplies or identifies a PDF, DOCX, existing project, or page images
as evidence for a thesis template, and no suitable existing template was found or the user
explicitly requested reconstruction. Supplying a reference document alone does not require a
rebuild. Do not fetch an institution's files or replace the current workspace unless the user has
authorized that scope.

## Establish the Source's Role

Classify each source before extracting rules:

- an official current regulation or blank template can support a requirement;
- an institution-maintained example can clarify an ambiguous rule;
- a community template is an implementation candidate;
- a completed thesis is only an example and may be old, noncompliant, or personally identifying.

Record its institution, department, degree, language, effective date, and publication status.
Appearance alone never proves a current requirement. Do not copy personal data, signatures,
declarations, licensed artwork, or thesis prose into a reusable template.

## Import Without Losing the Evidence Boundary

For a workspace PDF or DOCX, follow
`typst-authoring/references/source-ingestion.md` and use `document.import`. Keep the binary source
unchanged. Imported Markdown is a searchable evidence layer, not a layout model or canonical
Typst source.

Compare extracted headings, text, tables, formulas, page order, and footnotes with the original.
PDF reading order can be wrong, while DOCX import can omit or flatten images, charts, Office
formulas, fields, and embedded objects. Preserve every warning. If a required element is missing,
inspect supplied page images or ask for an accessible source instead of silently inventing it.

## Extract Rules, Not Coordinates

Build a requirements table with a source page or clause for each verified item:

- paper size, margins, binding edge, one/two-sided behavior, and blank-page policy;
- title and approval pages, abstracts, declarations, contents, and required lists;
- font evidence, hierarchy, spacing, indentation, captions, footnotes, and bibliography style;
- numbering for chapters, figures, tables, equations, appendices, and page-number transitions;
- running heads or feet, chapter-opening behavior, recto rules, and final-page constraints;
- blind-review, draft, print, electronic-deposit, metadata, and accessibility variants.

Prefer semantic Typst constructs and measurable page rules. Do not reproduce a PDF as positioned
text boxes or infer structure from visible text matching. Mark ambiguous or conflicting evidence
as an open review item.

## Optional Community Reference

When a concrete Typst thesis project would help, the Agent may inspect
[modern-nju-thesis](https://github.com/nju-lug/modern-nju-thesis). Open it only for a relevant
template-selection or reconstruction question. Its institution-specific rules, project structure,
and implementation choices are examples rather than defaults for the user's project.

## Build and Verify Incrementally

1. Implement page geometry and one representative page from each distinct page class.
2. Separate configuration from authored content; use explicit placeholders for unknown identity
   and legal text.
3. Validate with real Typst/Tinymist diagnostics and render the complete document.
4. Compare source and output side by side at title/front matter, numbering transitions, chapter
   openings, tables and figures, references, appendices, odd/even pages, and the last page.
5. Exercise every supported variant and check hidden identity, metadata, missing fonts, overflow,
   clipped content, blank pages, and page count.

Prioritize current institutional rules, semantic editability, and stable long-document behavior
over pixel imitation. State what remains uncertain and require a current official compliance check
before calling the result submission-ready.
