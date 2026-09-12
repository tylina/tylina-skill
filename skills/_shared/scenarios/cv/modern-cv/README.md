# modern-cv Demo

- Source package: [modern-cv 0.10.0](https://typst.app/universe/package/modern-cv/)
- Published template:
  [template directory](https://github.com/typst/packages/tree/main/packages/preview/modern-cv/0.10.0/template)
- Upstream license: MIT.
- Local adaptation: the official usage pattern is recomposed as one complete, asset-free demo.typ.
  Its public `font`, `header-font`, and `author.custom` options select IBM Plex Sans and a text-link
  contact row while preserving the package's header, section, entry, and footer system.

```bash
typst compile demo.typ output.pdf
```

The included entry requires IBM Plex Sans and compiled without font warnings in the reviewed
environment. The package's built-in `email`, `phone`, `github`, `linkedin`, and similar author
fields render Font Awesome icons; if you switch from the included text-only custom contacts to those
fields, install the documented Font Awesome 7 Free and Brands families before accepting the result.
The upstream defaults likewise name Source Sans 3 or Source Sans Pro and Roboto. A fallback PDF or
missing-icon box is not a visually verified build.
