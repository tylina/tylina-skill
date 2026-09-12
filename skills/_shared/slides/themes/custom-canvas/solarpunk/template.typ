// Solarpunk Theme -- Optimistic green future, organic technology fusion
// Art Nouveau curves meet sustainable engineering. Living architecture.
// Warm golden light, verdant greens, organic shapes growing on every slide.
// The future is GREEN, WARM, and HOPEFUL.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  dawn: (
    bg: rgb("#FDF8F0"), ink: rgb("#1A2A1A"), accent: rgb("#2D8A4E"),
    secondary: rgb("#E8A838"), secondary-text: rgb("#8A5700"),
  ),
  canopy: (
    bg: rgb("#F0F7F2"), ink: rgb("#1B3A2A"), accent: rgb("#1B5E3A"),
    secondary: rgb("#D4A020"), secondary-text: rgb("#765400"),
  ),
  harvest: (
    bg: rgb("#FBF7F0"), ink: rgb("#2A2010"), accent: rgb("#8B6914"),
    secondary: rgb("#5A8A4A"), secondary-text: rgb("#3D652F"),
  ),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let accent = p.accent
  let secondary = p.secondary
  let secondary-text = p.secondary-text
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    secondary-text: secondary-text,
    // Derived from ink
    ink-dim: ink.transparentize(25%),
    ink-muted: ink.transparentize(30%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent (green)
    accent-dim: accent.transparentize(25%),
    accent-muted: accent.transparentize(45%),
    accent-faint: accent.transparentize(75%),
    accent-ghost: accent.transparentize(90%),
    // Derived from secondary (gold)
    secondary-dim: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(75%),
    secondary-ghost: secondary.transparentize(92%),
    // Special
    bg-warm: bg.darken(2%),
    bg-dark: rgb("#1A2A1A"),
    night-text: rgb("#E8F0E8"),
    night-muted: rgb("#A8C6A8"),
    night-accent: rgb("#8BE28B"),
    focus-text: rgb("#F8FFF8"),
    focus-accent: rgb("#FFE28A"),
    meta-color: ink.transparentize(25%),
    glow-gold: rgb("#E8A838").transparentize(70%),
  )
}

// Default palette
#let palette = build-palette("dawn")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 8pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "Menlo"

// =====================================================================
// SVG Definitions
// =====================================================================

// Growing vine -- Art Nouveau style tendril growing up the left margin
// 30+ curved path points, leaves at intervals, varying thickness
#let _growing-vine-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 80 600\"><path d=\"M 35 590 C 33 570 28 555 30 540 C 32 525 38 510 36 495 C 34 480 29 465 31 450 C 33 435 39 420 37 405 C 35 390 28 375 30 360 C 32 345 40 330 38 315 C 36 300 30 285 32 270 C 34 255 41 240 39 225 C 37 210 29 195 31 180 C 33 165 38 150 36 135 C 34 120 30 105 32 90 C 34 75 37 60 35 45 C 33 30 31 20 33 10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2.5\" stroke-linecap=\"round\" opacity=\"0.8\"/><path d=\"M 35 590 C 37 575 42 560 40 545 C 38 530 33 520 35 505 C 37 490 43 478 41 463 C 39 448 34 438 36 423\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" opacity=\"0.5\"/><path d=\"M 30 540 C 22 535 16 530 12 525\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" opacity=\"0.7\"/><path d=\"M 36 495 C 44 488 50 483 56 480\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" opacity=\"0.7\"/><path d=\"M 31 450 C 23 443 17 438 13 434\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" opacity=\"0.7\"/><path d=\"M 38 405 C 46 398 54 394 60 391\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-linecap=\"round\" opacity=\"0.6\"/><path d=\"M 30 360 C 22 353 15 348 10 344\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-linecap=\"round\" opacity=\"0.6\"/><path d=\"M 38 315 C 47 308 54 303 60 300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" stroke-linecap=\"round\" opacity=\"0.5\"/><path d=\"M 32 270 C 24 263 17 258 12 254\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" stroke-linecap=\"round\" opacity=\"0.5\"/><path d=\"M 39 225 C 47 218 55 214 62 211\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" stroke-linecap=\"round\" opacity=\"0.4\"/><path d=\"M 31 180 C 23 173 16 168 10 164\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" stroke-linecap=\"round\" opacity=\"0.4\"/><path d=\"M 36 135 C 44 128 51 124 57 121\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" stroke-linecap=\"round\" opacity=\"0.35\"/><path d=\"M 32 90 C 24 83 18 78 13 74\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" stroke-linecap=\"round\" opacity=\"0.3\"/><ellipse cx=\"10\" cy=\"523\" rx=\"8\" ry=\"5\" fill=\"currentColor\" opacity=\"0.25\" transform=\"rotate(-20 10 523)\"/><ellipse cx=\"58\" cy=\"478\" rx=\"9\" ry=\"5.5\" fill=\"currentColor\" opacity=\"0.22\" transform=\"rotate(15 58 478)\"/><ellipse cx=\"11\" cy=\"432\" rx=\"8\" ry=\"5\" fill=\"currentColor\" opacity=\"0.2\" transform=\"rotate(-25 11 432)\"/><ellipse cx=\"62\" cy=\"389\" rx=\"9\" ry=\"5\" fill=\"currentColor\" opacity=\"0.18\" transform=\"rotate(20 62 389)\"/><ellipse cx=\"8\" cy=\"342\" rx=\"7\" ry=\"4.5\" fill=\"currentColor\" opacity=\"0.16\" transform=\"rotate(-15 8 342)\"/><ellipse cx=\"62\" cy=\"298\" rx=\"8\" ry=\"5\" fill=\"currentColor\" opacity=\"0.14\" transform=\"rotate(18 62 298)\"/><ellipse cx=\"10\" cy=\"252\" rx=\"7\" ry=\"4\" fill=\"currentColor\" opacity=\"0.12\" transform=\"rotate(-22 10 252)\"/><ellipse cx=\"64\" cy=\"209\" rx=\"7\" ry=\"4\" fill=\"currentColor\" opacity=\"0.1\" transform=\"rotate(12 64 209)\"/><ellipse cx=\"8\" cy=\"162\" rx=\"6\" ry=\"3.5\" fill=\"currentColor\" opacity=\"0.09\" transform=\"rotate(-18 8 162)\"/><ellipse cx=\"59\" cy=\"119\" rx=\"6\" ry=\"3.5\" fill=\"currentColor\" opacity=\"0.08\" transform=\"rotate(16 59 119)\"/><ellipse cx=\"11\" cy=\"72\" rx=\"5\" ry=\"3\" fill=\"currentColor\" opacity=\"0.06\" transform=\"rotate(-12 11 72)\"/><circle cx=\"35\" cy=\"590\" r=\"3\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"36\" cy=\"495\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"38\" cy=\"405\" r=\"2\" fill=\"currentColor\" opacity=\"0.25\"/><circle cx=\"38\" cy=\"315\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"39\" cy=\"225\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"36\" cy=\"135\" r=\"1.2\" fill=\"currentColor\" opacity=\"0.1\"/></svg>"

// Sun ray burst -- Radiating golden rays from corner. 14 triangular rays at varying lengths/opacities
#let _sunburst-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><polygon points=\"100,100 95,5 105,5\" fill=\"currentColor\" opacity=\"0.3\"/><polygon points=\"100,100 130,12 140,20\" fill=\"currentColor\" opacity=\"0.25\"/><polygon points=\"100,100 160,35 168,48\" fill=\"currentColor\" opacity=\"0.22\"/><polygon points=\"100,100 182,68 188,82\" fill=\"currentColor\" opacity=\"0.2\"/><polygon points=\"100,100 195,100 195,110\" fill=\"currentColor\" opacity=\"0.18\"/><polygon points=\"100,100 185,135 180,148\" fill=\"currentColor\" opacity=\"0.15\"/><polygon points=\"100,100 165,165 155,175\" fill=\"currentColor\" opacity=\"0.13\"/><polygon points=\"100,100 130,185 120,190\" fill=\"currentColor\" opacity=\"0.12\"/><polygon points=\"100,100 95,195 85,195\" fill=\"currentColor\" opacity=\"0.1\"/><polygon points=\"100,100 60,185 50,178\" fill=\"currentColor\" opacity=\"0.12\"/><polygon points=\"100,100 30,160 25,148\" fill=\"currentColor\" opacity=\"0.15\"/><polygon points=\"100,100 12,125 8,112\" fill=\"currentColor\" opacity=\"0.18\"/><polygon points=\"100,100 5,90 5,80\" fill=\"currentColor\" opacity=\"0.2\"/><polygon points=\"100,100 15,55 22,45\" fill=\"currentColor\" opacity=\"0.22\"/><circle cx=\"100\" cy=\"100\" r=\"12\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"100\" cy=\"100\" r=\"6\" fill=\"currentColor\" opacity=\"0.25\"/><circle cx=\"100\" cy=\"100\" r=\"20\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><circle cx=\"100\" cy=\"100\" r=\"35\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/></svg>"

// Leaf-circuit -- A leaf whose internal veins are circuit board traces (nature+tech fusion)
#let _leaf-circuit-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 120\"><path d=\"M 50 110 C 50 95 45 80 40 65 C 35 50 25 35 30 20 C 35 5 50 2 55 2 C 60 2 75 5 78 20 C 81 35 70 50 65 65 C 60 80 55 95 55 110 Z\" fill=\"currentColor\" fill-opacity=\"0.12\" stroke=\"currentColor\" stroke-width=\"1\" stroke-opacity=\"0.4\"/><path d=\"M 50 108 L 50 85 L 50 60 L 50 35 L 52 15\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-opacity=\"0.5\" stroke-linecap=\"round\"/><path d=\"M 50 85 L 38 72\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" stroke-opacity=\"0.4\" stroke-linecap=\"round\"/><path d=\"M 50 85 L 63 73\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" stroke-opacity=\"0.4\" stroke-linecap=\"round\"/><path d=\"M 50 60 L 35 48\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" stroke-opacity=\"0.35\" stroke-linecap=\"round\"/><path d=\"M 50 60 L 66 49\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" stroke-opacity=\"0.35\" stroke-linecap=\"round\"/><path d=\"M 50 35 L 38 26\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" stroke-opacity=\"0.3\" stroke-linecap=\"round\"/><path d=\"M 50 35 L 64 27\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" stroke-opacity=\"0.3\" stroke-linecap=\"round\"/><circle cx=\"38\" cy=\"72\" r=\"2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"63\" cy=\"73\" r=\"2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"35\" cy=\"48\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"66\" cy=\"49\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"38\" cy=\"26\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.35\"/><circle cx=\"64\" cy=\"27\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.35\"/><circle cx=\"50\" cy=\"15\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"36\" y=\"70\" width=\"4\" height=\"4\" rx=\"0.5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.3\"/><rect x=\"61\" y=\"71\" width=\"4\" height=\"4\" rx=\"0.5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.3\"/><rect x=\"33\" y=\"46\" width=\"3.5\" height=\"3.5\" rx=\"0.5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.25\"/><rect x=\"64\" y=\"47\" width=\"3.5\" height=\"3.5\" rx=\"0.5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.25\"/></svg>"

// Geodesic dome -- Lightweight triangulated dome outline
#let _geodesic-dome-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 200\"><path d=\"M 20 180 Q 50 160 80 140 Q 110 110 130 80 Q 145 55 150 40 Q 155 55 170 80 Q 190 110 220 140 Q 250 160 280 180\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.4\"/><path d=\"M 40 180 Q 70 155 100 130 Q 125 105 140 75 Q 147 58 150 48 Q 153 58 160 75 Q 175 105 200 130 Q 230 155 260 180\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"20\" y1=\"180\" x2=\"280\" y2=\"180\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.35\"/><line x1=\"60\" y1=\"180\" x2=\"150\" y2=\"40\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><line x1=\"240\" y1=\"180\" x2=\"150\" y2=\"40\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><line x1=\"100\" y1=\"180\" x2=\"130\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.18\"/><line x1=\"200\" y1=\"180\" x2=\"170\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.18\"/><line x1=\"80\" y1=\"140\" x2=\"220\" y2=\"140\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><line x1=\"110\" y1=\"110\" x2=\"190\" y2=\"110\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.18\"/><line x1=\"130\" y1=\"80\" x2=\"170\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/><line x1=\"80\" y1=\"140\" x2=\"130\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/><line x1=\"220\" y1=\"140\" x2=\"170\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/><line x1=\"110\" y1=\"110\" x2=\"80\" y2=\"140\" stroke=\"currentColor\" stroke-width=\"0.25\" opacity=\"0.12\"/><line x1=\"190\" y1=\"110\" x2=\"220\" y2=\"140\" stroke=\"currentColor\" stroke-width=\"0.25\" opacity=\"0.12\"/><circle cx=\"150\" cy=\"40\" r=\"3\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"130\" cy=\"80\" r=\"2\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"170\" cy=\"80\" r=\"2\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"110\" cy=\"110\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.18\"/><circle cx=\"190\" cy=\"110\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.18\"/><circle cx=\"80\" cy=\"140\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"220\" cy=\"140\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.15\"/></svg>"

// Solar cell pattern -- Hexagonal honeycomb array (nature + technology fusion)
#let _solar-cell-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><polygon points=\"50,20 70,10 90,20 90,40 70,50 50,40\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.15\"/><polygon points=\"90,20 110,10 130,20 130,40 110,50 90,40\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.13\"/><polygon points=\"130,20 150,10 170,20 170,40 150,50 130,40\" fill=\"currentColor\" fill-opacity=\"0.03\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.11\"/><polygon points=\"30,50 50,40 70,50 70,70 50,80 30,70\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.14\"/><polygon points=\"70,50 90,40 110,50 110,70 90,80 70,70\" fill=\"currentColor\" fill-opacity=\"0.05\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.16\"/><polygon points=\"110,50 130,40 150,50 150,70 130,80 110,70\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.13\"/><polygon points=\"150,50 170,40 190,50 190,70 170,80 150,70\" fill=\"currentColor\" fill-opacity=\"0.03\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.1\"/><polygon points=\"50,80 70,70 90,80 90,100 70,110 50,100\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.12\"/><polygon points=\"90,80 110,70 130,80 130,100 110,110 90,100\" fill=\"currentColor\" fill-opacity=\"0.05\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.15\"/><polygon points=\"130,80 150,70 170,80 170,100 150,110 130,100\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.5\" stroke-opacity=\"0.12\"/><polygon points=\"30,110 50,100 70,110 70,130 50,140 30,130\" fill=\"currentColor\" fill-opacity=\"0.03\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-opacity=\"0.1\"/><polygon points=\"70,110 90,100 110,110 110,130 90,140 70,130\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-opacity=\"0.12\"/><polygon points=\"110,110 130,100 150,110 150,130 130,140 110,130\" fill=\"currentColor\" fill-opacity=\"0.04\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-opacity=\"0.11\"/><polygon points=\"50,140 70,130 90,140 90,160 70,170 50,160\" fill=\"currentColor\" fill-opacity=\"0.03\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-opacity=\"0.09\"/><polygon points=\"90,140 110,130 130,140 130,160 110,170 90,160\" fill=\"currentColor\" fill-opacity=\"0.03\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-opacity=\"0.1\"/><polygon points=\"130,140 150,130 170,140 170,160 150,170 130,160\" fill=\"currentColor\" fill-opacity=\"0.03\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-opacity=\"0.08\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let growing-vine(color: palette.accent, width: 80pt, height: 600pt) = {
  let svg = _growing-vine-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let sunburst(color: palette.secondary, size: 200pt) = {
  let svg = _sunburst-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let leaf-circuit(color: palette.accent, width: 60pt, height: 72pt) = {
  let svg = _leaf-circuit-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let geodesic-dome(color: palette.accent, width: 300pt, height: 200pt) = {
  let svg = _geodesic-dome-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let solar-cell-pattern(color: palette.secondary, width: 200pt, height: 200pt) = {
  let svg = _solar-cell-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// seed-dot -- Small organic dot (like a seed)
#let seed-dot(color: palette.accent, size: 4pt) = {
  box(circle(radius: size / 2, fill: color))
}

/// glow-dot -- Seed with warm halo
#let glow-dot(color: palette.secondary, size: 6pt) = {
  box(width: size * 2, height: size * 2)[
    #place(center + horizon, circle(radius: size, fill: color.transparentize(75%)))
    #place(center + horizon, circle(radius: size / 2, fill: color))
  ]
}

// =====================================================================
// Background Atmosphere Functions
// =====================================================================

/// _content-atmosphere -- Creates the living world on every content slide
/// 1. Growing vine along left edge at 10% opacity
/// 2. Subtle warm gradient from top (solar warmth)
/// 3. Small leaf-circuit in bottom-right at 6% opacity
#let _content-atmosphere(pal) = {
  // Warm gradient from top -- subtle golden light feeling
  place(top + left,
    block(width: 100%, height: 40%,
      fill: gradient.linear(
        pal.secondary.transparentize(94%),
        pal.bg.transparentize(100%),
        angle: 180deg,
      ),
    ),
  )
  // Growing vine along left edge
  place(top + left, dx: -40pt, dy: -20pt,
    box(width: 50pt, height: 100%, clip: true,
      growing-vine(color: pal.accent.transparentize(88%), width: 50pt, height: 100%),
    ),
  )
  // Small leaf-circuit motif in bottom-right corner
  place(bottom + right, dx: -8pt, dy: -5pt,
    leaf-circuit(color: pal.accent.transparentize(92%), width: 40pt, height: 48pt),
  )
}

/// _section-atmosphere -- Enhanced atmosphere for section slides
#let _section-atmosphere(pal) = {
  // Growing vine at stronger opacity
  place(top + left, dx: -5pt, dy: -10pt,
    box(width: 60pt, height: 100%, clip: true,
      growing-vine(color: pal.accent.transparentize(70%), width: 60pt, height: 100%),
    ),
  )
  // Geodesic dome behind content
  place(center + horizon, dx: 80pt, dy: 20pt,
    geodesic-dome(color: pal.accent.transparentize(80%), width: 280pt, height: 180pt),
  )
  // Warm glow from top-right
  place(top + right, dx: -20pt, dy: -20pt,
    sunburst(color: pal.secondary.transparentize(75%), size: 180pt),
  )
}

// =====================================================================
// Reusable Components
// =====================================================================

/// canopy-card -- Card with organically rounded corners + tiny vine accent
#let canopy-card(title, body) = {
  shadow(dy: 2pt, blur: 5pt, fill: rgb(0, 0, 0, 8%), radius: 12pt,
    block(
      width: 100%,
      stroke: 0.6pt + palette.accent-muted,
      inset: (x: 1em, top: 0.8em, bottom: 0.7em),
      radius: (top-left: 12pt, top-right: 4pt, bottom-left: 4pt, bottom-right: 12pt),
      fill: palette.bg,
    )[
      // Tiny vine accent in top-left corner
      #place(top + left, dx: -4pt, dy: -4pt,
        seed-dot(color: palette.accent, size: 5pt))
      #place(top + left, dx: 2pt, dy: -2pt,
        block(width: 30pt, height: 1.5pt, fill: palette.accent.transparentize(50%)))
      #stack(spacing: .8em,
        [#text(size: typo.body, weight: "bold", fill: palette.ink, title)],
        [#set text(size: 13pt, fill: palette.ink-dim)
         #body
         #lazy-v(1fr)],
      )
    ]
  )
}

/// solar-stat -- Centered icon -> value -> label metric stack
#let solar-stat(label, value, description: none) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em), fill: palette.bg, radius: 6pt)[
    #set std.align(center)
    #stack(spacing: .8em,
      sunburst(color: palette.secondary.transparentize(42%), size: 28pt),
      text(size: 40pt, weight: "bold", fill: palette.ink, value),
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.secondary-text,
        font: _mono-font,
        upper(label),
      ),
      if description != none {
        text(size: 12pt, weight: "regular", fill: palette.ink-dim, description)
      },
      block(width: 30pt, height: 2pt, fill: palette.secondary),
      lazy-v(1fr),
    )
  ]
}

/// seed-quote -- Quote with growing-vine SVG emerging from the left quotation mark
#let seed-quote(body, cite: none) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (left: 2pt + palette.accent),
    inset: (left: 1.4em, right: 1em, y: 0.6em),
    radius: (top-left: 0pt, bottom-left: 0pt, top-right: 8pt, bottom-right: 8pt),
  )[
    // Vine growing from the quotation mark area
    #place(top + left, dx: -18pt, dy: -5pt,
      box(width: 20pt, height: 60pt, clip: true,
        growing-vine(color: palette.accent.transparentize(60%), width: 20pt, height: 60pt)))
    // Large quote mark
    #place(top + left, dx: -6pt, dy: -2pt,
      text(size: 28pt, fill: palette.accent.transparentize(50%), weight: "bold")["])
    #stack(spacing: .8em,
      text(size: typo.body, style: "italic", fill: palette.ink, body),
      if cite != none {
        text(
          size: typo.tiny,
          style: "normal",
          weight: "medium",
          tracking: 1.2pt,
          fill: palette.meta-color,
          font: _mono-font,
          [-- #upper(cite)],
        )
      },
    )
  ]
}

/// biome-box -- Box with hexagonal (solar-cell) top border pattern + rounded bottom
#let biome-box(title, body) = {
  shadow(dy: 2pt, blur: 5pt, fill: rgb(0, 0, 0, 7%), radius: 10pt,
    block(
      width: 100%,
      inset: 0pt,
      radius: 10pt,
      clip: true,
      stroke: 0.4pt + palette.accent-faint,
      fill: palette.bg,
    )[
      #stack(spacing: 0pt,
        // Hexagonal top band
        block(width: 100%, fill: palette.accent-ghost, inset: (x: 0.8em, y: 0.4em))[
          #place(top + right, dx: -2pt, dy: -2pt,
            solar-cell-pattern(color: palette.accent.transparentize(70%), width: 80pt, height: 40pt))
          #text(size: typo.small, weight: "bold", tracking: 0.8pt, fill: palette.accent, font: _mono-font, upper(title))
        ],
        // Body content
        block(width: 100%, inset: (x: 1em, y: 0.6em))[
          #set text(size: 13pt, fill: palette.ink-dim)
          #body
        ],
      )
    ]
  )
}

/// spore-tag -- Organic pill-shaped tag with leaf-green gradient
#let spore-tag(body) = {
  box(
    fill: gradient.linear(palette.accent.transparentize(75%), palette.accent.transparentize(85%), angle: 90deg),
    stroke: 0.4pt + palette.accent-muted,
    inset: (x: 9pt, y: 3.5pt),
    radius: 14pt,
  )[
    #text(size: typo.small, fill: palette.accent, weight: "medium", body)
  ]
}

/// vine-divider -- Horizontal growing vine (NOT a straight line) with leaves
#let vine-divider(total-width: 100%) = {
  block(width: total-width, height: 16pt)[
    // Organic wavy line
    #place(left + horizon,
      box(width: 100%, height: 12pt)[
        #place(left + horizon, dy: 0pt,
          block(width: 100%, height: 1.5pt,
            fill: gradient.linear(
              palette.accent.transparentize(80%),
              palette.accent.transparentize(40%),
              palette.accent.transparentize(40%),
              palette.accent.transparentize(80%),
            )))
      ])
    // Leaf dots along the line
    #place(left + horizon, dx: 15%, seed-dot(color: palette.accent.transparentize(30%), size: 4pt))
    #place(left + horizon, dx: 30%, seed-dot(color: palette.secondary.transparentize(40%), size: 3pt))
    #place(left + horizon, dx: 50%, glow-dot(color: palette.secondary, size: 4pt))
    #place(left + horizon, dx: 70%, seed-dot(color: palette.accent.transparentize(30%), size: 3.5pt))
    #place(left + horizon, dx: 85%, seed-dot(color: palette.accent.transparentize(50%), size: 3pt))
  ]
}

/// solarium-highlight -- Featured content with warm golden glow gradient background
#let solarium-highlight(body) = {
  shadow(dy: 2pt, blur: 5pt, fill: rgb(0, 0, 0, 6%), radius: 8pt,
    block(
      width: 100%,
      fill: gradient.linear(
        palette.bg,
        palette.secondary.lighten(88%),
        palette.bg,
        angle: 90deg,
      ),
      stroke: 0.5pt + palette.secondary-muted,
      inset: (x: 1.2em, y: 0.8em),
      radius: 8pt,
    )[
      // Small sun glow in top-right
      #place(top + right, dx: -5pt, dy: -3pt,
        glow-dot(color: palette.secondary, size: 5pt))
      #set text(size: typo.body, fill: palette.ink)
      #body
    ]
  )
}

/// ecosystem-grid -- Multi-item layout connected by vine-like lines
#let ecosystem-grid(..items) = {
  let item-list = items.pos()
  let n = item-list.len()
  block(width: 100%, inset: (y: 0.3em))[
    #cols(
      lazy-layout: true,
      columns: range(n).map(_ => 1fr),
      gutter: 12pt,
      ..item-list.map(item => {
        shadow(dy: 1pt, blur: 4pt, fill: rgb(0, 0, 0, 6%), radius: 8pt,
          block(
            width: 100%,
            stroke: 0.4pt + palette.accent-faint,
            inset: (x: 0.6em, y: 0.5em),
            radius: (top-left: 8pt, top-right: 3pt, bottom-left: 3pt, bottom-right: 8pt),
            fill: palette.bg,
          )[
            #place(top + left, dx: -3pt, dy: -3pt,
              seed-dot(color: palette.accent, size: 3pt))
            #set text(size: 12pt, fill: palette.ink-dim)
            #item
            #lazy-v(1fr)
          ]
        )
      })
    )
    // Vine connection line below
    #place(bottom + left, dx: 5%, dy: 4pt,
      block(width: 90%, height: 1pt,
        fill: gradient.linear(
          palette.accent.transparentize(90%),
          palette.accent.transparentize(50%),
          palette.accent.transparentize(50%),
          palette.accent.transparentize(90%),
        )))
  ]
}

/// photosynthesis-card -- Card with gradient from green (left) to gold (right)
#let photosynthesis-card(title, body) = {
  shadow(dy: 2pt, blur: 5pt, fill: rgb(0, 0, 0, 7%), radius: 8pt,
    block(
      width: 100%,
      fill: gradient.linear(
        palette.accent.lighten(92%),
        palette.bg,
        palette.secondary.lighten(92%),
        angle: 0deg,
      ),
      stroke: 0.5pt + palette.accent-faint,
      inset: (x: 1em, y: 0.7em),
      radius: 8pt,
    )[
      // Energy flow indicator -- small gradient bar at top
      #place(top + left, dx: 0.5em, dy: -1pt,
        block(width: 50pt, height: 2pt, radius: 1pt,
          fill: gradient.linear(palette.accent, palette.secondary, angle: 0deg)))
      #stack(spacing: .8em,
        [#text(size: typo.body, weight: "bold", fill: palette.ink, title)],
        [#set text(size: 13pt, fill: palette.ink-dim)
         #body
         #lazy-v(1fr)],
      )
    ]
  )
}

/// community-label -- Warm rounded label, like a seed packet or community garden sign
#let community-label(body) = {
  box(
    fill: palette.secondary.transparentize(85%),
    stroke: (
      top: 1.5pt + palette.secondary-muted,
      bottom: 0.5pt + palette.secondary.transparentize(70%),
      left: 0.5pt + palette.secondary.transparentize(70%),
      right: 0.5pt + palette.secondary.transparentize(70%),
    ),
    inset: (x: 10pt, y: 5pt),
    radius: 6pt,
  )[
    #text(size: typo.small, fill: palette.ink, weight: "medium", body)
  ]
}

/// night-card -- Readable bioluminescent card for dark-slide rows
#let night-card(title, body) = {
  block(
    width: 100%,
    fill: palette.bg-dark,
    stroke: 0.6pt + palette.night-accent.transparentize(45%),
    inset: 8pt,
    radius: 8pt,
  )[
    #stack(spacing: .8em,
      text(size: typo.tiny, fill: palette.night-accent, weight: "medium", font: _mono-font, upper(title)),
      text(size: typo.small, fill: palette.night-text, body),
      lazy-v(1fr),
    )
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    // Organic accent -- rounded green bar
    block(width: 50pt, height: 2.5pt, fill: pal.accent, radius: 1.5pt),
  )
}

/// _slide-footer -- Standard footer for content slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 8pt)
  block(width: 100%)[
    #grid(
      columns: (1fr, auto, 1fr),
      {
        set text(font: _mono-font, size: 8pt, tracking: 0.5pt)
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        } else {
          upper[SOLARPUNK]
        }
      },
      // Seed dot as separator
      seed-dot(color: pal.accent-muted, size: 3.5pt),
      {
        set std.align(right)
        set text(font: _mono-font, size: 8pt)
        context [#utils.slide-counter.display()]
      },
    )
  ]
}

/// _dark-header -- Header for dark slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.night-muted, font: _mono-font)
    block(width: 100%)[
      #grid(
        columns: (1fr, 1fr),
        {
          if custom-left != none {
            custom-left
          } else if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        {
          set std.align(right)
          if custom-right != none {
            custom-right
          } else {
            context [#utils.slide-counter.display() / #utils.last-slide-number]
          }
        },
      )
    ]
  }
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.night-muted, size: 8pt)
  block(width: 100%)[
    #grid(
      columns: (1fr, auto, 1fr),
      {
        set text(font: _mono-font, size: 8pt, tracking: 0.5pt)
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        } else {
          upper[SOLARPUNK]
        }
      },
      glow-dot(color: rgb("#66BB66"), size: 3pt),
      {
        set std.align(right)
        set text(font: _mono-font, size: 8pt)
        context [#utils.slide-counter.display()]
      },
    )
  ]
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Content slide with living atmosphere (vine + warmth + leaf-circuit)
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _slide-header(self)
  let footer(self) = _slide-footer(self)
  let setting(body) = {
    // Living atmosphere on every content slide
    _content-atmosphere(pal)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Warm dark (forest at night) with bioluminescent vine
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(custom-left: header-left, custom-right: header-right)
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Ghost text -- large "GROW" at 4% opacity
    place(center + horizon, dy: -10pt,
      text(size: 160pt, weight: "bold", fill: rgb("#44AA44").transparentize(96%))[GROW])
    // Bioluminescent vine (glowing green lines)
    place(top + left, dx: -40pt, dy: -10pt,
      box(width: 45pt, height: 100%, clip: true,
        growing-vine(color: rgb("#66DD66").transparentize(65%), width: 45pt, height: 100%)))
    // Small glowing dots scattered (bioluminescent spores)
    place(top + right, dx: -50pt, dy: 40pt, glow-dot(color: rgb("#88EE88"), size: 3pt))
    place(top + right, dx: -100pt, dy: 60pt, glow-dot(color: rgb("#66CC66"), size: 2pt))
    place(bottom + left, dx: 60pt, dy: -40pt, glow-dot(color: rgb("#88EE88"), size: 2.5pt))
    place(bottom + right, dx: -70pt, dy: -30pt, glow-dot(color: rgb("#66CC66"), size: 2pt))
    set text(fill: pal.night-text)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: rgb("#1A2A1A"),
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Solarpunk city dawn, sun burst, lush vine framing
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Warm background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Warm golden gradient from top
    place(top + left,
      block(width: 100%, height: 50%,
        fill: gradient.linear(
          pal.secondary.transparentize(80%),
          pal.bg.transparentize(100%),
          angle: 180deg,
        )))

    // Sun ray burst from top-right corner
    place(top + right, dx: -20pt, dy: -30pt,
      sunburst(color: pal.secondary.transparentize(40%), size: 220pt))

    // Growing vine along left edge (lush, prominent)
    place(top + left, dx: 5pt, dy: 10pt,
      box(width: 70pt, height: 95%, clip: true,
        growing-vine(color: pal.accent.transparentize(40%), width: 70pt, height: 95%)))

    // Growing vine along right edge (lighter mirror)
    place(top + right, dx: -15pt, dy: 30pt,
      box(width: 50pt, height: 80%, clip: true,
        growing-vine(color: pal.accent.transparentize(70%), width: 50pt, height: 80%)))

    // Solar cell pattern in bottom area
    place(bottom + left, dx: 60pt, dy: -10pt,
      solar-cell-pattern(color: pal.accent.transparentize(75%), width: 180pt, height: 120pt))

    // Organic border frame (asymmetric rounded)
    place(center + horizon,
      rect(width: 92%, height: 88%,
        stroke: 0.8pt + pal.accent-muted,
        radius: (top-left: 20pt, top-right: 6pt, bottom-left: 6pt, bottom-right: 20pt),
        fill: none))

    // Corner seed markers
    place(top + left, dx: 4%, dy: 6%, glow-dot(color: pal.accent, size: 5pt))
    place(top + right, dx: -4%, dy: 6%, seed-dot(color: pal.secondary, size: 4pt))
    place(bottom + left, dx: 4%, dy: -6%, seed-dot(color: pal.secondary, size: 4pt))
    place(bottom + right, dx: -4%, dy: -6%, glow-dot(color: pal.accent, size: 5pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 6em, y: 3em)[
      #stack(spacing: 14pt,
        if info.institution != none {
          text(
            size: typo.tiny,
            weight: "medium",
            tracking: 2pt,
            fill: pal.accent,
            font: _mono-font,
            upper(info.institution),
          )
        },
        text(size: typo.display, weight: "bold", fill: pal.ink, info.title),
        block(width: 180pt, height: 14pt)[
          #place(left + horizon, block(width: 70pt, height: 1.5pt, fill: pal.accent, radius: 1pt))
          #place(center + horizon, seed-dot(color: pal.accent, size: 5pt))
          #place(right + horizon, block(width: 70pt, height: 1.5pt, fill: pal.accent, radius: 1pt))
        ],
        if info.subtitle != none {
          text(size: 18pt, weight: "regular", style: "italic", fill: pal.ink-dim, info.subtitle)
        },
        {
          set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font)
          if info.author != none { upper[#info.author] }
          if info.author != none and info.date != none {
            h(1.5em)
            seed-dot(color: pal.secondary, size: 3pt)
            h(1.5em)
          }
          if info.date != none { utils.display-info-date(self) }
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Geodesic dome + vine atmosphere + section number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Section atmosphere
    _section-atmosphere(pal)

    // Section number with leaf-circuit decoration
    place(top + right, dx: -80pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 100pt, height: 100pt)[
          #place(center + horizon, leaf-circuit(color: pal.accent.transparentize(50%), width: 80pt, height: 96pt))
          #place(center + horizon, text(fill: pal.accent, size: 42pt, weight: "bold", num-str))
        ]
      },
    )

    // Eco coordinate label (decorative)
    place(top + left, dx: 3.5em, dy: 1.5em,
      text(size: 8pt, fill: pal.meta-color, font: _mono-font)[BIOME #context {
        utils.display-current-heading-number(level: 1, numbering: "01")
      } | SOLARPUNK 2060],
    )

    // Top accent line (organic rounded end)
    place(top + left, dx: 3.5em, dy: 3em,
      block(width: 80pt, height: 2pt, fill: pal.accent, radius: 1pt))

    // Bottom accent
    place(bottom + right, dx: -3em, dy: -2em,
      block(width: 60pt, height: 1.5pt, fill: pal.secondary-muted, radius: 1pt))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 8pt, font: _mono-font)[SOLARPUNK],
    )

    // Keep the focal copy in flow so Touying can measure this populated page.
    move(dy: 55pt, pad(left: 4.5em)[
      #block(width: 60%)[
        #stack(spacing: .8em,
          text(
            size: typo.tiny,
            weight: "medium",
            tracking: 1.8pt,
            fill: pal.secondary-text,
            font: _mono-font,
          )[SECTION #context {
            let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
            num-str
          }],
          {
            set text(fill: pal.ink, size: 2.2em, weight: "bold")
            utils.display-current-heading(level: 1, numbered: false)
          },
          block(width: 60pt, height: 2pt, fill: pal.accent, radius: 1pt),
        )
      ]
    ])
  }
  touying-slide(self: self, std.align(left + horizon, main-body))
})

/// focus-slide -- Bold green statement, surrounded by organic energy
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.accent.darken(18%),
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Warm glow from center
    place(center + horizon,
      block(width: 80%, height: 70%,
        fill: gradient.radial(
          pal.secondary.transparentize(80%),
          pal.accent.darken(18%).transparentize(100%),
        )))
    // Vine accents on edges
    place(top + left, dx: 10pt, dy: 10pt,
      box(width: 30pt, height: 80%, clip: true,
        growing-vine(color: rgb("#88DD88").transparentize(70%), width: 30pt, height: 80%)))
    // Scattered seed dots
    place(top + right, dx: -25pt, dy: 20pt, glow-dot(color: rgb("#FFDD66"), size: 4pt))
    place(bottom + left, dx: 30pt, dy: -25pt, glow-dot(color: rgb("#88EE88"), size: 3pt))
    place(top + left, dx: 60pt, dy: 30pt, seed-dot(color: rgb("#AAFFAA").transparentize(50%), size: 2pt))
    place(bottom + right, dx: -40pt, dy: -35pt, seed-dot(color: rgb("#FFEE88").transparentize(40%), size: 3pt))

    set text(fill: pal.focus-text, size: 1.6em, weight: "bold")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[#body]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Bookends with title: vine framing, sun burst, organic border
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Warm golden gradient from top (matching title slide)
    place(top + left,
      block(width: 100%, height: 50%,
        fill: gradient.linear(
          pal.secondary.transparentize(80%),
          pal.bg.transparentize(100%),
          angle: 180deg,
        )))

    // Sun burst from top-right (matching title slide)
    place(top + right, dx: -30pt, dy: -20pt,
      sunburst(color: pal.secondary.transparentize(50%), size: 180pt))

    // Growing vine left edge (matching title slide -- bookending)
    place(top + left, dx: 5pt, dy: 10pt,
      box(width: 60pt, height: 90%, clip: true,
        growing-vine(color: pal.accent.transparentize(50%), width: 60pt, height: 90%)))

    // Growing vine right edge
    place(top + right, dx: -15pt, dy: 40pt,
      box(width: 40pt, height: 70%, clip: true,
        growing-vine(color: pal.accent.transparentize(75%), width: 40pt, height: 70%)))

    // Ghost text -- leaf silhouette feeling
    place(center + horizon,
      text(size: 140pt, weight: "bold", fill: pal.ink.transparentize(96%))[GROW])

    // Organic border frame (matching title slide -- bookending)
    place(center + horizon,
      rect(width: 92%, height: 88%,
        stroke: 0.8pt + pal.accent-muted,
        radius: (top-left: 20pt, top-right: 6pt, bottom-left: 6pt, bottom-right: 20pt),
        fill: none))

    // Corner seed markers (matching title)
    place(top + left, dx: 4%, dy: 6%, glow-dot(color: pal.accent, size: 5pt))
    place(top + right, dx: -4%, dy: 6%, seed-dot(color: pal.secondary, size: 4pt))
    place(bottom + left, dx: 4%, dy: -6%, seed-dot(color: pal.secondary, size: 4pt))
    place(bottom + right, dx: -4%, dy: -6%, glow-dot(color: pal.accent, size: 5pt))

    // Centered content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(spacing: .8em,
        std.align(center, leaf-circuit(color: pal.accent, width: 40pt, height: 48pt)),
        text(size: 2em, weight: "bold", fill: pal.ink, body),
        std.align(center, block(width: 140pt, height: 12pt)[
          #place(left + horizon, block(width: 55pt, height: 1.5pt, fill: pal.accent, radius: 1pt))
          #place(center + horizon, seed-dot(color: pal.accent, size: 4pt))
          #place(right + horizon, block(width: 55pt, height: 1.5pt, fill: pal.accent, radius: 1pt))
        ]),
        text(size: 10pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[THE FUTURE IS GROWING],
      )
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point (MUST BE LAST)
// =====================================================================

#let solarpunk-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "dawn",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
      neutral-lightest: pal.bg,
      neutral-darkest: pal.ink,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
      palette: pal,
    ),
    ..args,
  )

  body
}
