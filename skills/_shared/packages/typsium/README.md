# Typsium — Chemical Formulas and Reactions

**Package**: `@preview/typsium:0.3.2`  
**Category**: Chemistry  
**Repository**: <https://github.com/Typsium/typsium>  
**License**: MIT

## Verified Boundary

Typsium 0.3.2 exposes `ce` for chemical formulas, reactions, isotopes, charges, aggregation states,
reaction arrows, and annotations. It accepts either a string or content. The renderer parses and
styles supplied notation; it does not identify substances, balance reactions, infer products,
validate conditions, or establish chemical correctness.

## Minimal Usage

```typst
#import "@preview/typsium:0.3.2": ce

#ce("2H2 + O2 -> 2H2O")
#ce("NaCl(aq) + He(g) + C(s)")
#ce("^227_90Th+")
#ce("A <=>[condition] B")
```

String form is convenient for compact supplied notation. Content form can embed styled Typst
content, including annotations above or below an arrow; inspect the exact API before combining it
with another package.

## Selection and Safety

- Preserve coefficients, formulas, brackets, isotope order, charge, phase, arrows, catalysts,
  solvents, temperature, energy, equilibrium direction, and yield exactly as supplied.
- Do not “fix” an unbalanced or unfamiliar reaction from plausibility. Flag it for domain review.
- Typsium has specific syntaxes for radicals, oxidation numbers, hydrates, particles, and arrow
  annotations. Read its 0.3.2 manual instead of guessing from a visual result.
- A successful compile proves accepted syntax, not chemical validity or laboratory safety.
- Read `typst-science/references/scientific-notation.md` for the evidence and review gate.
