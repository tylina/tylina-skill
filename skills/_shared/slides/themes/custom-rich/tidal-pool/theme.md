# Tidal Pool Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `tidal-pool-theme`
**Style**: Ocean science, marine biology, organic / light theme
**Primary color**: `#4ECDC4` (Aquamarine)
**Best For**: Marine biology, ecology, environmental science, coastal research, nature-themed presentations
**Style Objective**: Scientific yet organic and beautiful — evoking marine biology fieldwork
**Complexity Level**: Rich

## Description

An ocean science inspired presentation theme with aquamarine, sand, and deep navy accents on light backgrounds. Features wave-form SVG decorations (sine curves), tide line patterns, and circular pool/ripple motifs. The aesthetic evokes the beauty of rocky shore tidal pools — scientific precision paired with natural organic forms. Light and airy, perfect for ecology, marine science, and nature-themed research presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: tidal-pool-theme.with(
  aspect-ratio: "16-9",
  footer: [Coastal Ecology Lab -- Research Briefing],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("New Computer Modern", "Heiti SC"))
#show raw: set text(font: "IBM Plex Mono")

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Sandy white background with full wave decorations, pool ripple motifs (top-right, bottom-left), double-line tidal frame borders, centered navy title, wave divider, aquamarine subtitle, author, institution, and sand-gold date.

### `#slide(title: auto)`
Content slide with sandy white background, persistent tidal atmosphere (subtle waves, sand particles, organic shapes), navy title with wave-form SVG underline, triple-dot wave footer with slide counter.

### `#new-section-slide[...]`
Deep navy background with white wave overlay, sand-gold section number, white section title, aquamarine wave divider, pool ripple (bottom-right).

### `#focus-slide[...]`
Aquamarine background with white wave overlay, pool ripples in corners, tidal frame border, centered navy bold text, sand-gold wave divider.

### `#ending-slide[...]`
Sandy white background with wave and tidal decorations (bookends with title), pool ripple top-right, tidal frame borders, centered pool ripple above text, navy title, wave divider, three-dot ornament (sand/aquamarine/coral).

## Reusable Components

### `#concept-card(title, body, accent: palette.primary)`
Card with colored top border, white background, wave divider separator. For structured ideas/concepts.
```typst
#concept-card([Study Design], [Monthly surveys spanning 36 months...])
```

### `#insight-box(title, body, accent: palette.navy)`
Left-bordered callout with tinted background. For key insights and observations.
```typst
#insight-box([Thermal Refugia], [Pools with overhanging rock ledges...], accent: palette.navy)
```

### `#stat-card(label, value, color: palette.primary)`
Large value display with tinted background and colored bottom border. For statistics and measurements.
```typst
#stat-card([High Intertidal], [18 spp.], color: palette.coral)
```

### `#quote-card(quote-text, author: none)`
Quote block with SVG wave quote marks and aquamarine left accent. For citations and notable quotes.
```typst
#quote-card([The tidal pool is a window into the ocean...], author: [Ed Ricketts])
```

### `#specimen-card(title, body, accent: palette.coral)`
Marine specimen/observation card with colored header band and pool ripple icon. For organism or observation data.
```typst
#specimen-card([Pisaster ochraceus], [Population status: Recovering...], accent: palette.coral)
```

### `#depth-card(title, body, depth-label: none)`
Dark navy card with aquamarine left border. Represents deep/important information. Optional depth label badge.
```typst
#depth-card([Heatwave Impact], [During the July 2025 event...], depth-label: [Critical])
```

### `#wave-box(body, accent: palette.primary)`
Full-width highlight box with subtle wave background pattern. For key findings and summaries.
```typst
#wave-box[*Key Finding:* Pools with volume > 50 L retained 94% species richness.]
```

### `#callout-box(title, body, accent: palette.sand)`
Sand-colored callout with top accent border and circle marker. For notes, warnings, tips.
```typst
#callout-box([Management Implication], [Artificial shading reduced temperatures by 2.8 C.])
```

### `#tide-tag(content, color: palette.primary)`
Capsule-shaped categorization label.
```typst
#tide-tag([Intertidal Ecology], color: palette.primary)
```

### `#tide-divider(color: palette.primary, width: 80%)`
Decorative SVG wave separator with flanking lines.
```typst
#tide-divider(color: palette.primary)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Sandy White** | `#F8F6F0` | `palette.bg` | Primary background |
| **Text Dark** | `#1E2D3D` | `palette.ink` | Main body text |
| **Aquamarine** | `#4ECDC4` | `palette.primary` | Primary accent, wave motifs, borders |
| **Deep Navy** | `#1A3A4A` | `palette.navy` | Titles, dark backgrounds, strong accents |
| **Sand Gold** | `#D4A76A` | `palette.sand` | Warm accents, dates, highlights |
| **Coral** | `#E87461` | `palette.coral` | Alert accents, specimen highlights |
| **Dark Aquamarine** | `#137D78` | `palette.primary-text` | Accessible aquamarine text |
| **Dark Sand** | `#8A5A24` | `palette.sand-text` | Accessible sand text |
| **Dark Coral** | `#AC4637` | `palette.coral-text` | Accessible coral text |
| **Ink Muted** | `#1E2D3D` (50% transparent) | `palette.ink-muted` | Footer, subtle text |
| **Card BG** | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| **Border Light** | `#1A3A4A` (80% transparent) | `palette.border-light` | Card borders |
| **Water Tint** | `#4ECDC4` (94% transparent) | `palette.water-tint` | Subtle water background |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## SVG Decorations

The theme includes the following inline SVG elements:

| SVG | Description | Usage |
|-----|-------------|-------|
| `_wave-svg` | Sine wave curves at multiple depths/opacities | Background atmosphere on slides |
| `_tidal-lines-svg` | Horizontal dashed tide marks with sediment dots | Background texture |
| `_pool-ripple-svg` | Concentric circles with organic details | Corner decorations, specimen icon |
| `_tidal-atmosphere-svg` | Full-page combination of waves, pools, sand particles | Content slide `setting()` |
| `_wave-divider-svg` | Double-wave horizontal line | Header underlines, section dividers |
| `_quote-wave-svg` | Stylized wave-form quote marks | Quote card decoration |

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example
- `theme.md` -- API summary (this file)

## Demo

See `demo.typ` for a compilable example featuring intertidal zone biodiversity research content.
