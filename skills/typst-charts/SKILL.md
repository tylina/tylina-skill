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

## Workflow

1. State the question the chart must answer and inspect the complete supplied dataset.
2. Prefer a table when exact lookup matters more than pattern comparison. Otherwise choose a
   chart family by data semantics, not decoration.
3. Search `_shared/charts/index.json` for the smallest matching
   compile-verified recipe. Read only that recipe's source and its package documentation.
4. Reuse the workspace's existing chart package and version when present. For a new package,
   select from `_shared/packages/index.json` and copy only the needed
   pattern into the workspace.
5. Preserve every value, unit, category, series, ordering, uncertainty, and source. Do not
   smooth, aggregate, truncate, or rescale data silently.
6. Validate and inspect the chart at its actual output size. Check axes, labels, legends,
   contrast, overlap, clipping, zero baselines where meaningful, and misleading encodings.

## Selection Guide

- Position and length are preferred for quantitative comparison.
- Use line or area charts for ordered trends, bar charts for category comparison, scatter
  plots for relationships, and distribution plots only when the underlying distribution is
  available.
- Do not use pie, donut, 3D, dual-axis, or decorative charts unless they materially clarify
  the user's question and survive visual review.
- Keep chart styling aligned with the document or slide theme rather than introducing an
  unrelated palette.
