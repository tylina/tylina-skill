---
name: typst-academic
description: Create or review evidence-aligned academic Typst documents with grounded claims, citations, equations, figures, tables, and reproducible structure.
---

# Typst Academic Writing

Compose this Skill with the bundled Typst Authoring Skill.

## Entry Modes

- `write`: create or revise the paper around its intended contribution and audience. Run the
  Typst Authoring workspace intent gate before whole-document creation or replacement. A blank
  draft still requires a contribution, audience, and supplied evidence; preserve a populated
  paper unless replacement is explicit.
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

## Workflow

1. Read the relevant source, bibliography, figures, tables, and neighboring claims.
2. State what is supported, unsupported, ambiguous, or missing before broad revision.
3. Make only requested changes and preserve terminology and mathematical notation.
4. Validate the document and visually inspect every affected figure, table, equation, and
   page transition.

Typst bibliography accepts BibLaTeX and Hayagriva data and cites entries with `@key`. Verify
uncertain behavior against the official Typst bibliography reference.
