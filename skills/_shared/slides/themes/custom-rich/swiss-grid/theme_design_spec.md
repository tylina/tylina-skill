# Swiss Grid Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | swiss-grid |
| **Best For** | Design systems presentations, architecture talks, modernist portfolios, corporate identity |
| **Style Objective** | Modernist |
| **Complexity Level** | Rich |

An International Typographic Style (Swiss Design) theme influenced by Josef Mueller-Brockmann. Features strict mathematical grid systems, asymmetric layouts with strong alignment, large flush-left sans-serif headings, generous whitespace as a design element, and red as the sole accent color against white and black. The grid itself is visible as a background design element.

## Design Philosophy

- **Mathematical Precision**: Strict grid systems govern all element placement; the grid is visible as thin gray lines
- **Asymmetric Tension**: Flush-left alignment creates dynamic compositions; whitespace is an active design choice
- **Chromatic Restraint**: Only red, black, and white -- color is never decorative, it signals importance
- **Typography as Form**: Large bold sans-serif headings are themselves design elements; type scale creates hierarchy without decoration

## Typography

- **Demo font:** IBM Plex Sans
- **CJK fallback:** Noto Sans SC
- **Monospace recommendation:** DejaVu Sans Mono
- **Ownership:** The demo/downstream deck applies the font stack; the reusable theme entry point does not impose environment-specific font families

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Pure White | `#FFFFFF` | Background -- clean canvas |
| Near Black | `#1A1A1A` | Primary text, strong structural lines |
| Signal Red | `#FF0000` | Sole accent -- importance, focus, punctuation |
| Grid Gray | `#E5E5E5` | Visible grid lines, subtle structure |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: swiss-grid-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
  ),
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default vertical alignment of slide content |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Enormous medium-weight flush-left title with red circle accent in top-right, asymmetric SVG composition decoration in bottom-right, visible grid background, "PRESENTATION" index label, red rule below title, subtitle in muted ink, and small author/date at bottom.

### `slide(title: auto, align: auto, ..args)`
White background content slide with visible grid SVG background, bold flush-left title with full-width 1pt black rule below, three-column footer with red dot center separator and page number.

### `new-section-slide(self: none, body)`
Section divider with visible grid background, enormous medium-weight red section number (8em) in top-left, "SECTION" index label, medium-weight flush-left title, short red accent rule, and small red circle in bottom-right.

### `focus-slide(body)`
White background with visible grid, single large medium-weight black text centered with a red period automatically appended. Clean and impactful.

### `ending-slide(body)`
Minimal flush-left farewell with enormous medium-weight text, red circle inline, full-width black rule below, and visible grid background.

## Reusable Components

### `grid-card(title, body, accent-top: false)`
Opaque white card with visible thin black border aligned to the grid. Optional red top-accent line (3pt) for primary cards; otherwise 0.5pt black top border.

```typst
#grid-card([Modular Grid], [
  A modular grid subdivides the page both horizontally and vertically into modules.
], accent-top: true)
```

### `swiss-stat(value, caption)`
Centered vertical metric with a red indicator, large bold value, and small uppercase caption. Indicator, value, and caption are one `stack(spacing:)` sequence.

```typst
#swiss-stat([12], [Columns])
```

### `color-swatch(label, color, code, outline: false)`
Palette sample with a tracked label, fixed-height color field, and printed code. Set `outline: true` for white or other low-contrast swatches.

```typst
#color-swatch([Accent], palette.accent, [\#FF0000])
```

### `swiss-quote(body, attribution: none)`
Large quotation with oversized red opening quote mark (4em), italic body text, and optional attribution.

```typst
#swiss-quote(attribution: "Josef Mueller-Brockmann")[
  Typography has one plain duty before it and that is to convey information in writing.
]
```

### `rule-divider()`
Thin 1pt black horizontal rule spanning full width for strong section separation.

```typst
#rule-divider()
```

### `index-label(body)`
Small all-caps label with letter tracking (2pt) in muted ink for categorization headers.

```typst
#index-label[Design Principle]
```

### `poster-block(body, size: 1.4em)`
Large bold text block for impactful statements, flush-left with tight leading.

```typst
#poster-block[The grid system is an aid, not a guarantee.]
```

## Helper Functions

### `grid-background()`
Places the 6-column, 4-row SVG grid pattern as a full-bleed background element.

### `red-circle(size: 24pt)`
Inline red circle accent element at configurable size.

### `asymmetric-decoration(width: 160pt)`
SVG decoration of overlapping rectangles suggesting grid-based asymmetric composition.

## Layout Guidance

Use Touying's native `cols(columns: (..), gutter: ..)` primitive rather than a theme-specific layout wrapper. Set `lazy-layout: true` only when every column contains exactly one flexible component with a `lazy-v` marker; use the default `false` for plain content and for columns containing multiple independent blocks.

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.ink)[Near-black text]
#text(fill: palette.accent)[Signal red text]
#text(fill: palette.ink-muted)[Muted text]
```

- `palette.bg`, `palette.ink`, `palette.accent`, `palette.grid-line`
- `palette.ink-light` (70% transparent), `palette.ink-muted` (50% transparent)

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Theme accent (red), `alert()` text |
| `neutral-lightest` | `palette.bg` | Light backgrounds (white) |
| `neutral-darkest` | `palette.ink` | Dark text (near-black) |

## Best Use Cases

- Design systems and corporate identity presentations
- Architecture and modernist design talks
- Typography and grid system lectures
- Poster design process documentation
- Bauhaus and Swiss design history
- Minimalist corporate presentations

## Recommended Complexity

**Rich** -- This theme achieves visual sophistication through strict grid discipline, SVG background patterns, and geometric accent elements. Use `grid-card`, `swiss-stat`, and native `cols` compositions to honor the mathematical precision of the International Typographic Style.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (flush-left, red circle accent)
2. The Grid (fundamental principles, construction methods, typography)
3. Composition (asymmetric layouts, color as information)
4. Application (poster design process, case study, design system components)
5. Focus slides and ending slide

## File Structure

```
swiss-grid/
  template.typ   -- Theme definition (colors, slides, components)
  demo.typ       -- Full demonstration presentation
```
