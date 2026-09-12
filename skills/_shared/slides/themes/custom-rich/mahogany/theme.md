# Mahogany Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Baskerville", "Times New Roman"))

#show: mahogany-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#title-slide()

= Section Title
== Slide Title
Content here.
#focus-slide[Key Message]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content |
| `footer` | content/function | `none` | Footer content or `self => content` function |

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| `palette.bg` | `#FDF8F0` | Warm cream background |
| `palette.mahogany` | `#6B2D1A` | Primary — headings, frames, accents |
| `palette.burgundy` | `#7C1D3E` | Secondary — focus slides, highlights |
| `palette.brass` | `#B8860B` | Accent — dividers, ornaments, stats |
| `palette.positive` | `#2E7D32` | Positive KPI trends |
| `palette.tan` | `#D2B48C` | Tertiary — borders, subtle fills |
| `palette.text-dark` | `#2C1810` | Primary text color |
| `palette.text-body` | `#4A3428` | Body text color |
| `palette.cream-light` | `#FFF9F0` | Light cream for inversions |
| `palette.card-bg` | `#FFFCF7` | Card/component background |

## Slide Types

### `title-slide()`
Full-page title with bookplate frame, wood grain texture, brass flourish. Reads from `config-info()`.

### `new-section-slide` (auto on `= Heading`)
Centered section title with corner bracket flourishes and brass divider ornaments.

### `slide(title: auto, align: auto)`
Standard content slide with mahogany header, brass accent line, persistent wood grain atmosphere.

### `focus-slide[content]`
Burgundy background with brass frame and centered text. For key messages and quotes.

### `ending-slide[content]`
Bookplate frame matching title (bookending effect). For closing messages.

## Reusable Components

### `concept-card(title, body, accent: palette.mahogany)`
Card with colored header bar. Use for categorized information blocks.

### `insight-box(title, body)`
Left-bordered highlight with burgundy accent. For key takeaways and summaries.

### `stat-card(label, value, note: none)`
Large brass-colored number display with label and optional note.

### `executive-card(title, body)`
Premium card with top brass rule. For important narrative content.

### `panel-box(title, body)`
Borderless section with SVG brass divider. For flowing narrative text.

### `quote-card(quote, author: none)`
Leather-bound quote with brass flourish decoration.

### `kpi-card(label, value, trend: none, trend-color: none)`
Metric card with optional trend indicator. Use in grid layouts.

### `callout-box(title, body, accent: palette.mahogany)`
Highlighted callout with diamond bullet accent. For important notes.

### `mahogany-tag(content, color: palette.burgundy)`
Small inline pill/capsule label for categorization.

## SVG Decorations

| Function | Description |
|----------|-------------|
| `wood-grain-bg(color)` | Full-page wood grain texture background |
| `brass-divider(color, width)` | Ornamental horizontal divider with diamond center |
| `corner-bracket(color, size, flip-h, flip-v)` | Decorative corner flourish |
| `bookplate-frame(color)` | Full-page ornamental border frame |
| `brass-flourish(color, width)` | Small inline wavy flourish |

## Layout Tips

- Use `#cols[...][...]` for two-column layouts
- Use `#grid(columns: (1fr, 1fr, ...), column-gutter: 0.8em, ...)` for explicit multi-row card matrices
- Use `#cols(lazy-layout: true, ...)` only when each column contains exactly one height-equalized card
- Use ordinary `#cols[...][...]` for full-slide two-column layout

## Best For

- Executive board presentations
- Strategy and governance reports
- Private equity and advisory decks
- Leadership forums and retreats
- Annual reports and investor updates
