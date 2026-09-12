# Art Deco Theme - Design Specification

## Theme Overview

| Property | Value |
|----------|-------|
| Theme Name | Art Deco |
| Display Name | Art Deco |
| Complexity | Rich |
| Style Objective | Luxury / Premium Corporate |
| Aspect Ratio | 16:9 |
| Touying Version | 0.7.4 |

## Design Philosophy

The roaring twenties reborn -- geometric precision meets opulence. Gold accents on dark surfaces. Fan-shaped and sunburst decorative elements. Strong vertical and diagonal lines. The elegance of the Chrysler Building in slide form. Deep navy backgrounds with champagne gold metallic accents create a sense of luxury, while geometric patterns (chevrons, sunbursts, fan shapes) provide structure and rhythm.

Bright champagne gold is decorative or reserved for large text on navy. Small semantic emphasis on cream/white surfaces uses the deeper `gold-text` token so the palette remains readable.

## Best For

Luxury brands, fashion, awards ceremonies, galas, finance/banking, high-end real estate, premium product launches.

---

## Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Primary (Gold) | Champagne Gold | #C9A84C | Accents, borders, titles on dark, decorative elements |
| Secondary (Navy) | Deep Navy | #0A1628 | Dark backgrounds, section slides, headers |
| Accent (Emerald) | Emerald Green | #2D4A3E | Secondary accent, tags, variety |
| Background | Cream/Ivory | #FFFDF7 | Content slide backgrounds |
| Card Background | White | #FFFFFF | Card fills on light pages |
| Text Dark | Deep Charcoal | #1A1A2E | Primary text on light backgrounds |
| Text Body | Slate | #3D3D56 | Body text |
| Text Light | Muted Gold | #756A42 | Captions and metadata on cream/white surfaces |
| Gold Text | Deep Gold | #755A12 | Text-safe gold on cream/white surfaces |
| Border | Warm Gray | #D4CFC2 | Card borders, dividers |

## Typography

| Level | Size | Weight | Color |
|-------|------|--------|-------|
| Display (Cover) | 2.4em | Bold | Gold (#C9A84C) |
| H1 (Section) | 2.2em | Semibold | Gold on navy / Navy on light |
| H2 (Slide Title) | 1.4em | Medium | Navy (#0A1628) |
| Body | 20pt (base) | Regular | Slate (#3D3D56) |
| Small/Caption | 0.8em | Regular | Muted (#8B7D4A) |
| Tiny | 0.7em | Regular | Muted |

Font: Set in demo.typ (not in template). The verified demo stack is `("Georgia", "Noto Serif SC")`; projects may use another installed serif stack.

---

## Slide Types

### 1. Content Slide (`slide`)
- Background: Cream (#FFFDF7)
- Header: Navy title text, gold underline (60pt), small gold diamond corner accent top-right
- Footer: 3-column grid -- gold chevron left, footer text center, page number right
- Margin: top 4.5em, bottom 1.8em, x 2em

### 2. Title Slide (`title-slide`)
- Background: Deep navy (#0A1628)
- Gold geometric frame/border pattern using `place()` -- corner brackets made of gold lines
- Title: Large gold text, centered
- Subtitle: Light cream text
- Gold horizontal decorative line separator
- Author/date in muted cream

### 3. Section Slide (`new-section-slide`)
- Background: Deep navy (#0A1628)
- Gold fan/sunburst decorative element (radiating lines from a point)
- Section title: Large gold text
- Gold underline accent
- Geometric gold corner decorations

### 4. Focus Slide (`focus-slide`)
- Background: Deep navy
- Gold rectangular frame/border (inset from edges)
- Large centered white text
- Corner geometric accents (gold)

### 5. Ending Slide (`ending-slide`)
- Background: Deep navy
- Gold chevron pattern (V-shapes stacked)
- "Thank You" in large gold text
- Decorative gold lines and diamond shapes

### 6. Outline Slide (`outline-slide`)
- Background: Cream
- Title with gold underline
- TOC entries with gold diamond bullet markers
- Gold decorative corner accents

---

## Components

### 1. `gilded-card(title, body, accent)`
Card with gold top border (3pt) + small gold corner detail (top-right triangle). White fill, warm border. Includes `lazy-v(1fr)` and is intended as the single direct component in each `cols(lazy-layout: true)` column.

### 2. `deco-box(title, body, accent)`
Callout box with a geometric left rule and diamond title marker. Light fill derived from accent. For key insights and highlights.

### 3. `trophy-stat(label, value, trend)`
KPI display with diamond icon → value → label → optional trend in one centered `stack(spacing: .8em, ...)`. The deep-gold value is readable on the white card, and the layout supports short/long values plus Latin/CJK labels.

### 4. `chevron-divider()`
Decorative gold line with three V-shaped chevrons as a horizontal separator.

### 5. `gatsby-tag(content, color)`
Elegant pill tag with gold border, transparent fill, text in specified color. Capsule shape with refined stroke.

### 6. `marquee-quote(quote, author)`
Quote block with large art deco quotation marks (gold), italic text, author attribution. Cream background with gold left accent.

---

## Decorative Elements

- **Gold corner brackets**: L-shaped gold lines at corners of frames
- **Fan/sunburst rays**: Radiating gold lines from a focal point
- **Chevron patterns**: V-shaped repeating gold motifs
- **Diamond shapes**: Small gold diamond accents as bullet points or separators
- **Geometric stepped borders**: Layered/stepped line patterns typical of Art Deco
