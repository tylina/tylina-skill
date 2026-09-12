# Risograph

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `risograph-theme`
**Style**: Indie risograph printing aesthetic - spot colors, misregistration, halftone patterns, paper texture
**Primary color**: `#0078BF` (Federal Blue)
**Best For**: Creative presentations, art talks, design lectures, indie publishing, gallery events, zine culture
**Style Objective**: General Versatile (Creative/Artistic)
**Complexity Level**: Canvas

## Description

A canvas-level theme that channels the visual language of risograph printing. Features limited spot colors with characteristic misregistration effects (text placed twice with slight offset in different colors), thick black borders, no rounded corners, and a cream paper background. The aesthetic evokes indie music posters, art zines, and gallery invitations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Hiragino Sans GB"), size: 20pt)

#show: risograph-theme.with(
  aspect-ratio: "16-9",
  preset: "classic",
  config-info(
    title: [My Presentation],
    subtitle: [A Riso-Printed Talk],
    author: [Your Name],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

= First Section

== First Slide
Content goes here.

#focus-slide[Key Statement]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio |
| `align` | alignment | `horizon` | Default content alignment; use `top` for dense content decks |
| `footer` | content/none | `none` | Footer content |
| `preset` | string | `"classic"` | Color preset: `"classic"`, `"tropical"`, `"mono"` |

## Presets

| Preset | Paper | Spot 1 | Spot 2 | Spot 3 | Vibe |
|--------|-------|--------|--------|--------|------|
| `classic` | Cream `#F4ECD8` | Blue `#0078BF` | Pink `#F5638B` | Yellow `#FFE800` | Classic riso (blue+pink on cream) |
| `tropical` | White `#FEFEFA` | Green `#00A676` | Orange `#FF6B35` | Gold `#FFD23F` | Warm tropical colors |
| `mono` | Newsprint `#EDE8D5` | Black `#1A1A1A` | Dark Gray `#6B6B6B` | Light Gray `#B0B0B0` | Monochrome/photocopied |

## Available Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `slide()` | `== Heading` | Standard content slide with misregistered title shadow |
| `dark-slide()` | Manual | Black background with spot color overlays |
| `title-slide()` | Manual | Cover with bold misregistered title, geometric shapes, frame |
| `new-section-slide()` | `= Heading` | Large misregistered section number, bold title |
| `focus-slide()` | Manual | Single spot color fill, bold centered text, frame |
| `ending-slide()` | Manual | Paper bg with misregistered farewell text |

## Reusable Components

| Component | Signature | Description |
|-----------|-----------|-------------|
| `riso-card` | `(title, body, accent: palette.spot1)` | Card with thick black border, spot color header band |
| `overprint-stat` | `(number, label, color1: palette.spot1, color2: palette.spot2)` | Big number with ghost color offset |
| `spot-tag` | `(body, color: palette.spot1)` | Small filled tag/label |
| `zine-quote` | `(body, color: palette.spot2)` | Slightly rotated quote with thick left border |
| `halftone-divider` | `(color: palette.spot1, height: 8pt)` | Low-opacity horizontal color band |
| `registration-mark` | `(size: 16pt, color: palette.ink-muted)` | Decorative crosshair mark |
| `misregister` | `(body, dx: 2.5pt, dy: -1.5pt, color1, color2)` | Text with offset ghost for riso overprint effect |
| `misregister-display` | `(body, dx: 3pt, dy: -2pt, color1, color2)` | Larger misregistration for display text |
| `spot-block` | `(color, width, height)` | Solid color block decoration |
| `halftone-block` | `(color, width, height, opacity)` | Low-opacity decorative block |

## Color Scheme (Classic Preset)

| Key | HEX | Usage |
|-----|-----|-------|
| `palette.paper` | `#F4ECD8` | Background (cream paper) |
| `palette.spot1` | `#0078BF` | Primary spot color (blue) |
| `palette.spot2` | `#F5638B` | Secondary spot color (pink) |
| `palette.spot3` | `#FFE800` | Tertiary accent (yellow) |
| `palette.ink` | `#1A1A1A` | Text and borders |
| `palette.ink-light` | ink @ 40% transparent | Secondary text |
| `palette.ink-muted` | ink @ 60% transparent | Metadata, footnotes |
| `palette.ink-faint` | ink @ 80% transparent | Subtle borders |
| `palette.ink-ghost` | ink @ 92% transparent | Ghost decorations |
| `palette.spot1-light` | spot1 @ 50% transparent | Light blue accents |
| `palette.spot2-light` | spot2 @ 50% transparent | Light pink accents |
| `palette.spot3-light` | spot3 @ 70% transparent | Light yellow accents |

## Design Rules

1. **Misregistration is signature**: Use on title-slide and key headings
2. **Spot colors are limited**: Max 2 per slide (like real riso)
3. **Thick borders (2-3pt)**: No rounded corners - rough/bold aesthetic
4. **Paper texture**: Cream background evokes uncoated stock
5. **No gradients**: Riso uses flat spot colors only
