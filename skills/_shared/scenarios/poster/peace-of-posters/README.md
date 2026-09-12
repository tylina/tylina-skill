# peace-of-posters Examples

These examples use
[`@preview/peace-of-posters:0.6.0`](https://typst.app/universe/package/peace-of-posters/).
The upstream project is MIT-licensed and maintained at
[`jonaspleyer/peace-of-posters`](https://github.com/jonaspleyer/peace-of-posters).

The sources keep the package's real theme, layout, `title-box`, `column-box`, and `bottom-box` APIs,
but replace upstream subject matter and assets with complete fictional decision narratives.

| Entry | Canvas | Design intent |
|---|---:|---|
| `demo.typ` | A1 portrait | Adaptation of the official `pop-uni-fr-poster` starter; two-column field evidence, result, limitations, and footer |
| `demo-three-column.typ` | A0 landscape | Three-column decision poster; each column has a different job and meaningful final region |
| `demo-visual-first.typ` | A1 landscape | Hero-first composition using inline SVG for an abstract acoustic waveform while all labels and evidence remain native Typst |

```bash
typst compile demo.typ output.pdf
typst compile demo-three-column.typ three-column.pdf
typst compile demo-visual-first.typ visual-first.pdf
```

`stretch-to-next: true` is used only where a real final section should own the remaining vertical
field. It is not a universal requirement and must not be copied onto sparse or decorative boxes.
Remove it, move complete sections, or change the layout when the real content does not support the
same geometry.

The visual-first example demonstrates the SVG boundary: the waveform is non-semantic visual
geometry embedded with `image(bytes(...))`; the title, units, sample labels, method, outcome, and
limits remain editable Typst content. Use that split for textured fields and visual signatures, not
for authoritative charts or text.

All examples compiled as one page with Typst 0.15.0 during maintenance. Before delivery, replace
all fictional content, review the package version and MIT terms, and repeat full-size, thumbnail,
font, citation, link, image, and print checks.
