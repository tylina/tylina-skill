# CeTZ — Custom Typst Drawings

**Package**: `@preview/cetz:0.5.2`  
**Category**: Diagram  
**Typst Universe**: <https://typst.app/universe/package/cetz>  
**Repository**: <https://github.com/cetz-package/cetz>  
**License**: LGPL-3.0-or-later

## Verified Boundary

CeTZ 0.5.2 provides a Typst-native canvas and drawing primitives inspired by TikZ and Processing.
This recipe verifies `cetz.canvas` together with the public `cetz.draw` primitives `circle`, `line`,
`content`, and `rect`. They cover small custom illustrations whose geometry is clearer as explicit
coordinates than as a graph, sequence diagram, or Mermaid source.

CeTZ does not infer entities, relationships, measurements, or drawing geometry from prose. Keep
semantic data outside the canvas when practical, and do not treat a visually plausible scientific
figure as evidence that its labels, scale, or relationships are correct.

## Minimal Usage

```typst
#import "@preview/cetz:0.5.2"

#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.35, fill: blue.lighten(70%))
  line((0.4, 0), (3.6, 0), mark: (end: "stealth"))
  content((2, 0.35), [$f(x)$])
  rect((3.6, -0.45), (5, 0.45), radius: 0.1, fill: green.lighten(75%))
  content((4.3, 0), [Output])
})
```

Coordinates use the canvas coordinate system. A relative coordinate such as `(rel: (1, 0))`
starts from the current point; an ordinary tuple such as `(1, 0)` is absolute.

## Selection Guidance

- Keep native Typst for ordinary document layout or a few boxes that do not need a canvas.
- Use Fletcher for semantic node-and-edge graphs and Chronos for sequence diagrams.
- Preserve Mermaid source and use Merman when Mermaid is the intended interchange format.
- Use CeTZ for custom geometry, annotations, or scientific illustrations that need direct drawing
  control and remain editable as Typst source.

## Web Compatibility and Limits

CeTZ 0.5.2 is implemented in Typst and requires Typst 0.14.0 or newer. It has no native-process or
WebAssembly-plugin dependency, so it follows the same package-fetch and compilation path in Web and
native Tylina. The package still has to be available through the host package provider.

Large canvases, deep loops, and many paths can increase compile time. Keep reusable data and styles
outside repeated draw calls, bound generated element counts, and inspect clipping, label overlap,
stroke scale, and export output at the intended physical size. For primitives beyond this verified
subset, consult the exact 0.5.2 manual rather than assuming a newer API.
