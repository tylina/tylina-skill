# Touying Unistra Pristine

**Type**: Universe (Typst package)
**Package**: `@preview/touying-unistra-pristine:1.4.3`
**Touying version**: 0.6.2
**Minimum Typst version**: 0.14.2
**Entry function**: `unistra-theme`
**Style**: Academic, institutional, clean
**Primary colors**: University of Strasbourg palette (80+ swatches, 18 named color themes)
**Author**: Enzo Doyen (spidersouris)
**License**: MIT
**Best For**: University of Strasbourg
**Style Objective**: Academic
**Complexity Level**: Plain

## Description

Touying Unistra Pristine is an academic presentation theme following the visual identity guidelines of the University of Strasbourg, France. Despite its institutional origins, it is designed for general-purpose academic presentations with a rich feature set: focus slides with 18 predefined color themes, hero slides for image-text layouts, gallery slides for image grids, two icon font families (Unistra Symbol and Nova Icons), automatic link-type icons via regex matching, enhanced academic citation functions (`pcite`, `mcite`), language-specific CSL bibliography styles, customizable headers/footers, French-style quote formatting, and a comprehensive 80+ color palette organized into 16 color groups with 5 variants each.

The theme is unofficial and not affiliated with the University of Strasbourg. The "Unistra A" font is restricted to university members. The default stack also names Segoe UI and Roboto, but Typst can only use fonts installed on the compiling system; choose an installed family for portable builds.

## Quick Start

```typst
#import "@preview/touying:0.6.2": *
#import "@preview/touying-unistra-pristine:1.4.3": *

#show: unistra-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [My Presentation Title],
    short-title: [My Presentation],
    subtitle: [_A descriptive subtitle_],
    author: [Author Name],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
  ),
  config-store(
    font: ("Arial",),
    link-icons: (),
    link-icons-fa: false,
  ),
)

#title-slide[]

= First Section

== First Slide

Your content here with *bold* and _emphasis_.

#focus-slide(theme: "berry")[Thank you!]
```

## Theme Parameters (`unistra-theme`)

The entry function `unistra-theme` accepts the following top-level parameters plus `config-info(...)` and `config-store(...)` blocks:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (e.g. `"16-9"`, `"4-3"`) |

### `config-info` Fields

Metadata passed to `config-info(...)`:

| Field | Type | Default | Description |
|---|---|---|---|
| `title` | content | `none` | Presentation title |
| `short-title` | content | `auto` | Compact footer title; set this when the full title would wrap |
| `subtitle` | content | `none` | Presentation subtitle |
| `author` | content | `none` | Author name(s) |
| `date` | content | `none` | Date string or formatted datetime |
| `logo` | content | `none` | Logo content for the footer (e.g. `image("logo.svg")` or styled text) |

### `config-store` Parameters

All theme-specific settings are passed inside `config-store(...)`:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `show-header` | bool | `false` | Whether to show the navigation header bar |
| `show-footer` | bool | `true` | Whether to show the footer |
| `footer-first-sep` | string | `" \| "` | First separator in the footer |
| `footer-second-sep` | string | `" \| "` | Second separator in the footer |
| `footer-hide` | array | `()` | Footer elements to hide; accepts `"author"` and/or `"date"` |
| `footer-appendix-label` | string | `"A-"` | Label prefix for slide numbers in the appendix |
| `font` | string or array | `("Unistra A", "Segoe UI", "Roboto")` | Font stack with fallback chain |
| `quotes` | dictionary | `(left: "« ", right: " »", outset: 0.5em, margin-top: 0em)` | Custom quote block styling with keys `left`, `right`, `outset`, `margin-top` |
| `link-icons` | dictionary | *(see Link Icons section)* | Mapping of link labels to `(regex, icon-content)` pairs |
| `link-icons-fa` | bool | `true` | Whether to include Font Awesome-based link icons (e.g. GitHub) |

Example with full configuration:

```typst
#show: unistra-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Research Results],
    subtitle: [_Conference 2025_],
    author: [Jane Doe & John Smith],
    date: [June 2025],
    logo: text("ACL 2025", size: 0.8em, font: "Arial", weight: "bold"),
  ),
  config-store(
    show-header: false,
    show-footer: true,
    footer-hide: ("author",),
    font: ("Arial",),
    quotes: (left: "'", right: "'"),
    link-icons: (),
    link-icons-fa: false,
  ),
)
```

## Available Slide Types

### Title Slide — `#title-slide()`

Creates the presentation cover page with title, subtitle, author, date, and optional logos.

```typst
#title-slide()

// With a single logo
#title-slide(logo: image("university-logo.svg"))

// With multiple logos
#title-slide(
  logos: (
    image("logo1.png"),
    image("logo2.png", height: 60%),
  ),
)

// Override title/subtitle from config-info
#title-slide(
  title: "Custom Title for This Slide",
  subtitle: "Custom Subtitle",
  hide: ("date",),
)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | string | `""` | Title text; overrides `config-info` title if non-empty |
| `subtitle` | string | `""` | Subtitle text; overrides `config-info` subtitle if non-empty |
| `logo` | content | `""` | Single logo displayed in the upper-left corner |
| `logos` | array | `()` | Multiple logos displayed in a row; cannot be used with `logo` simultaneously |
| `hide` | array | `()` | Elements to hide (e.g. `("date",)`) |

### Content Slide — `== Heading` or standalone `#slide[...]`

Standard content slides are created with level-2 headings. Level-1 headings (`=`) create section dividers. Level-3+ headings (`===`, `====`) create sub-headings within a slide.

```typst
= Section Title

== Slide Title

Content with *bold*, _emphasis_, and `inline code`.

=== Sub-heading

More content under a sub-heading within the same slide.
```

For ordinary columns within an automatic heading slide, use Touying 0.6.2's bundled `components.side-by-side` helper:

```typst
== Comparison

#components.side-by-side(columns: (1fr, 1fr), gutter: 1em)[
  Left column content.
][
  Right column content.
]
```

The theme's `#slide[...][...]` composer is also valid as a standalone explicit slide. Do not place it immediately after a `== Heading`; the heading already opens an automatic slide, so that pattern produces an unintended extra page.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `repeat` | auto | `auto` | Repeat behavior for animations |
| `setting` | function | `body => body` | Wrapper function applied to slide body |
| `composer` | auto | `auto` | Column layout specification (e.g. `(1fr, 2fr)`) |

### Focus Slide — `#focus-slide[...]`

Full-screen emphasis slide with gradient background. Supports 18 predefined color themes, custom colors, optional icons, and a numbered counter.

```typst
// With a predefined theme
#focus-slide(theme: "berry")[Key Takeaway]

// With a portable text icon
#focus-slide(
  theme: "neon",
  icon: [↶],
)[Important Point]

// With a package icon helper (requires the corresponding font file)
#focus-slide(
  c1: black,
  c2: white,
  text-color: yellow.D,
  icon: us-icon("plant"),
)[Custom Colors Slide]

// Control counter and outline visibility
#focus-slide(
  theme: "wine",
  show-counter: false,
  outlined: false,
  text-size: 1.7em,
)[Unnumbered Focus Slide]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `theme` | string or int | `none` | Predefined color theme name or ID (1–18); see Color Themes table |
| `c1` | color | `none` | First gradient color (for custom colors) |
| `c2` | color | `none` | Second gradient color (for custom colors) |
| `text-color` | color | `none` | Text color; auto-derived from theme if not set |
| `text-size` | length | `2em` | Size of the focus text |
| `icon` | content | `none` | Content shown above the text; `us-icon()` and `nv-icon()` require their font files |
| `icon-size` | length | `1.7em` | Size of the icon |
| `counter` | counter | `counter("focus-slide")` | Counter used for numbering focus slide titles |
| `show-counter` | bool | `true` | Whether to display the counter number |
| `outlined` | bool | `true` | Whether heading appears in the document outline |

### Hero Slide — `#hero(...)`

Full-bleed image-text composite slide for impactful visual presentations. Supports flexible layouts with configurable direction, columns, and text overlays.

```typst
// Basic hero with title
#hero(
  image("photo.jpg", width: 100%, height: 60mm, fit: "cover"),
  title: "Hero Title",
  subtitle: "Hero Subtitle",
)

// RTL direction with text overlay and footnote space
#hero(
  image("photo.jpg", width: 100%, height: 60mm, fit: "cover"),
  txt: (
    text: "Description text with " + highlight(fill: yellow.C)[highlighted words],
    enhanced: false,
  ),
  direction: "rtl",
  footnote: true,
)

// Custom column proportions
#hero(
  image("diagram.svg", width: 88%),
  direction: "ltr",
  columns: (1.5fr, 1fr),
  txt: (
    text: [Explanatory content],
    enhanced: false,
  ),
  gap: -3.5em,
)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | string | `none` | Slide title |
| `heading-level` | int | `1` | Heading level of the title |
| `subtitle` | string | `none` | Slide subtitle |
| `caption` | string | `none` | Image caption |
| `bold-caption` | bool | `false` | Whether caption text is bold |
| `numbering` | string | `none` | Figure numbering format |
| `columns` | int / relative / fraction / array | `(1fr, 2fr)` | Grid column specification; package 1.4.3 overrides this with `(2fr, 1fr)` when `direction: "rtl"` |
| `rows` | int / relative / fraction / array | `1fr` | Grid row specification |
| `txt` | dictionary | `(:)` | Text configuration dict with keys: `text` (content), `enhanced` (bool/function), `fill` (color), `align` (alignment) |
| `direction` | string | `"ltr"` | Layout direction: `"ltr"` (left-to-right), `"rtl"` (right-to-left), `"utd"` (up-to-down), `"dtu"` (down-to-up) |
| `gap` | length / auto | `auto` | Gap between image and text |
| `hide-footer` | bool | `true` | Whether to hide the footer on this slide |
| `fill` | color | `none` | Slide fill color (only when footer is hidden) |
| `inset` | length | `-25mm` | Negative inset for full-bleed image |
| `footnote` | bool | `false` | Whether to leave space for a footnote |

The first positional argument is the image content. In package 1.4.3, custom column proportions are reliable with `direction: "ltr"`; the `rtl` branch uses a fixed ratio.

### Gallery Slide — `#gallery(...)`

Grid layout for displaying multiple images with optional captions. Images are passed as positional arguments.

```typst
#gallery(
  image("photo1.jpg", width: 100%, height: 38mm, fit: "cover"),
  image("photo2.jpg", width: 100%, height: 38mm, fit: "cover"),
  image("photo3.jpg", width: 100%, height: 38mm, fit: "cover"),
  image("photo4.jpg", width: 100%, height: 38mm, fit: "cover"),
  title: "Image Gallery",
  columns: 4,
  captions: ("Photo 1", "Photo 2", "Photo 3", "Photo 4"),
)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | string | `none` | Gallery title |
| `heading-level` | int | `2` | Heading level of the title |
| `subtitle` | string | `none` | Gallery subtitle |
| `columns` | int | `auto` | Number of columns in the grid |
| `captions` | array | `()` | List of caption strings, one per image |
| `bold-caption` | bool | `true` | Whether captions are bold |
| `gutter` | length | `0.5em` | Gutter between images |
| `gap` | length | `0.65em` | Gap between image and caption |

Package 1.4.3 declares named `images`, `height`, `width`, and `fit` arguments but does not apply them. Pass images positionally and set `width`, `height`, and `fit` on each `image(...)` call, as in the example above.

### Outline Slide — `#outline-slide()`

Displays a styled table of contents in a rounded block with configurable colors and sizing.

```typst
#outline-slide()

// With a font-independent title icon
#outline-slide(title: [↶ Outline])

// With custom styling
#outline-slide(
  title: "Contents",
  fill: cyan.D,
  content-size: 1em,
)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | string | *(i18n "Outline")* | Slide title |
| `title-size` | length | `1.5em` | Title text size |
| `title-margin` | length | `-0.5em` | Margin between title and content |
| `content-size` | length | `1.2em` | Content text size |
| `fill` | color | `nblue.D` | Fill color of the outline block |
| `outset` | length | `30pt` | Outset of the outline block |
| `height` | ratio | `80%` | Height of the outline block |
| `width` | ratio | `100%` | Width of the outline block |
| `radius` | ratio | `7%` | Border radius of the outline block |

### Appendix Slides

Slides after `#show: appendix` get special numbering with a configurable prefix (default `"A-"`).

```typst
#show: appendix

== Appendix Slide

This slide is numbered as "A-1", "A-2", etc.
```

## Reusable Components

### Icon Functions

The theme provides two icon font families:

| Function | Font | Access | Usage |
|---|---|---|---|
| `us-icon(id)` | Unistra Symbol | Restricted to Univ. of Strasbourg members | `#us-icon("plant")` |
| `nv-icon(id)` | Nova Icons (Font Awesome 4.7-based) | Freely downloadable (.ttf) | `#nv-icon("coins")` |

Icon names omit the font prefix (e.g. `us-icon("plant")` not `us-icon("us-plant")`). Full icon list: https://di.pages.unistra.fr/pictogrammes/

Install the matching font before using either helper. Package 1.4.3 eagerly constructs its default link-icon mapping during theme initialization, so Typst can still report unknown-family warnings for Nova Icons and Unistra Symbol even when `link-icons: ()` disables rendering those icons. This warning originates inside the read-only Universe package.

Common icons:
- `us-icon("plant")`, `us-icon("book-open")`, `us-icon("edit-done")`, `us-icon("flask-lg")`, `us-icon("search")`, `us-icon("summary")`, `us-icon("lightbulb-o")`, `us-icon("code")`
- `nv-icon("coins")`, `nv-icon("text-undo")`, `nv-icon("file-video")`, `nv-icon("picture-layer")`, `nv-icon("file-audio")`, `nv-icon("folders")`, `nv-icon("facebook")`, `nv-icon("video-control-play")`, `nv-icon("interface-question-mark")`

### Citation Functions

The theme enhances citation handling for academic presentations by making prose citation the default for `@label` references.

| Syntax | Type | Example Output |
|---|---|---|
| `@label` | Prose citation (default) | Astley & Morris (2020) |
| `@label[supplement]` | Prose with supplement | Astley & Morris (2020:[supplement]) |
| `#pcite(label, ..args)` | Parenthetical (single) | (Astley & Morris, 2020) |
| `#pcite(<a>, 5)` | Parenthetical with page | (Astley & Morris, 2020, 5) |
| `#mcite(..args)` | Parenthetical (multiple) | (Astley & Morris, 2020 ; Morris & Astley, 2021) |
| `#mcite((<a>, 5), (<b>, "24-25"), (<c>,))` | Multiple with supplements | Combined parenthetical citation |

Two CSL files are provided for bibliography formatting:
- `apa.csl` — French language (semicolons with non-breaking space, "et" instead of "&")
- `apa_en.csl` — English/other languages

```typst
#set text(lang: "en")
#bibliography("refs.bib", style: "apa_en.csl", title: none)
```

### Link Icons

Icons are automatically appended next to links matching URL patterns. Configured via `link-icons` in `config-store`.

| Label | Description | Regex Pattern | Icon |
|---|---|---|---|
| `video` | Video/animated image files | `\.(gif\|mp4\|avi\|mov\|webm\|mkv)$` | `nv-icon("file-video")` |
| `image` | Image files | `\.(jpg\|jpeg\|png\|bmp\|svg\|webp\|tiff)$` | `nv-icon("picture-layer")` |
| `audio` | Audio files | `\.(mp3\|wav\|ogg\|flac\|m4a)$` | `nv-icon("file-audio")` |
| `archive` | Compressed archives | `\.(zip\|tar\|gz\|bz2\|xz)$` | `nv-icon("folders")` |
| `code` | Source/config files | `\.(css\|js\|py\|java\|rs\|go\|...)$` | `us-icon("code")` |
| `facebook` | Facebook links | `(fb\|facebook)\.com/` | `nv-icon("facebook")` |
| `pinterest` | Pinterest links | `pinterest\.com/` | `nv-icon("pinterest")` |
| `tumblr` | Tumblr links | `tumblr\.com/` | `nv-icon("tumblr")` |
| `youtube` | YouTube links | `(youtube\.com\|youtu\.be)/` | `nv-icon("video-control-play")` |
| `github` | GitHub links (Font Awesome) | `github\.com/` | `fa-icon("github")` |

Disable all link icons: `config-store(link-icons: ())`. Disable only FA icons: `config-store(link-icons-fa: false)`.

### Custom Quotes

The theme provides a custom `#quote()` element with French-style guillemets by default:

```typst
#quote(attribution: [Socrates])[
  I know that I know nothing.
]
```

Configure quote style via `config-store(quotes: (left: "'", right: "'"))` for English-style quotes.

### Highlights with Theme Colors

Use the theme's color palette with Typst's `#highlight()`:

```typst
This is #highlight(fill: blue.C)[highlighted in blue].
This is #highlight(fill: yellow.C)[highlighted in yellow].
This is #highlight(fill: green.C)[highlighted in green].
This is #highlight(fill: red.C)[highlighted in red].
```

### Navigation Header Bar

Enable the header navigation bar (mini-slides style) with `show-header: true`:

```typst
config-store(show-header: true)
```

This renders `unistra-nav-bar` — a navigation bar with mini-slides showing section progress.

## Color Scheme

### Base Color Groups

The theme provides 16 color groups, each with 5 variants (A–E). The variant pattern: A = darkest, B = medium, C = light/pastel, D = near-white tint, E = vivid/saturated accent.

| Group | A (Darkest) | B (Medium) | C (Light) | D (Tint) | E (Vivid) |
|---|---|---|---|---|---|
| `grey` | `#333332` | `#929292` | `#CACACA` | `#F6F6F6` | `#696260` |
| `maroon` | `#522122` | `#96716A` | `#CDB6B3` | `#F3F0EF` | `#B0685F` |
| `brown` | `#512414` | `#AF745B` | `#D6BAAB` | `#F4EAE7` | `#BD6244` |
| `orange` | `#7D340D` | `#E94E1B` | `#FAC294` | `#FEF0E7` | `#FF4600` |
| `red` | `#8A200D` | `#E42313` | `#F6AF8F` | `#FDEDE8` | `#FF2015` |
| `pink` | `#921428` | `#E40136` | `#F4A5AA` | `#FDEDED` | `#FF1D44` |
| `purple` | `#7E0F44` | `#BF1C66` | `#F3A3C1` | `#FCEAF4` | `#FA186E` |
| `violet` | `#3B2983` | `#584495` | `#AAA5D2` | `#EDE7F4` | `#4C2ED6` |
| `nblue` | `#22398E` | `#4458A3` | `#95B5E0` | `#E7EDF9` | `#315CDD` |
| `blue` | `#003F75` | `#0070B9` | `#8CD3F6` | `#E2F3FC` | `#0095FF` |
| `cyan` | `#004C4C` | `#009194` | `#85CCD3` | `#DCEFF4` | `#00C1C1` |
| `ngreen` | `#00462E` | `#008A57` | `#73C09B` | `#E7F3EC` | `#29D49D` |
| `green` | `#004818` | `#009A3A` | `#A6D2A7` | `#EBF4E9` | `#61F275` |
| `camo` | `#3B471A` | `#89A12A` | `#D8E08E` | `#F0F5E2` | `#96D400` |
| `yellow` | `#E28E00` | `#FFCD00` | `#FFF594` | `#FFFDE8` | `#FFF028` |

Usage: `color-group.variant`, e.g. `blue.C`, `red.B`, `yellow.D`, `nblue.A.lighten(30%)`.

Additional standalone colors: `white` (`#ffffff`), `black` (`#000000`), `link-color` (rgb(118, 50, 55)).

### Predefined Color Themes (for Focus Slides)

18 named themes combining palette colors for gradient backgrounds:

| ID | Theme Name | Color 1 | Color 2 | Text Color |
|---|---|---|---|---|
| 1 | `lblue` | `blue.E` (#0095FF) | `cyan.E` (#00C1C1) | white |
| 2 | `blue` | `nblue.E` (#315CDD) | `cyan.E` (#00C1C1) | white |
| 3 | `dblue` | `nblue.E` (#315CDD) | `blue.E` (#0095FF) | white |
| 4 | `yellow` | `yellow.B` (#FFCD00) | `yellow.C` (#FFF594) | black |
| 5 | `pink` | `pink.E` (#FF1D44) | `pink.B` (#E40136) | white |
| 6 | `neon` | `violet.E` (#4C2ED6) | `pink.E` (#FF1D44) | white |
| 7 | `mandarine` | `orange.E` (#FF4600) | `brown.E` (#BD6244) | white |
| 8 | `hazy` | `maroon.E` (#B0685F) | `grey.E` (#696260) | white |
| 9 | `smoke` | `grey.E` (#696260) | `black` (#000000) | white |
| 10 | `forest` | `green.A` (#004818) | `camo.E` (#96D400) | white |
| 11 | `berry` | `pink.A` (#921428) | `purple.A` (#7E0F44) | white |
| 12 | `ocean` | `cyan.A` (#004C4C) | `blue.B` (#0070B9) | `blue.D` (#E2F3FC) |
| 13 | `lavender` | `purple.C` (#F3A3C1) | `violet.C` (#AAA5D2) | black |
| 14 | `moss` | `ngreen.C` (#73C09B) | `grey.B` (#929292) | black |
| 15 | `clay` | `brown.B` (#AF745B) | `maroon.C` (#CDB6B3) | white |
| 16 | `mint` | `ngreen.E` (#29D49D) | `cyan.C` (#85CCD3) | black |
| 17 | `lemon` | `yellow.A` (#E28E00) | `camo.E` (#96D400) | black |
| 18 | `wine` | `maroon.A` (#522122) | `brown.A` (#512414) | `maroon.D` (#F3F0EF) |

Themes can be referenced by name (`theme: "berry"`) or by ID (`theme: 11`).

## Font Configuration

Default font stack: `("Unistra A", "Segoe UI", "Roboto")`. This is a preference order, not a bundled-font guarantee.

- **Unistra A**: Proprietary font restricted to University of Strasbourg members
- **Segoe UI**: First fallback (available on Windows)
- **Roboto**: Second fallback when installed

Override with fonts known to be installed on the target system, for example `config-store(font: ("Arial",))`.

## Source Files

| File | Purpose |
|---|---|
| `src/unistra.typ` | Main theme definition (slide types, layout, nav bar) |
| `src/colors.typ` | Color palette definitions (80+ swatches, 18 themes) |
| `src/icons.typ` | Icon function definitions and character mappings (auto-generated) |
| `scripts/get_icons.py` | Python script that generates `src/icons.typ` |
| `assets/csl/apa.csl` | French APA citation style |
| `assets/csl/apa_en.csl` | English APA citation style |

## Tips and Patterns

- Use `#pause` for incremental reveal within slides
- Use `#highlight(fill: color.C)[text]` with theme colors for inline highlights
- Use `#block(stroke: (left: 5pt + green.C), outset: (x: 0.5em))[...]` for colored side-bar blocks
- Use `#show: appendix` before appendix slides to activate `"A-"` numbering
- Set `#set text(lang: "fr")` for French-specific citation formatting
- After installing Unistra Symbol, combine `us-icon()` with outline titles: `#outline-slide(title: [#us-icon("summary") Outline])`
- Colors support Typst color methods: `nblue.A.lighten(30%)`, `red.B.transparentize(20%)`

## Universe Link

[touying-unistra-pristine on Typst Universe](https://typst.app/universe/package/touying-unistra-pristine)
[Source on GitHub](https://github.com/spidersouris/touying-unistra-pristine)
