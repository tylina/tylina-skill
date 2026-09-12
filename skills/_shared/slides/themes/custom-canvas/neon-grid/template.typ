// Neon-Grid Theme -- Retro-futuristic wireframe grid aesthetic
// 80s/90s tech magazine style: perspective grids, wireframe geometry, neon accent lines
// Light gray backgrounds with hot magenta and electric cyan accents
// Geometric, forward-looking, earnest retro-futurism
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  light: (bg: rgb("#F2F0F5"), ink: rgb("#1A1A2A"), accent: rgb("#E91E8C"), secondary: rgb("#00BCD4")),
  dark: (bg: rgb("#1A1A2A"), ink: rgb("#F2F0F5"), accent: rgb("#E91E8C"), secondary: rgb("#00BCD4")),
  vapor: (bg: rgb("#F5F0FA"), ink: rgb("#2A1A3A"), accent: rgb("#9C27B0"), secondary: rgb("#00E5FF")),
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
    ink-light: ink.transparentize(20%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(90%),
    // Derived from accent
    accent-light: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(75%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary
    secondary-light: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(75%),
    // Cards and surfaces
    card: rgb("#FFFFFF"),
    surface: ink.transparentize(94%),
    divider: ink.transparentize(80%),
    // Deep purple for emphasis
    deep-purple: rgb("#4A148C"),
    // Meta
    meta-color: ink.transparentize(60%),
  )
}

// Default palette
#let palette = build-palette("light")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 44pt,
  h1: 30pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 8pt,
  stat: 48pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _sans-font = ("IBM Plex Sans", "Noto Sans SC")

// =====================================================================
// SVG Definitions
// =====================================================================

// 1. Perspective Grid with vanishing point -- converging lines toward center
#let _perspective-grid-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><line x1=\"200\" y1=\"150\" x2=\"0\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"150\" x2=\"100\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"150\" x2=\"200\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"150\" x2=\"300\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"150\" x2=\"400\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"150\" x2=\"0\" y2=\"300\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"150\" x2=\"100\" y2=\"300\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"150\" x2=\"200\" y2=\"300\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"150\" x2=\"300\" y2=\"300\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"150\" x2=\"400\" y2=\"300\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"0\" y1=\"75\" x2=\"400\" y2=\"75\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/><line x1=\"0\" y1=\"110\" x2=\"400\" y2=\"110\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.12\"/><line x1=\"0\" y1=\"190\" x2=\"400\" y2=\"190\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.12\"/><line x1=\"0\" y1=\"225\" x2=\"400\" y2=\"225\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/><circle cx=\"200\" cy=\"150\" r=\"3\" fill=\"currentColor\" opacity=\"0.4\"/></svg>"

// 2. Wireframe sphere -- geodesic lines forming a 3D sphere wireframe
#let _wireframe-sphere-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 120\"><circle cx=\"60\" cy=\"60\" r=\"50\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><ellipse cx=\"60\" cy=\"60\" rx=\"50\" ry=\"20\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><ellipse cx=\"60\" cy=\"60\" rx=\"50\" ry=\"35\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><ellipse cx=\"60\" cy=\"60\" rx=\"20\" ry=\"50\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><ellipse cx=\"60\" cy=\"60\" rx=\"35\" ry=\"50\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"60\" y1=\"10\" x2=\"60\" y2=\"110\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><line x1=\"10\" y1=\"60\" x2=\"110\" y2=\"60\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><circle cx=\"60\" cy=\"60\" r=\"2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"60\" cy=\"10\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"60\" cy=\"110\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"10\" cy=\"60\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"110\" cy=\"60\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/></svg>"

// 3. Neon corner brackets -- L-shaped brackets for frame decoration
#let _corner-brackets-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><path d=\"M 10 30 L 10 10 L 30 10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.7\"/><path d=\"M 370 10 L 390 10 L 390 30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.7\"/><path d=\"M 390 270 L 390 290 L 370 290\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.7\"/><path d=\"M 30 290 L 10 290 L 10 270\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.7\"/><line x1=\"10\" y1=\"10\" x2=\"30\" y2=\"10\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><line x1=\"370\" y1=\"10\" x2=\"390\" y2=\"10\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><line x1=\"10\" y1=\"290\" x2=\"30\" y2=\"290\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><line x1=\"370\" y1=\"290\" x2=\"390\" y2=\"290\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><circle cx=\"10\" cy=\"10\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"390\" cy=\"10\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"10\" cy=\"290\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"390\" cy=\"290\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// 4. Geometric triangle clusters -- overlapping triangles in wireframe
#let _triangle-cluster-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 160 160\"><polygon points=\"80,15 130,100 30,100\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/><polygon points=\"60,40 120,40 90,105\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.4\"/><polygon points=\"45,60 105,75 65,130\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.35\"/><polygon points=\"90,55 140,90 100,140\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><line x1=\"80\" y1=\"15\" x2=\"90\" y2=\"55\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><line x1=\"130\" y1=\"100\" x2=\"140\" y2=\"90\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><circle cx=\"80\" cy=\"15\" r=\"2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"90\" cy=\"55\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"60\" cy=\"40\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"45\" cy=\"60\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.35\"/><circle cx=\"140\" cy=\"90\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.3\"/></svg>"

// 5. Scan-line texture -- horizontal scan lines with varying opacity
#let _scanline-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><line x1=\"0\" y1=\"5\" x2=\"400\" y2=\"5\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"15\" x2=\"400\" y2=\"15\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"25\" x2=\"400\" y2=\"25\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"35\" x2=\"400\" y2=\"35\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"45\" x2=\"400\" y2=\"45\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"55\" x2=\"400\" y2=\"55\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"65\" x2=\"400\" y2=\"65\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"75\" x2=\"400\" y2=\"75\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"85\" x2=\"400\" y2=\"85\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"95\" x2=\"400\" y2=\"95\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"105\" x2=\"400\" y2=\"105\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"115\" x2=\"400\" y2=\"115\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"125\" x2=\"400\" y2=\"125\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"135\" x2=\"400\" y2=\"135\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"145\" x2=\"400\" y2=\"145\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"155\" x2=\"400\" y2=\"155\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"165\" x2=\"400\" y2=\"165\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"175\" x2=\"400\" y2=\"175\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"185\" x2=\"400\" y2=\"185\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"195\" x2=\"400\" y2=\"195\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"205\" x2=\"400\" y2=\"205\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"215\" x2=\"400\" y2=\"215\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"225\" x2=\"400\" y2=\"225\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"235\" x2=\"400\" y2=\"235\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"245\" x2=\"400\" y2=\"245\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"255\" x2=\"400\" y2=\"255\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"265\" x2=\"400\" y2=\"265\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"275\" x2=\"400\" y2=\"275\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/><line x1=\"0\" y1=\"285\" x2=\"400\" y2=\"285\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.06\"/><line x1=\"0\" y1=\"295\" x2=\"400\" y2=\"295\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.04\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let perspective-grid(color: none, width: 100%, height: 100%, pal: palette) = {
  let tint = if color == none { pal.accent } else { color }
  let svg = _perspective-grid-svg.replace("currentColor", tint.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let wireframe-sphere(color: none, size: 80pt, pal: palette) = {
  let tint = if color == none { pal.secondary } else { color }
  let svg = _wireframe-sphere-svg.replace("currentColor", tint.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let corner-brackets(color: none, width: 100%, height: 100%, pal: palette) = {
  let tint = if color == none { pal.accent } else { color }
  let svg = _corner-brackets-svg.replace("currentColor", tint.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let triangle-cluster(color: none, size: 120pt, pal: palette) = {
  let tint = if color == none { pal.accent } else { color }
  let svg = _triangle-cluster-svg.replace("currentColor", tint.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let scanline-texture(color: none, width: 100%, height: 100%, pal: palette) = {
  let tint = if color == none { pal.ink } else { color }
  let svg = _scanline-svg.replace("currentColor", tint.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// neon-dot -- Small glowing dot (double-layered for glow effect)
#let neon-dot(color: none, size: 5pt, pal: palette) = {
  let tint = if color == none { pal.accent } else { color }
  box(width: size * 2, height: size * 2)[
    #place(center + horizon, circle(radius: size, fill: tint.transparentize(70%)))
    #place(center + horizon, circle(radius: size / 2, fill: tint))
  ]
}

/// grid-crosshair -- Small crosshair mark
#let grid-crosshair(color: none, size: 8pt, pal: palette) = {
  let tint = if color == none { pal.secondary } else { color }
  box(width: size, height: size)[
    #place(center + horizon, line(length: size, stroke: 0.5pt + tint))
    #place(center + horizon, line(length: size, angle: 90deg, stroke: 0.5pt + tint))
  ]
}

// =====================================================================
// Reusable Components
// =====================================================================

/// wire-card -- Card with neon wireframe border and accent top line
#let wire-card(title, body, pal: palette) = {
  block(
    width: 100%,
    stroke: 0.5pt + pal.accent-faint,
    fill: pal.card,
    inset: 0pt,
  )[
    // Top neon accent line
    #block(width: 100%, height: 2.5pt, fill: pal.accent)
    #block(width: 100%, inset: (x: 1em, top: 0.7em, bottom: 0.6em))[
      #stack(
        spacing: .8em,
        text(size: typo.body, weight: "bold", fill: pal.ink, title),
        {
          set text(size: 13pt, fill: pal.ink-light, font: _sans-font)
          body
        },
        lazy-v(1fr),
      )
    ]
  ]
}

/// pixel-stat -- Large numeric stat with neon underline and mono label
#let pixel-stat(label, value, description: none, pal: palette) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(size: typo.stat, weight: "bold", fill: pal.ink, value),
      text(
        size: typo.tiny,
        weight: "bold",
        tracking: 1.5pt,
        fill: pal.accent,
        font: _mono-font,
        upper(label),
      ),
      block(width: 35pt, height: 2pt, fill: pal.secondary),
      if description != none {
        text(
          size: 13pt,
          weight: "regular",
          fill: pal.ink-muted,
          font: _sans-font,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// vector-box -- Content box with gradient left border and subtle fill
#let vector-box(body, pal: palette) = {
  block(
    width: 100%,
    inset: (x: 1em, y: 0.8em),
    fill: pal.surface,
    stroke: (left: 2.5pt + pal.accent),
  )[
    #set text(fill: pal.ink, size: typo.body, font: _sans-font)
    #body
  ]
}

/// grid-divider -- Horizontal line with grid crosshairs at intervals
#let grid-divider(total-width: 100%, pal: palette) = {
  block(width: total-width, height: 14pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.5pt + pal.accent-muted))
    #place(left + horizon, dx: 10%, grid-crosshair(color: pal.secondary, size: 6pt, pal: pal))
    #place(left + horizon, dx: 30%, grid-crosshair(color: pal.accent, size: 6pt, pal: pal))
    #place(left + horizon, dx: 50%, neon-dot(color: pal.accent, size: 2.5pt, pal: pal))
    #place(left + horizon, dx: 70%, grid-crosshair(color: pal.accent, size: 6pt, pal: pal))
    #place(left + horizon, dx: 90%, grid-crosshair(color: pal.secondary, size: 6pt, pal: pal))
  ]
}

/// glow-tag -- Pill-shaped tag with neon glow appearance
#let glow-tag(body, color: none, pal: palette) = {
  let tint = if color == none { pal.accent } else { color }
  box(
    fill: tint.transparentize(85%),
    stroke: 0.5pt + tint.transparentize(40%),
    inset: (x: 8pt, y: 3pt),
    radius: 2pt,
  )[
    #text(size: typo.tiny, fill: tint, weight: "bold", font: _mono-font, upper(body))
  ]
}

/// frame-highlight -- Highlighted text block with corner brackets appearance
#let frame-highlight(body, pal: palette) = {
  block(
    width: 100%,
    inset: (x: 1.2em, y: 0.8em),
    stroke: 0.5pt + pal.secondary-muted,
  )[
    // Corner accents
    #place(top + left, dx: -2pt, dy: -2pt,
      block(width: 8pt, height: 8pt)[
        #place(top + left, line(length: 8pt, stroke: 1pt + pal.accent))
        #place(top + left, line(length: 8pt, angle: 90deg, stroke: 1pt + pal.accent))
      ]
    )
    #place(bottom + right, dx: 2pt, dy: 2pt,
      block(width: 8pt, height: 8pt)[
        #place(bottom + right, line(length: 8pt, angle: 180deg, stroke: 1pt + pal.accent))
        #place(bottom + right, line(length: 8pt, angle: -90deg, stroke: 1pt + pal.accent))
      ]
    )
    #set text(fill: pal.ink, size: typo.body, font: _sans-font)
    #body
  ]
}

/// render-note -- Aside/note styled like a render log entry
#let render-note(body, pal: palette) = {
  block(
    width: 100%,
    inset: (x: 0.8em, y: 0.5em),
    fill: pal.deep-purple.transparentize(92%),
    stroke: (left: 2pt + pal.deep-purple.transparentize(50%)),
  )[
    #cols(columns: (auto, 1fr), gutter: 8pt, align: horizon)[
      #text(size: 7pt, weight: "bold", fill: pal.deep-purple, font: _mono-font)[NOTE]
    ][
      #text(size: 12pt, fill: pal.ink-muted, font: _sans-font, body)
    ]
  ]
}

/// vertex-badge -- Circular badge with number/icon inside
#let vertex-badge(body, color: none, pal: palette) = {
  let tint = if color == none { pal.accent } else { color }
  box(
    width: 28pt,
    height: 28pt,
    fill: tint.transparentize(85%),
    stroke: 1pt + tint,
    radius: 14pt,
  )[
    #set align(center + horizon)
    #text(size: 11pt, weight: "bold", fill: tint, font: _mono-font, body)
  ]
}

/// polygon-list -- Numbered list with vertex badges
#let polygon-list(pal: palette, ..items) = {
  let item-list = items.pos()
  for (i, item) in item-list.enumerate() {
    cols(columns: (auto, 1fr), gutter: 10pt, align: horizon)[
      #vertex-badge(str(i + 1), color: pal.accent, pal: pal)
    ][
      #text(size: 14pt, fill: pal.ink, font: _sans-font, item)
    ]
    if i < item-list.len() - 1 {
      v(0.4em)
    }
  }
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
      set text(font: _mono-font, size: 7pt, tracking: 0.8pt, weight: "bold")
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      } else {
        upper[NEON-GRID]
      }
    },
    neon-dot(color: pal.accent, size: 2pt),
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
    set text(size: 8pt, fill: pal.card.transparentize(40%), font: _mono-font, weight: "bold")
    cols(columns: (1fr, 1fr))[
      #{
        if custom-left != none {
          custom-left
        } else if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        }
      }
    ][
      #{
        set std.align(right)
        if custom-right != none {
          custom-right
        } else {
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        }
      }
    ]
  }
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.card.transparentize(50%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.8pt, weight: "bold")
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      } else {
        upper[NEON-GRID]
      }
    },
    neon-dot(color: pal.accent, size: 2pt),
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

/// slide -- Standard content slide with faint perspective grid + neon corners
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
    // Persistent: faint perspective grid
    place(top + left,
      box(width: 100%, height: 100%,
        perspective-grid(color: pal.accent.transparentize(70%), width: 100%, height: 100%),
      ),
    )
    // Persistent: neon corner accents
    place(top + left, dx: 0.8em, dy: 0.3em,
      block(width: 12pt, height: 12pt)[
        #place(top + left, line(length: 12pt, stroke: 0.8pt + pal.accent))
        #place(top + left, line(length: 12pt, angle: 90deg, stroke: 0.8pt + pal.accent))
      ]
    )
    place(bottom + right, dx: -0.8em, dy: -0.3em,
      block(width: 12pt, height: 12pt)[
        #place(bottom + right, line(length: 12pt, angle: 180deg, stroke: 0.8pt + pal.secondary))
        #place(bottom + right, line(length: 12pt, angle: -90deg, stroke: 0.8pt + pal.secondary))
      ]
    )
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deep dark background with wireframe atmosphere
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
    // Full-page perspective grid on dark
    place(top + left,
      box(width: 100%, height: 100%,
        perspective-grid(color: pal.accent.transparentize(50%), width: 100%, height: 100%),
      ),
    )
    // Scanline texture overlay
    place(top + left,
      box(width: 100%, height: 100%,
        scanline-texture(color: pal.card, width: 100%, height: 100%),
      ),
    )
    // Wireframe sphere decoration
    place(top + right, dx: -40pt, dy: 20pt,
      wireframe-sphere(color: pal.secondary.transparentize(30%), size: 100pt),
    )
    // Corner neon brackets
    place(top + left, dx: 12pt, dy: 8pt,
      block(width: 16pt, height: 16pt)[
        #place(top + left, line(length: 16pt, stroke: 1pt + pal.accent))
        #place(top + left, line(length: 16pt, angle: 90deg, stroke: 1pt + pal.accent))
      ]
    )
    place(bottom + right, dx: -12pt, dy: -8pt,
      block(width: 16pt, height: 16pt)[
        #place(bottom + right, line(length: 16pt, angle: 180deg, stroke: 1pt + pal.accent))
        #place(bottom + right, line(length: 16pt, angle: -90deg, stroke: 1pt + pal.accent))
      ]
    )
    set text(fill: pal.card)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: rgb("#1A1A2A"),
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Full wireframe frame with perspective grid hero layout
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page perspective grid
    place(top + left,
      box(width: 100%, height: 100%,
        perspective-grid(color: pal.accent.transparentize(50%), width: 100%, height: 100%),
      ),
    )

    // Scanline texture
    place(top + left,
      box(width: 100%, height: 100%,
        scanline-texture(color: pal.ink, width: 100%, height: 100%),
      ),
    )

    // Full wireframe frame (corner brackets)
    place(top + left,
      box(width: 100%, height: 100%,
        corner-brackets(color: pal.accent, width: 100%, height: 100%),
      ),
    )

    // Triangle cluster top-right
    place(top + right, dx: -20pt, dy: 15pt,
      triangle-cluster(color: pal.secondary.transparentize(40%), size: 140pt),
    )

    // Wireframe sphere bottom-left
    place(bottom + left, dx: 30pt, dy: -25pt,
      wireframe-sphere(color: pal.accent.transparentize(50%), size: 100pt),
    )

    // Ghost text
    place(center + horizon, dx: 120pt, dy: 40pt,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost, font: _mono-font)[GRID],
    )

    // Content centered
    set std.align(center + horizon)
    pad(x: 4em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "bold",
          tracking: 2pt,
          fill: pal.accent,
          font: _mono-font,
          upper(info.institution),
        )
        v(1.2em)
      }
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.5em)
      // Neon divider line
      #std.align(center, block(width: 120pt, height: 12pt)[
        #place(left + horizon, line(length: 50pt, stroke: 1pt + pal.accent))
        #place(center + horizon, neon-dot(color: pal.accent, size: 3pt))
        #place(right + horizon, line(length: 50pt, stroke: 1pt + pal.secondary))
      ])
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", fill: pal.ink-muted, info.subtitle)
        v(1em)
      }
      // Author + date
      #{
        set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font, weight: "bold")
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.accent, size: 8pt)[\/\/]
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

/// new-section-slide -- Section divider with geometric wireframe accents
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Perspective grid background
    place(top + left,
      box(width: 100%, height: 100%,
        perspective-grid(color: pal.accent.transparentize(70%), width: 100%, height: 100%),
      ),
    )

    // Triangle cluster decoration
    place(top + right, dx: -50pt, dy: 30pt,
      triangle-cluster(color: pal.secondary.transparentize(50%), size: 130pt),
    )

    // Section number
    place(top + right, dx: -60pt, dy: 25pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink-ghost, size: 140pt, weight: "bold", font: _mono-font, num-str)
      },
    )

    // Accent top line
    place(top + left, dx: 3em, dy: 2.5em,
      line(length: 80pt, stroke: 1.5pt + pal.accent))

    // Corner bracket top-left
    place(top + left, dx: 1.5em, dy: 1em,
      block(width: 14pt, height: 14pt)[
        #place(top + left, line(length: 14pt, stroke: 1pt + pal.accent))
        #place(top + left, line(length: 14pt, angle: 90deg, stroke: 1pt + pal.accent))
      ]
    )

    // Content
    pad(left: 4em, right: 8em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "bold",
        tracking: 2pt,
        fill: pal.accent,
        font: _mono-font,
      )[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.8em)
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 60pt, height: 2pt, fill: pal.secondary)
      #v(3fr)
    ]

    // Bottom corner bracket
    place(bottom + right, dx: -1.5em, dy: -1em,
      block(width: 14pt, height: 14pt)[
        #place(bottom + right, line(length: 14pt, angle: 180deg, stroke: 1pt + pal.secondary))
        #place(bottom + right, line(length: 14pt, angle: -90deg, stroke: 1pt + pal.secondary))
      ]
    )

    // Footer label
    place(bottom + left, dx: 2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font, weight: "bold")[NEON-GRID],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Bold centered statement with neon glow atmosphere
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Perspective grid subtle
    place(top + left, dx: -3em, dy: -3em,
      box(width: 130%, height: 130%,
        perspective-grid(color: pal.accent.transparentize(80%), width: 100%, height: 100%),
      ),
    )

    // Corner L-brackets
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 20pt, height: 20pt)[
        #place(top + left, line(length: 20pt, stroke: 1pt + pal.accent))
        #place(top + left, line(length: 20pt, angle: 90deg, stroke: 1pt + pal.accent))
      ]
    )
    place(top + right, dx: 0pt, dy: 0pt,
      block(width: 20pt, height: 20pt)[
        #place(top + right, line(length: 20pt, angle: 180deg, stroke: 1pt + pal.secondary))
        #place(top + right, line(length: 20pt, angle: -90deg, stroke: 1pt + pal.secondary))
      ]
    )
    place(bottom + left, dx: 0pt, dy: 0pt,
      block(width: 20pt, height: 20pt)[
        #place(bottom + left, line(length: 20pt, stroke: 1pt + pal.secondary))
        #place(bottom + left, line(length: 20pt, angle: -90deg, stroke: 1pt + pal.secondary))
      ]
    )
    place(bottom + right, dx: 0pt, dy: 0pt,
      block(width: 20pt, height: 20pt)[
        #place(bottom + right, line(length: 20pt, angle: 180deg, stroke: 1pt + pal.accent))
        #place(bottom + right, line(length: 20pt, angle: 90deg, stroke: 1pt + pal.accent))
      ]
    )

    set text(fill: pal.ink, size: 1.6em, weight: "bold")
    set std.align(horizon + center)
    pad(x: 1.5em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Full wireframe frame matching title-slide bookend
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page perspective grid
    place(top + left,
      box(width: 100%, height: 100%,
        perspective-grid(color: pal.accent.transparentize(55%), width: 100%, height: 100%),
      ),
    )

    // Scanline texture
    place(top + left,
      box(width: 100%, height: 100%,
        scanline-texture(color: pal.ink, width: 100%, height: 100%),
      ),
    )

    // Full wireframe frame (corner brackets) -- bookend with title
    place(top + left,
      box(width: 100%, height: 100%,
        corner-brackets(color: pal.accent, width: 100%, height: 100%),
      ),
    )

    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost, font: _mono-font)[END],
    )

    // Wireframe sphere center-right
    place(center + horizon, dx: 200pt, dy: -20pt,
      wireframe-sphere(color: pal.secondary.transparentize(50%), size: 90pt),
    )

    // Triangle cluster left
    place(center + horizon, dx: -220pt, dy: 10pt,
      triangle-cluster(color: pal.accent.transparentize(60%), size: 110pt),
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Neon divider above
      #std.align(center, block(width: 80pt, height: 2pt, fill: pal.accent))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.6em)
      // Neon divider below
      #std.align(center, block(width: 80pt, height: 2pt, fill: pal.secondary))
      #v(1.2em)
      #text(size: 8pt, weight: "bold", tracking: 2.5pt, fill: pal.meta-color, font: _mono-font)[NEON-GRID]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let neon-grid-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "light",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  show raw: set text(font: _mono-font, size: 11pt)
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
