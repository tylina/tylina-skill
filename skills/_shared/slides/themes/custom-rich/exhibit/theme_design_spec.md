# Exhibit Theme

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | exhibit |
| **Best For** | Investment banking, financial analysis, deal presentations |
| **Style Objective** | MBB Consulting |
| **Complexity Level** | Rich |

A premium, dark-themed Touying 0.7.4 presentation theme designed for authoritative, data-driven executive communications. Features a conclusion-first design philosophy with gold accents, gradient decorations, and a CONFIDENTIAL footer on every content page.

## Design Philosophy

**Conclusion-first.** Every content slide opens with a "takeaway bar" — a gold-bordered headline that states the key finding before the supporting evidence. This pattern mirrors the communication style of top-tier strategy consulting firms and investment banks.

**Dark authority.** The dark background (`#0D1117`) with blue-purple gradients and gold accents creates a premium, authoritative tone suitable for board rooms and investor meetings.

**Data-driven clarity.** KPI cards, styled data tables, and exhibit-numbered cards provide structured visual hierarchy for quantitative narratives.

## Color Palette

| Token | Hex | Usage |
|---|---|---|
| `palette.dark` | `#0D1117` | Primary background |
| `palette.blue` | `#1E40AF` | Deep blue accent |
| `palette.purple` | `#7C3AED` | Purple accent |
| `palette.gold` | `#D4AF37` | Gold — primary accent, takeaway bars |
| `palette.indigo` | `#6366F1` | Purple-blue accent |
| `palette.card-bg` | `#161B22` | Card/surface background |
| `palette.text-white` | `#FFFFFF` | Primary text |
| `palette.text-gray` | `#8B949E` | Secondary text |
| `palette.text-muted` | `#484F58` | Decorative dots and low-emphasis shapes only |
| `palette.border` | `#30363D` | Card borders |
| `palette.success` | `#22C55E` | Positive trends |
| `palette.danger` | `#EF4444` | Risks/negative trends |
| `palette.warning` | `#F59E0B` | Warnings/cautions |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.gold` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `palette.text-white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.dark` | Dark text on light backgrounds |

## Key Visual Elements

- **Top gradient bar**: Blue → indigo → purple gradient across every slide header
- **Gold left accent**: 4px gold vertical line beside slide titles
- **Grid decoration**: Subtle dot-grid pattern persists in the content body for a data-driven aesthetic
- **Takeaway bar**: Dark card with gold left border for key exhibit conclusions
- **CONFIDENTIAL label**: Appears on every content page footer

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC", "Arial"), size: 18pt)

#show: exhibit-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle — Context],
    author: [Your Name or Team],
    date: datetime.today(),
    institution: [Your Organization],
  ),
)

#title-slide()

= Section Title

== Slide Title

#takeaway-bar[State your key conclusion here before the supporting evidence]

Your content goes here.
```

## Slide Functions

### `title-slide(..args)`
Full-page dark cover slide with gradient decorations, gold accents, centered title card, and CONFIDENTIAL label.

```typst
#title-slide()
```

### `slide(title: auto, ..args)`
Standard content slide with gradient top bar, gold-accented title, and CONFIDENTIAL footer with page numbers.

```typst
== My Slide Title
Content here...
```

### `new-section-slide(self: none, body)`
Auto-generated section divider with large heading text and gold underline. Triggered by `= Section Title`.

### `focus-slide(body)`
Full-screen dark slide for key quotes, decisions, or call-to-action statements. Gold accent markers on left and right edges.

```typst
#focus-slide[
  _"Your impactful quote here."_
]
```

### `ending-slide(body)`
Closing slide with centered card featuring gold left accent and decorative grid patterns.

```typst
#ending-slide[Thank You]
```

## Reusable Components

### `takeaway-bar(content)`
Conclusion-first headline bar. Should appear at the top of content slides.

```typst
#takeaway-bar[Revenue grew 26% YoY driven by enterprise adoption in APAC]
```

### `kpi-card(label, value, trend: none, trend-color: none, accent: palette.gold)`
Metric display card with a centered value→label→trend stack, optional trend indicator, and colored top accent.

```typst
#kpi-card(
  [Annual Revenue],
  [\$33.1B],
  trend: [#sym.arrow.t 26%],
  trend-color: palette.success,
  accent: palette.gold,
)
```

### `insight-box(title, body)`
Blue/indigo-accented callout box for key insights and recommendations.

```typst
#insight-box([Key Insight])[
  Your insight text here with supporting details.
]
```

### `risk-box(title, body)`
Red-accented callout box for risks and warnings.

```typst
#risk-box([Risk Factor])[
  Description of the risk and potential impact.
]
```

### `success-box(title, body)`
Green-accented callout box for positive outcomes and achievements.

```typst
#success-box([Achievement])[
  Description of the positive outcome.
]
```

### `data-table(align: center + horizon, inset: (x: 0.8em, y: 0.5em), headers, rows)`
Styled table with dark blue header row and alternating dark row backgrounds. Override `inset` for intentionally dense exhibits.

```typst
#data-table(
  ([Metric], [FY2023], [FY2024], [Growth]),
  (
    ([Revenue], [\$26.3B], [\$33.1B], [+26%]),
    ([EBITDA], [\$5.2B], [\$7.8B], [+50%]),
  ),
)
```

### `exhibit-card(number, title, description, accent: palette.gold)`
Numbered card for structured exhibits, findings, or strategic pillars.

```typst
#exhibit-card(1, [Market Opportunity], [
  Description of the strategic exhibit item.
], accent: palette.gold)
```

### `stat-row(..items)`
Horizontal row of key metrics with auto-cycling accent colors.

```typst
#stat-row(
  (value: [42%], label: [Enterprise Margin]),
  (value: [28%], label: [Mid-Market Margin]),
  (value: [3,200], label: [Target Accounts]),
)
```

### `phase-card(phase, title, items, accent: palette.gold)`
Timeline/phase card for roadmaps and strategic planning.

```typst
#phase-card([Q1 2025], [Foundation], [
  - Legal entity setup
  - Leadership hiring
  - Office build-out
], accent: palette.gold)
```

## Theme Configuration

### `exhibit-theme(aspect-ratio, footer, ..args, body)`

| Parameter | Default | Description |
|---|---|---|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `none` | Footer content (string, function, or content) |
| `align` | `horizon` | Default content alignment |

### Fonts
Fonts are not set in `template.typ`. Configure fonts in `main.typ` or `demo.typ` using Typst's `set text(font: ...)` rule. The verified demo stack is `("IBM Plex Sans", "Noto Sans SC", "Arial")` at 18pt; the later entries provide CJK and platform fallback coverage.

## Best For

- Strategic planning presentations
- Executive reports and board decks
- Investment analysis and due diligence
- Private equity / venture capital pitches
- Quarterly business reviews (QBRs)
- M&A and corporate development materials

## Recommended Complexity

**Rich** — This theme is designed for high-stakes presentations with rich data visualization, multiple component types, and structured narrative flow.

## File Structure

```
exhibit/
├── template.typ    # Theme definition (colors, slides, components)
├── demo.typ        # 19-slide showcase with strategic consulting content
├── theme.md        # Theme API and usage reference
└── theme_design_spec.md  # This design specification
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
