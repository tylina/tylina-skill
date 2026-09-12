# Binary Rain Theme — Design Specification

## Design Philosophy

The Binary Rain theme draws inspiration from "The Matrix" digital rain aesthetic, reinterpreted for professional presentations on light backgrounds. Instead of the iconic green-on-black, this theme uses subtle cascading binary digits as atmospheric texture on clean white/light-gray surfaces, creating a modern tech aesthetic that feels sophisticated rather than retro.

The name "binary-rain" evokes natural phenomena (rain) while subtly referencing the digital nature of the content. It avoids overtly tech-specific naming (no "code", "cyber", "hack", etc.) while remaining evocative of its visual language.

---

## Visual Language

### Core Motifs

1. **Cascading Data Columns** — Vertical streams of 0/1 digits at varying opacities, creating a waterfall effect across the background
2. **Terminal Cursors** — Small rectangular blocks (the blinking cursor) used as indicators, markers, and separators
3. **Hexadecimal Addresses** — `0xNNNN` patterns as decorative text elements suggesting memory addresses and data pointers
4. **Digital Rain Drops** — Individual digit characters that fade from opaque to transparent, suggesting falling data
5. **Binary Borders** — Frame decorations using repeating 01/10/11/00 patterns instead of solid lines

### Typography Hierarchy

- **Titles**: Bold, dark charcoal (#1A1D1B), 2.4em for title slides, 1.3em for content headers
- **Body Text**: Regular weight, dark charcoal, 0.82em within components
- **Font ownership**: `template.typ` sets size only. The demo selects Avenir Next with Noto Sans SC fallback; raw/code uses IBM Plex Mono.
- **Code/Data**: IBM Plex Mono in the demo; inline SVG hex-address text uses generic SVG monospace
- **Metrics**: Bold, colored (primary green), 1.6-1.8em for impact
- **Muted**: Gray (#5C6360) for secondary info, footers, descriptions

---

## Color System

### Primary Palette

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Very light gray-green | `#F8FAF9` | Clean, barely-there warmth avoids sterile white |
| Card Background | Pure white | `#FFFFFF` | Maximum contrast for content containers |
| Text | Dark charcoal | `#1A1D1B` | Near-black with slight green undertone |
| Primary Accent | Matrix green | `#00C853` | The iconic digital green, bright and modern |
| Primary Dark | Deep green | `#009624` | For hover states and darker accents |
| Primary Ink | Contrast green | `#006E2E` | Semantic text on light surfaces; 6.42:1 on white |
| Secondary | Dark teal | `#00695C` | Complementary dark tone for variety |
| Highlight | Cyan | `#00E5FF` | Electric cyan for alerts and special callouts |

### Extended Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Text Muted | Warm gray | `#5C6360` | Footers, descriptions, secondary text |
| Border | Light sage | `#C8E6C9` | Card borders, subtle separators |
| Light Green | Mint wash | `#E8F5E9` | Cascade box backgrounds, highlights |
| Code BG | Pale green | `#F1F8F2` | Terminal/buffer card backgrounds |
| Dim Green | Sage | `#A5D6A7` | Decorative elements, disabled states |
| Focus BG | Dark forest | `#0D1F14` | Focus slide dark background |

### Opacity Scale

SVG elements use a deliberate opacity progression to create depth:
- 0.05-0.08: Barely visible, deep background texture
- 0.10-0.15: Subtle background elements
- 0.18-0.25: Noticeable but non-distracting
- 0.30-0.45: Decorative frame elements
- 0.50-0.70: Active indicators and markers
- 0.80+: Corner markers and cursors in frames

---

## Component Architecture

### Slide Types

#### Title Slide
- Full bleed with `margin: 0pt`
- Three visual layers: bg fill + data streams + rain frame
- Rain frame is the "bookend" element (shared with ending)
- Content centered vertically and horizontally
- Hex addresses along top/bottom frame edges
- Corner cursor squares at frame vertices

#### Content Slide
- Standard margins with header/footer
- Persistent `_content-atmosphere()` via `setting(body)` function
- Data stream SVG as background texture (very low opacity)
- Three corner cursor markers at varying sizes
- Header: title + cascade divider underline
- Footer: three-column grid with cursor separator

#### Section Slide
- Full bleed, data streams background
- Left 4pt green accent bar
- Section number in large bold green
- Hex-line decoration between number and title
- Corner cursor markers (right side)
- Bottom accent line (2pt, semi-transparent)

#### Focus Slide
- Dark forest background (#0D1F14) for dramatic contrast
- Data streams become more visible against dark
- Four corner cursor markers (two green, two cyan)
- Content in primary green, centered
- Cascade divider below content

#### Ending Slide
- Matches title slide structure (bookend pair)
- Same three layers: bg + streams + rain frame
- Simpler content: divider, text, accent bar
- Consistent visual closure with title slide

### Component Design Patterns

All components follow these rules:
- Use `#lazy-v(1fr)` only in lazy-capable cards (`stream-card`, `packet-card`, `byte-stat`, `buffer-card`) that can be the sole child of a `cols(lazy-layout: true)` column
- Keep `cascade-box`, `terminal-box`, and `debug-note` intrinsic-height so they are safe in ordinary stacks and multi-row grids
- Use `stack(spacing:)` for internal element arrangement
- Left borders (3-4pt) for primary hierarchy indicators
- Cursor/block indicators (5-8pt rectangles) instead of circular dots
- Hex-line or cascade-divider as internal decorations
- Card backgrounds are pure white against the slightly tinted page

### Component Inventory

| Component | Purpose | Accent | Border Style |
|-----------|---------|--------|--------------|
| `stream-card` | General content | Configurable | Left 3pt + thin surround |
| `cascade-box` | Key insights | Primary green | Left 4pt, right radius |
| `bit-tag` | Inline labels | Configurable | Full rounded (99pt) |
| `packet-card` | Metrics w/ description | Configurable | Top 3pt + thin surround |
| `byte-stat` | Large KPI value | Configurable | Thin surround |
| `buffer-card` | Sequential/pipeline | Configurable | Left 3pt |
| `matrix-grid` | Genuine multi-row structured matrix | N/A | Thin surround, clipped |
| `terminal-box` | Code/commands | Configurable | Left 3pt, traffic lights |
| `debug-note` | Annotations/asides | Cyan | Full rounded stroke |

---

## SVG Specifications

### Data Stream Background (840x474)

- 10+ vertical columns of binary digits
- Each column: 6-7 characters vertically spaced at 20px intervals
- Alternating primary green and secondary teal fills
- Opacity gradient within each column (fade in then fade out)
- Column x-positions distributed: 40, 80, 120, 200, 260, 300, 420, 500, 540, 640, 740, 780
- Total elements: 70+ text elements

### Rain Frame (840x474)

- Outer border: 1.5pt green stroke, 0.4 opacity
- Inner border: 0.6pt teal stroke, 0.25 opacity
- Left edge: 8 binary pairs cascading vertically (opacity 0.15-0.55)
- Right edge: 8 binary pairs cascading vertically (opacity 0.15-0.55)
- Top edge: 4 hex addresses (`0xNNNN` format)
- Bottom edge: 4 hex addresses
- Corner squares: 4x4px green fills at 0.7 opacity

### Cascade Divider (300x12)

- Horizontal baseline stroke
- Binary text pairs along the line
- Terminal squares at both ends (4x4px)
- Central gap with subtle rectangle fill

### Cursor (10x16)

- Simple filled rectangle with rounded corners
- Uses SVG `currentColor`; `cursor-blink(color:)` replaces it with the requested palette color at render time

### Hex Line (200x10)

- Three hex address labels separated by thin strokes
- Terminal squares at end

---

## Spacing and Layout

### Page Margins
- Top: 3.5em (header region)
- Bottom: 2em (footer region)
- Horizontal: 2.2em

### Component Spacing
- Between sibling cards: 0.4-0.6em via a single `stack(spacing: ...)`
- Card internal padding: x: 1em, y: 0.8em (standard)
- Grid gutter: 0.8em-1.2em
- Stack spacing (header elements): 8pt
- Footer grid: `(1fr, auto, 1fr)` three-column

### Layout Semantics
- `cols()` is the default for independent side-by-side regions.
- `cols(lazy-layout: true)` is reserved for one lazy-capable component per column.
- `grid()` is reserved for true multi-row arrangements with intrinsic-height children.
- `matrix-grid` remains a named theme component because it adds the clipped frame and opaque binary-rain cell treatment; it is not a generic column wrapper.
- KPI/metric cards use one centered internal stack: `byte-stat` is `cursor -> value -> label`, and `packet-card` is `hex decoration -> value -> label -> description`.

### Header/Footer
- Header ascent: 30%
- Footer descent: 30%
- Header inset: x: 1.5em, top: 0.6em, bottom: 0.2em
- Footer inset: x: 1.5em, y: 0.4em
- Footer text size: 0.65em

---

## Interaction with Touying

### Configuration Flow
```
binary-rain-theme() → touying-slides.with(
  config-page(page settings, fill, margin),
  config-common(slide-fn, new-section-slide-fn),
  config-methods(alert),
  config-colors(primary, neutral-lightest, neutral-darkest),
  config-store(title, footer),
)
```

### Slide Wrapper Pattern
All slides use `touying-slide-wrapper(self => { ... })` to access theme state.

### Content Atmosphere
The `setting(body)` pattern ensures background elements persist on every content slide:
```typst
let setting(body) = {
  _content-atmosphere()  // Place SVG bg + corner markers
  show: std.align.with(self.store.align)
  body
}
touying-slide(self: self, setting: setting, ..args)
```

### Store Variables
- `title`: Current slide title override
- `footer`: Persistent footer content

---

## Accessibility Notes

- All decorative SVG elements are purely visual atmosphere (opacity < 0.2 for backgrounds)
- Text maintains WCAG AA contrast against card-bg (white) and page-bg (near-white)
- Bright matrix green (`#00C853`, 2.24:1 on white) and cyan remain decorative accents, not semantic text colors
- Semantic green text uses `palette.primary-ink` (`#006E2E`, 6.42:1 on white)
- Text color (#1A1D1B) on white exceeds 15:1 contrast ratio
- Focus slide uses bright green text on dark for strong readability
- No information is conveyed solely through color

---

## File Structure

```
binary-rain/
├── template.typ          # Theme implementation
├── demo.typ             # Full demo presentation (8+ slides)
├── theme.md             # API reference documentation
└── theme_design_spec.md # This file — design specification
```
