# Newspaper WeChat cover

A 900×383 WeChat article header adapted from the local
`themes/custom-canvas/newspaper` system and the strong cover hierarchy visible in `local/ppt-master`'s newspaper examples.

- `template.typ` owns the press texture, black side fields, red registration marks, and reusable three-question rail.
- `demo.typ` supplies a complete weekly-review headline rather than placeholder copy.
- One inline SVG carries only the non-semantic print atmosphere and structural rules. Headline, deck, questions, and metadata remain native Typst content.

Compile from this directory:

```bash
typst compile demo.typ newspaper.png --ppi 144
```
