# Guizang Magazine

A 1242 × 1660 pt editorial social cover adapted from the visual language of the local
`custom-canvas/guizang-magazine` theme.

- `template.typ` owns the fixed canvas, palette, typography, issue chrome, route-note component,
  and the full-page inline SVG atmosphere.
- `demo.typ` contains only the example issue text and observation notes.
- The SVG carries non-semantic atmosphere and route geometry. All meaningful copy remains editable
  Typst content.
- The example is intentionally image-free and makes no measured claims; replace the conceptual
  route with sourced photography or evidence when the actual brief requires it.

Compile and inspect at feed size:

```bash
typst compile demo.typ cover.png --ppi 72
```

When adapting it, keep the display title to two or three short lines. Replace the copy before
shrinking the title or body below mobile-readable size.
