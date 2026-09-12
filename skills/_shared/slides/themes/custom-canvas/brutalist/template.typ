// Brutalist Theme -- Raw concrete / Brutalist architecture Touying presentation theme
// Heavy sans-serif type, exposed grid structures, monochrome with single accent
// High contrast, no decoration, no rounded corners, no shadows, no gradients
// 3 presets: concrete, carbon, formwork
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================
// Each preset: bg, ink, accent. Nothing else.

#let presets = (
  concrete: (
    bg: rgb("#E8E4E0"), ink: rgb("#1A1A1A"), accent: rgb("#D4380D"),
    accent-text: rgb("#8C260D"), on-accent: white,
  ),
  carbon: (
    bg: rgb("#1C1C1C"), ink: rgb("#F0EDE8"), accent: rgb("#00B4D8"),
    accent-text: rgb("#00B4D8"), on-accent: rgb("#1C1C1C"),
  ),
  formwork: (
    bg: rgb("#F5F0E8"), ink: rgb("#2D2D2D"), accent: rgb("#E6A817"),
    accent-text: rgb("#765500"), on-accent: rgb("#2D2D2D"),
  ),
)


// =====================================================================
// Palette Builder
// =====================================================================
// Derives full palette from preset name.
// Exposed so users can do: #let pal = build-palette("concrete")

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let accent = p.accent
  (
    bg: bg,
    ink: ink,
    accent: accent,
    accent-text: p.accent-text,
    on-accent: p.on-accent,
    // Derived tones
    ink-light: ink.transparentize(30%),
    ink-muted: ink.transparentize(30%),
    ink-faint: ink.transparentize(78%),
    ink-ghost: ink.transparentize(92%),
    // Accent variants
    accent-light: accent.transparentize(40%),
    accent-faint: accent.transparentize(80%),
    // Surface variants
    surface: ink.transparentize(94%),
    divider: ink.transparentize(65%),
    // Inverted (for dark slides)
    inv-text: bg,
    inv-muted: bg.transparentize(30%),
    inv-faint: bg.transparentize(80%),
    inv-ghost: bg.transparentize(92%),
  )
}

// Default palette (concrete)
#let palette = build-palette("concrete")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 48pt,
  h1: 32pt,
  h2: 22pt,
  body: 16pt,
  kicker-size: 9pt,
  meta-size: 8pt,
  stat-size: 56pt,
  ghost-size: 140pt,
)


// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "IBM Plex Mono"


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// slab -- Heavy block card with thick left border (accent color)
#let slab(title, body, border-width: 5pt) = {
  block(
    width: 100%,
    stroke: (left: border-width + palette.accent),
    inset: (left: 1em, right: 0.8em, y: 0.7em),
  )[
    #stack(
      spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 13pt, fill: palette.ink-light)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// kicker -- Uppercase mono label, tracked and bold
#let kicker(body) = {
  text(
    size: typo.kicker-size,
    weight: "bold",
    tracking: 2pt,
    fill: palette.ink-muted,
    font: _mono-font,
    upper(body),
  )
}

/// brutalist-rule -- Thick horizontal rule (5pt default)
#let brutalist-rule(width: 100%, thickness: 5pt) = {
  block(width: width, height: thickness, fill: palette.ink)
}

/// section-number -- Oversized sans number at low opacity
#let section-number(num, size: 140pt, opacity: 12%) = {
  text(
    size: size,
    weight: "black",
    fill: palette.ink.transparentize(100% - opacity),
    str(num),
  )
}

/// raw-stat -- Giant number + tiny label, no decoration
#let raw-stat(value, label) = {
  block(width: 100%)[
    #align(center)[
      #stack(
        spacing: .8em,
        text(size: typo.stat-size, weight: "black", fill: palette.ink, value),
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
  ]
}

/// exposed-grid -- Grid with visible gridlines as design element
#let exposed-grid(cols, ..children) = {
  let items = children.pos()
  grid(
    columns: cols,
    column-gutter: 0pt,
    row-gutter: 0pt,
    ..items.map(item =>
      block(
        width: 100%,
        stroke: 0.75pt + palette.divider,
        inset: (x: 0.8em, y: 0.6em),
      )[#item]
    ),
  )
}

/// pull-quote -- Large text with heavy left bar
#let pull-quote(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 6pt + palette.accent),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(
      spacing: .8em,
      {
        set text(size: typo.h2, weight: "bold", fill: palette.ink)
        body
      },
      if cite != none {
        text(
          size: typo.kicker-size,
          weight: "bold",
          fill: palette.ink-muted,
          font: _mono-font,
          tracking: 1pt,
          upper[-- #cite],
        )
      },
    )
  ]
}

/// stamp -- Rotated bold text overlay (architectural stamp)
#let stamp(body, angle: -12deg, dx: 0pt, dy: 0pt) = {
  place(
    top + right,
    dx: dx,
    dy: dy,
    rotate(
      angle,
      text(
        size: 28pt,
        weight: "black",
        fill: palette.accent.transparentize(70%),
        tracking: 3pt,
        upper(body),
      ),
    ),
  )
}

/// data-strip -- Horizontal strip of key-value pairs separated by thick dividers
#let data-strip(..items) = {
  let pairs = items.pos()
  let n = pairs.len()
  block(
    width: 100%,
    stroke: (top: 3pt + palette.ink, bottom: 3pt + palette.ink),
    inset: (x: 0pt, y: 0.5em),
  )[
    #grid(
      columns: (1fr,) * n,
      column-gutter: 0pt,
      ..pairs.enumerate().map(((i, pair)) => {
        let content-block = block(
          width: 100%,
          inset: (x: 0.6em),
          stroke: if i < n - 1 { (right: 2pt + palette.ink) } else { none },
        )[
          #stack(
            spacing: .8em,
            text(size: typo.kicker-size, weight: "bold", tracking: 1pt, fill: palette.ink-muted, font: _mono-font, upper(pair.at(0))),
            text(size: typo.body, weight: "black", fill: palette.ink, pair.at(1)),
          )
        ]
        content-block
      }),
    )
  ]
}

/// mono-label -- Small monospace label
#let mono-label(body) = {
  text(
    size: typo.meta-size,
    weight: "medium",
    fill: palette.ink-muted,
    font: _mono-font,
    body,
  )
}

/// brutalist-footer -- Minimal footer with exposed page counter
#let _brutalist-footer-light(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)
      upper[BRUTALIST]
    },
    block(width: 3pt, height: 3pt, fill: pal.ink-faint),
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.ink-muted, font: _mono-font)
      context [#utils.slide-counter.display()]
    },
  )
}

/// ghost-num -- Massive background number at low opacity
#let ghost-num(num, dx: 0pt, dy: 0pt, size: 200pt) = {
  place(
    top + right,
    dx: dx,
    dy: dy,
    text(
      size: size,
      weight: "black",
      fill: palette.ink.transparentize(93%),
      str(num),
    ),
  )
}


// Persistent exposed-joint marks for ordinary content slides.
#let _structural-atmosphere(line-color, accent-color) = {
  place(
    top + right,
    dx: 1.2em,
    dy: -0.4em,
    grid(
      columns: (24pt, 24pt),
      rows: (24pt, 24pt),
      gutter: 0pt,
      ..range(4).map(_ => block(
        width: 100%,
        height: 100%,
        stroke: 0.6pt + line-color,
      )),
    ),
  )
  place(
    bottom + left,
    dx: -0.6em,
    dy: 0.6em,
    stack(
      dir: ltr,
      spacing: 0pt,
      block(width: 28pt, height: 2pt, fill: line-color),
      block(width: 2pt, height: 28pt, fill: accent-color),
    ),
  )
}

// Fixed-height placed grid: safe use of height: 100% outside normal flow.
#let _exposed-page-grid(line-color, cols) = {
  place(
    center + horizon,
    block(width: 100%, height: 100%)[
      #grid(
        columns: (1fr,) * cols,
        rows: (1fr,),
        column-gutter: 0pt,
        ..range(cols).map(i => block(
          width: 100%,
          height: 100%,
          stroke: (
            left: 0.75pt + line-color,
            right: if i == cols - 1 { 0.75pt + line-color } else { none },
          ),
        )),
      )
    ],
  )
}


// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// _light-header -- Standard header for light slides
#let _light-header(self, custom-left: none, custom-right: none) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
  set std.align(horizon + left)
  // Chrome metadata
  stack(
    spacing: 20pt,
    block(width: 100%)[
      #set text(size: 8pt, weight: "bold", fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
      #grid(
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
    ],
    // Title -- heavy weight
    {
      set text(fill: pal.ink, size: 1.5em, weight: "black")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 100%, height: 4pt, fill: pal.ink),
  )
}

/// _dark-header -- Header for dark slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, weight: "bold", fill: pal.inv-muted, font: _mono-font, tracking: 0.5pt)
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
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.inv-muted, font: _mono-font)
      upper[BRUTALIST]
    },
    block(width: 3pt, height: 3pt, fill: pal.inv-faint),
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.inv-muted, font: _mono-font)
      context [#utils.slide-counter.display()]
    },
  )
}


// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard LIGHT content slide
/// Heavy title + thick rule below. Mono chrome header, footer.
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _light-header(self)
  let footer(self) = _brutalist-footer-light(self)
  let setting(body) = {
    let pal = self.store.palette
    _structural-atmosphere(pal.ink-faint, pal.accent-faint)
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

/// dark-slide -- Ink background, inverted text, accent rule at top
#let dark-slide(
  title: auto,
  align: auto,
  ghost: none,
  ghost-dx: -20pt,
  ghost-dy: -40pt,
  ghost-size: 220pt,
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
    // Accent bar at top
    place(top + left, dx: -2em, dy: -2.4em,
      block(width: 200%, height: 5pt, fill: pal.accent),
    )
    // Ghost number
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: "black", fill: pal.inv-ghost, ghost),
      )
    }
    _structural-atmosphere(pal.inv-faint, pal.accent-faint)
    set text(fill: pal.inv-text)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      header: header,
      footer: footer,
      margin: (top: 1.9em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// manifesto-slide -- Full-page bold statement, massive text
/// "Nothing is hidden."
#let manifesto-slide(body) = touying-slide-wrapper(self => {
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
  let main-body = {
    // Top accent bar
    place(top + left, block(width: 100%, height: 6pt, fill: pal.accent))
    // Bottom ink bar
    place(bottom + left, block(width: 100%, height: 6pt, fill: pal.ink))
    // Content
    set std.align(left + horizon)
    pad(x: 3em, y: 2em)[
      #set text(size: 2.8em, weight: "black", fill: pal.ink)
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// grid-expose-slide -- Visible grid lines as decoration
#let grid-expose-slide(
  title: auto,
  align: auto,
  cols: 3,
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

  let header(self) = _light-header(
    self,
    custom-left: header-left,
    custom-right: header-right,
  )
  let footer(self) = _brutalist-footer-light(self)

  let setting(body) = {
    _exposed-page-grid(pal.ink-faint, cols)
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

/// title-slide -- Cover with heavy typography
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Full background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Top accent bar
    place(top + left, block(width: 100%, height: 6pt, fill: pal.accent))
    // Bottom ink bar
    place(bottom + left, block(width: 100%, height: 6pt, fill: pal.ink))
    // Ghost letter
    place(top + right, dx: -30pt, dy: 10pt,
      text(size: 220pt, weight: "black", fill: pal.ink-ghost, [B]),
    )
    // Content
    set std.align(left + horizon)
    pad(x: 3.5em, y: 3em)[
      #stack(
        spacing: 1em,
        if info.institution != none {
          text(
            size: 9pt,
            weight: "bold",
            tracking: 2pt,
            fill: pal.ink-muted,
            font: _mono-font,
            upper(info.institution),
          )
        },
        stack(
          spacing: .8em,
          text(size: 2.6em, weight: "black", fill: pal.ink, info.title),
          block(width: 80pt, height: 5pt, fill: pal.accent),
          if info.subtitle != none {
            text(size: typo.h2, weight: "regular", fill: pal.ink-light, info.subtitle)
          },
        ),
        {
          set text(size: 9pt, fill: pal.ink-muted, font: _mono-font, weight: "bold", tracking: 0.5pt)
          stack(
            dir: ltr,
            spacing: 1.5em,
            if info.author != none { upper(info.author) },
            if info.author != none and info.date != none {
              text(fill: pal.ink-faint, "//")
            },
            if info.date != none { utils.display-info-date(self) },
          )
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with oversized number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Top accent bar
    place(top + left, block(width: 100%, height: 6pt, fill: pal.accent))
    // Bottom ink bar
    place(bottom + left, block(width: 100%, height: 6pt, fill: pal.ink))
    // Giant section number
    place(top + right, dx: -40pt, dy: 20pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink.transparentize(90%), size: 180pt, weight: "black", num-str)
      },
    )
    set std.align(left + horizon)
    pad(left: 3.5em, right: 6em, top: 4em, bottom: 2em)[
      #stack(
        spacing: .8em,
        text(
          size: 9pt,
          weight: "bold",
          tracking: 2pt,
          fill: pal.ink-muted,
          font: _mono-font,
        )[SECTION #context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          num-str
        }],
        {
          set text(fill: pal.ink, size: 2.4em, weight: "black")
          utils.display-current-heading(level: 1, numbered: false)
        },
        block(width: 80pt, height: 5pt, fill: pal.accent),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Full-page centered statement
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
    // Top and bottom bars
    place(top + left, dx: -3em, dy: -3em, block(width: 200%, height: 5pt, fill: pal.ink))
    place(bottom + left, dx: -3em, dy: 3em, block(width: 200%, height: 5pt, fill: pal.ink))
    // Accent corner mark
    place(top + left, dx: -1.5em, dy: -0.5em,
      block(width: 5pt, height: 40pt, fill: pal.accent),
    )
    set text(fill: pal.ink, size: 1.8em, weight: "black")
    set std.align(horizon + center)
    block(width: 84%, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Closing page
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Top accent bar
    place(top + left, block(width: 100%, height: 6pt, fill: pal.accent))
    // Bottom ink bar
    place(bottom + left, block(width: 100%, height: 6pt, fill: pal.ink))
    // Ghost END text
    place(center + horizon,
      text(size: 220pt, weight: "black", fill: pal.ink.transparentize(95%), [END]),
    )
    // Content
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(
        spacing: .8em,
        block(width: 100pt, height: 5pt, fill: pal.ink),
        text(size: 2.4em, weight: "black", fill: pal.ink, body),
        block(width: 60pt, height: 5pt, fill: pal.accent),
        text(size: 8pt, weight: "bold", tracking: 2pt, fill: pal.ink-muted, font: _mono-font)[BRUTALIST],
      )
    ]
    place(bottom + left, block(width: 100%, height: 6pt, fill: pal.ink))
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let brutalist-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "concrete",
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
      primary: pal.accent-text,
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
