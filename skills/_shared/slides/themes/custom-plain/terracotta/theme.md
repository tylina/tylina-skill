# Terracotta Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `terracotta-theme`
**Style**: Mediterranean warm earth tones
**Primary color**: `#BF5B21` (burnt orange)
**Best For**: Travel, culture, food, architecture, interior design
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A warm, inviting theme inspired by Mediterranean terracotta pottery and architecture. Features burnt orange, clay, olive green, and sandy tones. Perfect for travel, culture, food, architecture, and interior design presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: terracotta-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Available Slide Types

### `#title-slide()`
Warm cover with decorative circles, centered title in deep terracotta, and accent line.

### `#slide(title: auto)`
Content slide with an open section/title stack, short two-tone terracotta rule, and balanced three-part footer. Usually created with `== Slide Title` rather than called directly.

### `#new-section-slide[...]`
Section divider with terracotta accent lines.

### `#focus-slide[...]`
Deep terracotta background with sandy text.

### `#ending-slide[...]`
Terracotta background with cream text.

## Reusable Components

### `#clay-card(title, body, accent: none)`
Card with an optionally accented top border, sandy background, and contrast-safe deep-terracotta title.

### `#olive-tag(label)`
Inline contrast-safe olive-green rounded tag/badge.

### Multi-column layout

Use Touying's universal `cols` helper; this theme does not add a generic column wrapper.

```typst
#cols(columns: (2fr, 1fr))[Left content][Right content]
```

### `#arch-divider()`
Decorative divider with centered circle motif.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#BF5B21` | `palette.primary` | Bright decorative terracotta, accent lines, arch-divider dot |
| **Secondary** | `#D4845A` | `palette.secondary` | Clay pink decorative circles |
| **Accent** | `#6B7F3B` | `palette.accent` | Decorative olive green circles |
| **Accent Deep** | `#5D7132` | `palette.accent-deep` | Contrast-safe olive tag background |
| **Background** | `#FDF6ED` | `palette.bg` | Warm cream slide background, ending slide text |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | White card fill |
| **Deep** | `#8B3A0F` | `palette.deep` | Accessible terracotta text, title text, focus background, Touying primary mapping |
| **Text Dark** | `#3B2316` | `palette.text-dark` | Dark brown primary text |
| **Text Light** | `#795548` | `palette.text-light` | Contrast-safe warm brown secondary text, footer |
| **Sand** | `#E8D5B7` | `palette.sand` | Sandy tone, card backgrounds, arch divider lines, focus slide text |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.deep,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.text-dark,
)
```

## Files

- `template.typ` — Theme definition
- `demo.typ` — Usage example (compilable)
