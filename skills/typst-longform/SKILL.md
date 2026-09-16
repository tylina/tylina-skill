---
name: typst-longform
description: Structure and verify long Typst notes, manuals, reports, and books with reusable templates, stable chapters, navigation, references, and print-ready pagination.
---

# Typst Long-form Writing

Compose this Skill with Typst Authoring. Use Typst Academic too when the document makes scholarly
claims or follows a venue.

## Entry Modes

- `write`: create or revise a book, manual, long report, or note collection around a
  supplied purpose, audience, source set, and delivery format.
- `organize`: restructure existing long-form source while preserving claims, references, labels,
  wording outside scope, and recoverable history.

## Contract

1. Treat the current source tree as canonical. Preserve existing template ownership, chapter
   boundaries, labels, bibliography keys, resource paths, and package versions.
2. Relevant scaffold criteria include audience, document type, expected scale, navigation, print
   or screen target, language, and publication constraints. Ask for missing criteria only when they
   materially change the choice.
3. Prefer semantic headings, figures, tables, outlines, bibliography, indexes, and reusable show
   rules. Do not simulate them with visual text or repeated manual layout.
4. Split files by stable authoring units, not arbitrary size. Keep one explicit main and avoid
   circular includes or global state hidden across chapters.
5. Never fabricate front matter, legal notices, identifiers, edition history, citations, quotes,
   or index terms. Preserve supplied provenance.
6. Validate incrementally and inspect chapter openings, floats, footnotes, cross-references,
   running heads, blank pages, widows/orphans, and final pagination.

## Structure and Template Information

- `references/finished-forms.md` distinguishes note collections, reports, manuals, books, and
  their relevant template searches. A thesis uses `typst-thesis` instead.
- Use real source/compiler evidence for the main and include graph; filenames, regexes, or document
  size do not establish chapter ownership.
- Continue an existing scaffold in place. New offline report and note workspaces are indexed at
  `_shared/scenarios/longform/index.json`; use the template tools for a selected complete scaffold.
- Stable authoring units, navigation, references, and global page furniture belong to the document
  or template model rather than copy-pasted chapter content.
- Validate the complete document and inspect changed page classes and long-range boundaries such as
  chapter openings, references, appendices, odd/even pages, and the final page when applicable.

## Adaptive Workflow

1. Use `references/finished-forms.md` to distinguish notes, reports, manuals, books, and their
   relevant template searches.
2. Inspect the current main, real include graph, bibliography, assets, template ownership, and a
   representative authoring unit without inferring structure from filenames or regexes.
3. Continue an existing scaffold. If a new one is requested, inspect and materialize one complete
   candidate before authoring.
4. Preserve or establish the relevant front matter, chapter order, navigation, reference policy,
   reusable components, and publication constraints; leave immaterial criteria unresolved.
5. Keep global styling in the template or one focused module and split source by stable authoring
   units rather than arbitrary file size.
6. Validate a representative changed unit early when the scaffold is unfamiliar, then validate the
   complete document. Inspect changed page classes and long-range boundaries such as openings,
   references, appendices, odd/even pages, and final pages.

## Progressive Resources

- Website-aligned note, report, and book forms: `typst-longform/references/finished-forms.md`.
- Offline report and note workspaces: `_shared/scenarios/longform/index.json`.
- Template and package workflow: `typst-authoring/references/templates-and-packages.md`.
- Literature and citations: `typst-research/SKILL.md` when that Skill is available.
- Institution-governed thesis or dissertation: `typst-thesis/SKILL.md` when available.
