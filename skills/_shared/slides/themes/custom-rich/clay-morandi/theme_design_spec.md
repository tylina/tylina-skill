# Clay Morandi - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Clay Morandi custom Touying theme.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | clay-morandi |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Interior design, lifestyle brands, wellness, sustainability, craft, ceramics, Kinfolk-style presentations |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 4.5em, bottom: 1.8em, x: 2em |

## III. Visual Theme

### Design Philosophy

Inspired by Giorgio Morandi's still life paintings and modern clay/ceramic aesthetics. Everything is muted, warm, desaturated, and harmonious -- like a Kinfolk magazine spread or an Aesop store interior. The signature element is 12pt rounded corners on everything (like smoothed clay vessels) and a rotating palette of 6 Morandi earth tones that create variety within unity.

### Color Scheme

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Warm Gray-Brown | `#8B7D6B` | `palette.primary` | Headers, accent elements, main branding |
| **Background** | Warm Linen | `#F5F1EC` | `palette.bg` | Page background |
| **Card** | Warm Off-White | `#FDFBF8` | `palette.card` | Content cards, quote backgrounds |
| **Text** | Warm Dark Brown | `#3D3530` | `palette.text` | Headings, primary text |
| **Text Body** | Medium Warm Brown | `#5A4E47` | `palette.text-body` | Body text |
| **Text Light** | Muted Caption Brown | `#776B64` | `palette.text-light` | Accessible captions and secondary text |
| **Border** | Warm Border | `#E8E0D8` | `palette.border` | Card borders, dividers |
| **Focus Background** | Dark Slate Blue | `#677B8C` | `palette.focus-bg` | Accessible inverted focus slides |

### Morandi Shades (6 rotating colors)

| # | Name | HEX | Purpose |
|---|------|-----|---------|
| 0 | Dusty Rose | `#C4A4A0` | Cards, tags, decorative elements |
| 1 | Sage | `#A8B5A0` | Cards, section slides, tags |
| 2 | Terracotta | `#C49A7C` | Title slide block, cards, underlines |
| 3 | Slate Blue | `#8B9DAD` | Focus slide, cards, tags |
| 4 | Sand | `#D4C4A8` | Cards, tags, decorative elements |
| 5 | Mauve | `#B8A0B8` | Cards, tags, decorative elements |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (#8B7D6B) | Theme accent, alert() text |
| `neutral-lightest` | `#FDFBF8` (warm white) | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text` (#3D3530) | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | Arial, Noto Sans SC | `set text(font: ("Arial", "Noto Sans SC"))` |

> Font is set ONLY in `demo.typ` / `main.typ`, NOT in template.typ.

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 20pt | Set in theme entry point |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Warm linen (#F5F1EC)
- **Layout**: Large morandi-colored rounded rectangle (~60% of slide, terracotta shade) with title and subtitle centered in high-contrast warm dark brown, author info centered at bottom
- **Decorative elements**: Small morandi-colored circles at corners (translucent)
- **Colors**: Warm dark brown text on terracotta block and for author info

### Section Slide (`new-section-slide`)

- **Background**: Warm linen with large morandi-colored rounded block (sage shade, ~70% width, ~55% height)
- **Layout**: Section title centered in high-contrast warm dark brown on the colored block
- **Decorative elements**: Small translucent morandi circles at corners
- **Cycling**: Different morandi shade per section (currently sage)

### Content Slide (`slide`)

- **Background**: Warm linen (#F5F1EC)
- **Header**: Semibold title in warm brown + thin morandi-shade underline (2.5pt, rounded)
- **Footer**: Three-column grid: footer text | small morandi dot | page counter
- **Content area**: Open area for components

### Focus Slide (`focus-slide`)

- **Background**: Solid accessible dark slate blue (#677B8C)
- **Text**: Large warm-white centered semibold text with constrained width

### Ending Slide (`ending-slide`)

- **Background**: Warm linen
- **Layout**: Centered text in warm brown, row of 6 morandi-colored circle ornaments below
- **Decorative elements**: Translucent morandi circles at all four corners

### Outline Slide (`outline-slide`)

- **Background**: Warm linen
- **Layout**: Title with morandi underline, clean TOC list
- **Decorative elements**: Translucent morandi circles at corners

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| Morandi Card | `morandi-card(title, body, shade: 0)` | Primary content card | Rounded (12pt) card with morandi shade fill (lightened 75%), morandi-tinted border, title in darkened shade |
| Vessel Stat | `vessel-stat(value, label, shade: 0)` | Number/KPI display | Rounded card with thick morandi-colored bottom border (4pt), centered large number |
| Earth Tag | `earth-tag(content, shade: 0)` | Inline label/pill | Rounded pill (99pt radius) in morandi shade, small semibold text |
| Linen Quote | `linen-quote(quote, author: none, shade: 0)` | Quote block | Warm white card with thin morandi left bar (3pt), italic quote text, optional author |
| Ceramic Divider | `ceramic-divider(shade: 0, width: 40%)` | Section separator | Thin centered line in morandi shade, not full width |
| Palette Strip | `palette-strip()` | Decorative element | Row of 6 small rounded color blocks showing all morandi shades |

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Muted harmony over contrast | All colors are desaturated and warm -- nothing bright or saturated |
| 2 | Rounded everywhere (12pt) | The ceramic/clay vessel signature -- everything feels soft and handmade |
| 3 | Variety within unity | 6 different morandi shades create visual interest while remaining harmonious |
| 4 | Never pure black or white | Always warm variants -- warm dark brown for text, warm off-white for highlights |
| 5 | Quiet confidence | No aggressive headers, no loud accents -- just clean title + subtle color |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| Giorgio Morandi still lifes | Color palette source -- dusty pinks, muted sage, warm grays, terracotta, cream |
| Kinfolk Magazine | Layout and typography inspiration -- clean, minimal, warm |
| Aesop store interiors | Material and spatial inspiration -- earth tones, rounded forms, warm lighting |
| Modern ceramics studios | Texture and form inspiration -- rounded vessels, matte finishes, earth glazes |
