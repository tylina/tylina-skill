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
- `_shared/charts/index.json` routes to small compile-verified recipes. Existing workspace package
  versions win; use `_shared/packages/index.json` only when a new dependency is warranted.
- Preserve values, units, categories, series, order, uncertainty, and source. Smoothing,
  aggregation, truncation, rescaling, and derived values must remain explicit.
- Inspect affected charts at their actual output size for axes, labels, legends, contrast,
  overlap, clipping, meaningful baselines, and misleading encodings.

## Adaptive Workflow

1. Identify the question the chart must answer and inspect the complete supplied dataset.
2. Decide whether exact lookup calls for a table or whether a chart better exposes the intended
   comparison, trend, relationship, or distribution.
3. Reuse the workspace's current chart package and version. Otherwise select one focused verified
   recipe from `_shared/charts/index.json` or the package tools.
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
