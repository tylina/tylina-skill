# Washi Tape Theme -- API Reference

**Version:** 1.0.0
**Touying Compatibility:** 0.7.4
**Style:** Japanese paper craft / scrapbooking aesthetic

---

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: washi-tape-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle text],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
  config-common(breakable: false),
)

#set text(font: ("Avenir Next", "Heiti SC"))

#title-slide()
```

---

## Theme Entry

### `#washi-tape-theme(aspect-ratio, footer, ..args, body)`

Main theme function. Wrap with `#show:`.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `..args` | any | -- | Passed to `touying-slides.with()` (e.g., `config-info(...)`) |
| `body` | content | -- | Document body |

**Notes:**
- Sets `text(size: 18pt)` globally. Override in your document if needed.
- Fonts should be set in the document via `#set text(font: ...)`, not in the theme.

---

## Slide Functions

### `#title-slide(..args)`

Full-bleed title slide with dot-grid background and tape frame corner decorations (bookend element).

| Parameter | Type | Description |
|-----------|------|-------------|
| `..args` | named | Override `config-info` fields (title, subtitle, author, date, institution) |

### `#slide(title: auto, ..args)`

Standard content slide with persistent dot-grid atmosphere, tape accent in top-right, and paper clip in bottom-left.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content/none | `auto` | Slide title (auto = use heading) |
| `..args` | positional | -- | Content blocks |

### `#new-section-slide(body)`

Section divider with large faded section number, section title, and tape strip accents. Auto-generated when using `= Heading` syntax.

### `#focus-slide(body)`

Dark background full-bleed slide for emphasis statements. Inverted color scheme with cream text on warm dark grey, sparse dot grid, and angled tape strip decorations.

| Parameter | Type | Description |
|-----------|------|-------------|
| `body` | content | Centered emphasis text |

### `#ending-slide(body)`

Closing slide that bookends with the title slide (shared tape frame corners and dot-grid background).

| Parameter | Type | Description |
|-----------|------|-------------|
| `body` | content | Closing message text |

---

## Components

### `#tape-card[title][body]`

Card with a colored washi tape strip header across the top. Torn-edge look via semi-transparent accent fill.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `accent` | color | `palette.primary` | Tape header color |

### `#journal-box[title][body]`

Insight box with kraft paper background and angled tape corner accent. Simulates a bullet journal callout.

### `#sticker-stat[label][value]`

Metric display inside a circular sticker/badge shape with dotted inner ring decoration.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `accent` | color | `palette.primary` | Sticker circle color |

### `#memo-quote[quote]`

Quote on lined notebook paper with angled tape accent in the top-right corner.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `author` | content/none | `none` | Attribution line |

### `#flag-tag[content]`

Small inline washi tape flag/banner tag. Suitable for category labels and status indicators.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | color | `palette.primary` | Flag fill color |

### `#strip-divider(color, width)`

Patterned washi tape separator (horizontal decorative element with torn/wavy edges and stripe pattern).

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | color | `palette.primary` | Tape strip color |
| `width` | relative | `80%` | Strip width |

### `#collage-card[title][body]`

Card with layered paper aesthetic (slight rotation shadow layer behind main card).

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `accent` | color | `palette.secondary` | Title and tape accent color |

### `#pinboard-box[title][body]`

Large box that looks pinned to a board with a circular push-pin accent at top center.

### `#stamp-card[title][body]`

Card with rubber-stamp-style dashed border decoration and inner double-border effect.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `accent` | color | `palette.lavender` | Border and title color |

---

## Color Palette

Access via `palette.*`:

| Key | Hex | Usage |
|-----|-----|-------|
| `bg` | `#FFFEF8` | Warm white / notebook paper |
| `primary` | `#D4727B` | Dusty rose (main washi tape) |
| `primary-text` | `#A64E58` | Contrast-safe dusty-rose text |
| `secondary` | `#7BA08A` | Sage green (secondary tape) |
| `secondary-text` | `#4F755F` | Contrast-safe sage text |
| `accent` | `#D4A537` | Mustard yellow (highlight accent) |
| `accent-text` | `#806013` | Contrast-safe mustard text |
| `lavender` | `#9B8EC4` | Soft lavender (extra tape color) |
| `lavender-text` | `#675A91` | Contrast-safe lavender text |
| `text-dark` | `#4A4A4A` | Warm grey (headings, titles) |
| `text-body` | `#555555` | Medium grey (body text) |
| `text-light` | `#707070` | Accessible muted grey (captions, footer) |
| `card` | `#FFFDF5` | Slightly warm card fill |
| `kraft` | `#D4C5A0` | Kraft paper brown |
| `kraft-dark` | `#B8A87A` | Darker kraft for borders |
| `border` | `#E8E2D8` | Soft warm border |
| `dot-grid` | `#C8C2B8` | Dot grid dot color |

---

## SVG Decorations

The theme includes four SVG decorations rendered via `image(bytes(...))`:

1. **Dot-grid background** -- Full-page bullet journal dot paper with paper fiber streaks (11 rows of 20 dots + 5 fiber lines)
2. **Tape frame** -- Angled washi tape strips at all four corners with polka-dot, stripe, chevron, and dot patterns (bookending)
3. **Tape strip divider** -- Horizontal washi tape with torn/wavy edges and stripe pattern
4. **Paper clip** -- Small decorative paper clip accent

---

## Design Patterns

### Background Atmosphere
Every content slide automatically renders:
- Dot-grid notebook pattern (full-page, subtle)
- Small angled washi tape strip in top-right corner
- Paper clip accent in bottom-left corner

### Bookending
Title and ending slides share:
- Tape frame corner decorations (four colored tape strips at corners)
- Dot-grid background
- These shared elements are NOT present on content slides

### Height Equalization
Components use `lazy-v(1fr)` for consistent height when placed in `cols()` columns.

---

## Usage Tips

- Use `#cols(columns: (...))[...][...]` for multi-column layouts
- Use `#flag-tag` for inline metadata labels (categories, status)
- Use `#strip-divider()` between logical sections on a single slide
- Mix tape colors via the `accent` parameter on components
- Use `#speaker-note[...]` on every slide for presenter notes
