# Hexagon Mesh Theme — API Reference

## Overview

A presentation theme inspired by molecular structures, honeycomb patterns, and crystalline lattice geometry. Features hexagonal grid backgrounds, molecular bond dividers, vertex node decorations, and crystal cluster accents on light backgrounds. Suitable for chemistry, materials science, biotech, network architecture, and technology presentations.

**Touying version**: 0.7.4
**Entry function**: `hexagon-mesh-theme`
**Fonts**: Font-agnostic theme entry; the demo uses installed `IBM Plex Sans` and `IBM Plex Mono`
**Base size**: 18pt

---

## Theme Entry

```typst
#show: hexagon-mesh-theme.with(
  aspect-ratio: "16-9",       // "16-9" or "4-3"
  footer: [Footer text],      // Optional footer content
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)
```

---

## Slide Functions

### `title-slide()`
Full-page title with lattice frame bookend, hex mesh background, centered content.

### `slide(title: auto)`
Standard content slide with bond-divider header underline, persistent hex mesh atmosphere, crystal accent corners.

### `new-section-slide`
Section break with left teal accent bar, large section number, crystal accent decoration.

### `focus-slide(body)`
Dark slate background with hex mesh overlay, centered light text, corner node markers.

### `ending-slide(body)`
Closing slide with lattice frame bookend (shared with title), bond divider above text.

---

## Components (9)

### `hex-card(title, body, accent: palette.primary)`
Card with hexagonal pattern top border and hex-shaped node indicator beside the title. Use for general content blocks.

### `molecule-box(title, body, accent: palette.primary)`
Insight/highlight box with bond-line left decoration (three stacked molecular nodes). Use for key insights or callouts.

### `node-stat(label, value, color: palette.primary)`
Natural-height metric display with one centered orbital-marker → value → label `stack`. Use `grid` for regular KPI rows; this component does not participate in lazy height equalization.

### `lattice-quote(body, attribution: none)`
Quote block with crystalline left border and corner node decorations. Use for testimonials or citations.

### `atom-tag(content, color: palette.primary)`
Small capsule tag with orbital ring icon (circle with center dot). Use for labels and categories.

### `bond-divider(color: palette.primary, width: 80%)`
Molecular bond separator line with alternating single/double bonds and atom nodes. The `color` argument recolors its teal bonds and nodes; use it between content sections.

### `mesh-card(title, body, accent: palette.primary)`
Card with crystal accent decoration in top-right corner and colored border. Use for featured content blocks.

### `structure-box(title, body, accent: palette.secondary)`
Large box with connected-hex border (top slate, bottom teal) and hexagonal icon beside title. Use for detailed explanations.

### `electron-list(body, color: palette.primary)`
Scoped standard Typst list with an orbital ring marker and amber center. Write ordinary `- item` syntax inside the body; use it for feature lists or process steps.

---

## Color Palette

```typst
#let palette = (
  bg: rgb("#F9FAFB"),
  primary: rgb("#0D9488"),       // Teal
  secondary: rgb("#334155"),     // Dark slate
  accent: rgb("#D97706"),        // Amber
  text: rgb("#374151"),          // Cool grey
  text-muted: rgb("#6B7280"),
  card-bg: rgb("#FFFFFF"),
  primary-light: ...,
  accent-light: ...,
  secondary-light: ...,
  border: rgb("#D1D5DB"),
  node-color: rgb("#0D9488"),
  bond-color: rgb("#334155"),
)
```

---

## SVG Assets

| SVG | Purpose | Elements |
|-----|---------|----------|
| `_hex-mesh-bg-svg` | Full-page background | 20+ hexagons, bond lines, vertex nodes |
| `_lattice-frame-svg` | Title/ending bookend frame | Corner hex clusters, connecting lines, vertex nodes |
| `_bond-divider-svg` | Molecular bond separator | Single/double bonds, atom nodes, amber center |
| `_crystal-accent-svg` | Corner decoration cluster | 4 hexagons, bond lines, vertex nodes |

---

## Usage Examples

### Basic Content Slide
```typst
== Slide Title

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  hex-card([Topic A], [Content here...], accent: palette.primary),
  hex-card([Topic B], [Content here...], accent: palette.secondary),
)
```

### Statistics Row
```typst
#grid(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  node-stat([Metric], [Value], color: palette.primary),
  node-stat([Metric], [Value], color: palette.accent),
  node-stat([Metric], [Value], color: palette.secondary),
)
```

### Feature List
```typst
#electron-list([
  - First feature or step
  - Second feature or step
  - Third feature or step
], color: palette.primary)
```

## Layout Semantics

- Use `cols(lazy-layout: true)` only when each column contains exactly one flexible `hex-card`, `lattice-quote`, or `mesh-card`.
- Use default `cols` with direct natural flow when a column contains multiple complete visual regions. Add `stack(spacing: ...)` only when those elements form one designed group.
- Use `grid` for regular KPI rows of natural-height `node-stat` components.
- `molecule-box`, `structure-box`, and `electron-list` are natural-height components intended for ordinary flow or stacks.
