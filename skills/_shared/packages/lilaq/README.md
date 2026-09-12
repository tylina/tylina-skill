# Lilaq — Typst-native Data Visualization

**Package**: `@preview/lilaq:0.6.0`
**Category**: Chart
**Repository**: <https://github.com/lilaq-project/lilaq>

## Description

Lilaq is a mature Typst-native plotting library for publication-ready line,
bar, scatter, area, distribution, contour, vector-field, and related plots. It
is the default implementation behind the existing SeaSlides statistical chart
templates.

## Usage in Touying Slides

Import it under the canonical `lq` abbreviation and compose marks inside
`lq.diagram`:

```typst
#import "@preview/lilaq:0.6.0" as lq

#lq.diagram(
  width: 560pt,
  height: 240pt,
  xaxis: (label: "Quarter"),
  yaxis: (label: "Revenue"),
  lq.plot((1, 2, 3, 4), (18, 25, 31, 44), label: "Revenue"),
)
```

## Selection Guidance

- Prefer Lilaq for SeaSlides' existing line, bar, scatter, area, box, and
  multi-axis templates.
- Prefer Gribouille when mapped aesthetics, statistical transformations, and a
  layered Grammar of Graphics are the natural model for the analysis.
- Set `xlim` and `ylim` on `lq.diagram`; do not put `min` or `max` inside axis
  dictionaries.
- Inspect axis labels and legends in the rendered PNG at presentation scale.

Read `_shared/charts/README.md` and the selected chart template
before authoring a production chart.
