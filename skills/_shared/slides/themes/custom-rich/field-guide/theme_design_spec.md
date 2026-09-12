# Field Guide Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | field-guide |
| **Best For** | Training materials, onboarding, instructional guides, reference decks, step-by-step tutorials |
| **Style Objective** | Educational / Reference |
| **Complexity Level** | Rich |

A naturalist's pocket field guide aesthetic for presentations. Designed for training materials and onboarding content with organized, numbered entries, bookmark tabs, and cross-referenced information. Every component looks like an entry in a field guide: numbered, tabbed, and categorized.

## Design Philosophy

- **Organized & Systematic**: Numbered entries, bookmark tabs, and checklists create a sense of methodical progression
- **Natural & Calm**: Sage greens and warm tans evoke a naturalist's notebook without being distracting
- **Reference-Ready**: Components designed for quick scanning and step-by-step instruction
- **Layered Atmosphere**: Subtle topographic contour lines create depth without competing with content

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Sage White | `#F5F9F5` | Primary background |
| Deep Forest | `#1A3A2A` | Main text, headings |
| Sage Green | `#5F8A6B` | Accent -- borders, badges, underlines |
| Warm Tan | `#C4A35A` | Bookmark tabs, emphasis highlights |
| Entry Green | `#2E5E3E` | Entry number badge background |
| Cream | `#FFFDF7` | Card backgrounds, title/ending slides |
| Tab Dark | `#8B6914` | Date text, dark tab accents |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: field-guide-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Book-cover style title slide with stitched border (dashed inner rectangle), corner ornaments (circles + crosshairs in tan), compass marker above title, cream paper background, topographic contour lines, centered title with tan accent bar, subtitle in sage, author, institution, and date.

### `slide(title: auto, ..args)`
Standard content slide with:
- Sage white background with persistent topographic contour lines
- Bold deep forest title with sage accent underline bar
- Footer with muted text and slide counter

### `new-section-slide(self: none, body)`
Section divider (auto-triggered by `= Section Title`). Features sage background with topographic lines, large tan section number (zero-padded), bold section title, sage accent bar, and a bookmark tab element on the right edge showing the section number.

### `focus-slide(body)`
Centered width-constrained statement on sage background with topographic lines, vertical tan accent bar on left, sage underline below text.

### `ending-slide(body)`
Closing slide with cream background, book-cover stitched frame, compass marker above text, bold centered message, tan accent bar, and "End of Field Guide" tagline.

## Reusable Components

### `entry-card(title, body, number: auto, accent: palette.accent)`
Numbered field guide entry card with circular badge displaying the entry number, bold title, and body text. Number auto-increments using internal state, or can be manually specified.

```typst
#entry-card([Python Environment], [
  All ML pipelines run on Python 3.11+ with uv as the package manager.
], number: 1, accent: palette.accent)
```

### `tab-section(title, body, tab-label: none, color: palette.tab)`
Section header with a physical bookmark tab element at top-right. Tab shows a short label, content area has a matching colored top border.

```typst
#tab-section([Raw Data Lake], [
  Data arrives in S3 from multiple upstream systems...
], tab-label: [S3])
```

### `trail-note(body, color: palette.tab)`
Important note block with compass SVG marker icon and colored left border. Background is a very light tint of the border color.

```typst
#trail-note[*Important:* Never store credentials in code repositories.]
```

### `waypoint-step(number, title, body, is-last: false)`
Numbered step in a sequence with connecting dotted line between steps (unless `is-last: true`). Circle badge shows step number, title in bold, body in muted smaller text.

```typst
#waypoint-step(1, [Clone Repository], [Clone the monorepo.])
#waypoint-step(2, [Install Dependencies], [Run uv sync.], is-last: true)
```

### `specimen-tag(content, color: palette.accent)`
Inline capsule-shaped pill/badge for categorization and labeling. Light fill with matching border.

```typst
#specimen-tag([Parquet], color: palette.accent)
```

### `topo-divider(color: palette.accent, width: 80%)`
SVG topographic wavy contour line divider with two layered wavy paths at different opacities. NOT a straight line.

```typst
#topo-divider(color: palette.accent, width: 60%)
```

### Checklist (via `@preview/cheq:0.4.0`)
Markdown-like checklist syntax using native list items with bracket markers. Enabled globally via `#show: checklist.with(stroke: palette.accent, radius: 0.2em)` placed before the theme's `#show: field-guide-theme.with(...)` rule. The `stroke` parameter is set to `palette.accent` (sage green) to match the theme's color scheme.

```typst
- [x] Schema validation configured
- [ ] Drift detection enabled
- [/] In progress step
- [-] Cancelled item
```

## SVG Elements

### Topographic Background (9 paths)
Subtle contour lines spanning the full slide width with varying opacities (0.03-0.08) and stroke widths (0.5-0.9pt). Creates a trail-map atmosphere without competing with content. Applied as persistent page background.

### Book Cover Frame
Stitched border effect: solid outer rectangle + dashed inner rectangle. Four corner ornaments (circles + crosshair marks) in warm tan. Vertical accent lines connecting corners. Used on title and ending slides.

### Compass Mark
Small 20x20 directional indicator with outer circle, north pointer (tan), south pointer (sage), and center dot. Used in trail-note component and title/ending slides.

### Topo Divider (inline)
Two wavy paths at different opacities creating a contour-line horizontal separator. Generated inline in the component function.

## Helper Functions

### `compass-mark(size: 16pt)`
Renders the compass SVG at specified size.

### `topo-background()`
Renders the full-slide topographic background SVG.

### `book-frame()`
Renders the book-cover stitched border frame SVG.

### `reset-entries()`
Resets the auto-incrementing entry card counter to 0.

## Available Colors

All colors accessed via `palette` dictionary:

```typst
#text(fill: palette.ink)[Deep forest text]
#text(fill: palette.accent)[Sage green accent]
#text(fill: palette.tab)[Warm tan emphasis]
#text(fill: palette.ink-muted)[Muted secondary text]
```

- `palette.bg`, `palette.ink`, `palette.accent`, `palette.tab`
- `palette.ink-muted`, `palette.ink-light`, `palette.border`
- `palette.entry-num`, `palette.cream`, `palette.topo-line`, `palette.tab-dark`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Theme accent (sage), `alert()` text |
| `neutral-lightest` | `palette.bg` | Light backgrounds |
| `neutral-darkest` | `palette.ink` | Dark text |

## Best Use Cases

- ML/AI onboarding and training
- Developer documentation presentations
- Step-by-step instructional guides
- Process documentation
- Technical reference materials
- New employee orientation decks

## Recommended Complexity

**Rich** -- This theme uses multiple SVG decorations (topographic backgrounds, book frames, compass markers), stateful entry numbering, and diverse structural components. Use `entry-card`, `waypoint-step`, and `tab-section` for organized instructional content.

## Demo

See `demo.typ` for a complete ML Pipeline Onboarding demonstration covering:
1. Title slide (book cover frame)
2. Environment Setup (prerequisites, workspace setup steps)
3. Data Pipeline (sources, ingestion, validation)
4. Model Training (experiment tracking, configuration, chart)
5. Evaluation (metrics, checklist, comparison)
6. Deployment (architecture, commands, monitoring)
7. Focus slide and ending slide

## File Structure

```
field-guide/
  template.typ   -- Theme definition (colors, SVGs, slides, components)
  demo.typ       -- Full demonstration presentation
```
