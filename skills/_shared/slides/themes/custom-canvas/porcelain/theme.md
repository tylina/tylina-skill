# Porcelain Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `porcelain-theme`
**Style**: Chinese Blue-and-White Porcelain (Ming dynasty Jingdezhen) -- cobalt blue on white glaze, gold rim accents
**Primary color**: `#1E4D8C` (Cobalt Blue, ming preset)
**Best For**: Chinese culture presentations, history talks, art lectures, museum exhibitions, East Asian studies
**Style Objective**: General Versatile
**Complexity Level**: Canvas

## Description

A canvas-level theme inspired by Ming dynasty Jingdezhen blue-and-white porcelain. Features cobalt blue ink on white glaze backgrounds with lattice (hui-wen) border frames, cloud scroll decorations, peony flowers, rolling wave borders, and dragon motifs on dark slides. Every slide feels like the surface of a porcelain vessel. Gold accents simulate the gilded rim. Supports three presets: ming (classic blue), celadon (jade green), and rouge (iron red).

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: porcelain-theme.with(
  aspect-ratio: "16-9",
  preset: "ming",
  footer: self => self.info.institution,
  config-info(
    title: [The Art of Blue and White],
    subtitle: [Ming Dynasty Jingdezhen Ceramics],
    author: [Dr. Chen Wei],
    date: datetime.today(),
    institution: [National Palace Museum],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |
| `preset` | string | `"ming"` | Color preset: "ming", "celadon", or "rouge" |

## Available Slide Types

### `#title-slide()`
Grand porcelain vessel cover: full lattice frame (like plate rim), large peony flowers (top-right 160pt, bottom-left 110pt), wave border along bottom, cloud scrolls as transitions, double gold rim frame (inner border), gold dot accents at corners. Centered title with institution kicker, gold-dot divider line, subtitle in italic, author/date in monospace.

### `#slide(title: auto)`
White glaze background with persistent porcelain atmosphere: lattice frame at 12% opacity, cloud scrolls in top-right and bottom-left corners, ghost character at 3% opacity. Header with bold title + double-line rim accent (porcelain rim style). Footer: monospace "PORCELAIN" | gold diamond | page counter.

### `#dark-slide(title: auto, header-left: none, header-right: none)`
Cobalt blue background (the blue of porcelain itself). Dragon motif SVG dominates background. Cloud scroll accents and ghost character in cream. Light header/footer for navigation. Text defaults to cream white.

### `#new-section-slide[...]`
White glaze with lattice frame, large peony (180pt, top-right), cloud scroll (bottom-left). Large ghost section number (72pt, 80% transparent), "SECTION XX" monospace label, bold section title, rim accent, wave border at bottom. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Warm glaze background (`glaze-warm`). Cloud scrolls framing all four corners (larger in top-left and bottom-right). Lattice frame at low opacity. Gold dot accents. Ghost character. Italic centered text at 1.4em.

### `#ending-slide[...]`
Bookends with title: same lattice frame, peonies (mirrored positions), cloud scrolls, gold rim frame, gold dot corners, wave border bottom. Seal mark ornament, large bold text, decorative gold-dot divider, "PORCELAIN" monospace label.

## Reusable Components

### `#vessel-card(title, body)`
Double blue line border (like porcelain rim) with heavier left border (1.8pt). Inner decorative line along top. Cloud scroll in top-right corner at low opacity. Bold ink title + body text.

```typst
#vessel-card([Firing Temperature], [
  Blue-and-white requires 1280-1320 degrees Celsius in a reducing atmosphere.
])
```

### `#dynasty-stat(label, value, description: none)`
Large number with cloud scroll SVG behind. Small monospace uppercase tracked label, 44pt bold ink value, rim accent below, optional description.

```typst
#dynasty-stat([Years Active], [267], description: [Ming Dynasty: 1368-1644])
```

### `#scholar-quote(body, cite: none)`
Centered text in Chinese quotation marks with peony accent behind. Italic text, optional cite in small tracked monospace.

```typst
#scholar-quote([Art is the most intense mode of individualism that the world has known.], cite: [Oscar Wilde])
```

### `#kiln-box(title, body)`
Box with wave-pattern SVG as bottom border (instead of a straight line). Warm glaze fill, thin ink borders on three sides.

```typst
#kiln-box([Kiln Types], [
  - Dragon kiln (Longquan)
  - Egg-shaped kiln (Jingdezhen)
])
```

### `#jade-tag(body)`
Rounded tag with jade-green color (independent of preset). Soft transparent green fill, green text.

```typst
#jade-tag([Celadon])
```

### `#lattice-divider(total-width: 100%)`
Full-width decorative divider with hui-wen (angular spiral) motifs along a horizontal line. Gold dot center accent.

```typst
#lattice-divider()
```

### `#treasure-highlight(body)`
Gold rim frame with blue corner cloud scrolls (4 corners). Gold dot accents at frame midpoints. White glaze fill.

```typst
#treasure-highlight[
  This piece is designated a National Treasure.
]
```

### `#scroll-banner(body)`
Full-width band with cloud pattern behind text at 10% opacity. Subtle ink-tinted background.

```typst
#scroll-banner[Imperial Kiln Factory, Jingdezhen]
```

### `#seal-mark(body)`
Red seal stamp decorative element (Chinese chop mark). Red fill with white bold text.

```typst
#seal-mark[御制]
```

### `#pavilion-frame(title, body)`
Content with Chinese architectural bracket corners (simplified dou-gong style). L-shaped corner brackets with secondary inner corners.

```typst
#pavilion-frame([Exhibition Notes], [
  Dated to the Xuande period (1426-1435).
])
```

## SVG Rendering Helpers

### `#cloud-scroll(color: palette.ink, size-w: 120pt, size-h: 80pt)`
Flowing cloud (xiang-yun) with internal spirals and trailing wisps.

### `#peony-flower(color: palette.ink, size: 140pt)`
Multi-petal bloom with stamens and leaves (mu-dan).

### `#wave-border(color: palette.ink, width: 100%, height: 30pt)`
3-layer rolling waves with crests and foam (hai-shui-wen).

### `#lattice-frame(color: palette.ink, width: 100%, height: 100%)`
Geometric lattice border (hui-wen) -- angular spiral border pattern like the rim of a plate.

### `#dragon-motif(color: palette.accent, width: 300pt, height: 200pt)`
Coiling dragon with scales and flowing curves for dark slides.

## Small Decorative Helpers

### `#gold-dot(color: palette.accent, size: 3pt)`
Small gold circle accent.

### `#rim-accent(color: palette.ink, width: 60pt)`
Double line like porcelain rim edge.

## Color Scheme

### Presets

| Preset | Background | Ink | Accent (Gold/Rim) | Secondary | Best For |
|--------|-----------|-----|---------|-----------|----------|
| **ming** | `#FEFDFB` | `#1E4D8C` | `#B8860B` | `#2B5EA7` | Classic blue-and-white porcelain |
| **celadon** | `#FAFAF5` | `#4A7C6F` | `#8B7536` | `#5A9A8B` | Jade green celadon ware |
| **rouge** | `#FFFDF8` | `#8B2323` | `#B8860B` | `#A03030` | Iron red/copper red ware |

### Derived Colors (ming preset shown)

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `ink-dim` | ink.transparentize(20%) | Dimmed ink |
| `ink-muted` | ink.transparentize(45%) | Muted ink for secondary text |
| `ink-faint` | ink.transparentize(70%) | Faint borders, decorations |
| `ink-ghost` | ink.transparentize(92%) | Ghost atmosphere elements |
| `accent-dim` | accent.transparentize(30%) | Dimmed gold |
| `accent-muted` | accent.transparentize(50%) | Muted gold accents |
| `accent-faint` | accent.transparentize(75%) | Very faint gold |
| `accent-ghost` | accent.transparentize(90%) | Ghost gold |
| `secondary-dim` | secondary.transparentize(30%) | Dimmed secondary |
| `secondary-muted` | secondary.transparentize(50%) | Muted secondary |
| `secondary-faint` | secondary.transparentize(75%) | Faint secondary |
| `glaze` | same as bg | Porcelain surface |
| `glaze-warm` | `#FAF8F3` | Off-white warm card backgrounds |
| `cobalt` | `#0F2A52` | Dark slide body (cobalt blue) |
| `cobalt-deep` | `#091B38` | Deeper dark variant |
| `meta-color` | ink.transparentize(60%) | Metadata text |
| `body-text` | `#2D3748` | Body text color |

### Touying Color Mapping

```typst
config-colors(
  primary: pal.ink,
  neutral-lightest: pal.bg,
  neutral-darkest: pal.ink,
)
```

## Typography Constants

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 42pt | Hero/cover titles |
| `typo.h1` | 28pt | Slide titles |
| `typo.h2` | 22pt | Card/section headings |
| `typo.body` | 16pt | Body text |
| `typo.small` | 12pt | Captions |
| `typo.tiny` | 9pt | Kickers, metadata |
| `typo.meta` | 8pt | Smallest metadata |

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
