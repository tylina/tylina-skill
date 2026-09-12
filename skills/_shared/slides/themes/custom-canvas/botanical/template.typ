// Botanical Theme -- Victorian botanical illustration meets modern presentation
// Lush forest greens, cream parchment paper, antique gold/copper accents
// Canvas-level: heavy use of place() for decorative organic elements
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  forest:   (ink: rgb("#1B3A2D"), paper: rgb("#FDF8F0"), accent: rgb("#8B6914")),
  autumn:   (ink: rgb("#4A1C2B"), paper: rgb("#FDF5E6"), accent: rgb("#B8860B")),
  tropical: (ink: rgb("#1A4F4F"), paper: rgb("#F0FFF0"), accent: rgb("#CD853F")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let ink = p.ink
  let paper = p.paper
  let accent = p.accent
  (
    ink: ink,
    paper: paper,
    accent: accent,
    // Derived from ink
    // Text-bearing derived colors keep WCAG-readable contrast on paper.
    ink-light: ink.transparentize(20%),
    ink-faint: ink.transparentize(80%),
    ink-ghost: ink.transparentize(94%),
    ink-muted: ink.transparentize(30%),
    // Derived from accent
    accent-light: accent.transparentize(40%),
    accent-faint: accent.transparentize(80%),
    accent-text: accent.darken(25%),
    rule-color: accent.transparentize(30%),
    // Meta
    meta-color: ink.transparentize(30%),
  )
}

// Default palette
#let palette = build-palette("forest")

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
// Mono font constant (used in metadata/labels)
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _sans-font = ("IBM Plex Sans", "Noto Sans SC")

// =====================================================================
// Botanical Illustration Motif
// =====================================================================

#let _botanical-sprig-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 220 320">
  <g opacity="OPACITY">
    <path d="M112 309 C110 265 119 225 111 184 C103 143 92 105 103 66 C108 47 119 29 132 12" fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="round"/>
    <path d="M112 268 C84 261 58 242 47 216 C77 214 103 229 114 254 Z" fill="currentColor"/>
    <path d="M114 241 C140 230 160 209 166 183 C137 188 119 204 112 226 Z" fill="currentColor" opacity="0.86"/>
    <path d="M108 207 C78 200 55 181 47 154 C76 154 101 169 111 192 Z" fill="currentColor" opacity="0.92"/>
    <path d="M105 174 C131 163 150 141 155 116 C128 121 110 138 104 158 Z" fill="currentColor" opacity="0.78"/>
    <path d="M101 141 C76 131 59 113 54 90 C78 94 96 108 104 127 Z" fill="currentColor" opacity="0.84"/>
    <path d="M102 107 C124 96 139 78 142 56 C120 61 106 75 100 92 Z" fill="currentColor" opacity="0.72"/>
    <path d="M111 70 C94 58 85 42 86 24 C103 31 114 43 117 57 Z" fill="currentColor" opacity="0.76"/>
    <path d="M111 253 C91 245 72 232 58 219" fill="none" stroke="currentColor" stroke-width="1.6" opacity="0.6"/>
    <path d="M114 226 C132 215 148 201 159 187" fill="none" stroke="currentColor" stroke-width="1.6" opacity="0.55"/>
    <path d="M109 191 C87 181 68 169 53 156" fill="none" stroke="currentColor" stroke-width="1.6" opacity="0.55"/>
    <path d="M104 158 C122 147 138 133 150 119" fill="none" stroke="currentColor" stroke-width="1.6" opacity="0.5"/>
    <circle cx="132" cy="12" r="5" fill="currentColor"/>
    <circle cx="142" cy="56" r="3.5" fill="currentColor" opacity="0.7"/>
    <circle cx="86" cy="24" r="3" fill="currentColor" opacity="0.55"/>
  </g>
</svg>```.text

#let _botanical-sprig(width: 120pt, color: palette.ink, opacity: 0.12) = {
  image(
    bytes(
      _botanical-sprig-svg
        .replace("currentColor", color.to-hex())
        .replace("OPACITY", str(opacity)),
    ),
    width: width,
  )
}

// =====================================================================
// 1. Reusable Components
// =====================================================================

/// gold-rule -- Decorative horizontal rule in accent/gold color
#let gold-rule(width: 60pt, height: 2pt) = {
  block(width: width, height: height, fill: palette.accent)
}

/// vine-divider -- Decorative curving line separator
#let vine-divider(total-width: 200pt) = {
  block(width: total-width, height: 12pt)[
    #place(left + horizon, line(length: 38%, stroke: 0.8pt + palette.accent))
    #place(center + horizon,
      rotate(90deg, _botanical-sprig(width: 10pt, color: palette.accent, opacity: 0.95)),
    )
    #place(right + horizon, line(length: 38%, stroke: 0.8pt + palette.accent))
  ]
}

/// seed-tag -- Organic rounded tag/badge
#let seed-tag(body) = {
  box(
    fill: palette.accent-faint,
    inset: (x: 8pt, y: 3pt),
    radius: 10pt,
  )[
    #text(size: typo.small, fill: palette.ink, weight: "medium", body)
  ]
}

/// herbarium-quote -- Elegant italic quote with botanical ornament
#let herbarium-quote(body, cite: none) = {
  block(
    width: 100%,
    fill: palette.paper,
    stroke: (left: 2.5pt + palette.accent),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(
      spacing: .8em,
      text(size: typo.body, style: "italic", fill: palette.ink)[
        #text(size: 18pt, fill: palette.accent-light)[#sym.diamond.filled]
        #h(0.3em)
        #body
      ],
      if cite != none {
        text(
          size: typo.tiny,
          style: "normal",
          weight: "medium",
          tracking: 1.2pt,
          fill: palette.ink-muted,
          font: _mono-font,
          [-- #upper(cite)],
        )
      } else { none },
    )
  ]
}

/// leaf-card -- Card with organic top border curve in green
#let leaf-card(title, body) = {
  block(
    width: 100%,
    fill: palette.paper,
    stroke: (top: 3pt + palette.ink, rest: 0.5pt + palette.ink-faint),
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
    radius: (top: 0pt, bottom: 0pt),
  )[
    #place(top + right, dx: -0.35em, dy: 0.05em,
      rotate(18deg, _botanical-sprig(width: 20pt, color: palette.ink, opacity: 0.08)))
    #stack(
      spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 13pt, fill: palette.ink-light, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// specimen-box -- Callout styled like a specimen label
#let specimen-box(label, title, body) = {
  block(
    width: 100%,
    fill: palette.paper,
    stroke: (
      left: 2.5pt + palette.ink,
      right: 0.5pt + palette.ink-faint,
      top: 0.5pt + palette.ink-faint,
      bottom: 2.5pt + palette.ink,
    ),
    inset: (x: 1em, y: 0.8em),
  )[
    #place(top + right, dx: -0.35em, dy: 0.15em,
      rotate(14deg, _botanical-sprig(width: 20pt, color: palette.ink, opacity: 0.07)))
    #stack(
      spacing: .8em,
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: palette.accent-text,
        font: _mono-font,
        upper(label),
      ),
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 13pt, fill: palette.ink-light, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// root-stat -- KPI with organic decoration
#let root-stat(label, value, description: none) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #stack(
      spacing: .8em,
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.accent-text,
        font: _mono-font,
        upper(label),
      ),
      text(size: 44pt, weight: "bold", fill: palette.ink, value),
      block(width: 30pt, height: 2pt, fill: palette.accent),
      [
        #if description != none {
          text(
            size: 13pt,
            weight: "regular",
            fill: palette.ink-light,
            font: _sans-font,
            description,
          )
        }
        #lazy-v(1fr)
      ],
    )
  ]
}

/// plate-frame -- Image frame with decorative border like botanical plates
#let plate-frame(path, caption: none, height: 200pt) = {
  block(width: 100%)[
    #stack(
      spacing: .8em,
      block(
        width: 100%,
        height: height,
        clip: true,
        stroke: (
          paint: palette.ink,
          thickness: 1.5pt,
        ),
        inset: 3pt,
      )[
        #block(
          width: 100%,
          height: 100%,
          clip: true,
          stroke: 0.5pt + palette.ink-faint,
        )[
          #image(path, width: 100%, height: 100%, fit: "cover")
        ]
      ],
      if caption != none { align(center,
        text(
          size: typo.small,
          style: "italic",
          fill: palette.ink-light,
          caption,
        ),
      ) } else { none },
    )
  ]
}

// =====================================================================
// 2. Internal Decorative Helpers
// =====================================================================

/// _corner-ornament -- Small L-shaped corner decoration
#let _corner-ornament(pal, rotation: 0deg) = {
  let color = pal.accent
  block(width: 20pt, height: 20pt)[
    #place(top + left, line(length: 20pt, stroke: 1pt + color))
    #place(top + left, line(length: 20pt, angle: 90deg, stroke: 1pt + color))
  ]
}

/// _light-header -- Standard header for light slides
#let _light-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
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

/// _light-footer -- Standard footer for light slides
#let _light-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: typo.meta)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: typo.meta, tracking: 0.5pt)
      upper[BOTANICAL]
    },
    text(fill: pal.accent, size: 8pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: typo.meta)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Inverted header for dark slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: typo.meta, fill: pal.paper.transparentize(30%), font: _mono-font)
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

/// _dark-footer -- Inverted footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.paper.transparentize(30%), size: typo.meta)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: typo.meta, tracking: 0.5pt)
      upper[BOTANICAL]
    },
    text(fill: pal.accent-light, size: 8pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: typo.meta)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Light content slide with subtle corner decorations
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _light-header(self)
  let footer(self) = _light-footer(self)
  let setting(body) = {
    let pal = self.store.palette
    // Persistent pressed-sprig atmosphere plus restrained corner marks.
    place(bottom + right, dx: 0.2em, dy: -0.45em,
      rotate(-11deg, _botanical-sprig(width: 70pt, color: pal.ink, opacity: 0.055)))
    place(top + right, dx: -1.5em, dy: 0.4em,
      block(width: 16pt, height: 16pt)[
        #place(top + right, line(length: 16pt, stroke: 0.6pt + pal.accent-light))
        #place(top + right, line(length: 16pt, angle: 90deg, stroke: 0.6pt + pal.accent-light))
      ],
    )
    place(bottom + left, dx: 1.5em, dy: -0.8em,
      block(width: 16pt, height: 16pt)[
        #place(bottom + left, line(length: 16pt, stroke: 0.6pt + pal.accent-light))
        #place(bottom + left, line(length: 16pt, angle: -90deg, stroke: 0.6pt + pal.accent-light))
      ],
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

/// dark-slide -- Deep forest green background, cream text, ghost leaf decoration
#let dark-slide(
  title: auto,
  align: auto,
  ghost: none,
  ghost-dx: -20pt,
  ghost-dy: -40pt,
  ghost-size: 180pt,
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
    // Ghost numeral (when supplied) and a botanical silhouette on every dark page.
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: "bold", fill: pal.paper.transparentize(94%), ghost),
      )
    } else {
      place(top + right, dx: -8pt, dy: 55pt,
        rotate(12deg, _botanical-sprig(width: 95pt, color: pal.paper, opacity: 0.08)),
      )
    }
    place(bottom + right, dx: -0.3em, dy: -0.55em,
      rotate(-15deg, _botanical-sprig(width: 78pt, color: pal.paper, opacity: 0.06)))
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
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Elegant composition with decorative border frame
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Base background
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))

    // Percentage-centered frame remains correct for both 16:9 and 4:3.
    place(center + horizon,
      rect(width: 94%, height: 90%, fill: none, stroke: 1.2pt + pal.accent))
    place(center + horizon,
      rect(width: 92.5%, height: 87.5%, fill: none, stroke: 0.35pt + pal.accent-light))

    // Corner ornaments (L-shapes at corners)
    place(top + left, dx: 16pt, dy: 16pt,
      block(width: 18pt, height: 18pt)[
        #place(top + left, line(length: 18pt, stroke: 2pt + pal.accent))
        #place(top + left, line(length: 18pt, angle: 90deg, stroke: 2pt + pal.accent))
      ])
    place(top + right, dx: -16pt, dy: 16pt,
      block(width: 18pt, height: 18pt)[
        #place(top + right, line(length: 18pt, stroke: 2pt + pal.accent))
        #place(top + right, line(length: 18pt, angle: -90deg, stroke: 2pt + pal.accent))
      ])
    place(bottom + left, dx: 16pt, dy: -16pt,
      block(width: 18pt, height: 18pt)[
        #place(bottom + left, line(length: 18pt, stroke: 2pt + pal.accent))
        #place(bottom + left, line(length: 18pt, angle: -90deg, stroke: 2pt + pal.accent))
      ])
    place(bottom + right, dx: -16pt, dy: -16pt,
      block(width: 18pt, height: 18pt)[
        #place(bottom + right, line(length: 18pt, stroke: 2pt + pal.accent))
        #place(bottom + right, line(length: 18pt, angle: 90deg, stroke: 2pt + pal.accent))
      ])

    // Pressed botanical silhouettes establish the theme's visual signature.
    place(top + right, dx: -26pt, dy: 40pt,
      rotate(14deg, _botanical-sprig(width: 138pt, color: pal.ink, opacity: 0.11)))
    place(bottom + left, dx: 44pt, dy: -28pt,
      rotate(-22deg, _botanical-sprig(width: 92pt, color: pal.accent, opacity: 0.10)))

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
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.6em)
      // Ornamental divider
      #block(width: 200pt, height: 12pt)[
        #place(left + horizon, line(length: 80pt, stroke: 0.8pt + pal.accent))
        #place(center + horizon, text(fill: pal.accent, size: 10pt)[#sym.diamond.filled])
        #place(right + horizon, line(length: 80pt, stroke: 0.8pt + pal.accent))
      ]
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", style: "italic", fill: pal.ink-light, info.subtitle)
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
          text(fill: pal.accent)[#sym.diamond.filled]
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

/// new-section-slide -- Section divider with ghost number and organic accent
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))

    // Large ghost section number
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink-ghost, size: 160pt, weight: "bold", style: "italic", num-str)
      },
    )

    place(bottom + right, dx: -4.8em, dy: -1.3em,
      rotate(-16deg, _botanical-sprig(width: 155pt, color: pal.ink, opacity: 0.075)))

    // Top golden accent line
    place(top + left, dx: 4em, dy: 2em,
      line(length: 80pt, stroke: 1.5pt + pal.accent))

    // Content
    pad(left: 4em, right: 6em, top: 4em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.accent-text,
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
      #block(width: 60pt, height: 2.5pt, fill: pal.accent)
      #v(3fr)
    ]

    // Bottom accent line
    place(bottom + right, dx: -4em, dy: -2em,
      line(length: 80pt, stroke: 1.5pt + pal.accent))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: typo.meta, font: _mono-font)[BOTANICAL],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Forest green background, cream text, decorative frame
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Decorative frame border (golden)
    place(top + left, dx: -1.5em, dy: -1.5em,
      line(length: 100pt, stroke: 1pt + pal.accent))
    place(top + left, dx: -1.5em, dy: -1.5em,
      line(length: 60pt, angle: 90deg, stroke: 1pt + pal.accent))
    place(bottom + right, dx: 1.5em, dy: 1.5em,
      line(length: 100pt, angle: 180deg, stroke: 1pt + pal.accent))
    place(bottom + right, dx: 1.5em, dy: 1.5em,
      line(length: 60pt, angle: -90deg, stroke: 1pt + pal.accent))

    // Corner dots
    place(top + left, dx: -1.5em, dy: -1.5em,
      circle(radius: 2.5pt, fill: pal.accent))
    place(bottom + right, dx: 1.5em, dy: 1.5em,
      circle(radius: 2.5pt, fill: pal.accent))

    // Large pressed sprig gives the focus page a distinct botanical silhouette.
    place(center + horizon, dx: 285pt, dy: 85pt,
      rotate(18deg, _botanical-sprig(width: 135pt, color: pal.paper, opacity: 0.08)))

    set text(fill: pal.paper, size: 1.5em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    block(width: 84%, inset: (x: 0.5em))[#body]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Elegant centered design with ornamental flourish
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))

    // Ghost text
    place(center + horizon,
      text(size: 160pt, weight: "bold", fill: pal.ink-ghost)[FIN],
    )

    // Match the opening frame to close the visual bookend.
    place(center + horizon,
      rect(width: 94%, height: 90%, fill: none, stroke: 1.2pt + pal.accent))
    place(center + horizon,
      rect(width: 92.5%, height: 87.5%, fill: none, stroke: 0.35pt + pal.accent-light))
    place(top + right, dx: -26pt, dy: 34pt,
      rotate(14deg, _botanical-sprig(width: 128pt, color: pal.ink, opacity: 0.10)))
    place(bottom + left, dx: 44pt, dy: -24pt,
      rotate(-22deg, _botanical-sprig(width: 86pt, color: pal.accent, opacity: 0.10)))

    // Corner ornaments
    place(top + left, dx: 2.5em, dy: 1.5em,
      block(width: 14pt, height: 14pt)[
        #place(top + left, line(length: 14pt, stroke: 1.5pt + pal.accent))
        #place(top + left, line(length: 14pt, angle: 90deg, stroke: 1.5pt + pal.accent))
      ])
    place(top + right, dx: -2.5em, dy: 1.5em,
      block(width: 14pt, height: 14pt)[
        #place(top + right, line(length: 14pt, stroke: 1.5pt + pal.accent))
        #place(top + right, line(length: 14pt, angle: -90deg, stroke: 1.5pt + pal.accent))
      ])
    place(bottom + left, dx: 2.5em, dy: -1.5em,
      block(width: 14pt, height: 14pt)[
        #place(bottom + left, line(length: 14pt, stroke: 1.5pt + pal.accent))
        #place(bottom + left, line(length: 14pt, angle: -90deg, stroke: 1.5pt + pal.accent))
      ])
    place(bottom + right, dx: -2.5em, dy: -1.5em,
      block(width: 14pt, height: 14pt)[
        #place(bottom + right, line(length: 14pt, stroke: 1.5pt + pal.accent))
        #place(bottom + right, line(length: 14pt, angle: 90deg, stroke: 1.5pt + pal.accent))
      ])

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Top ornamental divider
      #std.align(center, block(width: 160pt, height: 12pt)[
        #place(left + horizon, line(length: 60pt, stroke: 0.8pt + pal.accent))
        #place(center + horizon, text(fill: pal.accent, size: 10pt)[#sym.diamond.filled])
        #place(right + horizon, line(length: 60pt, stroke: 0.8pt + pal.accent))
      ])
      #v(1.2em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(1em)
      // Bottom ornamental divider
      #std.align(center, block(width: 120pt, height: 12pt)[
        #place(left + horizon, line(length: 45pt, stroke: 0.8pt + pal.accent))
        #place(center + horizon, text(fill: pal.accent, size: 8pt)[#sym.diamond.filled])
        #place(right + horizon, line(length: 45pt, stroke: 0.8pt + pal.accent))
      ])
      #v(1.5em)
      #text(size: 8pt, fill: pal.meta-color, font: _mono-font, tracking: 1pt)[BOTANICAL]
    ]
  }
  touying-slide(self: self, main-body)
})

/// hero-slide -- Full-bleed image with scrim + floating text box
#let hero-slide(background-image: none, scrim: true, ..args) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(self, config-page(
    header: none, footer: none, margin: 0pt,
  ))
  let main-body = {
    if background-image != none {
      place(top + left,
        block(width: 100%, height: 100%, clip: true)[
          #image(background-image, width: 100%, height: 100%, fit: "cover")
        ],
      )
    }
    if scrim {
      place(bottom + left, block(width: 100%, height: 60%,
        fill: gradient.linear(
          pal.ink.transparentize(100%),
          pal.ink.transparentize(40%),
          pal.ink.transparentize(10%),
          angle: 180deg,
        ),
      ))
    }
    args.pos().map(a => a).join()
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let botanical-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "forest",
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
      fill: pal.paper,
      margin: (top: 4.5em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.ink,
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
