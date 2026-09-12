# Pixel Retro Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `pixel-retro-theme`
**Style**: Retro gaming / neon cyberpunk / 8-bit dark theme
**Primary color**: `#39FF14` (Neon Green)
**Best For**: Tech talks, programming tutorials, game introductions, geek-style content
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A retro gaming, neon cyberpunk presentation theme with 8-bit pixel aesthetics, dark backgrounds, and neon glow effects. Features scanline overlays, pixel corner decorations, and monospace typography. Best suited for tech talks, programming tutorials, game introductions, and geek-style content.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("DejaVu Sans Mono", "Noto Sans SC"))

#show: pixel-retro-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
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
| `align` | alignment | `horizon` | Default vertical alignment |

## Available Slide Types

### `#title-slide()`
Full-screen dark slide with "PRESS START" label, neon green title, pixel corner decorations, and scanline overlay.

### `#slide(title: auto)`
Content slide with neon green top border, monospace `> ` prompt-style title, and pixel-dot footer with page numbers.

### `#new-section-slide[...]`
Section divider with "LOADING..." label, large neon green section title, and colored pixel bar decoration on the left.

### `#focus-slide[...]`
Full-screen emphasis slide with neon green monospace text centered on dark background with scanlines.

### `#ending-slide[...]`
Closing slide with "GAME SAVED" label, gold-colored title, pixel corners, and "CONTINUE? Y/N" prompt.

## Reusable Components

### `#terminal-box(title: [Terminal], body)`
Terminal/console box with colored dot title bar (pink/gold/green) and green left border.
```typst
#terminal-box(title: [bash])[
  \$ cargo build --release
]
```

### `#pixel-card(number, title, description, accent: auto)`
Numbered card with pixel-block badge; colors auto-cycle through green, pink, blue, gold.
```typst
#pixel-card(1, [Feature], [Description.])
```

### `#stat-bar(label, value, max: 100, color: palette.green)`
RPG-style HP/XP progress bar with label and numeric value.
```typst
#stat-bar([Performance], 92, max: 100)
```

### `#badge(text-content, color: palette.green)`
Small inline colored tag with border and transparent fill.
```typst
#badge([v2.0]) #badge([BETA], color: palette.pink)
```

### `#level-card(level, title, items)`
RPG level-up card with "LVL N" header bar; colors auto-cycle by level number.
```typst
#level-card(1, [Beginner], [- Learn basics])
```

### `#neon-box(title, body, color: palette.green)`
Callout box with neon-colored left border and transparent fill.
```typst
#neon-box([Pro Tip], color: palette.gold)[Always profile before optimizing.]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Black** | `#0D1117` | `palette.black` | Darkest background, text on light |
| **Dark** | `#161B22` | `palette.dark` | Card background alternate |
| **Green** | `#39FF14` | `palette.green` | Neon green primary accent |
| **Pink** | `#FF2E97` | `palette.pink` | Neon pink secondary accent |
| **Blue** | `#00D4FF` | `palette.blue` | Neon blue tertiary accent |
| **Gold** | `#FFD700` | `palette.gold` | Neon gold accent, ending slides |
| **Background** | `#0D1117` | `palette.bg` | Page background |
| **Card BG** | `#161B22` | `palette.card-bg` | Card and component fills |
| **Text Green** | `#39FF14` | `palette.text-green` | Green text accent |
| **Text White** | `#E6EDF3` | `palette.text-white` | Primary light text |
| **Text Gray** | `#8B949E` | `palette.text-gray` | Secondary / muted text |
| **Border** | `#30363D` | `palette.border` | Card border strokes |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.green,
  neutral-lightest: palette.text-white,
  neutral-darkest: palette.black,
)
```

## Canvas-Level Usage

Pixel-retro's strong visual identity makes it ideal for Canvas-level composition:

- **Dark/light rhythm**: Default is dark. Use `config-page(fill: palette.card)` for lighter "terminal window" contrast pages.
- **Pixel decoration**: Use `grid()` with small `block()` elements to create pixel-art decorative patterns — the theme's signature technique.
- **Hero pages**: Full-bleed dark backgrounds with neon text overlays and pixel borders.
- **Inline styling**: Canvas mode permits `block(fill:)`, `text(fill:)` directly in main.typ using `palette.xxx` values.
- **Scanline effects**: For CRT-style effects, use thin `block(width: 100%, height: 1pt, fill: palette.bg.lighten(5%))` repeated in `place()`.
- **Recommended patterns**: Terminal-style stat pages, pixelated data dashboards, neon statement slides, full-bleed dark heroes.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
