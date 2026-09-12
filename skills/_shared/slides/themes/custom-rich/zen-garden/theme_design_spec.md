# Zen Garden - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Zen Garden Touying theme. Inspired by Japanese karesansui (枯山水) dry landscape gardens -- Ryoan-ji temple, raked sand, natural stone arrangements, wabi-sabi aesthetics.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | zen-garden |
| **Display Name** | Zen Garden |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Mindfulness, philosophy, design thinking, minimalist presentations, Japanese culture |
| **Style Objective** | A) General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 4em, bottom: 2em, x: 2.2em |

## III. Visual Theme

### Design Philosophy

A minimalist theme that embraces negative space as its primary design element. Inspired by the karesansui (dry landscape) gardens of Japan, where raked sand represents water and carefully placed stones represent islands or mountains. The aesthetic is wabi-sabi -- finding beauty in imperfection, impermanence, and incompleteness. Every element must earn its place; the default state is emptiness.

### Color Scheme -- Fixed Palette (Rich)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Warm Stone Grey | `#4A4A4A` | `palette.primary` | Headers, primary text, stone elements |
| **Dark** | Deep Shadow | `#2D2D2D` | `palette.dark` | Darkest elements, deep shadows |
| **Accent** | Sand Earth | `#8B7355` | `palette.accent` | Earth tones, sand patterns, warm highlights |
| **Moss** | Moss Green | `#6B7F5E` | `palette.moss` | Subtle green accents (like moss between stones) |
| **Background** | Raked Sand | `#FAF8F5` | `palette.bg` | Page background (warm off-white) |
| **Card** | Stone Surface | `#F5F2ED` | `palette.card` | Card backgrounds, elevated surfaces |
| **Moss Card** | Moss Wash | `#F2F4EF` | `palette.moss-card` | Opaque moss callout surface |
| **Text Dark** | Charcoal | `#2D2D2D` | `palette.text-dark` | Headings, primary text |
| **Text Body** | Warm Grey | `#4A4A4A` | `palette.text-body` | Body text |
| **Text Light** | Weathered Stone | `#706B64` | `palette.text-light` | Contrast-safe captions, metadata, footer |
| **Accent Text** | Dark Sand Earth | `#765F45` | `palette.accent-text` | Contrast-safe earth-tone foreground |
| **Border** | Sand Line | `#E5E0D8` | `palette.border` | Subtle borders, card edges |
| **Sand** | Raked Sand | `#D4CDB8` | `palette.sand` | Sand pattern color |
| **Stone Light** | Light Stone | `#C8C2B8` | `palette.stone-light` | Decorative stone dots |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` | Theme accent, `alert()` text |
| `neutral-lightest` | `palette.bg` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Theme Entry** | Font-agnostic | `set text(size: 18pt)` only; the caller selects installed families |
| **Checked Demo** | Helvetica Neue, Hiragino Sans GB | `set text(font: ("Helvetica Neue", "Hiragino Sans GB"))` |

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 18pt | Slightly smaller to emphasize spaciousness |

### Weight Hierarchy

| Element | Weight | Rationale |
|---------|--------|-----------|
| Display titles | Semibold (600) | Grounded, not shouting |
| Slide titles | Medium (500) | Calm authority |
| Section numbers | Light (300) | Ghost-like, receding |
| Body text | Regular (400) | Natural, unforced |
| Labels/captions | Regular (400) | Quiet, secondary |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Warm off-white (`palette.bg`)
- **Layout**: Centered title, generous vertical spacing, subtitle/author/date below
- **Decorative elements**: Stones SVG arrangement (bottom-right), stronger raked sand pattern (bottom)
- **Colors**: Dark text on light background, earth-tone accent line

### Section Slide (`new-section-slide`)

- **Background**: Warm off-white with subtle raked sand
- **Layout**: Left-aligned, large faint section number + bold title + thin accent line
- **Decorative elements**: Small stone dots (bottom-right), sand pattern (bottom)
- **Typography**: Number in light weight, faded; title in medium weight

### Content Slide (`slide`)

- **Background**: Warm off-white with persistent raked sand atmosphere (bottom 34%)
- **Header**: Medium-weight title + thin accent line (50pt)
- **Footer**: Three-column grid: footer text | stone dot | page counter
- **Atmosphere**: Tiny stone dots in upper corner, raked sand pattern at bottom

### Focus Slide (`focus-slide`)

- **Background**: Slightly warmer card color, subtle sand lines
- **Text**: Medium weight centered text, generous width constraint
- **Decorative**: Single stone dot beneath text (period of silence)

### Ending Slide (`ending-slide`)

- **Background**: Same as title (bookending)
- **Layout**: Centered text with accent line
- **Decorative elements**: Stones arrangement (bottom-right) + stronger sand (bookends with title)

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| Stone Card | `stone-card(title, body, accent: palette.primary)` | Primary content card | Rounded corners (12pt), subtle shadow, opaque surface; terminal lazy height fill |
| Sand Divider | `sand-divider(color: palette.accent, width: 80%)` | Section separator | SVG parallel wavy lines (raked sand pattern) |
| Moss Highlight | `moss-highlight(title, body)` | Accent callout | Left green border, opaque moss wash, terminal lazy height fill |
| Pebble Stat | `pebble-stat(label, value, accent: palette.primary)` | Statistic display | 72pt organic pebble plus label in one centered stack; supports long values and mixed Latin/CJK labels |
| Garden Verse | `garden-verse(quote, author: none)` | Contemplative quote | Centered italic text with generous whitespace |
| Stone Tag | `stone-tag(content, color: palette.accent)` | Inline label/tag | Pill-shaped opaque pale fill, subtle border, contrast-safe text |
| Rock Grouping | `rock-grouping(title, body)` | Borderless section | Title + sand divider + content (typography only) |
| Zen Box | `zen-box(title, body)` | Minimal card (no border) | Subtle opaque fill; terminal lazy height fill |

### Layout Semantics

- Headers, special-slide sequences, component title/body regions, and pebble statistics use `stack(spacing:)` for controlled spacing.
- Ordinary `cols` represents semantic columns. `cols(lazy-layout: true)` is reserved for exactly one flexible card/callout per column.
- Native `grid` is reserved for multi-row matrices; terminal flexible tails are inert there.
- The theme exposes no generic two-column/three-column wrapper; callers use Touying's native `cols` and Typst's native `grid` directly.

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Emptiness is content | Negative space carries meaning; never fill space just because it exists |
| 2 | Restrained palette | Warm greys + sand + one moss accent. No bright colors. Limitation creates coherence |
| 3 | Organic over geometric | Rounded corners, gentle curves, no sharp angles. Nature has no straight lines |
| 4 | Generous spacing | Elements breathe. Tight layouts contradict the zen philosophy |
| 5 | Subtle shadows only | Shadows suggest depth without drama. Whisper, never shout |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| Ryoan-ji Temple Garden | 15 stones on raked sand -- the archetypal karesansui |
| Wabi-sabi philosophy | Beauty in imperfection, impermanence, incompleteness |
| Dieter Rams "Less but better" | Western parallel to zen minimalism |
| Japanese ink painting (水墨画) | Monochrome palette, emphasis on empty space |

---

## Output Files

```
zen-garden/
+-- template.typ          # Theme definition
+-- demo.typ              # Compilable demonstration
+-- theme_design_spec.md  # This specification
+-- theme.md              # API summary
```
