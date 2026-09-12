# Vermillion

A warm terracotta/vermillion professional theme for Touying 0.7.4. Mediterranean architecture meets modern business — sunbaked clay, warm white spaces, rounded organic shapes.

## Usage

```typst
#import "template.typ": *

#show: vermillion-theme.with(
  config-info(
    title: [Your Title],
    subtitle: [Your Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime.today(),
  ),
  config-common(breakable: false),
  footer: [Footer Text],
)

#set text(font: ("IBM Plex Sans", "Heiti SC"))
#show raw: set text(font: "IBM Plex Mono")

#title-slide()

= Section Title

== Slide Title

Content here...

#focus-slide[Key message]

#ending-slide[Thank You]
```

## Entry Function

`vermillion-theme` — accepts `aspect-ratio`, `align`, `footer`, and Touying config arguments. It intentionally leaves font selection to the deck entry.

## Slide Types

| Function | Purpose |
|----------|---------|
| `slide(title: auto)` | Standard content slide |
| `title-slide()` | Opening title card |
| `new-section-slide` | Section divider (auto-triggered by `= Heading`) |
| `focus-slide[...]` | Bold statement on vermillion background |
| `ending-slide[...]` | Closing card mirroring title |

## Components

| Component | Signature | Description |
|-----------|-----------|-------------|
| `kiln-card` | `(title, body, accent: palette.primary)` | Cream card with rounded top accent |
| `hearth-stat` | `(label, value, color: palette.primary)` | Centered value-over-label stat display |
| `clay-box` | `(title, body, accent: palette.primary)` | Left-bar box with sand fill |
| `terrace-divider` | `(color: palette.primary, width: 60%)` | Centered wavy separator |
| `ember-tag` | `(content, color: palette.primary)` | Inline pill badge |
| `foundry-highlight` | `(title, body)` | Featured block with warm gradient |

Standard Typst lists (`- item`) receive the theme's warm circular markers globally; there is no custom list wrapper.

## Palette Access

Import and use palette colors directly:

```typst
#import "template.typ": palette
#text(fill: palette.primary-text)[Accessible vermillion text]
```

Use `palette.primary` for decoration and large display accents. Use `palette.primary-text` for small text on light surfaces.

## Best Suited For

- Marketing presentations
- Creative agency pitches
- Lifestyle brand storytelling
- Design portfolio reviews
- Warm professional business decks
