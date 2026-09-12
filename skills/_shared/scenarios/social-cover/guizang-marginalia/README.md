# Guizang Marginalia

A light 1242×1660 (3:4) essay card informed by the M11 marginalia structure in
`local/guizang-social-card-skill`.

- `template.typ` owns the warm paper, serif/italic title rhythm, long-form essay column, functional schedule margin, and closing strip.
- `demo.typ` supplies a complete reflective essay about intentional gaps in a workday.
- The subtle paper atmosphere is an inline SVG. Essay copy, schedule labels, and the closing statement remain native Typst.
- The right column is not filler: it is a second reading speed and must contain useful marginal information.
- Essay paragraphs keep their natural height. The flexible region sits between the prose and the
  `pull-*` note, so extra space reads as intentional pause instead of stretching every paragraph
  into an isolated band.

Compile from this directory:

```bash
typst compile demo.typ guizang-marginalia.png --ppi 144
```
