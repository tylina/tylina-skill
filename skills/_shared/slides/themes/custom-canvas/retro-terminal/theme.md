# Retro Terminal Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `retro-terminal-theme`
**Style**: CRT / phosphor display -- vintage 1970s-80s computer terminal aesthetic
**Primary color**: `#00FF41` (Green Phosphor, default green preset)
**Best For**: Cybersecurity, hacker culture, retro computing, developer talks, CLI tools, system administration
**Style Objective**: CRT / Phosphor Display Vintage Terminal
**Complexity Level**: Canvas

## Description

A vintage 1970s-80s computer terminal aesthetic presentation theme inspired by VT100, IBM 3270, and amber phosphor monitors. Features CRT scanline overlays, phosphor glow effects, cursor block decorations, fixed-width monospace typography throughout, boot sequence text, terminal-card windows, process-stat displays, and pipe-dividers. Ships with 3 presets (green, amber, blue) representing different phosphor colors.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Mono", "DejaVu Sans Mono"), size: 20pt)

#show: retro-terminal-theme.with(
  aspect-ratio: "16-9",
  preset: "green",
  footer: [SYSTEM OVERVIEW],
  config-info(
    title: [System Architecture],
    subtitle: [Infrastructure Overview],
    author: [Admin],
    date: datetime.today(),
    institution: [MAINFRAME],
  ),
)

#title-slide()

= Network

== Active Connections

#process-stat([8192], [CONNECTIONS], [2,847])
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `preset` | string | `"green"` | Phosphor preset: `"green"`, `"amber"`, `"blue"` |
| `footer` | content/function | `none` | Footer content or function |
| `align` | alignment | `horizon` | Default content alignment |

## Available Slide Types

### `#title-slide()`
CRT boot sequence with loading lines, [OK] markers, large phosphor title with cursor block, and system info.

### `#slide(title: auto, align: auto)`
Standard CRT slide with scanlines, phosphor title with cursor block, and terminal footer.

### `#dark-slide(title: auto, header-left: none, header-right: none)`
Amber accent variant with amber phosphor text and scanlines.

### `#new-section-slide[...]`
Section divider with `> cd /section-01/` command, ghost section number, and pipe divider. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`
Large centered phosphor text with cursor block and "> FOCUS" prompt.

### `#ending-slide[...]`
Exit style farewell with ghost "EXIT" text, "> EXIT 0" command, and "[SESSION TERMINATED]" label.

## Reusable Components

### `#scanline-overlay(opacity: 3%, color: palette.phosphor)`
CRT horizontal scan lines (52 lines at 9.2pt intervals).
```typst
#scanline-overlay(opacity: 2%, color: palette.phosphor)
```

### `#cursor-block(color: palette.phosphor, width: 0.55em, height: 0.95em)`
Terminal cursor block (signature element).
```typst
#cursor-block(color: palette.phosphor)
```

### `#boot-text(body, color: palette.phosphor)`
Boot sequence label with > prompt.
```typst
#boot-text([LOADING MODULE...])
```

### `#ok-marker(color: palette.phosphor)` / `#fail-marker()`
Status markers [OK] and [FAIL].
```typst
#boot-text([INIT]) #h(1em) #ok-marker()
```

### `#terminal-card(title, body, user: "user", host: "host", color: palette.phosphor)`
Terminal window card with user@host header bar.
```typst
#terminal-card([/var/log], user: "root", host: "srv01")[Log content...]
```

### `#process-stat(pid, label, value, color: palette.phosphor)`
System process-styled stat (PID + large number + label).
```typst
#process-stat([8192], [ACTIVE USERS], [2,847])
```

### `#stdout-box(body, color: palette.phosphor)`
Output block with $ prompt and left border.
```typst
#stdout-box([docker ps --format "table {{.Names}}\t{{.Status}}"])
```

### `#command-tag(body, color: palette.phosphor)`
Inline code-style tag.
```typst
#command-tag([nginx]) #command-tag([docker])
```

### `#pipe-divider(color: palette.phosphor, segments: 8)`
Terminal-style |---| divider.
```typst
#pipe-divider(segments: 6)
```

### `#man-quote(section, body, color: palette.phosphor)`
Man page-styled quote with section label.
```typst
#man-quote([SYNOPSIS], [Reliable message delivery system...])
```

### `#system-line(body, color: palette.phosphor)`
Single line of system output.
```typst
#system-line([STATUS: All systems operational])
```

## Color Scheme

### Preset Dictionary

| Preset | Background | Phosphor | Dim | Glow Tint |
|--------|-----------|----------|-----|-----------|
| `green` | `#0D1117` | `#00FF41` | `#004D00` | `#00FF41` |
| `amber` | `#0D1117` | `#FFB000` | `#4D3600` | `#FFB000` |
| `blue` | `#0A0E1A` | `#00BFFF` | `#003355` | `#00BFFF` |

### Derived Palette Keys

| Key | Purpose |
|-----|---------|
| `palette.bg` | Terminal black background |
| `palette.phosphor` | Primary bright text |
| `palette.dim` | Dim text variant |
| `palette.glow-tint` | Screen glow base color |
| `palette.phosphor-bright` | Full brightness |
| `palette.phosphor-mid` | 30% transparent |
| `palette.phosphor-faint` | 60% transparent |
| `palette.phosphor-ghost` | 85% transparent |
| `palette.phosphor-dim` | 92% transparent |
| `palette.screen-glow` | 95% transparent tint |
| `palette.surface` | Card backgrounds |
| `palette.surface-border` | Card borders |
| `palette.meta-color` | Footer/header text |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.phosphor,
  neutral-lightest: palette.phosphor,
  neutral-darkest: palette.bg,
)
```

## Files

- `template.typ` -- Theme definition (presets, components, slides, entry point)
- `demo.typ` -- Compilable showcase (system architecture topic)

## Demo

See `demo.typ` for a compilable example.
