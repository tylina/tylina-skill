# Lovelace — Pseudocode

**Package**: `@preview/lovelace:0.3.1`

**Category**: Code / algorithm

**License**: MIT

## Verified Boundary

Lovelace 0.3.1 is an unopinionated pseudocode layout package. It does not parse a programming
language or know the semantics of `if`, `while`, assignment, invariants, or complexity. The author
supplies those tokens as Typst content; Lovelace owns indentation, optional numbering, line labels,
titles, and rule styling.

The package exports `pseudocode`, `pseudocode-list`, `no-number`, `with-line-label`, `indent`, and
`line-label`:

- `pseudocode-list` is the convenient markup API: numbered-list items (`+`) become numbered
  pseudocode lines, bullet-list items (`-`) become unnumbered lines, and nested lists become
  indentation levels;
- `pseudocode(..children)` is the direct API for content lines and explicit nested arrays produced
  by `indent`;
- `no-number(body)` suppresses a line number without removing the line;
- `with-line-label(label, body)` and `line-label(label)` attach semantic line labels;
- the main style parameters include `line-numbering`, `line-number-supplement`,
  `line-number-alignment`, `stroke`, `indentation`, `hooks`, `line-gap`, `booktabs`,
  `booktabs-stroke`, `title`, `title-inset`, and `numbered-title`.

## Minimal Usage

```typst
#import "@preview/lovelace:0.3.1": pseudocode-list, line-label

#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(
    booktabs: true,
    numbered-title: smallcaps[Binary search],
  )[
    + $l <- 0$
    + $r <- n - 1$
    + *while* $l <= r$
      + $m <- floor((l + r) / 2)$ #line-label(<midpoint>)
      + *if* $a_m = x$ *then return* $m$
      + *else if* $a_m < x$ *then* $l <- m + 1$
      + *else* $r <- m - 1$
    + *return* $-1$
  ],
) <binary-search>

See @binary-search; the midpoint calculation is @midpoint.
```

Wrap the block in `figure(kind: "algorithm")` when it needs a caption, number, label, or document
reference. `numbered-title` can then display the containing algorithm identity. Use `title` instead
when no figure counter should be involved.

The angle brackets belong to the label declaration: `line-label(<midpoint>)`. Refer to that line as
`@midpoint`, not `@<midpoint>`; the latter leaves a stray `@` in rendered prose. The reference already
includes the configured `line-number-supplement` (by default “Line”), so prose should not add another
literal “line” immediately before it.

## Authoring and Verification

- Keep keywords, identifiers, formulas, invariants, and termination conditions in editable content;
  the package will not validate them.
- Use real Typst math for mathematical expressions inside a line. Do not replace algorithm notation
  with raw code merely because the package is named pseudocode.
- Use bullet items for deliberately unnumbered explanatory or continuation lines; do not fake the
  effect with an empty number.
- Keep line labels stable when prose cites them. Inspect the rendered reference text after changing
  `line-numbering` or `line-number-supplement`; a successful compile alone does not prove that the
  reference text is useful.
- Tune `indentation`, `line-gap`, and wrapping locally before shrinking the whole document. Inspect
  long conditions, comments, deep nesting, line-number alignment, and page or slide fit.
- Reuse an existing pseudocode style and package version. A document that intentionally shows
  executable source should use a raw code block instead of Lovelace.
