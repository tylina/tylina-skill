# Signal Wave Theme - API Reference

A radio/audio waveform aesthetic theme for Touying 0.7.4 with flowing sine curves and frequency visualizations. Light theme with cool gray-blue tones, deep signal blue primary, and warm frequency orange accent.

## Installation

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 18pt)
```

## Theme Entry

### `signal-wave-theme`

Main theme function. Wraps `touying-slides.with(config-*(...))`.

```typst
#show: signal-wave-theme.with(
  aspect-ratio: "16-9",  // "16-9" or "4-3"
  footer: [Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
  config-common(breakable: false),
)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default content alignment |
| `footer` | content/none | `none` | Footer text shown on content slides |

Sets `text(size: 20pt)` globally. Fonts should be set in the demo/document file.

---

## Slide Functions

### `title-slide`

Opening slide with waveform frame border, antenna tower decorations, and spectrum bar accent. Bookend slide (shares visual elements with ending-slide).

```typst
#title-slide()
```

Uses `config-info` data (title, subtitle, author, date).

### `slide`

Standard content slide with oscilloscope grid atmosphere, header with title and border, and wave-divider footer.

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
| `align` | alignment/auto | `auto` | Content alignment override |

### `new-section-slide`

Auto-generated section divider. Triggered by `= Section Heading`. Features left accent band, oscilloscope grid background, wave divider, and spectrum bar decoration.

### `focus-slide`

Full-bleed primary-colored slide for key statements. Enhanced sine wave overlay on dark background.

```typst
#focus-slide[
  Key message here.
]
```

### `ending-slide`

Closing slide matching title-slide bookend elements (waveform frame, antenna towers).

```typst
#ending-slide[
  Thank You
]
```

### `outline-slide`

Table of contents with wave-divider decoration.

```typst
#outline-slide(title: [Outline])
```

---

## Components

### `frequency-card[title][body]`

Card with colored header containing spectrum bar SVG icon. Primary blue header with white text, white body with left border accent.

```typst
#frequency-card[Analysis Results][
  Content with findings...
]
```

### `spectrum-box[title][body]`

Box with a frequency bar visualization on its left edge. Clean border with subtle spectrum decoration.

```typst
#spectrum-box[Configuration][
  Parameter settings and details...
]
```

### `signal-tag[label]`

Small inline badge/tag with wave icon. Light primary background.

```typst
#signal-tag[FFT] #signal-tag[DSP] #signal-tag[Real-time]
```

### `wave-divider()`

Horizontal SVG sine wave separator between content sections. Two overlapping waves (primary and secondary colors).

```typst
#wave-divider()
```

### `stat-card[value][label]`

Metric display card with large value, pulse line decoration, and label. Good for KPIs and key numbers.

```typst
#stat-card[99.7%][Accuracy]
```

### `code-block[title][body]`

Terminal-style code container with dark background. Colored dots in header (like terminal window chrome). Monospace font in body.

```typst
#code-block[main.py][
  ```python
  print("Hello, Signal!")
  ```
]
```

### `channel-card[title][body]`

Card with three parallel colored channel lines (primary/secondary/tertiary) as title decoration. Represents multi-channel data.

```typst
#channel-card[System Channels][
  - Channel A: Input
  - Channel B: Processing
  - Channel C: Output
]
```

### `insight-box[title][body]`

Callout box with secondary (orange) left border accent and pulsing dot icon. For important observations and insights.

```typst
#insight-box[Key Finding][
  Important observation that deserves emphasis...
]
```

### `comparison-table(align: center + horizon, headers, rows)`

Bare native data table with a primary header rule, semantic header row, alternating row fills (wave-bg / white), and configurable cell alignment.

```typst
#comparison-table(
  ([Col A], [Col B], [Col C]),
  (
    ([Row 1A], [Row 1B], [Row 1C]),
    ([Row 2A], [Row 2B], [Row 2C]),
  ),
)
```

### `pulse-card[title][body]`

Card with animated-looking pulse/heartbeat ECG line decoration across the top edge.

```typst
#pulse-card[Monitoring][
  System health metrics and status...
]
```

### `noise-note[body]`

Borderless footnote-style annotation with noise/static pattern icon. Italic text. For supplementary remarks.

```typst
#noise-note[Additional context that doesn't need emphasis.]
```

---

## Color Palette

Access via `palette.*`:

| Key | Hex | Usage |
|-----|-----|-------|
| `bg` | `#F7F9FC` | Page background |
| `primary` | `#2E5090` | Deep signal blue |
| `secondary` | `#E85D3A` | Warm frequency orange |
| `secondary-text` | `#B33F25` | Text-safe frequency orange for labels |
| `tertiary` | `#3A8C6E` | Green signal accent |
| `text-dark` | `#1A2744` | Headings, titles |
| `text-body` | `#3D4F6B` | Body text |
| `card-bg` | `#FFFFFF` | Card surfaces |
| `border` | `#D8E2F0` | Soft blue borders |
| `wave-bg` | `#EDF2F9` | Light fill for alternating rows |
| `terminal-bg` | `#1E2A3F` | Terminal code surface |
| `terminal-title` | `#A0B4D0` | Terminal title text |
| `terminal-meta` | `#7F92AF` | Terminal metadata text |
| `terminal-text` | `#C8D8EC` | Terminal body text |

---

## Design Notes

- **Background atmosphere**: Every content slide has a persistent `_bg-atmosphere` with subtle oscilloscope grid and sine wave traces.
- **Bookending**: Title and ending slides share the waveform frame border and antenna tower decorations.
- **SVG decorations**: All graphics are inline SVGs rendered via `image(bytes(...))`.
- **Height equalization**: Flexible cards use `lazy-v(1fr)` and must be placed one-per-column in `cols(lazy-layout: true)`; ordinary `cols` is used for mixed-component columns and native `grid` is reserved for internal fixed structures.
- **Adjacent colored blocks**: Use `stack(spacing: 0pt)` for seamless header+body combinations.
- **Alignment safety**: Slide functions use `std.align` to avoid shadowing Touying's `align` parameter.
