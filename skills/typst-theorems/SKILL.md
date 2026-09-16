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
3. If no theorem system exists, prefer native semantic structure for one-off content. The offline
   scaffold is indexed at `_shared/scenarios/theorem-proof/index.json`; inspect and materialize it
   through `template.create` instead of copying one file.
4. Use a package only when reusable numbering, styles, localization, or cross-references justify it.
   For Theorion, read the pinned recipe at
   `_shared/packages/theorion/README.md` and `_shared/packages/theorion/demo.typ` before use.
5. Keep labels on the semantic statement they identify and preserve existing references.
6. Validate the document and visually inspect statements, equations, proof endings,
   numbering, page breaks, and references.

## Mathematical Safety

- Do not invent a missing argument, silently strengthen an assumption, weaken a claim, or
  present an unverified derivation as a proof.
- In `review-proof` mode, identify gaps and counterexamples separately from typesetting changes.
- Preserve established notation. Distinguish inline and display math using actual Typst mode.
- Follow the Typst Authoring math integrity gate. Write new formulas in native Typst `$...$` math,
  preserve the workspace's established math style, and validate the result with the real compiler.
  Use MiTeX only for supplied LaTeX or an existing MiTeX-authored document. Never imitate math with
  raw, code, plain text, or Unicode lookalikes.

## Progressive Resources

- Offline statement/proof workspace: `_shared/scenarios/theorem-proof/index.json` and
  `_shared/scenarios/theorem-proof/proof-note/README.md`.
- Pinned reusable theorem system: `_shared/packages/theorion/README.md`.
