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

1. Keep the research question and scope explicit. Date ranges, source types, and inclusion or
   exclusion criteria are required when the user requests a bounded or systematic search, not for
   every small lookup.
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
10. A source-only citation audit does not require page rendering. Inspect rendered bibliography
    output only when appearance, ordering, pagination, or a source/render discrepancy is in scope.

## Evidence and Tool Information

- Read `typst-research/references/literature-workflow.md` when acquiring external evidence,
  resolving DOI/arXiv identities, reviewing PDFs, or changing bibliography data.
- Workspace PDF or Office evidence uses the portable import gate in
  `typst-authoring/references/source-ingestion.md`. The binary remains authoritative and extraction
  warnings remain visible.
- For a multi-source synthesis, a compact evidence table can connect source identity, inspected
  location, claim, support, limitations, and intended citation key. It is an aid, not a mandatory
  artifact for a simple lookup.
- Organize synthesis around agreements, differences, methods, evidence quality, and gaps. A
  paper-by-paper sequence fits an annotated bibliography, but usually obscures those relationships
  in a related-work section.
- Preserve user-edited bibliography fields and expose conflicts rather than silently normalizing
  them. After citation changes, validate and inspect missing keys and bibliography output.

## Adaptive Workflow

1. Inspect the current source, every bibliography used by the compiled document, and the claims or
   section being researched. Define formal inclusion criteria only when the task needs them.
2. Read `typst-research/references/literature-workflow.md` when acquiring evidence, resolving
   DOI/arXiv identity, handling PDFs, or changing bibliography data.
3. Search primary indexes and original papers. Import workspace PDF or Office evidence through the
   source-ingestion gate and preserve extraction warnings.
4. For multi-source synthesis, connect each claim to inspected evidence, support strength,
   limitations, and a stable citation key; a simple lookup need not create a separate evidence table.
5. Add or update only verified bibliographic records, deduplicate by canonical identity, and keep
   user-edited fields or visible conflicts.
6. Synthesize agreements, differences, methods, evidence quality, and gaps at the scope supported
   by the sources.
7. After a source change, validate the document and run the missing-citation audit. Inspect rendered
   bibliography output only when appearance, ordering, pagination, or a source/render discrepancy
   is in scope. For a source-only audit with no mutation, report unavailable sources and unresolved
   keys without adding validation or rendering work.

## Progressive Resources

- Evidence, DOI/arXiv, PDFs, OCR, and citation audit:
  `typst-research/references/literature-workflow.md`.
- Portable PDF and Office extraction contract:
  `typst-authoring/references/source-ingestion.md`.
- Typst bibliography syntax: route through `_shared/docs/index.json` to the official bibliography
  reference.
- Structural manuscript preflight after compiler validation:
  `_shared/packages/sanity/README.md` for labelled elements, reference order, captions, and
  uncited bibliography entries. It does not establish claim support.
- Venue template or package: when a curated exact route exists (for example the Charged IEEE
  recipe), read it directly. Otherwise use one focused `template.list` or `package.list` query,
  then read only the selected returned Skill and recipe paths.
