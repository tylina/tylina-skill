// Exhibit Theme — Premium dark-themed Touying presentation theme
// Authoritative, data-driven, conclusion-first design for executive presentations
// Features: gradient top bar, gold accents, CONFIDENTIAL footer, takeaway bars
// Perfect for strategic planning, board presentations, investment analysis
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  dark: rgb("#0D1117"),
  blue: rgb("#1E40AF"),
  purple: rgb("#7C3AED"),
  gold: rgb("#D4AF37"),
  indigo: rgb("#6366F1"),
  bg: rgb("#0D1117"),
  card-bg: rgb("#161B22"),
  border: rgb("#30363D"),
  text-white: rgb("#FFFFFF"),
  text-gray: rgb("#8B949E"),
  text-muted: rgb("#484F58"),
  success: rgb("#22C55E"),
  danger: rgb("#EF4444"),
  warning: rgb("#F59E0B"),
)

// ═══ Helper Functions ═══

/// CONFIDENTIAL label for footer
#let _confidential-label() = {
  box(
    fill: palette.text-muted.transparentize(60%),
    inset: (x: 6pt, y: 2pt),
    radius: 2pt,
  )[
    #set text(fill: palette.text-gray, size: 0.55em, weight: "bold", tracking: 1.5pt)
    CONFIDENTIAL
  ]
}

/// Grid decoration dots for data-driven feel
#let _grid-dots(cols: 6, rows: 3, size: 2pt, spacing: 12pt, color: palette.text-muted) = {
  let dot-color = color.transparentize(70%)
  grid(
    columns: cols,
    rows: rows,
    column-gutter: spacing,
    row-gutter: spacing,
    ..range(cols * rows).map(_ => circle(radius: size, fill: dot-color)),
  )
}

// ═══ 1. Slide Functions ═══

#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Top gradient bar — blue to purple
    block(width: 100%, height: 4pt, fill: gradient.linear(palette.blue, palette.indigo, palette.purple))
    // Title area with gold accent
    show: components.cell.with(inset: (x: 1.5em, top: 0.2em, bottom: 0.1em))
    set std.align(horizon + left)
    grid(
      columns: (4pt, 1fr),
      column-gutter: 8pt,
      align: horizon,
      block(width: 4pt, height: 1.3em, fill: palette.gold, radius: 2pt),
      {
        set text(fill: palette.text-white, size: 1.4em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-gray, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      // CONFIDENTIAL label on the left
      _confidential-label(),
      // Footer text in center
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Gold dot separator + page number
        set std.align(right)
        box(circle(radius: 2.5pt, fill: palette.gold))
        h(6pt)
        context text(fill: palette.text-gray, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    // Persistent data-grid atmosphere in the content body. Card fills stay opaque.
    place(bottom + right, dx: -0.5em, dy: -0.4em,
      _grid-dots(cols: 6, rows: 3, size: 1.2pt, color: palette.indigo))
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

#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Dark gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.dark, rgb("#111827"), palette.dark, angle: 135deg),
    ))
    // Top gradient bar
    place(top + left, block(width: 100%, height: 6pt, fill: gradient.linear(palette.blue, palette.indigo, palette.purple)))
    // Grid decoration top-right
    place(top + right, dx: -3em, dy: 2em, _grid-dots(cols: 8, rows: 4, size: 1.5pt, color: palette.indigo))
    // Decorative gradient circles
    place(top + right, dx: -40pt, dy: 60pt,
      circle(radius: 120pt, fill: palette.purple.transparentize(94%)))
    place(bottom + left, dx: 60pt, dy: -50pt,
      circle(radius: 100pt, fill: palette.blue.transparentize(94%)))
    // Left gold vertical accent
    place(left, dx: 40pt, dy: 20%, block(width: 6pt, height: 30%, fill: palette.gold, radius: 3pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 3em)[
      #stack(
        spacing: 0.8em,
        text(size: 2.4em, weight: "bold", fill: palette.text-white, info.title),
        if info.subtitle != none {
          text(size: 1em, fill: palette.text-gray, info.subtitle)
        },
        align(center, block(width: 200pt, height: 3pt, fill: gradient.linear(palette.gold.transparentize(80%), palette.gold, palette.gold.transparentize(80%)), radius: 1.5pt)),
        if info.author != none {
          text(size: 1.2em, weight: "semibold", fill: palette.gold, info.author)
        },
        if info.institution != none {
          text(size: 0.9em, fill: palette.text-gray, info.institution)
        },
        if info.date != none {
          stack(
            spacing: 0.8em,
            box(circle(radius: 2.5pt, fill: palette.gold)),
            text(size: 0.85em, fill: palette.text-gray)[#utils.display-info-date(self)],
          )
        },
      )
    ]
    // Bottom grid decoration
    place(bottom + left, dx: 3em, dy: -1.5em, _grid-dots(cols: 6, rows: 2, size: 1.5pt, color: palette.text-muted))
    // Bottom-right CONFIDENTIAL
    place(bottom + right, dx: -2em, dy: -1em,
      text(fill: palette.text-gray, size: 0.6em, weight: "bold", tracking: 1.5pt)[CONFIDENTIAL])
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

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Dark gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.dark, rgb("#111827"), angle: 135deg),
    ))
    // Top gradient bar
    place(top + left, block(width: 100%, height: 6pt, fill: gradient.linear(palette.blue, palette.indigo, palette.purple)))
    // Subtle decorative circles
    place(top + right, dx: -80pt, dy: 40pt,
      circle(radius: 100pt, fill: palette.purple.transparentize(96%)))
    place(bottom + left, dx: 50pt, dy: -40pt,
      circle(radius: 80pt, fill: palette.blue.transparentize(96%)))
    // Grid decoration top-right
    place(top + right, dx: -2.5em, dy: 2em, _grid-dots(cols: 5, rows: 3, size: 1.5pt, color: palette.indigo))
    // Left gold vertical accent
    place(left, dx: 40pt, dy: 35%, block(width: 6pt, height: 18%, fill: palette.gold, radius: 3pt))
    // Section content
    pad(left: 5em, top: 5em, bottom: 1.5em)[
      #v(1fr)
      // Large section number (decorative)
      #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: palette.indigo.transparentize(75%), size: 6em, weight: "bold", num-str)
      }
      #v(1fr)
      // Section title
      #set text(fill: palette.text-white, size: 2.2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      // Gold underline
      #block(width: 120pt, height: 3pt, fill: palette.gold, radius: 1.5pt)
      #v(3fr)
    ]
    // Bottom CONFIDENTIAL
    place(bottom + right, dx: -2em, dy: -1em,
      text(fill: palette.text-gray, size: 0.6em, weight: "bold", tracking: 1.5pt)[CONFIDENTIAL])
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.dark,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Top gradient bar
    place(top + left, dx: -2em, dy: -2em, block(width: 200%, height: 6pt, fill: gradient.linear(palette.blue, palette.indigo, palette.purple)))
    // Decorative elements
    place(top + right, dx: -40pt, dy: 40pt,
      circle(radius: 60pt, fill: palette.purple.transparentize(94%)))
    place(bottom + left, dx: 40pt, dy: -40pt,
      circle(radius: 50pt, fill: palette.blue.transparentize(94%)))
    // Gold accent markers
    place(left, dy: 0pt, block(width: 4pt, height: 80pt, fill: palette.gold.transparentize(40%), radius: 2pt))
    place(right, dy: 0pt, block(width: 4pt, height: 80pt, fill: palette.gold.transparentize(40%), radius: 2pt))
    // Center content
    set text(fill: palette.text-white, size: 1.8em, weight: "semibold")
    set std.align(horizon + center)
    block(width: 92%, inset: (x: 0.8em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Dark gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.dark, rgb("#111827"), palette.dark, angle: 135deg),
    ))
    // Top gradient bar
    place(top + left, block(width: 100%, height: 6pt, fill: gradient.linear(palette.blue, palette.indigo, palette.purple)))
    // Decorative elements
    place(top + right, dx: -60pt, dy: 50pt,
      circle(radius: 70pt, fill: palette.purple.transparentize(95%)))
    place(bottom + left, dx: 50pt, dy: -50pt,
      circle(radius: 60pt, fill: palette.blue.transparentize(95%)))
    // Grid decoration
    place(top + left, dx: 2em, dy: 2em, _grid-dots(cols: 4, rows: 3, size: 1.5pt, color: palette.text-muted))
    place(bottom + right, dx: -2em, dy: -2em, _grid-dots(cols: 4, rows: 3, size: 1.5pt, color: palette.text-muted))
    // Center card
    set std.align(center + horizon)
    block(
      width: 60%,
      fill: palette.card-bg,
      stroke: (left: 4pt + palette.gold, rest: 1pt + palette.border),
      radius: (right: 12pt),
      inset: (x: 2.5em, y: 2em),
    )[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 3pt, fill: palette.gold.transparentize(40%))),
          box(circle(radius: 3pt, fill: palette.gold)),
          box(circle(radius: 3pt, fill: palette.gold.transparentize(40%))),
        ),
        text(size: 2.4em, weight: "bold", fill: palette.text-white, body),
        block(width: 150pt, height: 2pt, fill: gradient.linear(palette.gold.transparentize(80%), palette.gold, palette.gold.transparentize(80%)), radius: 1pt),
      )
    ]
    // Bottom CONFIDENTIAL
    place(bottom + right, dx: -2em, dy: -1em,
      text(fill: palette.text-gray, size: 0.6em, weight: "bold", tracking: 1.5pt)[CONFIDENTIAL])
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Takeaway bar — dark bar with gold left border for key exhibit takeaways
/// Appears at top of slide content area with conclusion-first messaging
#let takeaway-bar(content) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + palette.gold, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.45em),
    radius: (right: 6pt),
  )[
    #grid(
      columns: (auto, auto, 1fr),
      column-gutter: 8pt,
      align: horizon,
      text(fill: palette.gold, size: 0.75em, weight: "bold")[KEY TAKEAWAY],
      text(fill: palette.text-gray)[|],
      text(fill: palette.text-white, size: 0.78em, content),
    )
  ]
}

/// KPI data card with large number and colored accent on dark background
#let kpi-card(label, value, trend: none, trend-color: none, accent: palette.gold) = {
  let t-color = if trend-color != none { trend-color } else { palette.text-gray }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.3em),
    radius: (bottom: 8pt),
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      text(fill: accent, size: 1.5em, weight: "bold", value),
      text(fill: palette.text-gray, size: 0.7em, label),
      if trend != none {
        text(fill: t-color, size: 0.62em, weight: "semibold", trend)
      },
      lazy-v(1fr),
    )
  ]
}

/// Callout box — generic accented box for key messages (insight, risk, success)
#let _callout-box(title, body, accent: palette.indigo) = {
  block(
    width: 100%,
    fill: accent.transparentize(88%),
    stroke: (left: 4pt + accent),
    inset: 14pt,
    radius: (right: 8pt),
  )[
    #stack(spacing: 0.8em,
      text(weight: "bold", fill: accent, size: 0.95em, title),
      [
      #set text(fill: palette.text-gray, size: 0.85em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Insight box — blue-accented box for key insights
#let insight-box(title, body) = _callout-box(title, body, accent: palette.indigo)

/// Data table with dark header and alternating row colors
#let data-table(align: center + horizon, inset: (x: 0.8em, y: 0.5em), headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.blue.darken(30%) }
      else if calc.odd(row) { palette.card-bg } else { palette.dark },
    stroke: 0.5pt + palette.border,
    inset: inset,
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.text-white, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-gray, size: 0.85em, c)),
  )
}

/// Exhibit card — numbered card for exhibits/sections
#let exhibit-card(number, title, description, accent: palette.gold) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: 1em,
    radius: 8pt,
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 10pt,
        box(
          fill: accent,
          width: 1.8em,
          height: 1.8em,
          radius: 4pt,
          inset: 0pt,
        )[
          #set std.align(center + horizon)
          #set text(fill: palette.dark, weight: "bold", size: 0.9em)
          #str(number)
        ],
        std.align(horizon, text(weight: "semibold", fill: palette.text-white, size: 1em, title)),
      ),
      {
        set text(fill: palette.text-gray, size: 0.8em)
        description
      },
      lazy-v(1fr),
    )
  ]
}

/// Risk/alert box with red accent
#let risk-box(title, body) = _callout-box(title, body, accent: palette.danger)

/// Success box with green accent
#let success-box(title, body) = _callout-box(title, body, accent: palette.success)

/// Stat row — horizontal layout of key metrics with gold accents
#let stat-row(..items) = {
  let accent-cycle = (palette.gold, palette.indigo, palette.blue, palette.purple)
  let cells = items.pos().enumerate().map(((i, item)) => {
    let color = accent-cycle.at(calc.rem(i, 4))
    block(width: 100%, fill: palette.card-bg, stroke: 1pt + palette.border, radius: 8pt, inset: 0.5em)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        text(size: 1.7em, weight: "bold", fill: color, item.at("value")),
        text(size: 0.7em, fill: palette.text-gray, item.at("label")),
      )
    ]
  })
  grid(columns: cells.len(), column-gutter: 0.6em, ..cells)
}

/// Phase/timeline card for strategic roadmaps
#let phase-card(phase, title, items, accent: palette.gold) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: 0.8em,
      text(size: 0.7em, weight: "bold", fill: accent, phase),
      text(size: 0.95em, weight: "semibold", fill: palette.text-white, title),
      {
        set text(size: 0.75em, fill: palette.text-gray)
        items
      },
      lazy-v(1fr),
    )
  ]
}

// ═══ 3. Theme Entry Point ═══

#let exhibit-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-white)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.gold,
      neutral-lightest: palette.text-white,
      neutral-darkest: palette.dark,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
    ),
    ..args,
  )

  body
}
