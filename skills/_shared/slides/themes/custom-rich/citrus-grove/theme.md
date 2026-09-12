# Citrus Grove Theme — API Reference

## Overview

| Property | Value |
|----------|-------|
| **Theme Name** | citrus-grove |
| **Display Name** | Citrus Grove |
| **Style** | Fresh, playful, optimistic, professional |
| **Best For** | Marketing, product launches, food & beverage, sustainability reports, creative presentations |
| **Complexity** | Rich |
| **Primary Color** | `#F97316` (Orange) |
| **Secondary Colors** | `#EAB308` (Lemon), `#65A30D` (Lime) |
| **Background** | Light (`#FFFFFE` White) |

---

## Entry Point

```typst
#show: citrus-grove-theme.with(
  aspect-ratio: "16-9",    // "16-9" or "4-3"
  footer: none,            // Footer content or function
  config-info(
    title: [...],
    subtitle: [...],
    author: [...],
    date: datetime.today(),
    institution: [...],
  ),
)
```

---

## Slide Functions

### `title-slide()`
Full-page title slide with citrus background SVG pattern, centered title card, and branch curve decoration. Shares visual frame with ending slide (bookend effect).

### `new-section-slide`
Auto-triggered on `= Heading`. Light yellow background with citrus slice decoration, leaf sprig, section number in orange, and zest spray.

### `slide(title: auto)`
Standard content slide. Citrus gradient top bar, bold title with orange underline, corner citrus SVG decoration in body area, zest dots in footer.

### `focus-slide[...]`
Bold orange gradient background with white text. Dotted frame border, scattered white dots, and faint lemon slice SVG.

### `ending-slide[...]`
White background with citrus SVG pattern (bookends with title), leaf sprig, gradient underline, branch curve. Clean and uplifting.

---

## Components

### `concept-card(title, body, accent: palette.orange)`
Orange-bordered card for key concepts. Left accent border, rounded right corners, light tinted background.

### `insight-box(title, body)`
Lime-accented insight card with leaf SVG marker icon. For key takeaways and highlights.

### `stat-card(label, value, trend: none, accent: palette.orange)`
Large number stat card with colored top border. Supports trend indicator text.

### `zest-card(title, body, accent: palette.lemon)`
Playful card with dotted zest spray SVG decoration at top. Rounded, tinted background.

### `grove-box(title, body)`
Garden-themed card with dashed lime border and branch curve SVG at top. For vision statements and long-term framing.

### `quote-card(quote, author: none)`
Citation card with large orange quotation mark, left border accent. Warm background.

### `harvest-card(number, title, body, accent: auto)`
Numbered step/phase card. Color-coded number badge cycles through orange/lemon/lime. For roadmaps and processes.

### `callout-box(title, body, accent: palette.orange, icon: sym.arrow.r)`
Generic accented callout with icon marker. Flexible accent color for alerts, actions, priorities.

### `citrus-table(headers, rows)`
Styled data table with orange header row and alternating light-yellow/white body rows.

### `juice-meter(label, value, max: 100, color: palette.orange)`
Visual progress/rating bar. Colored fill proportional to value. For scorecards and metrics.

---

## SVG Decorations

| Decoration | Usage | Description |
|-----------|-------|-------------|
| `citrus-slice(size)` | Inline | Orange slice cross-section with radial segments |
| `lemon-slice(size)` | Inline | Lemon slice with radial lines and center dot |
| `leaf-sprig(height)` | Inline | Green leaf cluster on stem |
| `zest-spray(width)` | Inline | Scattered colored dots simulating citrus zest |
| `branch-curve(width)` | Inline | Curved branch/vine with small leaves |
| `citrus-bg()` | Full-page | Large composition with slices, leaves, dots, branches |
| `corner-citrus()` | Body area | Subtle bottom-right corner decoration on content slides |

---

## Color Palette

```typst
#let palette = (
  white: rgb("#FFFFFE"),        // Background
  orange: rgb("#F97316"),       // Primary accent
  lemon: rgb("#EAB308"),        // Secondary warm
  lime: rgb("#65A30D"),         // Secondary cool
  light-yellow: rgb("#FEF9C3"), // Tint background
  text-dark: rgb("#1C1917"),    // Body text
  text-muted: rgb("#78716C"),   // Secondary text
  orange-light: rgb("#FFF7ED"), // Orange tint
  lime-light: rgb("#F7FEE7"),   // Lime tint
  border: rgb("#E7E5E4"),       // Borders
  accent-warm: rgb("#FB923C"),  // Warm accent variant
  accent-cool: rgb("#84CC16"),  // Cool accent variant
)
```

---

## Helper Functions

| Function | Description |
|----------|-------------|
| `citrus-bar(height: 5pt)` | Orange-lemon-lime gradient bar |
| `zest-dots(count: 5)` | Inline dotted decoration |
| `citrus-color(index)` | Cycle through orange/lemon/lime by index |

---

## Usage Tips

1. **Use `cols()` with stat-cards** for metric dashboards — cards use `lazy-v(1fr)` for height equalization
2. **Mix card types** within a slide: combine `stat-card` row with `insight-box` below for data + context
3. **harvest-card** works best in 3-4 column layouts for roadmaps and timelines
4. **grove-box** is ideal for vision/mission statements as a full-width element
5. **juice-meter** stacks vertically for scorecards — place 4-6 in sequence
6. **Focus slide** serves as a section divider for impactful quotes or key messages
