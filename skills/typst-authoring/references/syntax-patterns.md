# Typst Syntax Patterns

Use these patterns as a lookup aid, then validate them with the workspace's real compiler.
They are adapted from Tinymist's canonical grammar examples and the progressive reference
structure of `claude-skill-typst`.

## Markup

```typ
= Heading
== Subheading

*Strong*, _emphasis_, and `inline raw`.

- Bullet
+ Numbered item
/ Term: Definition

#figure(
  image("asset.png", width: 70%),
  caption: [Source-backed caption],
) <figure-label>

See @figure-label.
```

Typst strong uses one `*` on each side. Headings use `=`, not Markdown `#`.

## Content and Code Modes

Inside `[...]`, prose is markup and embedded code needs `#`:

```typ
#block(inset: 8pt)[
  Text with #strong[semantic content].
  #align(center)[Centered content]
]
```

Inside `{...}` and function argument lists, expressions are already code:

```typ
#let panel(body) = {
  block(width: 100%, inset: 8pt, body)
}
```

Do not add `#` mechanically. Every edit must respect the actual syntax mode reported by
the parser/compiler.

Use `#(...)` when a compound code expression needs an explicit boundary inside markup, and use
`#{...}` for multiple code statements. To return from code to markup, use `[content]`. For the
complete boundary matrix, read `_shared/docs/typst/language-modes.md`.

## Values and Multi-File Structure

Typst has arrays and dictionaries, not tuples. Both use parentheses; a colon distinguishes a
dictionary, while square brackets always create content:

```typst
#let items = (1, 2, 3)
#let metadata = (title: [Measured response], draft: false)
#include "chapters/results.typ"
```

Keep one compile-validated entrypoint. Split files only when the document structure benefits,
and resolve paths relative to the importing source or the API's documented root behavior.

## Math

Do not paste LaTeX commands such as `\frac`, `\sum`, or `\mathbb` into Typst-native `$...$`
math. Preserve verified native math already in a working document. Default new formulas to the
pinned MiTeX recipe. Use native math only when already fluent in every exact Typst spelling and
expecting the first authored expression to validate; short or simple is not sufficient:

```typst
#import "@preview/mitex:0.2.7": *

Inline: #mi(`x^2 + y^2 = z^2`).

#mitex(`
  \operatorname{softmax}\left(\frac{QK^\top}{\sqrt{d_k}}\right)V
`)
```

Use raw content with backticks, not quoted strings. The examples above are in markup mode;
inside code mode call `mi(...)` or `mitex(...)` without `#`. Read
`_shared/packages/mitex/README.md` and `_shared/packages/mitex/demo.typ` before adding the import.

Never imitate a formula with ordinary text, a quoted string, `#raw(...)`, code styling, or Unicode
superscript/subscript/operator lookalikes outside actual math content. A native display equation
has spaces inside its delimiters, such as `$ x^2 + y^2 $`. Compilation
does not establish mathematical correctness; compare the formula with the source and inspect it.

## Tables

```typ
#table(
  columns: (1fr, 2fr),
  align: (left, right),
  table.header([Item], [Value]),
  [Alpha], [10],
  [Beta], [20],
)
```

Use `table.cell(colspan:)` and `table.cell(rowspan:)` for semantic spans. Use `grid` for
layout, not for related data.

When a table is nested in another function's argument list, the nested call is already in code
mode:

```typ
#figure(
  table(columns: 2, [Item], [Value]),
  caption: [Source-backed caption],
)
```

Read `_shared/docs/typst/tables.md` before changing cell modes, spans, or a
provider-confirmed custom table.

## Labels, References, and Bibliography

```typ
== Result <result>

See @result and cite @source-key.

#bibliography("references.bib")
```

Keep labels attached to the semantic element they identify. Reuse bibliography files and
keys; never fabricate a reference record.

## Reusable Styling

```typ
#set text(size: 11pt)
#show heading.where(level: 1): set text(weight: "bold")

#let notice(body) = block(
  width: 100%,
  inset: 10pt,
  radius: 4pt,
  fill: luma(245),
  body,
)
```

Put repeated presentation in `set`, `show`, or a reusable function. Keep one-off content
structure in the document body. Use `set` to configure element defaults in scope; use `show` to
selectively style, transform, or replace matching elements. Place either rule before the content
it is intended to affect.

## Validation

Prefer Tylina's real provider tools:

1. `document.validate` for structured compile diagnostics.
2. `render.summary` for page count and geometry.
3. `render.overview` only to locate suspicious pages.
4. `render.page` for readable visual inspection.

HTML or raw SVG can be a diagnostic aid, but neither replaces the canonical Typst source or
rendered page review.
