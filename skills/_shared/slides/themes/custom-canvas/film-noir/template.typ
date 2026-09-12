// Film Noir Theme -- Classic 1940s film noir cinema
// Venetian blind shadows cut across EVERY slide like dramatic chiaroscuro
// High contrast: deep blacks, stark whites, crimson red accents
// Film-grain texture, smoke wisps, rain streaks, spotlight cones
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  classic: (bg: rgb("#F8F7F5"), ink: rgb("#1A1A1A"), accent: rgb("#8B0000"), secondary: rgb("#4A4A4A")),
  sepia: (bg: rgb("#F5F0E8"), ink: rgb("#2C1810"), accent: rgb("#6B1C23"), secondary: rgb("#5C4A3A")),
  technicolor: (bg: rgb("#F4F6F7"), ink: rgb("#1C1C2A"), accent: rgb("#1B5E6B"), secondary: rgb("#3D4A5C")),
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
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    // Derived from ink
    ink-dim: ink.transparentize(20%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent
    accent-dim: accent.transparentize(25%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary
    secondary-dim: secondary.transparentize(30%),
    secondary-faint: secondary.transparentize(70%),
    // Special noir colors
    shadow: ink.transparentize(94%),
    shadow-strong: ink.transparentize(85%),
    film-frame: ink.transparentize(70%),
    // Dark slide background
    bg-dark: rgb("#0D0D0D"),
    // Meta
    meta-color: ink.transparentize(55%),
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

#let _mono-font = ("Menlo", "Courier New")
#let _sans-font = ("Georgia", "Heiti SC")

// =====================================================================
// SVG Definitions
// =====================================================================

// VENETIAN BLIND SHADOWS -- THE signature visual. 14 diagonal bands at varying
// widths and opacities, slightly converging to suggest perspective through window slats.
// These cut across the full page diagonally (roughly 15-20 degrees).
#let _venetian-blinds-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 600\" preserveAspectRatio=\"none\"><g fill=\"#000000\"><polygon points=\"-20,0 60,0 680,600 600,600\" opacity=\"0.04\"/><polygon points=\"40,0 100,0 720,600 660,600\" opacity=\"0.03\"/><polygon points=\"120,0 170,0 790,600 740,600\" opacity=\"0.05\"/><polygon points=\"190,0 240,0 860,600 810,600\" opacity=\"0.03\"/><polygon points=\"270,0 330,0 950,600 890,600\" opacity=\"0.04\"/><polygon points=\"350,0 395,0 1015,600 970,600\" opacity=\"0.03\"/><polygon points=\"420,0 475,0 1095,600 1040,600\" opacity=\"0.05\"/><polygon points=\"500,0 545,0 1165,600 1120,600\" opacity=\"0.03\"/><polygon points=\"575,0 630,0 1250,600 1195,600\" opacity=\"0.05\"/><polygon points=\"650,0 695,0 1315,600 1270,600\" opacity=\"0.04\"/><polygon points=\"720,0 780,0 1400,600 1340,600\" opacity=\"0.04\"/><polygon points=\"800,0 850,0 1470,600 1420,600\" opacity=\"0.03\"/><polygon points=\"-80,0 -30,0 590,600 540,600\" opacity=\"0.04\"/><polygon points=\"-150,0 -100,0 520,600 470,600\" opacity=\"0.03\"/></g></svg>"

// Venetian blinds for blind-card (6-8% opacity -- atmospheric but text stays readable)
#let _venetian-blinds-strong-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 600\" preserveAspectRatio=\"none\"><g fill=\"#000000\"><polygon points=\"-20,0 60,0 680,600 600,600\" opacity=\"0.07\"/><polygon points=\"40,0 100,0 720,600 660,600\" opacity=\"0.06\"/><polygon points=\"120,0 170,0 790,600 740,600\" opacity=\"0.08\"/><polygon points=\"190,0 240,0 860,600 810,600\" opacity=\"0.05\"/><polygon points=\"270,0 330,0 950,600 890,600\" opacity=\"0.07\"/><polygon points=\"350,0 395,0 1015,600 970,600\" opacity=\"0.06\"/><polygon points=\"420,0 475,0 1095,600 1040,600\" opacity=\"0.08\"/><polygon points=\"500,0 545,0 1165,600 1120,600\" opacity=\"0.06\"/><polygon points=\"575,0 630,0 1250,600 1195,600\" opacity=\"0.07\"/><polygon points=\"650,0 695,0 1315,600 1270,600\" opacity=\"0.06\"/><polygon points=\"720,0 780,0 1400,600 1340,600\" opacity=\"0.07\"/><polygon points=\"800,0 850,0 1470,600 1420,600\" opacity=\"0.05\"/><polygon points=\"-80,0 -30,0 590,600 540,600\" opacity=\"0.06\"/><polygon points=\"-150,0 -100,0 520,600 470,600\" opacity=\"0.05\"/></g></svg>"

// White venetian blinds for dark backgrounds
#let _venetian-blinds-light-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 600\" preserveAspectRatio=\"none\"><g fill=\"#FFFFFF\"><polygon points=\"-20,0 60,0 680,600 600,600\" opacity=\"0.04\"/><polygon points=\"40,0 100,0 720,600 660,600\" opacity=\"0.02\"/><polygon points=\"120,0 170,0 790,600 740,600\" opacity=\"0.05\"/><polygon points=\"190,0 240,0 860,600 810,600\" opacity=\"0.02\"/><polygon points=\"270,0 330,0 950,600 890,600\" opacity=\"0.04\"/><polygon points=\"350,0 395,0 1015,600 970,600\" opacity=\"0.03\"/><polygon points=\"420,0 475,0 1095,600 1040,600\" opacity=\"0.05\"/><polygon points=\"500,0 545,0 1165,600 1120,600\" opacity=\"0.03\"/><polygon points=\"575,0 630,0 1250,600 1195,600\" opacity=\"0.04\"/><polygon points=\"650,0 695,0 1315,600 1270,600\" opacity=\"0.03\"/><polygon points=\"720,0 780,0 1400,600 1340,600\" opacity=\"0.04\"/><polygon points=\"800,0 850,0 1470,600 1420,600\" opacity=\"0.02\"/><polygon points=\"-80,0 -30,0 590,600 540,600\" opacity=\"0.03\"/><polygon points=\"-150,0 -100,0 520,600 470,600\" opacity=\"0.02\"/></g></svg>"

// FILM STRIP BORDER -- sprocket holes and frame lines for title/ending
#let _film-strip-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 600\" preserveAspectRatio=\"none\"><rect x=\"0\" y=\"0\" width=\"800\" height=\"35\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"0\" y=\"565\" width=\"800\" height=\"35\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"30\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"#000000\" opacity=\"0.0\"/><rect x=\"30\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"100\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"170\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"240\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"310\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"380\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"450\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"520\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"590\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"660\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"730\" y=\"8\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"30\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"100\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"170\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"240\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"310\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"380\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"450\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"520\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"590\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"660\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><rect x=\"730\" y=\"573\" width=\"18\" height=\"20\" rx=\"3\" fill=\"none\" stroke=\"#333\" stroke-width=\"1\"/><line x1=\"0\" y1=\"36\" x2=\"800\" y2=\"36\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/><line x1=\"0\" y1=\"564\" x2=\"800\" y2=\"564\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/></svg>"

// SMOKE WISP -- 3 curving trails with varying thickness, bezier curves
#let _smoke-wisp-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 80 120\"><path d=\"M 40 120 C 38 100 42 90 36 80 C 30 70 44 65 40 55 C 36 45 42 38 38 28 C 34 18 42 10 40 2\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.3\" stroke-linecap=\"round\"/><path d=\"M 44 118 C 46 100 40 92 46 82 C 52 72 38 68 44 58 C 50 48 38 42 44 32 C 50 22 42 14 46 4\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.2\" stroke-linecap=\"round\"/><path d=\"M 36 116 C 32 98 38 88 32 78 C 26 68 40 62 34 52 C 28 42 36 34 30 24 C 24 14 34 8 32 0\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.15\" stroke-linecap=\"round\"/></svg>"

// RAIN STREAKS -- 24 short diagonal lines at varying angles and opacities
#let _rain-streaks-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 600\" preserveAspectRatio=\"none\"><g stroke=\"#AABBCC\" stroke-linecap=\"round\"><line x1=\"50\" y1=\"20\" x2=\"45\" y2=\"80\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"120\" y1=\"50\" x2=\"114\" y2=\"120\" stroke-width=\"0.6\" opacity=\"0.2\"/><line x1=\"200\" y1=\"10\" x2=\"193\" y2=\"85\" stroke-width=\"0.9\" opacity=\"0.25\"/><line x1=\"280\" y1=\"80\" x2=\"274\" y2=\"145\" stroke-width=\"0.7\" opacity=\"0.2\"/><line x1=\"350\" y1=\"30\" x2=\"344\" y2=\"100\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"420\" y1=\"60\" x2=\"413\" y2=\"135\" stroke-width=\"0.6\" opacity=\"0.15\"/><line x1=\"500\" y1=\"15\" x2=\"494\" y2=\"90\" stroke-width=\"0.9\" opacity=\"0.25\"/><line x1=\"580\" y1=\"70\" x2=\"573\" y2=\"140\" stroke-width=\"0.7\" opacity=\"0.2\"/><line x1=\"650\" y1=\"40\" x2=\"644\" y2=\"110\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"720\" y1=\"25\" x2=\"714\" y2=\"95\" stroke-width=\"0.6\" opacity=\"0.2\"/><line x1=\"90\" y1=\"200\" x2=\"84\" y2=\"275\" stroke-width=\"0.8\" opacity=\"0.25\"/><line x1=\"180\" y1=\"180\" x2=\"173\" y2=\"255\" stroke-width=\"0.7\" opacity=\"0.2\"/><line x1=\"260\" y1=\"220\" x2=\"254\" y2=\"290\" stroke-width=\"0.9\" opacity=\"0.3\"/><line x1=\"370\" y1=\"190\" x2=\"363\" y2=\"260\" stroke-width=\"0.6\" opacity=\"0.15\"/><line x1=\"460\" y1=\"250\" x2=\"454\" y2=\"320\" stroke-width=\"0.8\" opacity=\"0.25\"/><line x1=\"550\" y1=\"210\" x2=\"543\" y2=\"280\" stroke-width=\"0.7\" opacity=\"0.2\"/><line x1=\"640\" y1=\"240\" x2=\"634\" y2=\"310\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"730\" y1=\"195\" x2=\"723\" y2=\"265\" stroke-width=\"0.6\" opacity=\"0.2\"/><line x1=\"70\" y1=\"380\" x2=\"64\" y2=\"450\" stroke-width=\"0.9\" opacity=\"0.25\"/><line x1=\"160\" y1=\"400\" x2=\"153\" y2=\"470\" stroke-width=\"0.7\" opacity=\"0.2\"/><line x1=\"300\" y1=\"360\" x2=\"294\" y2=\"430\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"410\" y1=\"420\" x2=\"404\" y2=\"490\" stroke-width=\"0.6\" opacity=\"0.15\"/><line x1=\"530\" y1=\"380\" x2=\"524\" y2=\"450\" stroke-width=\"0.8\" opacity=\"0.25\"/><line x1=\"680\" y1=\"400\" x2=\"674\" y2=\"470\" stroke-width=\"0.7\" opacity=\"0.2\"/></g></svg>"

// SPOTLIGHT CONE -- Triangular gradient from top suggesting harsh light
#let _spotlight-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 600\" preserveAspectRatio=\"none\"><defs><linearGradient id=\"spot\" x1=\"0.5\" y1=\"0\" x2=\"0.5\" y2=\"1\"><stop offset=\"0%\" stop-color=\"#FFFFFF\" stop-opacity=\"0.12\"/><stop offset=\"100%\" stop-color=\"#FFFFFF\" stop-opacity=\"0\"/></linearGradient></defs><polygon points=\"350,0 450,0 650,600 150,600\" fill=\"url(#spot)\"/></svg>"

// PAPER CLIP -- small decorative element for dossier-card
#let _paperclip-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 50\"><path d=\"M 6 2 C 2 2 2 8 2 12 L 2 38 C 2 46 8 48 10 48 C 12 48 18 46 18 38 L 18 14 C 18 8 14 6 12 6 C 10 6 6 8 6 14 L 6 34 C 6 38 8 40 10 40 C 12 40 14 38 14 34 L 14 14\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\"/></svg>"

// FILM GRAIN TEXTURE -- simulated noise pattern (stipple dots scattered across page)
#let _film-grain-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 150\" preserveAspectRatio=\"none\"><g fill=\"currentColor\"><circle cx=\"15\" cy=\"12\" r=\"0.5\" opacity=\"0.3\"/><circle cx=\"45\" cy=\"8\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"78\" cy=\"22\" r=\"0.6\" opacity=\"0.25\"/><circle cx=\"112\" cy=\"5\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"145\" cy=\"18\" r=\"0.5\" opacity=\"0.3\"/><circle cx=\"178\" cy=\"10\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"25\" cy=\"35\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"62\" cy=\"42\" r=\"0.5\" opacity=\"0.25\"/><circle cx=\"95\" cy=\"38\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"130\" cy=\"45\" r=\"0.6\" opacity=\"0.3\"/><circle cx=\"165\" cy=\"32\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"190\" cy=\"40\" r=\"0.5\" opacity=\"0.25\"/><circle cx=\"10\" cy=\"58\" r=\"0.5\" opacity=\"0.2\"/><circle cx=\"38\" cy=\"65\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"72\" cy=\"55\" r=\"0.6\" opacity=\"0.3\"/><circle cx=\"108\" cy=\"68\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"140\" cy=\"60\" r=\"0.5\" opacity=\"0.25\"/><circle cx=\"175\" cy=\"72\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"20\" cy=\"85\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"55\" cy=\"92\" r=\"0.5\" opacity=\"0.25\"/><circle cx=\"88\" cy=\"82\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"122\" cy=\"95\" r=\"0.6\" opacity=\"0.3\"/><circle cx=\"155\" cy=\"88\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"185\" cy=\"90\" r=\"0.5\" opacity=\"0.25\"/><circle cx=\"30\" cy=\"108\" r=\"0.5\" opacity=\"0.2\"/><circle cx=\"65\" cy=\"115\" r=\"0.4\" opacity=\"0.25\"/><circle cx=\"98\" cy=\"105\" r=\"0.6\" opacity=\"0.3\"/><circle cx=\"135\" cy=\"118\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"168\" cy=\"110\" r=\"0.5\" opacity=\"0.2\"/><circle cx=\"195\" cy=\"120\" r=\"0.4\" opacity=\"0.25\"/><circle cx=\"8\" cy=\"135\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"42\" cy=\"140\" r=\"0.5\" opacity=\"0.3\"/><circle cx=\"80\" cy=\"130\" r=\"0.4\" opacity=\"0.2\"/><circle cx=\"115\" cy=\"142\" r=\"0.6\" opacity=\"0.25\"/><circle cx=\"150\" cy=\"138\" r=\"0.3\" opacity=\"0.15\"/><circle cx=\"182\" cy=\"145\" r=\"0.5\" opacity=\"0.3\"/></g></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let venetian-blinds(width: 100%, height: 100%) = {
  image(bytes(_venetian-blinds-svg), width: width, height: height)
}

#let venetian-blinds-strong(width: 100%, height: 100%) = {
  image(bytes(_venetian-blinds-strong-svg), width: width, height: height)
}

#let venetian-blinds-light(width: 100%, height: 100%) = {
  image(bytes(_venetian-blinds-light-svg), width: width, height: height)
}

#let film-strip-border(color: palette.ink, width: 100%, height: 100%) = {
  let svg = _film-strip-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let smoke-wisp(color: palette.ink, size-w: 40pt, size-h: 60pt) = {
  let svg = _smoke-wisp-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size-w, height: size-h)
}

#let rain-streaks(width: 100%, height: 100%) = {
  image(bytes(_rain-streaks-svg), width: width, height: height)
}

#let spotlight-cone(width: 100%, height: 100%) = {
  image(bytes(_spotlight-svg), width: width, height: height)
}

#let paperclip(color: palette.secondary, size: 25pt) = {
  let svg = _paperclip-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size * 0.4, height: size)
}

#let film-grain(color: palette.ink, width: 100%, height: 100%) = {
  let svg = _film-grain-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Background Atmosphere (Applied to EVERY content slide)
// =====================================================================

/// _noir-atmosphere -- The world of film noir. Venetian blind shadows +
/// film-grain texture + thin film-frame lines at top/bottom.
/// This is THE defining visual -- without it, slides are just grey corporate.
#let _noir-atmosphere(pal) = {
  // 1. Venetian blind shadows cutting ACROSS the entire slide (4-8% opacity)
  place(top + left,
    box(width: 100%, height: 100%,
      venetian-blinds(width: 100%, height: 100%),
    ),
  )
  // 2. Film grain texture (very subtle noise)
  place(top + left,
    box(width: 100%, height: 100%,
      film-grain(color: pal.ink, width: 100%, height: 100%),
    ),
  )
  // 3. Thin film-frame lines at very top and bottom (like looking through a film frame)
  place(top + left, block(width: 100%, height: 2pt, fill: pal.ink.transparentize(85%)))
  place(bottom + left, block(width: 100%, height: 2pt, fill: pal.ink.transparentize(85%)))
  // 4. Very subtle vignette corners (darkened edges)
  place(top + left,
    block(width: 60pt, height: 60pt, fill: pal.ink.transparentize(96%)))
  place(top + right,
    block(width: 60pt, height: 60pt, fill: pal.ink.transparentize(96%)))
  place(bottom + left,
    block(width: 60pt, height: 60pt, fill: pal.ink.transparentize(96%)))
  place(bottom + right,
    block(width: 60pt, height: 60pt, fill: pal.ink.transparentize(96%)))
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// bullet-hole -- Small decorative circle suggesting a bullet impact
#let bullet-hole(color: palette.ink, size: 4pt) = {
  circle(radius: size / 2, fill: color.transparentize(60%))
}

/// redaction-bar -- Thick black rectangle obscuring "classified" info
#let redaction-bar(width: 60pt) = {
  block(width: width, height: 10pt, fill: rgb("#1A1A1A"))
}

// =====================================================================
// Reusable Components
// =====================================================================

/// dossier-card -- Manila folder style with tab, paper-clip SVG, slight rotation
#let dossier-card(title, body) = {
  rotate(-1deg,
    block(width: 100%, fill: rgb("#F5E6C8"), stroke: 0.5pt + rgb("#C4A46B"), inset: 0pt)[
      // Manila tab at top
      #place(top + left, dx: 12pt, dy: -8pt,
        block(width: 80pt, height: 14pt, fill: rgb("#E8D4A0"), stroke: 0.5pt + rgb("#C4A46B"),
          inset: (x: 6pt, y: 2pt))[
          #text(size: 7pt, weight: "bold", fill: rgb("#5C4A2E"), font: _mono-font, upper(title))
        ]
      )
      // Paper clip accent
      #place(top + right, dx: -8pt, dy: -5pt,
        paperclip(color: rgb("#8A8A8A"), size: 28pt)
      )
      // Content
      #pad(top: 14pt, x: 12pt, bottom: 10pt)[
        #set text(size: 13pt, fill: rgb("#3A2A1A"), font: _sans-font)
        #body
        #lazy-v(1fr)
      ]
    ]
  )
}

/// witness-stat -- LARGE number with dramatic shadow offset (noir title card style)
#let witness-stat(label, value, description: none) = {
  block(width: 100%, fill: palette.bg, inset: (x: 0.6em, y: 0.5em))[
    #stack(spacing: .8em,
      [#text(
        size: typo.tiny,
        weight: "bold",
        tracking: 1.5pt,
        fill: palette.accent,
        font: _mono-font,
        upper(label),
      )],
      [// Value with dramatic shadow
       #shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: palette.ink.transparentize(75%))[
         #text(size: 48pt, weight: "bold", fill: palette.ink, value)
       ]],
      [#stack(spacing: .8em,
         block(width: 40pt, height: 2pt, fill: palette.accent),
         if description != none {
           text(
             size: 13pt,
             weight: "regular",
             fill: palette.ink-muted,
             font: _sans-font,
             description,
           )
         },
       )
       #lazy-v(1fr)],
    )
  ]
}

/// voiceover-quote -- Italic text with smoke-wisp trailing from quotation mark
#let voiceover-quote(body, cite: none) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (left: 2pt + palette.accent),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    // Smoke wisp trailing from the quote mark
    #place(top + left, dx: -2em, dy: -8pt,
      smoke-wisp(color: palette.ink-muted, size-w: 20pt, size-h: 40pt)
    )
    #stack(spacing: .8em,
      text(size: typo.body, style: "italic", fill: palette.ink, body),
      if cite != none {
        text(
          size: typo.tiny,
          style: "normal",
          weight: "bold",
          tracking: 1.2pt,
          fill: palette.meta-color,
          font: _mono-font,
          [-- #upper(cite)],
        )
      },
    )
  ]
}

/// evidence-box -- Box with "CLASSIFIED" header (stamped red text, redaction bars)
#let evidence-box(title, body) = {
  block(
    width: 100%,
    stroke: 1pt + palette.ink-faint,
    clip: true,
    radius: 0pt,
    inset: 0pt,
  )[
    #stack(spacing: 0pt,
      // CLASSIFIED header
      block(width: 100%, fill: palette.ink, inset: (x: 10pt, y: 5pt))[
        #grid(columns: (auto, 1fr, auto), align: horizon,
          text(size: 8pt, weight: "bold", tracking: 2pt, fill: palette.accent, font: _mono-font)[CLASSIFIED],
          [],
          text(size: 7pt, fill: white.transparentize(50%), font: _mono-font)[CASE FILE],
        )
      ],
      // Content with opaque background
      block(width: 100%, fill: palette.bg, inset: (x: 12pt, y: 10pt))[
        #stack(spacing: .8em,
          [#text(size: 14pt, weight: "bold", fill: palette.ink, title)],
          [#set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
           #body
           #lazy-v(1fr)],
        )
      ],
    )
  ]
}

/// suspect-tag -- Typewriter-style monospace tag (evidence label)
#let suspect-tag(body) = {
  box(
    fill: palette.ink.transparentize(92%),
    stroke: 0.5pt + palette.ink-faint,
    inset: (x: 8pt, y: 3pt),
  )[
    #text(size: typo.small, fill: palette.ink, weight: "medium", font: _mono-font, body)
  ]
}

/// reel-divider -- Film strip SVG as divider
#let reel-divider(total-width: 100%) = {
  block(width: total-width, height: 18pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.5pt + palette.ink-faint))
    // Sprocket-hole dots along the line
    #place(left + horizon, dx: 10%, circle(radius: 3pt, fill: palette.ink.transparentize(80%)))
    #place(left + horizon, dx: 25%, circle(radius: 3pt, fill: palette.ink.transparentize(80%)))
    #place(left + horizon, dx: 40%, circle(radius: 3pt, fill: palette.ink.transparentize(80%)))
    #place(left + horizon, dx: 55%, circle(radius: 3pt, fill: palette.ink.transparentize(80%)))
    #place(left + horizon, dx: 70%, circle(radius: 3pt, fill: palette.ink.transparentize(80%)))
    #place(left + horizon, dx: 85%, circle(radius: 3pt, fill: palette.ink.transparentize(80%)))
  ]
}

/// spotlight-highlight -- Content with spotlight cone gradient, rest darkened
#let spotlight-highlight(body) = {
  block(width: 100%, fill: palette.bg, inset: 0pt, clip: true)[
    // Darkened surround
    #place(top + left,
      block(width: 100%, height: 100%, fill: palette.ink.transparentize(92%)))
    // Spotlight cone from top
    #place(top + left,
      box(width: 100%, height: 100%,
        spotlight-cone(width: 100%, height: 100%),
      ),
    )
    // Content on top with opaque background
    #block(width: 100%, fill: palette.bg.transparentize(10%), inset: (x: 1.5em, y: 1em))[
      #set text(fill: palette.ink, size: typo.body, font: _sans-font)
      #body
    ]
  ]
}

/// blind-card -- Card with venetian blind shadow ACROSS it (subtle 6-8% opacity)
#let blind-card(title, body) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: 0.5pt + palette.ink-faint,
    inset: 0pt,
    clip: true,
  )[
    // Venetian blind overlay (decorative, behind content via low opacity)
    #place(top + left,
      box(width: 100%, height: 100%,
        venetian-blinds-strong(width: 100%, height: 100%),
      ),
    )
    // Content with opaque background so text is always readable
    #block(width: 100%, fill: palette.bg.transparentize(5%), inset: (x: 12pt, top: 10pt, bottom: 8pt))[
      #stack(spacing: .8em,
        [#text(size: 14pt, weight: "bold", fill: palette.ink, title)],
        [#set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
         #body
         #lazy-v(1fr)],
      )
    ]
  ]
}

/// flashback-block -- Content in sepia tone with extra film-grain
#let flashback-block(body) = {
  block(
    width: 100%,
    fill: rgb("#F5F0E8"),
    stroke: 0.5pt + rgb("#C4A46B").transparentize(50%),
    inset: 0pt,
    clip: true,
  )[
    // Extra film grain for flashback effect (very subtle)
    #place(top + left,
      box(width: 100%, height: 100%,
        film-grain(color: rgb("#5C4A2E"), width: 100%, height: 100%),
      ),
    )
    // Venetian blind shadows (subtle, same 3-5% as page background)
    #place(top + left,
      box(width: 100%, height: 100%,
        venetian-blinds(width: 100%, height: 100%),
      ),
    )
    // Sepia wash overlay -- max 8% opacity so text stays readable
    #place(top + left,
      block(width: 100%, height: 100%, fill: rgb("#D4A46B").transparentize(92%)),
    )
    // Content with opaque sepia background for readability
    #block(width: 100%, fill: rgb("#F5F0E8").transparentize(5%), inset: (x: 14pt, y: 10pt))[
      #set text(size: 13pt, fill: rgb("#2C1810"), font: _sans-font)
      #body
      #lazy-v(1fr)
    ]
  ]
}

/// title-card -- Full-width cinematic intertitle (black bg, white text, silent film style)
#let title-card(body) = {
  block(
    width: 100%,
    fill: palette.ink,
    inset: (x: 2em, y: 1.2em),
  )[
    #set text(fill: white, size: typo.h2, weight: "bold")
    #set std.align(center)
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
    block(width: 50pt, height: 2pt, fill: pal.accent),
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
      upper[NOIR]
    },
    text(fill: pal.accent, size: 7pt, font: _mono-font)[#sym.bar.v],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: white.transparentize(50%), font: _mono-font)
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
  set text(fill: white.transparentize(60%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[NOIR]
    },
    text(fill: pal.accent, size: 7pt, font: _mono-font)[#sym.bar.v],
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

/// slide -- Film noir world: venetian blind shadows cut across every surface,
/// film-grain texture, thin frame lines. You are INSIDE a 1940s movie.
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
    // THE NOIR ATMOSPHERE -- on EVERY content slide
    _noir-atmosphere(pal)
    // Small smoke wisp in bottom-right corner (barely visible)
    place(bottom + right, dx: -1em, dy: -0.5em,
      smoke-wisp(color: pal.ink-faint, size-w: 15pt, size-h: 30pt),
    )
    show: std.align.with(horizon)
    body
  }
    let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Near-black with rain streaks, spotlight, and ghost text
#let dark-slide(
  title: auto,
  align: auto,
  ghost: "NOIR",
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
    // Rain streaks across the dark background
    place(top + left,
      box(width: 100%, height: 100%,
        rain-streaks(width: 100%, height: 100%),
      ),
    )
    // Light venetian blind lines (white on black)
    place(top + left,
      box(width: 100%, height: 100%,
        venetian-blinds-light(width: 100%, height: 100%),
      ),
    )
    // Single spotlight cone
    place(top + left,
      box(width: 100%, height: 100%,
        spotlight-cone(width: 100%, height: 100%),
      ),
    )
    // Ghost text
    if ghost != none {
      place(center + horizon, dy: 20pt,
        text(size: 140pt, weight: "bold", fill: white.transparentize(96%), ghost),
      )
    }
    set text(fill: white)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg-dark,
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Film strip frame, cinematic opening credits style
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Deep black background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg-dark))

    // Film strip border frame (top and bottom bars with sprocket holes)
    place(top + left,
      box(width: 100%, height: 100%,
        film-strip-border(color: rgb("#2A2A2A"), width: 100%, height: 100%),
      ),
    )

    // Venetian blind shadows (light version on dark bg)
    place(top + left,
      box(width: 100%, height: 100%,
        venetian-blinds-light(width: 100%, height: 100%),
      ),
    )

    // Spotlight from top
    place(top + left,
      box(width: 100%, height: 100%,
        spotlight-cone(width: 100%, height: 100%),
      ),
    )

    // Film grain
    place(top + left,
      box(width: 100%, height: 100%,
        film-grain(color: white, width: 100%, height: 100%),
      ),
    )

    // Smoke wisp bottom-left
    place(bottom + left, dx: 2em, dy: -3em,
      smoke-wisp(color: white.transparentize(70%), size-w: 30pt, size-h: 60pt),
    )

    // Centered title content (in the spotlight)
    set std.align(center + horizon)
    pad(x: 5em, y: 4em)[
      // Studio/institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 3pt,
          fill: white.transparentize(40%),
          font: _mono-font,
          upper(info.institution),
        )
        v(1.5em)
      }
      // Title (dramatic, stark white on black)
      #text(size: typo.display, weight: "bold", fill: white, info.title)
      #v(0.8em)
      // Thin divider line
      #std.align(center, block(width: 120pt, height: 1pt, fill: pal.accent))
      #v(0.8em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", style: "italic", fill: white.transparentize(20%), info.subtitle)
        v(1.2em)
      }
      // Author + date (like film credits)
      #{
        set text(size: typo.tiny, fill: white.transparentize(50%), font: _mono-font)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(2em)
          text(fill: pal.accent, size: 6pt)[#sym.circle.filled]
          h(2em)
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

/// new-section-slide -- Cinematic act card with dramatic shadow
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Near-black background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg-dark))

    // Venetian blind shadows (dramatic on section slides)
    place(top + left,
      box(width: 100%, height: 100%,
        venetian-blinds-light(width: 100%, height: 100%),
      ),
    )

    // Spotlight cone
    place(top + left,
      box(width: 100%, height: 100%,
        spotlight-cone(width: 100%, height: 100%),
      ),
    )

    // Large chapter/act number (like a film reel number)
    place(top + right, dx: -3em, dy: 1.5em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: white.transparentize(85%), size: 100pt, weight: "bold", num-str)
      },
    )

    // ACT label (cinema terminology)
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 8pt, fill: pal.accent, font: _mono-font, tracking: 2pt)[ACT],
    )

    // Accent line
    place(top + left, dx: 3em, dy: 3em,
      block(width: 60pt, height: 2pt, fill: pal.accent))

    // Content
    pad(left: 4em, right: 8em, top: 5em, bottom: 2em)[
      #lazy-v(1fr)
      #{
        set text(fill: white, size: 2.4em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.5em)
      #block(width: 50pt, height: 2pt, fill: pal.accent)
      #lazy-v(3fr)
    ]

    // Film frame lines
    place(top + left, block(width: 100%, height: 2.5pt, fill: white.transparentize(90%)))
    place(bottom + left, block(width: 100%, height: 2.5pt, fill: white.transparentize(90%)))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: white.transparentize(70%), size: 7pt, font: _mono-font)[NOIR],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Maximum drama: spotlight on text, everything else in shadow
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg-dark,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Rain on the window
    place(top + left, dx: -3em, dy: -3em,
      box(width: 110%, height: 110%,
        rain-streaks(width: 100%, height: 100%),
      ),
    )
    // Venetian blinds (light on dark)
    place(top + left, dx: -3em, dy: -3em,
      box(width: 110%, height: 110%,
        venetian-blinds-light(width: 100%, height: 100%),
      ),
    )
    // Spotlight cone illuminating center
    place(top + left, dx: -3em, dy: -3em,
      box(width: 110%, height: 110%,
        spotlight-cone(width: 100%, height: 100%),
      ),
    )

    set text(fill: white, size: 1.4em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Film strip frame bookending with title, "FIN" ghost text
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Deep black background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg-dark))

    // Film strip border (bookends with title slide)
    place(top + left,
      box(width: 100%, height: 100%,
        film-strip-border(color: rgb("#2A2A2A"), width: 100%, height: 100%),
      ),
    )

    // Venetian blind shadows
    place(top + left,
      box(width: 100%, height: 100%,
        venetian-blinds-light(width: 100%, height: 100%),
      ),
    )

    // Spotlight
    place(top + left,
      box(width: 100%, height: 100%,
        spotlight-cone(width: 100%, height: 100%),
      ),
    )

    // Ghost text "FIN"
    place(center + horizon,
      text(size: 160pt, weight: "bold", fill: white.transparentize(95%))[FIN],
    )

    // Smoke wisps
    place(bottom + left, dx: 3em, dy: -2em,
      smoke-wisp(color: white.transparentize(70%), size-w: 25pt, size-h: 50pt),
    )
    place(bottom + right, dx: -3em, dy: -3em,
      smoke-wisp(color: white.transparentize(75%), size-w: 20pt, size-h: 45pt),
    )

    // Centered farewell content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Thin accent line above
      #std.align(center, block(width: 80pt, height: 1pt, fill: pal.accent))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: white, body)
      #v(0.8em)
      // Thin accent line below
      #std.align(center, block(width: 80pt, height: 1pt, fill: pal.accent))
      #v(1.2em)
      #text(size: 9pt, fill: white.transparentize(50%), font: _mono-font, tracking: 3pt)[FIN]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let film-noir-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "classic",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink, font: _sans-font)
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
