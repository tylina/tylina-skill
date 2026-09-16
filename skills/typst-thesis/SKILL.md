---
name: typst-thesis
description: Create or review institution-governed Typst theses and dissertations with compliant front matter, stable chapters, scholarly apparatus, review variants, and print-ready submission output.
---

# Typst Thesis

Compose this Skill with Typst Authoring, Academic Writing, and Long-form Writing. Use it for a
degree thesis or dissertation, not an ordinary venue paper, report, or book.

## Entry Modes

- `write`: create or revise a thesis around the supplied degree, institution, regulations,
  evidence, and submission target. Run the Typst Authoring workspace intent gate before creating
  or replacing a document.
- `review`: compare the current project with supplied institutional requirements and inspect its
  scholarly structure and physical output. Report unsupported compliance claims; do not edit
  unless requested.
- `reconstruct`: when the user supplies an institutional PDF, DOCX, or existing thesis project,
  recover verified requirements and reusable structure without treating extracted appearance as
  authoritative semantics. This mode still obeys the Authoring workspace intent gate.

## Contract

1. Establish the institution, degree, department, language, submission date, print or electronic
   target, and authoritative current regulations before choosing or changing a template.
2. Distinguish official requirements from template defaults and author preferences. A community
   template is a candidate implementation, never proof of institutional acceptance.
3. Preserve an existing thesis scaffold, chapter graph, bibliography keys, labels, assets, package
   versions, and review/final switches. Do not recreate its appearance manually.
4. Never invent identity fields, declarations, approvals, signatures, committee members,
   acknowledgements, research evidence, citations, identifiers, or submission metadata.
5. Keep front matter, main matter, references, and appendices semantic. Preserve required roman and
   arabic numbering transitions, lists, running matter, blank-page policy, and binding geometry.
6. Produce blind-review, draft, print, and final variants from shared canonical content when the
   selected template supports them. Do not leak hidden identity through metadata or resources.
7. Validate the complete document and inspect every page class, not only a representative body
   page. Do not claim archival, accessibility, or institutional compliance without matching proof.

## Workflow

1. Read the current main, include graph through real source/compiler evidence, bibliography,
   assets, and existing template guide.
2. Read [references/template-selection.md](references/template-selection.md) for the paper/thesis
   boundary, requirement gate, and current template discovery route.
3. If the user supplied a PDF, DOCX, or reference project, read
   [references/source-reconstruction.md](references/source-reconstruction.md). Import supported
   source documents through `document.import`, keep the original artifact, and verify extracted
   evidence against its pages before authoring Typst.
4. For a new thesis with no selected scaffold, call `template.list` with `thesis` plus the
   institution, degree, and language. Inspect exact candidates, then materialize the selected
   version with `template.create`. Do not copy only an entrypoint.
5. Map every required section and variant to the selected template. Record unresolved regulations
   as review items instead of guessing layout or legal text.
6. Author one representative front-matter page, chapter, figure/table, citation, and appendix path;
   validate before scaling the structure.
7. Validate the complete main, inspect title/front-matter transitions, chapter openings, lists,
   references, appendices, odd/even margins, blank pages, and the final page, then export only the
   requested deliverable.

## Progressive Resources

- Template and package evidence order:
  `typst-authoring/references/templates-and-packages.md`.
- Scholarly claims and citation integrity: `typst-academic/SKILL.md` and
  `typst-research/SKILL.md` when available.
- Chapter structure and long-document boundaries: `typst-longform/SKILL.md`.
- Supplied PDF or Office evidence:
  `typst-authoring/references/source-ingestion.md` and
  [references/source-reconstruction.md](references/source-reconstruction.md).
