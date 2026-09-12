# Chart Verification Workflow

## Contents

- [Trigger](#trigger)
- [Why Verify](#why-verify)
- [Process](#process)
- [Chart Type Checklist](#chart-type-checklist)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Trigger

After Step 7 compilation, when the deck contains data visualizations (charts from lilaq, gribouille, cetz-plot, primaviz, or cetz).

## Why Verify?

Typst charts are code-driven, so coordinates are mathematically correct IF the code is correct. However, LLMs still introduce:
- Wrong scale factors (e.g., max-y too low, clipping data)
- Mismatched axis labels vs data
- Incorrect data-to-visual mappings (wrong column assigned to axis)
- Unit errors (e.g., percentages displayed as decimals)
- Missing data points

---

## Process

### Step 1: Identify Charts

Grep `main.typ` for chart package usage:
- `lilaq` — bar, line, scatter, histogram
- `gribouille` — layered Grammar-of-Graphics plots, mapped aesthetics, statistical transforms
- `primaviz` — pie, donut, radar, funnel
- `cetz-plot` — custom plots
- `cetz` — diagrams, custom visuals

Build a list of chart slides:
```
Slide 5: bar chart (lilaq) — "Revenue by Quarter"
Slide 8: pie chart (primaviz) — "Market Share"
Slide 12: layered scatter + fit (gribouille) — "Growth Drivers"
```

If no chart package imports are found, output `verify-charts: no data-driven charts detected, nothing to verify` and stop.

### Step 2: Extract Data

For each chart, identify:
- Source data (from `content_design_spec.md` §VI or inline in `main.typ`)
- Expected visual output (values, labels, proportions)
- Data format (raw numbers, percentages, currency)

### Step 3: Verify Code Logic

For each chart, check:
- [ ] All data points present (count matches source)
- [ ] Axis ranges accommodate all data (no clipping)
- [ ] Labels match data headers
- [ ] Units are consistent (%, raw numbers, currency)
- [ ] Scale is appropriate (values readable, not too compressed)
- [ ] Colors match theme palette (reference `template.typ` color definitions)
- [ ] Package API is used correctly (correct function signatures)

### Step 4: Visual Verification

After compilation, inspect the chart in the output PNG:
- [ ] All bars/lines/slices visible
- [ ] Legend matches actual data series
- [ ] No overlapping labels
- [ ] Proportions look reasonable (e.g., 50% value takes ~half the chart)
- [ ] Text is legible at presentation scale

### Step 5: Fix Protocol

If issues found:
1. Fix the data/code in `main.typ`
2. Recompile with `typst compile main.typ`
3. Re-verify the specific chart
4. Repeat until all checks pass

---

## Chart Type Checklist

### Bar Charts (lilaq / gribouille)
- Y-axis max >= largest value x 1.1 (headroom)
- Bar labels readable (not overlapping)
- Correct number of bars = number of categories
- Horizontal vs vertical matches the data semantics

### Pie/Donut Charts (primaviz)
- All slices sum to 100% (or total stated value)
- Largest slice matches largest value
- Legend has all categories
- Slice order is consistent (typically descending by value)

### Line Charts (lilaq / gribouille / cetz-plot)
- All data points plotted (count X-axis ticks)
- Lines don't extend beyond data range
- Trend direction matches data
- Multiple series are distinguishable (color/dash)

### Radar Charts (primaviz)
- All axes present with correct labels
- Max value on each axis accommodates the data
- Polygon vertices at correct proportional distances from center

### Flowcharts / Diagrams (merman / fletcher / cetz)
- All nodes present from the spec
- Connections match the described relationships
- Arrow directions are correct
- Labels are readable and correctly placed

---

## Inputs
- `main.typ` chart code sections
- `content_design_spec.md` §VI source data
- Compiled PNGs of chart slides

## Outputs
- Verified/fixed chart code in `main.typ`
- Recompiled output if fixes applied
- Brief verification receipt:

```
verify-charts: slide 5 bar chart | data=correct | scale=correct | labels=fixed (typo)
verify-charts: slide 8 pie chart | data=correct | proportions=correct | no issues
verify-charts: slide 12 line chart | data=fixed (missing Q4 point) | recompiled
```
