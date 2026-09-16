---
name: typst-academic
description: Create or review evidence-aligned academic Typst documents with grounded claims, citations, equations, figures, tables, and reproducible structure.
---

# Typst Academic Writing

Compose this Skill with the bundled Typst Authoring Skill.

## Entry Modes

- `write`: create or revise the paper around its intended contribution and audience. Run the
  Typst Authoring workspace intent gate before whole-document creation or replacement. A blank
  draft needs an intended contribution and audience. Factual claims and results require supplied
  evidence; without it, create only a clearly marked structure or outline, or request the missing
  material. Preserve a populated paper unless replacement is explicit.
- `review`: inspect claim clarity, evidence, structure, terminology, citation support,
  limitations, and presentation. Separate factual gaps from stylistic suggestions and do not
  edit unless requested. If neither the target nor attachments contain academic source, ask for it.

## Contract

1. Identify the intended contribution, audience, venue constraints, and supplied evidence.
2. Keep claims aligned with evidence. Distinguish results, interpretation, limitations, and
   future work.
3. Reuse existing bibliography files and citation keys. Never invent a citation, experiment,
   measurement, quotation, or result.
4. Preserve stable labels for headings, equations, figures, tables, theorems, and appendices.
5. Use semantic Typst structures before custom layout. Follow an existing venue template
   rather than recreating its appearance.
6. In `review` mode, separate correctness or support gaps from prose and presentation advice.
   Do not edit unless requested.

## Adaptive Workflow

1. Inspect the relevant source, bibliography, figures, tables, equations, and neighboring claims.
2. Separate supported claims, evidence gaps, ambiguity, and presentation problems before broad
   revision.
3. Continue the existing venue scaffold. For a new package-free paper, select and materialize one
   complete reviewed workspace from `_shared/scenarios/academic/index.json`.
4. Make the requested change while preserving terminology, notation, labels, citation keys, and
   the distinction between evidence and interpretation.
5. Validate the document and visually inspect every affected figure, table, equation, citation,
   and page transition.

## Tylina-Specific Information

- Continue an existing venue scaffold and its package versions. For a new package-free paper,
  reviewed workspaces are indexed at `_shared/scenarios/academic/index.json`; materialize the
  selected complete scaffold with `template.create` rather than copying only `main.typ`.
- Bibliography files, citation keys, figures, tables, and neighboring claims provide the evidence
  boundary for an edit. Unsupported or ambiguous claims remain visible instead of being polished
  into certainty.
- Validate source changes and inspect affected figures, tables, equations, citations, and page
  transitions. Compilation does not establish factual support.

Typst bibliography accepts BibLaTeX and Hayagriva data and cites entries with `@key`. Verify
uncertain behavior against the official Typst bibliography reference.

## Progressive Resources

- Offline paper workspace: `_shared/scenarios/academic/index.json` and
  `_shared/scenarios/academic/research-paper/README.md`.
- Literature discovery and citation integrity: `typst-research/SKILL.md`.
- Template and package workflow: `typst-authoring/references/templates-and-packages.md`.
