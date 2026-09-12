# ink-landscape - Theme Design Specification

> **Purpose**: Visual and structural design spec for the ink-landscape Touying theme. Chinese ink wash painting (水墨山水画) aesthetic — you are unrolling a Song dynasty landscape scroll painting. Rice paper texture, flowing ink gradients, distant mountains fading into mist, red seal stamps as punctuation, brush stroke calligraphy.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | ink-landscape |
| **Page Format** | 16:9 (presentation-16-9) |
| **Best For** | Chinese culture, literature, history, philosophy, calligraphy, traditional arts, academic lectures on Asian studies |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 widescreen |
| **Touying Setting** | `config-page(..utils.page-args-from-aspect-ratio(aspect-ratio))` |
| **Margins** | top: 4em, bottom: 2em, x: 2.2em |

## III. Visual Theme

### Design Philosophy

You are unrolling a Song dynasty landscape scroll painting. The visual identity draws from centuries of Chinese landscape painting tradition — flowing ink gradients, layered mountain silhouettes with atmospheric perspective (远山近水), warm rice paper texture as background, vermillion seal stamps as accent marks, and the calligraphic energy of brush strokes. Empty space (留白) is treated as an active design element, not void.

**World-Building**: Every content slide carries persistent mountain atmosphere at the bottom (5-15% opacity) and scattered ink dots in the upper corner, so the viewer never "leaves" the landscape scroll.

**Bookending**: Title and ending slides share three visual elements (bamboo branch top-right, seal stamp top-left, stronger mountain range) that are NOT present on content slides. This creates a narrative "opening and closing the scroll."

### Color Scheme — Fixed Palette (Rich)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Heavy Ink (浓墨) | `#2C2C2C` | `palette.primary` | Headers, brush strokes, mountain silhouettes |
| **Dark** | Deepest Ink | `#1A1A1A` | `palette.dark` | Maximum contrast text |
| **Accent** | Vermillion Seal Red (朱砂红) | `#C23B22` | `palette.accent` | Seal stamps, emphasis, section accents |
| **Background** | Rice Paper (宣纸) | `#F8F4EF` | `palette.bg` | Page background, warm off-white |
| **Card** | Aged Rice Paper | `#F0EBE3` | `palette.card` | Content cards, scroll-style boxes |
| **Text Dark** | Deep Ink | `#1A1A1A` | `palette.text-dark` | Headings, primary text |
| **Text Body** | Medium Ink | `#3A3A3A` | `palette.text-body` | Body text |
| **Text Light** | Dilute Ink (淡墨) | `#8A8A7A` | `palette.text-light` | Captions, secondary text, section numbers |
| **Border** | Paper Edge | `#D4CEC4` | `palette.border` | Card borders, scroll edges |
| **Seal Red** | Vermillion (朱砂) | `#C23B22` | `palette.seal-red` | Seal stamp elements |
| **Light Ink** | Faint Wash | `#B8B0A4` | `palette.light-ink` | Background decorations |
| **Bamboo Green** | Bamboo (竹) | `#527052` | `palette.bamboo-green` | Accessible nature accents, pavilion highlights |
| **Mist** | Mountain Mist | `#E8E2D8` | `palette.mist` | Gradient cards, misty atmosphere |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (#2C2C2C) | Theme primary ink color |
| `neutral-lightest` | `palette.bg` (#F8F4EF) | Rice paper background |
| `neutral-darkest` | `palette.text-dark` (#1A1A1A) | Deep ink text |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Theme Entry** | Document-controlled | Theme sets size and ink color only; it does not set the document font |
| **Demo** | Libertinus Serif, Noto Serif SC | `set text(font: ("Libertinus Serif", "Noto Serif SC"))` in demo.typ |
| **Code** | Menlo, Noto Sans SC | `show raw: set text(font: ("Menlo", "Noto Sans SC"))` |

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 18pt | Set via `set text(size: 18pt)` in theme entry point |

## V. SVG Decorative Elements

| SVG | Elements | Usage | Key Features |
|-----|----------|-------|--------------|
| **Mountain Range** | 16+ (3 peaks, 5 mist bands, 8 tree marks) | Persistent page background on EVERY content slide (bottom 35%) | Layered opacity (5%, 8%, 12%), mist ellipses between peaks |
| **Brush Stroke** | 2 paths (25+ control points) | Header underline on every slide | Variable-width calligraphic stroke simulating brush pressure |
| **Seal Stamp** | 18+ elements (borders, strokes, wear marks) | Footer marker, decorative accent | Square seal with internal character strokes and corner notches |
| **Bamboo Branch** | 18 elements (stems, nodes, leaves) | Corner decoration on title/ending/focus/pavilion | Multiple stems with node ellipses and leaves at varying angles |
| **Ink Splash** | 15 elements (washes, tendrils, droplets, rings) | Title, section, focus, ending, and verse-quote backgrounds | Organic asymmetric wash with satellite droplets and diffusion rings |
| **Brush Divider** | 2 paths (22+ control points) | Full-width separator between sections | Calligraphic horizontal rule with pressure variation |

## VI. Slide Type Definitions

### Title Slide (`title-slide`)

- **Background**: Rice paper with ALL bookending elements
- **Decorative elements**: Bamboo branch (top-right, 140pt), seal stamp (top-left, 36pt), ink splash (center, 200pt), mountain range (bottom, 42% height, stronger opacity)
- **Layout**: Centered — title, brush underline, subtitle, author, institution, date
- **Character**: Maximally decorated, creates the "opening the scroll" feeling

### Section Slide (`new-section-slide`)

- **Background**: Rice paper + large ink splash (280pt, center) + mountains at bottom
- **Layout**: Left-aligned padding — large section number (4em, dilute ink), section title (2.2em bold), brush underline
- **Decorative elements**: Ink splash (center), seal stamp (top-right, 32pt), brush divider (bottom center)
- **Dramatic departure**: Ink splash as focal element, no header/footer

### Content Slide (`slide`)

- **Background**: Rice paper with PERSISTENT mountain atmosphere (bottom 35%) + scattered ink dots (top-right)
- **Header**: Semibold title (1.3em) + brush stroke SVG underline (140pt)
- **Footer**: Three-column grid — high-contrast metadata | seal stamp (14pt, 60% transparent) | page counter
- **Atmosphere**: `_slide-atmosphere()` is installed through `config-page(background:)`, keeping mountains + ink dots behind content and chrome on EVERY content slide

### Focus Slide (`focus-slide`)

- **Background**: Rice paper + LARGE ink splash (320pt center) + mountains + bamboo (bottom-right)
- **Content**: Centered bold text (70% width) + red brush underline below
- **Decorative elements**: Ink splash (large, dramatic), bamboo corner, seal stamp (bottom-left)
- **Most dramatic departure**: Largest ink splash, no header/footer

### Ending Slide (`ending-slide`)

- **Background**: Rice paper with ALL bookending elements (matches title)
- **Decorative elements**: Bamboo (top-right, 140pt), seal stamp (top-left, 36pt), ink splash (subtle, 180pt), mountain range (bottom, 42%, stronger opacity)
- **Layout**: Centered — farewell text, brush underline, brush divider
- **Bookends with title**: Same bamboo, seal, mountain positions create "closing the scroll"

## VII. Component Design

| Component | Signature | Structure Type | Visual Description |
|-----------|-----------|----------------|-------------------|
| `scroll-card` | `scroll-card(title, body, accent)` | Scroll-shaped (top/bottom paper edges) | Dark paper-roll edges (4pt) top and bottom, aged card fill, accent title |
| `seal-stat` | `seal-stat(label, value, color)` | SVG overlay (seal behind number) | Large number with 80% transparent seal stamp placed behind via `place()` |
| `verse-quote` | `verse-quote(quote, author)` | SVG background (ink splash behind) | Centered text with vertical bars, ink-splash SVG at 140pt behind content |
| `ink-box` | `ink-box(title, body, accent)` | SVG top border (brush stroke) | Card with brush-stroke SVG as top border instead of straight line |
| `stamp-tag` | `stamp-tag(content, color)` | Inline tag/badge | Red-tinted background, 1pt border, small semibold text |
| `ink-divider` | `ink-divider(color, width)` | SVG divider (brush stroke) | Full-width calligraphic brush SVG separator |
| `pavilion-highlight` | `pavilion-highlight(title, body)` | SVG overlay (bamboo in corner) | Card with bamboo branch placed via `place()` in top-right, brush underline |
| `mist-card` | `mist-card(title, body)` | Gradient fill (no border) | Linear gradient from mist color to bg, subtle border, dreamy feel |
| `landscape-section` | `landscape-section(title, body)` | NO border (typography only) | Semibold title + brush SVG divider + content, no containing box |

### Structural Diversity Verification

- SVG decoration inside component: `seal-stat` (seal stamp), `verse-quote` (ink splash), `ink-box` (brush stroke border) -- 3 components
- `place()` for decorative overlay: `seal-stat`, `pavilion-highlight` -- 2 components
- NO visible border: `landscape-section`, `verse-quote` -- 2 components
- SVG-based DIVIDER: `ink-divider` -- 1 component
- TAG/BADGE inline: `stamp-tag` -- 1 component
- Gradient/material: `mist-card` -- 1 component

## VIII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Persistent atmosphere | Mountain silhouette on EVERY content slide -- viewer never leaves the scroll |
| 2 | Emptiness is presence (留白) | White space represents clouds, mist, water — active design element |
| 3 | Seal red used sparingly | Like a master's chop on a painting — powerful because rare |
| 4 | Layered atmospheric depth | Mountains progressively lighter (6%, 10%, 15%) creates spatial poetry |
| 5 | Warm not cold | Rice paper warmth (#F8F4EF) instead of pure white — organic, aged |
| 6 | Brush energy over precision | SVG strokes are organic and flowing, never mechanical |
| 7 | Bookending creates narrative | Title/ending share elements (bamboo, seal, strong mountains) that content slides don't |

## IX. Design References

| Reference | Description |
|-----------|-------------|
| Song Dynasty landscape painting | Mountain composition, atmospheric perspective, three distances |
| Traditional seal carving (篆刻) | Vermillion seal stamp shapes with internal character strokes |
| Xuan paper texture | Warm cream color (#F8F4EF), subtle fiber texture feel |
| Bamboo ink painting tradition | Brush stroke economy, node structure, leaf angles |
| Ink splash technique (泼墨) | Organic asymmetric forms with satellite droplets |
| Calligraphic horizontal strokes | Variable-width brush pressure in underlines |

---

## Output Files

```
ink-landscape/
├── template.typ          # Theme definition — SVGs, components, slide functions, entry point
├── demo.typ              # Compilable demonstration (20 slides, 15+ distinct layouts)
├── theme_design_spec.md  # This specification document
└── theme.md              # API summary for downstream roles
```
