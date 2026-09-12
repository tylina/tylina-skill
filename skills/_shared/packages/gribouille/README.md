# Gribouille — Grammar of Graphics for Typst

**Package**: `@preview/gribouille:0.6.0`
**Category**: Chart
**Repository**: <https://github.com/mcanouil/gribouille>

## Description

Gribouille implements Wilkinson's Grammar of Graphics with a declarative API
inspired by ggplot2 and plotnine. Build a plot from data, aesthetic mappings,
layers, statistical transformations, scales, labels, and themes.

## Usage in Touying Slides

```typst
#import "@preview/gribouille:0.6.0": *

#plot(
  data: penguins,
  mapping: aes(x: "flipper-len", y: "body-mass", colour: "species"),
  layers: (
    geom-point(size: 2pt, alpha: 0.35),
    geom-smooth(method: "lm", se: true, alpha: 0.15),
  ),
  scales: scales(
    x: scale-continuous(),
    y: scale-continuous(),
    colour: scale-discrete(),
  ),
  labels: labels(x: "Flipper Length", y: "Body Mass", colour: "Species"),
  theme: theme-minimal(text: element-text(size: 16pt)),
  width: 20cm,
  height: 10cm,
)
```

## Selection Guidance

- Choose Gribouille for layered analytical plots, mapped aesthetics, fitted
  trends, statistical summaries, and workflows already shaped like a Grammar
  of Graphics.
- Choose Lilaq for existing SeaSlides chart templates or when direct control of
  marks and axes is simpler.
- Pin the catalog version and read the current documentation before authoring:
  Gribouille is in active development and its API is still settling.
- Compile a small probe before building a dense slide, then inspect labels,
  legends, and annotation contrast in the rendered PNG.
- Override the theme's root `text` element for projected output; the package
  defaults target documents and are usually too small for a room-scale slide.

Official documentation: <https://m.canouil.dev/gribouille>
