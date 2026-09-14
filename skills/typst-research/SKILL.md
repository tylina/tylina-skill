---
name: typst-research
description: Research, organize, and audit literature for Typst documents using traceable DOI, arXiv, bibliography, quotation, and page-level evidence without inventing sources.
---

# Typst Literature Research

Compose this Skill with Typst Academic and Typst Authoring.

## Entry Modes

- `research`: build or update a traceable literature set, evidence map, related-work section,
  annotated bibliography, or research note from a defined question.
- `audit`: inspect existing citations and claims for missing, duplicate, unsupported, stale, or
  unreachable evidence. Do not edit in this mode unless requested.

## Contract

1. Establish the question, scope, date range, source types, and inclusion or exclusion criteria.
2. Search primary scholarly indexes and original papers when current Web research is available.
   Treat search snippets, generated summaries, and citation graphs as discovery clues only.
3. Never invent a paper, author, venue, year, DOI, arXiv identifier, quotation, page, citation key,
   or finding. Keep absence of evidence visible.
4. Record a canonical DOI or arXiv identifier when one exists, plus the exact source URL and the
   access date for mutable Web evidence. Keep page or section anchors for quotations and claims.
5. Reuse existing bibliography files and keys. Deduplicate by canonical DOI, arXiv identifier,
   then normalized bibliographic identity; a matching title alone is not enough to overwrite.
6. Separate what a source reports from your synthesis. Mark disagreements, limitations,
   retractions, corrections, and inaccessible full text explicitly.
7. Cite only sources actually inspected. Do not cite a review as if it were the primary result.
8. Validate the Typst document and run a missing-citation audit after source changes.
9. Treat Openverse and other stock-image catalogs as illustration sources only, never scholarly
   evidence. If an external illustration is requested, follow
   `tylina/references/image-sourcing.md` and keep its attribution separate from citations.

## Workflow

1. Read `references/literature-workflow.md` for evidence acquisition, PDF handling, and the
   bibliography gate.
2. Inspect the current source, every bibliography file used by the compiled document, and the
   claims or section being researched.
3. For workspace PDF or Office evidence, use the portable import gate in
   `typst-authoring/references/source-ingestion.md`. Preserve the binary and review extraction
   warnings before treating its Markdown as evidence.
4. Build a compact evidence table before prose: source identity, inspected location, relevant
   claim, support strength, limitations, and intended citation key.
5. Import or author only verified bibliographic records. Preserve user-edited fields and explain
   conflicts instead of silently normalizing them.
6. Draft synthesis around agreements, differences, methods, and gaps rather than a paper-by-paper
   list. Keep claim scope no broader than the evidence.
7. Validate, inspect the bibliography output, and report unavailable sources or unresolved keys.

## Progressive Resources

- Evidence, DOI/arXiv, PDFs, OCR, and citation audit:
  `typst-research/references/literature-workflow.md`.
- Portable PDF and Office extraction contract:
  `typst-authoring/references/source-ingestion.md`.
- Typst bibliography syntax: route through `_shared/docs/index.json` to the official bibliography
  reference.
- Venue template or package: use `template.list`, `package.list`, then read only the selected
  returned Skill and recipe paths.
