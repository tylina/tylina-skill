// Brutalist-Web Theme — Neo-Brutalist Web Design Aesthetic
// Thick black borders everywhere. Pure black & white. Clashing yellow + blue accents.
// Anti-design that becomes beautiful through commitment.
// ZERO rounded corners. ZERO gradients. ZERO shadows.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  classic: (bg: rgb("#FFFFFF"), ink: rgb("#000000"), accent: rgb("#FFDE00"), secondary: rgb("#0000FF")),
  dark:    (bg: rgb("#000000"), ink: rgb("#FFFFFF"), accent: rgb("#FFDE00"), secondary: rgb("#FF3399")),
  paper:   (bg: rgb("#FFF8E7"), ink: rgb("#000000"), accent: rgb("#FF6600"), secondary: rgb("#009900")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  (
    bg: p.bg,
    ink: p.ink,
    accent: p.accent,
    secondary: p.secondary,
    ink-light: p.ink.transparentize(30%),
    ink-muted: p.ink.transparentize(50%),
    ink-faint: p.ink.transparentize(75%),
    ink-ghost: p.ink.transparentize(92%),
    accent-light: p.accent.transparentize(40%),
    accent-faint: p.accent.transparentize(80%),
    secondary-light: p.secondary.transparentize(40%),
    secondary-faint: p.secondary.transparentize(80%),
  )
}

#let palette = build-palette("classic")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 48pt,
  h1: 36pt,
  h2: 24pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  mono-size: 10pt,
)

// =====================================================================
// Mono font reference
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _sans-font = "IBM Plex Sans"

// =====================================================================
// 1. Reusable Components
// =====================================================================

/// brutalist-card -- Card with thick 3pt black border. NO radius. Ever.
#let brutalist-card(
  title: none,
  body,
  fill: white,
  border-color: rgb("#000000"),
  header-fill: none,
) = {
  block(width: 100%, stroke: 3pt + border-color, radius: 0pt, fill: fill)[
    #if title != none {
      block(width: 100%, fill: if header-fill != none { header-fill } else { rgb("#FFDE00") }, inset: (x: 12pt, y: 8pt))[
        #text(size: 12pt, weight: "bold", fill: rgb("#000000"), tracking: 1pt)[#upper(title)]
      ]
    }
    #block(width: 100%, inset: (x: 14pt, y: 12pt))[
      #body
      #lazy-v(1fr)
    ]
  ]
}

/// raw-stat -- Enormous bold number with yellow highlight block behind it
#let raw-stat(number, label, highlight: true) = {
  block(width: 100%)[
    #std.align(left, stack(
      spacing: .8em,
      if highlight {
        box(fill: rgb("#FFDE00"), inset: (x: 6pt, y: 2pt))[
          #text(size: 48pt, weight: "black", fill: rgb("#000000"))[#number]
        ]
      } else {
        text(size: 48pt, weight: "black", fill: rgb("#000000"))[#number]
      },
      text(size: 11pt, weight: "bold", fill: rgb("#000000"), tracking: 1.5pt)[#upper(label)],
    ))
    #lazy-v(1fr)
  ]
}

/// link-text -- Blue text with underline, like a hyperlink
#let link-text(body) = {
  underline(text(fill: rgb("#0000FF"), weight: "bold", body))
}

/// highlight-box -- Yellow background block with black text (marker effect)
#let highlight-box(body) = {
  box(fill: rgb("#FFDE00"), inset: (x: 6pt, y: 3pt))[
    #text(weight: "bold", fill: rgb("#000000"))[#body]
  ]
}

/// stack-card -- Cards that appear "stacked" with visible offset border
#let stack-card(body, fill: white) = {
  block(width: 100%)[
    // Shadow layer (offset)
    #place(top + left, dx: 4pt, dy: 4pt,
      block(width: 100%, stroke: 3pt + rgb("#000000"), fill: rgb("#000000"), radius: 0pt, inset: (x: 14pt, y: 12pt))[
        #hide(body)
      ]
    )
    // Main card
    #block(width: 100%, stroke: 3pt + rgb("#000000"), fill: fill, radius: 0pt, inset: (x: 14pt, y: 12pt))[
      #body
      #lazy-v(1fr)
    ]
  ]
}

/// browser-frame -- Card that looks like a browser window with title bar dots
#let browser-frame(url: "http://brutalist.website", body, fill: white) = {
  block(width: 100%, stroke: 3pt + rgb("#000000"), radius: 0pt, clip: true)[
    #stack(spacing: 0pt,
      // Title bar
      block(width: 100%, fill: rgb("#000000"), inset: (x: 10pt, y: 6pt))[
        #grid(columns: (auto, 1fr), column-gutter: 10pt, align: horizon,
          stack(dir: ltr, spacing: 5pt,
            circle(radius: 4pt, fill: rgb("#FF5F56"), stroke: none),
            circle(radius: 4pt, fill: rgb("#FFBD2E"), stroke: none),
            circle(radius: 4pt, fill: rgb("#27C93F"), stroke: none),
          ),
          block(fill: rgb("#FFFFFF"), inset: (x: 8pt, y: 3pt), radius: 0pt, width: 100%)[
            #text(size: 8pt, fill: rgb("#000000"), font: _mono-font)[#url]
          ],
        )
      ],
      // Content area
      block(width: 100%, fill: fill, inset: (x: 14pt, y: 12pt))[
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// frame-block -- Universal thick black border wrapper
#let frame-block(
  body,
  fill: white,
  border-color: rgb("#000000"),
  width: 100%,
  inset: (x: 1em, y: .8em),
) = {
  block(width: width, fill: fill, stroke: 3pt + border-color, inset: inset, radius: 0pt)[
    #body
    #lazy-v(1fr)
  ]
}

/// mono-label -- Monospace label text
#let mono-label(body) = {
  text(size: typo.mono-size, font: _mono-font, weight: "bold", tracking: 1pt, fill: rgb("#000000"))[#upper(body)]
}

/// brutalist-divider -- Thick black horizontal rule
#let brutalist-divider() = {
  block(width: 100%, height: 3pt, fill: rgb("#000000"))
}

// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// Standard header with huge bold title and frame border
#let _brutalist-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 1.2em, bottom: 0.3em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.5em, weight: "black", tracking: 0.5pt)
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 60pt, height: 3pt, fill: pal.accent),
  )
}

/// Standard footer with monospace page number
#let _brutalist-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.4em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 8pt, weight: "bold", tracking: 2pt, fill: pal.ink-muted, font: _mono-font)
      upper[BRUTALIST]
    },
    block(width: 3pt, height: 3pt, fill: pal.ink),
    {
      set std.align(right)
      set text(size: 8pt, weight: "bold", fill: pal.ink, font: _mono-font)
      context { [#utils.slide-counter.display() / #utils.last-slide-number] }
    },
  )
}

/// Dark footer variant
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.4em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 8pt, weight: "bold", tracking: 2pt, fill: pal.bg.transparentize(50%), font: _mono-font)
      upper[BRUTALIST]
    },
    block(width: 3pt, height: 3pt, fill: pal.bg),
    {
      set std.align(right)
      set text(size: 8pt, weight: "bold", fill: pal.bg, font: _mono-font)
      context { [#utils.slide-counter.display() / #utils.last-slide-number] }
    },
  )
}

// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard content slide: white bg, 3pt black frame border inset from edges
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _brutalist-header(self)
  let footer(self) = _brutalist-footer(self)
  let setting(body) = {
    // Inset frame border -- THE signature of brutalist-web
    // Use percentage-based sizing centered in content area
    place(center + horizon,
      rect(width: 107%, height: 107%, stroke: 3pt + pal.ink, radius: 0pt, fill: none)
    )
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Black bg, white 3pt frame border, white text, yellow accents
#let dark-slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1.2em, bottom: 0.3em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: pal.bg, size: 1.5em, weight: "black", tracking: 0.5pt)
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 60pt, height: 3pt, fill: pal.accent),
    )
  }
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // White frame border on dark bg
    // Use percentage-based sizing centered in content area
    place(center + horizon,
      rect(width: 107%, height: 107%, stroke: 3pt + pal.bg, radius: 0pt, fill: none)
    )
    set text(fill: pal.bg)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      header: header,
      footer: footer,
      margin: (top: 5em, bottom: 1.5em, x: 2.2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- White bg, enormous bold title, thick black underline, yellow accent block
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Yellow accent rectangle (placed decorative block)
    place(top + right, dx: -20pt, dy: 20pt,
      block(width: 180pt, height: 120pt, fill: pal.accent, stroke: 3pt + pal.ink, radius: 0pt)
    )
    // Blue decorative block bottom-left
    place(bottom + left, dx: 30pt, dy: -30pt,
      block(width: 80pt, height: 80pt, fill: pal.secondary, stroke: 3pt + pal.ink, radius: 0pt)
    )
    // Frame border inset -- centered percentage-based
    place(center + horizon,
      rect(width: 96%, height: 93%, stroke: 3pt + pal.ink, radius: 0pt, fill: none)
    )
    // Title content
    set std.align(left + horizon)
    pad(x: 3.5em, y: 2.5em)[
      // Title - enormous bold
      #text(size: 2.8em, weight: "black", fill: pal.ink, tracking: -0.5pt, info.title)
      #v(0.3em)
      // Thick black underline
      #block(width: 200pt, height: 3pt, fill: pal.ink)
      #v(0.6em)
      // Subtitle in blue
      #if info.subtitle != none {
        text(size: typo.h2, weight: "bold", fill: pal.secondary, info.subtitle)
        v(0.8em)
      }
      // Author + date in mono
      #{
        set text(size: 10pt, fill: pal.ink-muted, font: _mono-font, weight: "bold", tracking: 0.5pt)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1em)
          text(fill: pal.ink)[\/\/]
          h(1em)
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

/// new-section-slide -- YELLOW fill bg, black text, thick black border frame, section number huge
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Yellow fill background
    place(top + left, block(width: 100%, height: 100%, fill: pal.accent))
    // Black frame border inset -- centered percentage-based
    place(center + horizon,
      rect(width: 96%, height: 93%, stroke: 3pt + pal.ink, radius: 0pt, fill: none)
    )
    // Huge section number (ghost)
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink.transparentize(85%), size: 160pt, weight: "black", font: _mono-font, num-str)
      },
    )
    // Section content
    pad(left: 4em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number label
      #{
        set text(size: 10pt, fill: pal.ink, font: _mono-font, weight: "bold", tracking: 2pt)
        context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          [SECTION #num-str]
        }
      }
      #v(0.5em)
      // Section title
      #{
        set text(fill: pal.ink, size: 2.4em, weight: "black")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.3em)
      #block(width: 80pt, height: 3pt, fill: pal.ink)
      #v(2fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Blue fill bg, white bold text, no border
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.secondary,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    set text(fill: rgb("#FFFFFF"), size: 2em, weight: "black")
    set std.align(horizon + center)
    body
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- White bg, black frame, centered bold farewell, yellow + blue corner blocks
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Frame border -- centered percentage-based
    place(center + horizon,
      rect(width: 96%, height: 93%, stroke: 3pt + pal.ink, radius: 0pt, fill: none)
    )
    // Yellow corner block (top-left)
    place(top + left, dx: 16pt, dy: 16pt,
      block(width: 50pt, height: 50pt, fill: pal.accent, stroke: 3pt + pal.ink, radius: 0pt)
    )
    // Blue corner block (bottom-right)
    place(bottom + right, dx: -16pt, dy: -16pt,
      block(width: 50pt, height: 50pt, fill: pal.secondary, stroke: 3pt + pal.ink, radius: 0pt)
    )
    // Centered farewell text
    set std.align(center + horizon)
    pad(x: 4em)[
      #text(size: 2.4em, weight: "black", fill: pal.ink, body)
      #v(0.5em)
      #block(width: 100pt, height: 3pt, fill: pal.ink)
      #v(1em)
      #text(size: 9pt, weight: "bold", tracking: 3pt, fill: pal.ink-muted, font: _mono-font)[BRUTALIST\-WEB]
    ]
  }
  touying-slide(self: self, main-body)
})

/// hero-slide -- Full color block with frame
#let hero-slide(fill: rgb("#FFDE00"), body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: fill))
    // Frame border -- centered percentage-based
    place(center + horizon,
      rect(width: 96%, height: 93%, stroke: 3pt + pal.ink, radius: 0pt, fill: none)
    )
    pad(x: 3em, y: 2.5em)[
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let brutalist-web-theme(
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
      paper: "presentation-16-9",
      fill: pal.bg,
      margin: (top: 5em, bottom: 1.5em, x: 2.2em),
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
