# Glossarium — Glossaries and Acronyms

**Package**: `@preview/glossarium:0.5.10`  
**Category**: Long-form document structure  
**Typst Universe**: <https://typst.app/universe/package/glossarium>  
**Repository**: <https://github.com/typst-community/glossarium>  
**License**: MIT

## Verified Boundary

Glossarium 0.5.10 registers glossary entries, expands a term on first use, uses its short form on
later uses, supports plural and capitalization variants, and prints a filtered or complete
glossary with optional back-references.

It does not decide which terms deserve entries, define an acronym, or verify a definition. Treat
keys, expansions, descriptions, grouping, and custom fields as source content.

## Minimal Usage

```typst
#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls

#show: make-glossary
#let terms = (
  (
    key: "api",
    short: "API",
    long: "application programming interface",
    description: "A defined interface through which software components communicate.",
  ),
)
#register-glossary(terms)

The #gls("api") is described here. Later, #gls("api") uses the short form.

= Glossary
#print-glossary(terms)
```

`#show: make-glossary` must be installed before glossary references. User-defined global figure
show rules can conflict with Glossarium's internal entries; place such rules before
`make-glossary`, or narrow them with selectors such as `figure.where(kind: image)`.

## Selection Guidance

- Use native definitions or a normal list for a few terms that do not need first-use expansion,
  cross-links, filtering, plural handling, or a generated glossary.
- Use Glossarium for a maintained glossary with descriptions and document references.
- Consider Abbrev when the task is narrowly about abbreviation expansion and its exact current
  API better fits the document; consider Glossy when a simpler glossary model is sufficient.
- Preserve an existing glossary package and its keys instead of migrating merely because this
  recipe is available.

## Authoring and Verification

- Keep keys stable once referenced. Renaming a key requires updating every semantic reference.
- Supply `plural` and `longplural` when automatic English `s` pluralization is wrong. Do not let
  the package invent morphology for another language.
- By default, unreferenced terms are omitted. Use `show-all: true` only when the requested glossary
  is meant to include registered but unused terms.
- Inspect first and later use, capitalization, plurals, grouping, back-references, page breaks, and
  conflicts with existing show rules.
- Read the exact 0.5.10 documentation before using custom printers, custom fields, or non-default
  shorthand sets.
