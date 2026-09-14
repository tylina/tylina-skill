# Eggs — Linguistic Examples and Glosses

**Package**: `@preview/eggs:0.9.0`  
**Category**: Linguistics  
**Repository**: <https://github.com/retroflexivity/typst-eggs>  
**License**: MIT

## Verified Boundary

Eggs 0.9.0 typesets numbered examples, subexamples, interlinear gloss lines, judgments, labels,
references, trailing citations, and tracked Leipzig-style abbreviations. Its concise syntax treats
enumerated list items inside `example` as subexamples and bullet lists as gloss lines after the
global `#show: eggs` rule is installed.

The package aligns and numbers supplied linguistic data. It does not segment, gloss, translate,
judge, or analyze a language.

## Minimal Usage

```typst
#import "@preview/eggs:0.9.0": *
#import abbreviations: pl, ins
#show: eggs

#example[
  + - primer  s    gloss-ami
    - example with gloss-#pl.#ins
    'an/the example with glosses' #ex-label(<gl>)
  + \*example without glosses
]

See @gl.
```

Use explicit `subexample` and `gloss` when ordinary lists must remain ordinary; set
`auto-subexamples: false` or `auto-glosses: false` on `example` as documented.

## Selection and Safety

- Preserve object-language text, morpheme boundaries, capitalization, gloss abbreviations,
  judgments, translations, sources, and labels byte-for-byte unless a supported change is requested.
- A leading `*` or other recognized judge carries linguistic meaning. Do not treat it as list syntax
  or typography noise.
- Maintain the project's abbreviation definitions and reference scheme. Do not silently reinterpret
  an unfamiliar abbreviation.
- Inspect long glosses, nested examples, continuations, mixed scripts, and page boundaries.
- Read `typst-linguistics/references/linguistic-notation.md` before transforming language data.
