# Amber Ink Theme — API Reference

**Version:** 1.0.0
**Touying Compatibility:** 0.7.4
**Style:** Premium editorial / business — vintage letterpress aesthetic

---

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: amber-ink-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle text],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#set text(font: ("Noto Sans", "Noto Sans CJK SC"))

#title-slide()
```

---

## Theme Entry

### `#amber-ink-theme(aspect-ratio, footer, ..args, body)`

Main theme function. Wrap with `#show:`.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `..args` | any | — | Passed to `touying-slides.with()` (e.g., `config-info(...)`) |
| `body` | content | — | Document body |

**Notes:**
- Sets `text(size: 20pt)` globally. Override in your document if needed.
- Fonts should be set in the document via `#set text(font: ...)`, not in the theme.

---

## Slide Functions

### `#title-slide(..args)`

Full-bleed title slide with ornamental letterpress frame and typographic flourishes.

| Parameter | Type | Description |
|-----------|------|-------------|
| `..args` | named | Override `config-info` fields (title, subtitle, author, date, institution) |

### `#slide(title: auto, ..args)`

Standard content slide with persistent paper grain atmosphere and printer's registration marks.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content/none | `auto` | Slide title (auto = use heading) |
| `..args` | positional | — | Content blocks |

### `#new-section-slide(body)`

Section divider with large faded section number and amber accent bar. Auto-generated when using `= Heading` syntax.

### `#focus-slide(body)`

Dark sepia full-bleed slide for emphasis statements. Inverted color scheme with warm cream text on deep sepia.

| Parameter | Type | Description |
|-----------|------|-------------|
| `body` | content | Centered emphasis text |

### `#outline-slide(title: [Contents])`

Table of contents slide with typographic styling.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | `[Contents]` | TOC heading text |

### `#ending-slide(body)`

Closing slide that bookends with the title slide (shared letterpress frame and ornamental elements).

| Parameter | Type | Description |
|-----------|------|-------------|
| `body` | content | Closing message text |

---

## Components

### `#press-card[title][body]`

Card with ornamental press border featuring corner dots and amber header band. Uses `stack(spacing: 0pt)` for header/body adjacency.

### `#edition-box[title][body]`

Highlighted section with secondary amber left-border accent. Editorial column style on printing paper fill.

### `#ornament-divider(color: palette.primary)`

SVG typographic flourish divider with swashes, central diamond, and terminal dots.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | color | `palette.primary` | Flourish color |

### `#type-tag[label]`

Small inline tag with printer's diamond mark. Suitable for labels, categories, status indicators.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | — | Tag text |
| `color` | color | `palette.primary` | Tag accent color |

### `#kpi-card[value][label]`

Metric display with vintage decorative number frame (SVG). Centered layout for dashboard-style KPIs.

### `#editorial-card[title][body]`

Clean editorial column container with olive-green top accent. Separated title/body with fine rule.

### `#insight-box[title][body]`

Callout box with amber accent bar, diamond icon in header, and tinted background. For analyst notes and key insights.

### `#comparison-table(headers, ..rows)`

Elegant data table with amber header row and alternating fill. Auto-sized columns.

| Parameter | Type | Description |
|-----------|------|-------------|
| `headers` | array | Array of header cell content |
| `..rows` | arrays | Each positional argument is a row (array of cell content) |

**Example:**
```typst
#comparison-table(
  ([Name], [Value], [Change]),
  ([Alpha], [\$100M], [+12%]),
  ([Beta], [\$85M], [+8%]),
)
```

### `#timeline-point[date][body]`

Timeline entry with vintage dot marker connected by a vertical line. Stack multiple for chronological sequences.

### `#quote-press[body][source]`

Quotation block with large ornamental opening quote mark on printing paper background.

| Parameter | Type | Description |
|-----------|------|-------------|
| `body` | content | Quote text (rendered italic) |
| `source` | content | Attribution (rendered right-aligned) |

### `#footnote-block[body]`

Fine-print attribution block with top rule separator. For sources, disclaimers, and notes.

---

## Color Palette

Access via `palette.*`:

| Key | Hex | Usage |
|-----|-----|-------|
| `bg` | `#FDFAF5` | Warm cream background |
| `primary` | `#8B5E3C` | Amber / burnt sienna (headings, accents) |
| `secondary` | `#C47B2B` | Warm golden amber (highlights) |
| `tertiary` | `#5B6B4E` | Olive ink green (editorial accents) |
| `text-dark` | `#2A2018` | Near-black sepia (titles) |
| `text-body` | `#4A3B2E` | Warm dark brown (body text) |
| `card` | `#FFFEF9` | Soft cream card backgrounds |
| `border` | `#DFC9A8` | Aged amber border lines |
| `print` | `#F5EFE4` | Printing paper fill |
| `text-muted` | `#8B7B6A` | Muted text for captions/labels |

---

## SVG Decorations

The theme includes four complex SVG decorations rendered via `image(bytes(...))`:

1. **Paper grain texture** — Full-page aged paper fiber pattern (horizontal/vertical fibers + scattered dots)
2. **Letterpress frame** — Corner fleuron ornaments, double-rule borders, diamond printer's marks (bookending)
3. **Typographic flourish** — Swash divider with central diamond and terminal dots
4. **Corner registration marks** — Printer's crop/registration marks (content slide atmosphere)
5. **Vintage number frame** — Decorative double-border frame with corner diamonds (KPI cards)

---

## Design Patterns

### Background Atmosphere
Every content slide automatically renders:
- Paper grain texture (full-page, very subtle)
- Printer's registration corner marks

### Bookending
Title and ending slides share:
- Letterpress ornamental frame (corner fleurons, double rules, diamond marks)
- Typographic flourish dividers
- These elements are NOT present on content slides

### Height Equalization
Components use `lazy-v(1fr)` for consistent height when placed in `cols()` columns.

### Adjacent Colored Blocks
`press-card` uses `stack(spacing: 0pt)` for seamless header-to-body transitions.

---

## Usage Tips

- Use `#cols(columns: (...))[...][...]` for multi-column layouts
- Use `#type-tag` for inline metadata labels (dates, categories, status)
- Use `#ornament-divider()` between logical sections on a single slide
- Use `#footnote-block` at slide bottom for source attribution
- Use `#speaker-note[...]` on every slide for presenter notes
