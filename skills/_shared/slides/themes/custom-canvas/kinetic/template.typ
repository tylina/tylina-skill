// Kinetic Theme -- Motion Graphics / Kinetic Typography Touying presentation theme
// Dynamic, energetic, motion-inspired. Diagonal lines, bold angles, overlapping elements.
// Speed-inspired layouts. Think motion graphics title cards and kinetic typography.
// 3 presets: neon, sunset, arctic
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================
// Each preset: bg, ink, accent, secondary. Four-color system.

#let presets = (
  neon:    (bg: rgb("#0D0D0D"), ink: rgb("#FFFFFF"), accent: rgb("#FF3366"), secondary: rgb("#00FF88")),
  sunset:  (bg: rgb("#1A0A2E"), ink: rgb("#F8F0E3"), accent: rgb("#FF6B35"), secondary: rgb("#FFD23F")),
  arctic:  (bg: rgb("#F0F4F8"), ink: rgb("#0D1B2A"), accent: rgb("#00B4D8"), secondary: rgb("#90E0EF")),
)


// =====================================================================
// Palette Builder
// =====================================================================
// Derives full palette from preset name.
// Exposed so users can do: #let pal = build-palette("neon")

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
    // Derived tones
    ink-light: ink.transparentize(25%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(90%),
    // Accent variants
    accent-light: accent.transparentize(40%),
    accent-faint: accent.transparentize(75%),
    accent-ghost: accent.transparentize(90%),
    // Secondary variants
    secondary-light: secondary.transparentize(40%),
    secondary-faint: secondary.transparentize(75%),
    // Surface
    surface: ink.transparentize(92%),
    divider: ink.transparentize(70%),
    // For dark presets where bg is dark and ink is light, these are the same.
    // For arctic (light bg), these invert.
    overlay: bg.transparentize(40%),
  )
}

// Default palette (neon)
#let palette = build-palette("neon")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 52pt,
  h1: 34pt,
  h2: 22pt,
  body: 16pt,
  kicker-size: 9pt,
  meta-size: 8pt,
  counter-size: 48pt,
  frame-size: 60pt,
)


// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _sans-font = ("IBM Plex Sans", "Noto Sans SC")


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// velocity-kicker -- Kicker with accent background stripe
#let velocity-kicker(body) = {
  box(
    inset: (x: 0.4em, y: 0.15em),
    fill: palette.accent.transparentize(85%),
    stroke: (left: 2pt + palette.accent),
  )[
    #text(
      size: typo.kicker-size,
      weight: "bold",
      tracking: 2pt,
      fill: palette.accent,
      font: _mono-font,
      upper(body),
    )
  ]
}

/// speed-line -- Decorative horizontal speed line with tapered end
#let speed-line(length: 120pt, thickness: 2.5pt, color: palette.accent) = {
  block(width: length, height: thickness)[
    #place(left,
      block(
        width: 100%,
        height: 100%,
        fill: gradient.linear(
          color.transparentize(80%),
          color,
          color,
          angle: 0deg,
        ),
      ),
    )
  ]
}

/// angle-card -- Card with a flush accent top rail
#let angle-card(title, body, angle-height: 4pt) = {
  block(width: 100%, clip: true)[
    #stack(
      spacing: 0pt,
      block(width: 100%, height: angle-height, fill: palette.accent),
      block(
        width: 100%,
        fill: palette.surface,
        inset: (x: 0.8em, y: 0.6em),
      )[
        #stack(
          spacing: .8em,
          text(size: typo.body, weight: "bold", fill: palette.ink, title),
          [
            #set text(size: 13pt, fill: palette.ink-light, font: _sans-font)
            #body
            #lazy-v(1fr)
          ],
        )
      ],
    )
  ]
}

/// counter-block -- Bold counter with accent underline
#let counter-block(value, label) = {
  block(width: 100%)[
    #stack(
      spacing: .8em,
      text(size: typo.counter-size, weight: "black", fill: palette.ink, value),
      block(width: 40pt, height: 3pt, fill: palette.accent),
      text(
        size: typo.kicker-size,
        weight: "bold",
        tracking: 1.5pt,
        fill: palette.ink-muted,
        font: _mono-font,
        upper(label),
      ),
      lazy-v(1fr),
    )
  ]
}

/// split-grid -- Asymmetric split with accent divider
#let split-grid(left-content, right-content, ratio: 55%) = {
  let left-width = ratio
  let right-width = 100% - ratio
  grid(
    columns: (left-width, right-width),
    column-gutter: 0pt,
    // Left
    block(width: 100%, inset: (right: 1em))[
      #left-content
    ],
    // Right with accent left border as divider
    block(width: 100%, stroke: (left: 3pt + palette.accent), inset: (left: 1em))[
      #right-content
    ],
  )
}

/// motion-blur-text -- Text with fading copies offset to create motion blur effect
#let motion-blur-text(body, copies: 3, offset: 4pt) = {
  block(width: auto)[
    // Fading trailing copies
    #for i in range(copies, 0, step: -1) {
      place(
        left,
        dx: -offset * i,
        text(
          fill: palette.ink.transparentize(70% + i * 8%),
          body,
        ),
      )
    }
    // Main text
    #body
  ]
}

/// tag -- Small pill-shaped inline label
#let tag(body, color: palette.accent) = {
  box(
    fill: color,
    inset: (x: 0.5em, y: 0.2em),
    radius: 2pt,
    text(
      size: typo.meta-size,
      weight: "bold",
      fill: palette.bg,
      upper(body),
    ),
  )
}

/// progress-bar -- Horizontal bar showing progress ratio (0.0 to 1.0)
#let progress-bar(ratio, width: 100%, height: 8pt) = {
  let pct = calc.min(calc.max(ratio, 0.0), 1.0)
  block(width: width, height: height, fill: palette.surface, radius: 0pt)[
    #place(left,
      block(
        width: pct * 100%,
        height: 100%,
        fill: gradient.linear(palette.accent, palette.secondary, angle: 0deg),
        radius: 0pt,
      ),
    )
  ]
}

/// data-row -- Horizontal label-value pair with accent dot
#let data-row(label, value) = {
  grid(
    columns: (auto, 1fr, auto),
    column-gutter: 8pt,
    {
      set text(size: 13pt, fill: palette.ink-muted, font: _sans-font)
      std.align(left + horizon, label)
    },
    {
      std.align(horizon,
        block(width: 100%, height: 0pt,
          line(length: 100%, stroke: (
            paint: palette.ink-faint,
            thickness: 0.5pt,
            dash: "dotted",
          )),
        ),
      )
    },
    {
      set text(size: 13pt, weight: "bold", fill: palette.ink)
      std.align(right + horizon, value)
    },
  )
}

/// kinetic-rule -- Accent rule with gradient fill
#let kinetic-rule(width: 100%, thickness: 3pt) = {
  block(width: width, height: thickness)[
    #place(left,
      block(
        width: 100%,
        height: 100%,
        fill: gradient.linear(
          palette.accent,
          palette.secondary,
          angle: 0deg,
        ),
      ),
    )
  ]
}

/// frame-number -- Oversized frame counter (video timecode style)
#let frame-number(num) = {
  text(
    size: typo.frame-size,
    weight: "black",
    fill: palette.ink.transparentize(88%),
    font: _mono-font,
    {
      if num < 10 [0#num] else [#num]
    },
  )
}

/// ghost-streak -- Repeated fading text at angles for background
#let ghost-streak(body, copies: 4, dx: 0pt, dy: 0pt) = {
  place(top + left, dx: dx, dy: dy,
    {
      for i in range(copies) {
        place(
          top + left,
          dx: i * 30pt,
          dy: i * 15pt,
          rotate(
            -15deg,
            text(
              size: 36pt,
              weight: "black",
              fill: palette.ink.transparentize(90% + i * 2%),
              body,
            ),
          ),
        )
      }
    },
  )
}


// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// _kinetic-header -- Standard header with accent slash
#let _kinetic-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
  set std.align(horizon + left)
  // Chrome line with diagonal accent
  stack(
    spacing: 20pt,
    {
      set text(size: 8pt, weight: "bold", fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
      grid(
        columns: (1fr, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        {
          set std.align(right)
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        },
      )
    },
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
      block(width: 50pt, height: 2.5pt)[
        #place(left,
          block(
            width: 100%,
            height: 100%,
            fill: gradient.linear(
              pal.accent,
              pal.secondary,
              angle: 0deg,
            ),
          ),
        )
      ],
    ),
  )
}

/// _kinetic-footer -- Standard footer with accent dot
#let _kinetic-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)
      upper[KINETIC]
    },
    box(circle(radius: 2pt, fill: pal.accent)),
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.ink-muted, font: _mono-font)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark/impact slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, weight: "bold", fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
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

/// _dark-footer -- Footer for dark/inverted slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)
      upper[KINETIC]
    },
    box(circle(radius: 2pt, fill: pal.accent)),
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.ink-muted, font: _mono-font)
      context [#utils.slide-counter.display()]
    },
  )
}


// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard content slide
/// Bold title + gradient accent rule. Mono chrome header, kinetic footer.
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _kinetic-header(self)
  let footer(self) = _kinetic-footer(self)
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

/// dark-slide -- Dark background slide with accent stripe at top
#let dark-slide(
  title: auto,
  align: auto,
  ghost: none,
  ghost-dx: -20pt,
  ghost-dy: -30pt,
  ghost-size: 200pt,
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
    // Diagonal accent stripe at top
    place(top + left, dx: -2em, dy: -2.4em,
      block(width: 200%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
          ),
        )
      ],
    )
    // Ghost element
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: "black", fill: pal.ink-ghost, ghost),
      )
    }
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      header: header,
      footer: footer,
      margin: (top: 1.9em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// impact-slide -- Split-panel layout for high-impact statements
#let impact-slide(
  left-content: none,
  right-content: none,
  ..args,
) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      margin: 0pt,
      header: none,
      footer: none,
    ),
  )
  let body = {
    // Left accent panel
    place(top + left,
      block(width: 45%, height: 100%, fill: pal.accent),
    )
    // Vertical divider between panels
    place(top + left, dx: 44.5%,
      block(width: 4pt, height: 100%, fill: pal.bg),
    )
    // Top gradient bar
    place(top + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.secondary, pal.accent, pal.bg, angle: 0deg),
          ),
        )
      ],
    )
    // Left content
    if left-content != none {
      place(left + horizon,
        pad(left: 2.5em, right: 0pt)[
          #set text(fill: pal.bg, size: 1em)
          #block(width: 35%)[
            #left-content
          ]
        ],
      )
    }
    // Right content
    if right-content != none {
      place(right + horizon,
        pad(right: 2.5em)[
          #set text(fill: pal.ink, size: 1em)
          #block(width: 45%)[
            #right-content
          ]
        ],
      )
    }
  }
  touying-slide(self: self, body)
})

/// ticker-slide -- Scrolling-style data strip layout
#let ticker-slide(
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
    // Accent stripe top
    place(top + left, dx: -2em, dy: -2.4em,
      block(width: 200%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
          ),
        )
      ],
    )
    // Title
    if self.store.title != none and self.store.title != auto {
      text(size: 28pt, weight: "bold", fill: pal.ink,
        utils.call-or-display(self, self.store.title))
      v(0.15em)
    }
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      header: header,
      footer: footer,
      margin: (top: 1.9em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Cover with energetic diagonal composition
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Full background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Accent band at bottom
    place(bottom + left, dy: -60pt,
      block(width: 100%, height: 40pt, fill: pal.accent.transparentize(90%)),
    )
    // Speed lines decoration
    place(top + right, dx: -40pt, dy: 60pt,
      {
        for i in range(5) {
          place(top + left, dy: i * 12pt,
            block(
              width: (120pt - i * 20pt),
              height: 2pt,
              fill: gradient.linear(
                pal.accent.transparentize(90%),
                pal.accent.transparentize(40% + i * 10%),
                angle: 0deg,
              ),
            ),
          )
        }
      },
    )
    // Top gradient bar
    place(top + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
          ),
        )
      ],
    )
    // Ghost frame number
    place(top + right, dx: -30pt, dy: 10pt,
      text(size: 160pt, weight: "black", fill: pal.ink.transparentize(94%), font: _mono-font, [00]),
    )
    // Content
    set std.align(left + horizon)
    pad(x: 3.5em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        velocity-kicker(info.institution)
        v(1.2em)
      }
      // Title
      #text(size: 2.4em, weight: "black", fill: pal.ink, info.title)
      #v(0.4em)
      // Gradient accent rule
      #block(width: 80pt, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
          ),
        )
      ]
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: typo.h2, weight: "regular", fill: pal.ink-light, info.subtitle)
        v(0.8em)
      }
      // Author + date
      #{
        set text(size: 9pt, fill: pal.ink-muted, font: _mono-font, weight: "bold", tracking: 0.5pt)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1em)
          text(fill: pal.accent, "//")

          h(1em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
    // Bottom accent bar
    place(bottom + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.secondary, pal.accent, angle: 0deg),
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

/// new-section-slide -- Section divider with kinetic energy
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Gradient bar top
    place(top + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
          ),
        )
      ],
    )
    // Accent vertical bar left
    place(left + horizon, dx: 1.5em,
      block(width: 4pt, height: 35%, fill: pal.accent),
    )
    // Ghost section number
    place(top + right, dx: -40pt, dy: 20pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink.transparentize(92%), size: 160pt, weight: "black", font: _mono-font, num-str)
      },
    )
    // Speed lines
    place(bottom + right, dx: -20pt, dy: -40pt,
      {
        for i in range(4) {
          place(top + left, dy: i * 10pt,
            block(
              width: (100pt - i * 20pt),
              height: 1.5pt,
              fill: pal.accent.transparentize(60% + i * 8%),
            ),
          )
        }
      },
    )
    pad(left: 4em, right: 6em, top: 4em, bottom: 2em)[
      #v(1fr)
      // Kicker
      #velocity-kicker[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.8em)
      // Section title
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "black")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 60pt, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
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
            fill: gradient.linear(pal.secondary, pal.accent, angle: 0deg),
          ),
        )
      ],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Full-page centered statement with kinetic energy
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
    // Gradient bars top and bottom
    place(top + left, dx: -3em, dy: -3em,
      block(width: 200%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
          ),
        )
      ],
    )
    place(bottom + left, dx: -3em, dy: 3em,
      block(width: 200%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.secondary, pal.accent, angle: 0deg),
          ),
        )
      ],
    )
    // Accent dot
    place(top + left, dx: -1em, dy: 0.5em,
      circle(radius: 4pt, fill: pal.accent),
    )
    set text(fill: pal.ink, size: 1.8em, weight: "bold")
    set std.align(horizon + center)
    body
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Closing page with kinetic flair
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Gradient bars
    place(top + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
          ),
        )
      ],
    )
    place(bottom + left,
      block(width: 100%, height: 3pt)[
        #place(left,
          block(width: 100%, height: 100%,
            fill: gradient.linear(pal.secondary, pal.accent, angle: 0deg),
          ),
        )
      ],
    )
    // Ghost frame number
    place(center + horizon,
      text(size: 200pt, weight: "black", fill: pal.ink.transparentize(95%), font: _mono-font, [FIN]),
    )
    // Speed lines
    place(right + horizon, dx: -30pt,
      {
        for i in range(5) {
          place(top + left, dy: i * 10pt - 20pt,
            block(
              width: (80pt - i * 14pt),
              height: 2pt,
              fill: pal.accent.transparentize(50% + i * 10%),
            ),
          )
        }
      },
    )
    // Content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Gradient accent rule above
      #std.align(center,
        block(width: 80pt, height: 3pt)[
          #place(left,
            block(width: 100%, height: 100%,
              fill: gradient.linear(pal.accent, pal.secondary, angle: 0deg),
            ),
          )
        ],
      )
      #v(1em)
      #text(size: 2.2em, weight: "black", fill: pal.ink, body)
      #v(0.6em)
      // Small accent rule below
      #std.align(center,
        block(width: 40pt, height: 3pt, fill: pal.accent),
      )
      #v(1.5em)
      #text(size: 8pt, weight: "bold", tracking: 2pt, fill: pal.ink-muted, font: _mono-font)[KINETIC]
    ]
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let kinetic-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "neon",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 5.5em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
      neutral-lightest: pal.ink,
      neutral-darkest: pal.bg,
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
