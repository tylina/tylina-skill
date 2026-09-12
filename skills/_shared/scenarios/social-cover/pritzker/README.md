# Pritzker social cover

A 1242×1660 (3:4) architecture-and-culture cover adapted from the local
`themes/custom-canvas/pritzker` visual language and the image-led cover hierarchy used by `local/ppt-master`.

- `template.typ` owns the spatial field, bronze/ink palette, type hierarchy, and note components.
- `demo.typ` supplies a complete public-space observation cover.
- The axonometric building and page atmosphere are one inline SVG layer; the title, observation notes, and metadata remain editable Typst content.

Compile from this directory:

```bash
typst compile demo.typ pritzker.png --ppi 144
```
