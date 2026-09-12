# Gov-Red Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | gov-red |
| **Best For** | Government reports, party/political presentations, official ceremonies |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |

An authoritative, dignified, and professional government-style presentation theme for [Touying](https://github.com/touying-typ/touying) 0.7.4. Designed for government briefings, policy interpretation, work summaries, Party/state events, and official reports.

## Design Philosophy

The Gov-Red theme draws inspiration from Chinese government visual identity systems, combining **Government Red** (`#8B0000`) and **Government Blue** (`#003366`) as primary colors with **Gold** (`#DAA520`) accent elements to convey authority, dignity, and professionalism. The light-themed design ensures readability while maintaining a modern, clean aesthetic.

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `palette.red` | `#8B0000` | Primary accent, title text, number blocks, policy card borders |
| `palette.blue` | `#003366` | Secondary accent, section backgrounds, headings |
| `palette.gold` | `#DAA520` | Decorative elements, achievement highlights, separator lines |
| `palette.bg` | `#FFFFFF` | Slide background, card background |
| `palette.bg-light` | `#F5F7FA` | Alternate row backgrounds, subtle fills |
| `palette.text-dark` | `#1A1A1A` | Primary heading text |
| `palette.text-body` | `#4A4A4A` | Body content text |
| `palette.text-light` | `#888888` | Captions, footer text |
| `palette.border` | `#D5D8DC` | Card borders, table lines |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.red` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.blue` | Dark text on light backgrounds |

## Key Visual Elements

- **Dual-color gradient top bar**: Red-to-blue gradient across slide tops
- **Red number blocks**: White numbers in red squares for section/item numbering
- **Gold accent lines**: Gold separator lines for visual hierarchy
- **Gold decorative dots**: Footer and decorative elements using gold dots
- **Deep blue section pages**: Section dividers with deep blue gradient backgrounds and gold accents
- **Red-blue framed cards**: Title and ending slides use red top + blue bottom borders

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: gov-red-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Work Report Title],
    subtitle: [Subtitle Here],
    author: [Department Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#title-slide()

= Section Title

== Slide Title

Content goes here.
```

## Slide Functions

### `slide(title: auto, align: auto, ..args)`

Standard content slide with:
- Red-blue gradient top bar (6pt)
- Bold red title with gold underline
- Footer with gold dots and page number

```typst
== My Slide Title

Regular content here.
```

### `title-slide(..args)`

Cover/title slide featuring:
- Light gray gradient background
- Left red/blue vertical accent bar
- Center card with red top border and blue bottom border
- Gold star decoration, gold separator line
- Title, subtitle, author, institution, date

```typst
#title-slide()
```

### `new-section-slide(self: none, body)`

Automatically generated section divider with:
- Deep blue gradient background
- Left gold accent stripe
- Gold line above section title
- Gold star decoration
- Bottom red-gold gradient line

Triggered automatically by `= Section Title` headings.

### `focus-slide(body)`

Full-screen focus slide with:
- Solid red background
- White centered text (2em, bold)
- No header/footer

```typst
#focus-slide[
  Key message here
]
```

### `ending-slide(body)`

Closing/thank-you slide with:
- Light gradient background
- Top red-blue gradient bar
- Center card with red/blue border frame
- Gold star and separator

```typst
#ending-slide[Thank You]
```

### `outline-slide(title: [目 录], items)`

Table of contents slide with:
- Red number blocks for each chapter
- Blue chapter titles
- Clean white background with subtle decorations

```typst
#outline-slide(
  title: [目 录],
  ([Section 1], [Section 2], [Section 3]),
)
```

## Reusable Components

### `policy-card(number, title, description)`

A card with a red number block, bold blue title, and description text. Left red border accent. Ideal for listing policies, initiatives, or action items.

```typst
#policy-card(1, [Policy Title], [
  Description of the policy or initiative.
])
```

### `achievement-box(title, body)`

Gold-accented box with a gold star icon. Ideal for highlighting achievements, milestones, or key takeaways.

```typst
#achievement-box([Achievement Title])[
  Details about the achievement.
]
```

### `data-card(label, value, accent: palette.red)`

Metric/KPI card with a large colored number and top accent border. Supports custom accent colors: `palette.red`, `palette.blue`, `palette.gold`.

```typst
#data-card([Revenue], [1.28 Trillion], accent: palette.red)
```

### `report-table(headers, rows)`

Styled table with a red header row and alternating row backgrounds. Perfect for data presentations and reports.

```typst
#report-table(
  ([Column A], [Column B], [Column C]),
  (
    ([Row 1A], [Row 1B], [Row 1C]),
    ([Row 2A], [Row 2B], [Row 2C]),
  ),
)
```

### `milestone-item(year, title, content)`

Timeline item with a blue year badge and red title. Great for chronological milestones or development history.

```typst
#milestone-item([2024.06], [Milestone Title], [
  Description of what happened.
])
```

### `info-box(title, body)`

Blue-accented information box. Suitable for notices, regulations, or supplementary information.

```typst
#info-box([Notice])[
  Important information here.
]
```

### `stat-row(..items)`

Horizontal row of large statistics. Colors cycle through red, blue, gold. Each item requires `value` and `label` keys.

```typst
#stat-row(
  (value: [98.5%], label: [Coverage Rate]),
  (value: [42], label: [New Schools]),
  (value: [15], label: [Health Centers]),
)
```

## Helper Functions

| Function | Description |
|----------|-------------|
| `dual-gradient-bar(height: 6pt)` | Red-to-blue gradient horizontal bar |
| `red-number(num)` | Red square block with white number |
| `gold-line(width: 120pt)` | Gold accent line with rounded ends |
| `gold-dots(size: 4pt, spacing: 10pt)` | Decorative gold dot pattern |

## Theme Configuration

```typst
#show: gov-red-theme.with(
  aspect-ratio: "16-9",     // or "4-3"
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)
```

## Fonts

Fonts are not set in `template.typ`. Configure your preferred fonts in your main document (e.g., `main.typ` or `demo.typ`) using Typst's `set text(font: ...)` rule. Recommended system sans-serif fonts:
1. Arial
2. Roboto
3. Noto Sans SC (for Chinese characters)
4. Noto Sans

## Recommended Use Cases

- Government work reports and briefings
- Policy interpretation and analysis presentations
- Annual work summaries and reviews
- Party building and organizational reports
- Official ceremonies and state event presentations
- Data-driven government performance reports

## Recommended Complexity

**Rich** — This theme is designed for rich, data-heavy presentations with multiple visual components. Use the full range of components (policy cards, data cards, achievement boxes, report tables, milestone items) for maximum visual impact.

## File Structure

```
gov-red/
├── template.typ    # Theme definition (colors, slides, components)
├── demo.typ        # Demo presentation (Chinese government content)
├── README.md       # This documentation
└── output/         # Compiled slide images
```

## Touying Compatibility

- **Touying version**: 0.7.4
- **API pattern**: `touying-slide-wrapper` + `touying-slide`
- **Theme entry**: `touying-slides.with(config-page, config-common, config-methods, config-colors, config-store)`

## License

This theme is provided as-is for use with Touying presentations.
