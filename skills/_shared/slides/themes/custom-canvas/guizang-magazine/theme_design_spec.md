# Guizang Magazine Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
|---|---|
| Theme name | `guizang-magazine` |
| Best for | Editorial content, cultural commentary, research essays, literary reviews |
| Style objective | Editorial magazine / E-ink |
| Complexity | Canvas |
| Entry point | `magazine-theme` |

The theme creates a restrained editorial world from a two-tone ink/paper system. Its identity comes from light display typography, registration marks, wide margins, rules, ghost folios, and alternating paper/ink pages—not generic UI cards.

## II. Design Principles

- **Restraint over spectacle**: every visible color derives from one ink/paper pair.
- **Structure over decoration**: rules, alignment, and whitespace establish hierarchy.
- **Persistent atmosphere**: content, dark, stat, section, and focus slides retain a faint full-page editorial registration grid.
- **Bookending**: cover and ending pages share a percentage-based hairline frame not used on content slides.
- **Inverse weight hierarchy**: text at 28pt and above uses light weight (`300`); compact labels may use medium or bold weight.
- **Font ownership**: `template.typ` sets no font family. `demo.typ` / `main.typ` selects verified installed fonts.

## III. Palette

### Presets

| Preset | Ink | Paper | Character |
|---|---|---|---|
| `monocle` | `#0A0A0B` | `#F1EFEA` | Classic black editorial |
| `indigo` | `#0A1F3D` | `#F1F3F5` | Cool research blue |
| `forest` | `#1A2E1F` | `#F5F1E8` | Botanical green |
| `kraft` | `#2A1E13` | `#EEDFC7` | Artisanal brown |
| `dune` | `#1F1A14` | `#F0E6D2` | Warm literary neutral |

### Derived tokens

| Token | Derivation | Role |
|---|---|---|
| `ink-light` | ink, 40% transparent | Secondary body text |
| `ink-faint` | ink, 80% transparent | Decorative rules and frame |
| `ink-muted` | ink, 35% transparent | Text-safe kicker labels |
| `meta-color` | ink, 35% transparent | Small metadata and page chrome |

The faint tokens are decorative only. Small text uses `ink-muted`, `meta-color`, or the corresponding paper tone to preserve readable contrast.

## IV. Typography

### Size scale

| Token | Size | Usage |
|---|---:|---|
| `display` | 44pt | Cover / primary claim |
| `h2` | 20pt | Pull quotes / secondary title |
| `lead` | 16pt | Component headings |
| `body` | 14pt | Component body |
| `kicker-size` | 9pt | Labels |
| `meta-size` | 8pt | Chrome |

The demo uses stacks verified on the review host:

```typst
#let display-font = ("Libertinus Serif", "Noto Serif SC", "Songti SC")
#let body-font = ("IBM Plex Sans", "PingFang SC")
#let meta-font = ("IBM Plex Mono", "PingFang SC")
#set text(font: display-font, size: 18pt)
```

These names belong in the document, not the reusable theme. Verify replacements with `typst fonts` on other systems. Canvas-level body or metadata text may opt into `body-font` / `meta-font` inline.

## V. Layout System

### Page configuration

- Paper: `"presentation-" + aspect-ratio`
- Default content margin: top `7em`, bottom `1.3em`, horizontal `2em`
- Dark/stat margin: top `1.9em`, bottom `1.2em`, horizontal `2em`
- Footer: measured `grid(columns: (1fr, auto, 1fr))`
- Content header: one `stack(spacing: .8em, metadata, title, rule)`
- Alignment: stored in `config-store` and applied with `std.align`

### Semantic rules

- `stack(spacing:)` owns repeated vertical rhythm in headers, quotes, stats, pillars, and ending-page content.
- `cols` owns semantic columns and comparisons.
- `grid` owns regular matrices only.
- `cols(lazy-layout: true)` is valid only when each column contains one direct flexible component and the group is bounded and final in its content region.
- Full-size patterns use `height: 100%` only inside `place()`.
- The registration-grid SVG is placed before body content and therefore remains below titles, bodies, and footers.

## VI. Atmosphere and Signature Elements

The full-page registration SVG contains vertical/horizontal guide lines, corner crop marks, and registration dots with varied opacity. It appears subtly on every ordinary content surface, including inverted dark pages. It is identifiable after text removal without competing with the content.

Cover and ending pages use `_bookend-frame`: a centered `rect(width: 96%, height: 94%)` with a faint ink stroke. This percentage-based frame supports both page ratios and gives the deck a clear opening/closing gesture.

## VII. Slide Types

### `slide(title: auto, align: auto, ..args)`

Default light content slide. The header includes metadata, title, and rule in one stack. The footer includes the magazine label, a boxed center dot, and page number.

### `dark-slide(...)`

Inverted editorial page with optional ghost text and custom left/right header labels. It applies the dark grid atmosphere before the ghost mark and body.

### `stat-slide(...)`

Inverted data page with a 38pt light-weight title, optional kicker, and a body intended for `stat-block` columns. Its public `align` argument updates stored alignment.

### `title-slide(bg-image: none, ..args)`

Information-driven cover with optional full-bleed image/scrim, ghost `M`, and the bookend frame.

### `new-section-slide(self: none, body)`

Framework-compatible section renderer triggered by `= Heading`; it preserves the `self` argument required by Touying's section-slide hook. It combines the section label, heading, and rule with a stack between intentional flexible alignment spacers.

### `focus-slide(body)`

Centered synthesis slide with an 80%-width body constraint, ghost quotation mark, and persistent grid.

### `ending-slide(body)`

Closing page sharing the cover frame, top/bottom rules, ghost `FIN`, and centered magazine label.

## VIII. Components

### Decorative primitives

- `editorial-num(n, size: 48pt, opacity: 50%, pal: palette)`
- `kicker(body, pal: palette)`
- `gold-rule(width: 40pt, pal: palette)`

These are small theme-world decorations rather than layout wrappers.

### `pull-quote(body, cite: none, inverted: false, pal: palette)`

Left-rule quotation using one stack for quote and optional attribution. `inverted` selects paper-safe colors for dark pages.

### `stat-block(label, value, description: none, number-size: 52pt, inverted: false, pal: palette)`

One direct stack contains label, value, optional description, and trailing `lazy-v(1fr)`. It contains no `v()` calls. This component is intentionally left-aligned because the editorial sequence is label → value → annotation; it is not an icon → value → label KPI tile. The demo verifies short/long values plus Latin/CJK annotations in three direct lazy columns.

### `pillar-card(number, title, body, pal: palette)`

Top-rule sequence column. The number, title, body, and trailing `lazy-v(1fr)` are direct stack children. Use exactly one per lazy column.

### `comparison-column(label: none, strong: false, pal: palette, body)`

Decorative content lane with a strong or faint left rule. It does not reimplement a column system; callers compose it with native `cols`.

## IX. Removed APIs

- `compare-slide` duplicated generic two-column layout. It was replaced by `comparison-column` plus `cols`.
- `chrome-bar` and `foot-bar` duplicated internal page chrome.
- `ghost-text` duplicated the ghost parameters on dark/stat slides.
- `scrim-overlay` duplicated title-slide behavior and used an unbounded in-flow `height: 100%` container.
- `info-card`, `insight-card`, and `image-frame` were generic, undocumented by rendered coverage, and did not strengthen the magazine metaphor.

The public surface now matches the demo and documentation.

## X. Demo Coverage

`demo.typ` intentionally renders nine pages:

1. Cover
2. Dark claim
3. Stat slide with varied metric lengths
4. Three lazy pillar columns
5. Semantic comparison lanes
6. Automatic section divider
7. Expanded semantic comparison
8. Focus synthesis
9. Ending bookend

Every retained slide type/component is exercised directly or internally, except the asset-dependent `title-slide(bg-image:)` variant. Every page has a speaker note. The physical page-count increase from the eight-page baseline is the explicit focus synthesis on page 8, not continuation overflow.
