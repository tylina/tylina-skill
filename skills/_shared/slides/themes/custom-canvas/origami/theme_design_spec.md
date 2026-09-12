# Origami Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | origami |
| **Best For** | Japanese culture, paper craft, geometric design, architecture, meditation, creative workshops |
| **Style Objective** | Japanese Paper-Folding Aesthetic |
| **Complexity Level** | Canvas |

A Japanese paper-folding aesthetic presentation theme with geometric faceted shapes, fold lines, paper texture feeling, and crane motifs. Colors drawn from traditional Japanese washi paper. Features triangular facets, crease-line dividers, angular geometries, and SVG decorative elements (fold patterns, crane watermark, faceted backgrounds, corner folds). Ships with 3 presets (washi, twilight, cloud).

## Design Philosophy

- **Paper Folding as Metaphor**: Every decorative element references paper folding -- creases, facets, corners, and the iconic crane
- **Geometric Precision**: Triangular facets, diamond frames, and angular zigzag lines create mathematical beauty
- **Washi Paper Warmth**: Default warm parchment tones with crimson red and forest green evoke traditional Japanese paper
- **Layered SVG Depth**: Interconnected triangle patterns, crane watermarks, and faceted backgrounds add visual richness at canvas level

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Washi Parchment (washi bg) | `#F5F0E8` | Primary background |
| Dark Charcoal (washi ink) | `#2D2926` | Primary text |
| Crimson Red (washi accent) | `#C41E3A` | Accent, fold marks, diamond frames |
| Forest Green (washi secondary) | `#1B4332` | Bottom accent bars, secondary |
| Dark Navy (twilight bg) | `#1A1A2E` | Twilight preset background |
| Warm Ivory (twilight ink) | `#E8E0D4` | Twilight preset text |
| Gold (twilight accent) | `#E6B325` | Twilight preset accent |
| Dark Purple (twilight secondary) | `#4A0E4E` | Twilight secondary |
| Light Blue (cloud bg) | `#E8F0F2` | Cloud preset background |
| Ocean Blue (cloud accent) | `#0077B6` | Cloud preset accent |
| Burnt Orange (cloud secondary) | `#FF6B35` | Cloud secondary |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: origami-theme.with(
  aspect-ratio: "16-9",
  preset: "washi",
  footer: [ORIGAMI],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | `string` | `"washi"` | Color preset: `"washi"`, `"twilight"`, `"cloud"` |
| `footer` | `content/function` | `none` | Footer content or function |
| `align` | `alignment` | `horizon` | Default content alignment |

## Slide Functions

### `title-slide(..args)`
Crane-watermark cover with washi background, large crane SVG watermark (top-right, 240pt), fold pattern decoration (bottom), top accent line, paper-tag institution kicker, large bold title (2.4em black weight), accent rule, subtitle, and monospace author/date with diamond separator. Bottom secondary accent bar.

### `slide(title: auto, align: auto, ..args)`
Standard content slide with subtle fold-line frame (0.3pt faint centered rectangle at 96x94%), fold accent header (monospace footer/counter, bold title, 40pt accent bar), and diamond-dot footer with "ORIGAMI" label.

### `dark-slide(title: auto, ..args)`
Twilight-colored dark variant (uses twilight palette regardless of main preset). Fold pattern decoration in bottom-right, inverted header/footer with twilight colors, and all body text in twilight ink color.

### `new-section-slide(self: none, body)`
Faceted background pattern, top/bottom accent lines, diamond-framed section number (60pt rotated rect with accent stroke, 28pt black number inside), SECTION paper-tag kicker, large bold section title (2.2em black), crease-divider decoration. Auto-triggered by `= Section Title`.

### `focus-slide(body)`
Single message on faceted accent-color background (full accent fill). Faceted pattern overlay using background color, corner diamond decorations (rotated rect outlines), and large bold text in background color (1.8em).

### `ending-slide(body)`
Crane motif farewell. Washi background with top/bottom accent lines, large centered crane watermark (280pt), accent rule above text, large bold title (2.2em black), small rotated diamond below, and "ORIGAMI" monospace label.

## Reusable Components

### `origami-card(title, body)`
Card with triangular fold corner decoration (SVG fold-over in top-right, 32pt), ink-faint border, slightly darkened background, bold title, and body text.

```typst
#origami-card([Paper Types], [
  Traditional washi paper comes in many varieties...
])
```

### `facet-stat(value, label, pal: palette)`
Number displayed inside a diamond/rhombus shape (45deg rotated rect with accent-ghost fill and accent-light border). Large bold accent-colored value centered, with tracked uppercase monospace label below.

```typst
#facet-stat([1,000], [CRANES FOLDED])
```

### `crane-divider(width: 100%)`
Angular zigzag crease-line divider (SVG) suggesting paper fold lines.

```typst
#crane-divider(width: 80%)
```

### `fold-quote(body, cite: none, pal: palette)`
Blockquote with zigzag fold-line left border decoration (angled line segments), italic body text, and optional tracked uppercase citation.

```typst
#fold-quote([One crane for each wish, one thousand for a lifetime.], cite: "Japanese Proverb")
```

### `tessellation-grid(items)`
Grid layout with alternating triangular accent fills. Up to 3 columns, items get alternating surface/accent-ghost backgrounds with small corner triangle accents in accent/secondary colors.

```typst
#tessellation-grid((
  [Item one content],
  [Item two content],
  [Item three content],
))
```

### `paper-tag(body, color: palette.accent)`
Small label with folded corner appearance (tiny triangle fold indicator in top-right). Monospace bold uppercase text on color-tinted background.

```typst
#paper-tag([SECTION]) #paper-tag([CRANE], color: palette.secondary)
```

## SVG Rendering Functions

### `fold-pattern(color: palette.ink, width: 100%, height: 60pt)`
Renders interconnected triangle faceted surface pattern.

### `crease-divider-render(color: palette.ink, width: 100%, height: 12pt)`
Renders angular zigzag crease line divider.

### `corner-fold-render(color: palette.ink, size: 40pt)`
Renders corner fold decoration (triangle fold-over).

### `crane-watermark(color: palette.ink, size: 200pt)`
Renders large crane motif watermark.

### `facet-background(color: palette.accent, width: 100%, height: 100%)`
Renders faceted triangular background pattern.

## Preset Dictionary

| Preset | Background | Ink | Accent | Secondary | Best For |
|--------|-----------|-----|--------|-----------|----------|
| `washi` | `#F5F0E8` | `#2D2926` | `#C41E3A` | `#1B4332` | Traditional, warm, craft |
| `twilight` | `#1A1A2E` | `#E8E0D4` | `#E6B325` | `#4A0E4E` | Dark, dramatic, evening |
| `cloud` | `#E8F0F2` | `#1A1A2E` | `#0077B6` | `#FF6B35` | Airy, modern, tech |

## Demo

See `demo.typ` for a complete demonstration covering paper-folding topics.

## File Structure

```
origami/
  template.typ   -- Theme definition (presets, SVGs, components, slides)
  demo.typ       -- Full demonstration presentation
```
