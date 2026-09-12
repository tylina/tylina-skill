# Memoir Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | memoir |
| **Best For** | Humanities lectures, literary presentations, book launches, cultural talks, typography conferences |
| **Style Objective** | Elegant |
| **Complexity Level** | Rich |

A luxury book/memoir design aesthetic inspired by Penguin Classics and Taschen publishing. Features drop caps, ornamental flourishes, elegant serif typography, generous margins, pull quotes with decorative borders, and a rich cream paper background with deep black ink and burgundy jewel-tone accent. Content hierarchy is achieved through size and weight rather than color.

## Design Philosophy

- **Bookish Elegance**: Cream paper background with deep ink and ornamental flourishes evokes fine press printing
- **Typography as Design**: Large serif type, generous leading, and careful weight hierarchies create visual interest without color dependence
- **Ornamental Restraint**: SVG flourishes, corner ornaments, and dropcap frames add sophistication without overwhelming content
- **Publishing Heritage**: Chapter numbering, colophon boxes, and binding tags reference traditional book design conventions

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Cream Paper | `#FFFEF7` | Background -- warm off-white paper |
| Deep Ink | `#1C1714` | Primary text -- rich near-black |
| Burgundy | `#7B2D3B` | Accent -- jewel-tone for chapter numbers, primary accent |
| Forest Green | `#2E5A4C` | Secondary -- used sparingly for emphasis |
| Antique Gold | `#88704F` | Ornament -- flourishes, decorative elements |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 18pt)

#show: memoir-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Book cover style slide with corner ornaments in all four corners, centered ornamental flourish above the title, large serif title, italic subtitle, ornamental rule, author name, and publisher-style institution/date line in small tracked caps.

### `slide(title: auto, ..args)`
Cream background content slide with elegant serif header (regular weight title with gold ornament line below), folio-style footer with italic footer text, ornamental dot center, and page number.

### `new-section-slide(self: none, body)`
Chapter opening slide (auto-triggered by `= Section Title`). Features a subtle border frame, "CHAPTER" label in tracked small caps, large Roman numeral in burgundy, ornamental flourish, and section title in large serif.

### `focus-slide(body)`
Single large italic quote centered on cream background with oversized ornamental quotation marks in gold above and below, and a small ornamental flourish beneath.

### `ending-slide(body)`
Colophon-style closing slide with corner ornaments, large italic "Finis" text, ornamental flourish, and custom body text below in muted ink.

## Reusable Components

### `chapter-card(title, body-text)`
Card with ornamental gold top border and thin borders on remaining sides. Bold serif title with body text in muted ink.

```typst
#chapter-card([Nicolas Jenson], [Venice, 1470. Created the first true roman typeface.])
```

### `folio-stat(number, description)`
Large elegant number in burgundy accent with small italic description below. Evokes folio page numbering.

```typst
#folio-stat([1455], [Year of the Gutenberg Bible])
```

### `memoir-quote(quote-text, attribution: none)`
Elegant centered pull quote with large ornamental quotation marks in gold, italic serif text, and optional attribution.

```typst
#memoir-quote(
  [Typography is the craft of endowing human language with a durable visual form.],
  attribution: [Robert Bringhurst],
)
```

### `fleuron-divider()`
Centered ornamental flourish used as a section divider between content blocks.

```typst
#fleuron-divider()
```

### `sidenote(body)`
Small italic marginalia-style annotation in light ink for supplementary information.

```typst
#sidenote[The Gutenberg Bible required approximately 300 individual letter molds.]
```

### `binding-tag(label-text)`
Small rectangular tag with thin ornament border and tracked uppercase text, mimicking book section markers.

```typst
#binding-tag[Transitional Period]
```

### `colophon-box(..items)`
Information box styled like a book's colophon page. Features "COLOPHON" header in tracked caps, hairline rule, and a list of statements.

```typst
#colophon-box(
  [*Readability* remains the supreme measure of typographic success.],
  [*Contrast* between text sizes creates hierarchy without color.],
  [*Whitespace* is not empty -- it is the silence between notes.],
)
```

### `chapter-opener(number, title)`
Decorative chapter opening block with "CHAPTER" label, large number in burgundy, ornamental flourish, and title in large serif.

```typst
#chapter-opener([III], [The Modern Era])
```

## Helper Functions

### `ornamental-flourish(width: 120pt)`
Renders the SVG ornamental scroll/swirl flourish at specified width.

### `dropcap-frame(size: 48pt)`
Renders a decorative square frame for initial letter positions.

### `corner-ornament(size: 32pt)`
Renders an L-shaped decorative corner piece used in title and ending slides.

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.ink)[Deep ink text]
#text(fill: palette.accent)[Burgundy accent text]
#text(fill: palette.secondary)[Forest green text]
#text(fill: palette.ornament)[Antique gold text]
```

- `palette.bg`, `palette.ink`, `palette.accent`, `palette.secondary`, `palette.ornament`
- `palette.ink-light` (40% transparent), `palette.ink-muted` (35% transparent), `palette.ink-faint` (75% transparent)

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Theme accent (burgundy), `alert()` text |
| `neutral-lightest` | `palette.bg` | Light backgrounds (cream paper) |
| `neutral-darkest` | `palette.ink` | Dark text (deep ink) |

## Best Use Cases

- Humanities and literary lectures
- Typography and design history presentations
- Book launch events and publishing talks
- Cultural and art history conferences
- Philosophy and classical studies
- Elegant formal academic presentations

## Recommended Complexity

**Rich** -- This theme uses ornamental SVG flourishes, corner decorations, and multiple typographic components. Use `memoir-quote`, `chapter-card`, and `colophon-box` for structured content that maintains the bookish aesthetic. Typography itself serves as the primary design element.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (book cover style)
2. The Printed Word (Gutenberg, early typefaces)
3. The Golden Age (Enlightenment, Industrial Revolution)
4. The Modern Era (Bauhaus, digital watershed)
5. Legacy & Future (contemporary landscape, enduring principles)
6. Focus slide and ending slide

## File Structure

```
memoir/
  template.typ   -- Theme definition (colors, slides, components)
  demo.typ       -- Full demonstration presentation
```
