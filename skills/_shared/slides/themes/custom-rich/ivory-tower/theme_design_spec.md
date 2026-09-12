# Ivory Tower Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | ivory-tower |
| **Best For** | Executive presentations, investor decks, premium brand pitches, annual reports |
| **Style Objective** | Executive luxury |
| **Complexity Level** | Rich |

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `ivory-tower-theme`
**Style**: Elegant cream and gold premium aesthetic — understated, confident, premium
**Primary color**: `#1B2A4A` (Deep Navy)
**Accent color**: `#B8964A` (Refined Gold)

## II. Design Concept

### Aesthetic Direction
The Ivory Tower theme embodies executive luxury through an ivory/cream background paired with gold accents. The design evokes high-end annual reports, luxury stationery, and executive boardroom aesthetics. Typography leans toward sophisticated serif styling with refined SVG corner ornaments providing decorative elegance without excess.

### Visual Language
- **Feeling**: Understated confidence, premium quality, institutional gravitas
- **Inspiration**: Luxury stationery, gilt-edge books, private banking materials, executive boardrooms
- **Restraint**: Gold is used sparingly as accent, never overwhelming

## III. Color Palette

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Ivory** | `#FFFEF8` | `palette.ivory` | Background — warm off-white base |
| **Primary** | `#1B2A4A` | `palette.primary` | Deep navy — titles, headings, authority |
| **Accent Gold** | `#B8964A` | `palette.accent-gold` | Refined gold — ornaments, accents, highlights |
| **Secondary** | `#7A7064` | `palette.secondary` | Warm gray — subtitles, secondary info |
| **Card White** | `#FFFFFF` | `palette.card-white` | Pure white — card fills, component backgrounds |
| **Border** | `#E8E3D8` | `palette.border` | Subtle warm border — card edges, dividers |
| **Text Dark** | `#1B2A4A` | `palette.text-dark` | Same as primary — strong emphasis |
| **Text Body** | `#2C2C2C` | `palette.text-body` | Near-black — body copy |
| **Text Secondary** | `#5A5A5A` | `palette.text-secondary` | Medium gray — supporting text |
| **Text Muted** | `#9A9488` | `palette.text-muted` | Warm muted — captions, footnotes |
| **Gold Light** | derived | `palette.gold-light` | Lightened gold — subtle fills |
| **Gold Faint** | derived | `palette.gold-faint` | Highly transparent gold — background ornaments |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent-gold,
  neutral-lightest: palette.card-white,
  neutral-darkest: palette.primary,
)
```

## IV. SVG Assets (3 Custom)

### 1. Gold Corner Ornament (`_corner-ornament-svg`)
Elegant floral/scroll corner piece with curved paths, dots, and organic lines. Used at corners of slides and frames for decorative elegance. Features multiple opacity layers for depth.

### 2. Filigree Divider (`_filigree-divider-svg`)
Horizontal separator with center diamond accent, flanking dots, and extending lines. Used between content sections and at slide boundaries. Provides visual breathing room.

### 3. Monogram Frame (`_monogram-frame-svg`)
Decorative oval frame with double-stroke ellipse, crown flourishes at top/bottom, and cardinal point dots. Used on title and ending slides as a premium emblem element.

## V. Slide Types (5)

### 1. `title-slide()`
Premium ivory cover with gold border frame, monogram frame decoration, filigree dividers, and corner ornaments. Centers title/subtitle/author/institution/date in elegant hierarchy.

### 2. `slide(title: auto)`
Standard content slide with navy title, gold accent underline, faint corner ornaments on ivory background, and footer with gold diamond center ornament and page numbers.

### 3. `new-section-slide` (auto-triggered by `= Heading`)
Section divider with gold left accent bar, large faint section number in background, "SECTION" label in gold, navy heading, gold accent line, and corner ornaments.

### 4. `focus-slide[...]`
Deep navy background with gold top/bottom accent lines, corner ornaments, centered white text, and filigree divider below content.

### 5. `ending-slide[...]`
Ivory background with gold border frame, monogram frame, large navy text, and filigree divider. Mirrors title slide aesthetics for cohesive bookending.

## VI. Components (7)

### 1. `gilt-card(title, body, accent)`
White card with gold top border, diamond icon prefix, body text. Premium card for content blocks.

### 2. `capital-stat(label, value, color)`
Centered monogram → bold colored value → muted label stack. For KPIs and metrics.

### 3. `charter-box(title, body, accent)`
Formal content box with left gold bar accent on ivory background. For policy statements, formal content.

### 4. `filigree-divider-component(color, width)`
Inline decorative separator using the filigree SVG. For visual breathing between sections.

### 5. `signet-tag(content, color)`
Small premium tag/badge with gold border and tinted background. For labels, categories, status indicators.

### 6. `treasury-highlight(title, body)`
Emphasized content block with gold background tint and gold left bar. Star icon prefix. For key findings, critical metrics.

Ordered priorities use native `+` list markup rather than a custom list wrapper.

## VII. Typography

- **Body**: Georgia / PingFang SC, set by the consuming deck or demo (not the theme entry)
- **Size**: 20pt base
- **Headings**: Bold, deep navy (`#1B2A4A`)
- **Body text**: Near-black (`#2C2C2C`)
- **Code**: Menlo in the demo; consumers may choose another installed monospace font

## VIII. Background Treatment

Content slides feature faint gold corner ornaments (85% transparent) at all four corners, providing subtle luxury framing without distracting from content. The ivory background (`#FFFEF8`) provides warmth compared to pure white.

## IX. Files

- `template.typ` — Theme definition with all slide types, components, and SVGs
- `demo.typ` — Full executive presentation demo (compilable)
- `theme_design_spec.md` — This design specification
- `theme.md` — Quick reference documentation
