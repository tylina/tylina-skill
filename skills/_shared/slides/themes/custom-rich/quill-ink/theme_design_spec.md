# Quill Ink Theme — Design Specification

## Theme Identity

**Name:** Quill Ink
**Category:** Custom Rich
**Suitability:** Academic (humanities, philosophy, literature, history)
**Aesthetic:** Calligraphic ink-on-parchment
**Mood:** Elegant, literary, timeless, scholarly

## Design Concept

The theme evokes a scholar's writing desk where ideas are carefully penned with fountain pen flourishes. Deep indigo ink strokes on warm ivory paper create a sense of tradition, intellectual depth, and careful craftsmanship. The visual language draws from:

- Illuminated manuscripts and codices
- Calligraphic tradition (Western and Eastern)
- Aged parchment and vellum
- Fountain pen ink work
- Academic publishing traditions

## Color System

### Light Theme Palette

| Role | Hex | RGB | Usage |
|------|-----|-----|-------|
| Background | `#FBF9F4` | 251, 249, 244 | Warm ivory/parchment base |
| Primary | `#2C3E6B` | 44, 62, 107 | Deep indigo ink — titles, accents |
| Secondary | `#8B4513` | 139, 69, 19 | Warm sienna/sepia — annotations, quotes |
| Tertiary | `#4A6741` | 74, 103, 65 | Forest green ink — theorems, propositions |
| Text Dark | `#1A1A2E` | 26, 26, 46 | Near-black ink — strong headings |
| Text Body | `#3D3D5C` | 61, 61, 92 | Dark indigo — body text |
| Text Muted | `#7A7A99` | 122, 122, 153 | Muted indigo-gray — captions |
| Card BG | `#FFFEF9` | 255, 254, 249 | Cream white — card surfaces |
| Border | `#D4C5A9` | 212, 197, 169 | Aged paper edge — borders |
| Accent Muted | `#E8DCC8` | 232, 220, 200 | Parchment accent — subtle fills |

### Color Relationships

- Primary-to-background contrast ratio: ~8.5:1 (WCAG AAA)
- Body text contrast on background: ~7.2:1 (WCAG AAA)
- Secondary provides warm contrast to the cool indigo primary
- Tertiary (green) used sparingly for formal/mathematical elements
- All colors chosen to harmonize within a warm, aged-paper color space

## Typography

### Font Stack (set in demo.typ)
- Primary: Baskerville (serif, academic)
- Fallback: Songti SC, Arial Unicode MS
- Monospace: System default (Noto Sans Mono)

### Scale
- Base size: 20pt (set in theme entry)
- Title slides: 2.2em (~44pt)
- Section headings: 2.0em (~40pt)
- Slide titles: 1.3em (~26pt)
- Body: 1.0em (20pt)
- Components: 0.82em (~16.4pt)
- Tags: 0.72em (~14.4pt)
- Footer: 0.65em (~13pt)

### Weight Usage
- Bold: Titles, headings, emphasis
- Semibold: Author names, section labels
- Regular: Body text
- Italic: Quotations, marginalia, Latin terms

## SVG Decoration System

### Decorations (6 SVG elements)

1. **Parchment Texture** (800x450)
   - Subtle horizontal fiber lines with slight waviness
   - Faint vertical grain paths
   - Scattered tiny aging spots
   - Opacity range: 0.02-0.04 for maximum subtlety
   - 20+ elements

2. **Calligraphic Flourish** (300x24)
   - Flowing S-curve with varying stroke width feel
   - Central dot ornament with smaller flanking dots
   - Terminal curls at both ends
   - 8 elements

3. **Ink Drops/Splatter** (80x80)
   - Organic cluster of varying-size circles
   - One dominant drop, several satellite drops
   - Faint connecting splatter path
   - Opacity gradient from center outward
   - 10 elements

4. **Quill Pen Ornament** (60x100)
   - Stylized feather silhouette with barb detail
   - Clear nib/point at bottom
   - Subtle vane lines
   - 10 elements

5. **Ink Border Frame** (800x450)
   - Double-line rectangular border
   - Emphasized calligraphic corners with stroke thickening
   - Corner dots at intersections
   - 12 elements

6. **Quote Marks** (48x48)
   - Large calligraphic opening quotation marks
   - Organic, hand-drawn feel
   - Internal shadow detail
   - 8 elements

7. **Quill Nib Icon** (16x16)
   - Minimal pen nib shape
   - Split point detail
   - 8 elements

### SVG Usage Pattern
```typst
#let _svg-definition = ```<svg ...>...</svg>```.text

#let render-helper(color: default, size: default) = {
  let svg = _svg-definition.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}
```

## Layout Architecture

### Slide Types

| Type | Background | Header | Footer | Frame | Atmosphere |
|------|-----------|--------|--------|-------|-----------|
| Title | Ivory + texture | None | None | Ink border frame | Quill + drops |
| Content | Ivory + texture | Indigo title + rule | Page numbers + diamond | None | Full atmosphere |
| Section | Ivory + texture | None | None | None | Ink drops |
| Outline | Ivory + texture | None | None | None | Quill accent |
| Focus | Deep indigo | None | None | Accent lines | Ink drops (light) |
| Ending | Ivory + texture | None | None | Ink border frame | Quill + drops |

### Margins
- Content slides: top 4.2em, bottom 1.8em, x 2.2em
- Full-bleed slides (title, section, ending): 0pt margins

### Background Atmosphere (`_bg-atmosphere`)
Applied to every content slide via the `setting` parameter:
1. Full-page parchment texture overlay (very subtle)
2. Small ink drops cluster (bottom-right, 32pt, 60% transparent)
3. Faint quill pen silhouette (top-right, 36pt, 80% transparent)

## Component Architecture

### Structural Diversity (11 components)

| Component | Structure Type | Key Features |
|-----------|---------------|--------------|
| `manuscript-card` | Block with fill+stroke | Top border accent, ink rule divider |
| `marginalia` | Borderless indented | SVG nib mark, italic, no border |
| `ink-quote` | Left-bordered with SVG | Quote marks SVG, sepia fill |
| `quill-tag` | Inline badge | Nib icon prefix, tiny tag |
| `theorem-block` | Stack(spacing:0) | Header+body adjacent blocks |
| `annotation-card` | Left-bar accent | Section symbol prefix |
| `stat-card` | Centered value | SVG ink drop decoration |
| `comparison-table` | Table element | Alternating parchment rows |
| `codex-box` | Full-border container | Double-rule top accent |
| `colophon` | Subtle block | Muted background, small text |

### Component Principles
- All block components use `lazy-v(1fr)` for column height equalization
- Content-block API: `#component[title][body]`
- `stack(spacing: 0pt)` for adjacent colored blocks (theorem-block)
- SVG decorations used inside components for visual richness
- No `height: 100%` in flow containers

## Bookending Strategy

Title and ending slides share:
- Ink border frame SVG (calligraphic corner accents)
- Quill pen ornament (left on title, right on ending)
- Ink drops decoration (right on title, left on ending)
- Calligraphic flourish divider
- Identical parchment texture background

Content slides do NOT have the ink border frame.

## Interaction with Touying 0.7.4

### Config Pattern
```typst
show: touying-slides.with(
  config-page(...),
  config-common(slide-fn: slide, new-section-slide-fn: new-section-slide),
  config-methods(alert: utils.alert-with-primary-color),
  config-colors(primary: ..., neutral-lightest: ..., neutral-darkest: ...),
  config-store(title: none, footer: footer),
)
```

### Slide Wrapper Pattern
All slide functions use `touying-slide-wrapper(self => { ... })`.

### Header/Footer as Functions
```typst
let header(self) = { ... }
let footer(self) = { ... }
```

### std.align Usage
Inside slide functions, `std.align` is used instead of bare `align` to avoid shadowing the parameter name.

## Accessibility

- All text meets WCAG AA contrast requirements (most meet AAA)
- SVG decorations are purely ornamental (do not convey information)
- Color is never the sole means of conveying meaning
- Clear typographic hierarchy for screen readers
- Adequate spacing between elements for readability

## File Structure

```
quill-ink/
  template.typ    — Theme implementation (palette, SVGs, slides, components, entry)
  demo.typ        — Compilable demo with academic philosophy content
  theme.md        — API reference documentation
  theme_design_spec.md — This file
```
