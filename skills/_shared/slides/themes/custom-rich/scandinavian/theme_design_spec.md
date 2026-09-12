# Scandinavian - Theme Design Specification

> **Purpose**: Visual and structural design spec for a Nordic minimalist Touying theme. Clean whites, soft grays, muted sage green and dusty blue accents. Natural, calm, functional beauty inspired by Scandinavian interior design (hygge meets function).

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | scandinavian |
| **Display Name** | Scandinavian |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Design studios, wellness/mindfulness, sustainable products, Scandinavian companies, architecture, interior design presentations |
| **Style Objective** | A) General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 3.5em, bottom: 1.5em, x: 2em |

## III. Visual Theme

### Design Philosophy

Less is more. Generous whitespace, subtle color use, clean geometric forms. Natural material colors (wood, stone, linen). The beauty is in precision and restraint. Typography-forward with clear hierarchy. Inspired by MUJI, HAY, and Nordic living - functional elegance where every element earns its place.

### Color Scheme

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Muted Teal/Sage | `#3D5A5B` | `palette.primary` | Headers, accent lines, focus backgrounds |
| **Secondary** | Warm Wood | `#C4956A` | `palette.secondary` | Warm accents, decorative elements |
| **Secondary Text** | Deep Warm Wood | `#9B633B` | `palette.secondary-text` | Text-safe warm titles, tags, and KPI values |
| **Background** | Warm White | `#FAFAF8` | `palette.bg` | Page background |
| **Card** | Pure White | `#FFFFFF` | `palette.card` | Content cards, boxes |
| **Off-White** | Linen | `#E8E2D9` | `palette.off-white` | Subtle fills, section backgrounds |
| **Text Dark** | Charcoal | `#2C3639` | `palette.text-dark` | Headings, primary text |
| **Text Body** | Soft Dark | `#4A5859` | `palette.text-body` | Body text |
| **Text Light** | Muted Gray | `#667577` | `palette.text-light` | Text-safe captions, labels, and secondary text |
| **Border** | Soft Border | `#E0DDD7` | `palette.border` | Card borders, dividers |
| **Stone** | Cool Stone | `#B8C4C4` | `palette.stone` | Subtle decorative fills |
| **Stone Text** | Deep Cool Stone | `#5D6E70` | `palette.stone-text` | Text-safe cool-stone titles and labels |

`secondary` and `stone` remain decorative tokens. Reusable components map them to `secondary-text` and `stone-text` whenever the accent is rendered as text.

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (#3D5A5B) | Theme accent, alert() text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` (#2C3639) | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | Avenir, Arial, PingFang SC | `set text(font: ("Avenir", "Arial", "PingFang SC"))` |
| **Code** | JetBrains Mono | `show raw: set text(font: "JetBrains Mono")` |

> Font is set ONLY in `demo.typ`/`main.typ`, NOT in `template.typ`.

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 20pt | Set via `set text(size: 20pt)` in theme entry point |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Warm white (#FAFAF8) - clean and bright
- **Layout**: Centered title block with generous vertical spacing. Title in dark charcoal, subtitle in muted gray, thin sage horizontal line separator, author/date in text-light below
- **Decorative elements**: Single thin horizontal line (1pt sage), minimal geometric circle ornament (sage, low opacity) in corner
- **Colors**: Dark text on warm white, sage accent line

### Section Slide (`new-section-slide`)

- **Background**: Left area with subtle off-white/linen fill (#E8E2D9 at 40%), rest warm white
- **Layout**: Left-aligned section number (large, light weight, sage color), section title below in dark charcoal
- **Decorative elements**: Thin vertical sage line on left edge, section number in large light font
- **Numbering**: `utils.display-current-heading-number(level: 1, numbering: "01")`

### Content Slide (`slide`)

- **Background**: Warm white (#FAFAF8)
- **Header**: No top bar. Clean bold title in charcoal, thin sage underline (1.5pt, 50pt width) below title. Minimal and typography-forward.
- **Persistent atmosphere**: Restrained overlapping linen/stone circles below the upper-right header edge, placed beneath body and chrome content
- **Footer**: Three-column grid: footer text (text-light) | small sage circle (2pt) | page counter (text-light)
- **Content area**: Open area with body text in text-body color

### Focus Slide (`focus-slide`)

- **Background**: Muted teal/sage (#3D5A5B) solid fill
- **Text**: Large white centered text, clean and impactful

### Ending Slide (`ending-slide`)

- **Background**: Warm white with centered design
- **Layout**: Centered thank-you text in sage primary, thin decorative line below, small geometric ornament of three side-by-side sage circles at different opacities

### Outline Slide (`outline-slide`)

- **Background**: Warm white
- **Layout**: Title "Contents" with sage underline, TOC list in body text

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `hygge-card` | `hygge-card(title, body, accent: palette.primary)` | Soft card for content grouping | Rounded card (8pt radius), very subtle border (#E0DDD7), light fill, sage accent on top (2pt line). Warm, cozy. |
| `nature-box` | `nature-box(title, body, accent: palette.primary)` | Callout/admonition box | Left sage border (3pt), very light sage fill, clean title, body text below |
| `stone-stat` | `stone-stat(value, label, accent: palette.primary)` | KPI/metric display | Large bold value in accent color, small label below in text-light |
| `linen-divider` | `linen-divider(width: 100%)` | Soft decorative separator | Thin line (0.75pt) in border color, centered. Subtle breathing space. |
| `birch-tag` | `birch-tag(content, color: palette.primary)` | Minimal rounded tag/pill | Small capsule shape, very light fill, subtle border, text in color |
| `fjord-quote` | `fjord-quote(quote, author: none)` | Elegant blockquote | Thin left line (2pt sage), italic quote text, author in text-light below |
| `warm-box` | `warm-box(title, body)` | Warm secondary callout preset | `nature-box` treatment using the wood/terracotta semantic accent |
| `scandi-table` | `scandi-table(align: center + horizon, headers, rows)` | Clean tabular data | Linen header, alternating light rows, subtle borders, configurable cell alignment |

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Less is more | Every element must earn its place. Remove before adding. |
| 2 | Generous whitespace | Space is a design element. Let content breathe. |
| 3 | Natural material palette | Colors evoke wood, stone, linen, sage - grounded and calm |
| 4 | Typography-forward | Clear hierarchy through size/weight, not decoration |
| 5 | Precision in restraint | Beauty comes from perfect placement, not abundance |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| MUJI product design | Minimalist, functional, natural materials |
| HAY furniture | Clean Scandinavian forms, muted colors |
| Nordic interior design | Hygge, whitespace, natural light, subtle texture |
| Kinfolk magazine | Typography-led design, restrained palette |
