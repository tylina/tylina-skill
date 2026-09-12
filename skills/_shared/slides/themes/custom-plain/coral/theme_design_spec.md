# Coral Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | coral |
| **Best For** | Creative agencies, lifestyle brands, warm-toned presentations |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A warm, vibrant theme built around coral and salmon tones, balanced by a cool teal accent for visual contrast. The design feels energetic yet approachable — gradient header bars, soft decorative circles, and rounded components create a modern, friendly atmosphere. Inspired by startup pitch decks and marketing presentations, it prioritizes visual warmth, metric-driven layouts, and playful tag-based categorization. The coral-to-teal complementary palette ensures content pops without feeling aggressive.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🔴 | Deep Coral Red | `#C43C4A` | `palette.primary` | Main brand color — headers, highlight-box accents, metric values, tags, list bullets |
| 🟠 | Deep Salmon | `#B64F3D` | `palette.secondary` | Gradient partner — header gradients, decorative circles |
| 🔵 | Deep Teal | `#177D78` | `palette.accent` | Complementary contrast — accent variant, ending-slide gradient, contact text |
| 🩷 | Light Pink | `#FFF5F5` | `palette.bg` | Page background — very light pink wash |
| ⚪ | White | `#FFFFFF` | `palette.card-bg` | Card backgrounds, metric-row container |
| ⚫ | Charcoal | `#2D3436` | `palette.dark` | Body text, title text |
| 🩶 | Gray | `#636E72` | `palette.light` | Secondary text, subtitles, footer, metric labels |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (`#C43C4A`) | Theme accent, `alert()` text, header gradient start |
| `neutral-lightest` | `white` | Light text on coral/gradient backgrounds |
| `neutral-darkest` | `palette.dark` (`#2D3436`) | Dark text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Text Color** | `palette.dark` (`#2D3436`) — charcoal |
| **Font** | Theme remains font-agnostic; demo uses `IBM Plex Sans`, then `Arial` / `Helvetica` fallbacks |
| **List Markers** | Coral filled circles (`palette.primary` + `sym.circle.filled`) |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Light pink (`palette.bg`)
- **Layout**: Centered vertically and horizontally
- **Decorative Elements**: 4 large translucent circles using `place()` — coral circles (80pt, 40pt radius, lightened 60–80%) in top-right, teal circle (60pt radius, lightened 70%) in bottom-left, small coral circle (30pt) also bottom-left. Creates a playful, organic backdrop
- **Title**: 2.4em, bold, charcoal (`palette.dark`)
- **Subtitle**: 1.2em, gray (`palette.light`)
- **Divider**: Coral accent line (30% width, 2.5pt stroke in `palette.primary`)
- **Author**: Semibold, charcoal
- **Institution & Date**: Gray (`palette.light`)
- **Contact**: Displayed in teal (`palette.accent`) if provided

### Section Slide (`new-section-slide`)

- **Background**: Light pink (`palette.bg`)
- **Layout**: Centered vertically and horizontally
- **Decoration Above**: A salmon-tinted line (20% width, 2pt, `palette.secondary` lightened 40%) placed above center
- **Section Title**: 2.2em, bold, coral red (`palette.primary`)
- **Decoration Below**: Teal accent line (15% width, 2pt, `palette.accent`)
- **Mood**: Warm-cool interplay between coral title and teal underline

### Content Slide (`slide`)

- **Background**: Light pink (`palette.bg`)
- **Header**: Full-width block with gradient fill (`palette.primary` → `palette.secondary`, horizontal 0deg). One explicit stack with 0.8em spacing places the section name (0.7em, regular, white) above the slide title (1.35em, semibold, white)
- **Footer**: Padded 0.4em, gray (`palette.light`) at 0.8em. A three-track native grid keeps custom footer content at left and a coral dot plus `N / M` slide counter at right
- **Content Area**: Margins top 4em / bottom 2em / x 2em

### Focus Slide (`focus-slide`)

- **Background**: Diagonal gradient (`palette.primary` → `palette.secondary`, 135deg) — coral-to-salmon sweep
- **Text**: White, 2em, bold, centered
- **Margin**: 2em all sides
- **Purpose**: Warm, energetic emphasis — gradient immersion

### Ending Slide (`ending-slide`)

- **Background**: Diagonal gradient (`palette.primary` → `palette.accent`, 135deg) — coral-to-teal sweep
- **Decorative Elements**: Two translucent white circles (25pt top-left, 35pt bottom-right) at 85% transparency — subtle glass-like accents
- **Text**: White, 2em, bold, centered
- **Mood**: A harmonious coral-to-teal gradient close — the full color palette in one final statement

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Highlight Box | `highlight-box(title, body, variant: "primary")` | Full-width callout with a 3.5pt left border and lightly tinted background (color lightened 88%). Three variants: `"primary"` (coral), `"accent"` (teal), `"neutral"` (gray). Bold title in accent color at 1.05em. Right-side rounded corners (6pt). |
| Metric Row | `metric-row(items)` | Horizontal row of stat items in a white card with coral-tinted border (1pt, `palette.primary` lightened 70%), rounded corners (8pt). Each item uses one centered vertical stack: a large value (1.8em, bold, coral) above a small label (0.8em, gray). Items is an array of dicts with `label` and `value` keys. |
| Tag | `tag(label, color: none)` | Inline badge with a lightened fill (color lightened 80%), subtle border (0.5pt, color lightened 40%), rounded corners (4pt). Text in darkened accent color at 0.8em, medium weight. Defaults to coral primary. |

## Best Use Cases

- Startup pitch decks and investor presentations
- Marketing campaign reviews and creative briefs
- Product launch and feature announcements
- Social media analytics and growth reports
- Team retrospectives and celebration decks

## Layout Semantics

- Sequential regions use native `stack(spacing: ...)`; KPI value-to-label internals are each one centered stack and never use manual `v()` spacers.
- The uniform metric row is a native `grid`. Semantic prose comparisons use native `cols` directly, never a generic two-column wrapper.
- The demo bounds its top-aligned `cols` with a `30em` block because centered Touying slide flow otherwise centers unequal column bodies independently.
- No component uses lazy layout or `height: 100%`. Full-slide decorative `place()` calls are justified page-canvas overlays.
- Header and footer reserve no percentage ascent/descent; their concrete bars and three-track footer own their geometry.

## Recommended Complexity

**Plain** — The Coral theme already supplies enough character through its gradient chrome, metric row, highlight boxes, tags, and decorative circles. Prefer one clear message or one restrained component composition per slide; use richer dashboards only when the content genuinely requires them.
