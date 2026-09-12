// Paper-Craft Theme -- Paper cutting, kirigami, layered paper collage
// Torn edges, drop shadows, paper clips, scissors marks, origami cranes
// A craft table where colored paper layers overlap with visible dimensionality
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  origami: (bg: rgb("#FFFDF8"), ink: rgb("#2C2C2C"), accent: rgb("#FF6B6B"), secondary: rgb("#4ECDC4"), tertiary: rgb("#F7B731")),
  confetti: (bg: rgb("#FFFFFE"), ink: rgb("#1A1A2E"), accent: rgb("#FF69B4"), secondary: rgb("#9B59B6"), tertiary: rgb("#2ECC71")),
  kraft: (bg: rgb("#F5E6D3"), ink: rgb("#3D2B1F"), accent: rgb("#FFFFFF"), secondary: rgb("#8FBC8F"), tertiary: rgb("#D4956A")),
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
    // Paper layers (different cream tones for stacking)
    paper-1: bg,
    paper-2: bg.darken(3%),
    paper-3: bg.darken(6%),
    // Ink variants
    ink-dim: ink.transparentize(30%),
    ink-muted: ink.transparentize(35%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(92%),
    // Accent variants
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(92%),
    // Secondary variants
    secondary-dim: secondary.transparentize(40%),
    secondary-faint: secondary.transparentize(75%),
    // Tertiary variants
    tertiary-dim: tertiary.transparentize(40%),
    tertiary-faint: tertiary.transparentize(75%),
    // Shadow colors (KEY for paper depth)
    shadow: rgb("#00000018"),
    shadow-dark: rgb("#00000025"),
    // Meta
    meta-color: ink.transparentize(30%),
    // Dark slide
    dark-bg: rgb("#1A1A2E"),
    dark-ink: rgb("#F0EDE8"),
  )
}

// Default palette
#let palette = build-palette("origami")

// Preserve the lively paper colors for shapes while ensuring that small text
// remains readable on the cream canvas across all bundled presets.
#let _readable-accent(color) = color.darken(40%)

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 40pt,
  h1: 28pt,
  h2: 20pt,
  body: 15pt,
  small: 12pt,
  tiny: 9pt,
  meta: 8pt,
)

// =====================================================================
// SVG Definitions (5 core + 2 supplemental)
// =====================================================================

// 1. TORN PAPER EDGE -- Irregular ripped edge with 40+ short segments creating
// authentic paper-tear randomness. The path wobbles up/down to simulate fiber pull.
#let _torn-edge-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 20\"><path d=\"M0,10 L5,8 L8,12 L12,7 L16,11 L19,6 L23,9 L27,13 L30,7 L34,10 L38,5 L42,11 L45,8 L49,13 L53,6 L57,10 L60,7 L64,12 L68,8 L72,11 L76,6 L80,9 L84,13 L87,7 L91,10 L95,5 L99,11 L103,8 L107,12 L111,6 L115,10 L119,7 L123,13 L127,8 L131,11 L135,5 L139,9 L143,12 L147,7 L151,10 L155,6 L159,11 L163,8 L167,13 L171,7 L175,10 L179,5 L183,9 L187,12 L191,7 L195,11 L199,6 L203,10 L207,8 L211,12 L215,6 L219,9 L223,13 L227,7 L231,10 L235,5 L239,11 L243,8 L247,12 L251,6 L255,10 L259,7 L263,13 L267,8 L271,11 L275,5 L279,9 L283,12 L287,7 L291,10 L295,6 L299,11 L303,8 L307,13 L311,7 L315,10 L319,5 L323,9 L327,12 L331,7 L335,11 L339,6 L343,10 L347,8 L351,12 L355,6 L359,9 L363,13 L367,7 L371,10 L375,5 L379,11 L383,8 L387,12 L391,7 L395,10 L400,8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\"/></svg>"

// 2. PAPER CLIP -- Bent wire paper clip with double curves (realistic clip geometry)
#let _paper-clip-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 50\"><path d=\"M7,2 C3,2 1,5 1,8 L1,38 C1,43 4,47 8,47 L12,47 C16,47 19,43 19,38 L19,12 C19,8 17,5 14,5 L10,5 C7,5 5,8 5,12 L5,35 C5,37 6,39 8,39 L12,39 C14,39 15,37 15,35 L15,12\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/></svg>"

// 3. SCISSORS + CUT LINE -- Open scissors with extending dashed cut-line
#let _scissors-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 30\"><circle cx=\"12\" cy=\"8\" r=\"5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\"/><circle cx=\"12\" cy=\"22\" r=\"5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\"/><line x1=\"16\" y1=\"10\" x2=\"28\" y2=\"15\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\"/><line x1=\"16\" y1=\"20\" x2=\"28\" y2=\"15\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\"/><line x1=\"28\" y1=\"15\" x2=\"400\" y2=\"15\" stroke=\"currentColor\" stroke-width=\"1\" stroke-dasharray=\"8 4\" opacity=\"0.6\"/></svg>"

// 4. PAPER FOLD CREASE -- Diagonal fold with triangular shadow (corner fold)
#let _fold-crease-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 60 60\"><polygon points=\"0,0 60,0 0,60\" fill=\"currentColor\" opacity=\"0.04\"/><line x1=\"0\" y1=\"60\" x2=\"60\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.15\"/><polygon points=\"0,0 30,0 0,30\" fill=\"currentColor\" opacity=\"0.03\"/><line x1=\"0\" y1=\"30\" x2=\"30\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/><path d=\"M60,0 Q40,10 35,35 Q30,50 0,60\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/></svg>"

// 5. ORIGAMI CRANE -- Geometric folded crane with internal fold lines (20+ elements)
#let _origami-crane-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 100\"><path d=\"M60,10 L45,35 L20,40 L35,55 L25,80 L60,65 L95,80 L85,55 L100,40 L75,35 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-linejoin=\"round\"/><line x1=\"60\" y1=\"10\" x2=\"60\" y2=\"65\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><line x1=\"60\" y1=\"10\" x2=\"45\" y2=\"35\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.7\"/><line x1=\"60\" y1=\"10\" x2=\"75\" y2=\"35\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.7\"/><line x1=\"45\" y1=\"35\" x2=\"35\" y2=\"55\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><line x1=\"75\" y1=\"35\" x2=\"85\" y2=\"55\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><line x1=\"60\" y1=\"65\" x2=\"25\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><line x1=\"60\" y1=\"65\" x2=\"95\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><path d=\"M25,80 L10,90 L15,75\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><path d=\"M95,80 L110,75 L105,90\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><polygon points=\"58,10 60,5 62,10\" fill=\"currentColor\" opacity=\"0.4\"/><path d=\"M20,40 L30,45 L35,55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><path d=\"M100,40 L90,45 L85,55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><circle cx=\"60\" cy=\"38\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.3\"/></svg>"

// 6. PAPER TEXTURE -- Subtle fiber/grain lines simulating paper surface (24 elements)
#let _paper-texture-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><line x1=\"10\" y1=\"15\" x2=\"25\" y2=\"14\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"50\" y1=\"30\" x2=\"62\" y2=\"32\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.06\"/><line x1=\"90\" y1=\"10\" x2=\"100\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.07\"/><line x1=\"140\" y1=\"25\" x2=\"155\" y2=\"23\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.05\"/><line x1=\"170\" y1=\"40\" x2=\"185\" y2=\"42\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"30\" y1=\"60\" x2=\"42\" y2=\"58\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.06\"/><line x1=\"70\" y1=\"75\" x2=\"85\" y2=\"77\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.07\"/><line x1=\"110\" y1=\"55\" x2=\"120\" y2=\"53\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.05\"/><line x1=\"160\" y1=\"70\" x2=\"172\" y2=\"72\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"15\" y1=\"100\" x2=\"28\" y2=\"102\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.06\"/><line x1=\"55\" y1=\"115\" x2=\"68\" y2=\"113\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.07\"/><line x1=\"95\" y1=\"95\" x2=\"108\" y2=\"97\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.05\"/><line x1=\"130\" y1=\"110\" x2=\"145\" y2=\"108\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"175\" y1=\"100\" x2=\"188\" y2=\"102\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.06\"/><line x1=\"20\" y1=\"140\" x2=\"35\" y2=\"138\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.07\"/><line x1=\"60\" y1=\"155\" x2=\"72\" y2=\"157\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.05\"/><line x1=\"100\" y1=\"135\" x2=\"115\" y2=\"133\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"145\" y1=\"150\" x2=\"158\" y2=\"152\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.06\"/><line x1=\"180\" y1=\"140\" x2=\"193\" y2=\"138\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.07\"/><line x1=\"25\" y1=\"175\" x2=\"38\" y2=\"177\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.05\"/><line x1=\"65\" y1=\"190\" x2=\"78\" y2=\"188\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"105\" y1=\"170\" x2=\"118\" y2=\"172\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.06\"/><line x1=\"150\" y1=\"185\" x2=\"162\" y2=\"183\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.07\"/><line x1=\"185\" y1=\"175\" x2=\"198\" y2=\"177\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.05\"/></svg>"

// 7. WASHI TAPE -- Decorative semi-transparent tape pattern (for tape-strip component)
#let _washi-tape-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 20\"><rect x=\"0\" y=\"0\" width=\"100\" height=\"20\" fill=\"currentColor\" opacity=\"0.3\"/><line x1=\"5\" y1=\"4\" x2=\"15\" y2=\"4\" stroke=\"white\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"20\" y1=\"8\" x2=\"30\" y2=\"8\" stroke=\"white\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"35\" y1=\"12\" x2=\"45\" y2=\"12\" stroke=\"white\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"50\" y1=\"6\" x2=\"60\" y2=\"6\" stroke=\"white\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"65\" y1=\"14\" x2=\"75\" y2=\"14\" stroke=\"white\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"80\" y1=\"10\" x2=\"90\" y2=\"10\" stroke=\"white\" stroke-width=\"0.8\" opacity=\"0.3\"/><circle cx=\"10\" cy=\"12\" r=\"1.5\" fill=\"white\" opacity=\"0.2\"/><circle cx=\"40\" cy=\"6\" r=\"1\" fill=\"white\" opacity=\"0.2\"/><circle cx=\"70\" cy=\"16\" r=\"1.5\" fill=\"white\" opacity=\"0.2\"/><circle cx=\"90\" cy=\"4\" r=\"1\" fill=\"white\" opacity=\"0.2\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let torn-edge(color: palette.ink, width: 100%, height: 20pt) = {
  let svg = _torn-edge-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let paper-clip(color: palette.ink, size: 40pt) = {
  let svg = _paper-clip-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size * 0.4, height: size)
}

#let scissors-line(color: palette.ink, width: 100%, height: 20pt) = {
  let svg = _scissors-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let fold-crease(color: palette.ink, size: 60pt) = {
  let svg = _fold-crease-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let origami-crane(color: palette.accent, width: 100pt, height: 85pt) = {
  let svg = _origami-crane-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let paper-texture(color: palette.ink, width: 100%, height: 100%) = {
  let svg = _paper-texture-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let washi-tape(color: palette.tertiary, width: 100pt, height: 20pt) = {
  let svg = _washi-tape-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Background Atmosphere (PERSISTENT on every content slide)
// =====================================================================

/// _bg-atmosphere -- Creates the paper-craft world on EVERY content slide.
/// Paper texture + fold crease in corner + clip holding header + torn edge at bottom.
#let _bg-atmosphere(pal) = {
  // 1. Paper fiber texture covering full slide
  place(top + left,
    box(width: 100%, height: 100%,
      paper-texture(color: pal.ink, width: 100%, height: 100%)))
  // 2. Fold crease in top-right corner (8% visible via heavily transparent color)
  place(top + right, dx: -5pt, dy: -5pt,
    fold-crease(color: pal.ink.transparentize(92%), size: 70pt))
  // 3. Paper clip "holding" the header area to the page
  place(top + left, dx: 0.5em, dy: 0.4em,
    paper-clip(color: pal.ink.transparentize(65%), size: 32pt))
  // 4. Torn edge at bottom (very faint -- reveals another layer beneath)
  place(bottom + left, dy: 3pt,
    torn-edge(color: pal.ink.transparentize(94%), width: 100%, height: 12pt))
}

// =====================================================================
// Reusable Components (10 structurally diverse)
// =====================================================================

/// paper-card -- Card with TORN EDGE top, drop shadow, paper-layer feel
#let paper-card(title, body, accent: palette.accent) = {
  let pal = palette
  shadow(dx: 4pt, dy: 4pt, blur: 6pt, fill: rgb(0, 0, 0, 12%), radius: 3pt)[
    #block(
      width: 100%,
      fill: pal.paper-1,
      radius: 3pt,
      clip: true,
      stroke: 0.5pt + pal.ink-faint,
    )[
      // Torn edge at top as colored accent
      #place(top + left, dy: 0pt,
        box(width: 100%, height: 8pt,
          torn-edge(color: accent, width: 100%, height: 8pt)))
      // Content
      #block(width: 100%, inset: (x: 1em, top: 1.2em, bottom: 0.8em))[
        #stack(spacing: .8em,
          [#text(size: typo.body, weight: "bold", fill: pal.ink, title)],
          [#set text(size: 13pt, fill: pal.ink-dim)
           #body
           #lazy-v(1fr)],
        )
      ]
    ]
  ]
}

/// cutout-stat -- Number on a circular CUTOUT shape (punched-out paper circle)
#let cutout-stat(label, value, description: none, accent: palette.accent) = {
  let pal = palette
  let text-accent = _readable-accent(accent)
  block(width: 100%, fill: pal.paper-1, inset: (x: 0.4em, y: 0.4em), radius: 3pt)[
    #stack(spacing: .8em,
      [// Label kicker
       #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: text-accent,
        upper(label),
      )],
      [// Circular cutout with shadow (using shadowed)
       #shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 14%), radius: 34pt)[
         #circle(radius: 34pt, fill: pal.paper-1,
           stroke: 1.5pt + accent.transparentize(40%))[
           #set align(center + horizon)
           #text(size: 34pt, weight: "bold", fill: text-accent, value)
         ]
       ]],
      [#if description != none {
         text(size: 12pt, fill: pal.ink-muted, description)
       }
       #lazy-v(1fr)],
    )
  ]
}

/// note-quote -- Sticky note (slightly rotated, folded corner shadow, warm color)
#let note-quote(body, cite: none) = {
  let pal = palette
  let note-color = rgb("#FFF3C4")  // Opaque warm sticky-note yellow
  shadow(dx: 5pt, dy: 5pt, blur: 7pt, fill: rgb(0, 0, 0, 14%), radius: 1pt)[
    #block(
      width: 92%,
      fill: note-color,
      inset: (x: 1.2em, y: 1em),
      radius: 1pt,
    )[
      // Folded corner triangle (top-right)
      #place(top + right, dx: 0pt, dy: 0pt,
        polygon(fill: pal.ink.transparentize(85%),
          (0pt, 0pt), (0pt, 14pt), (-14pt, 0pt)))
      #set text(size: typo.body, style: "italic", fill: pal.ink)
      #body
      #if cite != none {
        v(0.5em)
        text(size: typo.tiny, style: "normal", weight: "medium", fill: pal.ink-muted,
          [--- #cite])
      }
    ]
  ]
}

/// folder-box -- Paper folder tab shape (trapezoid top tab + content area)
#let folder-box(title, body, accent: palette.secondary) = {
  let pal = palette
  // Compute an opaque folder fill from the accent
  let folder-fill = accent.lighten(75%)
  block(width: 100%)[
    // Folder tab (trapezoid-ish) positioned above
    #place(top + left, dx: 12pt, dy: -14pt,
      box(width: 80pt, height: 16pt)[
        #polygon(
          fill: accent.lighten(30%),
          (0pt, 16pt), (6pt, 0pt), (74pt, 0pt), (80pt, 16pt),
        )
        #place(center + horizon,
          text(size: 8pt, weight: "bold", fill: pal.ink, upper(title)))
      ])
    // Content with shadow
    #shadow(dx: 4pt, dy: 4pt, blur: 6pt, fill: rgb(0, 0, 0, 10%), radius: (bottom: 3pt, top: 3pt))[
      #block(
        width: 100%,
        fill: folder-fill,
        stroke: 0.5pt + accent.transparentize(50%),
        inset: (x: 1em, top: 0.8em, bottom: 0.8em),
        radius: (bottom: 3pt),
      )[
        #set text(size: 13pt, fill: pal.ink-dim)
        #body
        #lazy-v(1fr)
      ]
    ]
  ]
}

/// stamp-tag -- Rubber stamp effect (text inside rough-bordered rounded rect)
#let stamp-tag(body, color: palette.accent) = {
  box(
    fill: none,
    stroke: 2pt + color,
    inset: (x: 10pt, y: 4pt),
    radius: 3pt,
  )[
    #text(size: typo.small, weight: "bold", fill: _readable-accent(color), upper(body))
  ]
}

/// scissors-divider -- Scissors SVG + dashed cut line spanning page width
#let scissors-divider(color: palette.ink-muted) = {
  block(width: 100%, height: 22pt)[
    #place(left + horizon,
      scissors-line(color: color, width: 100%, height: 18pt))
  ]
}

/// collage-highlight -- 2-3 overlapping paper rectangles at different angles + shadow
#let collage-highlight(body, colors: (palette.accent, palette.secondary, palette.tertiary)) = {
  let pal = palette
  block(width: 100%, inset: (y: 8pt))[
    // Background rotated paper layers (opaque fills)
    #place(dx: 8pt, dy: -4pt,
      rotate(-2deg,
        block(width: 85%, height: 90%, fill: colors.at(0).lighten(80%), radius: 2pt)))
    #place(dx: -4pt, dy: 6pt,
      rotate(1.5deg,
        block(width: 88%, height: 85%, fill: colors.at(1).lighten(80%), radius: 2pt)))
    // Main content layer on top with proper shadow
    #shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 10%), radius: 2pt)[
      #block(
        width: 100%,
        fill: pal.paper-1,
        inset: (x: 1.2em, y: 1em),
        radius: 2pt,
        stroke: 0.3pt + pal.ink-faint,
      )[
        #set text(size: typo.body, fill: pal.ink)
        #body
      ]
    ]
  ]
}

/// envelope-card -- Triangular flap top (opened envelope) with content "inside"
#let envelope-card(title, body, accent: palette.accent) = {
  let pal = palette
  shadow(dx: 4pt, dy: 4pt, blur: 6pt, fill: rgb(0, 0, 0, 12%), radius: 2pt)[
    // Envelope body using stack for header flap + content
    #stack(spacing: 0pt,
      // Triangular flap at top
      block(width: 100%, height: 22pt, fill: pal.paper-2, radius: (top: 2pt), clip: true)[
        #place(top + left,
          polygon(
            fill: accent.lighten(60%),
            (0pt, 0pt), (50%, 22pt), (100%, 0pt),
          ))
      ],
      // Content
      block(width: 100%, fill: pal.paper-2, stroke: (left: 0.5pt + pal.ink-faint, right: 0.5pt + pal.ink-faint, bottom: 0.5pt + pal.ink-faint), inset: (x: 1.2em, top: 0.4em, bottom: 0.8em), radius: (bottom: 2pt))[
        #stack(spacing: .8em,
          [#text(size: typo.body, weight: "bold", fill: pal.ink, title)],
          [#set text(size: 13pt, fill: pal.ink-dim)
           #body
           #lazy-v(1fr)],
        )
      ],
    )
  ]
}

/// tape-strip -- Semi-transparent diagonal washi tape strip across a card
#let tape-strip(body, color: palette.tertiary) = {
  let pal = palette
  shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: rgb(0, 0, 0, 8%), radius: 2pt)[
    #block(width: 100%, fill: pal.paper-1, inset: (x: 1em, top: 1.4em, bottom: 0.8em), radius: 2pt,
      stroke: 0.3pt + pal.ink-faint)[
      // Washi tape diagonally placed
      #place(top + right, dx: -8pt, dy: -4pt,
        rotate(-15deg,
          washi-tape(color: color, width: 65pt, height: 12pt)))
      #set text(size: 13pt, fill: pal.ink-dim)
      #body
      #lazy-v(1fr)
    ]
  ]
}

/// origami-label -- Small folded-corner label (bookmark origami shape)
#let origami-label(body, color: palette.accent) = {
  box(inset: (x: 8pt, y: 3pt))[
    #place(top + left,
      polygon(fill: color.transparentize(65%),
        (0pt, 0pt), (0pt, 18pt), (7pt, 12pt)))
    #h(10pt)
    #text(size: typo.small, weight: "medium", fill: _readable-accent(color), body)
  ]
}

/// craft-grid -- Background cutting-mat grid (very subtle, for section/title slides)
#let craft-grid(color: palette.ink-ghost, width: 100%, height: 100%) = {
  box(width: width, height: height)[
    // Vertical grid lines
    #for i in range(1, 10) {
      place(left + top, dx: i * 10%,
        line(start: (0pt, 0pt), end: (0pt, 100%), stroke: 0.3pt + color))
    }
    // Horizontal grid lines
    #for i in range(1, 7) {
      place(left + top, dy: i * 14.3%,
        line(start: (0pt, 0pt), end: (100%, 0pt), stroke: 0.3pt + color))
    }
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Header with torn-edge underline accent (NOT a straight line)
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
    // TORN EDGE as header underline (signature element)
    box(width: 120pt, height: 6pt,
      torn-edge(color: pal.accent, width: 120pt, height: 6pt)),
  )
}

/// _slide-footer -- Footer with scissors separator
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[PAPER-CRAFT]
    },
    text(fill: pal.accent-muted, size: 8pt)[\u{2702}],
    {
      set std.align(right)
      set text(size: 7pt)
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
    stack(
      spacing: .8em,
      {
        set text(size: 8pt, fill: pal.dark-ink.transparentize(50%))
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
      },
      {
        if self.store.title != none {
          stack(
            spacing: .8em,
            {
              set text(size: 1.25em, weight: "semibold", fill: pal.dark-ink)
              utils.call-or-display(self, self.store.title)
            },
            box(width: 100pt, height: 5pt,
              torn-edge(color: pal.accent, width: 100pt, height: 5pt)),
          )
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
  set text(fill: pal.dark-ink.transparentize(50%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[PAPER-CRAFT]
    },
    text(fill: pal.accent-muted, size: 8pt)[\u{2702}],
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Warm cream paper bg, persistent craft atmosphere on every slide
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
  let background = {
    _bg-atmosphere(pal)
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer, background: background),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deep navy paper with lighter paper layers on top (reversed collage)
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

  let background = {
    // Ghost: large origami crane outline at 5% (signature dark-slide decoration)
    place(center + horizon, dy: -10pt,
      origami-crane(color: pal.dark-ink.transparentize(95%), width: 240pt, height: 204pt))
    // Paper texture at low opacity on dark
    place(top + left,
      box(width: 100%, height: 100%,
        paper-texture(color: pal.dark-ink.transparentize(96%), width: 100%, height: 100%)))
    // Scattered light paper fragments (reversed collage)
    place(top + right, dx: -55pt, dy: 25pt,
      rotate(3deg,
        block(width: 38pt, height: 28pt, fill: pal.dark-ink.transparentize(92%), radius: 2pt)))
    place(bottom + left, dx: 35pt, dy: -35pt,
      rotate(-2deg,
        block(width: 32pt, height: 22pt, fill: pal.dark-ink.transparentize(94%), radius: 2pt)))
    place(top + left, dx: 80pt, dy: 40pt,
      rotate(1.5deg,
        block(width: 25pt, height: 30pt, fill: pal.accent.transparentize(92%), radius: 2pt)))
  }
  let setting(body) = {
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
      background: background,
      margin: (top: 4em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Craft table with origami crane hero, layered paper elements, shadows
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Base warm paper background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page paper texture
    place(top + left,
      box(width: 100%, height: 100%,
        paper-texture(color: pal.ink, width: 100%, height: 100%)))

    // Craft cutting-mat grid at very low opacity
    place(top + left,
      craft-grid(color: pal.ink.transparentize(97%), width: 100%, height: 100%))

    // Decorative torn paper strip across top area
    place(top + left, dy: 35pt,
      torn-edge(color: pal.accent.transparentize(65%), width: 100%, height: 12pt))

    // Decorative torn paper strip across bottom area
    place(bottom + left, dy: -25pt,
      torn-edge(color: pal.secondary.transparentize(75%), width: 100%, height: 12pt))

    // ORIGAMI CRANE hero decoration -- top right
    place(top + right, dx: -50pt, dy: 25pt,
      origami-crane(color: pal.accent.transparentize(20%), width: 130pt, height: 110pt))

    // Second smaller crane -- bottom left
    place(bottom + left, dx: 35pt, dy: -45pt,
      origami-crane(color: pal.secondary.transparentize(60%), width: 75pt, height: 64pt))

    // Paper clips holding things
    place(top + left, dx: 55pt, dy: 18pt,
      paper-clip(color: pal.ink.transparentize(50%), size: 38pt))
    place(top + right, dx: -175pt, dy: 12pt,
      paper-clip(color: pal.secondary.transparentize(60%), size: 32pt))

    // Layered paper rectangles (with shadows) -- LEFT stack
    place(left + horizon, dx: 25pt, dy: -15pt,
      rotate(-1.5deg)[
        #shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 10%), radius: 2pt)[
          #block(width: 55pt, height: 70pt, fill: pal.accent.lighten(60%), radius: 2pt,
            stroke: 0.3pt + pal.accent.transparentize(40%))
        ]
      ])
    place(left + horizon, dx: 45pt, dy: 12pt,
      rotate(1deg)[
        #shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 10%), radius: 2pt)[
          #block(width: 45pt, height: 55pt, fill: pal.secondary.lighten(60%), radius: 2pt,
            stroke: 0.3pt + pal.secondary.transparentize(40%))
        ]
      ])

    // RIGHT decorative stack
    place(right + horizon, dx: -35pt, dy: 25pt,
      rotate(2deg)[
        #shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 10%), radius: 2pt)[
          #block(width: 50pt, height: 65pt, fill: pal.tertiary.lighten(60%), radius: 2pt,
            stroke: 0.3pt + pal.tertiary.transparentize(40%))
        ]
      ])

    // CENTER TITLE CARD (with drop shadow -- the main focal element)
    set std.align(center + horizon)
    pad(x: 7em, y: 2.5em)[
      #shadow(dx: 5pt, dy: 5pt, blur: 8pt, fill: rgb(0, 0, 0, 15%), radius: 4pt)[
        // Title card itself
        #block(
          width: 100%,
          fill: pal.paper-1,
          inset: (x: 2em, y: 1.5em),
          radius: 4pt,
          stroke: 0.5pt + pal.ink-faint,
        )[
          // Torn edge accent at top of card
          #place(top + left, dy: -1pt,
            box(width: 100%, height: 5pt,
              torn-edge(color: pal.accent, width: 100%, height: 5pt)))
          #v(0.6em)
          // Institution kicker
          #if info.institution != none {
            text(
              size: typo.tiny,
              weight: "medium",
              tracking: 2pt,
              fill: _readable-accent(pal.accent),
              upper(info.institution),
            )
            v(0.8em)
          }
          // Title
          #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
          #v(0.5em)
          // Scissors divider
          #block(width: 55%,
            scissors-line(color: pal.ink-muted, width: 100%, height: 12pt))
          #v(0.4em)
          // Subtitle
          #if info.subtitle != none {
            text(size: 17pt, weight: "regular", style: "italic", fill: pal.ink-dim, info.subtitle)
            v(0.8em)
          }
          // Author + date
          #{
            set text(size: typo.tiny, fill: pal.meta-color)
            if info.author != none {
              upper[#info.author]
            }
            if info.author != none and info.date != none {
              h(1.5em)
              text(fill: _readable-accent(pal.accent), size: 7pt)[\u{2702}]
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

/// new-section-slide -- Paper layer reveal with torn edges and cutout section number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Paper texture
    place(top + left,
      box(width: 100%, height: 100%,
        paper-texture(color: pal.ink, width: 100%, height: 100%)))

    // Torn edge across middle (revealing a colored layer beneath the paper)
    place(left + horizon, dy: -25pt,
      torn-edge(color: pal.accent.transparentize(75%), width: 100%, height: 16pt))

    // Colored paper layer visible through the tear
    place(left + horizon, dy: -12pt,
      block(width: 100%, height: 35pt, fill: pal.accent.lighten(85%)))

    // Section number as CUTOUT BADGE (with proper shadow)
    place(top + right, dx: -75pt, dy: 35pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        shadow(dx: 4pt, dy: 4pt, blur: 6pt, fill: rgb(0, 0, 0, 14%), radius: 38pt)[
          #circle(radius: 38pt, fill: pal.paper-1,
            stroke: 1.5pt + pal.accent.transparentize(30%))[
            #set align(center + horizon)
            #text(fill: _readable-accent(pal.accent), size: 36pt, weight: "bold", num-str)
          ]
        ]
      },
    )

    // Paper clip on section badge
    place(top + right, dx: -48pt, dy: 30pt,
      paper-clip(color: pal.ink.transparentize(50%), size: 28pt))

    // Small origami crane (decorative)
    place(bottom + right, dx: -55pt, dy: -35pt,
      origami-crane(color: pal.secondary.transparentize(80%), width: 55pt, height: 47pt))

    // Content positioned in bottom-left area
    place(bottom + left, dx: 4em, dy: -3em)[
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: _readable-accent(pal.accent),
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
      // Torn edge underline (NOT a straight line)
      #box(width: 100pt, height: 6pt,
        torn-edge(color: pal.accent, width: 100pt, height: 6pt))
    ]

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt)[PAPER-CRAFT],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Bold paper cutout statement on accent color
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.accent.darken(10%),
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Paper texture on colored bg
    place(top + left,
      box(width: 100%, height: 100%,
        paper-texture(color: rgb("#FFFFFF").transparentize(94%), width: 100%, height: 100%)))
    // Torn edges top and bottom (ripped paper feel)
    place(top + left, dy: 5pt,
      torn-edge(color: rgb("#FFFFFF").transparentize(75%), width: 100%, height: 10pt))
    place(bottom + left, dy: -5pt,
      torn-edge(color: rgb("#FFFFFF").transparentize(75%), width: 100%, height: 10pt))
    // Scattered paper fragment debris
    place(top + right, dx: -45pt, dy: 18pt,
      rotate(5deg,
        block(width: 28pt, height: 18pt, fill: rgb("#FFFFFF").transparentize(92%), radius: 2pt)))
    place(bottom + left, dx: 35pt, dy: -22pt,
      rotate(-3deg,
        block(width: 22pt, height: 30pt, fill: rgb("#FFFFFF").transparentize(94%), radius: 2pt)))
    place(top + left, dx: 25pt, dy: 25pt,
      rotate(2deg,
        block(width: 18pt, height: 22pt, fill: rgb("#FFFFFF").transparentize(93%), radius: 2pt)))
    // Paper clip
    place(top + left, dx: 55pt, dy: 8pt,
      paper-clip(color: rgb("#FFFFFF").transparentize(70%), size: 28pt))
    // Content
    set text(fill: rgb("#FFFFFF"), size: 1.6em, weight: "bold")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1.5em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Paper collage farewell with origami cranes (bookends with title)
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Paper texture
    place(top + left,
      box(width: 100%, height: 100%,
        paper-texture(color: pal.ink, width: 100%, height: 100%)))

    // Craft grid (shared with title -- bookending)
    place(top + left,
      craft-grid(color: pal.ink.transparentize(97%), width: 100%, height: 100%))

    // Torn paper strips (MATCHING title-slide -- bookending)
    place(top + left, dy: 35pt,
      torn-edge(color: pal.accent.transparentize(65%), width: 100%, height: 12pt))
    place(bottom + left, dy: -25pt,
      torn-edge(color: pal.secondary.transparentize(75%), width: 100%, height: 12pt))

    // Origami cranes (MATCHING title-slide -- bookending)
    place(top + right, dx: -55pt, dy: 22pt,
      origami-crane(color: pal.accent.transparentize(30%), width: 115pt, height: 98pt))
    place(bottom + left, dx: 28pt, dy: -50pt,
      origami-crane(color: pal.secondary.transparentize(60%), width: 80pt, height: 68pt))
    place(top + left, dx: 70pt, dy: 55pt,
      origami-crane(color: pal.tertiary.transparentize(80%), width: 55pt, height: 47pt))

    // Paper clips (MATCHING title-slide -- bookending)
    place(top + left, dx: 45pt, dy: 16pt,
      paper-clip(color: pal.ink.transparentize(50%), size: 36pt))

    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost)[CRAFT],
    )

    // Layered paper fragments (matching title) with proper shadows
    place(left + horizon, dx: 28pt, dy: 18pt,
      rotate(2deg)[
        #shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 10%), radius: 2pt)[
          #block(width: 42pt, height: 52pt, fill: pal.accent.lighten(55%), radius: 2pt)
        ]
      ])
    place(right + horizon, dx: -30pt, dy: -12pt,
      rotate(-1.5deg)[
        #shadow(dx: 3pt, dy: 3pt, blur: 5pt, fill: rgb(0, 0, 0, 10%), radius: 2pt)[
          #block(width: 38pt, height: 48pt, fill: pal.secondary.lighten(55%), radius: 2pt)
        ]
      ])

    // Center content card (with shadow)
    set std.align(center + horizon)
    pad(x: 5em)[
      #shadow(dx: 4pt, dy: 4pt, blur: 7pt, fill: rgb(0, 0, 0, 14%), radius: 4pt)[
        #block(width: 55%, inset: (x: 2em, y: 1.5em), fill: pal.paper-1, radius: 4pt,
          stroke: 0.5pt + pal.ink-faint)[
          // Torn edge on card top
          #place(top + left, dy: -1pt,
            box(width: 100%, height: 4pt,
              torn-edge(color: pal.accent, width: 100%, height: 4pt)))
          #v(0.8em)
          // Crane ornament
          #std.align(center, origami-crane(color: pal.accent, width: 48pt, height: 40pt))
          #v(0.5em)
          #text(size: 2em, weight: "bold", fill: pal.ink, body)
          #v(0.5em)
          // Scissors divider
          #std.align(center, block(width: 130pt,
            scissors-line(color: pal.ink-muted, width: 130pt, height: 10pt)))
          #v(0.5em)
          #text(size: 9pt, fill: pal.meta-color, tracking: 2pt)[PAPER-CRAFT]
        ]
      ]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point (MUST BE LAST -- forward references resolved)
// =====================================================================

#let paper-craft-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "origami",
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
      primary: _readable-accent(pal.accent),
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
