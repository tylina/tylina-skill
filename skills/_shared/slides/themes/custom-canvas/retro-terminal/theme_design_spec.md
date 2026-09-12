# Retro Terminal Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | retro-terminal |
| **Best For** | Cybersecurity, hacker culture, retro computing, developer talks, CLI tools, system administration |
| **Style Objective** | CRT / Phosphor Display Vintage Terminal |
| **Complexity Level** | Canvas |

A vintage 1970s-80s computer terminal aesthetic presentation theme inspired by VT100, IBM 3270, and amber phosphor monitors. Features CRT scanline overlays, phosphor glow effects, cursor block decorations, fixed-width monospace typography throughout, boot sequence text, and terminal card components. Ships with 3 presets (green, amber, blue) representing different phosphor display colors.

## Design Philosophy

- **CRT Authenticity**: Scanline overlays at 2-3% opacity simulate the characteristic horizontal scan lines of CRT monitors
- **Phosphor Typography**: IBM Plex Mono with a DejaVu Sans Mono fallback keeps the terminal hierarchy stable on the supported host.
- **Cursor Block Signature**: The terminal cursor block appears after titles as the defining decorative element
- **Screen Glow Effect**: Subtle glow-tint overlay on black backgrounds simulates CRT phosphor bleed into "black" areas

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Terminal Black (green bg) | `#0D1117` | Primary background |
| Green Phosphor | `#00FF41` | Primary text (green preset) |
| Dark Green | `#004D00` | Dim text (green preset) |
| Amber Phosphor | `#FFB000` | Primary text (amber preset) |
| Dark Amber | `#4D3600` | Dim text (amber preset) |
| Deep Blue (blue bg) | `#0A0E1A` | Blue preset background |
| Cyan Phosphor | `#00BFFF` | Primary text (blue preset) |
| Dark Cyan | `#003355` | Dim text (blue preset) |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

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
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | `string` | `"green"` | Phosphor preset: `"green"`, `"amber"`, `"blue"` |
| `footer` | `content/function` | `none` | Footer content or function |
| `align` | `alignment` | `horizon` | Default content alignment |

## Slide Functions

### `title-slide(..args)`
CRT boot sequence style. Full terminal black background with screen glow, scanline overlay, boot text lines ("> LOADING SYSTEM...", "> INIT DISPLAY DRIVER [OK]", "> MOUNT /dev/presentation [OK]"), large phosphor title (2.2em bold) with cursor block, subtitle, and system info lines ("> USER:", "> DATE:", "> HOST:") ending with "> READY."

### `slide(title: auto, align: auto, ..args)`
Standard CRT slide with scanline overlay, terminal-style header (monospace metadata, page counter, bold phosphor title with cursor block), phosphor-colored body text, and footer with "TERMINAL" label and > prompt separator.

### `dark-slide(title: auto, header-left: none, header-right: none, ..args)`
Amber accent variant. Uses amber phosphor color instead of main preset's green. Scanline overlay in amber, amber title with cursor block, amber body text, and amber header/footer.

### `new-section-slide(self: none, body)`
Section divider with `> cd /section-01/` command style. CRT black background, screen glow, scanlines, ghost section number (160pt, 90% transparent top-right), cd command label, large phosphor section title with cursor block, pipe divider. Auto-triggered by `= Section Title`.

### `focus-slide(body)`
Brighter phosphor text on CRT background. Screen glow, scanlines, "> FOCUS" prompt decoration (top-left), large centered bold phosphor text (1.8em) with cursor block.

### `ending-slide(body)`
`> EXIT 0` style farewell. CRT background, screen glow, scanlines, ghost "EXIT" text (160pt, 93% transparent), "> EXIT 0" command, large bold farewell text with cursor block, "[SESSION TERMINATED]" label, and "RETRO-TERMINAL v1.0" meta label.

## Reusable Components

### `scanline-overlay(opacity: 3%, color: palette.phosphor)`
Horizontal CRT scan lines rendered across the slide. Creates 52 horizontal lines at 9.2pt intervals.

```typst
#scanline-overlay(opacity: 2%, color: palette.phosphor)
```

### `cursor-block(color: palette.phosphor, width: 0.55em, height: 0.95em)`
Terminal cursor block -- filled rectangle appended after titles. The signature decorative element.

```typst
#cursor-block(color: palette.phosphor)
```

### `boot-text(body, color: palette.phosphor)`
"Boot sequence" style label (dimmer, 9pt, with > prompt prefix).

```typst
#boot-text([LOADING MODULE...], color: palette.phosphor)
```

### `ok-marker(color: palette.phosphor)`
[OK] style status marker in bold.

```typst
#ok-marker(color: palette.phosphor)
```

### `fail-marker(color: palette.phosphor)`
[FAIL] style status marker in red.

```typst
#fail-marker()
```

### `terminal-card(title, body, user: "user", host: "host", color: palette.phosphor)`
Terminal window-styled card with header bar showing user@host:title and bordered body area.

```typst
#terminal-card([/var/log], user: "root", host: "srv01")[
  System logs and diagnostic output...
]
```

### `process-stat(pid, label, value, color: palette.phosphor)`
Stat styled like a system process. Shows PID number, large bold value (36pt), and label text.

```typst
#process-stat([8192], [ACTIVE CONNECTIONS], [2,847], color: palette.phosphor)
```

### `stdout-box(body, color: palette.phosphor)`
Output block with $ prompt prefix and left border.

```typst
#stdout-box([find / -name "*.conf" -mtime -7], color: palette.phosphor)
```

### `command-tag(body, color: palette.phosphor)`
Inline code-style tag with border and background tint.

```typst
#command-tag([nginx]) #command-tag([docker]) #command-tag([k8s])
```

### `pipe-divider(color: palette.phosphor, segments: 8)`
Divider that looks like |---|---|---|--- in terminal style.

```typst
#pipe-divider(color: palette.phosphor, segments: 6)
```

### `man-quote(section, body, color: palette.phosphor)`
Quote styled like a man page entry with section label (e.g., "DESCRIPTION(7)"), left border, and monospace body.

```typst
#man-quote([DESCRIPTION], [
  The system provides reliable message delivery...
], color: palette.phosphor)
```

### `system-line(body, color: palette.phosphor)`
Single line styled like system output (11pt monospace).

```typst
#system-line([STATUS: All systems operational])
```

## Helper Functions

### `build-palette(preset-name)`
Constructs full palette from preset name. Derives: phosphor-bright, phosphor-mid, phosphor-faint, phosphor-ghost, phosphor-dim, screen-glow, surface, surface-border, dim-text, meta-color.

## Preset Dictionary

| Preset | Background | Phosphor | Dim | Glow Tint | Best For |
|--------|-----------|----------|-----|-----------|----------|
| `green` | `#0D1117` | `#00FF41` | `#004D00` | `#00FF41` | Classic VT100, hacker |
| `amber` | `#0D1117` | `#FFB000` | `#4D3600` | `#FFB000` | Warm retro, IBM |
| `blue` | `#0A0E1A` | `#00BFFF` | `#003355` | `#00BFFF` | IBM blue, cybersecurity |

## Demo

See `demo.typ` for a complete demonstration covering system architecture, network monitoring, and security topics.

## File Structure

```
retro-terminal/
  template.typ   -- Theme definition (presets, components, slides)
  demo.typ       -- Full demonstration presentation
```
