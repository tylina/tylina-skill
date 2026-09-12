# Brutalist-Web Theme Design Specification

## Theme Identity

**Name**: brutalist-web
**Aesthetic**: Neo-Brutalist Web Design -- thick black borders, pure black/white, clashing yellow + blue accents
**Inspiration**: Bloomberg.com (2015), Craigslist, Yale School of Art, Gumroad, brutalistwebsites.com
**Complexity**: Canvas
**Aspect Ratio**: 16:9

## Color Palette

### Classic Preset (Default)
| Role | Hex | Usage |
|------|-----|-------|
| Background (Paper) | #FFFFFF | Pure white -- raw commitment |
| Ink | #000000 | Pure black -- text, borders, frames |
| Accent (Yellow) | #FFDE00 | Hot yellow -- highlights, section dividers |
| Secondary (Blue) | #0000FF | Pure web blue -- hyperlinks, subtitle, focus slides |

### Dark Preset
| Role | Hex | Usage |
|------|-----|-------|
| Background | #000000 | Black background |
| Ink | #FFFFFF | White text and borders |
| Accent | #FFDE00 | Yellow highlights |
| Secondary | #FF3399 | Hot pink accents |

### Paper Preset
| Role | Hex | Usage |
|------|-----|-------|
| Background | #FFF8E7 | Warm cream |
| Ink | #000000 | Black borders and text |
| Accent | #FF6600 | Orange highlights |
| Secondary | #009900 | Green links |

## Typography

| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| Display | 48pt | Black (900) | Title slide, hero text |
| H1 | 36pt | Black (900) | Section numbers |
| H2 | 24pt | Black (900) | Slide titles |
| Body | 16pt | Regular | Body text |
| Mono | 10pt | Bold | Labels, counters, metadata |
| Tiny | 9pt | Bold | Footer, fine print |

**Key rule**: Titles are always BLACK weight (900). The brutalist commitment to boldness.

**Demo font receipt**: The demo uses installed `IBM Plex Sans`; metadata and
monospace labels use installed `IBM Plex Mono`. The reusable theme entry stays
font-agnostic.

## Layout Parameters

| Parameter | Value |
|-----------|-------|
| Slide margins | top: 5.5em, bottom: 1.5em, x: 2.2em |
| Frame border weight | 3pt (THE signature) |
| Border radius | 0pt (ALWAYS -- no exceptions) |
| Frame inset from edges | 16pt |
| Card inset | x: 14pt, y: 12pt |
| Card header inset | x: 12pt, y: 8pt |

## Slide Types

### 1. slide() -- Standard Content
- White background
- 3pt black frame border inset from edges (placed)
- Title in huge bold black with yellow accent underline
- Monospace page counter in footer

### 2. dark-slide() -- Dark Variant
- Black background
- 3pt WHITE frame border (inverted)
- White text, yellow accents
- Same structure as slide() but inverted

### 3. title-slide() -- Cover
- White background
- Enormous bold title (fills space)
- Thick black underline below title
- Yellow rectangle as decorative accent (top-right, placed)
- Blue rectangle decorative (bottom-left)
- Subtitle in blue
- Author/date in monospace

### 4. new-section-slide() -- Section Divider
- YELLOW fill background
- Black text
- 3pt black border frame inset
- Section number ghost (160pt, transparent)
- Section label in monospace
- Section title in black weight

### 5. focus-slide() -- Statement
- Blue fill background
- White bold text
- No border (break from pattern for impact)
- Centered content

### 6. ending-slide() -- Farewell
- White background
- Black frame border
- Centered bold farewell text
- Yellow block top-left corner
- Blue block bottom-right corner
- "BRUTALIST-WEB" monospace label

### 7. hero-slide() -- Full Color Block
- Custom fill color (default yellow)
- 3pt black frame border inset
- Full content area

## Components

### brutalist-card(title, body)
- 3pt black border, zero radius
- Optional yellow header strip with bold uppercase title
- White fill body area

### raw-stat(number, label)
- Enormous 48pt black number
- Optional yellow highlight box behind number
- Uppercase monospace label below

### link-text(body)
- Blue (#0000FF) text with underline
- Looks like a web hyperlink

### highlight-box(body)
- Yellow (#FFDE00) background inline box
- Bold black text
- Marker/highlighter effect

### stack-card(body)
- Black offset "shadow" layer (4pt dx/dy)
- White main card on top
- Creates stacked/layered visual

### browser-frame(url, body)
- Browser chrome title bar (black)
- Traffic light dots (red/yellow/green)
- URL bar (white, monospace text)
- White content area below

### frame-block(body)
- Universal thick black border wrapper
- Simple content framing

### mono-label(body)
- Monospace, bold, uppercase, tracked text
- For category labels and metadata

### brutalist-divider()
- Full-width 3pt black horizontal rule

## Visual Identity Rules

1. ZERO rounded corners. Not 1px. Not 2px. ZERO.
2. 3pt black borders on EVERYTHING.
3. Pure #000000 black, pure #FFFFFF white. No warm variants.
4. Yellow and Blue deliberately clash -- that is the beauty.
5. System-font-like monospace for all metadata.
6. Frame border visible on every standard slide.
7. No gradients. No shadows (except stack-card offset). No blur.
8. Typography is always bold/black weight for headings.
9. The ugliness is intentional. The commitment makes it beautiful.
