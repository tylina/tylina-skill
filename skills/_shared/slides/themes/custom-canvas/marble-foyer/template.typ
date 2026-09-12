// Marble Foyer Theme -- Luxury marble and architectural foyer aesthetic
// Grand hotel lobby, museum entrance, polished stone with gold trim
// Pale marble-white background with subtle veining, gold metallic accents
// Classical architectural elements: columns, arches, cornices, keystones
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  classic: (bg: rgb("#FAFAF8"), ink: rgb("#2C2C2C"), accent: rgb("#B8860B"), secondary: rgb("#9E8E7E"), card: rgb("#FFFFFF")),
  noir: (bg: rgb("#F5F4F2"), ink: rgb("#1A1A1A"), accent: rgb("#8B7536"), secondary: rgb("#7A6B5E"), card: rgb("#FEFEFE")),
  travertine: (bg: rgb("#FAF8F4"), ink: rgb("#3A3028"), accent: rgb("#A0782C"), secondary: rgb("#B8A898"), card: rgb("#FFFEF8")),
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
  let card = p.card
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    card: card,
    // Derived from ink
    ink-dim: ink.transparentize(20%),
    ink-muted: ink.transparentize(45%),
    ink-faint: ink.transparentize(70%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent (gold)
    accent-dim: accent.transparentize(25%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(75%),
    accent-ghost: accent.transparentize(90%),
    // Derived from secondary (warm gray marble vein)
    secondary-dim: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(75%),
    secondary-ghost: secondary.transparentize(90%),
    // Surface colors
    marble: bg,
    alabaster: card,
    // Dark variant (charcoal stone)
    onyx: rgb("#1A1A1A"),
    onyx-deep: rgb("#0F0F0F"),
    // Meta
    meta-color: ink.transparentize(60%),
    body-text: rgb("#1A1A1A"),
  )
}

// Default palette
#let palette = build-palette("classic")

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

#let _mono-font = "IBM Plex Mono"
#let _sans-font = ("IBM Plex Sans", "Noto Sans SC")

// =====================================================================
// SVG Definitions -- 5 intricate SVGs (10+ paths each, varied opacities)
// =====================================================================

// 1. Marble Vein Texture (full-page) -- Organic veining pattern like Calacatta marble
// Subtle flowing lines with varying widths and opacities simulating natural stone veining
#let _marble-vein-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 450\"><path d=\"M0,80 C40,75 80,90 120,85 C160,80 200,65 240,70 C280,75 320,90 360,85 C400,80 440,70 480,75 C520,80 560,95 600,88 C640,81 680,72 720,78 C760,84 790,80 800,82\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.12\"/><path d=\"M0,160 C50,155 100,170 150,165 C200,160 250,145 300,150 C350,155 400,168 450,162 C500,156 550,148 600,155 C650,162 700,170 750,165 C780,162 800,160 800,160\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.08\"/><path d=\"M0,240 C60,235 120,250 180,245 C240,240 300,228 360,234 C420,240 480,252 540,246 C600,240 660,230 720,238 C760,244 800,240 800,240\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.1\"/><path d=\"M0,320 C45,318 90,330 135,325 C180,320 225,310 270,316 C315,322 360,335 405,328 C450,321 495,312 540,318 C585,324 630,332 675,326 C720,320 765,315 800,320\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.07\"/><path d=\"M0,400 C55,395 110,410 165,405 C220,400 275,388 330,394 C385,400 440,412 495,406 C550,400 605,390 660,396 C715,402 770,395 800,398\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.0\" opacity=\"0.09\"/><path d=\"M100,0 C95,50 110,100 105,150 C100,200 90,250 95,300 C100,350 108,400 105,450\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><path d=\"M300,0 C295,40 305,80 300,120 C295,160 288,200 292,240 C296,280 304,320 300,360 C296,400 298,430 300,450\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.05\"/><path d=\"M550,0 C545,60 555,120 548,180 C541,240 535,300 540,360 C545,420 548,440 550,450\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.06\"/><path d=\"M700,0 C698,45 705,90 700,135 C695,180 690,225 695,270 C700,315 706,360 702,405 C698,435 700,450 700,450\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.05\"/><path d=\"M0,50 C30,48 60,55 90,52 C120,49 150,44 180,48\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.05\"/><path d=\"M620,380 C650,376 680,385 710,382 C740,379 770,374 800,378\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.06\"/><path d=\"M200,200 C230,196 260,205 290,200 C320,195 350,190 380,195\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.04\"/></svg>"

// 2. Classical Column Border -- Two fluted Ionic columns with base and capital details
// Vertical border elements for title/ending slides
#let _column-border-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 60 400\"><rect x=\"8\" y=\"50\" width=\"44\" height=\"300\" fill=\"currentColor\" opacity=\"0.06\"/><line x1=\"12\" y1=\"50\" x2=\"12\" y2=\"350\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.35\"/><line x1=\"20\" y1=\"50\" x2=\"20\" y2=\"350\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.2\"/><line x1=\"28\" y1=\"50\" x2=\"28\" y2=\"350\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.2\"/><line x1=\"36\" y1=\"50\" x2=\"36\" y2=\"350\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.2\"/><line x1=\"44\" y1=\"50\" x2=\"44\" y2=\"350\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.2\"/><line x1=\"52\" y1=\"50\" x2=\"52\" y2=\"350\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.35\"/><rect x=\"5\" y=\"350\" width=\"50\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"2\" y=\"358\" width=\"56\" height=\"6\" fill=\"currentColor\" opacity=\"0.3\"/><rect x=\"0\" y=\"364\" width=\"60\" height=\"10\" fill=\"currentColor\" opacity=\"0.2\"/><rect x=\"5\" y=\"42\" width=\"50\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><path d=\"M5,42 C10,32 15,28 20,25 C25,22 30,20 30,18\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.3\"/><path d=\"M55,42 C50,32 45,28 40,25 C35,22 30,20 30,18\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.3\"/><ellipse cx=\"30\" cy=\"16\" rx=\"14\" ry=\"4\" fill=\"currentColor\" opacity=\"0.2\"/><ellipse cx=\"30\" cy=\"12\" rx=\"10\" ry=\"3\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"30\" cy=\"8\" r=\"3\" fill=\"currentColor\" opacity=\"0.2\"/></svg>"

// 3. Cornice Molding Header -- Classical entablature with dentil molding
// Horizontal decorative header element with layered molding profiles
#let _cornice-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 50\"><rect x=\"0\" y=\"0\" width=\"800\" height=\"4\" fill=\"currentColor\" opacity=\"0.3\"/><rect x=\"0\" y=\"6\" width=\"800\" height=\"2\" fill=\"currentColor\" opacity=\"0.15\"/><rect x=\"0\" y=\"10\" width=\"800\" height=\"8\" fill=\"currentColor\" opacity=\"0.08\"/><rect x=\"0\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"16\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"32\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"48\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"64\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"80\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"96\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"112\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"128\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"144\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"160\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"176\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"192\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"208\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"224\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"240\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"256\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"272\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"288\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"304\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"320\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"336\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"352\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"368\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"384\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"400\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"416\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"432\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"448\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"464\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"480\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"496\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"512\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"528\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"544\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"560\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"576\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"592\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"608\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"624\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"640\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"656\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"672\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"688\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"704\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"720\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"736\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"752\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"768\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"784\" y=\"20\" width=\"10\" height=\"8\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"0\" y=\"30\" width=\"800\" height=\"3\" fill=\"currentColor\" opacity=\"0.12\"/><rect x=\"0\" y=\"35\" width=\"800\" height=\"6\" fill=\"currentColor\" opacity=\"0.06\"/><path d=\"M0,44 C20,42 40,46 60,44 C80,42 100,46 120,44 C140,42 160,46 180,44 C200,42 220,46 240,44 C260,42 280,46 300,44 C320,42 340,46 360,44 C380,42 400,46 420,44 C440,42 460,46 480,44 C500,42 520,46 540,44 C560,42 580,46 600,44 C620,42 640,46 660,44 C680,42 700,46 720,44 C740,42 760,46 780,44 C790,43 800,44 800,44\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/></svg>"

// 4. Arch Keystone Ornament -- Classical arch with keystone and voussoir detail
// Decorative arch element for section transitions and focus slides
#let _keystone-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 120\"><path d=\"M10,120 L10,60 C10,30 40,5 100,5 C160,5 190,30 190,60 L190,120\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2.5\" opacity=\"0.4\"/><path d=\"M18,120 L18,62 C18,35 45,12 100,12 C155,12 182,35 182,62 L182,120\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.2\"/><rect x=\"92\" y=\"0\" width=\"16\" height=\"24\" fill=\"currentColor\" opacity=\"0.35\"/><polygon points=\"92,24 108,24 110,28 90,28\" fill=\"currentColor\" opacity=\"0.25\"/><rect x=\"68\" y=\"14\" width=\"12\" height=\"16\" fill=\"currentColor\" opacity=\"0.15\" transform=\"rotate(-15 74 22)\"/><rect x=\"120\" y=\"14\" width=\"12\" height=\"16\" fill=\"currentColor\" opacity=\"0.15\" transform=\"rotate(15 126 22)\"/><rect x=\"46\" y=\"30\" width=\"11\" height=\"14\" fill=\"currentColor\" opacity=\"0.12\" transform=\"rotate(-30 51 37)\"/><rect x=\"143\" y=\"30\" width=\"11\" height=\"14\" fill=\"currentColor\" opacity=\"0.12\" transform=\"rotate(30 148 37)\"/><rect x=\"28\" y=\"52\" width=\"10\" height=\"12\" fill=\"currentColor\" opacity=\"0.1\" transform=\"rotate(-50 33 58)\"/><rect x=\"162\" y=\"52\" width=\"10\" height=\"12\" fill=\"currentColor\" opacity=\"0.1\" transform=\"rotate(50 167 58)\"/><line x1=\"10\" y1=\"118\" x2=\"190\" y2=\"118\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.2\"/><circle cx=\"100\" cy=\"60\" r=\"3\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"100\" cy=\"60\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.15\"/></svg>"

// 5. Gold Leaf Corner Piece -- Ornate corner bracket with acanthus scroll and filigree
// Decorative corner element for frames and cards
#let _gold-corner-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 80 80\"><path d=\"M0,0 L30,0 C25,5 20,10 18,15 C16,20 15,25 15,30 L15,35 C12,30 8,25 5,20 C3,15 2,10 0,5 Z\" fill=\"currentColor\" opacity=\"0.3\"/><path d=\"M0,0 L0,30 C5,25 10,20 15,18 C20,16 25,15 30,15 L35,15 C30,12 25,8 20,5 C15,3 10,2 5,0 Z\" fill=\"currentColor\" opacity=\"0.25\"/><path d=\"M5,5 C10,8 14,12 17,17 C20,22 22,28 23,34\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.4\"/><path d=\"M8,2 C12,6 16,11 19,16 C22,21 24,27 25,33\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.25\"/><path d=\"M2,8 C6,12 11,16 16,19 C21,22 27,24 33,25\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.25\"/><circle cx=\"6\" cy=\"6\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"12\" cy=\"3\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"3\" cy=\"12\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.3\"/><path d=\"M20,20 C22,18 25,17 28,18 C30,19 31,21 30,24 C29,26 27,27 24,26 C22,25 21,23 20,20 Z\" fill=\"currentColor\" opacity=\"0.2\"/><path d=\"M30,8 C32,10 33,13 32,16\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.2\"/><path d=\"M8,30 C10,32 13,33 16,32\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.2\"/><path d=\"M35,15 C38,16 40,18 42,22\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.15\"/><path d=\"M15,35 C16,38 18,40 22,42\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.15\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let marble-veins(color: palette.secondary, width: 100%, height: 100%) = {
  let svg = _marble-vein-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let column-border(color: palette.ink, width: 60pt, height: 400pt) = {
  let svg = _column-border-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let cornice-molding(color: palette.ink, width: 100%, height: 30pt) = {
  let svg = _cornice-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let arch-keystone(color: palette.accent, width: 200pt, height: 120pt) = {
  let svg = _keystone-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let gold-corner(color: palette.accent, size: 50pt) = {
  let svg = _gold-corner-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

// =====================================================================
// Persistent Background Atmosphere
// Every content slide gets this -- the "standing in a marble foyer" feeling
// =====================================================================

#let _marble-atmosphere(pal) = {
  // 1. Full-page marble veining texture at low opacity
  place(center + horizon,
    box(width: 100%, height: 100%,
      marble-veins(color: pal.secondary.transparentize(30%), width: 100%, height: 100%),
    ),
  )
  // 2. Faint cornice molding at top
  place(top + left, dy: -6pt,
    cornice-molding(color: pal.ink.transparentize(88%), width: 100%, height: 18pt),
  )
  // 3. Gold corner pieces at bottom corners (very faint)
  place(bottom + left, dx: -2pt, dy: 2pt,
    gold-corner(color: pal.accent.transparentize(85%), size: 30pt),
  )
  place(bottom + right, dx: 2pt, dy: 2pt,
    rotate(-90deg, gold-corner(color: pal.accent.transparentize(85%), size: 30pt)),
  )
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// gold-dot -- Small gold circle accent
#let gold-dot(color: palette.accent, size: 3pt) = {
  circle(radius: size / 2, fill: color)
}

/// plinth-line -- Double line like marble plinth edge
#let plinth-line(color: palette.ink, width: 60pt) = {
  block(width: width, height: 6pt)[
    #place(top, line(length: 100%, stroke: 1pt + color))
    #place(top, dy: 3.5pt, line(length: 70%, stroke: 0.4pt + color.transparentize(40%)))
  ]
}

// =====================================================================
// Reusable Components (9 structurally diverse)
// =====================================================================

/// plinth-card -- Card with subtle marble texture, gold left border, corner accents
#let plinth-card(title, body, pal: palette) = {
  block(
    width: 100%,
    stroke: (
      left: 2pt + pal.accent,
      right: 0.4pt + pal.secondary-faint,
      top: 0.4pt + pal.secondary-faint,
      bottom: 0.4pt + pal.secondary-faint,
    ),
    inset: (x: 1.2em, top: 0.9em, bottom: 0.7em),
    fill: pal.alabaster,
    radius: 2pt,
  )[
    // Gold corner accent top-right
    #place(top + right, dx: 4pt, dy: -4pt,
      gold-corner(color: pal.accent.transparentize(60%), size: 24pt),
    )
    #stack(spacing: .8em,
      [#text(size: typo.body, weight: "bold", fill: pal.ink, title)],
      [#set text(size: 13pt, fill: pal.body-text, font: _sans-font)
       #body
       #lazy-v(1fr)],
    )
  ]
}

/// pediment-stat -- Large number with architectural ornament (like an inscription on a pediment)
#let pediment-stat(label, value, description: none, pal: palette) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em), fill: pal.alabaster)[
    #set std.align(center)
    #stack(spacing: .8em,
      [#text(size: 44pt, weight: "bold", fill: pal.ink, value)],
      [#text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: pal.accent,
        font: _mono-font,
        upper(label),
      )],
      [#plinth-line(color: pal.accent, width: 35pt)],
      [#if description != none {
        text(
          size: 13pt,
          weight: "regular",
          fill: pal.body-text,
          font: _sans-font,
          description,
        )
      }],
      [#lazy-v(1fr)],
    )
  ]
}

/// colonnade-box -- Box with column-like vertical borders and header band
/// Uses stack(spacing: 0pt) for header + content body structure
#let colonnade-box(title, body, pal: palette) = {
  block(clip: true, width: 100%, radius: 2pt, stroke: 0.5pt + pal.secondary-faint)[
    #stack(spacing: 0pt,
      block(fill: pal.ink.transparentize(94%), width: 100%, inset: (x: 1em, y: 0.6em))[
        #text(size: typo.body, weight: "bold", fill: pal.ink, title)
      ],
      block(fill: pal.alabaster, width: 100%, inset: (x: 1em, top: 0.6em, bottom: 0.5em))[
        // Faint column borders on sides
        #place(left + horizon, dx: -8pt,
          line(length: 100%, angle: 90deg, stroke: 0.6pt + pal.secondary-faint),
        )
        #place(right + horizon, dx: 8pt,
          line(length: 100%, angle: 90deg, stroke: 0.6pt + pal.secondary-faint),
        )
        #set text(size: 13pt, fill: pal.body-text, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// cornice-divider -- Full-width classical molding divider
#let cornice-divider(total-width: 100%, pal: palette) = {
  block(width: total-width, height: 16pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.6pt + pal.secondary-muted))
    #place(left + horizon, dy: 3pt, line(length: 100%, stroke: 0.3pt + pal.secondary-faint))
    // Dentil accents along the line
    #place(left + horizon, dx: 10%, gold-dot(color: pal.accent, size: 3pt))
    #place(left + horizon, dx: 25%, gold-dot(color: pal.accent-muted, size: 2.5pt))
    #place(left + horizon, dx: 40%, gold-dot(color: pal.accent, size: 3pt))
    #place(left + horizon, dx: 55%, gold-dot(color: pal.accent-muted, size: 2.5pt))
    #place(left + horizon, dx: 70%, gold-dot(color: pal.accent, size: 3pt))
    #place(left + horizon, dx: 85%, gold-dot(color: pal.accent-muted, size: 2.5pt))
  ]
}

/// keystone-tag -- Rounded tag with architectural keystone styling
#let keystone-tag(body, pal: palette) = {
  box(
    fill: pal.accent.transparentize(88%),
    stroke: 0.5pt + pal.accent-muted,
    inset: (x: 9pt, y: 4pt),
    radius: 3pt,
  )[
    #text(size: typo.small, fill: pal.accent, weight: "medium", font: _sans-font, body)
  ]
}

/// marble-highlight -- Gold rim frame with corner pieces for emphasis
#let marble-highlight(body, pal: palette) = {
  block(
    width: 100%,
    stroke: 1.2pt + pal.accent,
    inset: (x: 1.5em, y: 1em),
    fill: pal.alabaster,
    radius: 3pt,
  )[
    // Four corner gold pieces
    #place(top + left, dx: -6pt, dy: -6pt,
      gold-corner(color: pal.accent.transparentize(30%), size: 28pt))
    #place(top + right, dx: 6pt, dy: -6pt,
      rotate(-90deg, gold-corner(color: pal.accent.transparentize(30%), size: 28pt)))
    #place(bottom + left, dx: -6pt, dy: 6pt,
      rotate(90deg, gold-corner(color: pal.accent.transparentize(30%), size: 28pt)))
    #place(bottom + right, dx: 6pt, dy: 6pt,
      rotate(180deg, gold-corner(color: pal.accent.transparentize(30%), size: 28pt)))
    // Gold dot accents at midpoints
    #place(top + left, dx: 48%, dy: -3pt, gold-dot(color: pal.accent, size: 4pt))
    #place(bottom + left, dx: 48%, dy: 3pt, gold-dot(color: pal.accent, size: 4pt))
    #set text(size: typo.body, fill: pal.ink, font: _sans-font)
    #body
  ]
}

/// atrium-note -- Centered quote/note with arch-inspired framing
#let atrium-note(body, cite: none, pal: palette) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1em),
    fill: pal.alabaster,
  )[
    // Keystone arch above quote
    #place(top + center, dy: -10pt,
      arch-keystone(color: pal.secondary.transparentize(70%), width: 100pt, height: 60pt),
    )
    #set std.align(center)
    #stack(spacing: .8em,
      [#text(size: typo.body + 1pt, style: "italic", fill: pal.ink)[
        #text(size: 18pt, fill: pal.accent-muted)["]#body#text(size: 18pt, fill: pal.accent-muted)["]
      ]],
      [#if cite != none {
        text(
          size: typo.tiny,
          style: "normal",
          weight: "medium",
          tracking: 1.2pt,
          fill: pal.meta-color,
          font: _mono-font,
          [-- #upper(cite)],
        )
      }],
    )
  ]
}

/// pilaster-badge -- Small badge with architectural pilaster feel
#let pilaster-badge(body, pal: palette) = {
  box(
    fill: pal.ink.transparentize(92%),
    stroke: 0.5pt + pal.ink-faint,
    inset: (x: 10pt, y: 5pt),
    radius: 2pt,
  )[
    #text(size: 11pt, fill: pal.ink, weight: "medium", font: _sans-font, body)
  ]
}

/// frieze-list -- Content banner with repeating pattern background
#let frieze-list(body, pal: palette) = {
  block(width: 100%, fill: pal.ink.transparentize(96%), inset: (x: 1.5em, y: 0.8em), stroke: 0.4pt + pal.secondary-faint)[
    // Subtle cornice pattern behind
    #place(top + left, dy: -4pt,
      cornice-molding(color: pal.ink.transparentize(92%), width: 100%, height: 12pt))
    #set text(size: typo.body, fill: pal.body-text, font: _sans-font)
    #body
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
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
    // Double line like marble plinth
    block(width: 55pt, height: 5pt)[
      #place(top, line(length: 55pt, stroke: 1.2pt + pal.accent))
      #place(top, dy: 3pt, line(length: 35pt, stroke: 0.5pt + pal.accent-muted))
    ],
  )
}

/// _slide-footer -- Standard footer for content slides
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
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      } else {
        upper[MARBLE FOYER]
      }
    },
    text(fill: pal.accent, size: 7pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark (onyx) slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)
    grid(
      columns: (1fr, 1fr),
      {
        if custom-left != none {
          custom-left
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

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: rgb("#FAFAF8").transparentize(60%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[MARBLE FOYER]
    },
    text(fill: pal.accent, size: 7pt)[#sym.diamond.filled],
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

/// slide -- Marble white bg, persistent marble veining + cornice atmosphere
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
    // THE MARBLE ATMOSPHERE -- every content slide
    _marble-atmosphere(pal)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Onyx/charcoal background (polished dark stone)
/// Gold accents shine against the dark, marble veining in light
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
    // Marble veining in light tones on dark background
    place(center + horizon,
      box(width: 100%, height: 100%,
        marble-veins(color: rgb("#FAFAF8").transparentize(85%), width: 100%, height: 100%),
      ),
    )
    // Arch keystone ornament as focal background element
    place(center + horizon, dx: 40pt, dy: -20pt,
      arch-keystone(color: pal.accent.transparentize(70%), width: 300pt, height: 180pt),
    )
    // Gold corner accents
    place(top + left, dx: 10pt, dy: 10pt,
      gold-corner(color: pal.accent.transparentize(60%), size: 40pt),
    )
    place(bottom + right, dx: -10pt, dy: -10pt,
      rotate(180deg, gold-corner(color: pal.accent.transparentize(60%), size: 40pt)),
    )
    set text(fill: rgb("#FAFAF8"))
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.onyx,
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Grand architectural frame: columns on sides, cornice top, gold accents
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Marble background
    place(top + left, block(width: 100%, height: 100%, fill: pal.marble))

    // Full-page marble veining
    place(center + horizon,
      box(width: 100%, height: 100%,
        marble-veins(color: pal.secondary.transparentize(20%), width: 100%, height: 100%),
      ),
    )

    // Cornice molding at top (full architectural frame)
    place(top + left,
      cornice-molding(color: pal.ink.transparentize(50%), width: 100%, height: 30pt),
    )

    // Column borders on left and right sides
    place(left + horizon, dx: 8pt,
      column-border(color: pal.ink.transparentize(40%), width: 36pt, height: 100%),
    )
    place(right + horizon, dx: -8pt,
      column-border(color: pal.ink.transparentize(40%), width: 36pt, height: 100%),
    )

    // Gold corner pieces (all four corners)
    place(top + left, dx: 10pt, dy: 32pt,
      gold-corner(color: pal.accent.transparentize(20%), size: 45pt))
    place(top + right, dx: -10pt, dy: 32pt,
      rotate(-90deg, gold-corner(color: pal.accent.transparentize(20%), size: 45pt)))
    place(bottom + left, dx: 10pt, dy: -10pt,
      rotate(90deg, gold-corner(color: pal.accent.transparentize(20%), size: 45pt)))
    place(bottom + right, dx: -10pt, dy: -10pt,
      rotate(180deg, gold-corner(color: pal.accent.transparentize(20%), size: 45pt)))

    // Inner gold frame
    place(center + horizon,
      rect(width: 82%, height: 78%, stroke: 0.8pt + pal.accent-dim, fill: none)
    )
    place(center + horizon,
      rect(width: 80%, height: 76%, stroke: 0.3pt + pal.accent-faint, fill: none)
    )

    // Keystone arch ornament centered above title
    place(top + center, dy: 50pt,
      arch-keystone(color: pal.accent.transparentize(50%), width: 160pt, height: 96pt),
    )

    // Centered title content
    set std.align(center + horizon)
    pad(x: 7em, y: 4em)[
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
        v(1.2em)
      }
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.6em)
      // Decorative divider with gold dot
      #block(width: 180pt, height: 10pt)[
        #place(left + horizon, line(length: 75pt, stroke: 0.6pt + pal.accent))
        #place(center + horizon, gold-dot(color: pal.accent, size: 5pt))
        #place(right + horizon, line(length: 75pt, stroke: 0.6pt + pal.accent))
      ]
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", style: "italic", fill: pal.ink-dim, info.subtitle)
        v(1em)
      }
      // Author + date
      #{
        set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.accent, size: 6pt)[#sym.diamond.filled]
          h(1.5em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Arch keystone focal element, column accents, marble textures
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.marble))

    // Marble veining background
    place(center + horizon,
      box(width: 100%, height: 100%,
        marble-veins(color: pal.secondary.transparentize(25%), width: 100%, height: 100%),
      ),
    )

    // Cornice at top
    place(top + left,
      cornice-molding(color: pal.ink.transparentize(65%), width: 100%, height: 24pt),
    )

    // Large arch keystone as focal decoration
    place(top + right, dx: -60pt, dy: 30pt,
      arch-keystone(color: pal.accent.transparentize(40%), width: 200pt, height: 120pt),
    )

    // Column accent on left
    place(left + horizon, dx: 12pt,
      column-border(color: pal.ink.transparentize(60%), width: 28pt, height: 100%),
    )

    // Section number in large decorative style
    place(top + left, dx: 5em, dy: 3em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 80pt, height: 80pt)[
          #place(center + horizon,
            text(fill: pal.ink.transparentize(82%), size: 72pt, weight: "bold", num-str))
        ]
      },
    )

    // Top accent line with gold dot
    place(top + left, dx: 5em, dy: 6.5em,
      block(width: 100pt, height: 8pt)[
        #line(length: 80pt, stroke: 1pt + pal.accent)
        #place(top + left, dx: 84pt, dy: -2pt, gold-dot(color: pal.accent, size: 5pt))
      ]
    )

    // Content area
    place(left + bottom, dx: 5em, dy: -4em,
      block(width: 60%)[
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
        #plinth-line(color: pal.accent, width: 50pt)
      ]
    )

    // Footer mark
    place(bottom + right, dx: -2em, dy: -1.2em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[MARBLE FOYER],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single bold statement on marble, arch framing
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.marble,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Marble veining persistent
    place(center + horizon,
      box(width: 110%, height: 110%,
        marble-veins(color: pal.secondary.transparentize(20%), width: 100%, height: 100%),
      ),
    )
    // Arch keystone centered above content
    place(top + center, dy: -10pt,
      arch-keystone(color: pal.accent.transparentize(55%), width: 240pt, height: 144pt),
    )
    // Gold corner pieces framing
    place(top + left, dx: -5pt, dy: -5pt,
      gold-corner(color: pal.accent.transparentize(40%), size: 40pt))
    place(top + right, dx: 5pt, dy: -5pt,
      rotate(-90deg, gold-corner(color: pal.accent.transparentize(40%), size: 40pt)))
    place(bottom + left, dx: -5pt, dy: 5pt,
      rotate(90deg, gold-corner(color: pal.accent.transparentize(40%), size: 40pt)))
    place(bottom + right, dx: 5pt, dy: 5pt,
      rotate(180deg, gold-corner(color: pal.accent.transparentize(40%), size: 40pt)))
    // Corner accent lines
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 40pt, stroke: 0.5pt + pal.accent))
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 30pt, angle: 90deg, stroke: 0.5pt + pal.accent))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 40pt, angle: 180deg, stroke: 0.5pt + pal.accent))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 30pt, angle: -90deg, stroke: 0.5pt + pal.accent))

    set text(fill: pal.ink, size: 1.4em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    pad(x: 2em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Bookends with title: full architectural frame (columns + cornice)
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.marble))

    // Full-page marble veining (shared with title -- bookending)
    place(center + horizon,
      box(width: 100%, height: 100%,
        marble-veins(color: pal.secondary.transparentize(20%), width: 100%, height: 100%),
      ),
    )

    // Cornice molding at top (shared with title -- bookending)
    place(top + left,
      cornice-molding(color: pal.ink.transparentize(50%), width: 100%, height: 30pt),
    )

    // Column borders (shared with title -- bookending)
    place(left + horizon, dx: 8pt,
      column-border(color: pal.ink.transparentize(40%), width: 36pt, height: 100%),
    )
    place(right + horizon, dx: -8pt,
      column-border(color: pal.ink.transparentize(40%), width: 36pt, height: 100%),
    )

    // Gold corner pieces (shared with title -- bookending)
    place(top + left, dx: 10pt, dy: 32pt,
      gold-corner(color: pal.accent.transparentize(20%), size: 45pt))
    place(top + right, dx: -10pt, dy: 32pt,
      rotate(-90deg, gold-corner(color: pal.accent.transparentize(20%), size: 45pt)))
    place(bottom + left, dx: 10pt, dy: -10pt,
      rotate(90deg, gold-corner(color: pal.accent.transparentize(20%), size: 45pt)))
    place(bottom + right, dx: -10pt, dy: -10pt,
      rotate(180deg, gold-corner(color: pal.accent.transparentize(20%), size: 45pt)))

    // Inner gold frame (shared with title -- bookending)
    place(center + horizon,
      rect(width: 82%, height: 78%, stroke: 0.8pt + pal.accent-dim, fill: none)
    )
    place(center + horizon,
      rect(width: 80%, height: 76%, stroke: 0.3pt + pal.accent-faint, fill: none)
    )

    // Ghost text
    place(center + horizon,
      text(size: 120pt, weight: "bold", fill: pal.ink-ghost)[FOYER],
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 6em)[
      // Keystone ornament
      #std.align(center, arch-keystone(color: pal.accent, width: 80pt, height: 48pt))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.8em)
      // Decorative divider
      #block(width: 160pt, height: 10pt)[
        #place(left + horizon, line(length: 65pt, stroke: 0.6pt + pal.accent))
        #place(center + horizon, gold-dot(color: pal.accent, size: 5pt))
        #place(right + horizon, line(length: 65pt, stroke: 0.6pt + pal.accent))
      ]
      #v(0.8em)
      #text(size: 10pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[MARBLE FOYER]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point (MUST BE LAST)
// =====================================================================

#let marble-foyer-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "classic",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.body-text)
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
      primary: pal.ink,
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
