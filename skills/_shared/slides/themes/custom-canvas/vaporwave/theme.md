# Vaporwave Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Avenir Next", "Arial Unicode MS"), size: 20pt)

#let pal = build-palette("sunset")

#show: vaporwave-theme.with(
  aspect-ratio: "16-9",
  preset: "sunset",
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle text],
    author: [Author Name],
    date: datetime.today(),
    institution: [INSTITUTION],
  ),
)

#title-slide()

= Section Title
== Slide Title
- Content here
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio |
| `align` | alignment | `horizon` | Default content alignment |
| `footer` | content/function | `none` | Footer content |
| `preset` | string | `"sunset"` | Color preset name |

## Presets

| Preset | Ink | Paper | Character |
|--------|-----|-------|-----------|
| `sunset` | Deep purple-black `#1A0A2E` | Lavender blush `#FFF0F5` | Classic vaporwave |
| `ocean` | Dark navy `#0A1628` | Cyan tint `#E0F7FA` | Cool, oceanic |
| `neon` | Near black `#0D0D0D` | Electric pink `#FFB6C1` | High contrast neon |

## Accent Colors

| Name | Hex | Token |
|------|-----|-------|
| Hot Pink | `#FF6B9D` | `pal.pink` |
| Purple | `#C084FC` | `pal.purple` |
| Cyan | `#06B6D4` | `pal.cyan` |
| Sunset Orange | `#FF8C42` | `pal.orange` |

Small accent text on light slides must use the contrast-safe `pal.pink-text`, `pal.purple-text`, `pal.cyan-text`, or `pal.orange-text` variants. Keep the brighter base accents for dark surfaces, borders, gradients, and large display text.

## Slide Types

| Function | Description | Background |
|----------|-------------|------------|
| `slide()` | Standard light content slide | Paper with gradient bar top, grid bottom |
| `dark-slide()` | Dark content slide | Ink with gradient wash, ghost grid |
| `title-slide()` | Cover slide | Full gradient with glitch text |
| `new-section-slide()` | Section divider (auto on `=`) | Dark with ghost text, pink line |
| `focus-slide()` | Statement slide | Gradient wash with glow effect |
| `ending-slide()` | Closing slide | Sunset gradient (orange/pink/purple) |
| `hero-slide()` | Full-bleed image | Image with gradient overlay |
| `grid-slide()` | Grid pattern slide | Dark with perspective grid lines |

### slide(title: auto, align: auto)
Standard light slide with gradient bar at top and subtle grid decoration at bottom.

### dark-slide(title: auto, ghost: none, ghost-size: 180pt, ghost-dy: -30pt, ghost-dx: -20pt, header-left: none, header-right: none)
Dark background slide with optional ghost text, gradient wash overlay, and grid lines at bottom.

### title-slide()
Cover slide reading from `config-info`. Displays title with glitch shadow effect, subtitle in cyan, author/date in muted colors. Full gradient background with perspective grid.

### grid-slide(title: auto, header-left: none, header-right: none)
Dark background with prominent placed grid-line pattern (perspective horizontal + vertical lines). Content floats above.

### focus-slide(body)
Full-page centered statement with gradient wash background and text glow effect.

### ending-slide(body)
Sunset gradient (orange to pink to purple to dark) with centered farewell text.

### hero-slide(background-image: none, scrim: true, body)
Full-bleed background image with optional dark gradient scrim from bottom. Use `place()` for text positioning.

## Reusable Components

| Component | Signature | Description |
|-----------|-----------|-------------|
| `retro-card` | `(title, body, accent: none, pal: palette)` | Card with colored border stroke |
| `glitch-stat` | `(value, label, accent: none, pal: palette)` | Big number with chromatic offset shadow |
| `wave-box` | `(title, body, pal: palette)` | Callout with pink gradient left border |
| `sunset-divider` | `(width: 100%, pal: palette)` | Gradient line pink/purple/orange |
| `pixel-tag` | `(body, color: none, pal: palette)` | Small pill tag with colored fill |
| `vapor-quote` | `(body, attribution: none, pal: palette)` | Quote with purple left border, contrast-safe cyan attribution |
| `grid-pattern` | `(rows: 10, opacity: 85%, pal: palette)` | Decorative grid (placed lines) |
| `glitch-text` | `(body, size: 44pt, ..., pal: palette)` | Text with pink/cyan chromatic aberration |
| `neon-badge` | `(body, color: none, pal: palette)` | Outlined badge label |
| `vapor-progress` | `(ratio, width: 100%, height: 6pt, pal: palette)` | Progress bar with gradient fill |
| `vapor-meter` | `(label, ratio, caption, pal: palette)` | Compact labeled progress metric for dark data slides |

All components default to the sunset palette for backwards compatibility. When using `preset: "ocean"` or `preset: "neon"`, build the matching palette and pass it as `pal: pal` so component surfaces and text follow the selected preset.

## Palette Access

```typst
#let pal = build-palette("sunset")

// Available tokens:
// pal.ink, pal.paper, pal.pink, pal.purple, pal.cyan, pal.orange
// pal.pink-text, pal.purple-text, pal.cyan-text, pal.orange-text
// pal.pink-light, pal.pink-faint, pal.pink-ghost
// pal.purple-light, pal.purple-faint, pal.purple-ghost
// pal.cyan-light, pal.cyan-faint
// pal.orange-light
// pal.ink-muted, pal.ink-ghost
// pal.paper-muted, pal.paper-faint
// pal.grid-color, pal.grid-strong, pal.surface
```

## Design Philosophy

A E S T H E T I C S. Gradient washes from pink to purple. Grid lines that recede to a vanishing point. Glitch-inspired text effects via offset shadows. The visual language of Miami Vice meets Windows 95. Sunset gradients as emotional anchors. Every slide is a portal to the retro-digital dreamscape.

## Best For

Music/entertainment, retro gaming, social media, creative tech, pop culture, internet culture presentations.
