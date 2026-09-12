# Kinetic - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Kinetic Touying theme. Inspired by motion graphics title cards and kinetic typography. Dynamic, energetic, motion-inspired with diagonal lines, bold angles, and overlapping elements.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | kinetic |
| **Page Format** | 16:9 Presentation (254mm x 142.9mm) |
| **Best For** | Creative presentations, motion graphics, product launches, tech demos, data dashboards |
| **Style Objective** | Motion Graphics / Kinetic Typography |
| **Complexity Level** | Canvas |
| **Created Date** | 2025-05-21 |

### Complexity Guide

This theme is **Canvas** level:
- `place()` + inline styling per page
- 12 reusable components referencing `palette.xxx`
- 40-100+ lines/slide for complex compositions
- Speed lines, diagonal splits, gradient accents, ghost frame numbers

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 Presentation |
| **Touying Setting** | `config-page(..utils.page-args-from-aspect-ratio("16-9"))` |
| **Margins** | top: 6em, bottom: 1.3em, x: 2em (standard slides) |

## III. Visual Theme

### Design Philosophy

"Every element implies motion."

Inspired by motion graphics title cards, kinetic typography, and broadcast design. Diagonal composition, overlapping layers, asymmetric splits. Speed lines and gradient accents imply direction and velocity. Bold, energetic typography at black weight for impact. Four-color system (bg/ink/accent/secondary) creates maximum visual energy with controlled gradient transitions.

No static, centered layouts. Every composition implies trajectory, acceleration, or collision.

### Color Scheme (palette dictionary)

#### Preset: `neon` (default)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Background** | Near Black | `#0D0D0D` | `palette.bg` | Dark page background |
| **Ink** | White | `#FFFFFF` | `palette.ink` | Primary text |
| **Accent** | Hot Pink | `#FF3366` | `palette.accent` | Primary accent, tags, bars |
| **Secondary** | Neon Green | `#00FF88` | `palette.secondary` | Gradient partner, secondary tags |
| **Ink Muted** | -- | ink@50% | `palette.ink-muted` | Metadata, kicker labels |
| **Ink Ghost** | -- | ink@90% | `palette.ink-ghost` | Ghost text, frame numbers |
| **Accent Ghost** | -- | accent@90% | `palette.accent-ghost` | Diagonal stripe backgrounds |
| **Surface** | -- | ink@92% | `palette.surface` | Card fills |

#### Preset: `sunset`

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#1A0A2E` deep purple | Rich dark base |
| **Ink** | `#F8F0E3` cream | Warm text on dark |
| **Accent** | `#FF6B35` orange | Warm accent |
| **Secondary** | `#FFD23F` yellow | Warm gradient partner |

#### Preset: `arctic`

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#F0F4F8` ice white | Light mode base |
| **Ink** | `#0D1B2A` navy | Dark text on light |
| **Accent** | `#00B4D8` electric blue | Cool accent |
| **Secondary** | `#90E0EF` light cyan | Soft gradient partner |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Alert text, focus highlights |
| `neutral-lightest` | `palette.ink` | Light text |
| `neutral-darkest` | `palette.bg` | Dark backgrounds |

### Gradient Scheme

Primary gradient direction: left-to-right (0deg), accent to secondary:
```typst
gradient.linear(palette.accent, palette.secondary, angle: 0deg)
```

Reversed for bottom bars:
```typst
gradient.linear(palette.secondary, palette.accent, angle: 0deg)
```

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | IBM Plex Sans, Noto Sans SC | `set text(font: ("IBM Plex Sans", "Noto Sans SC"))` |
| **Mono** | IBM Plex Mono | Used internally for kickers/metadata/frame numbers |

> **Important**: Font is set ONLY in `demo.typ` / `main.typ`, NOT in `template.typ`. The template sets only `size`.

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 20pt | Set via `set text(size: 20pt)` in theme entry point |

### Weight Hierarchy

| Element | Weight | Rationale |
|---------|--------|-----------|
| Display/Title | `"black"` (900) | Maximum impact |
| Headings | `"bold"` (700) | Strong presence |
| Body text | `"regular"` (400) | Readable baseline |
| Kickers/Meta | `"bold"` (700) | Monospace + bold for energy |
| Counters | `"black"` (900) | Data demands attention |
| Tags | `"bold"` (700) | Small but punchy |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Preset `bg` color, full page
- **Layout**: Left-aligned, vertically centered. Velocity kicker for institution, massive title, gradient accent rule, subtitle, author/date
- **Decorative elements**: Speed lines (top-right, 5 fading lines), ghost "00" frame number (top-right, 160pt mono), gradient bars top and bottom, diagonal accent stripe background
- **Typography**: Title at 2.4em black weight

### Section Slide (`new-section-slide`)

- **Background**: Preset `bg` color
- **Layout**: Left-aligned section title with gradient accent rule below
- **Decorative elements**: Accent vertical bar (left, 4pt), ghost section number (mono, 160pt, 92% transparent), speed lines (bottom-right), gradient bars top and bottom
- **Numbering**: Via `utils.display-current-heading-number(level: 1, numbering: "01")`

### Content Slide (`slide`)

- **Background**: `palette.bg`
- **Header**: Mono metadata bar + bold title + gradient accent rule (50pt, accent-to-secondary)
- **Footer**: KINETIC label + accent dot + page number
- **Content area**: Standard margins

### Dark Slide (`dark-slide`)

- **Background**: `palette.bg`
- **Layout**: Content with gradient accent stripe at top
- **Decorative elements**: 3pt gradient bar at top, optional ghost element
- **Text**: Ink color (white for dark presets)

### Impact Slide (`impact-slide`)

- **Background**: Split layout, no header/footer
- **Layout**: 45% left panel (accent fill) + crisp vertical partition + right panel (bg fill)
- **Decorative elements**: Gradient bar at top and high-contrast center divider
- **Typography**: Large black text on both sides

### Ticker Slide (`ticker-slide`)

- **Background**: `palette.bg`
- **Layout**: Title + scrolling-style content with frame numbers
- **Decorative elements**: Gradient stripe at top
- **Typography**: 28pt bold title, content with frame-number counters

### Focus Slide (`focus-slide`)

- **Background**: `palette.bg`, no header/footer
- **Layout**: Centered text, horizontally and vertically
- **Typography**: 1.8em bold weight
- **Decorative elements**: Gradient bars top and bottom, accent dot (top-left)

### Ending Slide (`ending-slide`)

- **Background**: `palette.bg`
- **Layout**: Centered heavy title with gradient accent rules
- **Decorative elements**: Ghost "FIN" text (200pt, 95% transparent), speed lines (right), gradient bars, KINETIC meta label

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `velocity-kicker` | `velocity-kicker(body)` | Compact label | Mono uppercase with translucent accent field and strong left rail |
| `speed-line` | `speed-line(length, thickness, color)` | Speed decoration | Horizontal gradient line, fades in from left |
| `angle-card` | `angle-card(title, body, angle-height: 4pt)` | Content card | Card with a flush accent top rail and opaque surface body |
| `counter-block` | `counter-block(value, label)` | Data counter | Giant number + accent underline + mono label |
| `split-grid` | `split-grid(left, right, ratio: 55%)` | Split layout | Asymmetric columns with a strong accent divider |
| `motion-blur-text` | `motion-blur-text(body, copies, offset)` | Text effect | Fading offset copies for motion blur |
| `tag` | `tag(body, color)` | Inline label | Small pill shape, bold uppercase on accent fill |
| `progress-bar` | `progress-bar(ratio, width, height)` | Progress indicator | Gradient bar (accent to secondary) |
| `data-row` | `data-row(label, value)` | Key-value pair | Label...dotted line...value |
| `kinetic-rule` | `kinetic-rule(width: 100%, thickness: 3pt)` | Gradient divider | Horizontal accent-to-secondary rule |
| `frame-number` | `frame-number(num)` | Timecode display | Oversized zero-padded mono number at low opacity |
| `ghost-streak` | `ghost-streak(body, copies, dx, dy)` | Background effect | Repeated fading text at -15deg angles |

## VII. Design References

| Reference | Description |
|-----------|-------------|
| MoGraph title cards | Broadcast motion graphics opener sequences |
| Kinetic typography | Moving text compositions in video |
| Saul Bass title sequences | Diagonal composition, bold type, graphic energy |
| Swiss poster design (angular) | Asymmetric grid, diagonal elements |
| Racing livery design | Speed lines, dynamic graphics, high contrast |

---

## Output Files

```
kinetic/
  template.typ          # Theme definition -- palette, components, slide functions
  demo.typ              # Compilable demonstration showcasing all components
  theme_design_spec.md  # This specification document
  theme.md              # API summary and reference
```

> **Template-Content Separation**: `template.typ` contains ZERO content text. It defines colors, components, and slide types. Switching topics requires ZERO template changes.
