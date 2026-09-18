---
name: typst-science
description: Create or review scientific and engineering Typst documents when quantities, units, chemical notation, circuits, or domain figures require source-faithful typesetting.
---

# Typst Science

Compose this Skill with Typst Authoring. Add Typst Academic or Typst Research when the artifact is
scholarly or makes literature-backed claims.

## Entry Modes

- `write`: create or revise a scientific report, lab handout, technical note, protocol, formula
  sheet, or engineering document from supplied evidence and requirements.
- `review`: inspect notation, units, figures, source fidelity, accessibility, and layout. Do not
  change scientific content unless requested and supported.

## Contract

1. Preserve supplied values, uncertainty, significant figures, units, constants, equations,
   chemical species, reaction conditions, circuit operations, labels, and sample identity.
2. Do not silently infer a missing measurement, balance or complete a reaction, repair an equation
   by plausibility, invent experimental evidence, or turn a package rendering into scientific
   proof. When the user explicitly requests a calculation, derivation, or balancing task, state its
   basis and assumptions and distinguish the new analysis from supplied evidence.
3. Keep quantities and domain notation semantic. Do not imitate subscripts, superscripts, unit
   spacing, arrows, structures, or circuit wires with decorative text or Unicode lookalikes.
4. Distinguish an observed result, a calculated value, a cited constant, and an assumption. Preserve
   provenance, precision, and transformation steps where they matter.
5. Treat safety, medical, environmental, regulatory, and engineering-compliance statements as
   evidence-bound content. A polished template is not a validation or certification.
6. Compile and inspect the actual artifact. Check equations, tables, plots, legends, units, figure
   labels, cross-references, line breaks, and grayscale or color-accessible interpretation.

## Typst and Package Information

- `typst-science/references/scientific-notation.md` routes quantities, chemistry, circuits, and
  other domain representations to their relevant Typst or package choices.
- Existing verified imports win. If the progressive resources name the exact needed capability,
  read that local recipe and demo directly. Otherwise use one focused `package.list` query and
  read the returned recipe or exact versioned documentation before using its API.
- Keep raw data and symbolic source editable when a renderer is involved. Compare changed notation
  with the supplied evidence and inspect it at final physical size.
- In review work, distinguish uncertainty in the scientific content from observable typesetting
  defects; a package rendering cannot resolve the former.

## Adaptive Workflow

1. Read the relevant part of `typst-science/references/scientific-notation.md` for the discipline
   and representation in use.
2. Inventory supplied data, formulas, units, symbolic source, references, figures, locale, output
   size, and current package imports.
3. Preserve verified imports. For a new capability, read a matching local recipe first; use one
   focused package search only when the curated routes are missing or insufficient, then inspect
   the selected exact version before using its API.
4. When analysis is requested, keep assumptions, transformations, rounding, and provenance visible
   and separate calculated values from observed or cited values.
5. Validate a representative difficult notation or figure early when the API is unfamiliar, keep
   raw data and symbolic source editable, and then apply the verified pattern.
6. Compare the result with supplied evidence, validate the complete document, and inspect every
   changed notation class at final physical size.

## Progressive Resources

- Package choice and notation boundaries: `typst-science/references/scientific-notation.md`.
- Quantities and uncertainty: `_shared/packages/unify/README.md` and its compile-verified
  `_shared/packages/unify/demo.typ` when exact range or uncertainty presentation matters.
- Scientific and engineering mathematics: `_shared/packages/physica/README.md` for vectors,
  derivatives, matrices, Dirac notation, tensors, and related semantic helpers.
- Chemical formulas and reactions: `_shared/packages/typsium/README.md`.
- Molecular structures from supplied SMILES: `_shared/packages/typed-smiles/README.md`.
- Quantum circuits: `_shared/packages/quill/README.md`.
- Conventional electronic circuits: `_shared/packages/zap/README.md` and
  `_shared/packages/zap/demo.typ`.
- Plots and diagrams: `typst-charts/SKILL.md` or `typst-diagrams/SKILL.md` when available.
