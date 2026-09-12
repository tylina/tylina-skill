// Atelier Theme -- Artist's studio / workshop aesthetic
// Oil painting palette, canvas stretchers, paint splatter, studio lighting
// Warm cream canvas-texture background with cadmium red and ultramarine accents
// Loose gestural brush strokes and paint splatter SVG decorations
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Color Palette
// =====================================================================

#let palette = (
  bg: rgb("#FDF8EE"),           // Canvas cream
  primary: rgb("#D42B2B"),       // Cadmium red
  accent: rgb("#1A3A7A"),        // Ultramarine blue
  secondary: rgb("#6B4C3B"),     // Raw umber
  ink: rgb("#1C1C1C"),           // Charcoal text
  card: rgb("#FFFEF9"),          // Off-white card
  // Derived
  primary-dim: rgb("#D42B2B").transparentize(30%),
  primary-muted: rgb("#D42B2B").transparentize(50%),
  primary-faint: rgb("#D42B2B").transparentize(80%),
  primary-ghost: rgb("#D42B2B").transparentize(92%),
  accent-dim: rgb("#1A3A7A").transparentize(30%),
  accent-muted: rgb("#1A3A7A").transparentize(50%),
  accent-faint: rgb("#1A3A7A").transparentize(75%),
  accent-ghost: rgb("#1A3A7A").transparentize(92%),
  ink-dim: rgb("#1C1C1C").transparentize(25%),
  ink-muted: rgb("#1C1C1C").transparentize(50%),
  ink-faint: rgb("#1C1C1C").transparentize(70%),
  ink-ghost: rgb("#1C1C1C").transparentize(90%),
  secondary-dim: rgb("#6B4C3B").transparentize(40%),
  secondary-faint: rgb("#6B4C3B").transparentize(75%),
  secondary-ghost: rgb("#6B4C3B").transparentize(90%),
  bg-dark: rgb("#2A1F1A"),       // Dark studio wall
  meta-color: rgb("#1C1C1C").transparentize(60%),
)

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

#let _mono-font = ("IBM Plex Mono", "Menlo")
#let _sans-font = ("IBM Plex Sans", "Arial", "PingFang SC")
#let _serif-font = ("IBM Plex Serif", "Georgia", "Songti SC")

// =====================================================================
// SVG Definitions
// =====================================================================

// 1. Gestural brush stroke — loose, organic paint stroke with varied thickness
#let _brushstroke-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 80\"><path d=\"M 5 45 C 15 20, 40 15, 70 30 C 100 45, 120 55, 150 42 C 180 29, 210 22, 245 35 C 280 48, 310 52, 340 40 C 360 32, 375 28, 395 35\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"6\" stroke-linecap=\"round\" opacity=\"0.7\"/><path d=\"M 10 50 C 30 60, 60 62, 90 52 C 120 42, 145 38, 175 48 C 205 58, 230 60, 260 50 C 290 40, 320 38, 350 45 C 370 50, 385 48, 398 42\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"3\" stroke-linecap=\"round\" opacity=\"0.4\"/><path d=\"M 20 38 C 45 28, 75 25, 105 33 C 135 41, 165 44, 195 36 C 225 28, 255 26, 285 34 C 315 42, 340 44, 365 38\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" opacity=\"0.25\"/></svg>"

// 2. Paint splatter — irregular drops and flicks of paint
#let _splatter-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><circle cx=\"80\" cy=\"90\" r=\"18\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"95\" cy=\"75\" r=\"8\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"110\" cy=\"100\" r=\"5\" fill=\"currentColor\" opacity=\"0.45\"/><circle cx=\"60\" cy=\"105\" r=\"4\" fill=\"currentColor\" opacity=\"0.35\"/><circle cx=\"130\" cy=\"85\" r=\"3\" fill=\"currentColor\" opacity=\"0.4\"/><ellipse cx=\"75\" cy=\"120\" rx=\"12\" ry=\"6\" fill=\"currentColor\" opacity=\"0.3\" transform=\"rotate(-15 75 120)\"/><circle cx=\"45\" cy=\"80\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"140\" cy=\"110\" r=\"2\" fill=\"currentColor\" opacity=\"0.35\"/><path d=\"M 85 70 Q 90 50 100 45 Q 105 43 102 55 Q 98 65 95 72\" fill=\"currentColor\" opacity=\"0.4\"/><path d=\"M 70 95 Q 55 85 48 78 Q 45 75 52 80 Q 60 88 68 93\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"155\" cy=\"70\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.25\"/><circle cx=\"35\" cy=\"130\" r=\"2.2\" fill=\"currentColor\" opacity=\"0.2\"/><path d=\"M 100 95 Q 115 120 120 135 Q 122 140 118 132 Q 112 118 105 100\" fill=\"currentColor\" opacity=\"0.3\"/></svg>"

// 3. Canvas stretcher frame — wooden frame with cross bars
#let _stretcher-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><rect x=\"8\" y=\"8\" width=\"384\" height=\"284\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"3\" opacity=\"0.6\" rx=\"2\"/><rect x=\"14\" y=\"14\" width=\"372\" height=\"272\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.3\" rx=\"1\"/><line x1=\"8\" y1=\"8\" x2=\"50\" y2=\"50\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.25\"/><line x1=\"392\" y1=\"8\" x2=\"350\" y2=\"50\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.25\"/><line x1=\"8\" y1=\"292\" x2=\"50\" y2=\"250\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.25\"/><line x1=\"392\" y1=\"292\" x2=\"350\" y2=\"250\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.25\"/><line x1=\"200\" y1=\"8\" x2=\"200\" y2=\"292\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.15\" stroke-dasharray=\"8 6\"/><line x1=\"8\" y1=\"150\" x2=\"392\" y2=\"150\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.15\" stroke-dasharray=\"8 6\"/></svg>"

// 4. Sketch pencil marks — light pencil gesture lines and hatching
#let _pencil-marks-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 200\"><path d=\"M 20 40 C 35 38, 55 42, 80 39 C 105 36, 130 41, 155 38\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\" stroke-linecap=\"round\"/><path d=\"M 25 48 C 40 50, 60 46, 85 49 C 110 52, 130 47, 150 50\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.2\" stroke-linecap=\"round\"/><path d=\"M 180 30 L 185 55 M 190 28 L 195 53 M 200 30 L 205 55 M 210 29 L 215 54 M 220 31 L 225 56\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.2\" stroke-linecap=\"round\"/><path d=\"M 40 130 C 60 125, 80 132, 100 128 C 120 124, 140 130, 160 126\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.15\" stroke-linecap=\"round\"/><circle cx=\"250\" cy=\"45\" r=\"15\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.2\"/><circle cx=\"250\" cy=\"45\" r=\"10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.15\"/><path d=\"M 60 160 L 90 158 M 100 162 L 130 159 M 140 161 L 165 158\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.18\" stroke-linecap=\"round\"/></svg>"

// 5. Palette knife texture — broad textured strokes suggesting impasto
#let _palette-knife-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 120\"><path d=\"M 10 60 C 30 40, 60 35, 90 45 C 120 55, 140 65, 170 55 C 200 45, 230 40, 260 50 C 275 55, 285 58, 295 55\" fill=\"currentColor\" opacity=\"0.12\" stroke=\"none\"/><path d=\"M 15 65 C 40 75, 70 80, 100 70 C 130 60, 155 55, 185 65 C 215 75, 240 78, 270 68 C 285 62, 292 60, 298 62\" fill=\"currentColor\" opacity=\"0.08\" stroke=\"none\"/><path d=\"M 5 58 C 35 48, 65 45, 95 53 C 125 61, 150 64, 180 56 C 210 48, 240 46, 270 54 C 285 58, 295 57, 300 55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.2\" stroke-linecap=\"round\"/><path d=\"M 20 70 C 50 78, 80 80, 110 73 C 140 66, 165 63, 195 70 C 220 76, 250 78, 280 72\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.12\" stroke-linecap=\"round\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let brushstroke(color: palette.primary, width: 100%, height: 40pt) = {
  let svg = _brushstroke-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let paint-splatter(color: palette.primary, size: 150pt) = {
  let svg = _splatter-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let stretcher-frame(color: palette.secondary, width: 100%, height: 100%) = {
  let svg = _stretcher-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let pencil-marks(color: palette.ink, width: 100%, height: 100%) = {
  let svg = _pencil-marks-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let palette-knife(color: palette.secondary, width: 100%, height: 60pt) = {
  let svg = _palette-knife-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Reusable Components
// =====================================================================

/// canvas-card -- Card with paint-stroke left border and off-white fill
#let canvas-card(title, body) = {
  block(
    width: 100%,
    stroke: (left: 4pt + palette.primary, rest: 0.5pt + palette.secondary-faint),
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
    fill: palette.card,
    radius: (right: 3pt),
  )[
    #stack(
      spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// pigment-stat -- Large number with paint accent, like a pigment tube label
#let pigment-stat(label, value, description: none) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #stack(
      spacing: .8em,
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.primary,
        font: _mono-font,
        upper(label),
      ),
      text(size: 44pt, weight: "bold", fill: palette.ink, value),
      block(width: 35pt, height: 3pt, fill: palette.primary),
      [
        #if description != none {
          text(
            size: 13pt,
            weight: "regular",
            fill: palette.ink-muted,
            font: _sans-font,
            description,
          )
        }
        #lazy-v(1fr)
      ],
    )
  ]
}

/// easel-box -- Content area with faint canvas texture background (layered blocks)
#let easel-box(body) = {
  block(width: 100%, inset: 0pt)[
    // Simulated canvas weave with layered background
    #place(center + horizon,
      block(width: 100%, height: 100%, fill: palette.bg))
    #place(center + horizon,
      block(width: 98%, height: 96%, fill: palette.card, stroke: 0.3pt + palette.secondary-faint))
    // Content on top
    #block(width: 100%, inset: (x: 1.2em, y: 1em))[
      #set text(fill: palette.ink, size: typo.body, font: _sans-font)
      #body
    ]
  ]
}

/// brushstroke-divider -- Gestural brush stroke line separator
#let brushstroke-divider(color: palette.primary, total-width: 100%) = {
  block(width: total-width, height: 18pt)[
    #place(center + horizon,
      box(width: 100%, height: 18pt,
        brushstroke(color: color.transparentize(40%), width: 100%, height: 18pt)))
  ]
}

/// swatch-tag -- Small color swatch label like a paint tube tag
#let swatch-tag(body, color: palette.primary) = {
  box(
    fill: color.transparentize(85%),
    stroke: 0.5pt + color.transparentize(50%),
    inset: (x: 8pt, y: 3pt),
    radius: 2pt,
  )[
    #text(size: typo.small, fill: color, weight: "medium", font: _mono-font, body)
  ]
}

/// palette-highlight -- Emphasized block with color accent bar at top
#let palette-highlight(body, color: palette.accent) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.4pt + color.transparentize(60%),
    inset: (x: 1em, y: 0.8em),
    radius: 2pt,
  )[
    #place(top + left, block(width: 100%, height: 3pt, fill: color))
    #v(0.3em)
    #set text(fill: palette.ink, size: 13pt, font: _sans-font)
    #body
  ]
}

/// studio-note -- Quote/note with pencil-sketch left border
#let studio-note(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 2pt + palette.secondary),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
    fill: palette.card,
  )[
    #text(size: typo.body, style: "italic", fill: palette.ink, body)
    #if cite != none {
      v(0.4em)
      text(
        size: typo.tiny,
        style: "normal",
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.meta-color,
        font: _mono-font,
        [-- #upper(cite)],
      )
    }
  ]
}

/// gesso-badge -- Dark label badge like a gesso-primed board label
#let gesso-badge(body) = {
  box(
    fill: palette.ink,
    inset: (x: 10pt, y: 4pt),
    radius: 2pt,
  )[
    #text(size: typo.tiny, fill: palette.bg, weight: "bold", tracking: 2pt, font: _mono-font, upper(body))
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
      set text(fill: pal.ink, size: 1.4em, weight: "bold", font: _sans-font)
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 50pt, height: 2.5pt, fill: pal.primary),
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
      upper[ATELIER]
    },
    text(fill: pal.primary-muted, size: 8pt)[#sym.diamond.filled],
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
    set text(size: 8pt, fill: pal.bg.transparentize(40%), font: _mono-font)
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
  set text(fill: pal.bg.transparentize(50%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[ATELIER]
    },
    text(fill: pal.primary-muted, size: 8pt)[#sym.diamond.filled],
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

/// slide -- Warm canvas bg, faint pencil marks + paint texture, content slide
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
    // Faint pencil marks background (persistent canvas atmosphere)
    place(top + left,
      box(width: 100%, height: 100%,
        pencil-marks(color: pal.secondary.transparentize(40%), width: 100%, height: 100%),
      ),
    )
    // Subtle paint marks at edges
    place(bottom + right, dx: -10pt, dy: -5pt,
      box(width: 80pt, height: 30pt,
        palette-knife(color: pal.primary.transparentize(70%), width: 80pt, height: 30pt)))
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deep studio-wall dark background with paint accents
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
    // Paint splatter decorations in corners
    place(top + right, dx: -20pt, dy: 15pt,
      box(width: 100pt, height: 100pt,
        paint-splatter(color: pal.primary.transparentize(60%), size: 100pt)))
    place(bottom + left, dx: 15pt, dy: -20pt,
      box(width: 70pt, height: 70pt,
        paint-splatter(color: pal.accent.transparentize(70%), size: 70pt)))
    set text(fill: pal.bg)
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

/// title-slide -- Canvas stretcher frame + paint splatter bookend
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Cream canvas background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page canvas stretcher frame SVG
    place(center + horizon,
      box(width: 100%, height: 100%,
        stretcher-frame(color: pal.secondary, width: 100%, height: 100%)))

    // Paint splatter top-right (cadmium red)
    place(top + right, dx: -20pt, dy: 10pt,
      paint-splatter(color: pal.primary.transparentize(30%), size: 160pt))

    // Paint splatter bottom-left (ultramarine)
    place(bottom + left, dx: 10pt, dy: -20pt,
      paint-splatter(color: pal.accent.transparentize(40%), size: 130pt))

    // Gestural brush stroke across middle area
    place(center + horizon, dy: 60pt,
      box(width: 70%, height: 30pt,
        brushstroke(color: pal.primary.transparentize(50%), width: 100%, height: 30pt)))

    // Pencil sketch marks faintly visible
    place(top + left, dx: 30pt, dy: 40pt,
      box(width: 200pt, height: 120pt,
        pencil-marks(color: pal.secondary.transparentize(50%), width: 200pt, height: 120pt)))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2.5pt,
          fill: pal.secondary,
          font: _mono-font,
          upper(info.institution),
        )
        v(1.2em)
      }
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.5em)
      // Paint-stroke divider
      #block(width: 180pt, height: 3pt, fill: pal.primary)
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
          text(fill: pal.primary, size: 7pt)[#sym.diamond.filled]
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

/// new-section-slide -- Paint brush divider with section number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Pencil marks background atmosphere
    place(top + left,
      box(width: 100%, height: 100%,
        pencil-marks(color: pal.secondary.transparentize(50%), width: 100%, height: 100%)))

    // Large gestural brush stroke behind section number
    place(top + right, dx: -50pt, dy: 30pt,
      box(width: 250pt, height: 60pt,
        brushstroke(color: pal.primary.transparentize(50%), width: 250pt, height: 60pt)))

    // Section number in bold
    place(top + right, dx: -80pt, dy: 40pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.primary, size: 56pt, weight: "bold", font: _mono-font, num-str)
      },
    )

    // Top accent line
    place(top + left, dx: 3em, dy: 3em,
      block(width: 80pt, height: 3pt, fill: pal.primary))

    // Studio label (decorative)
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font, tracking: 1.5pt)[STUDIO NOTE])

    // Content
    pad(left: 4em, right: 10em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.primary,
        font: _mono-font,
      )[CHAPTER #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.8em)
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 60pt, height: 2.5pt, fill: pal.accent)
      #v(3fr)
    ]

    // Bottom brush stroke accent
    place(bottom + right, dx: -2em, dy: -2em,
      box(width: 120pt, height: 20pt,
        brushstroke(color: pal.accent.transparentize(50%), width: 120pt, height: 20pt)))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font, tracking: 1pt)[ATELIER],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Bold statement on canvas with paint accents
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
    // Paint splatter accents in corners
    place(top + left, dx: -10pt, dy: -10pt,
      paint-splatter(color: pal.primary.transparentize(65%), size: 90pt))
    place(bottom + right, dx: 10pt, dy: 10pt,
      paint-splatter(color: pal.accent.transparentize(70%), size: 80pt))

    // Brush stroke underline effect behind text area
    place(center + horizon, dy: 20pt,
      box(width: 80%, height: 20pt,
        brushstroke(color: pal.primary.transparentize(60%), width: 100%, height: 20pt)))

    // Corner paint marks (like frame corners)
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 40pt, height: 3pt, fill: pal.primary))
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 3pt, height: 30pt, fill: pal.primary))
    place(bottom + right, dx: 0pt, dy: 0pt,
      block(width: 40pt, height: 3pt, fill: pal.accent))

    set text(fill: pal.ink, size: 1.5em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    pad(x: 2em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Canvas stretcher frame + paint splatter farewell (bookend with title)
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Full-page canvas stretcher frame (bookend with title-slide)
    place(center + horizon,
      box(width: 100%, height: 100%,
        stretcher-frame(color: pal.secondary, width: 100%, height: 100%)))

    // Paint splatter top-left (bookend mirror of title)
    place(top + left, dx: 15pt, dy: 10pt,
      paint-splatter(color: pal.primary.transparentize(35%), size: 140pt))

    // Paint splatter bottom-right (ultramarine)
    place(bottom + right, dx: -15pt, dy: -15pt,
      paint-splatter(color: pal.accent.transparentize(45%), size: 120pt))

    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost)[FIN],
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Paint stroke ornament
      #std.align(center, block(width: 120pt, height: 3pt, fill: pal.primary))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.8em)
      // Accent divider
      #std.align(center, block(width: 80pt, height: 2pt, fill: pal.accent))
      #v(1em)
      #text(size: 10pt, fill: pal.meta-color, font: _mono-font, tracking: 2.5pt)[ATELIER]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let atelier-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  let pal = palette

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
