# CMB Bank Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | cmb-bank |
| **Best For** | Banking, financial services, wealth management presentations |
| **Style Objective** | Consulting |
| **Complexity Level** | Rich |

A brand-consistent, structured financial presentation theme inspired by **China Merchants Bank (招商银行)** — one of China's leading commercial banks. Designed for banking product introductions, financial solution reports, customer case studies, and branch training materials.

## Design Philosophy

The theme uses a hybrid approach: **brand-red** for high-impact slides (cover, chapter dividers, ending) combined with **clean white** content slides. Finance blue accents are used for data storytelling and case studies, creating a professional yet visually distinctive banking presentation.

### Key Visual Elements

- **Red brand header strip** on every content slide for brand consistency
- **Large translucent chapter numerals** on section dividers for visual impact
- **Finance blue accent** for customer case storytelling and data metrics
- **Controlled content density** — structured cards and tables with clear footer-safe whitespace
- **Structured layouts** — cards, grids, process flows, and data tables

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| CMB Red | `#C8152D` | Primary brand color, headers, accents |
| Deep Red | `#8F0F1B` | Gradients, dark backgrounds |
| Signal Red | `#E26A74` | Secondary accents, highlights |
| Finance Blue | `#2175D9` | Data metrics, case studies, charts |
| Dark Text | `#1F1F1F` | Titles, headings |
| Body Text | `#4A4A4A` | Body copy, descriptions |
| Light Text | `#6F6F6F` | Captions and footer text; 5.02:1 contrast on white |
| Light Gray | `#E9E9E9` | Borders, dividers |
| BG Light | `#F5F5F5` | Card backgrounds, alternating rows |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.red` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.deep-red` | Dark text on light backgrounds |

## File Structure

```
cmb-bank/
├── template.typ    # Theme definition (colors, slides, components)
├── demo.typ        # 16-slide demo with Chinese banking content
├── theme.md        # Concise public API reference
└── theme_design_spec.md  # Visual and implementation specification
```

## Quick Start

```typst
#import "template.typ": *

#show: cmb-bank-theme.with(
  aspect-ratio: "16-9",
  footer: [招商银行 · 交易银行部],
  config-info(
    title: [交易银行综合金融服务方案],
    subtitle: [Transaction Banking Financial Services],
    author: [招商银行交易银行部],
    institution: [China Merchants Bank],
    date: datetime.today(),
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content here...

#ending-slide[感谢聆听]
```

## Slide Functions

### `title-slide(..args)`

Full-page red gradient cover slide with a white center card containing title, subtitle, author, institution, and date. Decorative translucent circles add depth.

### `slide(title: auto, ..args)`

Standard content slide with:
- 4pt red brand bar at the top
- Bold dark title with red underline accent
- Measured three-part footer with custom text, centered brand motif, and page number

### `new-section-slide(self: none, body)`

Section divider slide triggered automatically by `= Section Title`. Features:
- Red gradient background
- Large semi-transparent section number (auto-counted)
- White section title with accent bar

### `focus-slide(body)`

Full-page red gradient slide with large centered white text constrained to 80% width. Use for key messages, quotes, or transition statements.

### `ending-slide(body)`

Closing slide with red gradient background, large white centered text, and decorative accent elements. Perfect for "Thank You" or closing messages.

## Reusable Components

### `product-card(title, body, accent: palette.red)`

A financial product card with a colored left border accent. Ideal for presenting product features, service descriptions, or capability summaries.

```typst
#product-card([Cash Management], [
  Full-service cash management with real-time pooling,
  cross-bank collection, and intelligent payment routing.
], accent: palette.red)
```

### `metric-card(label, value, trend: none, accent: palette.blue)`

Financial metric display card with a colored top border. The value/trend group and label form one centered vertical stack; the optional trend indicator is green, while `accent` controls the value and top rule.

```typst
#metric-card([Revenue Growth], [12.5%], trend: [+2.3%], accent: palette.blue)
```

### `case-card(title, body)`

Customer case study card with blue-accented left border and light blue background. Designed for presenting client backgrounds, challenges, and outcomes.

```typst
#case-card([Client Background], [
  A Fortune 500 manufacturer with *180+* subsidiaries
  and *15* banking relationships.
])
```

### `process-flow(steps)`

Horizontal process flow diagram with numbered red step circles connected by arrows. For a 16:9 slide, use two through six concise steps.

```typst
#process-flow(("Application", "Review", "Approval", "Disbursement", "Repayment"))
```

### `fin-table(align: center + horizon, headers, rows)`

Financial data table with red header row, alternating row colors, and clean borders. Suitable for product comparisons, pricing tables, and data summaries.

```typst
#fin-table(
  ([Product], [Rate], [Term]),
  (
    ([Working Capital], [3.8%], [12 months]),
    ([Trade Finance], [3.2%], [6 months]),
  ),
)
```

## Theme Entry Point

```typst
#let cmb-bank-theme(
  aspect-ratio: "16-9",    // Slide aspect ratio
  align: horizon,          // Default content-slide alignment
  footer: none,            // Optional footer content
  ..args,                  // Additional Touying config
  body,
)
```

### Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `horizon` | Default vertical alignment for content slides |
| `footer` | `none` | Footer text displayed on content slides |
| `..args` | — | Additional Touying configuration (e.g., `config-info(...)`) |

## Best For

- Banking product introductions and launches
- Financial solution reports and proposals
- Customer case study presentations
- Branch training and onboarding materials
- Quarterly business review decks
- Investor and stakeholder briefings

## Fonts

Fonts are **not** set in `template.typ`. Set a verified font stack in `main.typ` before the `#show: cmb-bank-theme.with(...)` call. The demo uses `("Arial", "Noto Sans SC")` for Latin and Simplified Chinese text.

## Compilation

```bash
cd cmb-bank/
typst compile demo.typ output/slides.pdf
```

## Compatibility

- **Touying**: exactly 0.7.4
- **Typst**: the current SeaSlides toolchain

## License

This theme is provided as-is for presentation use. The design is inspired by China Merchants Bank's brand guidelines but is not officially affiliated with or endorsed by China Merchants Bank.
