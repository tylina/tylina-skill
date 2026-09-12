# Vinyl Groove Theme -- Design Specification

## 1. Visual Identity

**Metaphor**: Vinyl records and analog audio -- the warm imperfection of analog sound, record grooves seen under a microscope, album cover art aesthetics of the 1970s.

**Mood**: Warm, textured, slightly retro but elevated. Like being inside a record store at night -- amber light, worn wood shelves, the smell of cardboard sleeves.

**Key Principles**:
- Warm dark theme (brown-dark, NOT cold/blue-dark)
- 70s typography influence: bold condensed sans, generous tracking on small text
- Grooves SVG as HERO element: large, atmospheric, behind title/ending slides
- Orange accent used BOLDLY: the "record label" pop of color
- Album cover composition: asymmetric, editorial, not corporate

## 2. Color Palette

### Primary Preset: "vinyl"

| Role | Hex | Name | Usage |
|------|-----|------|-------|
| Background | #1C1916 | Dark vinyl black-brown | Page fill, main background |
| Ink | #F5E6D3 | Aged paper/sleeve cream | Primary text, headings |
| Accent | #E85D04 | Orange label | Key highlights, tags, active states |
| Secondary | #7B2CBF | Deep purple (psychedelia) | Supporting accents, alt highlights |
| Surface | #2A2420 | Dark sleeve | Card fills, panels |

### Derived Colors (via build-palette)

- ink-dim (25% transparent) -- secondary text
- ink-muted (40% transparent) -- readable tertiary text
- ink-faint (72%) -- borders, subtle rules
- ink-ghost (92%) -- ghost decorative text
- accent-dim/muted/faint/ghost -- accent variants
- secondary-dim/muted/faint -- purple variants
- accent-text / secondary-text -- contrast-safe variants for small labels on dark surfaces
- surface-light/dark -- panel variants
- meta-color (35% transparent ink) -- readable footer/chrome

### Alternate Presets

| Preset | Mood | Accent | Secondary |
|--------|------|--------|-----------|
| cassette | Tape warmth | #D4A017 (gold) | #8B4513 (saddle brown) |
| hi-fi | Modern electronics | #FF3B30 (red) | #00C7BE (teal) |

## 3. Typography

| Level | Size | Weight | Tracking | Usage |
|-------|------|--------|----------|-------|
| Display | 42pt | Bold (700) | normal | Cover title |
| H1 | 30pt | Bold (700) | normal | Section titles |
| H2 | 22pt | Bold (700) | normal | Slide titles (in header) |
| Body | 16pt | Regular (400) | normal | Paragraphs, bullets |
| Small | 12pt | Regular/Bold | 0.8pt | Captions, component headers |
| Tiny | 9pt | Medium (500) | 0.8-1.5pt | Labels, tags, mono content |
| Meta | 7.5pt | Medium | 1-2pt | Footer, timestamps, fine print |

**Demo font stack**: "Avenir Next", "Arial Unicode MS" (verified on the review host and set in demo/main, never in the theme entry point)
**Mono font**: "DejaVu Sans Mono" (verified on the review host; used only for labels, metadata, and technical readouts)

The theme entry point is font-agnostic: downstream decks may substitute another verified document font without changing the palette or component geometry.

## 4. Layout Parameters

| Parameter | Value |
|-----------|-------|
| Page format | 16:9 (841.89pt x 473.56pt) |
| Content margins | top: 4em, bottom: 1.5em, x: 2em |
| Dark slide margins | top: 3em, bottom: 1.2em, x: 2.5em |
| Header inset | x: 2em, top: 0.7em |
| Footer inset | x: 2em, y: 0.3em |
| Card inset | x: 1.2em, y: 0.8-1em |
| Column gutter | 12-24pt |

## 5. SVG Decorations

### vinyl-grooves (HERO)
Concentric circles with slight wobble using cubic bezier arcs (not perfect circles). 7 rings + center spindle. Used large on title/ending slides, subtle on content slides.

### tone-arm
Angular line from pivot point (top-right) to headshell (bottom-left). Pivot circle, arm stroke, headshell shape.

### waveform
Audio waveform bars at varying heights (30 bars). Rounded rect bars with opacity variation for depth.

### spindle-hole
Concentric circles of varying radii and stroke weights, representing the center label of a record.

### music-note
Simple eighth note silhouette: oval head, stem, flag.

## 6. Components

| Component | Visual Description |
|-----------|-------------------|
| sleeve-card | Dark surface fill, left accent border (3pt), tracked uppercase label, body text |
| rpm-stat | One vertical stack with uppercase mono label, horizontal value/unit row, and accent underline; no internal `v()` spacing |
| groove-divider | Triple horizontal lines with center dot accent |
| label-tag | Pill-shaped (radius 10pt), accent fill, tiny white mono text |
| liner-quote | Left border (2pt accent), italic body, credited mono attribution |
| track-panel | Surface panel, numbered list with dot leader and duration, side accent bar |
| vinyl-table | Dark header row, mono text, thin separators |
| channel-meter | Labeled bar with segmented fill (green/orange/red zones) |
| eq-band | One centered stack: number, accent underline, frequency label; no internal `v()` spacing |
| album-card | Surface fill, bottom accent border (2pt), year kicker, title, artist |
| spectrum-bar | Full-width gradient bar (fade-in, solid, fade-out) |

## 7. Slide Types

### title-slide
- Full-bleed dark background
- HERO: Large vinyl-grooves pattern offset right
- Tone arm reaching from top-right
- Asymmetric left-aligned content: label-tag, title, accent bar, subtitle, author
- Waveform at bottom-left
- "33 RPM" detail bottom-right

### new-section-slide
- Full dark background
- Grooves pattern right side
- Ghost section number (140pt, top-right)
- "SIDE" / "TRACK XX" labels
- Left-aligned section title with accent bar
- Note decoration

### slide (content)
- Standard dark background with header/footer
- Subtle groove arcs bottom-right corner
- Small note decoration top-right
- Clean content area
- Footer-left honors the configured `footer` value; the theme name is the fallback

### dark-slide
- Deeper dark (surface-dark fill)
- Custom three-part header with left label, visible slide title, and right label
- Waveform decoration remains above the footer-safe zone
- Scattered groove dots

### focus-slide
- Surface-dark background
- Center: grooves ghost pattern
- Top: waveform decoration
- Corner bracket accents (L-shaped)
- Large centered text

### ending-slide
- Full dark background
- Hero grooves (offset left)
- Tone arm (top-right)
- Ghost "ANALOG" text
- Spindle ornament above title
- Accent bars
- "DROP THE NEEDLE" tagline
- Bottom waveform

## 8. Layout Semantics

- `stack(spacing:)` owns every multi-element vertical component and every demo sequence; fixed `v()` spacers are not used inside components.
- `cols` is reserved for semantic side-by-side narratives such as analog vs digital or descriptive text vs a pipeline. `grid` is reserved for repeated matrices such as 4-up metrics, 3-by-2 production stages, and 7-band EQ controls.
- Reusable height-flexible components retain terminal `lazy-v(1fr)` markers. The demo has no eligible `cols(lazy-layout: true)` case because its columns either contain multiple sequential regions or participate in a true matrix; the markers are inert in those layouts.
- `rpm-stat` and `eq-band` are the only vertical metric/readout components. Neither has an icon-to-value-to-label pattern; both are stack-based and contain no `v()` calls. The demo deliberately varies label and value lengths across Revenue by Format, Record Store Day, and The Collector Economy.
