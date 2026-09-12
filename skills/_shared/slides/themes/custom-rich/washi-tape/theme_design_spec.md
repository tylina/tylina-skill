# Washi Tape Theme -- Design Specification

## Concept

**Theme Name:** Washi Tape
**Aesthetic:** Japanese paper craft / scrapbooking / bullet journal
**Mood:** Joyful precision, craft warmth, handmade charm, sunlit studio
**Metaphor:** A sunlit craft studio surrounded by rolls of decorative paper tape, dot-grid notebooks, stickers, and paper clips

### Target Use Cases
- Creative strategy and branding presentations
- Design workshops and ideation sessions
- Marketing and social media content planning
- Education and craft community talks
- Personal project showcases
- Mood board and inspiration presentations

---

## Color System

### Light Theme Palette

| Role | Hex | RGB | Description |
|------|-----|-----|-------------|
| Background | `#FFFEF8` | 255, 254, 248 | Warm white (notebook paper) |
| Primary | `#D4727B` | 212, 114, 123 | Dusty rose (main tape color) |
| Primary Text | `#A64E58` | 166, 78, 88 | Contrast-safe dusty-rose text |
| Secondary | `#7BA08A` | 123, 160, 138 | Sage green (secondary tape) |
| Secondary Text | `#4F755F` | 79, 117, 95 | Contrast-safe sage text |
| Accent | `#D4A537` | 212, 165, 55 | Mustard yellow (highlight) |
| Accent Text | `#806013` | 128, 96, 19 | Contrast-safe mustard text |
| Lavender | `#9B8EC4` | 155, 142, 196 | Soft lavender (extra tape) |
| Lavender Text | `#675A91` | 103, 90, 145 | Contrast-safe lavender text |
| Text Dark | `#4A4A4A` | 74, 74, 74 | Warm grey (headings) |
| Text Body | `#555555` | 85, 85, 85 | Medium grey (body copy) |
| Text Light | `#707070` | 112, 112, 112 | Accessible muted grey (captions) |
| Card | `#FFFDF5` | 255, 253, 245 | Slightly warm card fill |
| Kraft | `#D4C5A0` | 212, 197, 160 | Kraft paper brown |
| Kraft Dark | `#B8A87A` | 184, 168, 122 | Darker kraft borders |
| Border | `#E8E2D8` | 232, 226, 216 | Soft warm border |
| Dot Grid | `#C8C2B8` | 200, 194, 184 | Dot grid color |

### Color Relationships
- **Four tape colors:** Primary (rose), Secondary (sage), Accent (mustard), Lavender -- representing different washi tape rolls
- **Background hierarchy:** bg > card > kraft (warm layering)
- **Text hierarchy:** text-dark > text-body > text-light
- **Craft materials:** kraft, kraft-dark, border (paper and adhesive tones)

### Contrast Ratios (WCAG)
- Text Dark on Background: ~7.5:1 (AAA)
- Text Body on Background: ~5.7:1 (AA)
- Decorative tape colors are not used for small text; their paired `*-text` tokens provide text-safe contrast.
- Text Light on Background: ~4.7:1 (AA)

---

## Typography

### Scale
- Theme base: `18pt`
- Slide title: `1.3em` (23.4pt equivalent)
- Title slide heading: `2.4em` (43.2pt equivalent)
- Section number: `3em` (54pt, transparentized)
- Body text: `0.82em` (14.8pt)
- Component headers: `0.85-0.9em` (15.3-16.2pt)
- Tags/labels: `0.72em` (13pt)
- Footer: `0.6em` (10.8pt)

### Weight Usage
- **Semibold:** Title slide heading, stamp-card headers
- **Medium:** Slide titles, component headers, tags
- **Bold:** KPI values (sticker-stat)
- **Regular:** Body text, descriptions

### Font Configuration
Fonts are set in the document (not theme) via:
```typst
#set text(font: ("Avenir Next", "Heiti SC"))
```

---

## Layout Architecture

### Slide Dimensions
- Aspect ratio: 16:9 (default), 4:3 supported
- Margins: top 4em, bottom 2em, x 2.2em

### Content Slide Structure
```
+--------------------------------------------+
| [tape accent]                              |
|   Title Text                               |
|   [===== rose tape strip =====]            |
|                                            |
|   [Content Area with dot grid bg]          |
|                                            |
|   footer-left   (o)   page/total           |
| [paperclip]                                |
+--------------------------------------------+
```

### Title / Ending Slide Structure (Bookending)
```
+--------------------------------------------+
| [rose tape]                  [sage tape]   |
|                                            |
|         TITLE TEXT                         |
|     [=== tape strip ===]                   |
|       subtitle / author                    |
|                                            |
| [mustard tape]            [lavender tape]  |
+--------------------------------------------+
```

---

## SVG Decorations

### 1. Dot-Grid Background (`_dotgrid-bg-svg`)
- **Elements:** 5 paper fiber lines + 11 rows x 20 columns = 225 elements
- **Purpose:** Full-page bullet journal dot paper simulation
- **Opacity range:** 0.02 - 0.12
- **Application:** Every slide via `_slide-atmosphere()`, title, section, ending slides

### 2. Tape Frame (`_tape-frame-svg`)
- **Elements:** 4 corner tape strips with unique patterns (polka dots, stripes, chevrons, dots) = ~30 elements
- **Purpose:** Decorative washi tape corners (bookending)
- **Opacity range:** 0.15 - 0.55
- **Application:** Title slide + ending slide only

### 3. Tape Strip Divider (`_tape-divider-svg`)
- **Elements:** Wavy-edge tape body + 3 stripe lines + torn fiber details = ~7 elements
- **Purpose:** Decorative horizontal separator
- **Opacity range:** 0.25 - 0.6
- **Application:** `strip-divider()` component

### 4. Paper Clip (`_paperclip-svg`)
- **Elements:** Wire path with highlight = 2 elements
- **Purpose:** Small decorative accent
- **Opacity range:** 0.6 - 0.7
- **Application:** Content slide atmosphere (bottom-left)

---

## Component Catalog

### Structural Diversity Matrix

| Component | Structure Type | Fill | Stroke | SVG | Special Decoration |
|-----------|---------------|------|--------|-----|-------------------|
| `tape-card` | Block (header+body) | Yes | Full thin | No | Tape strip header |
| `journal-box` | Block with accent | Kraft tint | Full thin | No | Angled corner tape |
| `sticker-stat` | Centered circular | Circle | Dotted ring | No | Sticker badge |
| `memo-quote` | Block with lines | Yes | Full thin | No | Ruled lines + tape |
| `flag-tag` | Inline box | Tinted | None | No | Banner shape |
| `strip-divider` | SVG rendering | No | No | Yes | Torn-edge tape |
| `collage-card` | Layered blocks | Yes | Full thin | No | Shadow rotation |
| `pinboard-box` | Block with pin | Yes | Full thin | No | Push pin circle |
| `stamp-card` | Block dashed | Yes | Dashed | No | Double border |

### Component Count: 9

---

## Atmosphere & Persistence

### Content Slides
Every content slide rendered by the `slide()` function includes:
1. Dot-grid notebook pattern (full-bleed, subtle)
2. Small angled washi tape strip (top-right corner, 70% transparent)
3. Paper clip accent (bottom-left corner, 40% transparent)

These create the "craft studio atmosphere" -- the sense of working in a scrapbook.

### Bookending Pattern
Title slide and ending slide share identical decorative frames:
- Tape frame corner decorations (four unique tape strips)
- Dot-grid background
- Centered content with tape strip accent beneath heading

These shared elements are NOT present on content slides, creating clear visual bookends.

### Focus Slide
Inverted color scheme (dark grey background, cream text) with:
- Sparse dot grid (white dots on dark, 6% opacity)
- Angled tape strips top-left and bottom-right in different colors
- Centered content block

---

## Technical Implementation Notes

### Key Patterns Used
- `lazy-v(1fr)` -- Height equalization in column layouts
- `std.align` -- Avoid shadowing inside slide functions
- `image(bytes(...))` -- SVG rendering (NOT `image.decode`)
- `place()` -- Atmosphere overlays and absolute positioning
- Content-block API -- `#component[title][body]` pattern
- `.text` on raw blocks -- SVG string extraction
- `.transparentize()` -- Layered opacity for craft feel
- `rotate()` -- Angled tape strips for handmade imprecision

### Performance Considerations
- SVG strings defined at module level (computed once)
- Color replacement via `.replace("currentColor", ...)` at render time
- Atmosphere rendered via `place()` to avoid layout interference
- No `height: 100%` in flow containers

---

## Visual Hierarchy

### Information Density Levels
1. **Low density (emphasis):** Focus slide, sticker-stat badges
2. **Medium density (narrative):** Journal boxes, memo quotes, pinboard boxes
3. **High density (data):** Tape cards with lists, collage cards, stamp cards

### Reading Flow
- Left-to-right, top-to-bottom (Western reading pattern)
- Tape strip accent anchors the eye at slide title
- Footer provides navigation context without distraction
- Dot grid creates subtle spatial reference without overwhelming content

---

## Accessibility

- All body text meets WCAG AA contrast minimums on the warm white background
- Primary accent meets AA for large text (headings, labels)
- Component fills use readable text colors (text-body or text-dark)
- SVG decorations are purely ornamental (no semantic content)
- Tape strip colors are distinguishable by pattern as well as hue (polka dots, stripes, chevrons)
