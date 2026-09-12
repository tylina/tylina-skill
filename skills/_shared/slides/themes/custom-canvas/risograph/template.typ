// Risograph Theme — Canvas-Level Touying Presentation Theme
// Channels the visual language of risograph printing: limited spot colors,
// misregistration offsets, halftone patterns, ink bleed, paper texture.
// Think indie music posters, art zines, gallery invitations.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  classic:  (paper: rgb("#F4ECD8"), spot1: rgb("#0078BF"), spot2: rgb("#F5638B"), spot3: rgb("#FFE800"), ink: rgb("#1A1A1A")),
  tropical: (paper: rgb("#FEFEFA"), spot1: rgb("#00A676"), spot2: rgb("#FF6B35"), spot3: rgb("#FFD23F"), ink: rgb("#1A1A1A")),
  mono:     (paper: rgb("#EDE8D5"), spot1: rgb("#1A1A1A"), spot2: rgb("#6B6B6B"), spot3: rgb("#B0B0B0"), ink: rgb("#1A1A1A")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  (
    paper: p.paper,
    spot1: p.spot1,
    spot2: p.spot2,
    spot3: p.spot3,
    ink: p.ink,
    // Derived
    ink-light: p.ink.transparentize(40%),
    ink-muted: p.ink.transparentize(60%),
    ink-faint: p.ink.transparentize(80%),
    ink-ghost: p.ink.transparentize(92%),
    spot1-light: p.spot1.transparentize(50%),
    spot1-faint: p.spot1.transparentize(75%),
    spot2-light: p.spot2.transparentize(50%),
    spot2-faint: p.spot2.transparentize(75%),
    spot3-light: p.spot3.transparentize(70%),
  )
}

// Default palette
#let palette = build-palette("classic")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 48pt,
  h1: 32pt,
  h2: 24pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
)


// =====================================================================
// KEY TECHNIQUE: Misregistration Effect
// =====================================================================

/// Place an element twice with slight offset for riso overprint look
/// Usage: #misregister[TITLE TEXT]
#let misregister(body, dx: 2.5pt, dy: -1.5pt, color1: palette.spot1, color2: palette.spot2) = {
  box[
    #place(dx: dx, dy: dy, text(fill: color2.transparentize(40%), body))
    #text(fill: color1, body)
  ]
}

/// Misregistration for large display text
#let misregister-display(body, dx: 3pt, dy: -2pt, color1: palette.spot1, color2: palette.spot2) = {
  box[
    #place(dx: dx, dy: dy, text(fill: color2.transparentize(30%), body))
    #text(fill: color1, body)
  ]
}


// =====================================================================
// KEY TECHNIQUE: Halftone Pattern
// =====================================================================

/// Halftone-inspired decorative block (low opacity color band)
#let halftone-block(color: palette.spot1, width: 100%, height: 50pt, opacity: 15%) = {
  block(width: width, height: height, fill: color.transparentize(100% - opacity))
}


// =====================================================================
// Decorative Elements
// =====================================================================

/// Registration mark (crosshair) - decorative element printers use
#let registration-mark(size: 16pt, color: palette.ink-muted) = {
  box(width: size, height: size)[
    // Horizontal line
    #place(left + horizon,
      line(length: size, stroke: 0.5pt + color))
    // Vertical line
    #place(top + center, dy: 0pt,
      line(length: size, angle: 90deg, stroke: 0.5pt + color))
    // Circle
    #place(center + horizon,
      circle(radius: size * 0.25, stroke: 0.5pt + color, fill: none))
  ]
}

/// Spot color block decoration
#let spot-block(color: palette.spot1, width: 40pt, height: 40pt) = {
  block(width: width, height: height, fill: color.transparentize(20%))
}

/// Irregular underline (hand-drawn feel - thick short stroke)
#let riso-underline(width: 60pt, color: palette.spot1) = {
  block(width: width, height: 3pt, fill: color)
}


// =====================================================================
// Reusable Components
// =====================================================================

/// Riso card - thick black border, spot color header band, no rounding
#let riso-card(title, body, accent: palette.spot1) = {
  block(width: 100%, stroke: 2.5pt + palette.ink, clip: true)[
    #stack(spacing: 0pt,
      block(width: 100%, fill: accent, inset: (x: 12pt, y: 8pt))[
        #text(size: 11pt, weight: "bold", fill: palette.paper, tracking: 1.5pt)[#title]
      ],
      block(width: 100%, fill: palette.paper, inset: (x: 14pt, y: 12pt))[
        #set text(size: typo.body, fill: palette.ink)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Overprint stat - big number with ghost color offset behind
#let overprint-stat(number, label, color1: palette.spot1, color2: palette.spot2) = {
  block(width: 100%, inset: (x: 8pt, y: 6pt))[
    #stack(spacing: .8em,
      box[
        #place(dx: 3pt, dy: -2pt, text(size: 42pt, weight: "black", fill: color2.transparentize(50%), number))
        #text(size: 42pt, weight: "black", fill: color1, number)
      ],
      text(size: typo.small, fill: palette.ink-light, tracking: 1pt, weight: "bold", label),
    )
    #lazy-v(1fr)
  ]
}

/// Spot tag - filled tag in one spot color with black text
#let spot-tag(body, color: palette.spot1) = {
  box(
    fill: color,
    inset: (x: 8pt, y: 4pt),
  )[
    #text(size: typo.small, weight: "bold", fill: palette.ink)[#body]
  ]
}

/// Zine quote - rotated slightly, thick left border in spot color
#let zine-quote(body, color: palette.spot2) = {
  rotate(-1.5deg,
    block(width: 100%, stroke: (left: 4pt + color), inset: (left: 14pt, y: 10pt, right: 8pt))[
      #set text(size: typo.body, fill: palette.ink, style: "italic")
      #body
    ]
  )
}

/// Halftone divider - low opacity color band as section separator
#let halftone-divider(color: palette.spot1, height: 8pt) = {
  block(width: 100%, height: height, fill: color.transparentize(80%))
}

/// Registration mark component (for decorative use in corners)
#let registration-marks() = {
  place(top + left, dx: 12pt, dy: 12pt, registration-mark(size: 14pt))
  place(top + right, dx: -12pt, dy: 12pt, registration-mark(size: 14pt))
  place(bottom + left, dx: 12pt, dy: -12pt, registration-mark(size: 14pt))
  place(bottom + right, dx: -12pt, dy: -12pt, registration-mark(size: 14pt))
}


// =====================================================================
// Internal Helpers
// =====================================================================

#let _riso-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 1em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(spacing: .8em,
    {
      // Title with misregistration-style pink shadow
      set text(size: 1.4em, weight: "bold", fill: pal.ink)
      if self.store.title != none {
        box[
          #place(dx: 1.5pt, dy: -1pt, text(fill: pal.spot2.transparentize(50%),
            utils.call-or-display(self, self.store.title)))
          #utils.call-or-display(self, self.store.title)
        ]
      } else {
        box[
          #place(dx: 1.5pt, dy: -1pt, text(fill: pal.spot2.transparentize(50%), {
            utils.display-current-heading(level: 2)
          }))
          #{utils.display-current-heading(level: 2)}
        ]
      }
    },
    // Accent mark + irregular underline
    stack(dir: ltr, spacing: 6pt,
      block(width: 4pt, height: 4pt, fill: pal.spot1),
      block(width: 50pt, height: 2.5pt, fill: pal.spot1),
    ),
  )
}

#let _riso-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.4em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 2pt, fill: pal.ink-muted)
      upper[RISO]
    },
    {
      // Registration mark as center divider
      box(width: 8pt, height: 8pt)[
        #place(left + horizon, line(length: 8pt, stroke: 0.4pt + pal.ink-muted))
        #place(top + center, line(length: 8pt, angle: 90deg, stroke: 0.4pt + pal.ink-muted))
      ]
    },
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.ink-muted)
      context {[#utils.slide-counter.display()]}
    },
  )
}


// =====================================================================
// Slide Functions
// =====================================================================

/// Standard content slide - cream paper bg, misregistered title shadow
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _riso-header(self)
  let footer(self) = _riso-footer(self)
    let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Dark slide - black bg with color spot overlays, cream text
#let dark-slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1em))
    set std.align(horizon + left)
    set text(size: 1.4em, weight: "bold", fill: pal.paper)
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)
    }
  }
  let footer(self) = {
    let pal = self.store.palette
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    grid(
      columns: (1fr, auto, 1fr),
      [],
      [],
      {
        set std.align(right)
        set text(size: 7pt, weight: "bold", fill: pal.paper.transparentize(50%))
        context {[#utils.slide-counter.display()]}
      },
    )
  }
  let setting(body) = {
    // Spot color overlay blocks at low opacity
    place(top + right, dx: -30pt, dy: 20pt,
      block(width: 120pt, height: 80pt, fill: pal.spot1.transparentize(85%)))
    place(bottom + left, dx: 40pt, dy: -30pt,
      block(width: 90pt, height: 60pt, fill: pal.spot2.transparentize(85%)))
    set text(fill: pal.paper)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      header: header,
      footer: footer,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide - BOLD misregistered title, geometric shapes, black border frame
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Black border frame (inset from edges)
    place(top + left, dx: 12pt, dy: 12pt,
      rect(width: 100% - 24pt, height: 100% - 24pt,
        stroke: 2.5pt + pal.ink, fill: none))
    // Large yellow geometric shape at 30% opacity
    place(top + right, dx: -60pt, dy: 40pt,
      circle(radius: 100pt, fill: pal.spot3.transparentize(70%), stroke: none))
    // Smaller spot block
    place(bottom + left, dx: 50pt, dy: -60pt,
      block(width: 80pt, height: 80pt, fill: pal.spot1.transparentize(80%)))
    // Registration marks
    place(top + left, dx: 20pt, dy: 20pt, registration-mark(size: 12pt, color: pal.ink-faint))
    place(bottom + right, dx: -20pt, dy: -20pt, registration-mark(size: 12pt, color: pal.ink-faint))
    // Content
    set std.align(left + horizon)
    pad(x: 4em, y: 3em)[
      // Title with misregistration effect (blue + pink offset)
      #{
        set text(size: 2.6em, weight: "black", tracking: 1pt)
        box[
          #place(dx: 3pt, dy: -2pt, text(fill: pal.spot2.transparentize(30%), info.title))
          #text(fill: pal.spot1, info.title)
        ]
      }
      #v(0.8em)
      // Thick underline
      #block(width: 80pt, height: 3.5pt, fill: pal.ink)
      #v(0.8em)
      // Subtitle
      #if info.subtitle != none {
        text(size: typo.h2, fill: pal.ink-light, weight: "medium", info.subtitle)
        v(0.6em)
      }
      // Author / date
      #{
        set text(size: 10pt, fill: pal.ink-muted, weight: "bold", tracking: 1.5pt)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.spot1, sym.slash.double)
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
    config-page(header: none, footer: none, margin: 0pt, fill: pal.paper),
  )
  touying-slide(self: self, body)
})

/// New section slide - large section number with misregistration, bold title
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt, fill: pal.paper),
  )
  let main-body = {
    // Border frame
    place(top + left, dx: 12pt, dy: 12pt,
      rect(width: 100% - 24pt, height: 100% - 24pt,
        stroke: 2pt + pal.ink, fill: none))
    // Spot color block decoration
    place(top + right, dx: -40pt, dy: 30pt,
      block(width: 60pt, height: 60pt, fill: pal.spot1.transparentize(75%)))
    place(bottom + left, dx: 50pt, dy: -40pt,
      block(width: 40pt, height: 100pt, fill: pal.spot2.transparentize(80%)))
    // Large section number with misregistration
    place(top + right, dx: -60pt, dy: 50pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        set text(size: 120pt, weight: "black")
        box[
          #place(dx: 3pt, dy: -2pt, text(fill: pal.spot2.transparentize(40%), num-str))
          #text(fill: pal.spot1.transparentize(30%), num-str)
        ]
      },
    )
    // Section title
    pad(left: 4em, right: 8em, top: 4em, bottom: 2em)[
      #v(1fr)
      // Kicker
      #spot-tag(color: pal.spot1)[SECTION]
      #v(0.8em)
      // Title
      #{
        set text(fill: pal.ink, size: 2em, weight: "black")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 60pt, height: 3pt, fill: pal.ink)
      #v(2fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide - single spot color fill, black bold text, border frame
#let focus-slide(body, color: none) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  let fill-color = if color != none { color } else { pal.spot1 }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: fill-color,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Border frame
    place(top + left, dx: -1.5em, dy: -1.5em,
      rect(width: 100% + 3em - 24pt, height: 100% + 3em - 24pt,
        stroke: 2.5pt + pal.ink, fill: none))
    set text(fill: pal.ink, size: 2em, weight: "black")
    set std.align(horizon + center)
    body
  }
  touying-slide(self: self, main-body)
})

/// Ending slide - paper bg, misregistered farewell text, spot color shapes
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt, fill: pal.paper),
  )
  let main-body = {
    // Decorative shapes
    place(top + left, dx: 40pt, dy: 40pt,
      block(width: 50pt, height: 50pt, fill: pal.spot3.transparentize(60%)))
    place(bottom + right, dx: -50pt, dy: -50pt,
      circle(radius: 35pt, fill: pal.spot1.transparentize(70%)))
    place(top + right, dx: -80pt, dy: 60pt,
      block(width: 30pt, height: 80pt, fill: pal.spot2.transparentize(75%)))
    // Registration marks
    place(top + left, dx: 16pt, dy: 16pt, registration-mark(size: 12pt, color: pal.ink-faint))
    place(bottom + right, dx: -16pt, dy: -16pt, registration-mark(size: 12pt, color: pal.ink-faint))
    // Misregistered farewell text
    set std.align(center + horizon)
    pad(x: 4em)[
      #{
        set text(size: 2.4em, weight: "black")
        box[
          #place(dx: 3pt, dy: -2pt, text(fill: pal.spot2.transparentize(30%), body))
          #text(fill: pal.spot1, body)
        ]
      }
      #v(1em)
      #block(width: 40pt, height: 3pt, fill: pal.ink)
      #v(1em)
      #text(size: 8pt, weight: "bold", tracking: 2.5pt, fill: pal.ink-muted)[RISOGRAPH]
    ]
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// Theme Entry Point
// =====================================================================

#let risograph-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "classic",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      fill: pal.paper,
      margin: (top: 4.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: pal.spot1,
      neutral-lightest: pal.paper,
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
