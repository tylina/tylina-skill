---
name: typst-charts
description: Choose, author, and visually verify a Typst chart from supplied data using pinned native or package-backed recipes without distorting the comparison.
---

# Typst Charts

Compose this Skill with Typst Authoring.

## Entry Modes

- `build`: create or improve a chart for the user's actual comparison or trend question.
  A blank target still requires supplied data, units, and the intended comparison. Run the
  Typst Authoring workspace intent gate before creating a whole document.

## Domain and Resource Information

- Prefer a table when exact lookup matters more than pattern comparison. Otherwise choose a chart
  family by the comparison, trend, relationship, or distribution represented by the data.
- `_shared/charts/index.json` routes only to complete Touying simple-theme slide examples.
  They are not embeddable components. Use one only when the target is a Touying deck, read its
  exact `.typ` file, and adapt the chart body while retaining the current deck's own theme,
  imports, `#show` rule, title, and page setup. For other artifacts, start from the package recipe
  and demo returned by `package.list`. For the default Lilaq family, the local recipe is
  `_shared/packages/lilaq/README.md` with an artifact-neutral copyable example at
  `_shared/packages/lilaq/demo.typ`; they document verified axis, mark, and smoothing boundaries.
  Those bundled resources are sufficient for their demonstrated API, so do not inspect the
  package again unless the requested behavior is absent or uncertain. Existing workspace package
  versions win; use `package.list` only when a new dependency is warranted, then read its returned
  paths.
- The chart index's package labels describe the checked-in slide examples only; they are not
  current API or version evidence. For a package without a local recipe, use `package.list` and its
  exact returned demo before authoring.
- Preserve values, units, categories, series, order, uncertainty, and source. Smoothing,
  aggregation, truncation, rescaling, and derived values must remain explicit.
- Inspect affected charts at their actual output size for axes, labels, legends, contrast,
  overlap, clipping, meaningful baselines, and misleading encodings.

## Adaptive Workflow

1. Identify the question the chart must answer and inspect the complete supplied dataset.
2. Decide whether exact lookup calls for a table or whether a chart better exposes the intended
   comparison, trend, relationship, or distribution.
3. Reuse the workspace's current chart package and version. For a Touying deck, one focused
   `_shared/charts/index.json` slide can guide the chart body. Otherwise select a package recipe
   and demo through the package tools.
4. Keep every transformation explicit while authoring the smallest representation that answers
   the question.
5. Validate and inspect the chart at its real output size, including labels, legends, baselines,
   clipping, contrast, and any potentially misleading encoding.

## Selection Guide

- Position and length are preferred for quantitative comparison.
- Use line or area charts for ordered trends, bar charts for category comparison, scatter
  plots for relationships, and distribution plots only when the underlying distribution is
  available.
- Do not use pie, donut, 3D, dual-axis, or decorative charts unless they materially clarify
  the user's question and survive visual review.
- Keep chart styling aligned with the document or slide theme rather than introducing an
  unrelated palette.
- Make units, denominators, baselines, and uncertainty visible when they affect interpretation.
  Do not encode the only meaningful distinction by hue; add labels, markers, patterns, or direct
  annotations when color alone would be inaccessible or ambiguous.
