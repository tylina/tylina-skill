# placard Examples

These examples use [`@preview/placard:0.1.0`](https://typst.app/universe/package/placard/).
The upstream project is MIT-licensed and maintained at
[`ant1isbusy/typst-placard`](https://github.com/ant1isbusy/typst-placard).

| Entry | Canvas | Design intent |
|---|---:|---|
| `demo.typ` | A1 portrait | Light two-column field test with native metric cards, bars, interpretation, and action route |
| `demo-dark.typ` | A1 landscape | Dark three-column operations audit with transfer windows, event logic, status accents, and a strong footer |

Both files use the actual `placard` and `card` APIs. They extend the short official starter into
fully populated examples without copying its package manifest.

```bash
typst compile demo.typ output.pdf
typst compile demo-dark.typ dark.pdf
```

The light example's `scaling: 1.20` and the dark example's `scaling: 1.00` are tuned for their exact
sample canvases and content. Treat scaling as a final fit control: first change section allocation,
column count, and visual proportions; do not respond to every overflow by shrinking the whole
poster.

The examples compiled as one page with Typst 0.15.0 during maintenance. Before delivery, replace
all fictional facts and contacts, review the pinned package and MIT terms, and inspect full-size and
thumbnail renders. Also verify font fallbacks, links, QR codes, figures, and print output.
