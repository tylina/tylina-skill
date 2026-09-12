# chicv Demo

- Source template: [chicv 0.1.0](https://typst.app/universe/package/chicv/)
- Canonical source:
  [skyzh/chicv `template/cv.typ`](https://github.com/skyzh/chicv/blob/master/template/cv.typ)
- Registry snapshot:
  [Typst packages starter](https://github.com/typst/packages/blob/main/packages/preview/chicv/0.1.0/template/cv.typ)
- Upstream license: MIT.
- Local change: none. `demo.typ` is byte-identical to the canonical upstream file at the time of
  this maintenance pass.

chicv is intentionally a direct one-file starter rather than a package API. Copy `demo.typ`, edit
ordinary Typst markup, and keep the small `chiline`, continuation, and last-updated helpers visible.
Do not wrap it in a local theme, add YAML, or silently restyle the starter.

```bash
typst compile demo.typ output.pdf
```

The source names Linux Biolinum for headings. Install that family or deliberately choose another
font in the copied project; on the reviewed host Typst produced a fallback PDF and warned that Linux
Biolinum was unavailable. Replace the upstream identity, contact details, links, dates, and lorem
content before using this as a real CV.
