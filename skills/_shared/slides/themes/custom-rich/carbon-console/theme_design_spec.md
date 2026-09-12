# Carbon Console — Design Specification

## Aesthetic World

"Inside a high-end server rack" — The presentation environment evokes a premium developer workspace where hardware engineering meets modern software. GitHub dark mode color sensibility combined with physical server infrastructure visual language.

## Visual Language

### SVG Elements (4 custom SVGs)
1. **Circuit-trace background** — Persistent atmosphere on all content slides. 12+ paths with nodes at intersections, opacity 0.05-0.15. Horizontal and vertical traces with 90-degree bends. Green primary with occasional amber traces.
2. **Server-panel frame** — Used on title and ending slides as bookend framing. Rectangular with ventilation slot marks (top/bottom), rack screw holes (corners), and LED indicator dots.
3. **Circuit-stat icon** — Small circuit trace and node motif placed above each metric value.
4. **Wire divider** — Horizontal routed signal path with bends and nodes, used instead of a generic rule.

### Typography
- Theme entry: font-agnostic, 18pt base size
- Demo body stack: IBM Plex Sans, with PingFang SC fallback
- Monospace stack: IBM Plex Mono, with DejaVu Sans Mono fallback for code, stats, and terminal elements
- Title: 2.2em bold
- Section numbers: Monospace bold green

### Color System
- Background creates depth with three levels: bg (#1A1B26), card-bg (#21222C), bg-elevated (#282A36)
- Green (#3FB950) signals health, primary actions, active states
- Amber (#D29922) signals warnings, secondary information
- Red (#F85149) signals errors, problems
- Red text (#FF7B72) keeps small error labels above 4.5:1 on tinted card surfaces while decorative error bars retain #F85149
- Soft white (#C9D1D9) for primary text, muted (#8B949E) for secondary

## Component Patterns (7 structural patterns)

1. **console-card** — Card pattern. 3pt top border in accent color creates terminal title bar illusion. Dark card background with subtle border.
2. **circuit-stat** — Stat pattern. One centered `stack(spacing:)` orders circuit icon → monospace value → muted label, followed by one `lazy-v(1fr)` for valid height equalization. No intervening `v()` spacing is used.
3. **stdout-block** — Typography pattern. No border/background, just monospace text with green `$>` prefix. Suggests terminal output.
4. **wire-divider** — Separator pattern. SVG-based circuit trace with signal path bends and node dots. Replaces plain horizontal rules.
5. **status-tag** — Inline tag pattern. Pill-shaped with semantic color coding. Transparentized fill with colored border.
6. **rack-panel** — Section header pattern. Full-width dark strip with monospace green text and block character prefix.
7. **perf-bar** — Data visualization pattern. Horizontal fill bar with label/value, proportional fill based on ratio.

## Layout Guidelines

- Use `cols(lazy-layout: true)` ONLY when each column has exactly ONE component
- Headers use `stack(spacing:)` not `v()`
- Equalizable card components use one terminal `#lazy-v(1fr)` for vertical alignment
- Sequential visual regions use `stack(spacing:)`; two-part label/value rows and terminal prefixes use measured `grid()` layouts
- The three-part footer uses `grid(columns: (1fr, auto, 1fr))`
- Focus slide text width-constrained to 70%
- 4-column stat layouts for metric dashboards
- 2-column code + explanation for implementation slides
