# Silk Road Theme -- Design Specification

## Aesthetic Vision

The incredible mathematical precision of Islamic geometric art (tessellations, star patterns, arabesques) translated into a presentation design system. Rich jewel tones (lapis lazuli blue, turquoise, gold) on warm ivory/sand backgrounds. The intricate geometry becomes the structural language.

**Signature element**: Embedded SVG geometric star patterns (8-pointed stars from Islamic art) used as decorative headers and section dividers -- mathematically precise geometric constructions, not clipart.

## Color Palette

| Name | Hex | Role |
|------|-----|------|
| Ink | `#1B2B3A` | Deep midnight blue (text) |
| Paper | `#FDF8F0` | Warm ivory (background) |
| Lapis | `#1E3A5F` | Lapis lazuli blue (dark slides, accents) |
| Turquoise | `#1B8A7A` | Islamic turquoise (focus slides, highlights) |
| Gold | `#C8963E` | Antique gold (accent lines, stars, ornaments) |
| Terra | `#8B4513` | Terracotta (warm accent) |

### Presets

- **lapis** (default): Blue/ivory -- traditional scholarly feel
- **emerald**: Green/cream -- organic, garden-inspired
- **desert**: Terracotta/sand -- warm, earthy caravan aesthetics

## Typography

| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| Display | 42pt | Bold | Cover title |
| H1 | 28pt | Bold | Section divider titles |
| H2 | 20pt | Bold | Slide titles (in header) |
| Lead | 16pt | Bold | Card titles, emphasis text |
| Body | 14pt | Regular | Card body, descriptions |
| Kicker | 9pt | Medium, tracked | Category labels, metadata |
| Meta | 8pt | Regular (mono) | Footer, page numbers |

Font system: Sans body (`Avenir Next`, `Arial`, then `Noto Sans SC` for CJK coverage), mono metadata (`Menlo`). The document font is set in `demo.typ`, not by the theme entry.

## Layout Parameters

- **Aspect ratio**: 16:9
- **Margins**: top 6em, bottom 1.3em, x 2em (light slides); adjusted for dark
- **Header**: Metadata line + title + gold accent underline
- **Footer**: Three-column grid: "SILK ROAD" | ornament star | page number

## SVG Geometric Elements

### 8-Pointed Star
A true eight-pointed khatam built from interlocking squares, a sixteen-vertex star, construction axes, and a central medallion, rendered as inline SVG with configurable color and size.

### Border Strip
Repeating diamond/rhombus pattern (10 units), used for section dividers and slide decorations.

### Ornament Star
Small 5-pointed filled star for inline decorative use (footer separators, bullet markers).

## Slide Types

| Slide | Background | Key Features |
|-------|-----------|--------------|
| `title-slide()` | Warm ivory | Geometric star header, border strip, gold accent lines |
| `slide()` | Warm ivory | Subtle corner stars, gold title underline |
| `dark-slide()` | Lapis blue | Gold star patterns visible, ghost text |
| `new-section-slide()` | Warm ivory | Border strip, large ghost number, gold line |
| `focus-slide()` | Turquoise | Ivory text, corner stars, border strip |
| `ending-slide()` | Warm ivory | Centered star ornament cluster, border strips |

## Components

| Component | Purpose | Visual |
|-----------|---------|--------|
| `mosaic-card()` | Content card | Colored top border, clean interior |
| `minaret-stat()` | Stat display | Gold left border, large number |
| `arabesque-quote()` | Quotation | Gold left bar, italic text |
| `tile-tag()` | Label/tag | Jewel-tone background, rounded |
| `caravan-divider()` | Section break | Centered border strip pattern |
| `star-frame()` | Image frame | Border + corner star ornaments |
| `geometric-star()` | Decorative | SVG 8-pointed star, any size/color |
| `border-strip()` | Pattern bar | Repeating diamond geometry |
| `ornament-star()` | Small star | Filled star for inline use |
