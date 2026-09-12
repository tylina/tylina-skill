// Swiss Theme — International Typographic Style for Touying 0.7.4
// Single accent color, inverse weight hierarchy, sharp rectangles, grid-first
// 4 accent presets: ikb, lemon, green, orange
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// ═══ Preset Definitions ═══

#let _presets = (
  ikb: (accent: rgb("#002FA7"), accent-on: rgb("#ffffff")),
  lemon: (accent: rgb("#FFD500"), accent-on: rgb("#0a0a0a")),
  green: (accent: rgb("#C5E803"), accent-on: rgb("#0a0a0a")),
  orange: (accent: rgb("#FF6B35"), accent-on: rgb("#ffffff")),
)

// ═══ Palette Factory ═══

#let make-palette(preset-name) = {
  let p = _presets.at(preset-name)
  (
    paper: rgb("#fafaf8"),
    ink: rgb("#0a0a0a"),
    grey-1: rgb("#f0f0ee"),
    grey-2: rgb("#d4d4d2"),
    grey-3: rgb("#737373"),
    accent: p.accent,
    accent-on: p.accent-on,
  )
}

#let palette = make-palette("ikb")


// ═══════════════════════════════════════════════════════════════════════════
// HELPER FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════

/// Kicker — mono uppercase meta label (tracked, semibold 600)
#let kicker(body) = {
  set text(
    size: 9pt,
    weight: 600,
    tracking: 1.5pt,
    fill: palette.grey-3,
  )
  upper(body)
}

/// Hairline rule — 0.5pt ink horizontal divider
#let hairline-rule(width: 100%) = {
  line(length: width, stroke: 0.5pt + palette.ink)
}

/// Accent rule — accent-colored block rule (3pt height)
#let accent-rule(width: 48pt, accent: palette.accent) = {
  block(width: width, height: 3pt, fill: accent)
}

/// KPI Hero — giant number display (36pt+, weight 200)
#let kpi-hero(value, label: none) = {
  block(width: 100%)[
    #stack(
      spacing: .8em,
      text(size: 36pt, weight: 200, fill: palette.ink, value),
      if label != none {
        text(size: 10pt, weight: 500, fill: palette.grey-3, label)
      },
    )
  ]
}

/// Chrome-min — minimal top chrome bar with left/right text
#let chrome-min(left-text, right-text) = {
  set text(size: 8pt, weight: 500, fill: palette.grey-3, tracking: 0.5pt)
  grid(
    columns: (1fr, 1fr),
    align(left, upper(left-text)),
    align(right, upper(right-text)),
  )
}

/// Dot matrix — geometric dot decoration (hero pages only)
#let dot-matrix(rows: 3, cols: 8, size: 2.5pt) = {
  let dot-color = palette.grey-2
  grid(
    columns: cols,
    rows: rows,
    column-gutter: size * 2.5,
    row-gutter: size * 2.5,
    ..range(cols * rows).map(_ => circle(radius: size, fill: dot-color)),
  )
}

/// Numbered item — number + title + description block
#let numbered-item(number, title, body, accent: palette.accent) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 14pt,
    text(size: 22pt, weight: 200, fill: accent, number),
    stack(
      spacing: .8em,
      {
        set text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)
        upper(title)
      },
      {
        set text(size: 10pt, weight: 400, fill: palette.ink, tracking: 0pt)
        body
      },
    ),
  )
}


// ═══════════════════════════════════════════════════════════════════════════
// CARD COMPONENTS
// ═══════════════════════════════════════════════════════════════════════════

/// Card — ink background (white text)
#let card-ink(title, body) = {
  block(
    width: 100%,
    fill: palette.ink,
    inset: 12pt,
  )[
    #set text(fill: rgb("#ffffff"))
    #stack(spacing: .8em,
      text(weight: 500, size: 0.9em, title),
      [
        #set text(size: 0.75em, weight: 400)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Card — accent color background
#let card-accent(title, body, accent: palette.accent, accent-on: palette.accent-on) = {
  block(
    width: 100%,
    fill: accent,
    inset: 12pt,
  )[
    #set text(fill: accent-on)
    #stack(spacing: .8em,
      text(weight: 500, size: 0.9em, title),
      [
        #set text(size: 0.75em, weight: 400)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Card — grey-1 fill (most common)
#let card-fill(title, body) = {
  block(
    width: 100%,
    fill: palette.grey-1,
    inset: 12pt,
  )[
    #stack(spacing: .8em,
      text(weight: 500, size: 0.9em, fill: palette.ink, title),
      [
        #set text(size: 0.75em, weight: 400, fill: palette.ink)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Card — hairline border only
#let card-outlined(title, body) = {
  block(
    width: 100%,
    stroke: 0.5pt + palette.grey-2,
    inset: 12pt,
  )[
    #stack(spacing: .8em,
      text(weight: 500, size: 0.9em, fill: palette.ink, title),
      [
        #set text(size: 0.75em, weight: 400, fill: palette.ink)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Stat card — large number + small label
#let stat-card(value, label, unit: none) = {
  block(
    width: 100%,
    fill: palette.grey-1,
    inset: (x: 12pt, y: 10pt),
  )[
    #stack(spacing: .8em,
      [
        #set text(size: 24pt, weight: 200, fill: palette.ink)
        #value
        #if unit != none {
          text(size: 12pt, weight: 400, fill: palette.grey-3, unit)
        }
      ],
      [
        #set text(size: 9pt, weight: 500, fill: palette.grey-3)
        #upper(label)
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Timeline node — compact vertical timeline entry
#let timeline-node(year, title, body, accent: palette.accent) = {
  grid(
    columns: (40pt, 6pt, 1fr),
    column-gutter: 8pt,
    {
      set text(size: 12pt, weight: 300, fill: palette.grey-3)
      align(right + top, str(year))
    },
    {
      align(center + top, pad(top: 2pt, circle(radius: 3pt, fill: accent)))
    },
    {
      text(weight: 500, size: 0.85em, fill: palette.ink, title)
      v(1pt)
      set text(size: 0.75em, weight: 400, fill: palette.grey-3)
      body
    },
  )
}

/// Bar chart row — horizontal bar with percentage fill
#let bar-chart-row(label, value, max-value: 100, accent: palette.accent) = {
  let pct = calc.min(value / max-value * 100, 100)
  grid(
    columns: (70pt, 1fr, 32pt),
    column-gutter: 8pt,
    row-gutter: 0pt,
    {
      set text(size: 0.75em, weight: 400, fill: palette.ink)
      align(right + horizon, label)
    },
    {
      align(horizon,
        block(width: 100%, height: 12pt, fill: palette.grey-1)[
          #place(left, block(
            width: pct * 1%,
            height: 100%,
            fill: accent,
          ))
        ]
      )
    },
    {
      set text(size: 0.75em, weight: 500, fill: palette.ink)
      align(left + horizon, str(value))
    },
  )
}

/// Duo compare — left/right comparison with center vertical rule
#let duo-compare(left-title, left-body, right-title, right-body) = {
  grid(
    columns: (1fr, auto, 1fr),
    column-gutter: 14pt,
    {
      text(weight: 500, size: 0.95em, fill: palette.ink, left-title)
      v(4pt)
      set text(size: 0.8em, weight: 400, fill: palette.grey-3)
      left-body
    },
    line(angle: 90deg, length: 80pt, stroke: 0.5pt + palette.grey-2),
    {
      text(weight: 500, size: 0.95em, fill: palette.ink, right-title)
      v(4pt)
      set text(size: 0.8em, weight: 400, fill: palette.grey-3)
      right-body
    },
  )
}


// ═══════════════════════════════════════════════════════════════════════════
// SLIDE FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════

/// Plain content slide — no header, just content with footer
/// Use for slides where content contains its own chrome-min or kicker
#let plain-slide(..args) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: pal.grey-3, size: 0.55em, weight: 500)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set std.align(right)
        context text(fill: pal.grey-3, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.paper,
      margin: (x: 2em, top: 2em, bottom: 1.2em),
      header: none,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})

/// Standard content slide — left-aligned title, accent rule below
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1.6em, bottom: 0.2em))
    set std.align(left + horizon)
    {
      set text(fill: pal.ink, size: 1.3em, weight: 300)
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    }
    v(4pt)
    block(width: 40pt, height: 2.5pt, fill: pal.accent)
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: pal.grey-3, size: 0.55em, weight: 500)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set std.align(right)
        context text(fill: pal.grey-3, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
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

/// Title slide — cover with accent background + large light-weight title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.accent))
    // Dot matrix decoration — top right
    place(top + right, dx: -2em, dy: 1.5em, {
      let dot-color = pal.accent-on.transparentize(75%)
      grid(
        columns: 6,
        rows: 3,
        column-gutter: 6pt,
        row-gutter: 6pt,
        ..range(18).map(_ => circle(radius: 2pt, fill: dot-color)),
      )
    })
    // Content — left-aligned, vertically centered
    place(left + horizon, pad(left: 3em, right: 3em)[
      #if info.institution != none {
        set text(size: 9pt, weight: 600, fill: pal.accent-on.transparentize(30%), tracking: 1.5pt)
        upper(info.institution)
        v(0.6em)
      }
      #set text(size: 2em, weight: 200, fill: pal.accent-on)
      #info.title
      #v(0.3em)
      #if info.subtitle != none {
        set text(size: 0.75em, weight: 400, fill: pal.accent-on.transparentize(20%))
        info.subtitle
        v(0.4em)
      }
      #block(width: 60pt, height: 0.5pt, fill: pal.accent-on.transparentize(50%))
      #v(0.4em)
      #if info.author != none {
        set text(size: 0.7em, weight: 400, fill: pal.accent-on)
        info.author
        v(0.15em)
      }
      #if info.date != none {
        set text(size: 0.6em, weight: 400, fill: pal.accent-on.transparentize(30%))
        utils.display-info-date(self)
      }
    ])
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// Section divider — large statement text
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    place(left + horizon, dx: 1.5em, block(width: 3pt, height: 35%, fill: pal.accent))
    pad(left: 4em, right: 3em, top: 3em, bottom: 2em)[
      #v(1fr)
      #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        set text(size: 3.5em, weight: 200, fill: pal.grey-2)
        num-str
      }
      #v(0.3em)
      #set text(fill: pal.ink, size: 2em, weight: 200)
      #utils.display-current-heading(level: 1, numbered: false)
      #v(6pt)
      #block(width: 40pt, height: 2.5pt, fill: pal.accent)
      #v(3fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — statement page (huge centered text, weight 200)
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.paper,
      margin: 2.5em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    place(top + left, dx: -2.5em, dy: -2.5em,
      block(width: 200%, height: 2.5pt, fill: pal.accent))
    set text(fill: pal.ink, size: 1.6em, weight: 200)
    set std.align(horizon + center)
    body
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// Ending slide — closing with accent split
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    place(top + left, block(width: 35%, height: 100%, fill: pal.accent))
    place(top + left, dx: 35%, block(width: 65%, height: 100%, fill: pal.paper))
    set std.align(left + horizon)
    pad(left: 42%, right: 3em)[
      #set text(size: 2em, weight: 200, fill: pal.ink)
      #body
      #v(8pt)
      #block(width: 40pt, height: 2.5pt, fill: pal.accent)
    ]
    place(bottom + left, dx: 2em, dy: -2em, {
      let dot-color = pal.accent-on.transparentize(70%)
      grid(
        columns: 5,
        rows: 3,
        column-gutter: 6pt,
        row-gutter: 6pt,
        ..range(15).map(_ => circle(radius: 1.5pt, fill: dot-color)),
      )
    })
  }
  touying-slide(self: self, main-body)
})

/// Dark slide — ink background with white/accent text, accent line at top
/// For statement pages like "Open in blue. Close in blue."
#let dark-slide(title: none, align: auto, ..args) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: pal.grey-3, size: 0.55em, weight: 500)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set std.align(right)
        context text(fill: pal.grey-3, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      margin: (x: 2.5em, top: 2.5em, bottom: 1.2em),
      header: none,
      footer: footer,
    ),
  )
  let setting(body) = {
    // Accent line at top
    place(top + left, dx: -2.5em, dy: -2.5em,
      block(width: 200%, height: 2.5pt, fill: pal.accent))
    // Optional title
    if title != none {
      set std.align(left)
      v(4pt)
      set text(size: 2.4em, weight: 200, fill: white)
      title
      v(12pt)
    }
    set text(fill: white)
    show: std.align.with(self.store.align)
    body
  }
  touying-slide(self: self, setting: setting, ..args)
})

/// Thesis slide — large statement (60%) + detail cards (40%) side by side
/// Like "The harness is the product" slide
#let thesis-slide(..args) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: pal.grey-3, size: 0.55em, weight: 500)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set std.align(right)
        context text(fill: pal.grey-3, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.paper,
      margin: (x: 2em, top: 2em, bottom: 1.2em),
      header: none,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})

/// KPI slide — performance dashboard layout
/// Chrome-min header, stat cards row, hairline rule, detail content below
#let kpi-slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: pal.grey-3, size: 0.55em, weight: 500)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set std.align(right)
        context text(fill: pal.grey-3, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.paper,
      margin: (x: 2em, top: 2em, bottom: 1.2em),
      header: none,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})


// ═══════════════════════════════════════════════════════════════════════════
// THEME ENTRY POINT
// ═══════════════════════════════════════════════════════════════════════════

#let swiss-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "ikb",
  ..args,
  body,
) = {
  let pal = make-palette(preset)

  set text(size: 18pt, fill: pal.ink)
  set heading(numbering: (..args) => none)
  set list(marker: text(fill: pal.accent, sym.square.filled))

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 10%,
      footer-descent: 30%,
      fill: pal.paper,
      margin: (top: 2.3em, bottom: 1.2em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
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
