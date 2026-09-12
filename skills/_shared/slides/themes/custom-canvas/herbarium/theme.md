# Herbarium Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: herbarium-theme.with(
  aspect-ratio: "16-9",
  footer: [Institution Name],
  preset: "herbarium",  // or "field-notes", "autumn-collection"
  config-info(
    title: [Presentation Title],
    subtitle: [Optional subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
  config-common(breakable: false),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 18pt)
```

## Theme Parameters

| Parameter | Default | Options |
|-----------|---------|---------|
| `aspect-ratio` | `"16-9"` | `"16-9"`, `"4-3"` |
| `footer` | `none` | Any content |
| `preset` | `"herbarium"` | `"herbarium"`, `"field-notes"`, `"autumn-collection"` |

## Slide Types

| Function | Trigger | Purpose |
|----------|---------|---------|
| `title-slide()` | Manual | Cover with mounting corners and botanical decorations |
| `new-section-slide` | `= Heading` | Section divider with catalog number |
| `slide` | `== Heading` | Standard content slide |
| `dark-slide` | Manual | Inverted dark green slide |
| `focus-slide` | Manual | Single statement with botanical frame |
| `ending-slide` | Manual | Closing slide with "FINIS" ghost |

## Components

### specimen-card(title, body, accent: palette.accent)
Cream card with thin border and mounting corner accents at all four corners.

### taxonomy-stat(value, label, accent: palette.accent)
Large number with small-caps label above. Ideal in 3-4 column layouts.

### vein-divider(width: 100%, color: palette.accent)
Horizontal line with branching vein marks. Section separator.

### genus-tag(body, color: palette.accent)
Small italic label in a dashed-border frame. Inline tag.

### field-quote(body, cite: none)
Quotation with left green accent bar. Italic text with optional citation.

### catalog-panel(number, title, body, accent: palette.accent)
Numbered panel with top accent bar and specimen-number header.

### herbarium-table(headers, ..rows)
Museum catalog-style data table. Headers are auto-uppercased.

### collection-label(collector, number, location, date: none)
Dashed-border metadata label showing collector, number, location.

### pressed-specimen(title, body, accent: palette.accent)
Card with ghost leaf SVG watermark behind content.

### accession-number(number, color: palette.secondary)
Inline styled catalog/accession number.

### determination-label(genus, species, authority: none)
Botanical name in italic with authority citation.

## Decorative Elements

| Function | Purpose |
|----------|---------|
| `leaf-ornament(color:, width:, height:)` | Pressed leaf silhouette SVG |
| `tape-corner(color:, size:)` | Mounting tape corner strip |
| `cross-section(color:, size:)` | Botanical stem cross-section |
| `scale-bar(color:, width:)` | Scientific measurement marks |
| `label-frame(color:, width:, height:)` | Dashed collection label frame |
| `specimen-dot(color:, size:)` | Small circular marker |
| `mounting-corner(color:, size:, rotation:)` | Rotatable tape corner |

## Color Palette Access

```typst
palette.bg          // Background
palette.ink         // Primary text
palette.accent      // Specimen green
palette.secondary   // Label gold/amber
palette.surface     // Card stock
palette.ink-light   // 30% transparent ink
palette.ink-muted   // 25% transparent ink; readable metadata
palette.ink-faint   // 75% transparent ink
palette.ink-ghost   // 92% transparent ink
palette.accent-text // Accessible darkened accent for text on light slides
palette.accent-dim  // 30% transparent accent
palette.accent-muted // 50% transparent accent
palette.accent-on-dark // Accessible accent for small text on dark slides
palette.secondary-text // Accessible darkened secondary for text
palette.meta-color  // Readable footer/metadata text
palette.rule-color  // Hairline rules
```

## Usage Patterns

### Multi-column with cards
```typst
== Slide Title
#cols(columns: (1fr, 1fr))[
  #specimen-card([Title A], [Content...])
][
  #specimen-card([Title B], [Content...])
]
```

### Statistics row
```typst
#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #taxonomy-stat([2.4M], [Specimens])
][
  #taxonomy-stat([187K], [Species])
][
  #taxonomy-stat([412], [Types])
]
```

### Dark slide for emphasis
```typst
#dark-slide(title: [Key Insight])[
  #text(size: 1.3em, style: "italic")[Important statement here.]
]
```
