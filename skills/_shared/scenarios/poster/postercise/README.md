# postercise Better Poster Example

This example uses [`@preview/postercise:0.2.0`](https://typst.app/universe/package/postercise/).
The upstream project is MIT-licensed and maintained at
[`dangh3014/postercise`](https://github.com/dangh3014/postercise).

`demo.typ` imports the package's actual `themes.better` module and uses `poster-content`,
`poster-header`, `poster-footer`, `normal-box`, and `focus-box`. The 24 × 18 inch composition keeps
the Better Poster advantage intact: a full-height central result plane is readable at distance,
while the narrow left rail explains the study and the right rail owns interpretation, release, and
the visible fictional-data notice.

```bash
typst compile demo.typ output.pdf
typst compile demo.typ output.png --ppi 72
```

The quiet space in the upper right rail is structural, not an unfinished column: it preserves the
billboard result as the dominant page field and leads into a bottom-aligned interpretation block.
Do not force that rail to match the left rail with low-value text. If the real poster needs dense
methods or many figures, choose another postercise theme or a different package instead.

The package documentation notes limitations around bibliography rendering in some theme paths;
keep references explicit and verify them in the generated PDF. The example compiled as one page
with Typst 0.15.0 during maintenance. Replace all fictional content, review the MIT terms, and
repeat full-size, thumbnail, font, citation, link, and print checks.
