# Film Strip Theme - API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 20pt)

#show: film-strip-theme.with(
  aspect-ratio: "16-9",
  footer: [PORTRA 400],
  config-info(
    title: [My Presentation],
    author: [Author Name],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()
#outline-slide()

= Section Title
== Slide Title
- Content here
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio |
| `footer` | content | `none` | Footer text (displayed in monospace) |

## Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `title-slide()` | Manual | Dark bg, gold title, film strips, light leaks |
| `slide` | `== Heading` | Warm white bg, film strip borders, orange-underlined title |
| `new-section-slide` | `= Heading` | Kodak gold bg, dark title, film strips |
| `outline-slide(title:)` | Manual | TOC with film strip borders |
| `focus-slide[...]` | Manual | Safelight red bg, white centered text |
| `ending-slide[...]` | Manual | Dark bg, gold monospace text |

## Components

### contact-card(title, body, caption: none)
Card styled like a contact sheet frame with thin black border and optional monospace caption.

```typst
#contact-card([Portra 400], [
  - Fine grain portrait film
  - Warm tone bias
], caption: [KODAK PROFESSIONAL / 135-36])
```

### exposure-stat(value, label, annotation: none)
Big statistic in film-base orange with optional aperture-style annotation.

```typst
#exposure-stat([+300%], [Film Sales Growth], annotation: [2015 -- 2024])
```

### darkroom-box(title, body)
Callout with safelight-red left border for warnings or key information.

```typst
#darkroom-box([Critical], [Handle film in complete darkness.])
```

### film-tag(content)
Inline tag styled like a film canister label (Kodak gold background).

```typst
#film-tag([SHOOT FILM]) #film-tag([ISO 400])
```

### developer-quote(quote, author: none)
Quote block with warm gold left border and italic styling.

```typst
#developer-quote([Photography is truth.], author: [Jean-Luc Godard])
```

### fuji-box(title, body)
Alternative callout with Fujifilm green accent.

```typst
#fuji-box([Tip], [Overexpose color negative by one stop for richer tones.])
```

### Helper Functions

| Function | Description |
|----------|-------------|
| `light-leak(anchor:, size:, dx:, dy:)` | Decorative orange/gold gradient overlay |
| `kodak-underline(width:, weight:)` | Orange accent line |
| `sprocket-holes-top(count:, color:)` | Top sprocket holes decoration |
| `sprocket-holes-bottom(count:, color:)` | Bottom sprocket holes decoration |

## Color Scheme

| Key | Color | Hex |
|-----|-------|-----|
| `palette.kodak-gold` | Kodak Gold | #FFBF00 |
| `palette.kodak-ink` | Kodak Amber Ink | #A35D00 |
| `palette.fuji-green` | Fujifilm Green | #00A651 |
| `palette.dark` | Film Leader Black | #1C1C1E |
| `palette.warm-white` | Photo Paper White | #FFF8E7 |
| `palette.film-base` | Film Base Orange | #F97316 |
| `palette.film-ink` | Film Base Ink | #C05000 |
| `palette.safelight` | Darkroom Red | #DC2626 |
