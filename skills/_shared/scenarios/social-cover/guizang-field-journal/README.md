# Guizang Field Journal

A light 1242×1660 (3:4) photo-editorial cover informed by the field-journal and image-led
composition rules in `local/guizang-social-card-skill`.

- `template.typ` keeps the title off the photograph, uses a large framed image well, and closes with three evidence-aware notes.
- `demo.typ` supplies a complete conceptual weather observation without inventing a real location, altitude, or measured conditions.
- `assets/alpine-ridge.jpg` is an original AI-generated demo photograph. It contains no embedded text and is atmosphere, not documentary evidence.
- The paper grain and structural frame are one inline SVG; all copy and attribution remain native Typst.

Compile from this directory:

```bash
typst compile demo.typ guizang-field-journal.png --ppi 144
```

See `assets/SOURCES.md` for the asset prompt and provenance boundary.
