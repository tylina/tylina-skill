# Solar Flare Theme — API Reference

**Name**: solar-flare
**Display Name**: Solar Flare
**Style**: Warm solar energy, radiating patterns, optimistic & powerful
**Best For**: Energy sector, technology presentations, innovation reports, corporate strategy
**Complexity**: Rich (with SVG decorations)

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `palette.bg` | `#FFFDF7` | Warm white background |
| `palette.primary` | `#F59E0B` | Solar gold — primary accent |
| `palette.deep-amber` | `#B45309` | Deep amber — secondary accent |
| `palette.sunset` | `#EA580C` | Sunset orange — high-energy accent |
| `palette.cream` | `#FEF3C7` | Cream — title/ending bg |
| `palette.text` | `#451A03` | Dark brown text |
| `palette.text-muted` | `#92400E` | Muted amber-brown text |
| `palette.surface` | `#FFFBEB` | Slightly warm card background |
| `palette.corona` | `#FBBF24` | Corona yellow — highlights |
| `palette.flare` | `#F97316` | Flare orange — vibrant accent |

## Theme Entry Point

```typst
#show: solar-flare-theme.with(
  aspect-ratio: "16-9",        // "16-9" or "4-3"
  footer: [Footer text],       // Optional footer content
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
)
```

## Slide Functions

### `#title-slide(..args)`
Full-bleed title slide with solar flare burst, corona arcs, radiating rays, and golden frame border. Displays title, subtitle, author, institution, date from `config-info`.

### `= Section Heading` (new-section-slide)
Auto-triggered section divider with left gold accent band, halo decoration, and radiating dots.

### `#slide(title: auto)[content]`
Standard content slide with warm white background, faint sun rays, gold title bar with gradient accent. Supports `title: [Custom Title]` override.

### `#focus-slide[content]`
Deep amber background with centered flare burst. White text, ideal for impactful quotes or single statements.

### `#ending-slide[content]`
Closing slide matching title slide aesthetics (bookend effect) — cream background, sun rays, corona arcs, golden frame, magnetic field divider.

## Components

### `#concept-card(title, body, accent: palette.primary)`
Warm surface card with colored top accent bar. For key concepts, features, or category descriptions.
- `title`: Card heading (content)
- `body`: Card content (content)
- `accent`: Top border color (default: solar gold)

### `#insight-box(title, body, accent: palette.sunset)`
Left-bordered panel with orange/sunset accent. For insights, analysis, and observations.
- `title`: Box heading with dot marker
- `body`: Box content
- `accent`: Left border color (default: sunset orange)

### `#stat-card(label, value, trend: none)`
KPI metric card with large solar gold number. For data points and statistics.
- `label`: Metric name (content)
- `value`: Large formatted value (content)
- `trend`: Optional trend indicator (content)

### `#energy-card(title, body)`
Vibrant card with sunset gradient borders and inline sunspot SVG decoration. For high-energy, important content.
- `title`: Card heading
- `body`: Card content

### `#radiance-box(title, body, accent: palette.corona)`
Glowing box with inline halo ring SVG decoration. For featured/highlighted content blocks.
- `title`: Box heading
- `body`: Box content
- `accent`: Halo and border color (default: corona yellow)

### `#quote-card(quote, author: none)`
Quotation block with left gold accent, decorative quote mark, and magnetic field line below.
- `quote`: Quote text (content)
- `author`: Optional attribution (content)

### `#timeline-entry(date, title, description: none)`
Chronological item with solar dot marker and connecting line. Use in vertical lists for timelines.
- `date`: Date/period label
- `title`: Event name
- `description`: Optional details

### `#callout-box(title, body, kind: "info")`
Attention-grabbing notice box with icon circle. Supports three styles.
- `title`: Callout heading
- `body`: Callout content
- `kind`: `"info"` (solar gold), `"warning"` (sunset orange), `"success"` (green)

### `#solar-tag(content, color: palette.primary)`
Pill-shaped label/tag. Use inline for categories or keywords.
- `content`: Tag text
- `color`: Tag color (default: solar gold)

## SVG Decorations

| Function | Description |
|----------|-------------|
| `sun-rays-bg()` | Full-page radiating rays from top-right corner with concentric corona rings |
| `corona-arcs-overlay()` | Curved plasma loop arcs along top edge |
| `magnetic-field(color, width)` | Elegant curved magnetic field lines (divider) |
| `halo(color, size)` | Concentric ring decoration with radial tick marks |
| `flare-burst(size)` | Radiating spike pattern from center with central glow |
| `sunspot(size)` | Small sunspot cluster with dark center and ring |
| `solar-divider(color)` | Alias for magnetic-field at 60% width |

## Layout Helpers

- `#cols(columns: (..), gutter: .., ..bodies)` — Touying built-in column layout
- `#lazy-v(1fr)` — Used internally for height equalization in `cols(lazy-layout: true)`; it is inert outside lazy layout.
- Use lazy columns only when each column has exactly one direct stretchable component.

## Typography

- **Headings**: inherit the consuming deck's display face
- **Body**: inherit the consuming deck's installed body face
- **Base size**: 20pt
