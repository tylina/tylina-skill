// Global AI Capital 2026 — Dark Editorial Theme
// Bloomberg/Economist infographic style — building-block architecture
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// ═══════════════════════════════════════
// Color Palette
// ═══════════════════════════════════════

#let palette = (
  bg: rgb("#0E1116"),
  card: rgb("#1A1F26"),
  primary: rgb("#E8E6E1"),
  accent: rgb("#E63946"),
  amber: rgb("#F4A261"),
  body: rgb("#C9C5BE"),
  gray: rgb("#8A857E"),
  faint: rgb("#5C5852"),
  border: rgb("#2A2F36"),
  green: rgb("#52B788"),
  scrim: rgb("#0E1116"),
)

// ═══════════════════════════════════════
// Small Composable Components
// ═══════════════════════════════════════

/// Red accent rule (horizontal)
#let accent-rule(width: 60pt, thickness: 2.5pt) = {
  block(width: width, height: thickness, fill: palette.accent)
}

/// Section eyebrow — tracked uppercase label
#let section-label(body) = {
  text(size: 8pt, fill: palette.faint, tracking: 2pt, weight: "regular")[#upper(body)]
}

/// Page title with optional accent-colored portion
/// Usage: page-title[三巨头估值跃迁：从年初到 Q2 的][双倍线]
#let page-title(..args) = {
  let pos = args.pos()
  block[
    #text(size: 26pt, weight: "bold", fill: palette.primary)[#pos.at(0)]#if pos.len() > 1 {
      text(size: 26pt, weight: "bold", fill: palette.accent)[#pos.at(1)]
    }#if pos.len() > 2 {
      text(size: 26pt, weight: "bold", fill: palette.primary)[#pos.at(2)]
    }
  ]
}

/// Subtitle (italic, smaller)
#let page-subtitle(body) = {
  text(size: 11pt, fill: palette.gray, style: "italic")[#body]
}

/// Hero number — large financial figure
/// variant: "accent" | "amber" | "primary" | "green"
#let hero-num(value, size: 48pt, variant: "accent") = {
  let fill = if variant == "accent" { palette.accent } else if variant == "amber" { palette.amber } else if variant == "green" { palette.green } else { palette.primary }
  text(size: size, weight: "bold", fill: fill)[#value]
}

/// KPI card — dark card with label, hero number, description, source
#let kpi-card(..args) = {
  let pos = args.pos()
  let label = pos.at(0)
  let value = pos.at(1)
  let desc = pos.at(2)
  let source = if pos.len() > 3 { pos.at(3) } else { none }
  block(
    fill: palette.card,
    inset: (x: 10pt, y: 7pt),
    width: 100%,
    radius: 4pt,
    stroke: 0.5pt + palette.border,
  )[
    #stack(
      spacing: .8em,
      text(size: 7pt, fill: palette.gray)[#label],
      text(size: 32pt, weight: "bold", fill: palette.primary)[#value],
      text(size: 8pt, fill: palette.body)[#desc],
      if source != none { text(size: 7pt, fill: palette.faint)[#source] },
    )
  ]
}

/// Stat card — compact KPI with accent left bar
/// variant: "accent" | "amber" | "primary"
#let stat-card(label, value, desc, variant: "accent") = {
  let bar-color = if variant == "accent" { palette.accent } else if variant == "amber" { palette.amber } else { palette.primary }
  block(
    fill: palette.card,
    stroke: (left: 3pt + bar-color),
    inset: (left: 12pt, rest: 12pt),
    width: 100%,
    radius: 2pt,
  )[
    #stack(
      spacing: .8em,
      text(size: 8pt, fill: palette.gray, tracking: 1.5pt)[#upper(label)],
      text(size: 10pt, weight: "bold", fill: palette.primary)[#value],
      text(size: 8pt, fill: palette.body)[#desc],
    )
  ]
}

/// Editorial note card — with left red accent bar
#let editorial-card(body) = {
  block(
    stroke: (left: 3pt + palette.accent),
    inset: (left: 14pt, rest: 14pt),
    width: 100%,
  )[
    #body
  ]
}

/// Company comparison card — top accent bar + structured content
/// variant: "accent" | "amber" | "gray"
#let company-card(tag, name, body, variant: "accent") = {
  let bar-color = if variant == "accent" { palette.accent } else if variant == "amber" { palette.amber } else { palette.gray }
  block(
    fill: palette.card,
    width: 100%,
    radius: 3pt,
    stroke: 0.5pt + palette.border,
    clip: true,
  )[
    #stack(
      spacing: 0pt,
      block(width: 100%, height: 3pt, fill: bar-color),
      block(inset: (x: 10pt, y: 8pt), width: 100%)[
        #stack(
          spacing: .8em,
          text(size: 8pt, fill: bar-color, tracking: 1.5pt)[#upper(tag)],
          body,
        )
      ],
    )
  ]
}

/// Data table row
#let table-row(dim-label, dim-sub, us-val, us-sub, cn-val, cn-sub) = {
  block(width: 100%, inset: (x: 0pt, y: 6pt),
    stroke: (bottom: 0.5pt + palette.border),
  )[
    #grid(columns: (22%, 40%, 38%), column-gutter: 0pt,
      [
        #text(size: 9pt, fill: palette.body)[#dim-label]
        #v(1pt)
        #text(size: 7pt, fill: palette.faint)[#dim-sub]
      ],
      [
        #text(size: 11pt, weight: "bold", fill: palette.primary)[#us-val]
        #v(1pt)
        #text(size: 8pt, fill: palette.gray)[#us-sub]
      ],
      [
        #text(size: 11pt, weight: "bold", fill: palette.primary)[#cn-val]
        #v(1pt)
        #text(size: 8pt, fill: palette.gray)[#cn-sub]
      ],
    )
  ]
}

/// Quadrant risk card
/// variant: "accent" | "amber"
#let risk-card(label, title, subtitle, bullets, variant: "accent") = {
  let bar-color = if variant == "amber" { palette.amber } else { palette.accent }
  block(
    fill: palette.card,
    inset: 14pt,
    width: 100%,
    radius: 2pt,
    stroke: (top: 2pt + bar-color, rest: 0.5pt + palette.border),
  )[
    #stack(
      spacing: .8em,
      text(size: 8pt, fill: bar-color, tracking: 1.5pt)[#upper(label)],
      text(size: 14pt, weight: "bold", fill: palette.primary)[#title],
      text(size: 8pt, fill: palette.gray, style: "italic")[#subtitle],
      {
        set text(size: 9pt, fill: palette.body)
        bullets
      },
    )
  ]
}

/// Numbered closing item
#let closing-item(num, title, desc) = {
  block(width: 100%, inset: (y: 4pt),
    stroke: (bottom: 0.5pt + palette.border),
  )[
    #grid(columns: (30pt, 1fr), column-gutter: 10pt,
      align(center)[
        #block(width: 26pt, height: 26pt, radius: 13pt, stroke: 1pt + palette.accent)[
          #set align(center + horizon)
          #text(size: 12pt, fill: palette.accent, weight: "bold")[#num]
        ]
      ],
      [
        #stack(
          spacing: .8em,
          text(size: 12pt, weight: "bold", fill: palette.primary)[#title],
          text(size: 9pt, fill: palette.gray)[#desc],
        )
      ],
    )
  ]
}

/// Sankey flow card
#let flow-card(name, amount) = {
  block(
    fill: palette.card,
    inset: (x: 14pt, y: 10pt),
    width: 100%,
    radius: 2pt,
    stroke: 0.5pt + palette.border,
  )[
    #grid(columns: (1fr, auto), align: (left, right),
      text(size: 10pt, fill: palette.body)[#name],
      text(size: 10pt, weight: "bold", fill: palette.primary)[#amount],
    )
  ]
}

/// Hub node (central circle for hub-spoke)
#let hub-node(label, amount, sub) = {
  block(width: 74pt, height: 74pt, radius: 37pt,
    stroke: 1.5pt + palette.accent,
    fill: palette.card,
  )[
    #set align(center + horizon)
    #stack(
      spacing: .8em,
      text(size: 7pt, fill: palette.accent, tracking: 1.5pt)[#upper(label)],
      text(size: 16pt, weight: "bold", fill: palette.primary)[#amount],
      text(size: 7pt, fill: palette.gray)[#sub],
    )
  ]
}

/// Spoke node
#let spoke-node(name, detail, variant: "default") = {
  let border-color = if variant == "active" { palette.accent } else { palette.border }
  block(
    fill: palette.card,
    inset: (x: 7pt, y: 5pt),
    width: 100%,
    radius: 3pt,
    stroke: 0.75pt + border-color,
  )[
    #stack(
      spacing: .8em,
      text(size: 10pt, weight: "bold", fill: palette.primary)[#name],
      if variant == "active" { text(size: 8pt, fill: palette.accent, tracking: 1pt)[FLAGSHIP · ONLINE] },
      text(size: 8pt, fill: palette.gray)[#detail],
    )
  ]
}

/// Bar element for chart approximation
#let chart-bar(height-pct, label-top, label-bottom, sub-bottom, variant: "accent", max-height: 260pt) = {
  let fill-color = if variant == "accent" { palette.accent } else if variant == "amber" { palette.amber } else { palette.gray }
  let bar-height = max-height * height-pct / 100
  align(center)[
    #stack(
      spacing: .8em,
      text(size: 11pt, weight: "bold", fill: palette.primary)[#label-top],
      block(width: 65pt, height: bar-height, fill: fill-color, radius: (top: 2pt)),
      stack(
        spacing: .8em,
        text(size: 9pt, fill: palette.body)[#label-bottom],
        text(size: 7pt, fill: palette.faint)[#sub-bottom],
      ),
    )
  ]
}

/// Horizontal bar for ranking charts
#let hbar(label, sub-label, value-label, width-pct-str, variant: "accent") = {
  let fill-color = if variant == "accent" { palette.accent } else if variant == "amber" { palette.amber } else { palette.gray }
  let w = int(width-pct-str.replace("%", "")) * 1%
  grid(columns: (22%, 55%, 23%), column-gutter: 8pt, align: (right + horizon, left + horizon, left + horizon),
    [
      #stack(
        spacing: .8em,
        text(size: 10pt, weight: "bold", fill: palette.primary)[#label],
        text(size: 7pt, fill: palette.faint)[#sub-label],
      )
    ],
    block(width: w, height: 28pt, fill: fill-color, radius: (right: 2pt)),
    text(size: 12pt, weight: "bold", fill: fill-color)[#value-label],
  )
}

/// Standard footer with source + page counter
#let std-footer(source-text) = {
  block(width: 100%, stroke: (top: 0.5pt + palette.border), inset: (top: 2pt))[
    #grid(
      columns: (1fr, auto),
      text(size: 7pt, fill: palette.faint)[#source-text],
      context { text(size: 7pt, fill: palette.faint)[#utils.slide-counter.display() / #utils.last-slide-number] },
    )
  ]
}

/// Roman numeral for TOC (large editorial)
#let roman-num(n, variant: "accent") = {
  let fill = if variant == "accent" { palette.accent } else { palette.amber }
  text(size: 32pt, weight: "bold", fill: fill, style: "italic")[#n]
}

/// TOC entry row
#let toc-entry(roman, cn-title, en-title, pages, desc) = {
  block(width: 100%, inset: (y: 4pt), stroke: (bottom: 0.5pt + palette.border))[
    #grid(columns: (50pt, 1fr, auto), column-gutter: 10pt, align: (left, left, right + horizon),
      roman-num(roman),
      [
        #grid(columns: (auto, auto), column-gutter: 8pt, align: horizon,
          text(size: 14pt, weight: "bold", fill: palette.primary)[#cn-title],
          text(size: 14pt, weight: "bold", fill: palette.primary)[· #en-title],
        )
        #v(2pt)
        #text(size: 8pt, fill: palette.gray)[#desc]
      ],
      text(size: 10pt, fill: palette.gray)[#pages],
    )
  ]
}

/// Chapter anchor slide (full-bleed with image)
#let chapter-slide(
  bg-image: none,
  part-label: none,
  roman: none,
  cn-title: none,
  en-title: none,
  subtitle: none,
  bullets: (),
) = touying-slide-wrapper(self => {
  let body = {
    // Background image
    if bg-image != none {
      place(top + left, block(width: 100%, height: 100%, clip: true)[
        #image(bg-image, width: 100%, height: 100%, fit: "cover")
      ])
    } else {
      place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    }
    // Scrim overlays
    place(top + left, block(width: 100%, height: 100%,
      fill: gradient.linear(palette.scrim.transparentize(10%), palette.scrim.transparentize(60%), palette.scrim.transparentize(5%))))

    // Part label
    if part-label != none {
      place(top + left, dx: 5%, dy: 6%)[
        #section-label(part-label)
      ]
    }

    // Large roman numeral
    if roman != none {
      place(top + left, dx: 5%, dy: 10%)[
        #text(size: 72pt, weight: "bold", fill: palette.primary)[#roman.]
      ]
    }

    // Title block
    place(left + horizon, dx: 5%, dy: -3%)[
      #block(width: 50%)[
        #if cn-title != none {
          text(size: 28pt, weight: "bold", fill: palette.primary)[#cn-title]
          if en-title != none {
            h(12pt)
            text(size: 16pt, fill: palette.gray, style: "italic")[#en-title]
          }
        }
        #if subtitle != none {
          v(6pt)
          text(size: 11pt, fill: palette.body)[#subtitle]
        }
      ]
    ]

    // Bottom bullets
    if bullets.len() > 0 {
      place(bottom + left, dx: 5%, dy: -12%)[
        #block(width: 55%)[
          #block(stroke: (top: 0.5pt + palette.border), above: 4pt, width: 100%)[
            #v(6pt)
            #set text(size: 9pt, fill: palette.body)
            #for b in bullets {
              b
              linebreak()
            }
          ]
        ]
      ]
    }

    // Footer
    place(bottom + left, dx: 5%, dy: -3%)[
      #text(size: 7pt, fill: palette.faint)[Capital, Compute, and the Closed Loop · 2026 Industry Briefing]
    ]
    place(bottom + right, dx: -5%, dy: -3%)[
      #context { text(size: 7pt, fill: palette.faint)[#utils.slide-counter.display() / #utils.last-slide-number] }
    ]
  }
  self = utils.merge-dicts(self, config-page(header: none, footer: none, margin: 0pt))
  touying-slide(self: self, body)
})

// ═══════════════════════════════════════
// Default Slide Function (== headings)
// ═══════════════════════════════════════

#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto { self.store.title = title }
  if align != auto { self.store.align = align }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1em))
    set std.align(horizon + left)
    stack(spacing: .8em,
      {
        set text(fill: palette.primary, size: 1.2em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      accent-rule(width: 50pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.5em))
    set text(fill: palette.faint, size: 0.6em)
    block(width: 100%, above: 4pt, stroke: (top: 0.5pt + palette.border))[
      #v(4pt)
      #grid(columns: (1fr, auto), [],
        context { text[#utils.slide-counter.display() / #utils.last-slide-number] })
    ]
  }
    let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
self = utils.merge-dicts(self, config-page(header: header, footer: footer))
  touying-slide(self: self, setting: setting, ..args)
})

// ═══════════════════════════════════════
// Special Slide Functions
// ═══════════════════════════════════════

/// Cover slide — full-bleed dark with hero title
#let cover-slide(
  bg-image: none,
  title: none,
  subtitle: none,
  info-left: none,
  info-right: none,
  source: none,
) = touying-slide-wrapper(self => {
  let body = {
    // Background
    if bg-image != none {
      place(top + left, block(width: 100%, height: 100%, clip: true)[
        #image(bg-image, width: 100%, height: 100%, fit: "cover")
      ])
    }
    // Scrims
    place(bottom + left, block(width: 100%, height: 60%,
      fill: gradient.linear(palette.scrim.transparentize(100%), palette.scrim.transparentize(5%))))
    place(top + left, block(width: 100%, height: 40%,
      fill: gradient.linear(palette.scrim.transparentize(10%), palette.scrim.transparentize(100%))))

    // Eyebrow
    place(top + left, dx: 5%, dy: 6%)[
      #section-label[INDUSTRY BRIEFING · 2026.05]
    ]

    // Hero title
    place(left + horizon, dx: 5%, dy: -5%)[
      #block(width: 80%)[
        #text(size: 64pt, fill: palette.primary, weight: "bold")[#title]
        #v(8pt)
        #text(size: 18pt, fill: palette.gray, style: "italic")[#subtitle]
      ]
    ]

    // Bottom info
    place(bottom + left, dx: 5%, dy: -12%)[
      #block(width: 50%)[
        #if info-left != none {
          set text(size: 9pt, fill: palette.body)
          info-left
        }
      ]
    ]
    place(bottom + right, dx: -5%, dy: -12%)[
      #if info-right != none {
        text(size: 9pt, fill: palette.accent)[#info-right]
      }
    ]

    // Footer
    if source != none {
      place(bottom + left, dx: 5%, dy: -3%)[
        #text(size: 7pt, fill: palette.faint)[#source]
      ]
    }
    place(bottom + right, dx: -5%, dy: -3%)[
      #context { text(size: 7pt, fill: palette.faint)[#utils.slide-counter.display() / #utils.last-slide-number] }
    ]
  }
  self = utils.merge-dicts(self, config-page(header: none, footer: none, margin: 0pt))
  touying-slide(self: self, body)
})

/// Focus/ending slide
#let ending-slide(body) = touying-slide-wrapper(self => {
  let content = {
    place(top + left, dx: 24%, block(width: 0.5pt, height: 100%, fill: palette.border.transparentize(35%)))
    place(top + left, dx: 62%, block(width: 0.5pt, height: 100%, fill: palette.border.transparentize(35%)))
    place(top + right, dx: -6%, block(width: 1pt, height: 100%, fill: palette.accent.transparentize(30%)))
    body
  }
  self = utils.merge-dicts(self, config-page(header: none, footer: none, margin: (top: 2.5em, bottom: 2em, x: 2em)))
  touying-slide(self: self, content)
})

// ═══════════════════════════════════════
// Theme Entry Point
// ═══════════════════════════════════════

#let ai-capital-theme(
  aspect-ratio: "16-9",
  align: horizon,
  ..args,
  body,
) = {
  set text(
    size: 11pt,
    fill: palette.body,
  )

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      fill: palette.bg,
      margin: (top: 2.5em, bottom: 1.5em, x: 2em),
    ),
    config-colors(
      primary: palette.accent,
      neutral-lightest: palette.primary,
      neutral-darkest: palette.bg,
    ),
    config-common(
      slide-fn: slide,
      breakable: false,
    ),
    config-store(
      title: none,
      align: align,
    ),
    ..args,
  )

  body
}
