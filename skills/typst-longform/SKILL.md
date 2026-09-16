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
2. Establish audience, document type, expected scale, navigation, print or screen target, language,
   and publication constraints before choosing a scaffold.
3. Prefer semantic headings, figures, tables, outlines, bibliography, indexes, and reusable show
   rules. Do not simulate them with visual text or repeated manual layout.
4. Split files by stable authoring units, not arbitrary size. Keep one explicit main and avoid
   circular includes or global state hidden across chapters.
5. Never fabricate front matter, legal notices, identifiers, edition history, citations, quotes,
   or index terms. Preserve supplied provenance.
6. Validate incrementally and inspect chapter openings, floats, footnotes, cross-references,
   running heads, blank pages, widows/orphans, and final pagination.

## Workflow

1. Read `references/finished-forms.md` to map note, report, and book use cases to template search.
2. Inspect the current main, include graph through real source/compiler evidence, bibliography,
   assets, and the nearest representative chapter. Never infer structure with regexes.
3. If a new scaffold is requested, call `template.list`, inspect exact candidates, and materialize
   the selected version before authoring. Offline report and note workspaces are indexed at
   `_shared/scenarios/longform/index.json`. Continue an existing scaffold in place.
4. Define or preserve front matter, chapter order, navigation, reference policy, and reusable
   components; then author one representative section and validate it.
5. Scale the pattern without copy-pasted page furniture. Keep per-chapter content readable in
   source and keep global styling owned by the template or one focused module.
6. Validate the complete document and inspect boundary pages plus every changed page class.

## Progressive Resources

- Website-aligned note, report, and book forms: `typst-longform/references/finished-forms.md`.
- Offline report and note workspaces: `_shared/scenarios/longform/index.json`.
- Template and package workflow: `typst-authoring/references/templates-and-packages.md`.
- Literature and citations: `typst-research/SKILL.md` when that Skill is available.
- Institution-governed thesis or dissertation: `typst-thesis/SKILL.md` when available.
