# Aqua Desktop Theme — API Reference

A macOS/Aqua desktop UI inspired theme for Touying 0.7.4. Features window chrome with traffic light buttons, frosted glass panels, toolbar aesthetics, dock reflections, and clean typography.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Helvetica Neue", "Arial", "Arial Unicode MS"), size: 20pt)

#show: aqua-desktop-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Company Name -- Conference 2026],
  config-info(
    title: [Presentation Title],
    subtitle: [Your Subtitle Here],
    author: [Speaker Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#title-slide()

= Section Title

== Slide Title

Content goes here.

#ending-slide[Thank You]
```

## Theme Entry Point

### `aqua-desktop-theme`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/none | `none` | Footer text for content slides |
| `..args` | | | Additional Touying config arguments |

## Slide Types

### `title-slide()`

Full "desktop" appearance with a large frosted window panel, traffic lights, and centered title/author info. Bookend slide (paired with `ending-slide`).

### `slide(title: auto, align: auto)`

Standard content slide with toolbar-style header featuring traffic lights and title, dot-grid background, and dock reflection at bottom.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title (auto uses heading) |
| `align` | auto/alignment | `auto` | Optional per-slide vertical alignment override |

### `new-section-slide`

Triggered automatically by `= Section Title`. Features a sidebar left panel with large section number and main area with traffic lights and section title.

### `outline-slide(title: [Contents])`

Clean table-of-contents slide with toolbar header style.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | `[Contents]` | Header title |

### `focus-slide`

System Blue background with white text, minimal window frame dots at top. Use for key quotes or emphasis.

```typst
#focus-slide[
  "Your impactful quote here."
]
```

### `ending-slide`

Bookend closing slide matching `title-slide` with frosted window chrome and dock reflection.

```typst
#ending-slide[Thank You]
```

## Components

### `window-card(title, body, accent: palette.active-blue)`

macOS-style window with title bar, traffic light buttons, and content area. Uses `stack(spacing: 0pt)` for seamless title bar + body.

```typst
#window-card([Window Title], [
  Content inside the window card.
])
```

### `toolbar-box(title, body, accent: palette.active-blue)`

Toolbar-style box with segmented control pill in header.

```typst
#toolbar-box([Section Name], [
  - Feature one
  - Feature two
], accent: palette.purple)
```

### `notification-card(title, body, accent: palette.active-blue)`

Rounded notification banner with left accent border and app icon hint.

```typst
#notification-card([Alert Title], [
  Notification message content.
], accent: palette.traffic-green)
```

### `metric-panel(value, label, accent: palette.active-blue)`

Clean stat display in sidebar-style panel with large value and uppercase label.

```typst
#metric-panel([99.9%], [uptime], accent: palette.traffic-green)
```

### `code-window(title, body)`

Terminal/code window with dark title bar (traffic lights) and dark content area.

```typst
#code-window([main.rs], [
  ```rust
  fn main() { println!("Hello"); }
  ```
])
```

### `tag-pill(content, color: palette.active-blue)`

Rounded pill tag with colored dot, like macOS Finder tags.

```typst
#tag-pill([Production], color: palette.traffic-green)
#tag-pill([Beta], color: palette.active-blue)
```

### `sidebar-item(title, body, accent: palette.active-blue)`

Sidebar list item with colored dot indicator and indented description.

```typst
#sidebar-item([Feature Name], [
  Description of the feature.
], accent: palette.purple)
```

### `dropdown-card(title, body, accent: palette.active-blue)`

Dropdown menu styled card with chevron and separator line.

```typst
#dropdown-card([Options], [
  - Option A
  - Option B
])
```

### `progress-bar(value, label, accent: palette.active-blue, progress: 70%)`

macOS-style progress indicator with label and value display.

```typst
#progress-bar([87%], [CPU Usage], accent: palette.active-blue, progress: 87%)
```

Pass the visual fill separately as `progress:` so the bar length accurately matches the displayed value.

### `dock-divider(width: 80%)`

Decorative vertical-bar separator mimicking the macOS dock divider.

```typst
#dock-divider(width: 60%)
```

## Layout Patterns

### Two-Column with `cols`

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  window-card([Left], [Content]),
  window-card([Right], [Content]),
)
```

### Four-Column Metrics

```typst
#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  metric-panel([100K], [users]),
  metric-panel([50ms], [latency]),
  metric-panel([99.9%], [uptime]),
  metric-panel([24/7], [support]),
)
```

### Ordinary Two-Column Slide

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  Left column content
][
  Right column content
]
```

### Stacked Components

```typst
#stack(
  spacing: .8em,
  toolbar-box([Title], [Content]),
  notification-card([Note], [Message]),
)
```

## Color Palette

Access colors via `palette.color-name`:

| Name | Hex | Usage |
|------|-----|-------|
| `palette.bg` | `#F5F5F7` | Main background |
| `palette.toolbar` | `#E8E8ED` | Toolbar/header fill |
| `palette.active-blue` | `#007AFF` | Primary accent |
| `palette.purple` | `#AF52DE` | Secondary accent |
| `palette.text-dark` | `#1D1D1F` | Headings |
| `palette.body-text` | `#424245` | Body copy |
| `palette.card` | `#FFFFFF` | Card backgrounds |
| `palette.border` | `#D2D2D7` | Borders |
| `palette.sidebar` | `#F0F0F5` | Sidebar fill |
| `palette.traffic-red` | `#FF5F57` | Close button |
| `palette.traffic-yellow` | `#FFBD2E` | Minimize button |
| `palette.traffic-green` | `#28C840` | Fullscreen button |

## Best Practices

1. Use `window-card` for primary content containers — it provides the signature macOS look
2. Use `code-window` for any code or terminal output
3. Pair `metric-panel` in 3-4 column layouts for dashboard-style stats
4. Use `tag-pill` inline before feature lists for status indicators
5. The `dock-divider` works well as a section separator within a slide
6. Keep text concise — the window chrome takes visual space
7. Use `accent: palette.purple` for secondary/alternative styling
