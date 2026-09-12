// Carnival-Rio Theme -- Brazilian Carnival, samba energy, feathers, sequins, explosive color
// Confetti scatter, feather plumes, rhythmic waves, tropical leaves, sequin sparkles
// A joyful eruption of color celebrating Rio's Carnival -- daytime energy on warm white
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  rio: (bg: rgb("#FFFCF5"), ink: rgb("#2D1B0E"), accent: rgb("#FF2D55"), secondary: rgb("#FFD700"), tertiary: rgb("#00C853")),
  copacabana: (bg: rgb("#FFFDF7"), ink: rgb("#1A1A2E"), accent: rgb("#FF6B00"), secondary: rgb("#E91E63"), tertiary: rgb("#00BCD4")),
  samba: (bg: rgb("#FFF8F0"), ink: rgb("#3E2723"), accent: rgb("#9C27B0"), secondary: rgb("#FF2D55"), tertiary: rgb("#FFD700")),
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
  let tertiary = p.tertiary
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    tertiary: tertiary,
    // Ink variants
    ink-dim: ink.transparentize(30%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(92%),
    // Accent variants
    accent-dim: accent.transparentize(25%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(92%),
    // Secondary variants
    secondary-dim: secondary.transparentize(30%),
    secondary-faint: secondary.transparentize(75%),
    secondary-ghost: secondary.transparentize(92%),
    // Tertiary variants
    tertiary-dim: tertiary.transparentize(30%),
    tertiary-faint: tertiary.transparentize(75%),
    tertiary-ghost: tertiary.transparentize(92%),
    // Card backgrounds
    card: rgb("#FFFFFF"),
    card-warm: bg.darken(2%),
    // Shadow
    shadow: rgb("#00000012"),
    shadow-dark: rgb("#00000020"),
    // Meta
    meta-color: ink.transparentize(55%),
    // Dark slide
    dark-bg: rgb("#1A0A1E"),
    dark-ink: rgb("#FFF8F0"),
  )
}

// Default palette
#let palette = build-palette("rio")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 20pt,
  body: 15pt,
  small: 12pt,
  tiny: 9pt,
  meta: 8pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = ("Menlo", "Courier New")
#let _sans-font = ("Arial", "Heiti SC")

// =====================================================================
// SVG Definitions (5 core decorative elements)
// =====================================================================

// 1. CONFETTI SCATTER -- Colorful confetti particles (rectangles, circles, triangles)
// scattered randomly across the viewbox. 30+ elements with varied rotation and opacity.
#let _confetti-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><rect x=\"15\" y=\"20\" width=\"8\" height=\"4\" fill=\"currentColor\" opacity=\"0.7\" transform=\"rotate(25 19 22)\"/><rect x=\"55\" y=\"45\" width=\"6\" height=\"3\" fill=\"currentColor\" opacity=\"0.5\" transform=\"rotate(-15 58 46)\"/><circle cx=\"95\" cy=\"30\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"130\" y=\"15\" width=\"7\" height=\"3\" fill=\"currentColor\" opacity=\"0.4\" transform=\"rotate(40 133 16)\"/><polygon points=\"170,25 174,35 166,35\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"210\" y=\"40\" width=\"9\" height=\"4\" fill=\"currentColor\" opacity=\"0.7\" transform=\"rotate(-30 214 42)\"/><circle cx=\"250\" cy=\"20\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><rect x=\"285\" y=\"35\" width=\"6\" height=\"3\" fill=\"currentColor\" opacity=\"0.6\" transform=\"rotate(55 288 36)\"/><polygon points=\"320,20 325,30 315,30\" fill=\"currentColor\" opacity=\"0.5\"/><rect x=\"355\" y=\"25\" width=\"8\" height=\"3\" fill=\"currentColor\" opacity=\"0.4\" transform=\"rotate(-20 359 26)\"/><circle cx=\"380\" cy=\"45\" r=\"3\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"25\" y=\"80\" width=\"7\" height=\"3\" fill=\"currentColor\" opacity=\"0.5\" transform=\"rotate(35 28 81)\"/><circle cx=\"70\" cy=\"95\" r=\"2\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"110\" y=\"75\" width=\"8\" height=\"4\" fill=\"currentColor\" opacity=\"0.4\" transform=\"rotate(-45 114 77)\"/><polygon points=\"155,90 159,100 151,100\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"195\" y=\"85\" width=\"6\" height=\"3\" fill=\"currentColor\" opacity=\"0.5\" transform=\"rotate(20 198 86)\"/><circle cx=\"235\" cy=\"70\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"270\" y=\"90\" width=\"7\" height=\"3\" fill=\"currentColor\" opacity=\"0.4\" transform=\"rotate(-35 273 91)\"/><polygon points=\"310,75 314,85 306,85\" fill=\"currentColor\" opacity=\"0.5\"/><rect x=\"345\" y=\"80\" width=\"9\" height=\"4\" fill=\"currentColor\" opacity=\"0.7\" transform=\"rotate(50 349 82)\"/><circle cx=\"385\" cy=\"95\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><rect x=\"40\" y=\"140\" width=\"6\" height=\"3\" fill=\"currentColor\" opacity=\"0.6\" transform=\"rotate(-25 43 141)\"/><rect x=\"80\" y=\"155\" width=\"8\" height=\"4\" fill=\"currentColor\" opacity=\"0.4\" transform=\"rotate(30 84 157)\"/><circle cx=\"120\" cy=\"145\" r=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><polygon points=\"160,150 164,160 156,160\" fill=\"currentColor\" opacity=\"0.5\"/><rect x=\"200\" y=\"140\" width=\"7\" height=\"3\" fill=\"currentColor\" opacity=\"0.6\" transform=\"rotate(-40 203 141)\"/><circle cx=\"240\" cy=\"160\" r=\"3\" fill=\"currentColor\" opacity=\"0.4\"/><rect x=\"280\" y=\"145\" width=\"8\" height=\"4\" fill=\"currentColor\" opacity=\"0.7\" transform=\"rotate(15 284 147)\"/><polygon points=\"320,155 324,165 316,165\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"360\" y=\"140\" width=\"6\" height=\"3\" fill=\"currentColor\" opacity=\"0.5\" transform=\"rotate(-50 363 141)\"/></svg>"

// 2. FEATHER PLUME -- Graceful curving feather with barb details (20+ path elements)
// Simulates the ornate headdress plumes worn by samba dancers
#let _feather-plume-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 200\"><path d=\"M60,195 Q58,170 55,150 Q50,120 48,100 Q45,75 50,55 Q55,35 60,20 Q65,5 60,0\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\"/><path d=\"M60,180 Q45,165 40,150 Q35,135 38,120\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.7\"/><path d=\"M60,180 Q75,165 80,150 Q85,135 82,120\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.7\"/><path d=\"M55,150 Q40,140 35,125 Q30,110 33,95\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.6\"/><path d=\"M55,150 Q70,140 75,125 Q80,110 77,95\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.6\"/><path d=\"M50,120 Q35,110 30,95 Q25,80 28,65\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><path d=\"M50,120 Q65,110 70,95 Q75,80 72,65\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><path d=\"M50,95 Q38,85 35,70 Q32,55 38,42\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><path d=\"M50,95 Q62,85 65,70 Q68,55 62,42\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><path d=\"M52,70 Q42,60 40,48 Q38,36 45,25\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.35\"/><path d=\"M52,70 Q62,60 64,48 Q66,36 60,25\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.35\"/><path d=\"M55,50 Q48,40 50,30 Q52,20 58,12\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><path d=\"M55,50 Q62,40 60,30 Q58,20 60,12\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><ellipse cx=\"60\" cy=\"5\" rx=\"3\" ry=\"5\" fill=\"currentColor\" opacity=\"0.4\"/><path d=\"M48,100 Q42,92 38,80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><path d=\"M48,100 Q54,92 58,80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><circle cx=\"55\" cy=\"140\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"50\" cy=\"110\" r=\"1\" fill=\"currentColor\" opacity=\"0.25\"/><circle cx=\"52\" cy=\"80\" r=\"1\" fill=\"currentColor\" opacity=\"0.2\"/></svg>"

// 3. RHYTHMIC WAVE -- Musical samba rhythm pattern with flowing sine curves and beat dots
// Represents the percussion-driven energy of samba music
#let _rhythm-wave-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 60\"><path d=\"M0,30 C20,10 40,10 60,30 C80,50 100,50 120,30 C140,10 160,10 180,30 C200,50 220,50 240,30 C260,10 280,10 300,30 C320,50 340,50 360,30 C380,10 400,10 400,30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" opacity=\"0.7\"/><path d=\"M0,35 C25,55 45,55 65,35 C85,15 105,15 125,35 C145,55 165,55 185,35 C205,15 225,15 245,35 C265,55 285,55 305,35 C325,15 345,15 365,35 C385,55 400,55 400,35\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.4\"/><circle cx=\"60\" cy=\"30\" r=\"4\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"120\" cy=\"30\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"180\" cy=\"30\" r=\"4\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"240\" cy=\"30\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"300\" cy=\"30\" r=\"4\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"360\" cy=\"30\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"30\" cy=\"20\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"90\" cy=\"40\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"150\" cy=\"20\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"210\" cy=\"40\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"270\" cy=\"20\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"330\" cy=\"40\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><path d=\"M0,30 C10,25 20,20 30,25\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><path d=\"M370,30 C380,35 390,40 400,35\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/></svg>"

// 4. TROPICAL LEAF -- Banana/palm leaf silhouette with veins (15+ elements)
// Captures the lush tropical vegetation of Rio de Janeiro
#let _tropical-leaf-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 150 200\"><path d=\"M75,195 Q72,180 70,160 Q68,140 72,120 Q76,100 75,80 Q74,60 78,40 Q82,20 75,5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\"/><path d=\"M75,5 Q50,20 35,45 Q20,70 25,100 Q30,130 45,150 Q60,170 75,180\" fill=\"currentColor\" opacity=\"0.15\"/><path d=\"M75,5 Q100,20 115,45 Q130,70 125,100 Q120,130 105,150 Q90,170 75,180\" fill=\"currentColor\" opacity=\"0.12\"/><path d=\"M72,120 Q55,115 40,125\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.5\"/><path d=\"M72,120 Q89,115 105,125\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.5\"/><path d=\"M74,100 Q58,95 42,102\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.45\"/><path d=\"M74,100 Q90,95 108,102\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.45\"/><path d=\"M75,80 Q60,75 45,82\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.4\"/><path d=\"M75,80 Q90,75 105,82\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.4\"/><path d=\"M76,60 Q63,56 50,62\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.35\"/><path d=\"M76,60 Q89,56 100,62\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.35\"/><path d=\"M77,40 Q67,37 57,42\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><path d=\"M77,40 Q87,37 95,42\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><path d=\"M76,20 Q70,18 65,22\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><path d=\"M76,20 Q82,18 88,22\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/></svg>"

// 5. SEQUIN SPARKLE -- Starburst/glitter pattern with radiating lines and diamonds
// Represents the shimmering sequins on Carnival costumes
#let _sequin-sparkle-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><polygon points=\"50,5 53,40 60,10 54,42\" fill=\"currentColor\" opacity=\"0.7\"/><polygon points=\"50,5 47,40 40,10 46,42\" fill=\"currentColor\" opacity=\"0.7\"/><polygon points=\"95,50 60,53 90,60 58,54\" fill=\"currentColor\" opacity=\"0.7\"/><polygon points=\"5,50 40,53 10,60 42,54\" fill=\"currentColor\" opacity=\"0.7\"/><polygon points=\"50,95 53,60 60,90 54,58\" fill=\"currentColor\" opacity=\"0.7\"/><polygon points=\"50,95 47,60 40,90 46,58\" fill=\"currentColor\" opacity=\"0.7\"/><polygon points=\"85,15 55,45 80,20 54,46\" fill=\"currentColor\" opacity=\"0.5\"/><polygon points=\"15,15 45,45 20,20 46,46\" fill=\"currentColor\" opacity=\"0.5\"/><polygon points=\"85,85 55,55 80,80 54,54\" fill=\"currentColor\" opacity=\"0.5\"/><polygon points=\"15,85 45,55 20,80 46,54\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"50\" cy=\"50\" r=\"5\" fill=\"currentColor\" opacity=\"0.9\"/><circle cx=\"50\" cy=\"50\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><circle cx=\"50\" cy=\"50\" r=\"12\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let confetti-scatter(color: palette.accent, width: 100%, height: 100%) = {
  let svg = _confetti-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let feather-plume(color: palette.accent, width: 80pt, height: 140pt) = {
  let svg = _feather-plume-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let rhythm-wave(color: palette.secondary, width: 100%, height: 40pt) = {
  let svg = _rhythm-wave-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let tropical-leaf(color: palette.tertiary, width: 90pt, height: 120pt) = {
  let svg = _tropical-leaf-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let sequin-sparkle(color: palette.secondary, size: 40pt) = {
  let svg = _sequin-sparkle-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

// =====================================================================
// Background Atmosphere (PERSISTENT on every content slide)
// =====================================================================

/// _bg-atmosphere -- Creates the carnival world on EVERY content slide.
/// Subtle confetti particles + tropical leaf corner + faint rhythm wave at bottom.
#let _bg-atmosphere(pal) = {
  // 1. Confetti scatter across full slide (very subtle)
  place(top + left,
    box(width: 100%, height: 100%,
      confetti-scatter(color: pal.accent.transparentize(88%), width: 100%, height: 100%)))
  // 2. Second confetti layer in complementary color
  place(top + left,
    box(width: 100%, height: 100%,
      confetti-scatter(color: pal.secondary.transparentize(90%), width: 100%, height: 100%)))
  // 3. Tropical leaf in bottom-right corner (signature persistent element)
  place(bottom + right, dx: -8pt, dy: 15pt,
    tropical-leaf(color: pal.tertiary.transparentize(85%), width: 65pt, height: 88pt))
  // 4. Faint rhythm wave at very bottom
  place(bottom + left, dy: -2pt,
    rhythm-wave(color: pal.accent.transparentize(92%), width: 100%, height: 18pt))
}

// =====================================================================
// Reusable Components (10 structurally diverse)
// =====================================================================

/// samba-card -- Card with SEQUIN SPARKLE border accents and vivid top stripe
#let samba-card(title, body, accent: palette.accent) = {
  let pal = palette
  shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 10%), radius: 5pt)[
    #block(
      width: 100%,
      fill: pal.card,
      radius: 5pt,
      clip: true,
      stroke: 0.5pt + accent.transparentize(60%),
    )[
      // Vivid accent stripe at top
      #block(width: 100%, height: 5pt, fill: accent)
      // Sequin sparkle in top-right corner
      #place(top + right, dx: -4pt, dy: 6pt,
        sequin-sparkle(color: accent.transparentize(60%), size: 22pt))
      // Content
      #block(width: 100%, inset: (x: 1em, top: 0.8em, bottom: 0.8em))[
        #stack(spacing: .8em,
          text(size: typo.body, weight: "bold", fill: pal.ink, title),
          [
            #set text(size: 13pt, fill: pal.ink-dim, font: _sans-font)
            #body
            #lazy-v(1fr)
          ],
        )
      ]
    ]
  ]
}

/// float-stat -- Large colorful number on a carnival float-inspired pedestal
#let float-stat(label, value, description: none, accent: palette.accent) = {
  let pal = palette
  block(width: 100%, fill: pal.card, inset: (x: 0.6em, y: 0.6em), radius: 5pt,
    stroke: 0.5pt + accent.transparentize(70%))[
    #stack(spacing: .8em,
      // Kicker label
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: accent,
        font: _mono-font,
        upper(label),
      ),
      stack(spacing: 0.8em,
        // Giant colorful number
        text(size: 38pt, weight: "bold", fill: accent, value),
        // Rhythm wave underline for the number
        box(width: 80%, height: 10pt,
          rhythm-wave(color: accent.transparentize(50%), width: 80%, height: 10pt)),
        if description != none {
          text(size: 12pt, fill: pal.ink-muted, font: _sans-font, description)
        },
        lazy-v(1fr),
      ),
    )
  ]
}

/// rhythm-divider -- Musical wave pattern divider (NOT a straight line)
#let rhythm-divider(color: palette.accent) = {
  block(width: 100%, height: 28pt)[
    #place(left + horizon,
      rhythm-wave(color: color, width: 100%, height: 24pt))
  ]
}

/// plume-highlight -- Feathered accent highlight box with plume decoration
#let plume-highlight(body, accent: palette.accent) = {
  let pal = palette
  block(width: 100%, inset: (y: 6pt))[
    // Feather plume on the left
    #place(left + top, dx: -8pt, dy: -8pt,
      feather-plume(color: accent.transparentize(50%), width: 35pt, height: 60pt))
    // Content with left inset to clear plume
    #block(width: 100%, fill: accent.lighten(88%), inset: (left: 2.5em, right: 1em, y: 0.8em),
      radius: 4pt, stroke: (left: 3pt + accent))[
      #set text(size: typo.body, fill: pal.ink, font: _sans-font)
      #body
    ]
  ]
}

/// confetti-box -- Celebration callout with confetti burst accent
#let confetti-box(title, body, accent: palette.secondary) = {
  let pal = palette
  shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: rgb(0, 0, 0, 8%), radius: 4pt)[
    #block(
      width: 100%,
      fill: accent.lighten(85%),
      inset: (x: 1.2em, y: 1em),
      radius: 4pt,
      stroke: 0.5pt + accent.transparentize(50%),
    )[
      // Confetti burst in top-left
      #place(top + left, dx: -5pt, dy: -5pt,
        box(width: 60pt, height: 45pt,
          confetti-scatter(color: accent.transparentize(40%), width: 60pt, height: 45pt)))
      #stack(spacing: .8em,
        text(size: typo.body, weight: "bold", fill: accent.darken(20%), title),
        [
          #set text(size: 13pt, fill: pal.ink-dim, font: _sans-font)
          #body
          #lazy-v(1fr)
        ],
      )
    ]
  ]
}

/// sparkle-tag -- Inline sequin-accented tag/badge
#let sparkle-tag(body, color: palette.accent) = {
  box(
    fill: color.lighten(80%),
    stroke: 1.2pt + color,
    inset: (x: 10pt, y: 4pt),
    radius: 12pt,
  )[
    #text(size: typo.small, weight: "bold", fill: color, font: _sans-font, body)
    #h(3pt)
    #box(baseline: 1pt, sequin-sparkle(color: color.transparentize(30%), size: 10pt))
  ]
}

/// carnival-quote -- Vibrant quote block with feather ornament
#let carnival-quote(body, cite: none) = {
  let pal = palette
  block(width: 92%, inset: (left: 1.5em, right: 1em, y: 0.8em))[
    // Large decorative quote mark
    #place(top + left, dx: -1em, dy: -0.3em,
      text(size: 48pt, weight: "bold", fill: pal.accent.transparentize(70%))["])
    // Feather accent on right
    #place(top + right, dx: 8pt, dy: -12pt,
      feather-plume(color: pal.secondary.transparentize(70%), width: 25pt, height: 45pt))
    #set text(size: typo.body, style: "italic", fill: pal.ink)
    #body
    #if cite != none {
      v(0.5em)
      text(size: typo.tiny, style: "normal", weight: "medium", fill: pal.ink-muted,
        [-- #cite])
    }
  ]
}

/// parade-grid -- Multi-item grid with alternating colored backgrounds (parade floats)
#let parade-grid(..items) = {
  let pal = palette
  let colors = (pal.accent, pal.secondary, pal.tertiary)
  let cells = items.pos().enumerate().map(((i, item)) => {
    let c = colors.at(calc.rem(i, 3))
    block(width: 100%, fill: c.lighten(85%), inset: (x: 0.8em, y: 0.6em), radius: 4pt,
      stroke: 0.5pt + c.transparentize(60%))[
      #set text(size: 13pt, fill: pal.ink-dim, font: _sans-font)
      #item
      #lazy-v(1fr)
    ]
  })
  cols(columns: (1fr,) * calc.min(items.pos().len(), 3), column-gutter: 10pt, row-gutter: 10pt, lazy-layout: true, ..cells)
}

/// tropical-banner -- Full-width banner with tropical leaf silhouette background
#let tropical-banner(body, accent: palette.tertiary) = {
  let pal = palette
  block(width: 100%, fill: accent.lighten(85%), inset: (x: 1.5em, y: 1em), radius: 5pt)[
    // Tropical leaf silhouette in background
    #place(right + horizon, dx: -10pt,
      tropical-leaf(color: accent.transparentize(70%), width: 50pt, height: 68pt))
    #set text(size: typo.body, weight: "medium", fill: accent.darken(30%), font: _sans-font)
    #body
  ]
}

/// sequin-stat -- Compact stat with sequin sparkle decoration
#let sequin-stat(value, label, accent: palette.secondary) = {
  let pal = palette
  block(width: 100%, fill: pal.card, inset: (x: 0.5em, y: 0.5em), radius: 4pt)[
    #place(top + right, dx: -2pt, dy: 2pt,
      sequin-sparkle(color: accent.transparentize(50%), size: 18pt))
    #stack(spacing: .8em,
      text(size: 28pt, weight: "bold", fill: accent, value),
      text(size: 11pt, fill: pal.ink-muted, font: _sans-font, label),
      lazy-v(1fr),
    )
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Header with rhythm-wave underline (NOT a straight line)
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 1.3em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: 0.8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    // RHYTHM WAVE as header underline (signature element)
    box(width: 120pt, height: 8pt,
      rhythm-wave(color: pal.accent, width: 120pt, height: 8pt)),
  )
}

/// _slide-footer -- Footer with carnival branding
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[CARNIVAL RIO]
    },
    box(sequin-sparkle(color: pal.accent, size: 9pt)),
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.dark-ink.transparentize(50%), font: _mono-font)
    grid(
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
  }
}

/// _dark-footer
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.dark-ink.transparentize(60%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[CARNIVAL RIO]
    },
    box(sequin-sparkle(color: pal.accent-muted, size: 9pt)),
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Warm white bg with persistent carnival atmosphere on every slide
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
    // PERSISTENT carnival atmosphere
    _bg-atmosphere(pal)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deep purple-black with feather plume ghost decorations
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
    // Ghost feather plume (right side)
    place(right + horizon, dx: -20pt, dy: -30pt,
      feather-plume(color: pal.dark-ink.transparentize(92%), width: 100pt, height: 170pt))
    // Confetti scatter (very faint on dark)
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.accent.transparentize(92%), width: 100%, height: 100%)))
    // Sequin sparkles scattered
    place(top + left, dx: 40pt, dy: 30pt,
      sequin-sparkle(color: pal.secondary.transparentize(85%), size: 30pt))
    place(bottom + right, dx: -60pt, dy: -40pt,
      sequin-sparkle(color: pal.accent.transparentize(88%), size: 25pt))
    set text(fill: pal.dark-ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.dark-bg,
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- MAXIMALIST carnival cover with all decorative elements
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Base warm background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page confetti explosion (multiple layers)
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.accent.transparentize(70%), width: 100%, height: 100%)))
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.secondary.transparentize(75%), width: 100%, height: 100%)))
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.tertiary.transparentize(78%), width: 100%, height: 100%)))

    // Feather plumes -- left and right sides (SIGNATURE decorative element)
    place(left + top, dx: 10pt, dy: 20pt,
      feather-plume(color: pal.accent.transparentize(25%), width: 70pt, height: 120pt))
    place(right + top, dx: -15pt, dy: 15pt,
      feather-plume(color: pal.secondary.transparentize(30%), width: 65pt, height: 115pt))
    place(left + bottom, dx: 30pt, dy: -20pt,
      feather-plume(color: pal.tertiary.transparentize(40%), width: 55pt, height: 95pt))

    // Tropical leaves in corners
    place(bottom + left, dx: -10pt, dy: 10pt,
      tropical-leaf(color: pal.tertiary.transparentize(50%), width: 80pt, height: 110pt))
    place(top + right, dx: 10pt, dy: -10pt,
      tropical-leaf(color: pal.tertiary.transparentize(65%), width: 60pt, height: 82pt))

    // Sequin sparkles scattered
    place(top + left, dx: 90pt, dy: 25pt,
      sequin-sparkle(color: pal.secondary.transparentize(30%), size: 35pt))
    place(top + right, dx: -100pt, dy: 50pt,
      sequin-sparkle(color: pal.accent.transparentize(35%), size: 28pt))
    place(bottom + right, dx: -45pt, dy: -55pt,
      sequin-sparkle(color: pal.secondary.transparentize(40%), size: 32pt))
    place(bottom + left, dx: 120pt, dy: -40pt,
      sequin-sparkle(color: pal.accent.transparentize(45%), size: 24pt))

    // Rhythm wave across bottom area
    place(bottom + left, dy: -30pt,
      rhythm-wave(color: pal.accent.transparentize(55%), width: 100%, height: 25pt))
    place(bottom + left, dy: -18pt,
      rhythm-wave(color: pal.secondary.transparentize(65%), width: 100%, height: 20pt))

    // CENTER TITLE CARD
    set std.align(center + horizon)
    pad(x: 6em, y: 2em)[
      #shadow(dx: 5pt, dy: 5pt, blur: 8pt, fill: rgb(0, 0, 0, 14%), radius: 6pt)[
        #block(
          width: 100%,
          fill: pal.card,
          inset: (x: 2em, y: 1.5em),
          radius: 6pt,
          stroke: 1.5pt + pal.accent.transparentize(40%),
        )[
          // Accent stripe at top
          #place(top + left, dy: -1pt,
            block(width: 100%, height: 5pt, fill: gradient.linear(pal.accent, pal.secondary, pal.tertiary, angle: 0deg), radius: (top: 6pt)))
          #v(0.6em)
          // Institution kicker
          #if info.institution != none {
            text(
              size: typo.tiny,
              weight: "medium",
              tracking: 2pt,
              fill: pal.accent,
              font: _mono-font,
              upper(info.institution),
            )
            v(0.8em)
          }
          // Title
          #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
          #v(0.5em)
          // Rhythm wave divider
          #block(width: 60%,
            rhythm-wave(color: pal.accent, width: 100%, height: 14pt))
          #v(0.4em)
          // Subtitle
          #if info.subtitle != none {
            text(size: 17pt, weight: "regular", style: "italic", fill: pal.ink-dim, info.subtitle)
            v(0.8em)
          }
          // Author + date
          #{
            set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font)
            if info.author != none {
              upper[#info.author]
            }
            if info.author != none and info.date != none {
              h(1.5em)
              box(baseline: 1pt, sequin-sparkle(color: pal.accent, size: 8pt))
              h(1.5em)
            }
            if info.date != none {
              utils.display-info-date(self)
            }
          }
        ]
      ]
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Vibrant section break with feather plume and confetti burst
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Confetti explosion
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.accent.transparentize(75%), width: 100%, height: 100%)))
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.secondary.transparentize(80%), width: 100%, height: 100%)))

    // Feather plume on right side
    place(right + horizon, dx: -30pt, dy: -20pt,
      feather-plume(color: pal.accent.transparentize(40%), width: 85pt, height: 145pt))

    // Tropical leaf bottom-left
    place(bottom + left, dx: 15pt, dy: 10pt,
      tropical-leaf(color: pal.tertiary.transparentize(60%), width: 70pt, height: 95pt))

    // Section number badge with sequin sparkle
    place(top + right, dx: -80pt, dy: 35pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 12%), radius: 30pt)[
          #circle(radius: 30pt, fill: pal.card,
            stroke: 2pt + pal.accent)[
            #set align(center + horizon)
            #text(fill: pal.accent, size: 30pt, weight: "bold", num-str)
          ]
        ]
      },
    )
    // Sparkle next to number
    place(top + right, dx: -42pt, dy: 30pt,
      sequin-sparkle(color: pal.secondary.transparentize(30%), size: 22pt))

    // Content positioned in bottom-left area
    place(bottom + left, dx: 4em, dy: -3em)[
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.accent,
        font: _mono-font,
      )[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.6em)
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.3em)
      // Rhythm wave underline
      #box(width: 120pt, height: 8pt,
        rhythm-wave(color: pal.accent, width: 120pt, height: 8pt))
    ]

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[CARNIVAL RIO],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Bold carnival statement on vivid accent background
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.accent,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Confetti on accent background
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: rgb("#FFFFFF").transparentize(80%), width: 100%, height: 100%)))
    // Feather plumes
    place(top + right, dx: -15pt, dy: 10pt,
      feather-plume(color: rgb("#FFFFFF").transparentize(70%), width: 55pt, height: 95pt))
    place(bottom + left, dx: 20pt, dy: -10pt,
      feather-plume(color: rgb("#FFFFFF").transparentize(75%), width: 45pt, height: 80pt))
    // Sequin sparkles
    place(top + left, dx: 40pt, dy: 25pt,
      sequin-sparkle(color: rgb("#FFFFFF").transparentize(60%), size: 30pt))
    place(bottom + right, dx: -50pt, dy: -30pt,
      sequin-sparkle(color: pal.secondary.transparentize(50%), size: 28pt))
    // Content
    set text(fill: rgb("#FFFFFF"), size: 1.6em, weight: "bold")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1.5em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Carnival celebration farewell (bookends with title-slide)
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page confetti (MATCHING title-slide -- bookending)
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.accent.transparentize(70%), width: 100%, height: 100%)))
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.secondary.transparentize(75%), width: 100%, height: 100%)))
    place(top + left,
      box(width: 100%, height: 100%,
        confetti-scatter(color: pal.tertiary.transparentize(78%), width: 100%, height: 100%)))

    // Feather plumes (MATCHING title-slide -- bookending)
    place(left + top, dx: 12pt, dy: 22pt,
      feather-plume(color: pal.accent.transparentize(30%), width: 65pt, height: 112pt))
    place(right + top, dx: -18pt, dy: 18pt,
      feather-plume(color: pal.secondary.transparentize(35%), width: 60pt, height: 105pt))

    // Tropical leaves (MATCHING title-slide -- bookending)
    place(bottom + left, dx: -8pt, dy: 8pt,
      tropical-leaf(color: pal.tertiary.transparentize(50%), width: 75pt, height: 100pt))
    place(bottom + right, dx: 5pt, dy: 5pt,
      tropical-leaf(color: pal.tertiary.transparentize(65%), width: 55pt, height: 75pt))

    // Sequin sparkles (MATCHING title-slide -- bookending)
    place(top + left, dx: 85pt, dy: 28pt,
      sequin-sparkle(color: pal.secondary.transparentize(30%), size: 32pt))
    place(bottom + right, dx: -50pt, dy: -50pt,
      sequin-sparkle(color: pal.accent.transparentize(35%), size: 28pt))

    // Rhythm waves (MATCHING title-slide -- bookending)
    place(bottom + left, dy: -28pt,
      rhythm-wave(color: pal.accent.transparentize(55%), width: 100%, height: 22pt))
    place(bottom + left, dy: -15pt,
      rhythm-wave(color: pal.secondary.transparentize(65%), width: 100%, height: 18pt))

    // Ghost text
    place(center + horizon,
      text(size: 90pt, weight: "bold", fill: pal.ink-ghost)[SAMBA],
    )

    // Center content card (with shadow)
    set std.align(center + horizon)
    pad(x: 5em)[
      #shadow(dx: 4pt, dy: 4pt, blur: 7pt, fill: rgb(0, 0, 0, 14%), radius: 6pt)[
        #block(width: 55%, inset: (x: 2em, y: 1.5em), fill: pal.card, radius: 6pt,
          stroke: 1.5pt + pal.accent.transparentize(40%))[
          // Gradient stripe on card top
          #place(top + left, dy: -1pt,
            block(width: 100%, height: 4pt, fill: gradient.linear(pal.accent, pal.secondary, pal.tertiary, angle: 0deg), radius: (top: 6pt)))
          #v(0.8em)
          // Sequin sparkle ornament
          #std.align(center, sequin-sparkle(color: pal.accent, size: 35pt))
          #v(0.5em)
          #text(size: 2em, weight: "bold", fill: pal.ink, body)
          #v(0.5em)
          // Rhythm wave divider
          #std.align(center, block(width: 130pt,
            rhythm-wave(color: pal.accent, width: 130pt, height: 12pt)))
          #v(0.5em)
          #text(size: 9pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[CARNIVAL RIO]
        ]
      ]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point (MUST BE LAST -- forward references resolved)
// =====================================================================

#let carnival-rio-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "rio",
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
