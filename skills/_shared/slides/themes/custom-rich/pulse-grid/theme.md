# Pulse Grid Theme -- API Reference

## Overview

The **Pulse Grid** theme provides a heartbeat monitor / oscilloscope grid aesthetic for presentations. It features phosphor-green ECG trace waveforms, oscilloscope grid backgrounds, digital readout panels, and vital-signs display layouts on clean light backgrounds.

**Tier**: custom-rich
**Touying Version**: 0.7.4
**Entry Function**: `pulse-grid-theme`

---

## Theme Entry Point

```typst
#show: pulse-grid-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("IBM Plex Sans", "Heiti SC"))
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer text displayed on content slides |

---

## Slide Functions

### `title-slide(..args)`

Full-page title slide with monitor frame bookend, oscilloscope grid background, and centered metadata.

```typst
#title-slide()
```

### `slide(title: auto, ..args)`

Standard content slide with oscilloscope grid atmosphere, ECG pulse header decoration, and footer with slide counter.

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

### `new-section-slide(self: none, body)`

Automatically generated when using `= Section Title`. Left green accent bar with signal peak decoration.

```typst
= New Section
```

### `focus-slide(body)`

Dark charcoal background (oscilloscope screen mode) with phosphor-green text. For impactful single statements.

```typst
#focus-slide[
  Your key message here.
]
```

### `ending-slide(body)`

Closing slide with monitor frame bookend (matching title slide). ECG pulse decoration above farewell text.

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `readout-card(title, value, unit: none, accent: palette.primary)`

Digital display panel with monospace value readout. Top colored border with status indicator dot.

```typst
#readout-card([Latency], [< 340], unit: [ms], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Label above the value |
| `value` | content | required | Main displayed value (monospace) |
| `unit` | content/none | `none` | Unit suffix after value |
| `accent` | color | `palette.primary` | Top border and value color |

---

### `trace-box(title, body, accent: palette.primary)`

Content box with left colored border, node indicator, and ECG waveform bottom decoration.

```typst
#trace-box([Analysis Results], [
  Your content here with waveform border below.
], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box header text |
| `body` | content | required | Box content |
| `accent` | color | `palette.primary` | Left border and node color |

---

### `signal-tag(content, color: palette.primary)`

Small status indicator capsule with glowing dot. Inline element for labeling states.

```typst
#signal-tag([Active], color: palette.primary)
#signal-tag([Pending], color: palette.alert)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag label text |
| `color` | color | `palette.primary` | Dot and text color |

---

### `monitor-card(title, readings, accent: palette.primary)`

Multi-value data display panel. Shows a list of labeled readings in a compact vertical format.

```typst
#monitor-card([System Status], (
  ("CPU", "78%"),
  ("Memory", "4.2 GB"),
  ("Disk I/O", "120 MB/s"),
), accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Panel header |
| `readings` | array of (string, string) | required | List of (label, value) pairs |
| `accent` | color | `palette.primary` | Header node and value color |

---

### `baseline-divider(color: palette.primary, width: 80%)`

Waveform separator line with signal spikes. Decorative horizontal divider.

```typst
#baseline-divider(width: 60%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | color | `palette.primary` | Divider color |
| `width` | length | `80%` | Divider width |

---

### `vital-stat(label, value, trend: none, color: palette.primary)`

KPI display card with large value, optional trend description, and signal peak hint in corner.

```typst
#vital-stat([Accuracy], [99.7%], trend: [+0.3% vs last quarter], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Metric label |
| `value` | content | required | Large display value |
| `trend` | content/none | `none` | Trend or context text below value |
| `color` | color | `palette.primary` | Value color |

---

### `channel-card(channel-id, title, body, accent: palette.secondary)`

Labeled data channel card with colored header band showing channel identifier.

```typst
#channel-card(accent: palette.primary)[01][Temperature][
  Current reading: 23.4 C with 0.1 C precision.
]
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `channel-id` | content | required | Channel identifier (shown as `CH:xx`) |
| `title` | content | required | Channel name |
| `body` | content | required | Channel content |
| `accent` | color | `palette.secondary` | Header band color |

---

### `spectrum-grid(items, columns: 3, accent: palette.primary)`

Multi-item frequency/data display arranged in a grid layout.

```typst
#spectrum-grid(
  columns: 3,
  accent: palette.primary,
  (
    (label: "Frequency A", value: "1.23 Hz"),
    (label: "Frequency B", value: "4.56 Hz"),
    (label: "Frequency C", value: "7.89 Hz"),
  ),
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `items` | array of dicts | required | Each dict has `label` and `value` keys |
| `columns` | int | `3` | Number of grid columns |
| `accent` | color | `palette.primary` | Left border and value color |

---

### `alert-box(title, body, level: "warning")`

Warning or critical content box with colored left border. Level determines color.

```typst
#alert-box([Warning], [Threshold exceeded.], level: "warning")
#alert-box([Critical], [System failure imminent.], level: "critical")
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Alert header |
| `body` | content | required | Alert content |
| `level` | string | `"warning"` | `"warning"` (orange) or `"critical"` (red) |

---

### `log-entry(timestamp, event, detail: none, accent: palette.primary)`

Timestamped observation record. Compact single-line format with optional detail.

```typst
#log-entry([2026-03-15T10:30Z], [System Online], detail: [All sensors reporting nominal])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `timestamp` | content | required | Time/date stamp (monospace) |
| `event` | content | required | Event description |
| `detail` | content/none | `none` | Optional detail text |
| `accent` | color | `palette.primary` | Left border and timestamp color |

---

### `pulse-divider(color: palette.primary, width: 80%)`

ECG-based decorative separator. Centers a pulse waveform SVG.

```typst
#pulse-divider(width: 60%)
```

---

## SVG Helpers (Advanced)

These functions render raw SVG elements for custom layouts:

| Function | Description |
|----------|-------------|
| `oscilloscope-grid-bg()` | Full-page oscilloscope grid |
| `monitor-frame()` | Monitor border frame (bookend) |
| `ecg-pulse(width)` | ECG heartbeat pulse waveform |
| `signal-peak(width)` | Small inline signal peak decoration |
| `crosshair-marker(size)` | Grid crosshair intersection marker |

---

## Color Palette

Access colors via `palette.xxx`:

| Key | Hex | Usage |
|-----|-----|-------|
| `bg` | `#F8F9FA` | Page background (very light gray) |
| `card-bg` | `#FFFFFF` | Card/panel background |
| `text` | `#1E293B` | Primary text (dark charcoal) |
| `text-muted` | `#64748B` | Secondary/label text |
| `primary` | `#10B981` | Emerald green (phosphor) |
| `primary-dark` | `#059669` | Darker green variant |
| `secondary` | `#3B82F6` | Electric blue |
| `alert` | `#F59E0B` | Warning orange |
| `alert-red` | `#EF4444` | Critical red |
| `grid-line` | `#10B981` | Grid line color |
| `grid-faint` | `#E2E8F0` | Faint grid/border |
| `border` | `#CBD5E1` | Standard border |
| `panel-bg` | `#F1F5F9` | Panel background (slightly darker) |
| `trace-glow` | `#10B981` | Trace glow effect |
| `primary-ink` | `#047857` | Readable green text on light surfaces |
| `secondary-ink` | `#1D4ED8` | Readable blue text on light surfaces |
| `alert-ink` | `#92400E` | Readable warning text on light surfaces |
| `alert-red-ink` | `#B91C1C` | Readable critical text on light surfaces |

---

## Fonts

- **Body recommendation**: IBM Plex Sans with Heiti SC fallback (18pt)
- **Monospace**: IBM Plex Mono (for readout values, timestamps, channel IDs)

The theme entry sets size and color but intentionally does not set the document font. Apply the recommended body stack in `demo.typ` or `main.typ` after the theme show rule.

---

## Usage Tips

1. Use `readout-card` for key metrics in grid layouts with `#cols()`
2. Combine `monitor-card` with `alert-box` for dashboard-style slides
3. Use `log-entry` components vertically for timeline/event narratives
4. `signal-tag` works well inline with `#h()` spacing for status labels
5. `spectrum-grid` is ideal for displaying multiple related measurements
6. `baseline-divider` and `pulse-divider` add visual breaks between content sections
