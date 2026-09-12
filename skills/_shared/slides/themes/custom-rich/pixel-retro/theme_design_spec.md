# Pixel Retro Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | pixel-retro |
| **Best For** | Gaming, creative tech, informal presentations |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |

A retro gaming, neon cyberpunk presentation theme with 8-bit pixel aesthetics, dark backgrounds, and neon glow effects. Built for Touying 0.7.4.

## Preview

**Style:** Retro gaming / Neon cyberpunk / 8-bit geek tech
**Complexity:** Rich
**Best For:** Tech talks, programming tutorials, game introductions, geek-style content

## Color Palette

| Token | Hex | Usage |
|---|---|---|
| `palette.black` | `#0D1117` | Deep Space Black — primary background |
| `palette.dark` | `#161B22` | Starry Night Blue — card backgrounds |
| `palette.green` | `#39FF14` | Neon Green — primary accent, titles, borders |
| `palette.pink` | `#FF2E97` | Cyber Pink — secondary accent, warnings |
| `palette.blue` | `#00D4FF` | Electric Blue — tertiary accent, info |
| `palette.gold` | `#FFD700` | Gold Yellow — highlights, achievements |
| `palette.text-white` | `#E6EDF3` | Body text on dark backgrounds |
| `palette.text-gray` | `#8B949E` | Muted / secondary text |
| `palette.border` | `#30363D` | Card & element borders |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.green` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `palette.text-white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.black` | Dark text on light backgrounds |

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("DejaVu Sans Mono", "Noto Sans SC"))

#show: pixel-retro-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [My Awesome Talk],
    subtitle: [A Neon Journey],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Org],
  ),
)

#title-slide()

= First Section

== Slide Title

Content goes here.

#ending-slide[GAME OVER]
```

## Theme Entry Point

```typst
#let pixel-retro-theme(
  aspect-ratio: "16-9",   // "16-9" or "4-3"
  align: horizon,          // Default vertical alignment
  footer: none,            // Footer content (can be a function: self => ...)
  ..args,                  // Additional Touying config
  body,
)
```

## Slide Functions

### `title-slide(..args)`

Full-screen title slide with "PRESS START" label, neon green title, pixel corner decorations, and scanline overlay. Pulls title, subtitle, author, date, institution from `config-info`.

```typst
#title-slide()
```

### `slide(title: auto, align: auto, ..args)`

Standard content slide with neon green top border (double line), monospace title with `> ` prompt prefix, and footer with pixel dots and page number.

```typst
== My Slide Title

Content here. The title is auto-detected from the heading.

// Or with explicit title:
#slide(title: [Custom Title])[
  Content here.
]
```

### `new-section-slide(self: none, body)`

Auto-generated section divider. Triggered by `= Section Name` headings. Dark background with large neon green section title, pixel bar decorations, and corner accents.

### `focus-slide(body)`

Full-screen emphasis slide for key quotes or statements. Neon green monospace text centered on dark background with subtle decorations.

```typst
#focus-slide[
  "Ship fast, fix faster."
]
```

### `ending-slide(body)`

Closing slide with "GAME SAVED" label, gold-colored title, pixel corner decorations, and "CONTINUE? [Y/N]" prompt.

```typst
#ending-slide[GAME OVER]
```

## Reusable Components

### `terminal-box(title, body)`

Terminal/console style box with colored title bar (pink/gold/green dots), green left border, and monospace text. Perfect for code snippets or command-line content.

```typst
#terminal-box(title: [bash])[
  \$ cargo build --release \
  Compiling my-project v0.1.0 \
  Finished release target in 42s
]
```

### `pixel-card(number, title, description, accent: auto)`

Numbered card with pixel-block badge and neon top border. Colors auto-cycle through green, pink, blue, gold based on the number.

```typst
#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.8em,
  pixel-card(1, [Feature A], [Description of feature A.]),
  pixel-card(2, [Feature B], [Description of feature B.]),
)
```

### `stat-bar(label, value, max: 100, color: palette.green)`

Progress bar visualization resembling an RPG HP/XP bar. Shows label, numeric value, and filled bar.

```typst
#stat-bar([Performance], 92, max: 100, color: palette.green)
#stat-bar([Memory Usage], 45, max: 100, color: palette.blue)
```

### `badge(text-content, color: palette.green)`

Small inline colored tag/badge with border and transparent fill.

```typst
#badge([v2.0]) #badge([BETA], color: palette.pink) #badge([HOT], color: palette.gold)
```

### `level-card(level, title, items)`

RPG-style level card with colored header bar showing "LVL N". Colors auto-cycle based on level number.

```typst
#level-card(1, [Beginner], [
  - Learn the basics
  - Complete tutorial
  - Build first project
])
```

### `neon-box(title, body, color: palette.green)`

Callout/alert box with neon-colored left border and transparent fill. Good for tips, warnings, and highlights.

```typst
#neon-box([Pro Tip], color: palette.gold)[
  Always profile before optimizing.
]
```

## Helper Functions

### `neon-line(color: palette.green, width: 100%)`

Decorative neon-colored horizontal line (2pt height).

### `pixel-dots(count, color: palette.green, size: 4pt, gap: 6pt)`

Row of small square pixel dots. Used in footers and decorative elements.

### `pixel-corner(color: palette.green, size: 4pt)`

L-shaped pixel block corner decoration (3x3 grid with fade).

### `neon-color(index)`

Returns neon color by index, cycling through: green, pink, blue, gold.

## Fonts

Fonts are **not** set in `template.typ`. Set your preferred fonts in `main.typ` (or `demo.typ`) via `#set text(font: ...)` before the `#show: pixel-retro-theme.with(...)` call. The demo uses `("DejaVu Sans Mono", "Noto Sans SC")`, a checked local stack that preserves the terminal aesthetic without fallback warnings.

## Layout Tips

1. Use `#grid()` with `column-gutter` for multi-column card layouts
2. Use `#cols()` for two-column content splits
3. Combine `terminal-box` with `pixel-card` or `neon-box` for varied layouts
4. Use `stat-bar` in grids for dashboard-style data visualization
5. Sprinkle `badge()` inline for tagging and categorization

## File Structure

```
pixel-retro/
  template.typ    — Theme definition (colors, slides, components)
  demo.typ        — Full demo presentation (14-18 slides)
  README.md       — This documentation
  output/         — Compiled slide images (PNG)
```

## Compilation

```bash
cd pixel-retro
mkdir -p output
python3 -c "
import typst
pages = typst.compile('demo.typ', format='png', ppi=144)
for i, p in enumerate(pages):
    open(f'output/slide_{str(i+1).zfill(2)}.png', 'wb').write(p)
"
```

## Compatibility

- **Touying:** 0.7.4
- **Typst:** Latest stable
- **Aspect Ratios:** 16:9 (default), 4:3
