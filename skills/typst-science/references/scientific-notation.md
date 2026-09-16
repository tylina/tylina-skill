# Scientific Notation and Package Selection

Select by the canonical scientific representation, not by visual resemblance. Call `package.list`,
then read its routed recipe or verify the returned exact spec against official versioned
documentation before using any unpinned search seed.

## Representation Routing

| Need | Curated or searchable packages | Verify before use |
|---|---|---|
| Numbers, uncertainty, ranges, and units | `unify`; also search `zero`, `physica` | accepted input grammar, unit database, locale, uncertainty convention, exponent and range formatting |
| Chemical formulas and reactions | `typsium`; also search `alchemist` | formula grammar, isotope and charge order, reaction arrows, annotations, aggregation states, compiler requirement |
| Quantum circuits | `quill` | manual-grid versus Tequila model, wire count, classical wires, gate labels, measurement flow, package version |
| Electrical or signal diagrams | search `zap`, `cetz`, `circuiteria` | component semantics, connection ownership, labels, units, source editability, export behavior |
| Feynman or particle diagrams | search `fletcher`, `cetz`, `physica` | arrow meaning, particle labels, interaction topology, cited convention |
| Molecules and structures | search `typed-smiles`, `molchemist`, `modiagram`, `xyzrender-rustyp` | supported source format, stereochemistry boundary, projection, atom labels, whether geometry is calculated or only drawn |
| Laboratory and engineering drawings | search `patatrac`, `beam`, `invaria`, `mesa`, `bone` | actual discipline scope, coordinate model, scale, annotation API, standards and locale |
| Scientific plots | `lilaq` or `gribouille` through Typst Charts | source data, axis units, uncertainty display, transformations, legend and color accessibility |

The curated recipes fix `unify` 0.8.1, `typsium` 0.3.2, and `quill` 0.8.0. Their APIs were
checked against those exact packages. Other names are discovery seeds only.

## Quantities and Units

- Preserve the measurement string when its significant zeros, uncertainty, or exponent is
  meaningful. Do not round or convert units without an explicit rule.
- Keep a quantity's value and unit connected semantically, including ranges and asymmetric
  uncertainty. Verify whether a package expects strings, math content, or evaluated code.
- Confirm the document's decimal marker, thousands separator, unit language, and multiplication or
  division convention. `unify` 0.8.1 ships English and Russian unit names; do not assume another
  locale is localized merely because surrounding prose is.
- State conversion factors and source provenance when a requested conversion affects reported data.

## Chemical and Physical Notation

- Do not balance reactions, infer products, change stoichiometric coefficients, oxidation states,
  isotopes, phases, conditions, or charge from chemical plausibility alone.
- Distinguish a reaction arrow from equality or implication. Preserve labels above and below an
  arrow, including temperature, solvent, catalyst, energy, equilibrium, and yield.
- Keep variable symbols, vectors, operators, dimensions, and upright descriptive text consistent
  with the supplied convention. Compilation proves syntax, not dimensional correctness.

## Circuits and Scientific Figures

- A quantum-circuit renderer controls geometry; the supplied gate sequence and wire identity remain
  canonical. Check control/target direction, input states, measurements, classical wires, grouping,
  and multi-wire labels against the source.
- Preserve raw tabular data or symbolic diagram source in the workspace. Rendered SVG, canvas, PNG,
  and page geometry are views, not data.
- Give every axis a quantity and unit where applicable. Show uncertainty or sample size when the
  source requires it, and avoid a chart scale that visually overstates a difference.
- Inspect thin lines, subscripts, superscripts, symbols, and color encodings at final print and
  screen sizes. Provide text alternatives for figures that carry scientific meaning.
