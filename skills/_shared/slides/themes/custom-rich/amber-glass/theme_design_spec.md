# Amber Glass Theme - Design Specification

## Theme Overview

| Property | Value |
|----------|-------|
| Theme Name | amber-glass |
| Display Name | Amber Glass |
| Complexity | Rich |
| Style Objective | Luxury / Premium Lifestyle |
| Aspect Ratio | 16:9 |
| Touying Version | 0.7.4 |

## Design Philosophy

Looking through amber-tinted glass -- warm, refractive, luminous. The theme evokes the feeling of light passing through honey: every surface glows with warmth, every card feels like a frosted glass panel catching golden light. Glass-morphism borders create depth without heaviness. The overall mood is one of elevated warmth -- inviting yet unmistakably premium.

## Best For

Luxury brand presentations, lifestyle products, premium services, wine/spirits industry, hospitality, jewelry, artisanal food/beverage, high-end real estate, wellness retreats.

---

## Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Primary | Warm Amber | #D4900A | Accent borders, stat highlights, decorative dots, title underlines |
| Secondary | Pale Honey | #F5E6C8 | Card borders, soft background fills, footer accents |
| Special Background | Honey Tint | #FFF5E0 | Title and ending slide backgrounds |
| Background | Warm White | #FFFDF8 | Content slide background |
| Text | Dark Warm Brown | #3D2E1A | Primary text on light backgrounds |
| Text Muted | Muted Gold-Brown | #746247 | Captions, metadata, footer text with AA contrast |
| Accent | Deep Amber | #9A5A00 | Accessible emphasis text, alternate card highlights, focus background |
| Success | Botanical Green | #3F6F2E | Positive trends and sustainability accents |
| Surface | Tinted Card BG | #FFF8EC | Card fill -- slightly warmer than background |

## Typography

| Level | Font | Size | Weight | Color |
|-------|------|------|--------|-------|
| Display (Cover) | Noto Serif SC / Libertinus Serif | 2.4em | Bold | Dark brown (#3D2E1A) |
| H1 (Section) | Noto Serif SC / Libertinus Serif | 2.2em | Semibold | Dark brown on warm bg |
| H2 (Slide Title) | Noto Serif SC / Libertinus Serif | 1.4em | Semibold | Dark brown (#3D2E1A) |
| Body | Consumer-defined; demo uses Arial / Noto Sans SC / Libertinus Serif | 20pt (base) | Regular | Dark brown (#3D2E1A) |
| Small/Caption | Arial / Noto Sans SC / Libertinus Serif | 0.78-0.82em | Regular/Medium | Muted (#746247) |
| Footer | Consumer-defined body font | 0.7em | Regular | Muted (#746247) |

The theme entry sets size and color but deliberately does not set the document font. Consumers own the base body font; display components use the safe Noto Serif SC / Libertinus Serif stack, and the demo supplies an Arial-first body stack with Noto Sans SC and Libertinus fallbacks.

---

## Slide Types

### 1. Content Slide (`slide`)
- Background: Warm white (#FFFDF8)
- Header: Dark brown semibold title in Noto Serif SC/Libertinus Serif, amber underline (60pt, 2.5pt thick, rounded)
- Small amber dot accent in top-right corner
- Footer: 3-column grid -- footer text left, amber diamond separator center, page number right
- Margin: top 4.5em, bottom 1.8em, x 2em

### 2. Title Slide (`title-slide`)
- Background: Warm honey (#FFF5E0) with subtle amber radial glows (circles, transparentized)
- Glass-morphism rectangular frame border (1.5pt amber, 12pt radius, inset 32pt)
- Title: Large dark brown text (2.4em bold, Noto Serif SC/Libertinus Serif)
- Subtitle: Muted text below
- Amber line separator with small dots on each end
- Author in deep amber, institution/date in muted

### 3. Section Slide (`new-section-slide`)
- Background: Warm white (#FFFDF8)
- Left amber accent band (6pt wide, full height)
- Subtle amber glow circles (decorative)
- Section title: Large dark brown (2.2em semibold, Noto Serif SC/Libertinus Serif)
- Amber underline (80pt, 3pt, rounded)
- Cascading amber dots (diminishing opacity)

### 4. Focus Slide (`focus-slide`)
- Background: Deep amber (#9A5A00)
- Frosted glass overlay circles (white, highly transparent)
- Frosted glass inner frame (80% width, 60% height, white stroke, 12pt radius)
- Text: White, 1.8em semibold, Noto Serif SC/Libertinus Serif, width-constrained
- Used for impactful quotes or key messages

### 5. Ending Slide (`ending-slide`)
- Background: Warm honey (#FFF5E0)
- Decorative amber circles at corners (varying sizes and opacities)
- Glass-morphism card frame (60% width, white fill, amber stroke, 12pt radius)
- Amber dot trio above text
- Main text: 2.4em bold dark brown
- Amber line with diamond below

---

## Components

### 1. `honey-card(title, body, accent)`
Frosted glass card: warm surface fill (#FFF8EC), amber top border (3pt), pale honey border on sides/bottom. Subtle glass shimmer circle at top-right. Radius 6pt. Includes `lazy-v(1fr)` for equal-height columns.

### 2. `glass-panel(title, body, accent)`
Translucent panel with accent-tinted fill (92% transparent). Left border (3pt accent), remaining borders subtle (70% transparent accent). Small dot before title. For callouts and highlighted content. Radius 6pt.

### 3. `warm-stat(label, value, trend)`
KPI display card: surface fill, amber top border (3pt). Small muted label, large deep-amber number (1.7em bold), optional green trend indicator. Radius 6pt.

### 4. `amber-divider()`
Decorative horizontal separator: two thin amber lines flanking a thicker center line, with amber dots as punctuation between segments.

### 5. `amber-tag(content, color)`
Warm pill tag: highly transparent fill (88%), amber stroke (30% transparent). Text in darkened accent color. Full capsule radius (99pt).

### 6. `amber-quote(quote, author)`
Quote block: surface fill, amber left border (3pt). Italic serif text for the quote, muted medium-weight author attribution. Radius on right side (6pt).

---

## Decorative Elements

- **Amber dots**: Circular amber accents of varying sizes and opacities -- the signature motif
- **Glass-morphism frames**: Rectangular borders with rounded corners and semi-transparent strokes
- **Radial glows**: Large, highly transparent circles suggesting warm light diffusion
- **Diamond accents**: Small rotated squares used in dividers and footers
- **Cascading opacity**: Repeated elements that fade out (dots, circles) suggesting depth and refraction
- **Left accent bands**: Solid amber strips on section slides for strong visual anchoring

## Aesthetic Principles

1. **Warmth over coolness**: Every color skews warm -- browns, honeys, ambers
2. **Glass-morphism**: Translucent layers, frosted borders, visible-but-diffused backgrounds
3. **Luminosity**: Decorative elements suggest light passing through material
4. **Restraint**: Rich but not heavy -- plenty of whitespace, subtle decorations
5. **Organic geometry**: Circles and rounded corners, not sharp angular forms
