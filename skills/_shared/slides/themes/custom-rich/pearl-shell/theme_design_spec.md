# Pearl Shell Theme — Design Specification

## Concept

Mother-of-pearl iridescence — soft opalescent colors on luminous white. The visual world of an ocean-polished shell interior: pearlescent surfaces that shift between lavender, soft rose, and pale aqua. Sophisticated, modern, and business-suitable.

## Color System

| Token | Hex | Role |
|-------|-----|------|
| Background | `#FDFCFE` | Pearl white with faint lavender cast |
| Primary | `#6B5B8A` | Soft violet/amethyst — headers, accents, primary actions |
| Secondary | `#B07A8A` | Pearl rose — warmth, highlights, secondary elements |
| Tertiary | `#5A8B8B` | Opal aqua/teal — data, tertiary accents, freshness |
| Text Dark | `#2D2640` | Deep violet-charcoal — slide titles, emphasis |
| Text Body | `#4A4260` | Soft dark purple — body text, readable paragraphs |
| Card BG | `#FFFFFF` | Pure white for card surfaces |
| Border | `#E0D8EC` | Lavender — card borders, table lines |
| Nacre | `#F5F0F8` | Mother-of-pearl fill — callout backgrounds |

## Typography

- Base size: 18pt (set in theme entry)
- Fonts: Set by user in demo/presentation file (not theme)
- Title slides: 2.4em bold, text-dark color
- Slide headers: 1.3em bold, text-dark color
- Component titles: 0.88-0.92em bold, accent color
- Body text: 0.82em regular, text-body color
- Tags/labels: 0.75em semibold

## SVG Decorations (4 complex, module-level)

1. **Shell Spiral / Nautilus** (`_shell-spiral-svg`): Golden-ratio spiral with chamber division lines, growth rings, and pearl dots at intersections. 140x140 viewBox, 12+ elements.

2. **Iridescent Wave Curves** (`_nacre-wave-svg`): Full-page flowing nacre pattern with primary curves at bottom, upper shimmer lines, mid-page nacre layers, and scattered pearl dots. 840x474 viewBox, 14+ elements.

3. **Pearl Cluster Dots** (`_pearl-cluster-svg`): Organic grouping of pearl circles with varying sizes, stroke highlights for luster, and accent dots. 80x80 viewBox, 14+ elements.

4. **Shell Contour Shapes** (`_shell-contour-svg`): Organic shell edge forms (bottom-left rising, top-right descending), nacre layer striations, and iridescent specks. 840x474 viewBox, 12+ elements.

### Additional SVGs:
- `_shell-frame-svg`: Decorative border with pearl cluster corners (bookend slides)
- `_nacre-divider-svg`: Iridescent wave divider line with pearl dots
- `_pearl-dot-svg`: Small inline pearl circle with luster highlight
- `_radial-glow-svg`: Concentric soft circles for spotlight effect

## Slide Architecture

### Content Slides
- Background: `#FDFCFE` fill + persistent `_bg-atmosphere` (nacre waves + shell contours via `place()`)
- Header: Bold text-dark title + nacre shimmer underline (130pt)
- Footer: Muted text + pearl trio dot separator + page counter
- Margins: top 4em, bottom 2em, x 2.2em

### Title Slide (Bookend)
- Full shell frame border SVG
- Pearl cluster corners (all four)
- Shell spiral accent (top-right)
- Nacre wave + shell contour atmosphere
- Centered content: title, divider, subtitle, author, institution, date

### Ending Slide (Bookend)
- Matches title slide: same shell frame, same pearl clusters
- Shell spiral centered above closing text
- Pearl trio ornament (primary/secondary/tertiary)
- Creates visual bookending with title slide

### Section Slide
- Deep violet-charcoal background (`#2D2640`)
- Opal aqua nacre wave overlay
- Shell spiral decoration (bottom-right)
- Rose section number + white title + teal divider
- Bottom shimmer accent line

### Focus Slide
- Opal teal background (darkened 10%)
- White nacre wave overlay
- Shell spirals in corners (semi-transparent)
- Inner frame rectangle
- Centered white bold text + rose divider

### Outline Slide
- Pearl white background with atmosphere
- Shell spiral in top-right corner
- Two-column table of contents
- Nacre divider under title

## Component Design Principles

1. **Structural Diversity**: Not all components are block(fill, stroke). Includes:
   - SVG-decorated (`pearl-box`, `spotlight-card`, `shell-divider`)
   - Borderless (`wave-note`)
   - Tag/badge (`pearl-tag`)
   - Divider (`shell-divider`)
   - Table (`comparison-table`)
   - Grid (`collection-grid`)
   - Stack-based headers (`campaign-card`, `pearl-box`)

2. **Height Equalization**: All card components end with `lazy-v(1fr)` for equal heights in `cols`.

3. **Stack Pattern**: Adjacent colored blocks (header + body) use `stack(spacing: 0pt)` to avoid gaps.

4. **SVG Integration**: Components like `pearl-box` and `spotlight-card` embed SVG decorations inline.

## Visual Hierarchy

1. Title/Ending: Maximum decoration (frame + clusters + spiral + atmosphere)
2. Section: High decoration (full bg color + wave + spiral)
3. Focus: Medium decoration (teal bg + white overlay + frame)
4. Content: Subtle decoration (atmosphere only, no competing elements)

## Business Suitability

- Clean, professional layout with generous white space
- Soft, non-distracting background patterns
- High text contrast on light backgrounds
- Structured components for data presentation
- Muted opalescent palette avoids garish colors
- Suitable for: beauty/cosmetics, wellness brands, fashion houses, creative agencies, luxury hospitality, spa/wellness retreats, jewelry/accessories, premium consumer goods

## Technical Implementation

- Touying 0.7.4 `touying-slides.with(config-*(...))` pattern
- `std.align` used inside slide functions (avoids shadowing)
- No `height: 100%` in flow containers
- `image(bytes(svg-string), ...)` for all SVG rendering
- SVGs defined at module level using triple-backtick `.text` syntax
- `config-store` for title and footer state management
