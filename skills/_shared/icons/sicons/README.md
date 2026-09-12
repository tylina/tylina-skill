# Sicons — Simple Icons (Brand SVGs)

**Package**: `@preview/sicons:16.0.0`
**Icon count**: 3000+ brand icons
**Source**: [Simple Icons](https://simpleicons.org)

## Description

High quality SVG icons for popular brands. Uses a WASM plugin (~5 MB) to render icons.

## Usage

```typst
#import "@preview/sicons:16.0.0": *

#sicon(slug: "typst")                         // SVG icon
#sicon(slug: "github", size: 2em)             // custom size
#sicon(slug: "python", icon-color: "#3776AB") // custom color
#sicon(slug: "python", icon-color: "default") // official brand color
#stitle(slug: "github")                       // brand name text only
#sicon-label(slug: "github")                  // icon + brand name together
#sicon-raw(slug: "github")                    // raw SVG content
```

## API Reference

### `sicon(slug:, size:, icon-color:)`

Renders the brand icon as an SVG image.

- `slug` — The Simple Icons slug identifier (required)
- `size` — Icon size (default: `1em`)
- `icon-color` — Fill color for the icon. Use `"default"` to apply the official brand color.

### `stitle(slug:, size:, text-color:)`

Renders the brand name as text only (no icon).

- `slug` — The Simple Icons slug identifier (required)
- `size` — Text size (default: `1em`)
- `text-color` — Color for the brand name text

### `sicon-label(slug:, size:, icon-color:, text-color:)`

Renders the icon and brand name together as a combined label.

- `slug` — The Simple Icons slug identifier (required)
- `size` — Size for both icon and text (default: `1em`)
- `icon-color` — Fill color for the icon. Use `"default"` for official brand color.
- `text-color` — Color for the brand name text

### `sicon-raw(slug:)`

Returns the raw SVG content string for custom embedding and manual manipulation.

- `slug` — The Simple Icons slug identifier (required)

## Parameters Table

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `slug` | `str` | (required) | Simple Icons slug identifier (e.g., `"github"`, `"python"`) |
| `size` | `length` | `1em` | Size of the icon or text |
| `icon-color` | `color`/`str` | black | Fill color; `"default"` uses official brand color |
| `text-color` | `color`/`str` | black | Color for brand name text |

## Inline Usage

For inline usage within text paragraphs, wrap in `#box(baseline: .1em, ...)` for proper vertical alignment:

```typst
Built with #box(baseline: .1em, sicon(slug: "typst", size: 1em)) Typst.
```

## Popular Icons (slug names)

### Tech & Programming
`typst`, `python`, `rust`, `javascript`, `typescript`, `go`, `java`, `cplusplus`, `swift`, `kotlin`, `ruby`, `php`, `r`, `julia`, `haskell`, `lua`, `dart`, `elixir`

### Platforms & Services
`github`, `gitlab`, `docker`, `kubernetes`, `linux`, `windows`, `apple`, `android`, `amazonaws`, `googlecloud`, `microsoftazure`

### Web & Frameworks
`react`, `vuedotjs`, `angular`, `svelte`, `nextdotjs`, `nuxtdotjs`, `django`, `flask`, `fastapi`, `express`, `nodedotjs`

### Data & AI
`tensorflow`, `pytorch`, `numpy`, `pandas`, `jupyter`, `openai`, `huggingface`

### Social
`twitter`, `linkedin`, `mastodon`, `discord`, `slack`, `telegram`, `wechat`

Browse all: https://simpleicons.org
