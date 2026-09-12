// Observatory Theme -- Telescope dome / astronomical observatory aesthetic
// Dome silhouettes, telescope tracking lines, eyepiece crosshairs, observation log paper
// Light twilight background with copper instrument accents and observatory dome SVG silhouettes
// The feeling: precision instruments in a dome -- intellectual, precise, warm copper meets cool steel
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  twilight: (bg: rgb("#F0F4FA"), primary: rgb("#1E3355"), accent: rgb("#B87333"), accent-text: rgb("#8A4A18"), secondary: rgb("#546E7A"), text: rgb("#1A1A2E"), card: rgb("#FEFCF8")),
  midnight: (bg: rgb("#0F1B2D"), primary: rgb("#A8C8E8"), accent: rgb("#D4956A"), accent-text: rgb("#D4956A"), secondary: rgb("#78909C"), text: rgb("#E8EDF3"), card: rgb("#1A2A3E")),
  dawn: (bg: rgb("#FDF6F0"), primary: rgb("#2C3E50"), accent: rgb("#C17A45"), accent-text: rgb("#8A4A18"), secondary: rgb("#6E8898"), text: rgb("#1A1A2E"), card: rgb("#FFFEF8")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let primary = p.primary
  let accent = p.accent
  let accent-text = p.accent-text
  let secondary = p.secondary
  let txt = p.text
  let card = p.card
  (
    bg: bg,
    primary: primary,
    accent: accent,
    accent-text: accent-text,
    secondary: secondary,
    text: txt,
    card: card,
    // Derived from primary
    primary-dim: primary.transparentize(30%),
    primary-muted: primary.transparentize(50%),
    primary-faint: primary.transparentize(75%),
    primary-ghost: primary.transparentize(92%),
    // Derived from accent (copper)
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(75%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary (slate)
    secondary-dim: secondary.transparentize(40%),
    secondary-faint: secondary.transparentize(70%),
    secondary-ghost: secondary.transparentize(90%),
    // Text variants
    text-dim: txt.transparentize(25%),
    text-muted: txt.transparentize(35%),
    text-faint: txt.transparentize(70%),
    text-ghost: txt.transparentize(90%),
    // Dark variant
    dark-bg: rgb("#0F1B2D"),
    dark-text: rgb("#E8EDF3"),
    // Meta
    meta-color: txt.transparentize(35%),
  )
}

// Default palette
#let palette = build-palette("twilight")

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

#let _mono-font = "DejaVu Sans Mono"

// =====================================================================
// SVG Definitions
// =====================================================================

// Dome Silhouette: Observatory dome profile with slit opening (12 path elements)
#let _dome-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 200\"><path d=\"M 0 200 L 0 140 L 50 140 L 50 80 Q 100 20 200 15 Q 300 20 350 80 L 350 140 L 400 140 L 400 200 Z\" fill=\"currentColor\" opacity=\"0.08\"/><path d=\"M 50 80 Q 100 20 200 15 Q 300 20 350 80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.4\"/><line x1=\"0\" y1=\"140\" x2=\"400\" y2=\"140\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.3\"/><line x1=\"50\" y1=\"80\" x2=\"50\" y2=\"140\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.25\"/><line x1=\"350\" y1=\"80\" x2=\"350\" y2=\"140\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.25\"/><rect x=\"180\" y=\"15\" width=\"40\" height=\"50\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.35\"/><line x1=\"200\" y1=\"15\" x2=\"200\" y2=\"65\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><circle cx=\"200\" cy=\"100\" r=\"3\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"200\" cy=\"100\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><line x1=\"80\" y1=\"140\" x2=\"80\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.15\"/><line x1=\"320\" y1=\"140\" x2=\"320\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.15\"/><path d=\"M 100 55 Q 150 30 200 25 Q 250 30 300 55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" stroke-dasharray=\"3 2\" opacity=\"0.2\"/></svg>"

// Telescope Crosshair: Eyepiece reticle with concentric circles and crosshair lines (10 elements)
#let _crosshair-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><circle cx=\"50\" cy=\"50\" r=\"45\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><circle cx=\"50\" cy=\"50\" r=\"30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><circle cx=\"50\" cy=\"50\" r=\"15\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><circle cx=\"50\" cy=\"50\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><line x1=\"5\" y1=\"50\" x2=\"95\" y2=\"50\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"50\" y1=\"5\" x2=\"50\" y2=\"95\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"50\" y1=\"35\" x2=\"50\" y2=\"38\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/><line x1=\"50\" y1=\"62\" x2=\"50\" y2=\"65\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/><line x1=\"35\" y1=\"50\" x2=\"38\" y2=\"50\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/><line x1=\"62\" y1=\"50\" x2=\"65\" y2=\"50\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/></svg>"

// Tracking Arcs: Curved telescope tracking lines suggesting celestial motion (11 elements)
#let _tracking-arcs-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 600 400\"><path d=\"M 0 350 Q 150 280 300 250 Q 450 220 600 200\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.2\"/><path d=\"M 0 300 Q 150 240 300 210 Q 450 180 600 160\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.15\"/><path d=\"M 0 250 Q 150 200 300 175 Q 450 150 600 130\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.12\"/><path d=\"M 50 400 Q 80 300 120 200 Q 160 100 200 0\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/><path d=\"M 200 400 Q 220 320 250 240 Q 280 160 320 0\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/><path d=\"M 400 400 Q 410 300 430 200 Q 450 100 480 0\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/><circle cx=\"150\" cy=\"260\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"350\" cy=\"200\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"500\" cy=\"170\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"250\" cy=\"230\" r=\"1\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"450\" cy=\"185\" r=\"1\" fill=\"currentColor\" opacity=\"0.15\"/></svg>"

// Eyepiece Reticle: Detailed finder scope view with tick marks (13 elements)
#let _reticle-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 120\"><circle cx=\"60\" cy=\"60\" r=\"55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.3\"/><circle cx=\"60\" cy=\"60\" r=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.25\"/><circle cx=\"60\" cy=\"60\" r=\"25\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><circle cx=\"60\" cy=\"60\" r=\"10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/><line x1=\"5\" y1=\"60\" x2=\"25\" y2=\"60\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.35\"/><line x1=\"95\" y1=\"60\" x2=\"115\" y2=\"60\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.35\"/><line x1=\"60\" y1=\"5\" x2=\"60\" y2=\"25\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.35\"/><line x1=\"60\" y1=\"95\" x2=\"60\" y2=\"115\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.35\"/><line x1=\"18\" y1=\"18\" x2=\"28\" y2=\"28\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><line x1=\"92\" y1=\"18\" x2=\"102\" y2=\"28\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\" transform=\"rotate(90 97 23)\"/><line x1=\"18\" y1=\"92\" x2=\"28\" y2=\"102\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\" transform=\"rotate(-90 23 97)\"/><line x1=\"92\" y1=\"92\" x2=\"102\" y2=\"102\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><circle cx=\"60\" cy=\"60\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// Observation Grid: Full-page coordinate grid for observation log paper (15 elements)
#let _observation-grid-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 600\"><line x1=\"0\" y1=\"100\" x2=\"800\" y2=\"100\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"0\" y1=\"200\" x2=\"800\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"0\" y1=\"300\" x2=\"800\" y2=\"300\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"0\" y1=\"400\" x2=\"800\" y2=\"400\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"0\" y1=\"500\" x2=\"800\" y2=\"500\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"160\" y1=\"0\" x2=\"160\" y2=\"600\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"320\" y1=\"0\" x2=\"320\" y2=\"600\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"480\" y1=\"0\" x2=\"480\" y2=\"600\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><line x1=\"640\" y1=\"0\" x2=\"640\" y2=\"600\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.08\"/><path d=\"M 0 500 Q 200 420 400 380 Q 600 340 800 310\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-dasharray=\"4 3\" opacity=\"0.1\"/><path d=\"M 0 450 Q 200 380 400 340 Q 600 300 800 270\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" stroke-dasharray=\"3 4\" opacity=\"0.08\"/><circle cx=\"400\" cy=\"300\" r=\"80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" stroke-dasharray=\"2 3\" opacity=\"0.06\"/><circle cx=\"400\" cy=\"300\" r=\"150\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" stroke-dasharray=\"2 4\" opacity=\"0.05\"/><line x1=\"395\" y1=\"295\" x2=\"405\" y2=\"305\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/><line x1=\"405\" y1=\"295\" x2=\"395\" y2=\"305\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let dome-silhouette(color: palette.primary, width: 400pt, height: 200pt) = {
  let svg = _dome-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let crosshair(color: palette.accent, size: 100pt) = {
  let svg = _crosshair-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let tracking-arcs(color: palette.secondary, width: 100%, height: 100%) = {
  let svg = _tracking-arcs-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let reticle(color: palette.accent, size: 60pt) = {
  let svg = _reticle-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let observation-grid(color: palette.secondary, width: 100%, height: 100%) = {
  let svg = _observation-grid-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// copper-dot -- Small precise copper instrument marker
#let copper-dot(color: palette.accent, size: 4pt) = {
  circle(radius: size / 2, fill: color)
}

/// instrument-pip -- Layered glow pip for instrument indicators
#let instrument-pip(color: palette.accent, size: 6pt) = {
  box(width: size * 2, height: size * 2)[
    #place(center + horizon, circle(radius: size, fill: color.transparentize(70%)))
    #place(center + horizon, circle(radius: size / 2, fill: color))
  ]
}

// =====================================================================
// Reusable Components (9 observatory-named components)
// =====================================================================

/// dome-card -- Card with crosshair corner markers and copper border, resembling an observation report
#let dome-card(title, body, colors: palette) = {
  let pal = colors
  block(
    width: 100%,
    stroke: 0.6pt + pal.accent-muted,
    fill: pal.card,
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
  )[
    // Corner crosshair marks
    #place(top + left, dx: -2pt, dy: -2pt, box(width: 8pt, height: 8pt)[
      #place(top + left, line(length: 6pt, stroke: 0.5pt + pal.accent))
      #place(top + left, line(length: 6pt, angle: 90deg, stroke: 0.5pt + pal.accent))
    ])
    #place(top + right, dx: 2pt, dy: -2pt, box(width: 8pt, height: 8pt)[
      #place(top + right, line(length: 6pt, angle: 180deg, stroke: 0.5pt + pal.accent))
      #place(top + left, line(length: 6pt, angle: 90deg, stroke: 0.5pt + pal.accent))
    ])
    #place(bottom + left, dx: -2pt, dy: 2pt, box(width: 8pt, height: 8pt)[
      #place(top + left, line(length: 6pt, stroke: 0.5pt + pal.accent))
      #place(bottom + left, line(length: 6pt, angle: 90deg, stroke: 0.5pt + pal.accent))
    ])
    #place(bottom + right, dx: 2pt, dy: 2pt, box(width: 8pt, height: 8pt)[
      #place(top + right, line(length: 6pt, angle: 180deg, stroke: 0.5pt + pal.accent))
      #place(bottom + left, line(length: 6pt, angle: 90deg, stroke: 0.5pt + pal.accent))
    ])
    // Title with copper accent
    #stack(
      spacing: .8em,
      text(size: typo.body, weight: "bold", fill: pal.primary, title),
      {
        set text(size: 13pt, fill: pal.text-dim)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// eyepiece-stat -- Large statistic with reticle ornament (like an instrument readout)
#let eyepiece-stat(label, value, description: none, colors: palette) = {
  let pal = colors
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #set std.align(center)
    #stack(
      spacing: .8em,
      reticle(color: pal.accent-dim, size: 20pt),
      text(size: 34pt, weight: "bold", fill: pal.primary, value),
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: pal.accent-text,
        font: _mono-font,
        upper(label),
      ),
      block(width: 30pt, height: 1.5pt, fill: pal.accent),
      if description != none {
        text(
          size: 12pt,
          weight: "regular",
          fill: pal.text-muted,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// tracking-box -- Content area with faint tracking arc background overlay
#let tracking-box(body, colors: palette) = {
  let pal = colors
  block(width: 100%, inset: 0pt)[
    // Faint tracking arc background
    #place(center + horizon,
      block(width: 100%, height: 100%, fill: pal.secondary-ghost))
    #place(top + left,
      box(width: 100%, height: 100%,
        tracking-arcs(color: pal.secondary.transparentize(40%), width: 100%, height: 100%)))
    // Content on top
    #block(width: 100%, inset: (x: 1.2em, y: 1em))[
      #set text(fill: pal.text, size: typo.body)
      #body
    ]
  ]
}

/// reticle-divider -- Horizontal line with crosshair pips at intervals
#let reticle-divider(total-width: 100%, colors: palette) = {
  let pal = colors
  block(width: total-width, height: 14pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.5pt + pal.accent-muted))
    #place(left + horizon, dx: 10%, copper-dot(color: pal.accent, size: 3pt))
    #place(left + horizon, dx: 25%, copper-dot(color: pal.accent, size: 4pt))
    #place(left + horizon, dx: 50%, crosshair(color: pal.accent-dim, size: 12pt))
    #place(left + horizon, dx: 75%, copper-dot(color: pal.accent, size: 4pt))
    #place(left + horizon, dx: 90%, copper-dot(color: pal.accent, size: 3pt))
  ]
}

/// zenith-tag -- Small label styled like an instrument readout tag
#let zenith-tag(body, colors: palette) = {
  let pal = colors
  box(
    fill: pal.accent-ghost,
    stroke: 0.4pt + pal.accent-muted,
    inset: (x: 8pt, y: 3pt),
    radius: 2pt,
  )[
    #text(size: typo.small, fill: pal.accent-text, weight: "medium", font: _mono-font, body)
  ]
}

/// aperture-highlight -- Bordered highlight block with copper left bar (like observation notes)
#let aperture-highlight(body, colors: palette) = {
  let pal = colors
  block(
    width: 100%,
    stroke: (left: 2.5pt + pal.accent, rest: 0.4pt + pal.secondary-faint),
    fill: pal.card,
    inset: (left: 1.2em, right: 1em, y: 0.8em),
  )[
    #set text(fill: pal.text, size: typo.body)
    #body
  ]
}

/// logbook-note -- Observation log entry with timestamp style header
#let logbook-note(timestamp, body, observer: none, colors: palette) = {
  let pal = colors
  block(
    width: 100%,
    fill: pal.card,
    stroke: 0.4pt + pal.secondary-faint,
    inset: (x: 1em, y: 0.7em),
  )[
    #stack(
      spacing: .8em,
      grid(columns: (auto, 1fr), column-gutter: 10pt, align: horizon,
        text(size: typo.tiny, fill: pal.accent-text, weight: "bold", font: _mono-font, timestamp),
        {
          if observer != none {
            text(size: typo.tiny, fill: pal.text-muted, font: _mono-font, observer)
          }
        },
      ),
      {
        set text(size: 13pt, fill: pal.text-dim)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// azimuth-grid -- Data table styled like an observation log / instrument readings
#let azimuth-grid(align: center + horizon, headers, colors: palette, ..rows) = {
  let pal = colors
  let row-data = rows.pos()
  let ncols = headers.len()
  assert(
    row-data.all(row => row.len() == ncols),
    message: "azimuth-grid: every row must match the header count",
  )
  table(
    columns: ncols * (1fr,),
    fill: (_, row) => if row == 0 { pal.primary-ghost }
      else if calc.odd(row) { pal.card } else { pal.bg },
    stroke: 0.5pt + pal.secondary-faint,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(
      ..headers.map(h => text(
        size: 9pt,
        weight: "bold",
        tracking: 1pt,
        fill: pal.primary,
        font: _mono-font,
        upper(h),
      )),
    ),
    ..row-data.flatten().map(cell => text(
      size: 11pt,
      fill: pal.text-dim,
      font: _mono-font,
      cell,
    )),
  )
}

/// finder-badge -- Small badge/chip with instrument icon feel
#let finder-badge(body, colors: palette) = {
  let pal = colors
  box(
    fill: pal.primary-ghost,
    stroke: 0.5pt + pal.primary-faint,
    inset: (x: 10pt, y: 4pt),
    radius: 3pt,
  )[
    #grid(columns: (auto, auto), column-gutter: 5pt, align: horizon,
      box(circle(radius: 2pt, fill: pal.accent)),
      text(size: typo.small, fill: pal.primary, weight: "medium", font: _mono-font, body),
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
      set text(fill: pal.primary, size: 1.4em, weight: "bold")
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
      upper[OBSERVATORY]
    },
    text(fill: pal.accent-muted, size: 5pt)[#sym.diamond.filled],
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
    set text(size: 8pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)
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
  set text(fill: pal.dark-text.transparentize(40%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[OBSERVATORY]
    },
    text(fill: pal.accent-muted, size: 5pt)[#sym.diamond.filled],
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

/// slide -- Light twilight background, observation grid + tracking arcs atmosphere, copper accents
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
    // Full-page observation grid background (persistent atmosphere)
    place(top + left,
      box(width: 100%, height: 100%,
        observation-grid(color: pal.secondary, width: 100%, height: 100%),
      ),
    )
    // Faint crosshair corners
    place(top + right, dx: -8pt, dy: 4pt,
      crosshair(color: pal.secondary.transparentize(50%), size: 28pt),
    )
    place(bottom + left, dx: 8pt, dy: -8pt,
      crosshair(color: pal.secondary.transparentize(60%), size: 20pt),
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

/// dark-slide -- Deep observatory blue background with copper star accents
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
    // Tracking arcs atmosphere on dark
    place(top + left,
      box(width: 100%, height: 100%,
        tracking-arcs(color: pal.accent.transparentize(60%), width: 100%, height: 100%),
      ),
    )
    // Copper instrument pips
    place(top + right, dx: -40pt, dy: 30pt, copper-dot(color: pal.accent.transparentize(40%), size: 3pt))
    place(top + right, dx: -80pt, dy: 50pt, copper-dot(color: pal.accent.transparentize(50%), size: 2pt))
    place(bottom + left, dx: 40pt, dy: -35pt, copper-dot(color: pal.accent.transparentize(40%), size: 3pt))
    place(bottom + left, dx: 80pt, dy: -20pt, copper-dot(color: pal.accent.transparentize(50%), size: 2pt))
    set text(fill: pal.dark-text)
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

/// title-slide -- Dome silhouette frame, crosshair decorations, twilight atmosphere
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Twilight background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page observation grid (subtle)
    place(top + left,
      box(width: 100%, height: 100%,
        observation-grid(color: pal.secondary, width: 100%, height: 100%),
      ),
    )

    // Dome silhouette bottom
    place(bottom + center, dy: 10pt,
      dome-silhouette(color: pal.primary, width: 500pt, height: 200pt),
    )

    // Tracking arcs top half
    place(top + left,
      box(width: 100%, height: 60%,
        tracking-arcs(color: pal.secondary.transparentize(30%), width: 100%, height: 100%),
      ),
    )

    // Crosshair top-right
    place(top + right, dx: -50pt, dy: 30pt,
      crosshair(color: pal.accent.transparentize(30%), size: 80pt),
    )

    // Reticle bottom-left
    place(bottom + left, dx: 40pt, dy: -50pt,
      reticle(color: pal.accent.transparentize(50%), size: 60pt),
    )

    // Copper frame border
    place(center + horizon,
      rect(width: 94%, height: 90%, stroke: 0.6pt + pal.accent-muted, fill: none)
    )

    // Corner instrument marks
    place(top + left, dx: 2.5%, dy: 4%, instrument-pip(color: pal.accent, size: 4pt))
    place(top + right, dx: -2.5%, dy: 4%, instrument-pip(color: pal.accent, size: 4pt))
    place(bottom + left, dx: 2.5%, dy: -4%, instrument-pip(color: pal.accent, size: 4pt))
    place(bottom + right, dx: -2.5%, dy: -4%, instrument-pip(color: pal.accent, size: 4pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2pt,
          fill: pal.accent-text,
          font: _mono-font,
          upper(info.institution),
        )
        v(1.2em)
      }
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.primary, info.title)
      #v(0.6em)
      // Instrument divider (copper line + dot + line)
      #block(width: 200pt, height: 12pt)[
        #place(left + horizon, line(length: 85pt, stroke: 0.6pt + pal.accent))
        #place(center + horizon, circle(radius: 3pt, fill: pal.accent))
        #place(right + horizon, line(length: 85pt, stroke: 0.6pt + pal.accent))
      ]
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", style: "italic", fill: pal.text-dim, info.subtitle)
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

/// new-section-slide -- Reticle section number, observatory coordinate labels
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Observation grid background
    place(top + left,
      box(width: 100%, height: 100%,
        observation-grid(color: pal.secondary, width: 100%, height: 100%),
      ),
    )

    // Large reticle with section number
    place(top + right, dx: -80pt, dy: 40pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 130pt, height: 130pt)[
          #place(center + horizon, reticle(color: pal.accent.transparentize(40%), size: 110pt))
          #place(center + horizon, text(fill: pal.primary, size: 48pt, weight: "bold", num-str))
        ]
      },
    )

    // Observatory coordinate label (decorative)
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font)[AZ 000.0 | ALT +90.0 | LST 00:00],
    )

    // Top accent line (copper)
    place(top + left, dx: 3em, dy: 3em,
      line(length: 80pt, stroke: 1pt + pal.accent))

    // Content
    pad(left: 4em, right: 8em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.accent-text,
        font: _mono-font,
      )[OBSERVATION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.8em)
      #{
        set text(fill: pal.primary, size: 2.2em, weight: "bold")
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
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[OBSERVATORY],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single statement on twilight background, surrounded by crosshair markers
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
    // Subtle tracking arcs
    place(top + left, dx: -3em, dy: -3em,
      box(width: 120%, height: 120%,
        tracking-arcs(color: pal.secondary.transparentize(50%), width: 100%, height: 100%)))

    // Corner crosshair marks
    place(top + left, dx: 0pt, dy: 0pt,
      crosshair(color: pal.accent.transparentize(30%), size: 40pt))
    place(top + right, dx: 0pt, dy: 0pt,
      crosshair(color: pal.accent.transparentize(40%), size: 30pt))
    place(bottom + left, dx: 0pt, dy: 0pt,
      crosshair(color: pal.accent.transparentize(40%), size: 30pt))
    place(bottom + right, dx: 0pt, dy: 0pt,
      crosshair(color: pal.accent.transparentize(30%), size: 40pt))

    // Copper accent lines
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 40pt, stroke: 0.5pt + pal.accent))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 40pt, angle: 180deg, stroke: 0.5pt + pal.accent))

    set text(fill: pal.primary, size: 1.4em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    pad(x: 2em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Dome silhouette frame (bookends with title), copper farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page observation grid
    place(top + left,
      box(width: 100%, height: 100%,
        observation-grid(color: pal.secondary, width: 100%, height: 100%),
      ),
    )

    // Dome silhouette bottom (bookends with title-slide)
    place(bottom + center, dy: 10pt,
      dome-silhouette(color: pal.primary, width: 500pt, height: 200pt),
    )

    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.primary-ghost)[FINIS],
    )

    // Copper frame border (matching title-slide)
    place(center + horizon,
      rect(width: 94%, height: 90%, stroke: 0.6pt + pal.accent-muted, fill: none)
    )

    // Corner instrument marks (matching title-slide)
    place(top + left, dx: 2em, dy: 1.2em, instrument-pip(color: pal.accent, size: 4pt))
    place(top + right, dx: -2em, dy: 1.2em, instrument-pip(color: pal.accent, size: 4pt))
    place(bottom + left, dx: 2em, dy: -1.2em, instrument-pip(color: pal.accent, size: 4pt))
    place(bottom + right, dx: -2em, dy: -1.2em, instrument-pip(color: pal.accent, size: 4pt))

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Top reticle ornament
      #std.align(center, reticle(color: pal.accent, size: 32pt))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.primary, body)
      #v(0.8em)
      // Instrument divider
      #std.align(center, block(width: 160pt, height: 12pt)[
        #place(left + horizon, line(length: 65pt, stroke: 0.5pt + pal.accent))
        #place(center + horizon, circle(radius: 2.5pt, fill: pal.accent))
        #place(right + horizon, line(length: 65pt, stroke: 0.5pt + pal.accent))
      ])
      #v(1em)
      #text(size: 10pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[CLEAR SKIES]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let observatory-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "twilight",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.text)
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
      primary: pal.primary,
      neutral-lightest: pal.bg,
      neutral-darkest: pal.text,
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
