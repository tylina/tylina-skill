# Quantum Dot Theme — API Reference

## Overview

A presentation theme inspired by quantum computing circuits and orbital patterns. Features Bloch sphere coordinate frames, quantum wire diagrams, gate-box decorations, and probability cloud aesthetics on light backgrounds. Suitable for tech/science presentations, research talks, and innovation showcases.

**Touying version**: 0.7.4
**Entry function**: `quantum-dot-theme`
**Fonts**: User-configured. The demo uses `("Avenir Next", "Arial Unicode MS")` with `"Menlo"` for raw code.
**Base size**: 18pt

---

## Theme Entry

```typst
#set text(font: ("Avenir Next", "Arial Unicode MS"), size: 18pt)
#show raw: set text(font: "Menlo")

#show: quantum-dot-theme.with(
  aspect-ratio: "16-9",       // "16-9" or "4-3"
  footer: [Footer text],      // Optional footer content
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/none | `none` | Persistent footer text |
| `..args` | any | — | Additional touying config arguments |

---

## Color Palette

Access via `palette.<name>`:

| Name | Hex | Usage |
|------|-----|-------|
| `bg` | `#F8F7FC` | Light lavender background |
| `primary` | `#7C3AED` | Electric violet — primary accent |
| `secondary` | `#06B6D4` | Cyan — secondary accent |
| `secondary-ink` | `#087C8C` | Contrast-safe cyan companion for text on light surfaces |
| `text` | `#1E1B4B` | Deep navy/indigo — body text |
| `text-muted` | `#6366A0` | Muted purple — secondary text |
| `card-bg` | `#FFFFFF` | White — card backgrounds |
| `accent-purple` | `#A78BFA` | Light purple — soft accents |
| `accent-indigo` | `#4338CA` | Deep indigo — strong emphasis |
| `light-violet` | `#EDE9FE` | Very light violet — backgrounds |
| `light-cyan` | `#ECFEFF` | Very light cyan — backgrounds |
| `border` | `#C4B5FD` | Violet border color |

---

## Slide Functions

### `title-slide(..args)`

Full-page title slide with Bloch sphere frame bookend, quantum circuit background, and centered metadata.

```typst
#title-slide()
```

### `slide(title: auto, align: auto, ..args)`

Standard content slide with quantum circuit wire atmosphere, orbital cloud hints, and header/footer. Supports multi-column layouts with `[][]` syntax.

```typst
== Slide Title
Content here...

// Or with explicit title:
#slide(title: [Custom Title])[
  Content...
]
```

### `new-section-slide`

Auto-generated section divider. Triggered by `= Section Name` headings.

### `focus-slide(body)`

Full-page statement slide with deep indigo background and violet text.

```typst
#focus-slide[
  _"A powerful quote or key statement."_
]
```

### `ending-slide(body)`

Closing slide with Bloch sphere frame bookend (matching title slide).

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `qubit-card(title, body, accent: palette.primary)`

Info card with quantum wire accent on the left border. Primary content container.

```typst
#qubit-card([Card Title], [
  Card content goes here. Supports *bold*, _italic_, and lists.
], accent: palette.primary)
```

### `gate-box(title, body, accent: palette.secondary)`

Highlighted content box with gate-icon styled top border. Good for key insights and important callouts.

```typst
#gate-box([Key Insight], [
  This is an important observation that deserves visual emphasis.
], accent: palette.secondary)
```

### `state-tag(content, color: palette.primary)`

Small capsule label inspired by quantum state notation. Use for categorization tags.

```typst
#state-tag([Surface Code], color: palette.primary)
#state-tag([FPGA], color: palette.secondary)
```

### `orbital-card(title, body, accent: palette.primary)`

Data display card with subtle orbital pattern gradient background. Good for feature lists and descriptions.

```typst
#orbital-card([Feature Name], [
  Description of the feature with supporting details.
], accent: palette.primary)
```

### `wire-divider(width: 80%)`

Quantum circuit wire separator. Centers automatically.

```typst
#wire-divider(width: 60%)
```

### `superposition-stat(label, value, color: palette.primary)`

KPI/metric display with a centered ket icon, value, then label. Bright cyan inputs automatically use the contrast-safe `secondary-ink` for text while retaining cyan decoration.

```typst
#superposition-stat([Metric Label], [42.5%], color: palette.primary)
```

### `entangle-card(title, body, accent: palette.accent-purple)`

Connected/linked content card with entanglement curve decoration and violet background.

```typst
#entangle-card([Connected Insight], [
  Content that relates to or builds upon other elements.
], accent: palette.accent-purple)
```

### `register-grid(left-title, left-body, right-title, right-body)`

Two-panel comparison layout inspired by multi-qubit register notation.

```typst
#register-grid(
  [Before], [
    - Old approach
    - Previous results
  ],
  [After], [
    - New approach
    - Improved results
  ],
)
```

### `measurement-box(title, body, accent: palette.secondary)`

Observation/result content box with full accent border. Good for conclusions and findings.

```typst
#measurement-box([Finding], [
  The experimental results confirm our hypothesis with 95% confidence.
], accent: palette.secondary)
```

### `coherence-note(title, body, accent: palette.accent-indigo)`

Annotation/insight card with dashed border. Subtle appearance for supplementary information.

```typst
#coherence-note([Note], [
  Additional context or timeline information.
], accent: palette.accent-indigo)
```

---

## SVG Helpers

These are lower-level rendering functions for direct SVG usage:

| Function | Description |
|----------|-------------|
| `quantum-circuit-bg()` | Full-page quantum circuit wire background |
| `orbital-cloud-bg()` | Orbital probability cloud pattern |
| `bloch-sphere-frame()` | Bloch sphere coordinate frame (bookend) |
| `wire-divider-render(width: 100%)` | Quantum wire divider line |
| `entangle-curve(width: 80pt)` | Entanglement connection curve |
| `ket-frame-render(height: 30pt)` | Ket notation decorative bracket |

---

## Layout Patterns

### Multi-column with `cols`

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  qubit-card([Left], [Content...]),
  qubit-card([Right], [Content...]),
)
```

### Two-panel slide with `[][]`

```typst
#slide[
  Left panel content...
][
  Right panel content...
]
```

### Stat row

```typst
#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  superposition-stat([Label 1], [Value 1], color: palette.primary),
  superposition-stat([Label 2], [Value 2], color: palette.secondary),
  superposition-stat([Label 3], [Value 3], color: palette.accent-indigo),
  superposition-stat([Label 4], [Value 4], color: palette.primary),
)
```

### Tags row

```typst
#stack(dir: ltr, spacing: 0.5em,
  state-tag([Tag 1], color: palette.primary),
  state-tag([Tag 2], color: palette.secondary),
  state-tag([Tag 3], color: palette.accent-indigo),
)
```
