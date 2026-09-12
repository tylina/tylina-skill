// Corporate Theme — A polished, professional Touying theme
// Steel blue and gray tones with structured layouts
// Inspired by McKinsey/BCG consulting slide decks
// Perfect for business reports, strategy presentations, investor decks

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#1565C0"),
  secondary: rgb("#1E88E5"),
  accent: rgb("#0D47A1"),
  bg: rgb("#FAFAFA"),
  card-bg: rgb("#FFFFFF"),
  gray-light: rgb("#F5F5F5"),
  gray-medium: rgb("#BDBDBD"),
  text-dark: rgb("#212121"),
  text-light: rgb("#616161"),
  success: rgb("#2E7D32"),
  danger: rgb("#C62828"),
)

// Subtle report-index ticks keep ordinary content pages recognizably corporate
// without competing with dense tables and charts.
#let _report-ticks(color: palette.primary) = stack(
  spacing: 0.8em,
  ..(18pt, 30pt, 22pt, 38pt).map(width => block(
    width: width,
    height: 1.2pt,
    fill: color.transparentize(86%),
  )),
)

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
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      stack(
        dir: ltr,
        spacing: 4pt,
        block(width: 64pt, height: 3pt, fill: palette.primary),
        block(width: 20pt, height: 3pt, fill: palette.secondary.lighten(25%)),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.35em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      box(block(width: 28pt, height: 2pt, fill: palette.primary.transparentize(35%))),
      {
        set std.align(right)
        context { utils.slide-counter.display() + " / " + utils.last-slide-number }
      },
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    place(right + horizon, dx: 1.45em, _report-ticks())
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
    grid(
      columns: (3.5fr, 6.5fr),
      rows: 100%,
      // Left sidebar — dark blue
      {
        block(
          width: 100%,
          height: 100%,
          fill: palette.accent,
          inset: (x: 1.5em, y: 2em),
        )[
          #set align(left + horizon)
          #set text(fill: white)
          #stack(
            spacing: 0.8em,
            text(size: 2em, weight: "bold", info.title),
            if info.subtitle != none { text(size: 1em, info.subtitle) },
          )
        ]
      },
      // Right side — white
      {
        block(
          width: 100%,
          height: 100%,
          fill: palette.card-bg,
          inset: (x: 2em, y: 2em),
        )[
          #set align(left + horizon)
          #set text(fill: palette.text-dark)
          #v(1fr)
          #stack(
            spacing: 0.8em,
            if info.author != none {
              text(size: 1.1em, weight: "semibold", info.author)
            },
            if info.institution != none {
              text(size: 0.9em, fill: palette.text-light, info.institution)
            },
            if info.date != none {
              text(size: 0.9em, fill: palette.text-light, utils.display-info-date(self))
            },
          )
          #v(1fr)
          // Blue accent line at bottom
          #block(width: 4em, height: 4pt, fill: palette.secondary, radius: 2pt)
        ]
      },
    )
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
    // Top accent band
    block(width: 100%, height: 6pt, fill: palette.primary)
    v(1fr)
    pad(x: 3em)[
      #stack(
        spacing: 0.8em,
        text(
          size: 0.9em,
          fill: palette.secondary,
          weight: "bold",
          tracking: 0.1em,
          smallcaps([Section]),
        ),
        block(width: 3em, height: 3pt, fill: palette.primary, radius: 1.5pt),
        text(
          size: 2em,
          fill: palette.text-dark,
          weight: "semibold",
          utils.display-current-heading(level: 1),
        ),
      )
    ]
    v(1fr)
    // Bottom accent band
    block(width: 100%, height: 6pt, fill: palette.primary)
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.accent,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 2em, weight: "semibold")
  touying-slide(
    self: self,
    align(horizon + center, block(width: 100%, inset: (x: 1em), body)),
  )
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    set align(center + horizon)
    set text(fill: white)
    stack(
      spacing: 0.8em,
      block(width: 5em, height: 3pt, fill: white.transparentize(50%), radius: 1.5pt),
      text(size: 2.4em, weight: "bold", body),
      block(width: 5em, height: 3pt, fill: white.transparentize(50%), radius: 1.5pt),
    )
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// KPI metric card with large value and optional trend indicator
#let kpi-card(label, value, trend: none, trend-color: none) = {
  let t-color = if trend-color != none { trend-color } else { palette.text-light }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.gray-medium.lighten(40%),
    inset: (x: 1em, y: 0.8em),
    radius: 6pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      text(fill: palette.text-dark, size: 1.55em, weight: "bold", value),
      text(fill: palette.text-light, size: 0.72em, label),
      if trend != none {
        text(fill: t-color, size: 0.65em, weight: "bold", trend)
      },
      lazy-v(1fr),
    )
  ]
}

/// Blue-accented insight/takeaway box with left border
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.primary.lighten(92%),
    stroke: (left: 4pt + palette.primary),
    inset: 14pt,
    radius: (right: 6pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: palette.primary, size: 0.95em, title),
      {
        set text(fill: palette.text-dark, size: 0.85em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Compact themed key for data-series legends
#let series-key(label, color: palette.primary) = stack(
  dir: ltr,
  spacing: 4pt,
  box(rect(width: 16pt, height: 12pt, fill: color, radius: 2pt)),
  text(size: 0.8em, fill: palette.text-light, label),
)

/// Styled data table with blue header row
#let data-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary }
      else if calc.odd(row) { palette.card-bg } else { palette.gray-light },
    stroke: 0.5pt + palette.gray-medium.lighten(40%),
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-dark, size: 0.85em, c)),
  )
}

/// Numbered pillar/step card with blue number badge
#let pillar-card(number, title, description) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.gray-medium.lighten(40%),
    inset: 1em,
    radius: 6pt,
  )[
    #stack(
      spacing: 0.8em,
      box(
        fill: palette.primary,
        width: 1.8em,
        height: 1.8em,
        radius: 0.9em,
        inset: 0pt,
      )[
        #set align(center + horizon)
        #set text(fill: white, weight: "bold", size: 0.9em)
        #number
      ],
      text(weight: "semibold", fill: palette.text-dark, size: 1em, title),
      {
        set text(fill: palette.text-light, size: 0.8em)
        description
      },
      lazy-v(1fr),
    )
  ]
}

// ═══ 3. Theme Entry Point ═══

#let corporate-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: white,
      neutral-darkest: palette.text-dark,
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
