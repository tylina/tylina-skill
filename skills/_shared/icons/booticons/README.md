# Bootstrap Icons

**Package**: `@preview/booticons:0.0.1`
**Icon count**: 2000+ (Bootstrap Icons v1.13.1)
**Source**: [Bootstrap Icons](https://icons.getbootstrap.com/)

## Description

Bootstrap Icons — a collection of 2000+ icons from the Bootstrap project. SVG-based, no font required.

## Usage

```typst
#import "@preview/booticons:0.0.1": bsicon

#bsicon("house-fill")
#bsicon("person-fill", color: blue)
#bsicon("gear-fill", height: 2em)
```

## API Reference

### `bsicon(name, ..args)`

Renders an icon by name.

- `name` (positional, required) — The icon name string (e.g., `"house-fill"`, `"gear"`)
- `color` (named) — Icon color (default: `black`)
- `height` (named) — Icon height (default: `1em`)
- `baseline` (named) — Baseline offset for vertical alignment (e.g., `.1em`)
- Any other `box()` parameters are also accepted (e.g., `width`, `inset`, `outset`)

## Parameters Table

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `name` | `str` | (required, positional) | Icon name string |
| `color` | `color` | `black` | Icon fill color |
| `height` | `length` | `1em` | Icon height |
| `baseline` | `length` | `0pt` | Baseline shift for inline alignment |
| `width` | `length` | auto | Icon width (passed to `box()`) |

## Inline Usage

For inline usage within text paragraphs, use `baseline` and `height` to align the icon with surrounding text:

```typst
Check #bsicon("check-circle-fill", color: green, baseline: .1em, height: .9em) Done!
```

## Context Usage

When using `color: text.fill` to match the current text color, you MUST wrap the call in `#context`:

```typst
#context bsicon("house-fill", color: text.fill)
```

This is required because `text.fill` is a contextual value that Typst can only resolve inside a `context` expression.

## Popular Icons (name strings)

### Navigation & UI
`house`, `house-fill`, `list`, `search`, `gear`, `gear-fill`, `person`, `person-fill`, `people`, `people-fill`, `bell`, `bell-fill`, `envelope`, `envelope-fill`, `telephone`, `telephone-fill`

### Actions
`plus`, `plus-circle`, `plus-circle-fill`, `dash`, `dash-circle`, `x`, `x-circle`, `x-circle-fill`, `check`, `check-circle`, `check-circle-fill`, `pencil`, `pencil-fill`, `trash`, `trash-fill`, `download`, `upload`, `share`, `share-fill`, `link-45deg`, `clipboard`, `clipboard-fill`, `copy`

### Arrows
`arrow-up`, `arrow-down`, `arrow-left`, `arrow-right`, `arrow-up-right`, `arrow-down-left`, `chevron-up`, `chevron-down`, `chevron-left`, `chevron-right`, `caret-up-fill`, `caret-down-fill`, `caret-left-fill`, `caret-right-fill`, `arrow-repeat`, `arrow-clockwise`, `arrow-counterclockwise`

### Media & Files
`image`, `image-fill`, `camera`, `camera-fill`, `film`, `music-note`, `music-note-beamed`, `file-earmark`, `file-earmark-text`, `file-earmark-pdf`, `file-earmark-code`, `folder`, `folder-fill`, `folder-open`, `cloud`, `cloud-fill`, `cloud-upload`, `cloud-download`, `database`, `database-fill`

### Charts & Data
`bar-chart`, `bar-chart-fill`, `graph-up`, `graph-up-arrow`, `graph-down`, `pie-chart`, `pie-chart-fill`, `speedometer`, `speedometer2`, `table`, `kanban`

### Social & Brands
`github`, `twitter`, `twitter-x`, `linkedin`, `facebook`, `instagram`, `youtube`, `discord`, `slack`, `stack-overflow`, `reddit`, `tiktok`, `mastodon`

### Status & Alerts
`exclamation-triangle`, `exclamation-triangle-fill`, `exclamation-circle`, `exclamation-circle-fill`, `info-circle`, `info-circle-fill`, `check-circle`, `check-circle-fill`, `x-circle`, `x-circle-fill`, `question-circle`, `question-circle-fill`, `star`, `star-fill`, `star-half`, `heart`, `heart-fill`, `hand-thumbs-up`, `hand-thumbs-up-fill`, `hand-thumbs-down`, `hand-thumbs-down-fill`

### Weather
`sun`, `sun-fill`, `moon`, `moon-fill`, `moon-stars`, `cloud-sun`, `cloud-sun-fill`, `cloud-rain`, `cloud-rain-fill`, `snow`, `lightning`, `lightning-fill`, `thermometer-half`, `wind`

### Devices & Hardware
`laptop`, `phone`, `tablet`, `display`, `printer`, `cpu`, `gpu-card`, `usb-drive`, `mouse`, `keyboard`, `wifi`, `bluetooth`

### Communication
`chat`, `chat-fill`, `chat-dots`, `chat-dots-fill`, `megaphone`, `megaphone-fill`, `at`, `send`, `send-fill`, `reply`, `reply-fill`

For the full searchable list, see `icons.txt` in this directory.

Browse all: https://icons.getbootstrap.com/
