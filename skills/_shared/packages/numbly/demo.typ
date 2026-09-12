#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/numbly:0.1.0": numbly

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)
#set heading(numbering: numbly(
  "Appendix {1:A}.",
  "{1:A}.{2}.",
  "Step {3}.",
))

= Appendix Test

== Numbly Demo

Numbly lets you define custom heading numbering formats per level.

=== Basic Usage

```typst
#set heading(numbering: numbly(
  "Appendix {1:A}.",
  "{1:A}.{2}.",
  "Step {3}.",
))
```

=== Format Specifiers

- `{1}` — Level 1, arabic numbers (default)
- `{1:A}` — Level 1, uppercase letters
- `{1:a}` — Level 1, lowercase letters
- `{1:I}` — Level 1, roman numerals
