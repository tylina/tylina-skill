# Polar Expedition Theme — Design Specification

## Overview

**Theme Name**: polar-expedition
**Metaphor**: Heroic Age of Antarctic exploration — Shackleton, Scott, Amundsen. Navigation charts on parchment, expedition diaries, compass bearings, the stark beauty of ice sheets.
**Complexity**: Canvas
**Style Objective**: General (exploration/geography/science)

## Color Palette

### Primary Preset: "expedition"

| Token | Hex | Usage |
|-------|-----|-------|
| bg | `#F8F5F0` | Expedition journal parchment background |
| ink | `#1A2A3A` | Navy expedition ink — dominant text/element color |
| accent | `#CC4400` | Signal/danger orange — lifeboats, emergency, key metrics ONLY |
| secondary | `#4A6FA5` | Ice blue / ocean — data, coordinates, subtle accents |
| surface | `#EDE8E0` | Aged paper — card fills, panel backgrounds |

### Derived Colors (from `build-palette()`)

- `ink-light`: ink at 30% transparency — secondary text
- `ink-muted`: ink at 35% transparency — descriptions
- `ink-faint`: ink at 75% — borders, rules
- `ink-ghost`: ink at 92% — ghost decorations
- `accent-dim/muted/faint/ghost`: orange at various opacities
- `accent-text`: preset-specific signal color safe for small text on the main surface
- `focus-accent`: preset-specific signal color safe on the focus/dark surface
- `secondary-dim/muted/faint/ghost`: ice blue at various opacities
- `meta-color`: ink at 35% transparency — footer/chrome text
- `rule-color`: ink at 70% — hairline rules

### Presets

| Preset | Character |
|--------|-----------|
| `expedition` | Light parchment, navy ink, signal orange — classic expedition journal |
| `ice-shelf` | Cool blue-white, deep navy, rust orange — icy Antarctic field notes |
| `midnight-sun` | Dark navy bg, parchment text, warm orange — midnight sun observation log |

## Typography

| Level | Size | Weight | Font |
|-------|------|--------|------|
| Display | 42pt | Bold | Inherits the presentation font |
| H1 | 28pt | Bold | Inherits the presentation font |
| H2 | 22pt | Bold | Inherits the presentation font |
| Body | 16pt | Regular | Inherits the presentation font |
| Small | 12pt | Regular | Inherits the presentation font |
| Tiny | 9pt | Regular/Medium | Inherits; tracking distinguishes labels |
| Meta | 7.5pt | Medium | Inherits; tracking distinguishes metadata |

**Principle**: `template.typ` remains font-family agnostic. The demo selects IBM Plex Serif / Noto Serif SC globally and uses IBM Plex Mono only for deliberate coordinate annotations in `demo.typ`.

## SVG Decorations

| Element | Description | Usage |
|---------|-------------|-------|
| Compass Rose | Detailed directional star with N/S/E/W cardinal points, degree marks, concentric circles | Section slides, title, ending |
| Ice Shelf Profile | Jagged bottom-edge line suggesting glacial coastline | Section divider, page bottom decoration |
| Sextant | Angular measurement instrument silhouette (triangulated form) | Ending slide ornament |
| Latitude Lines | Curved arcs across the page (map projection lines) | Background on all content slides |
| Expedition Flag | Small pennant triangle shape | Route-card markers |

## Slide Types

### title-slide
- Full parchment background with latitude arcs
- Large compass rose upper-right
- Sextant silhouette lower-left
- Ice shelf line at bottom
- Chart frame border with bearing marks at corners
- "EXPEDITION REPORT" kicker in tracked orange text
- Centered title (bold, 42pt), subtitle (italic), author+date (tracked metadata)

### new-section-slide
- Parchment + latitude lines
- Compass rose in upper-right with bold section number overlay (orange, 44pt)
- Coordinate label (LAT/LONG) decorative top-left
- Orange accent line top-left
- "BEARING 0X" kicker in tracked secondary blue text
- Large serif section title
- Ice shelf at bottom

### slide (content)
- Parchment fill with faint latitude lines behind content
- Bold heading + orange accent underline (2pt, 50pt wide)
- Small compass dot top-right
- Footer: tracked "ROSS SEA EXPEDITION 1914" | orange diamond | page number

### dark-slide
- Navy ink background
- Parchment-colored text
- Optional ghost text (huge faded background text)
- Scattered compass dots
- Dark header with tracked labels and the supplied title
- Dark footer with diamond separator

### focus-slide
- Deep navy background
- Signal orange corner brackets (L-shape accent lines)
- Scattered compass dots
- Serif italic centered text in parchment color

### ending-slide
- Parchment with latitude arcs
- Large faded compass rose centered
- "FINIS" ghost text
- Chart frame with bearing marks
- Sextant ornament above title
- "AD FINEM TERRAE" Latin tagline

## Components

| Component | Purpose | Visual |
|-----------|---------|--------|
| `chart-card` | General content card | Surface fill, navy left border (2.5pt), compass crosshair corner |
| `bearing-stat` | Large navigation coordinates | Centered `stack(spacing:)`, 42pt value, orange underline, secondary label/description; no paragraph spacers |
| `glacier-divider` | Section separator | Full-width jagged ice-shelf SVG line |
| `bearing-tag` | Small label/badge | Surface fill, faint border, tracked text |
| `journal-quote` | Expedition diary entry | Italic narrative, orange left border, tracked date/author |
| `expedition-panel` | Framed data section | Navy header bar with tracked label, surface content area |
| `coordinate-table` | Navigation log table | Navy header, surface rows, compact tracked text |
| `route-card` | Journey segment card | Flag marker, thin border, bold title |
| `signal-box` | High-emphasis alert | Orange left border (3pt), opaque parchment fill, tracked label |
| `ice-stat` | Environmental metric | Opaque surface fill; centered `stack(spacing:)` with large value and unit suffix |

## Aesthetic Principles

1. **ADVENTURE + SCIENCE**: Romance of exploration meets cartographic precision
2. **Light parchment** theme with NAVY as dominant text/element color
3. **Orange for emphasis ONLY** — signal flare usage (key metrics, alerts, focus)
4. **Map/chart aesthetics**: Everything feels like a navigation chart
5. **Typography duality**: Italic narrative versus tracked, compact coordinate/data labels; callers may add a verified mono family in `demo.typ`/`main.typ`
6. **Latitude SVG lines** behind content give GLOBAL SCALE feeling
7. **Minimal decoration**: Compass rose and ice shelf are signature; used sparingly
