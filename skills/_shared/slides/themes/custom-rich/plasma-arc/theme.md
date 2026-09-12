# Plasma Arc Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `plasma-arc-theme`

A presentation theme inspired by electrical discharge physics, plasma phenomena, and Tesla coil aesthetics. Features jagged arc discharge paths, ionization dots, electrode markers, circular field lines, and spark accents on a clean white background with electric violet, plasma blue, and energy orange accents. The raw-energy-channeled-into-precision aesthetic is ideal for technology presentations, engineering talks, physics lectures, and innovation showcases.

## Theme Entry Point

### `plasma-arc-theme`

```typst
#show: plasma-arc-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
)

#set text(font: ("IBM Plex Sans", "Heiti SC"))
#show raw: set text(font: "IBM Plex Mono")
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `..args` | any | — | Additional Touying configuration arguments |

---

## Slide Functions

### `title-slide`

Full-page title slide with arc frame bookend (double-border with jagged discharge arcs along edges, electrode nodes at corners with ionization rings), plasma field background, and centered branding.

```typst
#title-slide()
```

Displays title, subtitle, author, institution, and date from `config-info`.

---

### `slide`

Standard content slide with plasma field atmosphere background, discharge divider under the header title, and footer with spark separator and page numbers.

```typst
== Slide Title

Content here...
```

Or with explicit title:

```typst
#slide(title: [Custom Title])[
  Content here...
]
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content/auto | `auto` | Slide title (auto uses heading) |
| `align` | alignment/auto | `auto` | Per-slide alignment override |
| `..args` | any | — | Additional `touying-slide` arguments |

---

### `new-section-slide`

Automatically generated when using `= Section Heading`. Features left electric violet accent bar, electrode decorations at top-right, large section number in violet, discharge divider, section title, and bottom accent line.

---

### `focus-slide`

Full-page emphasis slide with deep violet background (`#1E1040`), plasma field overlay, corner electrode markers in violet and orange, centered white text, and discharge divider below content.

```typst
#focus-slide[
  Your impactful statement here.
]
```

---

### `ending-slide`

Closing slide with arc frame bookend (shared with title slide), plasma field background, discharge divider above text, large centered farewell text, and violet accent bar below.

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `arc-card`

Content card with colored top border (3pt), light border on remaining sides, spark accent indicator next to title.

```typst
#arc-card([Card Title], [
  Card body content here.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body content |
| `accent` | color | `palette.primary` | Top border color |

---

### `plasma-box`

Insight/highlight box with violet left border (4pt), light violet fill background, and spark decoration next to title.

```typst
#plasma-box([Insight Title], [
  Important information here.
])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box body content |

---

### `voltage-stat`

Centered metric display with an electrode dot, large colored value, and small label stacked in that order, plus electrode-style top/bottom colored borders.

```typst
#voltage-stat([Metric Label], [12.4K], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Small label below value |
| `value` | content | required | Large metric value |
| `color` | color | `palette.primary` | Value text, top/bottom border, and electrode color |

---

### `discharge-quote`

Quote box with violet left border, field-background fill, discharge divider decoration at top, italic text, and optional attribution.

```typst
#discharge-quote([
  An insightful observation or quote goes here.
], attribution: [Author Name, Source])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `body` | content | required | Quote content (rendered italic) |
| `attribution` | content/none | `none` | Optional attribution |

---

### `ion-tag`

Small capsule-shaped glowing tag with colored dot indicator and pill-shaped border.

```typst
#ion-tag([Label Text], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag label text |
| `color` | color | `palette.primary` | Tag color (dot, text, and border) |

---

### `arc-divider`

Centered decorative jagged electrical discharge line divider for separating content sections (renders the SVG discharge divider).

```typst
#arc-divider(width: 80%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | relative | `80%` | Width of the divider |

---

### `field-card`

Content card with blue left border (3pt), light blue fill background, and circular field indicator dot next to title.

```typst
#field-card([Card Title], [
  Card body content here.
], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body content |
| `accent` | color | `palette.secondary` | Left border and indicator color |

---

### `reactor-box`

Large feature box with all-around electric border (2pt), spark accent and title, discharge divider below title, and full-width content area.

```typst
#reactor-box([Feature Title], [
  Detailed content here.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box body content |
| `accent` | color | `palette.primary` | Border and title color |

---

### `pulse-meter`

Horizontal bar-style metric/progress indicator with label, value, and colored progress bar.

```typst
#pulse-meter([Availability], [99.997%], 99.9%, color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Metric label (left) |
| `value` | content | required | Metric value (right) |
| `percent` | relative | required | Progress bar fill width |
| `color` | color | `palette.primary` | Progress bar and value color |

---

## Color Palette

Access via `palette.*`:

| Token | Hex | Description |
|-------|-----|-------------|
| `bg` | `#FAFCFF` | Cool white/blue-tinted background |
| `card-bg` | `#FFFFFF` | Card background white |
| `text` | `#1E293B` | Dark slate text |
| `text-muted` | `#64748B` | Muted slate-gray |
| `primary` | `#6D28D9` | Electric violet |
| `secondary` | `#2563EB` | Plasma blue |
| `accent` | `#F59E0B` | Energy orange/amber |
| `border` | `#E2E8F0` | Light slate border |
| `light-violet` | `#EDE9FE` | Light violet fill |
| `light-blue` | `#EFF6FF` | Light blue fill |
| `field-bg` | `#F5F3FF` | Faint violet field background |

---

## SVG Helpers

These functions render the theme's decorative SVG elements:

| Function | Description |
|----------|-------------|
| `plasma-field-bg()` | Full-page background with radiating arc paths from edges, ionization dots, circular field lines |
| `arc-frame()` | Full-page double-border frame with jagged discharge arcs on edges, electrode nodes at corners with ionization rings |
| `discharge-divider(width: 100%)` | Horizontal jagged arc line with electrode nodes at endpoints and energy sparks |
| `spark-accent()` | Small starburst/spark icon with radial and diagonal lines |

---

## Typography

- **Font ownership**: The template is font-agnostic; the deck selects its fonts after the theme show rule
- **Demo base font**: IBM Plex Sans with Heiti SC fallback
- **Demo monospace**: IBM Plex Mono
- **Base size**: 18pt
- **Title slides**: 2.4em bold
- **Section numbers**: 3.5em bold
- **Section headings**: 2em bold
- **Slide titles**: 1.3em bold
- **Card titles**: 0.90--0.95em bold
- **Card body**: 0.80--0.82em regular
- **Stat values**: 1.55em bold
- **Tags**: 0.75em semibold
- **Footer**: 0.65em regular

---

## Usage Tips

1. Use `arc-card` for general content blocks with electric top-border styling
2. Use `plasma-box` for key insights or highlighted information with violet emphasis
3. Use `voltage-stat` in `cols(lazy-layout: true)` rows with exactly one stat per column for KPI/metric dashboards
4. Use `field-card` for secondary content blocks with blue/circular-field aesthetic
5. Use `reactor-box` for large featured content with full-border electric framing
6. Use `pulse-meter` for progress/metric bars with visual fill indicators
7. Use `discharge-quote` for quotations, citations, and attributed observations
8. Use `ion-tag` for inline category/topic labels
9. Use `arc-divider` as a thematic section separator within slides
10. Use `spark-accent()` inline for small decorative energy accents
