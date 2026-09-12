# Field Guide Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `field-guide-theme`
**Style**: Naturalist, instructional, organized, reference-book / light theme
**Primary color**: `#5F8A6B` (Sage Green)
**Best For**: Training materials, onboarding, instructional guides, reference decks, step-by-step tutorials
**Style Objective**: Educational / Reference
**Complexity Level**: Rich

## Description

A naturalist's pocket field guide presentation theme designed for training materials and onboarding. Every component looks like an entry in a field guide: numbered, tabbed, cross-referenced. Features soft sage/mint white background with deep forest text, bookmark tabs, topographic contour line backgrounds, and book-cover borders. Organized around numbered entries, waypoint steps, and categorization tags.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: field-guide-theme.with(
  aspect-ratio: "16-9",
  footer: [Training Guide],
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Book-cover style with stitched border, corner ornaments, compass marker, centered title with tan accent bar, topographic background lines.

### `#slide(title: auto)`
Standard content slide with sage background, persistent topographic contour lines, bold forest-green title with sage accent underline, muted footer with slide counter.

### `#new-section-slide[...]`
Section divider with large tan section number, bookmark tab sticking out on the right, bold section title, sage accent bar, topographic background.

### `#focus-slide[...]`
Centered statement on sage background with left accent border, width-constrained text, sage underline below, topographic background.

### `#ending-slide[...]`
Closing slide with book-cover frame, compass marker above text, centered bold message, tan accent bar, topographic background.

## Reusable Components

### `#entry-card(title, body, number: auto, accent: palette.accent)`
Numbered entry like a field guide species card with circular number badge, title, and description body.
```typst
#entry-card([Python Environment], [All ML pipelines run on Python 3.11+...], number: 1)
```

### `#tab-section(title, body, tab-label: none, color: palette.tab)`
Section header with a physical bookmark tab that sticks out at the top-right, matching top border.
```typst
#tab-section([Raw Data Lake], [Data arrives from multiple systems...], tab-label: [S3])
```

### `#trail-note(body, color: palette.tab)`
Important note with compass SVG marker and colored left border.
```typst
#trail-note[*Important:* Never store credentials in code repositories.]
```

### `#waypoint-step(number, title, body, is-last: false)`
Numbered step with connecting dotted line between steps for sequential processes.
```typst
#waypoint-step(1, [Clone Repository], [Clone the monorepo and navigate to root.])
#waypoint-step(2, [Install Deps], [Run uv sync to install packages.], is-last: true)
```

### `#specimen-tag(content, color: palette.accent)`
Inline pill/badge for categorization.
```typst
#specimen-tag([Parquet], color: palette.accent)
#specimen-tag([Delta Lake], color: palette.tab)
```

### `#topo-divider(color: palette.accent, width: 80%)`
SVG topographic wavy contour line divider (not straight).
```typst
#topo-divider(color: palette.accent)
```

### `#show: checklist` (via `@preview/cheq:0.4.0`)
Markdown-like checklist syntax. Use native list syntax with bracket markers: `- [x] Done` / `- [ ] Todo`. Enabled globally with `#show: checklist.with(stroke: palette.accent, radius: 0.2em)` before the theme show rule in `demo.typ`.
```typst
- [x] Schema validation passing
- [ ] Drift detection configured
- [/] In progress item
- [-] Cancelled item
```

## Helper Functions

### `#compass-mark(size: 16pt)`
Renders the compass SVG marker icon.

### `#topo-background()`
Renders the full-slide topographic contour lines background.

### `#book-frame()`
Renders the stitched book-cover frame border.

### `#reset-entries()`
Resets the auto-incrementing entry counter (useful at section boundaries).

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Sage White** | `#F5F9F5` | `palette.bg` | Primary background |
| **Deep Forest** | `#1A3A2A` | `palette.ink` | Main text color |
| **Sage Green** | `#5F8A6B` | `palette.accent` | Accent, component borders |
| **Warm Tan** | `#C4A35A` | `palette.tab` | Bookmark tabs, emphasis |
| **Ink Muted** | 50% transparent ink | `palette.ink-muted` | Secondary text, footers |
| **Ink Light** | 70% transparent ink | `palette.ink-light` | Subtle decorations |
| **Border** | 60% transparent accent | `palette.border` | Card borders |
| **Entry Green** | `#2E5E3E` | `palette.entry-num` | Entry number badges |
| **Cream** | `#FFFDF7` | `palette.cream` | Card backgrounds |
| **Topo Line** | 92% transparent accent | `palette.topo-line` | Background contour lines |
| **Tab Dark** | `#8B6914` | `palette.tab-dark` | Date text color |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (colors, slides, components, SVGs)
- `demo.typ` -- Compilable usage example (ML Pipeline Onboarding)

## Demo

See `demo.typ` for a compilable example covering ML pipeline onboarding with all component types.
