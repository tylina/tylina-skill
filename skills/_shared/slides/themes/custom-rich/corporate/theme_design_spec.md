# Corporate Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | corporate |
| **Best For** | Business reports, strategy decks, investor presentations |
| **Style Objective** | Consulting |
| **Complexity Level** | Rich |

## Design Philosophy

A polished, authoritative theme inspired by top-tier management consulting slide decks (McKinsey, BCG). Steel blue tones on clean white/gray backgrounds project credibility, structure, and data-driven rigor. Every element is designed for clarity: rule-based report chrome, alternating-row tables, numbered pillar cards, and KPI metric displays. The layout philosophy favors information density within disciplined visual hierarchy — content is king, and the blue-and-gray palette stays quietly out of the way.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🔵 | Strong Blue | `#1565C0` | `palette.primary` | Header rules, section bands, pillar badges, insight-box accent, data-table header |
| 🔵 | Medium Blue | `#1E88E5` | `palette.secondary` | Section label text, title-slide accent line, subtle highlights |
| 🔵 | Dark Blue | `#0D47A1` | `palette.accent` | Title-slide sidebar, focus-slide background — deepest blue |
| ⚪ | Off-White | `#FAFAFA` | `palette.bg` | Page background — barely-there warmth |
| ⚪ | White | `#FFFFFF` | `palette.card-bg` | Card backgrounds, table cells, title-slide right panel |
| ⚪ | Light Gray | `#F5F5F5` | `palette.gray-light` | Alternating table rows |
| 🩶 | Medium Gray | `#BDBDBD` | `palette.gray-medium` | Card/table border strokes (lightened 40%) |
| ⚫ | Near Black | `#212121` | `palette.text-dark` | Primary text — headings, body copy |
| 🩶 | Dark Gray | `#616161` | `palette.text-light` | Secondary text — subtitles, institution, labels |
| 🟢 | Success Green | `#2E7D32` | `palette.success` | Positive KPI trends, upward indicators |
| 🔴 | Danger Red | `#C62828` | `palette.danger` | Negative KPI trends, downward indicators |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (`#1565C0`) | Theme accent, `alert()` text, header rules |
| `neutral-lightest` | `white` | Light text on blue backgrounds |
| `neutral-darkest` | `palette.text-dark` (`#212121`) | Dark text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Text Color** | `palette.text-dark` (`#212121`) — near black |
| **Font Ownership** | Not set in the reusable template; the deck entry owns the font stack |
| **Demo Font Stack** | `Arial`, then `Noto Sans SC` for CJK fallback (both verified installed) |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Split layout with zero margin — no header/footer
- **Left Sidebar** (~35% width): Filled with dark blue (`palette.accent`, `#0D47A1`). Title (2em, bold, white) and subtitle (1em, white) are left-aligned and vertically centered. Inset x 1.5em, y 2em
- **Right Panel** (~65% width): White (`palette.card-bg`). Author (1.1em, semibold, dark text), institution (0.9em, `text-light`), and date (0.9em, `text-light`) are left-aligned and vertically centered. A small medium-blue accent bar (4em wide, 4pt, rounded) sits at the bottom
- **Mood**: Split corporate card — dark authority on the left, clean data on the right

### Section Slide (`new-section-slide`)

- **Background**: Default off-white (`palette.bg`), zero margin, no header/footer
- **Top Accent**: Full-width blue band (6pt, `palette.primary`)
- **Content**: Left-padded (3em). "Section" label in medium blue (`palette.secondary`), 0.9em, bold, small-caps, with letter-spacing 0.1em. Below it, a small blue bar (3em × 3pt, rounded). Then the section heading at 2em, semibold, near-black
- **Bottom Accent**: Full-width blue band (6pt, `palette.primary`)
- **Mood**: Structured, editorial section break with consulting-style typography

### Content Slide (`slide`)

- **Background**: Off-white (`palette.bg`)
- **Header**: Dark semibold slide title at 1.3em followed by a precisely spaced two-segment blue rule. This replaces the generic full-width color bar with consulting-style report chrome.
- **Footer**: Three-part grid with custom footer on the left, a short blue rule in the center, and page counter `"N / M"` on the right, all in dark gray (`palette.text-light`) at 0.7em
- **Persistent Atmosphere**: Four faint report-index ticks sit at the outer right edge of the body area on every ordinary content slide; they stay behind content and do not affect flow
- **Content Area**: Margins top 3em / bottom 1.5em / x 2em

### Focus Slide (`focus-slide`)

- **Background**: Dark blue (`palette.accent`, `#0D47A1`) — full page fill, no header/footer
- **Text**: White, 2em, semibold, centered inside a full-width block with 1em horizontal inset
- **Margin**: 2em all sides
- **Purpose**: Executive emphasis — deep blue authority

### Ending Slide (`ending-slide`)

- **Background**: Strong blue (`palette.primary`, `#1565C0`) — full page fill, no header/footer
- **Layout**: Centered vertically and horizontally
- **Decoration**: Two subtle horizontal bars (5em × 3pt, white at 50% transparency, rounded) — one above and one below the text
- **Text**: White, 2.4em, bold
- **Mood**: Confident, polished close — blue immersion with translucent accent lines

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| KPI Card | `kpi-card(label, value, trend: none, trend-color: none)` | White card with subtle gray border and 6pt corners. Value (1.55em), label (0.72em), optional trend, and terminal flexible space form one centered `stack`; no `v()` appears between KPI internals. Use one direct card per `cols(lazy-layout: true)` column. |
| Insight Box | `insight-box(title, body)` | Full-width box with blue-tinted fill (`palette.primary` lightened 92%) and a 4pt left border in strong blue. Bold blue title (0.95em), body text in dark gray (0.85em). Right-side rounded corners (6pt). Ideal for executive summaries. |
| Series Key | `series-key(label, color: palette.primary)` | Compact horizontal chart key with a 16pt × 12pt rounded color swatch and a 0.8em secondary label. Encapsulates chart-legend styling so demo content stays palette-driven. |
| Data Table | `data-table(align: center + horizon, headers, rows)` | Styled table with blue header row (`palette.primary` fill, white bold text). Body rows alternate between white and light gray (`palette.gray-light`). Subtle gray cell borders (0.5pt). Text at 0.85em; callers can override per-column alignment. |
| Pillar Card | `pillar-card(number, title, description)` | White card with gray border, rounded corners (6pt). A single `stack` holds a blue circular number badge, semibold title, description, and terminal `lazy-v(1fr)`. Use one direct card per `cols(lazy-layout: true)` column for equal-height pillars or phases. |

## Best Use Cases

- Quarterly business reviews and board presentations
- Management consulting deliverables
- Investor decks and fundraising presentations
- Strategic planning and roadmap presentations
- Executive briefings and C-suite reports
- Financial analysis and performance summaries

## Recommended Complexity

**Rich** — The Corporate theme is built for information-dense, structured slides. Combine direct `kpi-card` children in `cols(lazy-layout: true)` for dashboard-style KPI pages, use `data-table` for financial comparisons, arrange direct `pillar-card` children in lazy columns for equal-height strategic frameworks, and anchor key findings with intrinsic-height `insight-box` callouts. Use ordinary `cols` for chart/table plus narrative pairings, and reserve `grid` for true matrices. The restrained color palette ensures that even complex multi-component slides remain visually coherent and professional.
