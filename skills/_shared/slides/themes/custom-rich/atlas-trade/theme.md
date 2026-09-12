# Atlas Trade Theme — API Reference

A Touying 0.7.4 presentation theme inspired by world trade routes and cartographic design. Features mercator projection grids, compass roses, trade route curves, port markers, and rhumb line patterns on warm parchment-like backgrounds.

## Theme Entry Point

### `atlas-trade-theme`

```typst
#show: atlas-trade-theme.with(
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
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `..args` | any | — | Additional Touying configuration arguments |

---

## Slide Functions

### `title-slide`

Full-page title slide with cartographic frame border, trade route background, compass rose decoration, and centered branding.

```typst
#title-slide()
```

Displays title, subtitle, author, institution, and date from `config-info`.

---

### `slide`

Standard content slide with mercator grid atmosphere, route accent header divider, and footer with page numbers.

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

---

### `new-section-slide`

Automatically generated when using `= Section Heading`. Features left navy accent bar, gold section number, compass rose decoration, and route accent divider.

---

### `focus-slide`

Full-page emphasis slide with deep navy background, rhumb line pattern, compass rose watermark, and gold-colored centered text.

```typst
#focus-slide[
  Your impactful statement here.
]
```

---

### `ending-slide`

Closing slide with cartographic frame border (bookend element shared with title slide), compass rose above text, trade routes, and route accent decoration.

```typst
#ending-slide[Fair Winds and Following Seas]
```

---

## Reusable Components

### `route-card`

Content card with left-border trade line accent and port dot indicator.

```typst
#route-card([Card Title], [
  Card body content here.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body content |
| `accent` | color | `palette.primary` | Left border and dot color |

---

### `port-box`

Highlighted destination/milestone box with amber top border and red port dot.

```typst
#port-box([Destination Name], [
  Description of this milestone or destination.
])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box body content |

---

### `waypoint-tag`

Small capsule-shaped location marker label with colored dot indicator.

```typst
#waypoint-tag([Label Text], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag label text |
| `color` | color | `palette.primary` | Tag color |

---

### `compass-card`

Data display card with rotated diamond compass indicator in the header.

```typst
#compass-card([Card Title], [
  Data or content here.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body content |
| `accent` | color | `palette.primary` | Accent color |

---

### `latitude-divider`

Coordinate line separator using the route accent SVG pattern.

```typst
#latitude-divider(color: palette.primary, width: 80%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | color | `palette.primary` | Divider color (not directly used; uses SVG) |
| `width` | relative | `80%` | Width of the divider |

---

### `tonnage-stat`

KPI metric display with large value number and small label above.

```typst
#tonnage-stat([Metric Label], [$1.2B], color: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Small label above value |
| `value` | content | required | Large metric value |
| `color` | color | `palette.secondary` | Value text color |

---

### `voyage-card`

Timeline/journey card with route-like left border featuring stacked dots (waypoint indicators).

```typst
#voyage-card([Event Title], [
  Description of this journey milestone.
], accent: palette.accent-copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body content |
| `accent` | color | `palette.accent-copper` | Left border and dot color |

---

### `hemisphere-grid`

Two-panel comparison layout divided by a meridian line, ideal for East/West or Before/After comparisons.

```typst
#hemisphere-grid(
  [Left Panel Title], [Left content...],
  [Right Panel Title], [Right content...],
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `left-title` | content | required | Left panel heading |
| `left-body` | content | required | Left panel content |
| `right-title` | content | required | Right panel heading |
| `right-body` | content | required | Right panel content |

---

### `manifest-box`

Structured content box with top accent border and horizontal rule under title, suitable for inventories and detailed lists.

```typst
#manifest-box([Manifest Title], [
  - Item one
  - Item two
  - Item three
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box body content |
| `accent` | color | `palette.primary` | Top border and title color |

---

### `logbook-note`

Annotation/observation box with italic styling and copper left border, optionally attributed.

```typst
#logbook-note(
  [An insightful observation or quote goes here.],
  author: [Author Name, Source, Year]
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `body` | content | required | Note content (rendered italic) |
| `author` | content/none | `none` | Optional attribution |

---

## Color Palette

Access via `palette.*`:

| Token | Hex | Description |
|-------|-----|-------------|
| `bg` | `#FAF7F2` | Warm parchment background |
| `primary` | `#1B4F72` | Ocean blue (deep) |
| `secondary` | `#996515` | Accessible deep amber for text and metrics on light surfaces |
| `secondary-light` | `#D4A03C` | Bright gold for focus-slide text and decoration on navy |
| `accent-copper` | `#B87333` | Compass rose copper |
| `text` | `#1B2631` | Deep navy text |
| `text-muted` | `#5D6D7E` | Muted blue-gray |
| `card-bg` | `#FFFFFF` | Card background white |
| `parchment` | `#F5F0E8` | Light parchment tone |
| `ocean-light` | `#D6EAF8` | Light ocean blue |
| `navy-deep` | `#0D2F4F` | Darkest navy |
| `border` | `#D5DBDB` | Subtle border gray |
| `rose-red` | `#C0392B` | Port marker red |

---

## SVG Helpers

These functions render the theme's decorative SVG elements:

| Function | Description |
|----------|-------------|
| `mercator-grid-bg()` | Full-page mercator projection grid |
| `trade-routes-bg()` | Full-page trade route curves with port dots |
| `cartographic-frame()` | Full-page border frame with tick marks |
| `compass-rose(size: 80pt)` | Compass rose ornament at specified size |
| `route-accent(width: 100%)` | Horizontal trade route divider with port dots |
| `rhumb-lines-bg()` | Full-page radiating rhumb line pattern |

---

## Typography

- **Demo font**: Arial, Arial Unicode MS
- **Monospace**: IBM Plex Mono
- **Template behavior**: Font-agnostic; set the presentation font in `demo.typ` or `main.typ`
- **Base size**: 18pt
- **Title slides**: 2.4em bold
- **Section headings**: 2em bold
- **Card titles**: 0.92em bold
- **Card body**: 0.82em regular

---

## Usage Tips

1. Use `route-card` for general content cards with thematic styling
2. Use `port-box` to highlight key milestones or destinations
3. Use `tonnage-stat` in `cols()` rows for KPI dashboards
4. Use `voyage-card` for timeline narratives
5. Use `hemisphere-grid` for side-by-side regional comparisons
6. Use `waypoint-tag` for inline category labels
7. Use `logbook-note` for quotations and observations
8. Use `manifest-box` for structured inventories or checklists
9. Use `compass-card` for data displays that benefit from the directional accent
10. Use `latitude-divider` as a thematic section separator within slides
