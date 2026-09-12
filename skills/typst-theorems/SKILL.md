---
name: typst-theorems
description: Create and review semantic theorem, definition, lemma, example, equation, and proof structures in Typst without changing mathematical meaning.
---

# Typst Theorems and Proofs

Compose this Skill with Typst Authoring.

## Entry Modes

- `write-proof`: draft or improve a statement, derivation, or proof while preserving its
  intended claim and established notation. It may create content in a blank draft only when the
  user supplied the statement, assumptions, or intended result.
- `review-proof`: check assumptions, quantifiers, cases, inference steps, notation, and
  references. It requires an existing or supplied proof and does not edit unless requested.
  Do not silently change a statement to make its proof work.
- `write-theorem`: create or improve semantic definition, lemma, theorem, corollary, example,
  and proof blocks while reusing the workspace's theorem system. Preserve surrounding content;
  whole-document replacement still requires explicit intent.

## Workflow

1. Identify the precise statement, assumptions, notation, dependencies, and intended proof.
2. Reuse the workspace's theorem definitions or imported package. Never replace a working
   theorem system merely because another recipe is bundled.
3. If no theorem system exists, prefer native semantic structure for one-off content. Use a
   package only when reusable numbering, styles, localization, or cross-references justify it.
4. For Theorion, read the pinned recipe at
   `_shared/packages/theorion/README.md` and `_shared/packages/theorion/demo.typ` before use.
5. Keep labels on the semantic statement they identify and preserve existing references.
6. Validate the document and visually inspect statements, equations, proof endings,
   numbering, page breaks, and references.

## Mathematical Safety

- Do not invent a missing argument, silently strengthen an assumption, weaken a claim, or
  present an unverified derivation as a proof.
- In `review-proof` mode, identify gaps and counterexamples separately from typesetting changes.
- Preserve established notation. Distinguish inline and display math using actual Typst mode.
- Follow the Typst Authoring math integrity gate. Preserve valid native math already established
  by the workspace. Default new formulas to MiTeX. Use native `$...$` only when already fluent in
  its exact Typst spelling and expecting the first authored expression to validate; a short or
  simple formula is not sufficient. Never imitate math with raw, code, plain text, or Unicode.
