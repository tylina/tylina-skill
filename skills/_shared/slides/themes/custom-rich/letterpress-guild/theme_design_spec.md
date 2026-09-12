# Letterpress Guild - Theme Design Specification

> **Purpose**: Visual and structural design spec for the letterpress-guild Touying theme. Evokes the craft heritage of movable type printing: typographic guilds, printer's marks, fleurons, type-case grids, and ink impression textures.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | letterpress-guild |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Publishing, media, journalism, content strategy, brand agencies, editorial presentations |
| **Style Objective** | General Versatile (editorial/craft) |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-26 |

### Complexity Guide

This is a **Rich** theme: design-driven with ornamental SVGs, type-case grid patterns, thick/thin rule systems, and multiple specialized components. 10-20 custom components. 20-100 lines/slide.

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 5em, bottom: 1.5em, x: 2em |

## III. Visual Theme

### Design Philosophy

The letterpress guild theme channels the visual culture of the printing trade: movable type, compositor's workshops, guild marks, and the physical craft of pressing ink to paper. Visual beauty comes from the CONTRAST between thick and thin rules, from the rhythm of the type-case grid, and from the warm patina of aged paper. Printer's ornaments (fleurons) serve as decorative punctuation. Registration marks (+) recall the precise alignment required in multicolor printing.

### Color Scheme

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Background** | Warm paper/cream | `#FDF9F0` | `palette.bg` | Page background (warm, aged-paper feel) |
| **Primary** | Printer's black | `#1C1C1C` | `palette.primary` | Headlines, rules, main text emphasis |
| **Secondary** | Press red | `#9B2335` | `palette.secondary` | Accent color for labels, ornaments, emphasis |
| **Accent** | Typographer's blue | `#1E40AF` | `palette.accent` | Highlights, links, special elements |
| **Text** | Aged paper text | `#332E27` | `palette.text` | Body text color |
| **Text Muted** | Muted brown | `#6B6358` | `palette.text-muted` | Secondary text, metadata |
| **Rule** | Warm gray | `#A89F91` | `palette.rule` | Rule and line color |
| **Rule Light** | Light warm gray | `#D4CEC4` | `palette.rule-light` | Subtle separators |
| **Card BG** | Bright cream | `#FEFCF6` | `palette.card-bg` | Card surfaces |
| **Ornament** | Dark warm brown | `#5C4A3A` | `palette.ornament` | Decorative elements |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.secondary` | Alert text, focus accents (press red) |
| `neutral-lightest` | `palette.bg` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.primary` | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Usage |
| ---- | ---------- | ----- |
| **Deck typography** | Deck-owned; reference demo uses New Computer Modern, Songti SC | All presentation text; the reusable theme does not select document fonts |
| **Labels** | Inherited | Distinguished through uppercase conversion, tracking, size, and weight |
| **Metadata** | Inherited | Distinguished through compact size and tracking |

### Typography Constants

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 42pt | Cover titles |
| `typo.h1` | 28pt | Main slide titles, section headings |
| `typo.h2` | 22pt | Card/section headings |
| `typo.lead` | 16pt | Lead text, quotes |
| `typo.body` | 14pt | Body text |
| `typo.small` | 11pt | Captions |
| `typo.label-size` | 9pt | Tracked uppercase labels |
| `typo.meta-size` | 8pt | Chrome metadata, page numbers |

### Weight Hierarchy

| Element | Weight | Treatment | Usage |
|---|---|---|---|
| Display title | Bold (700) | Deck face | Cover titles |
| Slide/section title | Semibold (600) | Deck face | Content and section headers |
| Body text | Regular (400) | Deck face | Paragraph content |
| Labels | Bold (700) | Uppercase + tracking | Card titles, kickers |
| Tags/Meta | Medium (500) | Compact + tracked | Colophon tags, page numbers |

## V. SVG Assets

### Full-Page Background: Type Case Grid
- Evokes compositor's type case compartments
- Vertical and horizontal grid lines at 8% opacity
- Registration marks (+) in all four corners at 12% opacity
- Subtle ink-spatter texture dots at 3-5% opacity
- Used as persistent background on ALL content slides

### Decorative: Fleuron Ornament
- Symmetrical printer's flower/floral motif
- 8-petal design with central dot in press red
- Scroll flourishes extending left and right
- Terminal dots and top/bottom curlicue details
- Used in dividers and section slides

### Emblem: Guild Mark
- Circular seal with inner diamond
- Stylized letter "P" (for Press) as central motif
- Corner compass-point dots in red and blue
- Decorative crosses between compass points
- Used on title and ending slides

### Frame: Bookend Frame
- Thick outer rule (3pt) with thin inner rule (0.8pt)
- Corner ornamental squares in press red
- Registration marks outside frame at midpoints
- Fleuron dots at frame midpoints
- Shared by title and ending slides (bookend principle)

## VI. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Warm cream + type-case grid + bookend frame
- **Layout**: Left-aligned title in large bold serif (42pt), thick-thin rule, subtitle, tracked author/date
- **Decorative**: Guild mark upper-right, bookend frame, registration marks
- **Match**: Shares bookend frame with ending slide

### Section Slide (`new-section-slide`)

- **Background**: Warm cream + type-case grid
- **Layout**: Faded section number (120pt, 88% transparent), section title in bold serif, thick-thin rule
- **Decorative**: Centered fleuron ornament, bottom leading-style rule

### Content Slide (`slide`)

- **Background**: Warm cream + type-case grid (persistent atmosphere)
- **Header**: Title in bold serif (1.4em), thick-thin rule combo (red + gray), page number
- **Footer**: Three-column grid: footer text | fleuron separator | page counter
- **Content area**: Open

### Focus Slide (`focus-slide`)

- **Background**: Printer's black (#1C1C1C)
- **Text**: Cream-colored, serif, regular weight
- **Decorative**: Press red thick-thin rule top-left, registration mark bottom-right

### Ending Slide (`ending-slide`)

- **Background**: Warm cream + type-case grid + bookend frame (same as title)
- **Layout**: Centered bold serif farewell text, thick-thin rule below
- **Decorative**: Guild mark centered above, fleuron ornament, bookend frame
- **Match**: Shares bookend frame with title slide

### Outline Slide (`outline-slide`)

- **Background**: Warm cream + type-case grid
- **Layout**: Bold serif title with thick-thin rule, clean TOC listing

## VII. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `type-card` | `type-card(title, body-content)` | Information card | Thick top/bottom rules, thin sides, red tracked title |
| `impression-box` | `impression-box(body-content, accent:)` | Emphasis block | Asymmetric borders mimicking ink impression |
| `broadside-stat` | `broadside-stat(value, label, accent:)` | Metric display | Fixed-height poster frame with value and label in one centered stack |
| `pull-quote` | `pull-quote(body-content, cite:)` | Quotation | Thick-thin borders, large quote mark, italic serif |
| `colophon-tag` | `colophon-tag(body-content)` | Inline tag | Small bordered box with compact tracked text |
| `leading-divider` | `leading-divider(color:)` | Separator | Thick-thin-thick triple rule (book section break) |
| `galley-card` | `galley-card(title, body-content)` | Featured card | Type-case grid background pattern |
| `press-box` | `press-box(body-content)` | Feature box | Registration marks in all four corners |
| `compositor-list` | `compositor-list(body-content)` | Styled native list | Scoped printer's-mark styling around ordinary `- item` markup |
| `fleuron-divider` | `fleuron-divider()` | Decorative break | Centered fleuron SVG between horizontal rules |

## VIII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Thick-thin rule system | Echoes the contrast of letterpress printing (impression depth) |
| 2 | Persistent type-case grid | Keeps the compositor's workshop atmosphere present on every slide |
| 3 | Printer's ornaments as punctuation | Fleurons and registration marks add craft authenticity |
| 4 | Warm paper palette | Never pure white; always the aged warmth of quality stock |
| 5 | Bookend framing | Title and ending share the same frame, like front and back matter |
| 6 | Bold serif display | Strong typographic hierarchy through weight and size contrast |
| 7 | Registration marks for precision | The + marks recall multicolor printing alignment |

## IX. Design References

| Reference | Description |
|-----------|-------------|
| Gutenberg Bible (1455) | Heavy blackletter type, red rubrics, wide margins |
| Aldine Press (Venice) | Elegant roman type, italic innovation, anchor/dolphin mark |
| William Morris / Kelmscott Press | Arts & Crafts revival, ornamental borders, fleurons |
| Hamilton Wood Type Museum | Poster type, broadside announcements, display printing |
| Penguin Books classic covers | Strong typographic hierarchy, simple rule systems |
| Emigre magazine | Post-modern typography, grid experimentation |
