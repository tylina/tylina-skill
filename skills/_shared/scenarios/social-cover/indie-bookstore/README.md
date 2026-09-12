# Indie Bookstore

A separately composed WeChat cover pair adapted from the local
`custom-canvas/indie-bookstore` theme.

- Page 1 is a 900 × 383 pt article header.
- Page 2 is a 1080 × 1080 pt share square with a shorter title and rebuilt composition.
- `template.typ` owns the RISO palette, misregistration treatment, fixed canvases, fold/print SVG
  artwork, step strip, and metadata system.
- `demo.typ` owns the long title, short title, subtitle, and four process labels.
- The art layer is embedded SVG; meaningful copy remains Typst text.

Export the pair as separate PNGs:

```bash
typst compile demo.typ 'wechat-cover-{p}.png' --ppi 72
```

Do not crop the wide page into the square. Rewrite the square title and recompose both pages as a
pair whenever the topic changes.
