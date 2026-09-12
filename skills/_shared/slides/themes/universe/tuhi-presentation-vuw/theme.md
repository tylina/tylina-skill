# Tuhi Presentation VUW

**Type**: Institutional Theme
**Package**: `@preview/tuhi-presentation-vuw:0.1.0`
**Touying version**: 0.6.1 (package-internal dependency)
**Entry function**: `tuhi-vuw-theme`
**Style**: Institutional, New Zealand, Academic, Research
**Primary color**: VUW Green (`rgb(113, 135, 121)`)
**Secondary color**: VUW Magenta (`rgb(204, 16, 102)`)
**Tertiary color**: VUW Orange (`rgb(255, 178, 77)`)
**Institution**: Te Herenga Waka — Victoria University of Wellington (VUW)
**Best For**: Academic lectures, university seminars, research presentations at VUW
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/tuhi-presentation-vuw).

## Description

A presentation theme with tailored aesthetics for **Te Herenga Waka — Victoria University of Wellington** (VUW), New Zealand. "Tuhi" means "to write" or "to draw" in te reo Māori. The theme features VUW's green, magenta, and orange colour palette, four focus slide style variants, a dedicated image slide type for photographic backgrounds, customisable headers and footers with a progress bar, four theorion-backed content boxes, and the package's native multi-column composer. Its default Fira font stack is not bundled; install those fonts or pass locally available alternatives. The theme supports configurable aspect ratios.

## Quick Start

```typst
#import "@preview/tuhi-presentation-vuw:0.1.0": *

#show: tuhi-vuw-theme.with(
  // Use fonts installed on your compilation system.
  font: ("Helvetica Neue", "Arial"),
  math-font: ("New Computer Modern Math",),
  mono-font: "Menlo",
  code-font: "Menlo",
  config-info(
    title: [Seismology of the Hikurangi Subduction Zone],
    subtitle: [Part 1: Slow-Slip Events],
    author: [Dr. Aroha Williams],
    date: datetime.today(),
    institution: smallcaps[phys301: geophysics seminar],
  ),
  config-common(
    datetime-format: "[day] [month repr:long] [year]",
    breakable: false,
  ),
)

// The package defaults to justified paragraphs; opt out when it harms spacing.
#set par(justify: false)

#title-slide()

= Background

== Tectonic Setting

The Hikurangi subduction zone extends along the east coast
of the North Island of New Zealand.

#focus-slide[Key question: What triggers slow-slip events?]
```

The Universe package owns and re-exports its Touying 0.6.1 dependency. Import the package alone; do not add a separate Touying import or force Touying 0.7.4 around package version 0.1.0.

## Theme Parameters

### `tuhi-vuw-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `lang` | `string` | `"en"` | Document language |
| `aspect-ratio` | `string` | `"4-3"` | Slide aspect ratio |
| `align` | `alignment` | `horizon` | Default content alignment |
| `base-size` | `length` | `22pt` | Base font size |
| `font` | `tuple` | `("Fira Sans",)` | Main font family |
| `math-font` | `tuple` | `("Fira Math", "Garamond-Math", "New Computer Modern Math")` | Math font stack |
| `math-scale` | `number` | `1` | Math text scale factor |
| `mono-font` | `string` | `"Fira Mono"` | Monospace font for links |
| `code-font` | `string` | `"Fira Code"` | Code/raw text font |
| `mode` | `string` | `"light"` | Accepted by package 0.1.0 but currently unused |
| `header` | `content/function` | current heading | Slide header content |
| `header-right` | `content/function` | `self => self.info.logo` | Right header (logo) |
| `footer` | `content/function` | `none` | Footer content |
| `footer-right` | `content/function` | slide counter | Right footer (page number) |
| `footer-progress` | `bool` | `true` | Show progress bar in footer |

### `config-info` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `content` | Presentation title |
| `subtitle` | `content` | Subtitle |
| `author` | `content` | Author name(s) |
| `date` | `datetime` | Presentation date |
| `institution` | `content` | Course code, department, or affiliation |
| `logo` | `content` | Logo image for header-right |

## Available Slide Types

### `#title-slide(extra: none, ..args)`

The title/cover slide with the title (1.4em medium weight), subtitle, author, date, institution, and optional extra content. When `config-info.logo` is provided, it appears at 2em on the right; the package does not bundle a VUW logo. A secondary-coloured separator line divides the title from metadata. The slide counter is frozen.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `extra` | `content` | `none` | Extra information below standard fields |

### `= Section Heading` (Section Slide)

Level-1 headings (`=`) create **section transition slides** with the section title in primary colour, a progress bar (secondary-dark over primary-light), and body text in neutral at 0.8em. Numbered headings are supported.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides** with a branded header (neutral-light fill, primary-coloured title in small caps, primary-darker bottom stroke) and footer with optional progress bar. Content text fills in neutral-darkest.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `auto/content` | `auto` | Slide title |
| `align` | `alignment` | `auto` | Content alignment override |
| `composer` | `function/array` | `auto` | Layout composer (e.g., `(1fr, 1fr)` for two columns) |

### `=== Sub-heading` (Level-3 Heading)

Level-3 headings create **sub-headings** within content slides, rendered in primary-darker colour at medium weight.

### `#focus-slide(style: "w")[content]`

An emphasis slide with centred text at 1.8em semibold. Four style variants are available:

| Style | Fill | Text Colour |
|-------|------|-------------|
| `"w"` (default) | White | Neutral grey |
| `"primary"` | Light green | VUW Green |
| `"secondary"` | Light pink | VUW Magenta |
| `"tertiary"` | Light orange | VUW Orange (darker) |

The slide counter is frozen on focus slides. In package version 0.1.0, the default primary and tertiary text/background pairs measure about 2.88:1 and 2.33:1, below the 3:1 large-text threshold. Override them with darker exported palette tokens:

```typst
#focus-slide(style: "primary")[
  #text(fill: tuhi-palette.primary-darker)[Questions and Discussion]
]

#focus-slide(style: "tertiary")[
  #text(fill: tuhi-palette.tertiary-darkest)[Monitor the margin]
]
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `style` | `string` | `"w"` | Style variant |
| `align` | `alignment` | `horizon + center` | Content alignment |

### `#image-slide(background: none)[content]`

A full-bleed image slide for photographic backgrounds. Text is rendered in white at 2em. Images fill 100% width. Ideal for scenic or dramatic visual slides.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `background` | `content` | `none` | Page background (typically `image(...)`) |

### `#slide(composer: ..., align: ...)[...][...]`

Explicit slide function supporting multi-column layouts via the `composer` parameter:

```typst
#slide(composer: (1fr, 1fr), align: top)[
  Left column content
][
  Right column content
]
```

This `slide(composer:)` form is the package's documented native API and is an intentional package-boundary exception to the usual SeaSlides `#cols[...]` preference.

## Color Scheme

The theme uses a comprehensive four-tone palette inspired by VUW:

### Primary (Greens — VUW identity)
| Name | RGB | Usage |
|------|-----|-------|
| `primary-darkest` | `rgb(0, 70, 0)` | Deep green accent |
| `primary-darker` | `rgb(0, 91, 0)` | Sub-heading colour, header stroke |
| `primary` | `rgb(113, 135, 121)` | Main headings, progress bar |
| `primary-lighter` | `rgb(205, 229, 204)` | Focus slide (primary style) fill |

### Secondary (Magentas — accent)
| Name | RGB | Usage |
|------|-----|-------|
| `secondary-dark` | `rgb(173, 7, 85)` | Section progress bar |
| `secondary` | `rgb(204, 16, 102)` | Title separator, alert text |
| `secondary-lighter` | `rgb(255, 179, 211)` | Focus slide (secondary style) fill |

### Tertiary (Oranges — accent)
| Name | RGB | Usage |
|------|-----|-------|
| `tertiary-darker` | `rgb(255, 122, 0)` | Focus slide (tertiary style) text |
| `tertiary-darkest` | `rgb(205, 92, 0)` | Contrast-safe tertiary focus text |
| `tertiary` | `rgb(255, 178, 77)` | Warm accent |
| `tertiary-lightest` | `rgb(255, 240, 215)` | Focus slide (tertiary style) fill |

### Neutrals (Greys)
| Name | RGB | Usage |
|------|-----|-------|
| `neutral-darkest` | `rgb(29, 27, 28)` | Body text |
| `neutral-light` | `rgb(230, 230, 230)` | Header background |
| `neutral-lighter` | `rgb(245, 245, 245)` | Default page fill |
| `neutral-lightest` | `rgb(255, 255, 255)` | White background |

## Themed Content Boxes

The theme integrates with theorion to provide exactly these four styled content boxes:

| Function | Purpose | Style |
|----------|---------|-------|
| `#theorem-box(title: [...])[...]` | Mathematical theorems | Formal |
| `#definition-box(title: [...])[...]` | Definitions | Informational |
| `#warning-box(title: [...])[...]` | Warnings/caveats | Cautionary |
| `#neutral-box(title: [...])[...]` | General content | Neutral |

The warning title defaults to white on bright orange, which is low contrast. Use the exported neutral token for warning titles when accessibility matters:

```typst
#warning-box(title: [#text(fill: tuhi-palette.neutral-darkest)[Hazard Implication]])[
  Warning content
]
```

## Branding Features

- **VUW colours**: Green, magenta, and orange palette reflecting Victoria University's identity
- **Configurable typography**: Fira Sans/Fira Math defaults, with demo-level overrides for installed fonts
- **Progress bar**: Primary-coloured progress indicator in footer
- **Small caps headers**: Slide titles rendered in small caps for an elegant look
- **Image slides**: Full-bleed background images for visual impact
- **Four focus styles**: Flexible emphasis slides matching each palette tone
- **Speaker notes**: `#speaker-note[...]` for presenter mode

## Animation and Utilities

- `#pause` — Incremental reveal of content
- `#meanwhile` — Synchronous content on parallel sub-slides
- `#speaker-note[...]` — Speaker notes for presenter mode
- `#alert[text]` — Highlighted text in secondary colour
- `---` — Touying slide break within a section; it is not a horizontal rule

## Universe Link

[tuhi-presentation-vuw on Typst Universe](https://typst.app/universe/package/tuhi-presentation-vuw)
