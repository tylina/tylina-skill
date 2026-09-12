// Celestial Theme -- Astronomical/celestial map aesthetic
// Star charts, constellation lines, celestial coordinate grids
// Deep navy-black backgrounds with gold and white stars
// Antique astronomical maps and observatory publications style
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  observatory: (bg: rgb("#0A0E1A"), ink: rgb("#E8E4D9"), accent: rgb("#C9A961"), secondary: rgb("#4A7FC1")),
  dawn: (bg: rgb("#1A0A2E"), ink: rgb("#F0EBE0"), accent: rgb("#FF6B4A"), secondary: rgb("#B197FC")),
  polar: (bg: rgb("#0D1B2A"), ink: rgb("#E0FBFC"), accent: rgb("#64FFDA"), secondary: rgb("#5EEAD4")),
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
    ink-dim: ink.transparentize(30%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(90%),
    // Derived from accent
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary
    secondary-dim: secondary.transparentize(40%),
    secondary-faint: secondary.transparentize(75%),
    // Deeper background
    bg-deep: bg.darken(30%),
    // Meta
    meta-color: ink.transparentize(60%),
  )
}

// Default palette
#let palette = build-palette("observatory")

// Public helpers and components read this state so their colors follow the active preset.
#let _active-palette = state("celestial-active-palette", palette)

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 40pt,
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
#let _sans-font = ("Arial", "Heiti SC")

// =====================================================================
// SVG Definitions
// =====================================================================

// Constellation pattern: 10 star points connected by thin lines
#let _constellation-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><circle cx=\"30\" cy=\"40\" r=\"2\" fill=\"currentColor\"/><circle cx=\"60\" cy=\"25\" r=\"1.5\" fill=\"currentColor\"/><circle cx=\"95\" cy=\"35\" r=\"2.5\" fill=\"currentColor\"/><circle cx=\"130\" cy=\"20\" r=\"1.5\" fill=\"currentColor\"/><circle cx=\"155\" cy=\"50\" r=\"2\" fill=\"currentColor\"/><circle cx=\"140\" cy=\"85\" r=\"1.5\" fill=\"currentColor\"/><circle cx=\"170\" cy=\"110\" r=\"2\" fill=\"currentColor\"/><circle cx=\"120\" cy=\"130\" r=\"1.5\" fill=\"currentColor\"/><circle cx=\"80\" cy=\"120\" r=\"2\" fill=\"currentColor\"/><circle cx=\"50\" cy=\"90\" r=\"1.5\" fill=\"currentColor\"/><circle cx=\"35\" cy=\"150\" r=\"2\" fill=\"currentColor\"/><circle cx=\"160\" cy=\"160\" r=\"1.5\" fill=\"currentColor\"/><line x1=\"30\" y1=\"40\" x2=\"60\" y2=\"25\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"60\" y1=\"25\" x2=\"95\" y2=\"35\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"95\" y1=\"35\" x2=\"130\" y2=\"20\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"130\" y1=\"20\" x2=\"155\" y2=\"50\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"155\" y1=\"50\" x2=\"140\" y2=\"85\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"140\" y1=\"85\" x2=\"170\" y2=\"110\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"170\" y1=\"110\" x2=\"120\" y2=\"130\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"120\" y1=\"130\" x2=\"80\" y2=\"120\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"80\" y1=\"120\" x2=\"50\" y2=\"90\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"50\" y1=\"90\" x2=\"30\" y2=\"40\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.6\"/><line x1=\"50\" y1=\"90\" x2=\"35\" y2=\"150\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/><line x1=\"170\" y1=\"110\" x2=\"160\" y2=\"160\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/></svg>"

// Celestial grid arc: curved arcs suggesting right ascension/declination
#let _celestial-grid-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><path d=\"M 0 150 Q 100 50 200 40 Q 300 30 400 80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><path d=\"M 0 200 Q 100 120 200 100 Q 300 80 400 130\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><path d=\"M 0 250 Q 100 190 200 170 Q 300 150 400 180\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><path d=\"M 50 0 Q 60 100 80 150 Q 100 200 130 300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><path d=\"M 150 0 Q 160 80 170 150 Q 180 220 200 300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><path d=\"M 250 0 Q 260 80 270 150 Q 280 220 300 300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><path d=\"M 350 0 Q 355 80 360 150 Q 365 220 370 300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/></svg>"

// Star-burst ornament: 8-pointed star
#let _starburst-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 60 60\"><polygon points=\"30,2 34,22 54,18 38,30 54,42 34,38 30,58 26,38 6,42 22,30 6,18 26,22\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.8\"/><circle cx=\"30\" cy=\"30\" r=\"4\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"30\" cy=\"30\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.4\"/></svg>"

// Orbital ring: dashed elliptical path
#let _orbital-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 100\"><ellipse cx=\"100\" cy=\"50\" rx=\"90\" ry=\"35\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" stroke-dasharray=\"4 3\" opacity=\"0.5\"/><ellipse cx=\"100\" cy=\"50\" rx=\"60\" ry=\"22\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-dasharray=\"3 4\" opacity=\"0.35\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let constellation-pattern(color: auto, size-w: 200pt, size-h: 200pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _constellation-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size-w, height: size-h)
}

#let celestial-grid(color: auto, width: 100%, height: 100%) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.secondary } else { color }
  let svg = _celestial-grid-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let starburst(color: auto, size: 30pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _starburst-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let orbital-ring(color: auto, width: 200pt, height: 100pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _orbital-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// star-point -- Small precise dot representing a star
#let star-point(color: auto, size: 3pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  circle(radius: size / 2, fill: color)
}

/// star-marker -- Slightly larger star with glow effect (two layered circles)
#let star-marker(color: auto, size: 5pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  box(width: size * 2, height: size * 2)[
    #place(center + horizon, circle(radius: size, fill: color.transparentize(70%)))
    #place(center + horizon, circle(radius: size / 2, fill: color))
  ]
}

// =====================================================================
// Reusable Components
// =====================================================================

/// star-card -- Card with star-point markers at corners, thin gold border
#let star-card(title, body) = context {
  let pal = _active-palette.get()
  block(
    width: 100%,
    stroke: 0.5pt + pal.accent-dim,
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
    fill: pal.bg,
  )[
    // Corner star points
    #place(top + left, dx: -3pt, dy: -3pt, star-point(color: pal.accent, size: 4pt))
    #place(top + right, dx: 3pt, dy: -3pt, star-point(color: pal.accent, size: 4pt))
    #place(bottom + left, dx: -3pt, dy: 3pt, star-point(color: pal.accent, size: 4pt))
    #place(bottom + right, dx: 3pt, dy: 3pt, star-point(color: pal.accent, size: 4pt))
    // Title
    #stack(
      spacing: .8em,
      text(size: typo.body, weight: "bold", fill: pal.ink, title),
      [
        #set text(size: 13pt, fill: pal.ink-dim, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// magnitude-stat -- Centered starburst, value, label, and optional description
#let magnitude-stat(label, value, description: none) = context {
  let pal = _active-palette.get()
  block(width: 100%, fill: pal.bg, inset: (x: 0.6em, y: 0.5em))[
    #set align(center)
    #stack(
      spacing: .8em,
      starburst(color: pal.accent, size: 20pt),
      text(size: 44pt, weight: "bold", fill: pal.ink, value),
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: pal.accent,
        font: _mono-font,
        upper(label),
      ),
      block(width: 30pt, height: 1.5pt, fill: pal.accent),
      if description != none {
        text(
          size: 13pt,
          weight: "regular",
          fill: pal.ink-dim,
          font: _sans-font,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// constellation-divider -- Line with star-dots placed along it
#let constellation-divider(total-width: 100%) = context {
  let pal = _active-palette.get()
  block(width: total-width, height: 14pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.5pt + pal.accent-muted))
    #place(left + horizon, dx: 15%, star-point(color: pal.accent, size: 3pt))
    #place(left + horizon, dx: 30%, star-point(color: pal.accent, size: 4pt))
    #place(left + horizon, dx: 50%, star-point(color: pal.accent, size: 3pt))
    #place(left + horizon, dx: 65%, star-point(color: pal.accent, size: 5pt))
    #place(left + horizon, dx: 85%, star-point(color: pal.accent, size: 3pt))
  ]
}

/// ephemeris-table -- Data table styled like astronomical ephemeris
#let ephemeris-table(align: center + horizon, headers, ..rows) = context {
  let pal = _active-palette.get()
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { pal.accent-ghost },
    stroke: 0.5pt + pal.accent-faint,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: pal.accent, size: 9pt, tracking: 1pt, font: _mono-font, upper(h)))),
    ..rows.pos().flatten().map(c => text(fill: pal.ink-dim, size: 11pt, font: _mono-font, c)),
  )
}

/// nebula-box -- Content area with simulated radial gradient (concentric translucent rectangles)
#let nebula-box(body) = context {
  let pal = _active-palette.get()
  block(width: 100%, fill: pal.bg, inset: 0pt)[
    // Simulated radial glow with layered rectangles
    #place(center + horizon,
      block(width: 100%, height: 100%, fill: pal.secondary.transparentize(94%)))
    #place(center + horizon,
      block(width: 90%, height: 90%, fill: pal.secondary.transparentize(90%)))
    #place(center + horizon,
      block(width: 75%, height: 80%, fill: pal.secondary.transparentize(88%)))
    #place(center + horizon,
      block(width: 55%, height: 65%, fill: pal.secondary.transparentize(86%)))
    // Content on top
    #block(width: 100%, inset: (x: 1.2em, y: 1em))[
      #set text(fill: pal.ink, size: typo.body, font: _sans-font)
      #body
    ]
  ]
}

/// orbit-tag -- Small label on a curved/arced baseline
#let orbit-tag(body) = context {
  let pal = _active-palette.get()
  box(
    fill: pal.accent-faint,
    stroke: 0.4pt + pal.accent-muted,
    inset: (x: 8pt, y: 3pt),
    radius: 12pt,
  )[
    #text(size: typo.small, fill: pal.accent, weight: "medium", font: _mono-font, body)
  ]
}

/// celestial-quote -- Quote with star ornaments as opening/closing markers
#let celestial-quote(body, cite: none) = context {
  let pal = _active-palette.get()
  block(
    width: 100%,
    fill: pal.bg,
    stroke: (left: 1.5pt + pal.accent),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(
      spacing: .8em,
      grid(columns: (auto, 1fr, auto), column-gutter: 6pt, align: horizon,
        starburst(color: pal.accent-dim, size: 14pt),
        text(size: typo.body, style: "italic", fill: pal.ink, body),
        starburst(color: pal.accent-dim, size: 14pt),
      ),
      if cite != none {
        text(
          size: typo.tiny,
          style: "normal",
          weight: "medium",
          tracking: 1.2pt,
          fill: pal.meta-color,
          font: _mono-font,
          [#sym.dash.em #upper(cite)],
        )
      },
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
    block(width: 50pt, height: 1.5pt, fill: pal.accent),
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
      upper[CELESTIAL]
    },
    text(fill: pal.accent-muted, size: 6pt)[#sym.star.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark slides with custom labels
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.ink.transparentize(50%), font: _mono-font)
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

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.ink.transparentize(60%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[CELESTIAL]
    },
    text(fill: pal.accent-muted, size: 6pt)[#sym.star.filled],
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

/// slide -- Deep space bg, faint celestial grid SVG, gold accents
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
    // Faint celestial grid background
    place(top + left,
      box(width: 100%, height: 100%,
        celestial-grid(color: pal.secondary.transparentize(60%), width: 100%, height: 100%),
      ),
    )
    // Small corner star accents
    place(top + right, dx: -1.5em, dy: 0.4em,
      star-point(color: pal.accent-muted, size: 4pt),
    )
    place(bottom + left, dx: 1.5em, dy: -0.8em,
      star-point(color: pal.accent-muted, size: 3pt),
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

/// dark-slide -- Even deeper dark with bright star accents
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
    // Scattered star points as decoration
    place(top + right, dx: -40pt, dy: 30pt, star-point(color: pal.ink.transparentize(60%), size: 2pt))
    place(top + right, dx: -80pt, dy: 50pt, star-point(color: pal.accent.transparentize(40%), size: 3pt))
    place(top + right, dx: -120pt, dy: 20pt, star-point(color: pal.ink.transparentize(70%), size: 1.5pt))
    place(bottom + left, dx: 40pt, dy: -40pt, star-point(color: pal.ink.transparentize(65%), size: 2pt))
    place(bottom + left, dx: 80pt, dy: -25pt, star-point(color: pal.accent.transparentize(50%), size: 2.5pt))
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg-deep,
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Constellation pattern frame, orbital decorations
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Deep space background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Celestial grid arcs in background
    place(top + left,
      box(width: 100%, height: 100%,
        celestial-grid(color: pal.secondary.transparentize(50%), width: 100%, height: 100%),
      ),
    )

    // Constellation pattern top-right
    place(top + right, dx: -30pt, dy: 20pt,
      constellation-pattern(color: pal.accent.transparentize(40%), size-w: 180pt, size-h: 180pt),
    )

    // Constellation pattern bottom-left
    place(bottom + left, dx: 20pt, dy: -30pt,
      constellation-pattern(color: pal.accent.transparentize(60%), size-w: 140pt, size-h: 140pt),
    )

    // Orbital decoration center
    place(center + horizon, dy: 60pt,
      orbital-ring(color: pal.accent.transparentize(50%), width: 300pt, height: 120pt),
    )

    // Thin gold frame border -- centered rect approach
    place(center + horizon,
      rect(width: 96%, height: 92%, stroke: 0.5pt + pal.accent-muted, fill: none)
    )

    // Corner star markers (aligned with 96%x92% frame)
    place(top + left, dx: 1.5%, dy: 3%, star-marker(color: pal.accent, size: 4pt))
    place(top + right, dx: -1.5%, dy: 3%, star-marker(color: pal.accent, size: 4pt))
    place(bottom + left, dx: 1.5%, dy: -3%, star-marker(color: pal.accent, size: 4pt))
    place(bottom + right, dx: -1.5%, dy: -3%, star-marker(color: pal.accent, size: 4pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
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
      // Title (styled like a star chart label)
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.6em)
      // Constellation divider
      #block(width: 200pt, height: 12pt)[
        #place(left + horizon, line(length: 80pt, stroke: 0.5pt + pal.accent))
        #place(center + horizon, circle(radius: 2.5pt, fill: pal.accent))
        #place(right + horizon, line(length: 80pt, stroke: 0.5pt + pal.accent))
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
          text(fill: pal.accent, size: 6pt)[#sym.star.filled]
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

/// new-section-slide -- Starburst section number, celestial coordinate labels
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Celestial grid background
    place(top + left,
      box(width: 100%, height: 100%,
        celestial-grid(color: pal.secondary.transparentize(70%), width: 100%, height: 100%),
      ),
    )

    // Large starburst with section number
    place(top + right, dx: -80pt, dy: 40pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 120pt, height: 120pt)[
          #place(center + horizon, starburst(color: pal.accent.transparentize(60%), size: 100pt))
          #place(center + horizon, text(fill: pal.accent, size: 48pt, weight: "bold", num-str))
        ]
      },
    )

    // Celestial coordinate label (decorative)
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font)[RA 00h 00m | DEC +00 00'],
    )

    // Top accent line
    place(top + left, dx: 3em, dy: 3em,
      line(length: 80pt, stroke: 1pt + pal.accent))

    // Content
    pad(left: 4em, right: 8em, top: 5em, bottom: 2em)[
      #v(1fr)
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
      #v(0.8em)
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 60pt, height: 1.5pt, fill: pal.accent)
      #v(3fr)
    ]

    // Bottom accent line
    place(bottom + right, dx: -3em, dy: -2em,
      line(length: 80pt, stroke: 1pt + pal.accent))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[CELESTIAL],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single bright statement on deep space, surrounded by star points
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg-deep,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Scattered star points around edges
    place(top + left, dx: 20pt, dy: 20pt, star-point(color: pal.accent, size: 3pt))
    place(top + left, dx: 60pt, dy: 40pt, star-point(color: pal.ink-muted, size: 2pt))
    place(top + right, dx: -30pt, dy: 25pt, star-point(color: pal.accent, size: 4pt))
    place(top + right, dx: -70pt, dy: 50pt, star-point(color: pal.ink-muted, size: 2pt))
    place(bottom + left, dx: 40pt, dy: -30pt, star-point(color: pal.accent, size: 3pt))
    place(bottom + right, dx: -50pt, dy: -35pt, star-point(color: pal.accent, size: 4pt))
    place(bottom + right, dx: -90pt, dy: -20pt, star-point(color: pal.ink-muted, size: 2pt))
    place(top + left, dx: 200pt, dy: 30pt, star-point(color: pal.ink-faint, size: 1.5pt))
    place(bottom + left, dx: 150pt, dy: -50pt, star-point(color: pal.ink-faint, size: 1.5pt))

    // Corner accent lines (positioned inside the margin)
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
    pad(x: 1.5em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Fading constellation, "Ad Astra" farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Fading constellation pattern
    place(center + horizon, dx: -150pt, dy: -30pt,
      constellation-pattern(color: pal.accent.transparentize(70%), size-w: 200pt, size-h: 200pt),
    )
    place(center + horizon, dx: 150pt, dy: 20pt,
      constellation-pattern(color: pal.accent.transparentize(80%), size-w: 160pt, size-h: 160pt),
    )

    // Ghost text
    place(center + horizon,
      text(size: 120pt, weight: "bold", fill: pal.ink-ghost)[AD ASTRA],
    )

    // Thin gold frame -- centered rect approach
    place(center + horizon,
      rect(width: 96%, height: 94%, stroke: 0.5pt + pal.accent-muted, fill: none)
    )

    // Corner star markers
    place(top + left, dx: 2em, dy: 1.2em, star-marker(color: pal.accent, size: 4pt))
    place(top + right, dx: -2em, dy: 1.2em, star-marker(color: pal.accent, size: 4pt))
    place(bottom + left, dx: 2em, dy: -1.2em, star-marker(color: pal.accent, size: 4pt))
    place(bottom + right, dx: -2em, dy: -1.2em, star-marker(color: pal.accent, size: 4pt))

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Top starburst ornament
      #std.align(center, starburst(color: pal.accent, size: 28pt))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.8em)
      // Constellation divider
      #std.align(center, block(width: 160pt, height: 12pt)[
        #place(left + horizon, line(length: 60pt, stroke: 0.5pt + pal.accent))
        #place(center + horizon, circle(radius: 2pt, fill: pal.accent))
        #place(right + horizon, line(length: 60pt, stroke: 0.5pt + pal.accent))
      ])
      #v(1em)
      #text(size: 10pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[AD ASTRA]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let celestial-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "observatory",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  _active-palette.update(pal)

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
