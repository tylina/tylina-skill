# Marble Foyer Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `marble-foyer-theme`
**Style**: Luxury marble and architectural foyer -- polished stone, gold metallic accents, classical columns/arches/cornices
**Primary color**: `#2C2C2C` (Charcoal Gray, classic preset)
**Best For**: Luxury brand presentations, architecture firms, high-end consulting, hotel groups, museum proposals
**Style Objective**: General Versatile
**Complexity Level**: Canvas

## Description

A canvas-level theme inspired by grand marble foyers -- hotel lobbies, museum entrances, and classical architectural spaces. Features pale marble-white backgrounds with organic veining pattern SVGs, antique gold metallic accents, and classical architectural elements including fluted columns, dentil cornice moldings, arch keystones, and ornate gold leaf corner pieces. Every slide feels like standing in a grand marble foyer. Supports three presets: classic (white marble with antique gold), noir (darker stone with muted gold), and travertine (warm stone with amber gold).

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

#show: marble-foyer-theme.with(
  aspect-ratio: "16-9",
  preset: "classic",
  footer: self => self.info.institution,
  config-info(
    title: [The Grand Collection],
    subtitle: [Luxury Design Portfolio 2026],
    author: [Victoria Laurent],
    date: datetime.today(),
    institution: [Atelier Pierre & Associates],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for standard and dark slides |
| `footer` | content/function | `none` | Left footer content; falls back to "MARBLE FOYER" |
| `preset` | string | `"classic"` | Color preset: "classic", "noir", or "travertine" |

## Available Slide Types

### `#title-slide()`
Grand architectural frame: full marble veining, cornice molding at top, fluted column borders on both sides, gold leaf corner pieces at all four corners, double inner gold frame, arch keystone ornament centered above title. Centered content with institution kicker (monospace, gold, tracked), bold title, gold line divider with center dot, italic subtitle, author/date.

### `#slide(title: auto, align: auto)`
Marble-white background with persistent atmosphere: full-page veining at subtle opacity, faint cornice at top, gold corner pieces at bottom corners. Header: bold title + gold double plinth-line. Footer: configured footer content (or "MARBLE FOYER") | gold diamond | page counter.

### `#dark-slide(title: auto, align: auto, header-left: none, header-right: none)`
Onyx/charcoal background (polished dark stone). Light marble veining in cream, arch keystone background ornament, gold corner accents. Light header/footer for navigation. Text defaults to marble-white.

### `#new-section-slide[...]`
Marble background with veining, cornice at top, column accent on left, large arch keystone (top-right), ghost section number (72pt, 82% transparent), "SECTION XX" monospace gold label, bold section title, plinth-line. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Statement slide on marble with enhanced veining, arch keystone centered above content, gold corner pieces at all four corners, accent corner lines. Centered italic text.

### `#ending-slide[...]`
Bookends with title-slide: identical architectural frame (columns + cornice + gold corners + double gold frame), ghost "FOYER" text, arch keystone ornament, centered farewell text, gold divider, "MARBLE FOYER" mark.

## Available Components

All components accept an optional `pal: palette` named argument. Pass the same palette built for the selected preset (for example, `pal: build-palette("travertine")`); omitting it preserves the classic palette.

### `#plinth-card(title, body, pal: palette)`
Card with 2pt gold left border, subtle corner accent (gold leaf), title + body text. Alabaster background. Suitable for content categories or service descriptions.

### `#pediment-stat(label, value, description: none, pal: palette)`
Centered statistic display: 44pt bold value, tiny gold monospace label, gold plinth-line accent, and optional description in one vertical stack. Like an inscription on a classical pediment.

### `#colonnade-box(title, body, pal: palette)`
Stacked header/body structure with faint column borders on sides. Header band has subtle fill. Suitable for detailed content blocks.

### `#cornice-divider(total-width: 100%, pal: palette)`
Full-width divider with double horizontal lines and gold dot accents at regular intervals. Classical molding feel.

### `#keystone-tag(body, pal: palette)`
Small rounded tag with gold border and gold text on faint gold background. For labels and categories.

### `#marble-highlight(body, pal: palette)`
Emphasis frame with 1.2pt gold border and four rotated gold leaf corner pieces. Gold dot accents at midpoints. For key content that needs special attention.

### `#atrium-note(body, cite: none, pal: palette)`
Centered quotation with arch keystone ornament above. Italic text in decorative quotation marks. Optional citation in monospace. Suitable for testimonials and key quotes.

### `#pilaster-badge(body, pal: palette)`
Small architectural badge with subtle fill and fine border. For location tags, categories, or status labels.

### `#frieze-list(body, pal: palette)`
Full-width content banner with faint cornice pattern behind. Subtle background fill with secondary border. For highlighted paragraphs or key information.

## Palette Access

```typst
#let pal = build-palette("classic")
// Access: pal.bg, pal.ink, pal.accent, pal.secondary, pal.card
// Derived: pal.ink-dim, pal.ink-muted, pal.accent-dim, pal.marble, pal.onyx, etc.
```

## SVG Decorations

The theme includes 5 intricate SVG patterns:
- **Marble veining** -- Full-page organic stone veining (12 paths)
- **Column border** -- Classical fluted column with base and capital (15+ elements)
- **Cornice molding** -- Dentil pattern header with layered profiles (50+ elements)
- **Arch keystone** -- Classical arch with keystone and voussoirs (12 elements)
- **Gold leaf corner** -- Ornate acanthus scroll corner piece (13 elements)

## Presets

| Preset | Background | Feeling |
|--------|-----------|---------|
| `classic` | Marble white (#FAFAF8) | Grand European hotel lobby |
| `noir` | Cool stone (#F5F4F2) | Contemporary museum entrance |
| `travertine` | Warm cream (#FAF8F4) | Mediterranean palazzo |
