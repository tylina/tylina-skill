# Parchment Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | parchment |
| **Best For** | Humanities presentations, literary discussions, historical research, classical studies, philosophy |
| **Style Objective** | Scholarly, refined, warm |
| **Complexity Level** | Rich |

An aged parchment/vellum aesthetic with an illuminated manuscript feel. Warm cream/sepia background with rich burgundy and dark brown accents. Subtle SVG decorations of scroll corners, flourish dividers, and manuscript margin ornaments. Evokes the atmosphere of a beautiful old library, scholarly scrolls, and calligraphic flourishes.

## Design Philosophy

- **Warm & Scholarly**: Light cream background with rich burgundy and antique gold creates an inviting, intellectual atmosphere
- **Illuminated Manuscript**: SVG scroll corners, calligraphic flourishes, and margin rosettes reference medieval book arts
- **Refined Typography**: Serif fonts and elegant spacing evoke quality bookmaking traditions
- **Versatile Elegance**: Abstract enough for any presentation while carrying a distinctly humanities character

The theme entry sets size and color only. Presentation sources choose installed fonts; `demo.typ` uses the verified `IBM Plex Serif`, `Noto Serif SC`, and `IBM Plex Mono` families.

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Warm Cream | `#FAF7F0` | Primary background (parchment surface) |
| Deep Burgundy | `#6B2737` | Primary — titles, headings, key accents |
| Antique Gold | `#9B7B3C` | Accent — ornaments, flourishes, section numbers |
| Sage Green | `#5B7B6B` | Secondary — marginalia, supplementary elements |
| Dark Walnut | `#3B2820` | Text dark — deepest text color |
| Warm Brown | `#4A3828` | Text body — main content text |
| Muted Tan | `#8B7B6B` | Text muted — footer, subtle labels |
| Ivory White | `#FFFDF8` | Card background |
| Warm Border | `#D4C4A8` | Border lines, frames |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Serif", "Noto Serif SC"))
#show raw: set text(font: "IBM Plex Mono")

#show: parchment-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Cover slide with warm cream background, double border frame, scroll corner ornaments in all four corners, centered burgundy title with gold calligraphic flourish divider. Displays title, subtitle, author, institution, and date. Includes parchment texture effect.

### `slide(title: auto, ..args)`
Standard content slide with:
- Warm cream background
- Persistent, faint parchment-grain dots in the body area
- Bold burgundy title with gold accent line
- Footer with muted text, center rosette decoration, and slide counter

### `new-section-slide(self: none, body)`
Section divider slide (auto-triggered by `= Section Title`). Features warm cream background with parchment texture, left burgundy accent bar, large gold section number, burgundy section title, calligraphic flourish divider, and bottom rosette.

### `focus-slide(body)`
Single centered statement on parchment with ornamental burgundy border frame, corner rosette decorations, and gold flourish below the text. Ideal for quotes or key insights.

### `ending-slide(body)`
Closing slide with scroll corner ornaments, central rosette above the text, burgundy title, gold flourish divider, and double rule below. Evokes the colophon of a finished manuscript.

## Reusable Components

### `manuscript-card(title, body, accent: palette.primary)`
Card with colored top border and subtle side/bottom border. Features a burgundy (or custom accent) header with a short accent line separator. Ideal for structured content blocks, definitions, and key points.

```typst
#manuscript-card([The Ancient Scroll], [
  The _volumen_ dominated the ancient world for millennia...
], accent: palette.secondary)
```

### `folio-stat(label, value, color: palette.accent)`
Centered value-then-label stack with a left accent bar, like a folio page reference. Used for statistics, counts, and key numerical values.

```typst
#folio-stat([Calves per Bible], [250+], color: palette.primary)
```

### `marginalia-note(body, accent: palette.secondary)`
Side-note style annotation with left rule and italic text, evoking manuscript marginalia. For contextual notes, definitions, and asides.

```typst
#marginalia-note([_Note:_ The word "codex" derives from Latin _caudex_ (tree trunk).])
```

### `illuminated-box(title, body, color: palette.accent)`
Highlighted box with gold border and rosette icon beside the title. Evokes illuminated manuscript decorations. For key insights, important content, and featured information.

```typst
#illuminated-box([Gold Application Techniques], [
  - *Shell gold*: powdered gold mixed with gum
  - *Gold leaf on gesso*: raised gilding with burnished surface
], color: palette.accent)
```

### `colophon-tag(content, color: palette.primary)`
Small capsule-shaped label evoking printer's marks and colophon annotations. For categorization, labels, and metadata tags.

```typst
#colophon-tag([Benedictine], color: palette.primary)
#colophon-tag([Cistercian], color: palette.secondary)
```

Use native Typst enum syntax inside `manuscript-card` for numbered sequences; the theme does not expose a generic array-based list wrapper.

```typst
#manuscript-card([Five Foundational Scripts], [
  + Uncial
  + Carolingian minuscule
  + Gothic textura
])
```

## Helper Functions

### `scroll-corner(color: palette.accent, size: 48pt)`
Renders an SVG scroll corner ornament with flourish curves and terminal dots.

### `flourish-divider(color: palette.accent, width: 60%)`
Renders a calligraphic SVG flourish divider with central dot and sinuous curves.

### `margin-rosette(color: palette.accent, size: 24pt)`
Renders a small decorative SVG rosette/medallion with concentric circles and radial marks.

### `parchment-texture-bg(dot-count: 20)`
Renders faint scattered dots simulating aged paper grain texture.

### `double-rule(color: palette.border, width: 100%)`
Renders a classic thin-thick-thin triple rule line, a traditional book divider.

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.primary)[Burgundy heading]
#text(fill: palette.accent)[Gold accent text]
#text(fill: palette.secondary)[Sage annotation]
#text(fill: palette.text-dark)[Dark walnut text]
#text(fill: palette.text-muted)[Muted label text]
```

- `palette.bg`, `palette.primary`, `palette.accent`, `palette.secondary`
- `palette.text-dark`, `palette.text-body`, `palette.text-muted`
- `palette.card-bg`, `palette.border`, `palette.border-light`
- `palette.texture-dot`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` | Theme accent (burgundy), `alert()` text |
| `neutral-lightest` | `palette.bg` | Light backgrounds (cream) |
| `neutral-darkest` | `palette.text-dark` | Dark text (walnut) |

## Best Use Cases

- Humanities and liberal arts presentations
- Literary criticism and analysis
- Historical research and conferences
- Philosophy and classical studies
- Medieval and Renaissance studies
- Library science and book history
- Academic keynotes seeking a warm, refined aesthetic
- Any presentation desiring scholarly elegance

## Recommended Complexity

**Rich** -- This theme uses multiple SVG decorations (scroll corners, calligraphic flourishes, rosettes) and layered parchment textures. Use `manuscript-card`, `illuminated-box`, and native Typst enums for structured content that maintains the manuscript metaphor.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (scroll corners, flourish, author info)
2. Origins of the Codex (materials, preparation, scroll-to-codex transition)
3. The Scriptorium (monastic production, scripts, calligraphy)
4. The Art of Illumination (decorative programs, gold techniques)
5. Transmission of Knowledge (libraries, survival, manuscript to print)
6. Legacy and Digital Futures (codicology, digital humanities)
7. Focus slide (quote) and ending slide

## File Structure

```
parchment/
  template.typ         -- Theme definition (colors, slides, components)
  demo.typ             -- Full demonstration presentation
  theme_design_spec.md -- Detailed design specification
  theme.md             -- Quick reference documentation
```
