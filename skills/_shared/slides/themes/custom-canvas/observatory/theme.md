# Observatory Theme

A Touying 0.7.4 canvas-level presentation theme inspired by telescope domes and astronomical observatory instruments.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "Avenir Next", size: 18pt)

#show: observatory-theme.with(
  aspect-ratio: "16-9",
  preset: "twilight",
  footer: self => self.info.institution,
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle Here],
    author: [Author Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content here.

#ending-slide[Thank You]
```

## Entry Function

`observatory-theme(aspect-ratio, align, footer, preset, ..args, body)`

- `aspect-ratio`: "16-9" (default) or "4-3"
- `align`: default content alignment (`horizon` by default)
- `preset`: "twilight" (default), "midnight", or "dawn"
- `footer`: Footer content or function

## Slide Types

- `title-slide()` -- Opening slide with dome silhouette
- `new-section-slide` -- Auto-generated section dividers (use `= Heading`)
- `slide(title: auto)` -- Standard content slide
- `dark-slide(title, header-left, header-right)` -- Dark variant for rhythm
- `focus-slide[content]` -- Centered statement slide
- `ending-slide[content]` -- Closing slide with dome silhouette

## Components

- `dome-card(title, body, colors)` -- Card with crosshair corner marks and a terminal lazy-layout spacer.
- `eyepiece-stat(label, value, description, colors)` -- Centered reticle → value → label statistic
- `tracking-box(body, colors)` -- Content with tracking arc overlay
- `reticle-divider(total-width, colors)` -- Decorative horizontal divider
- `zenith-tag(body, colors)` -- Instrument readout tag
- `aperture-highlight(body, colors)` -- Copper-bordered highlight block
- `logbook-note(timestamp, body, observer, colors)` -- Observation log entry
- `azimuth-grid(align, headers, colors, ..rows)` -- Native data table; each row must match the header count
- `finder-badge(body, colors)` -- Small badge chip

All component `colors` parameters default to the twilight palette for backward compatibility. With another preset, build the matching palette once and pass it to components:

```typst
#let pal = build-palette("midnight")
#show: observatory-theme.with(preset: "midnight")

#eyepiece-stat([EXPOSURE], [120 s], colors: pal)
```

## Palette Access

```typst
#let pal = build-palette("twilight")
// pal.bg, pal.primary, pal.accent, pal.accent-text, pal.secondary, pal.text, pal.card
// pal.primary-dim, pal.accent-muted, pal.text-faint, etc.
```

## Presets

| Preset | Feel |
|--------|------|
| twilight | Light sky-blue background, copper accents (default) |
| midnight | Dark observatory blue, warm copper on deep navy |
| dawn | Warm parchment, earthy copper tones |
