# Darkroom Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: _sans-font, size: 20pt)

#show: darkroom-theme.with(
  aspect-ratio: "16-9",
  footer: [Studio Name],
  preset: "safelight",
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
  config-common(breakable: false),
)

#title-slide()

= Section Title
== Slide Title
Content here...

#focus-slide[Key statement here]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Default | Options | Description |
|-----------|---------|---------|-------------|
| `aspect-ratio` | `"16-9"` | `"16-9"`, `"4-3"` | Page aspect ratio |
| `footer` | `none` | Content | Footer text (shown in standard slides) |
| `preset` | `"safelight"` | `"safelight"`, `"developer"`, `"print"` | Color preset |

## Presets

| Preset | Character | Best For |
|--------|-----------|----------|
| `safelight` | Default red-lit darkroom | Most presentations |
| `developer` | Deeper, more subdued | Evening/dim presentations |
| `print` | Inverted (light bg) | Light environments, print |

## Palette Access

`palette` is the default `safelight` dictionary. For one-off Canvas styling with
another preset, build the matching dictionary; reusable components follow the
theme's active preset automatically.

```typst
#let pal = build-palette("print")

palette.bg          // Background color
palette.ink         // Primary text color
palette.accent      // Decorative safelight red
palette.accent-text // Text-safe red for small labels
palette.secondary   // Decorative sepia/chemical brown
palette.secondary-text // Text-safe sepia for small labels
palette.surface     // Darker surface
palette.ink-dim     // Dimmed text
palette.ink-muted   // Muted text
palette.ink-faint   // Very faint text
palette.accent-muted // Muted red
palette.meta-color  // Footer/metadata color
```

## Slide Types

| Function | Trigger | Purpose |
|----------|---------|---------|
| `title-slide()` | Manual call | Cover slide with film strips + aperture |
| `new-section-slide` | `= Heading` | Section divider with aperture number |
| `slide` | `== Heading` | Standard content slide |
| `dark-slide` | Manual call | Deeper dark, emphasis slide |
| `focus-slide` | Manual call | Single statement, serif italic |
| `ending-slide` | Manual call | Farewell with clothesline |

### dark-slide Parameters

```typst
#dark-slide(title: [Custom Title], header-left: [LEFT], header-right: [RIGHT])[
  Content...
]
```

`title` is rendered as the dark-slide heading; the left/right values remain
small metadata above it.

## Reusable Components

### exposure-card(title, body)
White card on dark background — like a photo emerging from developer.
```typst
#exposure-card([Card Title])[Card content here.]
```

### f-stop-stat(label, value, description: none)
Large number display like camera settings.
```typst
#f-stop-stat([ISO SETTING], [400], description: [Standard daylight])
```

### film-divider(total-width: 100%)
Horizontal rule with sprocket hole circles.
```typst
#film-divider()
```

### developer-tag(body)
Small red accent label.
```typst
#developer-tag[PROCESSED]
```

### proof-quote(body, cite: none)
Quote with red left border, serif italic.
```typst
#proof-quote([The decisive moment...], cite: "Cartier-Bresson")
```

### negative-panel(title: none, body)
Inverted panel — light background within dark theme.
```typst
#negative-panel(title: [Key Points])[
  - Point one
  - Point two
]
```

### contact-card(label, body)
Small card like a contact sheet frame.
```typst
#contact-card([FR-01])[Brief content in a thumbnail-sized card.]
```

### chemical-table(headers, ..rows)
Data table styled like a darkroom processing log.
```typst
#chemical-table(
  ([Column A], [Column B], [Column C]),
  ([Data 1], [Data 2], [Data 3]),
  ([Data 4], [Data 5], [Data 6]),
)
```

### tray-card(title, body, accent: auto)
Card styled like a chemical processing tray.
```typst
#tray-card([Step Name], [Description of this processing step.])
#tray-card([Alt Step], [With custom color.], accent: palette.secondary)
```

### developer-formula(name, body, time, accent: auto)
Compact developer formula with a semantic name, description, and timer badge.
```typst
#developer-formula(
  [D-76],
  [Fine grain, full emulsion speed.],
  [8:30 \@ 20C],
)
```

### darkroom-note(body)
Small italic annotation in sepia.
```typst
#darkroom-note[Technical observation about the process.]
```

### exposure-strip(labels: ())
Progressive tonal gradient strip.
```typst
#exposure-strip(labels: ([2s], [4s], [8s], [16s], [32s]))
```

### timer-badge(time-str)
Small badge showing processing time.
```typst
#timer-badge[8:30 \@ 20C]
```

## SVG Decorators

| Function | Parameters | Usage |
|----------|-----------|-------|
| `filmstrip-decoration` | `color`, `width`, `height` | Perforated film border |
| `contactsheet-grid` | `color`, `width`, `height` | Faint photo grid |
| `developer-drip` | `color`, `width`, `height` | Chemical drip shape |
| `aperture-icon` | `color`, `size` | Hexagonal iris |
| `clothespin-icon` | `color`, `width`, `height` | Clip for drying line |
| `safelight-dot` | `color`, `size` | Small red dot |
| `safelight-glow` | `color`, `size` | Layered glow circles |

Decorator color arguments default to `auto`, which resolves from the active
preset. Pass an explicit palette token only for a deliberate variant.

## Color Scheme

- **60%**: Deep red-black background (`#1A0A0A`)
- **30%**: Warm cream text (`#F0E8E0`)
- **10%**: Safelight red accent (`#CC2200`) + sepia secondary (`#A67B5B`)

## Typography Guidance

- Base stack: `("Avenir Next", "Arial Unicode MS")`
- Artistic serif stack: `("Iowan Old Style", "Arial Unicode MS")`
- Technical labels: `"IBM Plex Mono"`
- Keep the base font in the demo/project entry; the reusable theme entry is font-agnostic
- Inverse weight: large display text is bold, but keep headings at "medium"
