# Aurora Borealis Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: aurora-borealis-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime.today(),
  ),
)

#title-slide()

= Section Title
== Slide Title
Content here...

#focus-slide()[Key Message]
#ending-slide()[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content |
| `footer` | content/none | `none` | Footer text displayed on content slides |

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| `palette.bg` | `#FAFCFF` | Slide background (clean white/blue tint) |
| `palette.primary` | `#4A2C6E` | Deep violet — titles, primary accents |
| `palette.secondary` | `#2EC4B6` | Decorative aurora teal — borders and waves |
| `palette.accent` | `#3DDC97` | Decorative aurora green — borders and waves |
| `palette.pink` | `#E8A1D0` | Decorative soft pink — borders and fills |
| `palette.focus-bg` | `#186F69` | Deep teal focus-page background |
| `palette.secondary-text` | `#17776F` | Text-safe teal on light surfaces (5.38:1 on white) |
| `palette.accent-text` | `#14734E` | Text-safe green on light surfaces (5.85:1 on white) |
| `palette.pink-text` | `#9A3D75` | Text-safe pink on light surfaces (6.37:1 on white) |
| `palette.text-dark` | `#2B2D42` | Dark text for headings |
| `palette.text-body` | `#3D4055` | Body text color |
| `palette.text-muted` | `#686B7E` | Muted/secondary text (5.26:1 on white) |
| `palette.card-bg` | `#FFFFFF` | Card backgrounds |
| `palette.border` | `#E4E6F0` | Subtle borders |
| `palette.aurora-violet` | `#7B4FA2` | Aurora band violet |
| `palette.aurora-teal` | `#2EC4B6` | Aurora band teal |
| `palette.aurora-green` | `#3DDC97` | Aurora band green |
| `palette.aurora-cyan` | `#45E3D0` | Aurora band cyan |

## Slide Types

### `title-slide()`
Full-page deep violet slide with aurora curtain SVG, star clusters, and rounded border frame. Reads from `config-info()`.

### `new-section-slide` (automatic)
Triggered by `= Heading`. Deep violet background with aurora wave band and constellation dots.

### `slide(title: auto, align: auto)`
Standard content slide with aurora wave header, persistent constellation atmosphere background, gradient underline accent.

### `focus-slide(body)`
Deep teal aurora background with wavy bands and centered white text (width-constrained to 80%).

### `ending-slide(body)`
Light background with aurora atmosphere, bookend border frame matching title-slide, aurora wave bands, and constellation dots.

## Reusable Components

### `concept-card(title, body, accent: palette.primary)`
Intrinsic-height card with a colored left border. Use `accent` for color variants and place regular matrices in `grid()`.

### `insight-box(title, body)`
Violet-accented callout with SVG quotation mark decoration and a terminal lazy-layout spacer.

### `stat-card(label, value, unit: none, accent: palette.secondary)`
Intrinsic-height, centered value → label → unit metric display in one fixed-spacing stack. It supports short and long values without paragraph-flow spacers.

### `quote-card(quote-text, attribution: none)`
Blockquote with SVG aurora quotation marks, italic text, optional attribution, and a terminal lazy-layout spacer.

### `feature-card(number, title, description)`
Numbered card with aurora color cycling (violet → teal → green → aurora-violet → pink), a top accent border, and an accessible circular number badge.

### `highlight-box(title, body)`
Teal-accented emphasis box with constellation SVG decoration. For featured content.

### `data-card(title, body)`
Structured list card with aurora divider separator and a terminal lazy-layout spacer.

### `callout-box(title, body, accent: palette.accent)`
Versatile alert/info box with configurable accent color. Left border accent.

### `roadmap-card(year, title, body, accent: palette.primary)`
Compact, intrinsic-height year/title/list panel for regular timeline grids.

### `aurora-tag(content, color: palette.secondary)`
Inline pill/badge element for tags, categories, or labels.

### `aurora-table(headers, rows, align: center + horizon)`
Bare data table with a semantic header row, alternating row backgrounds, and caller-configurable cell alignment.

## Decorative Helpers

### `aurora-wave(width: 100%, height: 18pt)`
Horizontal flowing aurora wave band (cubic bezier curves with gradient strokes).

### `aurora-divider(width: 100%, height: 8pt)`
Wavy horizontal separator with aurora gradient glow effect.

### `constellation-dots(width: 120pt)`
Star constellation pattern with connecting lines.

## Layout Tips

- Use `cols()` for semantic side-by-side regions and `grid()` for regular card matrices.
- Terminal lazy-layout spacers are inert outside lazy layout; each `cols(lazy-layout: true)` column must contain exactly one direct stretchable component.
- Keep complete vertical cards or content regions in direct natural flow. Use `stack(spacing:)` only when several elements form one deliberate visual group with controlled internal rhythm.
- Combine stat cards in three- or four-column grids for dashboards; their centered internals remain stable across value and label lengths.
- The theme entry point intentionally does not set a font. Set an installed Latin/CJK font tuple in the deck when a project requires explicit font ownership.

## Visual Identity

- **Metaphor**: Northern lights dancing across the Arctic sky
- **Atmosphere**: Persistent aurora background on all content slides (constellation dots, faint gradient bands)
- **Bookending**: Title and ending slides share rounded border frame + corner star clusters
- **Signature**: Flowing cubic bezier aurora wave bands as header decoration
- **Palette Logic**: Violet (depth/mystery) → Teal (energy/clarity) → Green (growth/nature) → Pink (warmth/beauty)
