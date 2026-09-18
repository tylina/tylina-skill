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

1. Template selection and compliance claims depend on the institution, degree, department,
   language, submission date, print or electronic target, and authoritative current regulations.
   Keep missing criteria explicit; do not guess them or claim compliance from a generic scaffold.
2. Distinguish official requirements from template defaults and author preferences. A community
   template is a candidate implementation, never proof of institutional acceptance.
3. Preserve an existing thesis scaffold, chapter graph, bibliography keys, labels, assets, package
   versions, and review/final switches. Do not recreate its appearance manually.
4. Do not present invented identity fields, declarations, approvals, signatures, committee
   members, acknowledgements, research evidence, citations, identifiers, or submission metadata
   as real. An explicitly requested blank scaffold may retain clearly labeled fields for later
   completion.
5. Keep front matter, main matter, references, and appendices semantic. Preserve required roman and
   arabic numbering transitions, lists, running matter, blank-page policy, and binding geometry.
6. Produce blind-review, draft, print, and final variants from shared canonical content when the
   selected template supports them. Do not leak hidden identity through metadata or resources.
7. Validate the complete document and inspect every page class, not only a representative body
   page. Do not claim archival, accessibility, or institutional compliance without matching proof.

## Template and Evidence Routes

- `typst-thesis/references/template-selection.md` distinguishes a thesis from a paper, identifies
  current requirement evidence, and links relevant current-template discovery.
- Existing workspace or institution-provided scaffolds come first. For a new scaffold,
  `template.list` can search `thesis` with the institution, degree, and language; inspect and
  materialize the selected exact candidate rather than rebuilding it from appearance.
- `typst-thesis/references/source-reconstruction.md` applies only when no suitable existing template
  is available or the user explicitly requests reconstruction. PDF or DOCX extraction remains
  evidence and must be checked against the original artifact.
- Unresolved regulations remain review findings. Validate the complete main and inspect the page
  classes and long-range transitions relevant to the selected template and submission variant.

## Adaptive Workflow

1. Inspect the current main, real include graph, bibliography, assets, existing template guide, and
   the institutional evidence already available.
2. Read `typst-thesis/references/template-selection.md` to distinguish thesis requirements from
   paper defaults and identify which missing criteria materially affect template choice or
   compliance.
3. Preserve an existing institution-provided or maintained scaffold. Otherwise search for one exact
   current candidate by institution, degree, and language, inspect it, and materialize it completely.
4. Read `typst-thesis/references/source-reconstruction.md` only when no suitable template exists or
   the user explicitly requests reconstruction from supplied PDF, DOCX, or source evidence.
5. Map verified requirements and requested variants to the selected template, keeping unresolved
   regulations and blank identity fields explicit rather than guessing.
6. Validate representative front matter, body structure, scholarly apparatus, and appendix paths
   early when the template is unfamiliar, then validate the complete main.
7. Inspect title/front-matter transitions, numbering changes, chapter openings, lists, references,
   appendices, odd/even margins, blank-page policy, and the final page as applicable, then export
   only the requested submission variant.

## Progressive Resources

- Template and package evidence order:
  `typst-authoring/references/templates-and-packages.md`.
- Scholarly claims and citation integrity: `typst-academic/SKILL.md` and
  `typst-research/SKILL.md` when available.
- Chapter structure and long-document boundaries: `typst-longform/SKILL.md`.
- Maintained glossary, acronym expansion, and back-references when required by the institution:
  `_shared/packages/glossarium/README.md`.
- Structural preflight for labels, references, captions, and uncited entries after compiler
  validation: `_shared/packages/sanity/README.md`. It cannot establish scholarly or institutional
  compliance.
- Supplied PDF or Office evidence:
  `typst-authoring/references/source-ingestion.md` and
  `typst-thesis/references/source-reconstruction.md`.
