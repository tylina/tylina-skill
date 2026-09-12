# pasquino Example

This example uses [`@preview/pasquino:0.1.0`](https://typst.app/universe/package/pasquino/).
The upstream project is MIT-0-licensed and maintained at
[`camilo-zuluaga/pasquino`](https://github.com/camilo-zuluaga/pasquino).

`demo.typ` preserves pasquino's opinionated 75 × 100 cm, two-column `poster` and `section` model.
It demonstrates a quiet editorial hierarchy, restrained gradient banner, paired field evidence,
native data bars and table, claim boundary, stop rule, and a compact edge footer. The content is a
fictional curbside-air pilot, not a real study.

```bash
typst compile demo.typ output.pdf
typst compile demo.typ output.png --ppi 48
```

The package prefers TeX Gyre Heros or Liberation Sans for sans text and Libre Baskerville or Linux
Libertine for display text, with Arial and Times New Roman fallbacks. Missing optional families
produce warnings but do not block compilation. Because fallback metrics differ, inspect the final
render before changing section density.

The example compiled as one page with Typst 0.15.0 during maintenance. Replace all fictional data
and entities, review the pinned package and MIT-0 terms, and perform full-size, thumbnail, font,
citation, link, image-resolution, and print checks.
