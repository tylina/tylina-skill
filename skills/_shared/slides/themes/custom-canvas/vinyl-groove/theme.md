# Vinyl Groove Theme -- API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#let pal = build-palette("vinyl")

#show: vinyl-groove-theme.with(
  aspect-ratio: "16-9",
  footer: [Studio Name],
  preset: "vinyl",  // "vinyl" | "cassette" | "hi-fi"
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
  config-common(breakable: false),
)

#set text(font: ("Avenir Next", "Arial Unicode MS"), size: 16pt)

// Pass pal: pal to reusable components so their colors follow the preset.
#rpm-stat([Annual Revenue], [\$1.2B], unit: [USD], pal: pal)
```

## Theme Parameters

| Parameter | Default | Options | Description |
|-----------|---------|---------|-------------|
| `aspect-ratio` | `"16-9"` | `"16-9"`, `"4-3"` | Page aspect ratio |
| `footer` | `none` | Content or function | Footer-left text on standard and dark slides |
| `preset` | `"vinyl"` | `"vinyl"`, `"cassette"`, `"hi-fi"` | Color preset |

## Color Presets

| Preset | Background | Ink | Accent | Secondary | Mood |
|--------|-----------|-----|--------|-----------|------|
| `vinyl` | #1C1916 (dark brown-black) | #F5E6D3 (aged cream) | #E85D04 (orange label) | #7B2CBF (purple) | Warm record store |
| `cassette` | #1A1A1E (dark charcoal) | #EDE4D8 (parchment) | #D4A017 (gold) | #8B4513 (saddle brown) | Tape deck warmth |
| `hi-fi` | #0F0E0D (pure dark) | #E8DDD0 (warm white) | #FF3B30 (red) | #00C7BE (teal) | Modern hi-fi |

Each preset also defines `accent-text` and `secondary-text` variants that meet small-text contrast needs on the theme's dark surfaces. The saturated `accent` and `secondary` tokens remain available for rules, fills, and large display marks.

## Slide Types

| Function | Usage | Description |
|----------|-------|-------------|
| `title-slide()` | `#title-slide()` | Hero vinyl grooves, tone arm, editorial asymmetric layout |
| `new-section-slide` | `= Section Title` | Auto-triggered, ghost numbers, grooves background |
| `slide` | `== Slide Title` | Standard content, subtle groove decoration |
| `dark-slide` | `#dark-slide(title:, header-left:, header-right:)[...]` | Deeper dark with waveform decoration |
| `focus-slide` | `#focus-slide[...]` | Bold centered statement, bracket corners |
| `ending-slide` | `#ending-slide[...]` | Closing with grooves, tone arm, "Drop the Needle" |

## Reusable Components

| Component | Signature | Description |
|-----------|-----------|-------------|
| `sleeve-card` | `sleeve-card(title, body, accent: none, text-accent: none, pal: palette)` | Warm card with a decorative border and contrast-safe label |
| `rpm-stat` | `rpm-stat(label, value, unit: none, value-size: 48pt, unit-size: 14pt, accent: none, text-accent: none, pal: palette)` | Stack-based number readout; its bounded value/unit grid prevents neighboring KPI collisions |
| `groove-divider` | `groove-divider(width: 100%, color: none, pal: palette)` | Triple-line separator with dot |
| `label-tag` | `label-tag(body, color: none, text-color: none, pal: palette)` | Small rounded pill tag |
| `liner-quote` | `liner-quote(body, credit: none, pal: palette)` | Styled quote with attribution |
| `track-panel` | `track-panel(title, tracks, pal: palette)` | Track listing panel |
| `vinyl-table` | `vinyl-table(align: center + horizon, columns: none, pal: palette, headers, ..rows)` | Bare native equipment-spec table with optional column ratios |
| `channel-meter` | `channel-meter(label, level, max-level: 10, accent: none, pal: palette)` | VU meter bar display; `accent` controls the upper active zone |
| `eq-band` | `eq-band(freq, db, accent: none, pal: palette)` | Centered, stack-based equalizer band column |
| `album-card` | `album-card(artist, title, year: none, accent: none, text-accent: none, pal: palette)` | Mini album reference card |
| `spectrum-bar` | `spectrum-bar(color: none, height: 4pt, pal: palette)` | Full-width gradient bar |

## SVG Decorations

| Function | Parameters | Description |
|----------|-----------|-------------|
| `vinyl-grooves` | `color:, width:, height:, pal:` | Concentric wobble circles (hero element) |
| `tone-arm` | `color:, width:, height:, pal:` | Angular arm with pivot and headshell |
| `waveform` | `color:, width:, height:, pal:` | Audio waveform bars |
| `spindle-hole` | `color:, size:, pal:` | Concentric record center circles |
| `music-note` | `color:, size:, pal:` | Eighth note silhouette |

## Palette Access

All components use `palette.xxx` for colors:

```typst
palette.bg        // Background
palette.ink       // Primary text
palette.accent    // Bold orange (key color)
palette.secondary // Deep purple
palette.accent-text    // Contrast-safe orange for small text
palette.secondary-text // Contrast-safe purple for small text
palette.surface   // Card/panel fill
palette.ink-dim   // Secondary text
palette.ink-muted // Readable tertiary text
palette.ink-faint // Borders
palette.ink-ghost // Ghost decorations
palette.accent-dim / accent-muted / accent-faint / accent-ghost
palette.secondary-dim / secondary-muted / secondary-faint
palette.surface-light / surface-dark
palette.meta-color // Contrast-safe chrome/footer text
palette.rule-color // Hairline rules
```

## Typography Constants

```typst
typo.display  // 42pt - Cover titles
typo.h1       // 30pt - Section titles
typo.h2       // 22pt - Slide titles
typo.body     // 16pt - Body text
typo.small    // 12pt - Captions
typo.tiny     // 9pt  - Footnotes
typo.meta     // 7.5pt - Fine print
```

The theme entry point deliberately sets no font family. The bundled demo uses the verified host fonts `Avenir Next` + `Arial Unicode MS`; technical labels use the installed `DejaVu Sans Mono`. Downstream decks may select another verified document font without modifying `template.typ`.

## Design Identity

- **Metaphor**: Vinyl records, analog audio, 70s album art
- **Hero element**: Vinyl grooves SVG (large, atmospheric, on title/ending)
- **Signature**: Warm brown-dark backgrounds (not cold/blue-dark)
- **Typography**: Bold condensed headings, generous tracking on small text
- **Orange accent**: Used boldly as the "record label" pop of color
- **Composition**: Asymmetric, editorial, not corporate
