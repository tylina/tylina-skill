# Aurora Borealis -- Theme Design Specification

## 1. Theme Identity

| Attribute | Value |
|-----------|-------|
| **Name** | Aurora Borealis |
| **Metaphor** | The Northern Lights -- shimmering curtains of light dancing across a dark Arctic sky |
| **Category** | custom-canvas |
| **Complexity** | Canvas |
| **Mood** | Majestic, cosmic, luminous, mysterious |
| **Best For** | Science presentations, astronomy talks, technology keynotes, environmental topics, space weather |

## 2. Color Palette

### Primary Preset: Arctic

| Role | Hex | Name | Usage |
|------|-----|------|-------|
| Background | `#0B0E1F` | Arctic Night | Page fill, primary background |
| Ink | `#E8F0F2` | Frost White | Body text, headings |
| Accent | `#00E676` | Aurora Green | Primary accent, borders, highlights |
| Secondary | `#7C4DFF` | Aurora Purple | Secondary accent, quotes, badges |
| Tertiary | `#00BCD4` | Aurora Cyan | Tertiary accent, tags, supplementary |

### Derived Colors (from Arctic preset)

| Key | Derivation | Usage |
|-----|-----------|-------|
| `ink-dim` | Ink @ 25% transparent | Secondary text |
| `ink-muted` | Ink @ 50% transparent | Tertiary text |
| `ink-faint` | Ink @ 72% transparent | Borders, faint elements |
| `ink-ghost` | Ink @ 92% transparent | Ghost decorative text |
| `accent-dim` | Accent @ 30% transparent | Dimmed accent elements |
| `accent-muted` | Accent @ 55% transparent | Subtle accent strokes |
| `accent-faint` | Accent @ 78% transparent | Card borders |
| `accent-ghost` | Accent @ 92% transparent | Ghost fills, backgrounds |
| `secondary-dim` | Secondary @ 35% transparent | Dimmed purple |
| `secondary-faint` | Secondary @ 75% transparent | Faint purple borders |
| `tertiary-dim` | Tertiary @ 35% transparent | Dimmed cyan |
| `tertiary-faint` | Tertiary @ 75% transparent | Faint cyan borders |
| `bg-deep` | Background darkened 40% | Dark slide fill |
| `meta-color` | Ink @ 60% transparent | Footer text, metadata |

### Alternate Presets

**Solar Storm**: Deep violet (#0F0A1A) bg, warm white ink, solar orange accent, plasma pink secondary, amber tertiary. Represents the rare, fiery aurora during intense solar events.

**Midnight**: True dark (#050A14) bg, silver ink, electric cyan accent, blue secondary, mint tertiary. Cool and minimal, representing aurora seen under pristine polar conditions.

## 3. Typography

| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| Display | 42pt | Bold | Cover title |
| H1 | 30pt | Bold | Section divider titles |
| H2 | 22pt (1.4em) | Bold | Slide titles |
| Body | 16pt | Regular | Content text |
| Small | 12pt | Regular/Medium | Captions, tags |
| Tiny | 9pt | Medium | Kickers, metadata labels |
| Meta | 8pt | Regular | Footer, fine print |

**Demo Font Stack**: `"IBM Plex Sans", "Arial", "PingFang SC"` (sans-serif; the theme entry itself is font-agnostic)
**Monospace**: `"IBM Plex Mono", "Menlo"` (kickers, data, metadata)

## 4. SVG Decorative Elements

### 4.1 Aurora Curtain
- **Description**: 6 vertical wavy bands with bezier curves, simulating dancing aurora light
- **Technique**: Paths with `C` (cubic bezier) curves, varying stroke-width (35-55px), linear gradient with opacity stops (0% -> 30% -> 15% -> 0%)
- **Usage**: Title slide (3 layers: green, purple, cyan), dark-slide background, ending slide, focus-slide (very faint)
- **Opacity range**: 10-30% on content slides, 60-80% on hero/title slides

### 4.2 Star Scatter
- **Description**: 34 randomly placed circles at varied sizes (0.6-1.5r) and opacities (0.5-0.9)
- **Technique**: No connecting lines (differs from celestial's constellations), pure scatter
- **Usage**: Behind aurora on title/ending/section slides, faint on content slides
- **Aesthetic**: Controlled randomness -- hand-placed positions that look natural

### 4.3 Ice Crystal
- **Description**: 6-fold symmetric hexagonal snowflake with center circles and branch tips
- **Technique**: 6 main lines radiating from center (at 60-degree intervals), branch sub-lines at tips, concentric circles at center
- **Usage**: Section divider ornament (crystal-divider), corner decorations on title/ending slides, shimmer-quote accent
- **Sizes**: 14-36pt depending on context

### 4.4 Northern Horizon
- **Description**: Jagged mountain/treeline silhouette with 3 small tree accents
- **Technique**: Single filled polygon path following mountain peaks, separate line elements for tree symbols
- **Usage**: Bottom edge of title slide, section slides, ending slide; also in horizon-panel component
- **Aesthetic**: Grounding element that anchors the ethereal aurora to the earthly landscape

### 4.5 Shimmer Line
- **Description**: Double-wave horizontal line simulating aurora shimmer
- **Technique**: Two `Q` (quadratic bezier) wave paths at different amplitudes and opacities
- **Usage**: frost-stat underline decoration, subtle accent separator

## 5. Layout Architecture

### Content Slide (slide)
- **Layers**: Star scatter (very faint) -> subtle top gradient -> corner dots -> content
- **Header**: Title (1.4em bold) + gradient accent line (green-to-cyan, 50pt wide, 2pt tall) via `stack(spacing: .8em)`
- **Footer**: Three-column grid: "AURORA" left, diamond center, page number right
- **Margins**: top 4em, bottom 1.5em, x 2em

### Dark Slide (dark-slide)
- **Layers**: Aurora curtain (green, faint) -> aurora curtain (purple, fainter) -> scattered dots -> content
- **Background**: `bg-deep` (arctic night darkened 40%)
- **Header**: Two-column grid with custom-left and custom-right labels
- **Margins**: top 2.8em, bottom 1.2em, x 2.5em

### Title Slide (title-slide)
- **7 layers**: Deep sky -> stars -> aurora green -> aurora purple -> aurora cyan -> horizon silhouette -> frame border
- **Frame**: 94% x 90% centered rect, 0.5pt accent-muted stroke
- **Corner decorations**: Ice crystals at 4 corners (inside frame)
- **Content center**: Institution kicker -> title (42pt bold) -> crystal divider (lines + crystal) -> subtitle -> author/date

### Section Slide (new-section-slide)
- **Layers**: Sky -> stars -> aurora curtain (right 50%) -> ghost section number (140pt, 92% transparent) -> horizon
- **Ice crystal**: Top-right, 36pt
- **Content**: Left-aligned: "SECTION 01" kicker -> heading text (2.2em bold) -> gradient accent line

### Focus Slide
- **Background**: bg-deep with very faint aurora curtain
- **Decorations**: Scattered aurora dots, corner gradient lines (green top-left, cyan bottom-right)
- **Content**: Width-constrained (80%) centered italic text
- **Margins**: 3em all sides

### Ending Slide
- **Layers**: Sky -> stars -> aurora green -> aurora purple -> ghost text "AURORA" -> frame -> ice crystal corners -> horizon
- **Content center**: Large ice crystal (32pt) -> farewell text (2em bold) -> shimmer divider -> "AURORA BOREALIS" label

## 6. Components Design

### aurora-card
- Left border: 2.5pt aurora green
- Other borders: 0.4pt accent-faint
- Fill: bg lightened 4%
- Top-right: aurora-glow decoration (3pt)
- Uses no flexible spacer, so ordinary `cols` remains safe for card rows and composite columns

### frost-stat
- Outer surface: opaque bg-lightened panel with a faint cyan stroke
- Ice crystal: 18pt tertiary ornament
- Value: 44pt bold ink
- Kicker: 9pt mono, tertiary color, uppercase tracked
- Underline: shimmer-line SVG (60pt wide)
- Description: 13pt muted text
- Internal order: ice crystal -> value -> kicker -> shimmer -> description in one centered `stack(spacing: .8em)`
- Contains no `v()` or `lazy-v()`; safe both side-by-side and in vertical stacks

### crystal-divider
- Two horizontal lines (42% each from left and right)
- Ice crystal centered (18pt)
- Total height: 20pt

### polar-tag
- Fill: accent-ghost
- Stroke: 0.4pt accent-muted
- Text: 12pt mono, accent color, medium weight
- Radius: 2pt (minimal, not rounded -- arctic aesthetic)

### shimmer-quote
- Fill: opaque bg lightened 3% to protect text from the persistent star field
- Left border: 2pt secondary (purple)
- Ice crystal icon (16pt) left of quote text
- Quote: body size, italic, ink color
- Citation: 9pt mono, uppercase, meta-color

### horizon-panel
- Fill: bg lightened 3%
- Stroke: 0.4pt ink-faint
- Content inset: 1.2em x, 1em top, 0.6em bottom
- Bottom decoration: horizon-silhouette (28pt tall), clipped

### aurora-data-table
- Bare native `table()` (no outer block/manual grid wrapper)
- Header: accent-ghost fill, 9pt mono accent uppercase tracked via `table.header()`
- Rows: opaque alternating bg-lightened fills with 11pt mono ink-dim
- Cell stroke: 0.4pt accent-faint
- Public `align` parameter defaults to `center + horizon`

## 7. Signature Elements

1. **Aurora curtain SVG**: The defining visual -- organic bezier curves creating shimmering vertical bands. Used in 3 colors layered at different opacities for depth.
2. **Gradient accent lines**: Using `gradient.linear(accent, tertiary)` instead of solid color for the header underline and dividers -- evokes the color-shifting nature of real aurora.
3. **Ice crystal ornaments**: 6-fold symmetric SVG used as section dividers and corner decorations -- evokes the frozen Arctic environment beneath the lights.
4. **5-7 layer compositions**: Title and ending slides stack sky + stars + multiple aurora + horizon + frame + content for cinematic depth.
5. **Horizon grounding**: Mountain/tree silhouettes anchor the bottom edge, providing earthly scale against cosmic phenomena.

## 8. Design Principles

- **Bold maximalism**: Full commitment to dark sky + luminous aurora contrast
- **Layered depth**: 5-7 stacked `place()` layers on hero slides
- **Transparency as hierarchy**: Aurora at 10-30% behind content, 60-80% on hero slides
- **Controlled imperfection**: Aurora paths use organic bezier curves, not straight lines
- **Color restraint despite richness**: Accent green is primary, purple/cyan are supporting -- never all three at full opacity simultaneously
- **Arctic grounding**: Horizon silhouettes and ice crystals prevent the theme from feeling entirely abstract
