// Vaporwave Theme — Retro-futuristic Canvas Theme
// Gradient pinks and purples, cyan highlights, sunset orange.
// Grid-line patterns. 80s/90s nostalgia meets digital future.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  sunset: (ink: rgb("#1A0A2E"), paper: rgb("#FFF0F5")),
  ocean:  (ink: rgb("#0A1628"), paper: rgb("#E0F7FA")),
  neon:   (ink: rgb("#0D0D0D"), paper: rgb("#FFB6C1")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let ink = p.ink
  let paper = p.paper
  let pink = rgb("#FF6B9D")
  let purple = rgb("#C084FC")
  let cyan = rgb("#06B6D4")
  let orange = rgb("#FF8C42")
  // Contrast-safe accent variants for small text on every preset's paper color.
  let pink-text = rgb("#981344")
  let purple-text = rgb("#76259C")
  let cyan-text = rgb("#005B6D")
  let orange-text = rgb("#7A3B00")
  (
    ink: ink,
    paper: paper,
    pink: pink,
    purple: purple,
    cyan: cyan,
    orange: orange,
    pink-text: pink-text,
    purple-text: purple-text,
    cyan-text: cyan-text,
    orange-text: orange-text,
    pink-light: pink.transparentize(40%),
    pink-faint: pink.transparentize(75%),
    pink-ghost: pink.transparentize(90%),
    purple-light: purple.transparentize(40%),
    purple-faint: purple.transparentize(75%),
    purple-ghost: purple.transparentize(90%),
    cyan-light: cyan.transparentize(40%),
    cyan-faint: cyan.transparentize(75%),
    orange-light: orange.transparentize(40%),
    ink-muted: ink.transparentize(30%),
    ink-ghost: ink.transparentize(90%),
    paper-muted: paper.transparentize(35%),
    paper-faint: paper.transparentize(75%),
    grid-color: pink.transparentize(85%),
    grid-strong: pink.transparentize(70%),
    surface: ink.transparentize(92%),
  )
}

#let palette = build-palette("sunset")


// =====================================================================
// Reusable Components
// =====================================================================

/// grid-pattern -- Decorative background grid made with placed lines
#let grid-pattern(rows: 10, opacity: 85%, pal: palette) = {
  for i in range(rows) {
    let y-frac = (i + 1) * (100% / (rows + 1))
    place(top + left, dy: y-frac,
      line(length: 100%, stroke: 0.5pt + pal.pink.transparentize(opacity)),
    )
  }
  for i in range(5) {
    let x-frac = (i + 1) * (100% / 6)
    place(top + left, dx: x-frac,
      block(width: 0.3pt, height: 100%, fill: pal.pink.transparentize(opacity))
    )
  }
}

/// glitch-text -- Text placed multiple times with chromatic aberration
#let glitch-text(
  body,
  size: 44pt,
  weight: "black",
  pink-offset: -2pt,
  cyan-offset: 2pt,
  pal: palette,
) = {
  block(width: auto)[
    #place(left, dx: pink-offset, dy: -1pt,
      text(size: size, weight: weight, fill: pal.pink.transparentize(60%), body),
    )
    #place(left, dx: cyan-offset, dy: 1pt,
      text(size: size, weight: weight, fill: pal.cyan.transparentize(60%), body),
    )
    #text(size: size, weight: weight, fill: pal.paper, body)
  ]
}

/// retro-card -- Card with gradient border using stroke
#let retro-card(title, body, accent: none, pal: palette) = {
  let accent = if accent == none { pal.pink } else { accent }
  block(
    width: 100%,
    fill: pal.ink.transparentize(20%),
    stroke: 1.5pt + accent,
    inset: (x: 14pt, y: 12pt),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      text(size: 14pt, weight: "bold", fill: accent, title),
      [
        #set text(size: 12pt, fill: pal.paper)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// glitch-stat -- Big number with color-offset shadow effect
#let glitch-stat(value, label, accent: none, pal: palette) = {
  let accent = if accent == none { pal.pink } else { accent }
  block(width: 100%)[
    #stack(spacing: .8em,
      block(width: auto)[
        #place(left, dx: -2pt, dy: -1pt,
          text(size: 48pt, weight: "black", fill: pal.pink.transparentize(50%), value),
        )
        #place(left, dx: 2pt, dy: 1pt,
          text(size: 48pt, weight: "black", fill: pal.cyan.transparentize(50%), value),
        )
        #text(size: 48pt, weight: "black", fill: pal.paper, value)
      ],
      [
        #text(
          size: 9pt,
          weight: "bold",
          tracking: 1.5pt,
          fill: pal.paper-muted,
          upper(label),
        )
        #lazy-v(1fr)
      ],
    )
  ]
}

/// wave-box -- Callout with pink/purple gradient left border
#let wave-box(title, body, pal: palette) = {
  block(
    width: 100%,
    fill: pal.ink.transparentize(15%),
    stroke: (left: 3pt + pal.pink),
    inset: (x: 14pt, y: 10pt),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(size: 13pt, weight: "bold", fill: pal.pink, title),
      [
        #set text(size: 11pt, fill: pal.paper)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// sunset-divider -- Gradient line from pink to purple to orange
#let sunset-divider(width: 100%, pal: palette) = {
  block(width: width, height: 2pt)[
    #place(left,
      block(
        width: 100%,
        height: 100%,
        fill: gradient.linear(pal.pink, pal.purple, pal.orange, angle: 0deg),
      ),
    )
  ]
}

/// pixel-tag -- Tag with gradient background
#let pixel-tag(body, color: none, pal: palette) = {
  let color = if color == none { pal.pink } else { color }
  box(
    fill: color,
    inset: (x: 8pt, y: 3pt),
    radius: 2pt,
    text(
      size: 8pt,
      weight: "bold",
      fill: pal.ink,
      tracking: 0.5pt,
      upper(body),
    ),
  )
}

/// vapor-quote -- Quote with aesthetic spacing and cyan attribution
#let vapor-quote(body, attribution: none, pal: palette) = {
  block(
    width: 100%,
    stroke: (left: 2pt + pal.purple),
    inset: (left: 16pt, y: 8pt),
  )[
    #text(size: 14pt, style: "italic", tracking: 0.5pt, body)
    #if attribution != none {
      v(6pt)
      text(size: 10pt, fill: pal.cyan-text, weight: "bold", tracking: 1pt, attribution)
    }
  ]
}

/// neon-badge -- Small badge label
#let neon-badge(body, color: none, pal: palette) = {
  let color = if color == none { pal.cyan-text } else { color }
  box(
    stroke: 1pt + color,
    inset: (x: 6pt, y: 2pt),
    radius: 2pt,
    text(size: 8pt, weight: "bold", fill: color, tracking: 1pt, upper(body)),
  )
}

/// vapor-progress -- Progress bar with gradient fill
#let vapor-progress(ratio, width: 100%, height: 6pt, pal: palette) = {
  let pct = calc.min(calc.max(ratio, 0.0), 1.0)
  block(width: width, height: height, fill: pal.ink.transparentize(50%), radius: 3pt)[
    #place(left,
      block(
        width: pct * 100%,
        height: 100%,
        fill: gradient.linear(pal.pink, pal.purple, pal.cyan, angle: 0deg),
        radius: 3pt,
      ),
    )
  ]
}

/// vapor-meter -- Compact labeled metric for dark data slides
#let vapor-meter(label, ratio, caption, pal: palette) = {
  stack(
    spacing: .8em,
    text(size: 12pt, weight: "bold", fill: pal.paper, label),
    vapor-progress(ratio, pal: pal),
    text(size: 9pt, fill: pal.paper-muted, caption),
  )
}


// =====================================================================
// Internal Header/Footer Factories
// =====================================================================

#let _vapor-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.3em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 60pt, height: 3pt)[
      #place(left,
        block(width: 100%, height: 100%,
          fill: gradient.linear(pal.pink, pal.purple, angle: 0deg),
        ),
      )
    ],
  )
}

#let _vapor-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted)
      upper[VAPORWAVE]
    },
    {
      block(width: 6pt, height: 6pt, fill: gradient.linear(pal.pink, pal.purple, angle: 45deg), radius: 3pt)
    },
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.ink-muted)
      context { utils.slide-counter.display() }
    },
  )
}

#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.paper-muted)
      upper[VAPORWAVE]
    },
    {
      block(width: 6pt, height: 6pt, fill: gradient.linear(pal.pink, pal.cyan, angle: 45deg), radius: 3pt)
    },
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.paper-muted)
      context { utils.slide-counter.display() }
    },
  )
}


// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Standard light content slide
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header(self) = _vapor-header(self)
  let footer(self) = _vapor-footer(self)

  let setting(body) = {
    show: std.align.with(self.store.align)
    // Gradient bar at top
    place(top + left, dx: -2em, dy: -3.5em,
      block(width: 200%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, angle: 0deg),
          ),
        )
      ],
    )
    // Subtle grid decoration at bottom
    place(bottom + left, dx: -2em, dy: 1.5em,
      block(width: 200%, height: 80pt, clip: true)[
        #for i in range(6) {
          place(top + left, dy: i * 14pt,
            line(length: 200%, stroke: 0.3pt + pal.grid-color),
          )
        }
      ],
    )
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deep purple/black background with gradient wash
#let dark-slide(
  title: auto,
  align: auto,
  ghost: none,
  ghost-size: 180pt,
  ghost-dy: -30pt,
  ghost-dx: -20pt,
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

  let header(self) = {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em))
    set std.align(horizon + left)
    set text(size: 8pt, weight: "bold", fill: pal.paper-muted, tracking: 0.5pt)
    grid(
      columns: (1fr, 1fr),
      { if header-left != none { std.align(left, header-left) } },
      { if header-right != none { std.align(right, header-right) } },
    )
  }
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Gradient wash background decoration
    place(top + left, dx: -2.5em, dy: -3em,
      block(width: 200%, height: 100pt,
        fill: gradient.linear(
          pal.pink.transparentize(88%),
          pal.purple.transparentize(88%),
          angle: 0deg,
        ),
      ),
    )
    // Ghost grid lines at bottom
    place(bottom + left, dx: -2.5em, dy: 1.5em,
      block(width: 200%, height: 100pt, clip: true)[
        #for i in range(8) {
          place(top + left, dy: i * 12pt,
            line(length: 200%, stroke: 0.4pt + pal.pink.transparentize(85%)),
          )
        }
      ],
    )
    // Ghost text
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: "black", fill: pal.paper.transparentize(94%), ghost),
      )
    }
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
      margin: (top: 2.5em, bottom: 1.5em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Full gradient cover with glitch text
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Full gradient background
    place(top + left,
      block(width: 100%, height: 100%,
        fill: gradient.linear(
          pal.pink.transparentize(30%),
          pal.purple.transparentize(20%),
          pal.ink,
          angle: 180deg,
        ),
      ),
    )
    // Decorative grid lines
    place(top + left,
      block(width: 100%, height: 100%, clip: true)[
        #for i in range(12) {
          place(top + left, dy: 200pt + i * 12pt,
            line(length: 100%, stroke: 0.4pt + pal.pink.transparentize(82%)),
          )
        }
        #for i in range(7) {
          place(top + left, dx: (i + 1) * 12%,
            block(width: 0.3pt, height: 100%, fill: pal.purple.transparentize(85%))
          )
        }
      ],
    )
    // Content
    set std.align(left + horizon)
    pad(x: 3.5em, y: 3em)[
      // Title with glitch effect
      #block(width: auto)[
        #place(left, dx: -3pt, dy: -2pt,
          text(size: 2.4em, weight: "black", fill: pal.pink.transparentize(55%), info.title),
        )
        #place(left, dx: 3pt, dy: 2pt,
          text(size: 2.4em, weight: "black", fill: pal.cyan.transparentize(55%), info.title),
        )
        #text(size: 2.4em, weight: "black", fill: pal.paper, info.title)
      ]
      #v(0.6em)
      // Gradient accent rule
      #block(width: 100pt, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, pal.cyan, angle: 0deg),
          ),
        )
      ]
      #v(0.5em)
      // Subtitle in cyan
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", fill: pal.cyan, info.subtitle)
        v(0.8em)
      }
      // Author + date
      #{
        set text(size: 9pt, fill: pal.paper-muted, weight: "bold", tracking: 1pt)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1em)
          text(fill: pal.pink)[\/\/]
          h(1em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
    // Bottom gradient bar
    place(bottom + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, pal.cyan, angle: 0deg),
          ),
        )
      ],
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with dark gradient
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Dark gradient background
    place(top + left, block(width: 100%, height: 100%,
      fill: gradient.linear(pal.ink, pal.ink.lighten(8%), angle: 180deg),
    ))
    // Ghost section text
    place(top + right, dx: -30pt, dy: 20pt,
      context {
        text(fill: pal.paper.transparentize(94%), size: 140pt, weight: "black",
          utils.display-current-heading(level: 1, numbered: false))
      },
    )
    // Grid decoration at bottom
    place(bottom + left,
      block(width: 100%, height: 120pt, clip: true)[
        #for i in range(8) {
          place(top + left, dy: i * 14pt,
            line(length: 100%, stroke: 0.4pt + pal.pink.transparentize(82%)),
          )
        }
      ],
    )
    // Gradient bar top
    place(top + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, angle: 0deg),
          ),
        )
      ],
    )
    // Content
    pad(left: 4em, right: 6em, top: 4em, bottom: 2em)[
      #v(1fr)
      // Section kicker
      #text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.pink)[
        SECTION #context {
          utils.display-current-heading-number(level: 1, numbering: "01")
        }
      ]
      #v(0.6em)
      // Section title
      #{
        set text(fill: pal.paper, size: 2.2em, weight: "black")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      // Pink accent line
      #block(width: 80pt, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, angle: 0deg),
          ),
        )
      ]
      #v(3fr)
    ]
    // Bottom bar
    place(bottom + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.purple, pal.pink, angle: 0deg),
          ),
        )
      ],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Full gradient wash, centered text with glow
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
    // Gradient wash background
    place(top + left, dx: -3em, dy: -3em,
      block(width: 200%, height: 200%,
        fill: gradient.linear(
          pal.pink.transparentize(70%),
          pal.purple.transparentize(70%),
          pal.ink,
          angle: 135deg,
        ),
      ),
    )
    // Gradient bars
    place(top + left, dx: -3em, dy: -3em,
      block(width: 200%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, pal.cyan, angle: 0deg),
          ),
        )
      ],
    )
    place(bottom + left, dx: -3em, dy: 3em,
      block(width: 200%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.cyan, pal.purple, pal.pink, angle: 0deg),
          ),
        )
      ],
    )
    // Glow shadow text
    set text(fill: pal.paper, size: 1.8em, weight: "bold")
    set std.align(horizon + center)
    // Pink glow behind
    place(center + horizon, dx: 0pt, dy: 0pt,
      block(width: 80%)[
        #set std.align(center)
        #text(fill: pal.pink.transparentize(60%), body)
      ],
    )
    pad(x: 10%, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Sunset gradient closing
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Sunset gradient background
    place(top + left, block(width: 100%, height: 100%,
      fill: gradient.linear(
        pal.orange.transparentize(20%),
        pal.pink.transparentize(10%),
        pal.purple.transparentize(10%),
        pal.ink,
        angle: 180deg,
      ),
    ))
    // Grid lines at bottom
    place(bottom + left,
      block(width: 100%, height: 140pt, clip: true)[
        #for i in range(10) {
          place(top + left, dy: i * 12pt,
            line(length: 100%, stroke: 0.5pt + pal.pink.transparentize(70%)),
          )
        }
      ],
    )
    // Ghost END text
    place(center + horizon,
      text(size: 180pt, weight: "black", fill: pal.paper.transparentize(92%), [END]),
    )
    // Content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Gradient rule above
      #std.align(center,
        block(width: 80pt, height: 3pt)[
          #place(left,
            block(width: 100%, height: 100%,
              fill: gradient.linear(pal.pink, pal.purple, pal.cyan, angle: 0deg),
            ),
          )
        ],
      )
      #v(1em)
      #text(size: 2.2em, weight: "black", fill: pal.paper, body)
      #v(0.6em)
      // Small accent rule below
      #std.align(center,
        block(width: 40pt, height: 3pt,
          fill: gradient.linear(pal.pink, pal.cyan, angle: 0deg),
        ),
      )
      #v(1.5em)
      #text(size: 8pt, weight: "bold", tracking: 2pt, fill: pal.paper-muted)[A E S T H E T I C]
    ]
  }
  touying-slide(self: self, main-body)
})

/// hero-slide -- Full-bleed background with gradient overlay
#let hero-slide(background-image: none, scrim: true, ..args, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(self, config-page(
    header: none, footer: none, margin: 0pt,
  ))
  let main-body = {
    if background-image != none {
      place(top + left, image(background-image, width: 100%, height: 100%, fit: "cover"))
    }
    if scrim {
      place(bottom + left, block(width: 100%, height: 60%,
        fill: gradient.linear(
          pal.ink.transparentize(100%),
          pal.ink.transparentize(20%),
          angle: 180deg,
        ),
      ))
    }
    // Top gradient bar
    place(top + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, pal.cyan, angle: 0deg),
          ),
        )
      ],
    )
    body
  }
  touying-slide(self: self, main-body, ..args)
})

/// grid-slide -- Dark bg with prominent grid-line pattern
#let grid-slide(
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

  let header(self) = {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em))
    set std.align(horizon + left)
    set text(size: 8pt, weight: "bold", fill: pal.paper-muted, tracking: 0.5pt)
    grid(
      columns: (1fr, 1fr),
      { if header-left != none { std.align(left, header-left) } },
      { if header-right != none { std.align(right, header-right) } },
    )
  }
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Prominent grid pattern - horizontal lines with perspective
    place(top + left, dx: -2.5em, dy: -3em,
      block(width: 200%, height: 100%, clip: true)[
        #for i in range(14) {
          place(top + left, dy: 160pt + i * 16pt,
            line(length: 200%, stroke: 0.5pt + pal.pink.transparentize(72%)),
          )
        }
        #for i in range(9) {
          place(top + left, dx: (i + 1) * 10%,
            block(width: 0.4pt, height: 100%, fill: pal.purple.transparentize(80%))
          )
        }
      ],
    )
    // Title
    if self.store.title != none and self.store.title != auto {
      text(size: 24pt, weight: "bold", fill: pal.paper,
        utils.call-or-display(self, self.store.title))
      v(0.3em)
      block(width: 80pt, height: 2pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.pink, pal.purple, pal.orange, angle: 0deg),
          ),
        )
      ]
      v(0.4em)
    }
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
      margin: (top: 2.5em, bottom: 1.5em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})


// =====================================================================
// Theme Entry Point
// =====================================================================

#let vaporwave-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "sunset",
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
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.pink,
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
