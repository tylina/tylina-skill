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
2. Never infer a missing measurement, balance or complete a reaction, repair an equation by
   plausibility, invent experimental evidence, or turn a package rendering into scientific proof.
3. Keep quantities and domain notation semantic. Do not imitate subscripts, superscripts, unit
   spacing, arrows, structures, or circuit wires with decorative text or Unicode lookalikes.
4. Distinguish an observed result, a calculated value, a cited constant, and an assumption. Preserve
   provenance, precision, and transformation steps where they matter.
5. Treat safety, medical, environmental, regulatory, and engineering-compliance statements as
   evidence-bound content. A polished template is not a validation or certification.
6. Compile and inspect the actual artifact. Check equations, tables, plots, legends, units, figure
   labels, cross-references, line breaks, and grayscale or color-accessible interpretation.

## Workflow

1. Read `references/scientific-notation.md` for the relevant discipline and representation.
2. Inventory the supplied data, formulas, symbolic source, units, references, figures, locale,
   output size, and existing package imports before editing.
3. Preserve existing verified notation packages. For a new capability, call `package.list` with a
   focused discipline or query. Read the routed recipe when present; otherwise verify the returned
   exact spec against official versioned documentation before using its API.
4. Compile one representative quantity, formula, reaction, circuit, or figure before scaling the
   pattern. Keep raw data and domain source editable when a renderer is involved.
5. Compare the rendered result against the supplied evidence, then validate the complete document
   and inspect every changed notation class at its final physical size.
6. In `review` mode, report scientific-content uncertainty separately from typesetting defects.

## Progressive Resources

- Package choice and notation boundaries: `typst-science/references/scientific-notation.md`.
- Quantities and uncertainty: `_shared/packages/unify/README.md`.
- Chemical formulas and reactions: `_shared/packages/typsium/README.md`.
- Quantum circuits: `_shared/packages/quill/README.md`.
- Plots and diagrams: `typst-charts/SKILL.md` or `typst-diagrams/SKILL.md` when available.
