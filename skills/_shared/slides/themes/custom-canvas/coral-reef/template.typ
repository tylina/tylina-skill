// Coral Reef Theme -- Underwater marine biology, organic shapes
// Deep blue-to-teal gradients, bioluminescence, vibrant coral formations
// Dark background with luminous color accents
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  deep: (bg: rgb("#0A1628"), ink: rgb("#E0F4FF"), coral: rgb("#FF6B6B"), cyan: rgb("#00E5FF"), ocean: rgb("#006994")),
  shallow: (bg: rgb("#0D2B3E"), ink: rgb("#E8F8FF"), coral: rgb("#FF8A8A"), cyan: rgb("#40EFFF"), ocean: rgb("#0088B4")),
  abyss: (bg: rgb("#050D18"), ink: rgb("#D0EAFF"), coral: rgb("#FF5252"), cyan: rgb("#00BCD4"), ocean: rgb("#004D6E")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let coral = p.coral
  let cyan = p.cyan
  let ocean = p.ocean
  (
    bg: bg,
    ink: ink,
    coral: coral,
    cyan: cyan,
    ocean-blue: ocean,
    // Derived from ink
    ink-dim: ink.transparentize(25%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(90%),
    // Derived from coral
    coral-dim: coral.transparentize(40%),
    coral-faint: coral.transparentize(75%),
    coral-ghost: coral.transparentize(92%),
    // Derived from cyan
    cyan-dim: cyan.transparentize(35%),
    cyan-muted: cyan.transparentize(55%),
    cyan-faint: cyan.transparentize(80%),
    cyan-ghost: cyan.transparentize(92%),
    // Derived from ocean
    ocean-dim: ocean.transparentize(40%),
    ocean-faint: ocean.transparentize(75%),
    // Deeper background
    bg-deep: bg.darken(30%),
    // Meta
    meta-color: ink.transparentize(65%),
  )
}

// Default palette
#let palette = build-palette("deep")

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

#let _sans-font = ("Avenir Next", "Arial Unicode MS")
#let _mono-font = "IBM Plex Mono"

// =====================================================================
// SVG Definitions
// =====================================================================

// Coral branch silhouette: organic branching coral structure
#let _coral-branch-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><path d=\"M100 190 C100 160 95 140 90 120 C85 100 75 90 65 75 C55 60 50 45 55 30 C58 20 65 15 70 12\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" opacity=\"0.8\"/><path d=\"M90 120 C80 115 70 110 60 100 C50 90 45 80 50 65\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" opacity=\"0.7\"/><path d=\"M95 140 C105 135 115 125 125 110 C135 95 140 80 135 65 C130 50 125 40 130 30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" opacity=\"0.75\"/><path d=\"M125 110 C135 105 145 95 150 80 C155 65 150 55 145 45\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-linecap=\"round\" opacity=\"0.6\"/><path d=\"M65 75 C55 70 45 65 40 55 C35 45 38 35 42 28\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" stroke-linecap=\"round\" opacity=\"0.5\"/><circle cx=\"70\" cy=\"12\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"55\" cy=\"30\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"130\" cy=\"30\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"145\" cy=\"45\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"42\" cy=\"28\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"50\" cy=\"65\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/></svg>"

// Bubble cluster: group of circles rising upward
#let _bubble-cluster-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 180\"><circle cx=\"60\" cy=\"160\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.7\"/><circle cx=\"45\" cy=\"135\" r=\"5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.6\"/><circle cx=\"70\" cy=\"125\" r=\"6\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.65\"/><circle cx=\"55\" cy=\"100\" r=\"4\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.55\"/><circle cx=\"75\" cy=\"90\" r=\"3.5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.5\"/><circle cx=\"50\" cy=\"70\" r=\"3\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.45\"/><circle cx=\"65\" cy=\"55\" r=\"2.5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.4\"/><circle cx=\"55\" cy=\"35\" r=\"2\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.35\"/><circle cx=\"62\" cy=\"18\" r=\"1.5\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><circle cx=\"60\" cy=\"160\" r=\"3\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"70\" cy=\"125\" r=\"2\" fill=\"currentColor\" opacity=\"0.1\"/></svg>"

// Jellyfish silhouette: bell shape with trailing tentacles
#let _jellyfish-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 160 200\"><path d=\"M30 80 C30 40 55 15 80 15 C105 15 130 40 130 80 C130 90 120 95 110 90 C100 85 90 88 80 90 C70 88 60 85 50 90 C40 95 30 90 30 80 Z\" fill=\"currentColor\" opacity=\"0.25\" stroke=\"currentColor\" stroke-width=\"1\"/><path d=\"M50 92 C48 110 45 130 42 150 C40 160 38 170 40 180\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\" stroke-linecap=\"round\"/><path d=\"M65 92 C63 115 60 140 58 160 C56 170 55 180 57 190\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.45\" stroke-linecap=\"round\"/><path d=\"M80 92 C80 120 80 145 80 165 C80 175 79 185 80 195\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.4\" stroke-linecap=\"round\"/><path d=\"M95 92 C97 115 100 140 102 160 C104 170 105 180 103 190\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.45\" stroke-linecap=\"round\"/><path d=\"M110 92 C112 110 115 130 118 150 C120 160 122 170 120 180\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\" stroke-linecap=\"round\"/><circle cx=\"65\" cy=\"55\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"95\" cy=\"55\" r=\"2\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"80\" cy=\"65\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.3\"/></svg>"

// Wave/current line pattern: flowing horizontal curves
#let _wave-pattern-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 80\"><path d=\"M0 40 C30 25 60 25 100 40 C140 55 170 55 200 40 C230 25 260 25 300 40 C340 55 370 55 400 40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.5\"/><path d=\"M0 55 C30 42 60 42 100 55 C140 68 170 68 200 55 C230 42 260 42 300 55 C340 68 370 68 400 55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.35\"/><path d=\"M0 25 C30 12 60 12 100 25 C140 38 170 38 200 25 C230 12 260 12 300 25 C340 38 370 38 400 25\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.7\" opacity=\"0.35\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let coral-branch(color: palette.coral, size-w: 160pt, size-h: 160pt) = {
  let svg = _coral-branch-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size-w, height: size-h)
}

#let bubble-cluster(color: palette.cyan, size-w: 80pt, size-h: 120pt) = {
  let svg = _bubble-cluster-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size-w, height: size-h)
}

#let jellyfish(color: palette.cyan, size-w: 100pt, size-h: 120pt) = {
  let svg = _jellyfish-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size-w, height: size-h)
}

#let wave-pattern(color: palette.ocean-blue, width: 100%, height: 40pt) = {
  let svg = _wave-pattern-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// biolumi-dot -- Small glowing dot simulating bioluminescence
#let biolumi-dot(color: palette.cyan, size: 4pt) = {
  box(width: size * 2.5, height: size * 2.5)[
    #place(center + horizon, circle(radius: size * 1.2, fill: color.transparentize(80%)))
    #place(center + horizon, circle(radius: size * 0.7, fill: color.transparentize(50%)))
    #place(center + horizon, circle(radius: size * 0.3, fill: color))
  ]
}

// =====================================================================
// Reusable Components
// =====================================================================

/// coral-card -- Card with organic rounded corners and subtle glow border
#let coral-card(title, body) = {
  block(
    width: 100%,
    stroke: 1pt + palette.coral-dim,
    radius: 12pt,
    inset: (x: 1.2em, top: 0.9em, bottom: 0.7em),
    fill: palette.bg.lighten(5%),
  )[
    #stack(spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      {
        set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// biolumi-stat -- Stat with glowing accent
#let biolumi-stat(label, value, description: none) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #stack(spacing: .8em,
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.cyan,
        font: _mono-font,
        upper(label),
      ),
      grid(columns: (auto, auto), column-gutter: 8pt, align: horizon,
        text(size: 42pt, weight: "bold", fill: palette.ink, value),
        move(dy: -4pt, biolumi-dot(color: palette.cyan, size: 5pt)),
      ),
      block(width: 30pt, height: 2pt, fill: palette.cyan),
      if description != none { text(
        size: 13pt,
        weight: "regular",
        fill: palette.ink-muted,
        font: _sans-font,
        description,
      ) },
    )
  ]
}

/// current-panel -- Panel with wave-like top border
#let current-panel(title: none, body) = {
  block(width: 100%, clip: true)[
    #stack(spacing: 0pt,
      block(width: 100%, height: 20pt, clip: true)[
        #wave-pattern(color: palette.ocean-blue.transparentize(30%), width: 100%, height: 20pt)
      ],
      block(
        width: 100%,
        fill: palette.ocean-blue.transparentize(88%),
        stroke: (left: 1.5pt + palette.ocean-blue, bottom: 0.5pt + palette.ocean-faint, right: 0.5pt + palette.ocean-faint),
        inset: (x: 1.2em, top: 0.6em, bottom: 0.8em),
      )[
        #stack(spacing: .8em,
          if title != none {
            text(size: typo.small, weight: "bold", fill: palette.ocean-blue, title)
          },
          {
            set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
            body
          },
        )
      ],
    )
  ]
}

/// bubble-tag -- Rounded tag like a bubble
#let bubble-tag(body) = {
  box(
    fill: palette.cyan.transparentize(85%),
    stroke: 0.5pt + palette.cyan-muted,
    inset: (x: 10pt, y: 4pt),
    radius: 14pt,
  )[
    #text(size: typo.small, fill: palette.cyan, weight: "medium", font: _mono-font, body)
  ]
}

/// reef-divider -- Decorative divider with coral dots
#let reef-divider(total-width: 100%) = {
  block(width: total-width, height: 14pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.5pt + palette.coral-faint))
    #place(left + horizon, dx: 10%, biolumi-dot(color: palette.coral-dim, size: 3pt))
    #place(left + horizon, dx: 30%, biolumi-dot(color: palette.cyan-muted, size: 2pt))
    #place(left + horizon, dx: 50%, biolumi-dot(color: palette.coral-dim, size: 3.5pt))
    #place(left + horizon, dx: 70%, biolumi-dot(color: palette.cyan-muted, size: 2.5pt))
    #place(left + horizon, dx: 90%, biolumi-dot(color: palette.coral-dim, size: 3pt))
  ]
}

/// depth-quote -- Quote with bioluminescent accent
#let depth-quote(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 2pt + palette.cyan),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(spacing: .8em,
      text(size: typo.body, style: "italic", fill: palette.ink, body),
      if cite != none { text(
        size: typo.tiny,
        style: "normal",
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.meta-color,
        font: _mono-font,
        [-- #upper(cite)],
      ) },
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
    block(width: 50pt, height: 2pt, fill: pal.coral),
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
      upper[CORAL REEF]
    },
    text(fill: pal.cyan-muted, size: 6pt)[#sym.circle.filled],
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
    set text(size: 8pt, fill: pal.ink.transparentize(50%), font: _mono-font)
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
  set text(fill: pal.ink.transparentize(60%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[CORAL REEF]
    },
    text(fill: pal.cyan-muted, size: 6pt)[#sym.circle.filled],
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

/// slide -- Deep ocean bg, wave pattern background, coral accents
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
    // Subtle wave pattern in background
    place(bottom + left,
      box(width: 100%, height: 50pt,
        wave-pattern(color: pal.ocean-blue.transparentize(70%), width: 100%, height: 50pt),
      ),
    )
    // Small bioluminescent dots as accents
    place(top + right, dx: -2em, dy: 0.5em,
      biolumi-dot(color: pal.cyan.transparentize(40%), size: 3pt),
    )
    place(bottom + left, dx: 2em, dy: -1em,
      biolumi-dot(color: pal.cyan.transparentize(50%), size: 2pt),
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

/// title-slide -- Coral branch decorations, jellyfish, deep ocean
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Deep ocean background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Wave pattern at bottom
    place(bottom + left, dy: -10pt,
      box(width: 100%, height: 50pt,
        wave-pattern(color: pal.ocean-blue.transparentize(40%), width: 100%, height: 50pt),
      ),
    )

    // Coral branch top-right
    place(top + right, dx: -20pt, dy: 10pt,
      coral-branch(color: pal.coral.transparentize(30%), size-w: 160pt, size-h: 160pt),
    )

    // Coral branch bottom-left (mirrored effect by smaller size)
    place(bottom + left, dx: 10pt, dy: -20pt,
      coral-branch(color: pal.coral.transparentize(50%), size-w: 120pt, size-h: 120pt),
    )

    // Jellyfish accent
    place(top + left, dx: 60pt, dy: 30pt,
      jellyfish(color: pal.cyan.transparentize(50%), size-w: 80pt, size-h: 100pt),
    )

    // Bubble cluster right side
    place(horizon + right, dx: -40pt, dy: -20pt,
      bubble-cluster(color: pal.cyan.transparentize(30%), size-w: 60pt, size-h: 90pt),
    )

    // Frame border
    place(center + horizon,
      rect(width: 96%, height: 94%, stroke: 0.5pt + pal.ocean-dim, fill: none, radius: 2pt)
    )

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2pt,
          fill: pal.cyan,
          font: _mono-font,
          upper(info.institution),
        )
        v(1.2em)
      }
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.6em)
      // Coral reef divider
      #block(width: 200pt, height: 12pt)[
        #place(left + horizon, line(length: 80pt, stroke: 0.5pt + pal.coral))
        #place(center + horizon, circle(radius: 3pt, fill: pal.coral))
        #place(right + horizon, line(length: 80pt, stroke: 0.5pt + pal.coral))
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
          text(fill: pal.cyan, size: 6pt)[#sym.circle.filled]
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

/// new-section-slide -- Ocean-themed section transition
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Wave pattern background
    place(top + left, dy: 20pt,
      box(width: 100%, height: 60pt,
        wave-pattern(color: pal.ocean-blue.transparentize(50%), width: 100%, height: 60pt),
      ),
    )

    // Bubble cluster decoration
    place(top + right, dx: -60pt, dy: 30pt,
      bubble-cluster(color: pal.cyan.transparentize(40%), size-w: 60pt, size-h: 100pt),
    )

    // Section number with bioluminescent glow
    place(top + right, dx: -80pt, dy: 50pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 100pt, height: 100pt)[
          #place(center + horizon, circle(radius: 35pt, fill: pal.cyan.transparentize(90%)))
          #place(center + horizon, circle(radius: 25pt, fill: pal.cyan.transparentize(85%)))
          #place(center + horizon, text(fill: pal.cyan, size: 42pt, weight: "bold", num-str))
        ]
      },
    )

    // Depth marker (decorative)
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font)[DEPTH: 200m | ZONE: MESOPELAGIC],
    )

    // Top accent line
    place(top + left, dx: 3em, dy: 3em,
      line(length: 80pt, stroke: 1.5pt + pal.coral))

    // Content
    pad(left: 4em, right: 8em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.cyan,
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
      #block(width: 60pt, height: 2pt, fill: pal.coral)
      #v(3fr)
    ]

    // Bottom accent line
    place(bottom + right, dx: -3em, dy: -2em,
      line(length: 80pt, stroke: 1pt + pal.ocean-blue))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[CORAL REEF],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Width-constrained focus statement, bioluminescent accents
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
    // Scattered bioluminescent dots
    place(top + left, dx: 25pt, dy: 25pt, biolumi-dot(color: pal.cyan, size: 3pt))
    place(top + left, dx: 70pt, dy: 45pt, biolumi-dot(color: pal.cyan.transparentize(30%), size: 2pt))
    place(top + right, dx: -35pt, dy: 30pt, biolumi-dot(color: pal.coral-dim, size: 3pt))
    place(top + right, dx: -80pt, dy: 55pt, biolumi-dot(color: pal.cyan.transparentize(40%), size: 2pt))
    place(bottom + left, dx: 45pt, dy: -35pt, biolumi-dot(color: pal.cyan, size: 2.5pt))
    place(bottom + right, dx: -55pt, dy: -40pt, biolumi-dot(color: pal.coral-dim, size: 3pt))
    place(bottom + right, dx: -100pt, dy: -25pt, biolumi-dot(color: pal.cyan.transparentize(30%), size: 2pt))

    // Corner coral accents
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 40pt, stroke: 0.8pt + pal.coral))
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 30pt, angle: 90deg, stroke: 0.8pt + pal.coral))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 40pt, angle: 180deg, stroke: 0.8pt + pal.coral))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 30pt, angle: -90deg, stroke: 0.8pt + pal.coral))

    set text(fill: pal.ink, size: 1.4em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    pad(x: 3em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Farewell slide with coral and jellyfish decorations
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Background wave pattern
    place(bottom + left, dy: -20pt,
      box(width: 100%, height: 60pt,
        wave-pattern(color: pal.ocean-blue.transparentize(50%), width: 100%, height: 60pt),
      ),
    )

    // Coral branch decorations
    place(bottom + left, dx: 30pt, dy: -10pt,
      coral-branch(color: pal.coral.transparentize(60%), size-w: 140pt, size-h: 140pt),
    )
    place(bottom + right, dx: -30pt, dy: -10pt,
      coral-branch(color: pal.coral.transparentize(70%), size-w: 120pt, size-h: 120pt),
    )

    // Jellyfish floating
    place(top + left, dx: 80pt, dy: 40pt,
      jellyfish(color: pal.cyan.transparentize(60%), size-w: 70pt, size-h: 90pt),
    )
    place(top + right, dx: -100pt, dy: 50pt,
      jellyfish(color: pal.cyan.transparentize(70%), size-w: 55pt, size-h: 70pt),
    )

    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost)[DEEP BLUE],
    )

    // Frame border
    place(center + horizon,
      rect(width: 96%, height: 94%, stroke: 0.5pt + pal.ocean-dim, fill: none, radius: 2pt)
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Bioluminescent ornament
      #std.align(center, biolumi-dot(color: pal.cyan, size: 8pt))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.8em)
      // Reef divider
      #std.align(center, block(width: 160pt, height: 12pt)[
        #place(left + horizon, line(length: 60pt, stroke: 0.5pt + pal.coral))
        #place(center + horizon, circle(radius: 2.5pt, fill: pal.coral))
        #place(right + horizon, line(length: 60pt, stroke: 0.5pt + pal.coral))
      ])
      #v(1em)
      #text(size: 10pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[PROTECT OUR OCEANS]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let coral-reef-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "deep",
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
