// Guizang Magazine Theme -- Editorial magazine / E-ink style Touying presentation theme
// Two-tone ink/paper system: restraint over spectacle, structure over decoration
// Font-agnostic: the document selects an installed type stack in demo.typ / main.typ
// 5 ink/paper presets: monocle, indigo, forest, kraft, dune
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================
// Each preset defines only ink + paper. Everything else is derived.

#let presets = (
  monocle: (ink: rgb("#0a0a0b"), paper: rgb("#f1efea")),
  indigo:  (ink: rgb("#0a1f3d"), paper: rgb("#f1f3f5")),
  forest:  (ink: rgb("#1a2e1f"), paper: rgb("#f5f1e8")),
  kraft:   (ink: rgb("#2a1e13"), paper: rgb("#eedfc7")),
  dune:    (ink: rgb("#1f1a14"), paper: rgb("#f0e6d2")),
)


// =====================================================================
// Palette Builder
// =====================================================================
// Derives full palette from a preset's ink + paper pair.
// Exposed so users can do: #let pal = build-palette("monocle")

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let ink = p.ink
  let paper = p.paper
  (
    ink: ink,
    paper: paper,
    // Derived tones
    ink-light: ink.transparentize(40%),
    ink-faint: ink.transparentize(80%),
    ink-muted: ink.transparentize(35%),
    // Footer / metadata
    meta-color: ink.transparentize(35%),
  )
}

// Default palette (monocle) -- used by components at module level
#let palette = build-palette("monocle")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 44pt,
  h2: 20pt,
  lead: 16pt,
  body: 14pt,
  kicker-size: 9pt,
  meta-size: 8pt,
)


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// editorial-num -- Large italic serif number for decorative numbering
#let editorial-num(n, size: 48pt, opacity: 50%, pal: palette) = {
  text(
    size: size,
    weight: 300,
    style: "italic",
    fill: pal.ink.transparentize(100% - opacity),
    str(n),
  )
}

/// kicker -- Small tracked uppercase mono label above titles
#let kicker(body, pal: palette) = {
  text(
    size: typo.kicker-size,
    weight: "medium",
    tracking: 1.8pt,
    fill: pal.ink-muted,
    upper(body),
  )
}

/// gold-rule -- Decorative horizontal rule using ink color
#let gold-rule(width: 40pt, pal: palette) = {
  block(width: width, height: 2pt, fill: pal.ink)
}

/// pull-quote -- Large serif quotation with optional attribution
#let pull-quote(body, cite: none, inverted: false, pal: palette) = {
  let quote-color = if inverted { pal.paper } else { pal.ink }
  let cite-color = if inverted { pal.paper.transparentize(35%) } else { pal.ink-muted }
  block(
    width: 100%,
    stroke: (left: 3pt + if inverted { pal.paper.transparentize(45%) } else { pal.ink-light }),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(
      spacing: .8em,
      {
        set text(size: typo.h2, style: "italic", fill: quote-color)
        body
      },
      if cite != none {
        text(
          size: typo.kicker-size,
          style: "normal",
          weight: "medium",
          fill: cite-color,
          [-- #cite],
        )
      },
    )
  ]
}

/// stat-block -- Three-tier editorial stat display: label, number, description
#let stat-block(label, value, description: none, number-size: 52pt, inverted: false, pal: palette) = {
  let value-color = if inverted { pal.paper } else { pal.ink }
  let label-color = if inverted { pal.paper.transparentize(35%) } else { pal.ink-muted }
  let description-color = if inverted { pal.paper.transparentize(30%) } else { pal.ink-light }
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #stack(
      spacing: .8em,
      text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 1.2pt,
        fill: label-color,
        upper(label),
      ),
      text(
        size: number-size,
        weight: 300,
        fill: value-color,
        value,
      ),
      if description != none {
        text(
          size: typo.body,
          weight: "regular",
          fill: description-color,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// pillar-card -- Numbered card with ink top border
#let pillar-card(number, title, body, pal: palette) = {
  block(
    width: 100%,
    stroke: (top: 2pt + pal.ink),
    inset: (x: 0.6em, top: 0.6em, bottom: 0.5em),
  )[
    #stack(spacing: .8em,
      editorial-num(number, size: 36pt, opacity: 25%, pal: pal),
      text(size: typo.lead, weight: "bold", fill: pal.ink, title),
      {
        set text(size: 12pt, fill: pal.ink-light)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// comparison-column -- Editorial comparison lane; use with Touying's `cols`
#let comparison-column(label: none, strong: false, pal: palette, body) = {
  block(
    width: 100%,
    fill: pal.paper,
    stroke: (left: 2.5pt + if strong { pal.ink } else { pal.ink-faint }),
    inset: (left: 1em, right: 0.5em, y: 0.4em),
  )[
    #stack(
      spacing: .8em,
      if label != none {
        text(
          size: typo.kicker-size,
          weight: "medium",
          tracking: 1.2pt,
          fill: pal.meta-color,
          upper(label),
        )
      },
      body,
    )
  ]
}


// =====================================================================
// 2. Editorial Atmosphere
// =====================================================================

#let _editorial-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1600 900">
  <path d="M80 0V900" fill="none" stroke="currentColor" stroke-width="1" opacity="0.10"/>
  <path d="M520 0V900" fill="none" stroke="currentColor" stroke-width="1" opacity="0.045"/>
  <path d="M1040 0V900" fill="none" stroke="currentColor" stroke-width="1" opacity="0.045"/>
  <path d="M1520 0V900" fill="none" stroke="currentColor" stroke-width="1" opacity="0.10"/>
  <path d="M0 88H1600" fill="none" stroke="currentColor" stroke-width="1" opacity="0.055"/>
  <path d="M0 812H1600" fill="none" stroke="currentColor" stroke-width="1" opacity="0.055"/>
  <path d="M64 72h32M80 56v32" fill="none" stroke="currentColor" stroke-width="2" opacity="0.18"/>
  <path d="M1504 828h32M1520 812v32" fill="none" stroke="currentColor" stroke-width="2" opacity="0.18"/>
  <circle cx="520" cy="88" r="3" fill="currentColor" opacity="0.15"/>
  <circle cx="1040" cy="812" r="3" fill="currentColor" opacity="0.15"/>
</svg>
```.text

#let _editorial-atmosphere(pal, inverted: false) = {
  let atmosphere-color = if inverted { pal.paper } else { pal.ink }
  place(
    center + horizon,
    image(
      bytes(_editorial-grid-svg.replace("currentColor", atmosphere-color.to-hex())),
      width: 100%,
      height: 100%,
      fit: "stretch",
    ),
  )
}

#let _bookend-frame(pal) = {
  place(
    center + horizon,
    rect(
      width: 96%,
      height: 94%,
      fill: none,
      stroke: 0.8pt + pal.ink-faint,
    ),
  )
}


// =====================================================================
// 3. Internal Helpers (header/footer factories)
// =====================================================================
// These produce header/footer closures for light and dark slide variants.

/// _light-header -- Standard chrome header for light (paper) slides
#let _light-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    {
      set text(size: typo.meta-size, fill: pal.meta-color)
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
    {
      set text(fill: pal.ink, size: 1.6em, weight: 300)
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    gold-rule(width: 40pt, pal: pal),
  )
}

/// _light-footer -- Standard footer for light slides
#let _light-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[MAGAZINE]
    },
    box(circle(radius: 1.5pt, fill: pal.ink-faint)),
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Inverted chrome header for dark (ink) slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: typo.meta-size, fill: pal.paper.transparentize(40%))
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
  set text(fill: pal.paper.transparentize(40%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[MAGAZINE]
    },
    box(circle(radius: 1.5pt, fill: pal.paper.transparentize(65%))),
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}


// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard LIGHT content slide
/// Editorial title + ink rule below. Metadata header and measured footer.
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
    _editorial-atmosphere(self.store.palette)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
      margin: (top: 7em, bottom: 1.3em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Dark variant of standard slide.
/// Ink background, paper text, inverted header/footer.
/// Optional `ghost` parameter for background ghost text/number.
#let dark-slide(
  title: auto,
  align: auto,
  ghost: none,
  ghost-dx: -20pt,
  ghost-dy: -40pt,
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
    _editorial-atmosphere(pal, inverted: true)
    // Place ghost text if provided
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: 300, fill: pal.paper.transparentize(92%), ghost),
      )
    }
    // Set all text to paper color
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
      margin: (top: 1.9em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// stat-slide -- Dark data page optimized for stat-blocks.
/// Auto-inverts colors. Stat blocks should be placed in the body as a grid.
#let stat-slide(
  title: auto,
  align: auto,
  kicker: none,
  ghost: none,
  ghost-dx: -20pt,
  ghost-dy: -40pt,
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
    _editorial-atmosphere(pal, inverted: true)
    // Ghost
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: 300, fill: pal.paper.transparentize(92%), ghost),
      )
    }
    set text(fill: pal.paper)
    show: std.align.with(self.store.align)
    stack(
      spacing: .8em,
      if self.store.title != none and self.store.title != auto {
        text(
          size: 38pt,
          weight: 300,
          fill: pal.paper,
          utils.call-or-display(self, self.store.title),
        )
      },
      if kicker != none {
        text(
          size: 9pt,
          weight: "medium",
          tracking: 1.8pt,
          fill: pal.paper.transparentize(40%),
          upper(kicker),
        )
      },
      body,
    )
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

/// title-slide -- Cover with optional full-bleed background + scrim
#let title-slide(bg-image: none, ..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    _bookend-frame(pal)
    if bg-image != none {
      place(top + left,
        block(width: 100%, height: 100%, clip: true)[
          #image(bg-image, width: 100%)
        ],
      )
      place(bottom + left,
        block(
          width: 100%,
          height: 70%,
          fill: gradient.linear(
            pal.ink.transparentize(100%),
            pal.ink.transparentize(40%),
            pal.ink.transparentize(5%),
            angle: 180deg,
          ),
        ),
      )
    }
    // Ghost text decoration
    place(top + right, dx: -40pt, dy: 20pt,
      text(size: 160pt, weight: 300, fill: pal.ink.transparentize(if bg-image != none { 92% } else { 95% }), [M]),
    )
    // Title content
    {
      let text-color = if bg-image != none { pal.paper } else { pal.ink }
      let meta-col = if bg-image != none { pal.paper.transparentize(30%) } else { pal.meta-color }
      set std.align(left + horizon)
      pad(x: 4em, y: 3em)[
        #stack(
          spacing: .8em,
          if info.institution != none {
            text(
              size: 9pt,
              weight: "medium",
              tracking: 1.8pt,
              fill: meta-col,
              upper(info.institution),
            )
          },
          text(size: typo.display, weight: 300, fill: text-color, info.title),
          block(width: 60pt, height: 3pt, fill: if bg-image != none { pal.paper } else { pal.ink }),
          if info.subtitle != none {
            text(size: 18pt, weight: "regular", fill: text-color.transparentize(20%), info.subtitle)
          },
          {
            set text(size: 9pt, fill: meta-col)
            if info.author != none {
              upper[#info.author]
            }
            if info.author != none and info.date != none {
              h(1.5em)
              text(fill: meta-col.transparentize(30%))[|]
              h(1.5em)
            }
            if info.date != none {
              utils.display-info-date(self)
            }
          },
        )
      ]
    }
    place(bottom + left, block(width: 100%, height: 2pt, fill: pal.ink))
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider (hero style)
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    _editorial-atmosphere(pal)
    // Large editorial number (ghost)
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink.transparentize(90%), size: 160pt, weight: 300, style: "italic", num-str)
      },
    )
    place(top + left, block(width: 100%, height: 2pt, fill: pal.ink))
    pad(left: 4em, right: 6em, top: 4em, bottom: 2em)[
      #v(1fr)
      #stack(
        spacing: .8em,
        text(
          size: 9pt,
          weight: "medium",
          tracking: 1.8pt,
          fill: pal.meta-color,
        )[SECTION #context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          num-str
        }],
        {
          set text(fill: pal.ink, size: 2.4em, weight: 300)
          utils.display-current-heading(level: 1, numbered: false)
        },
        block(width: 60pt, height: 3pt, fill: pal.ink),
      )
      #v(3fr)
    ]
    place(bottom + left, block(width: 100%, height: 2pt, fill: pal.ink))
    place(bottom + right, dx: -2em, dy: -1.2em,
      text(fill: pal.meta-color, size: 7pt)[MAGAZINE],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Full-page centered statement
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.paper,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    _editorial-atmosphere(pal)
    place(top + left, dx: -3em, dy: -3em, block(width: 200%, height: 2pt, fill: pal.ink))
    place(bottom + left, dx: -3em, dy: 3em, block(width: 200%, height: 2pt, fill: pal.ink))
    place(top + left, dx: -0.5em, dy: -1em,
      text(size: 180pt, weight: 300, fill: pal.ink.transparentize(94%), [#sym.quote.l.double]),
    )
    set text(fill: pal.ink, size: 1.6em, weight: 300, style: "italic")
    set std.align(horizon + center)
    block(width: 80%, inset: (x: 1em))[#body]
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
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    _bookend-frame(pal)
    place(top + left, block(width: 100%, height: 2pt, fill: pal.ink))
    place(center + horizon,
      text(size: 200pt, weight: 300, fill: pal.ink.transparentize(96%), [FIN]),
    )
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(
        spacing: .8em,
        std.align(center, block(width: 80pt, height: 2pt, fill: pal.ink)),
        text(size: 2.2em, weight: 300, fill: pal.ink, body),
        std.align(center, block(width: 40pt, height: 2pt, fill: pal.ink)),
        text(size: 8pt, fill: pal.meta-color)[MAGAZINE],
      )
    ]
    place(bottom + left, block(width: 100%, height: 2pt, fill: pal.ink))
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 5. Theme Entry Point
// =====================================================================

#let magazine-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "monocle",
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
      margin: (top: 7em, bottom: 1.3em, x: 2em),
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
