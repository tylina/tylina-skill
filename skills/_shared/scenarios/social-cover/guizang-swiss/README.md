# Guizang Swiss

A four-page 1080 × 1080 pt social carousel adapted from the local
`custom-canvas/guizang-swiss` theme.

- `template.typ` owns the IKB palette, inverse type hierarchy, page chrome, page-specific layouts,
  ledger components, and the inline SVG system diagrams.
- `demo.typ` owns the meeting-method copy and the four-page sequence.
- The demo is a proposed operating method, not a claim about measured productivity.
- Every page uses the same ratio and one accent. Display type stays light; small labels carry the
  stronger weights.
- Timeline step tuples accept `(time, title, explanation, output)`. The fourth field is optional;
  it anchors the concrete artifact produced by each time block.
- `swiss-close` keeps the decision ledger at the top and uses `next-*` parameters for a real
  follow-up action at the bottom. Do not remove that lower anchor unless another meaningful ending
  replaces it.

Compile the PDF or export ordered PNGs:

```bash
typst compile demo.typ carousel.pdf
typst compile demo.typ 'carousel-{p}.png' --ppi 72
```

Keep all pages at one ratio, preserve the page order, and replace the example copy before changing
the typography or grid.
