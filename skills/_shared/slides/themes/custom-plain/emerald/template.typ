// Emerald Theme — A luxurious Touying theme with emerald green and gold accents
// Designed for premium finance reports, luxury brand presentations, and high-end corporate events.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/cheq:0.4.0": checklist


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#1B5E20"),
  secondary: rgb("#2E7D32"),
  accent: rgb("#43A047"),
  gold: rgb("#FFB300"),
  gold-light: rgb("#FFD54F"),
  bg: rgb("#F1F8E9"),
  card-bg: rgb("#FFFFFF"),
  deep: rgb("#0D3B0E"),
  text-dark: rgb("#1B2631"),
  text-light: rgb("#546E7A"),
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
    set std.align(top + left)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.25em))
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-light, size: 0.65em, weight: "medium")
        utils.display-current-heading(level: 1)
      },
      {
        set text(fill: palette.primary, size: 1.35em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 54pt, height: 2pt, fill: palette.gold),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: pad.with(0.4em)
    set text(fill: palette.text-light, size: 0.8em)
    grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      box(
        fill: palette.gold.lighten(70%),
        inset: (x: 8pt, y: 3pt),
        radius: 3pt,
        text(fill: palette.deep, size: 0.85em, weight: "medium",
          context { utils.slide-counter.display() + " / " + utils.last-slide-number }
        ),
      ),
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

#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set align(center + horizon)
    // Diamond ornament above title
    place(top + center, dy: 12%,
      {
        let diamond-size = 8pt
        box(
          width: diamond-size, height: diamond-size,
          fill: palette.gold,
          rotate(45deg, reflow: true, square(size: diamond-size, fill: palette.gold)),
        )
      }
    )
    let title-items = (
      text(size: 2.4em, fill: white, weight: "semibold", info.title),
      line(length: 40%, stroke: 2pt + palette.gold),
    )
    if info.subtitle != none {
      title-items.push(text(size: 1.2em, fill: palette.gold-light, info.subtitle))
    }

    let metadata = ()
    if info.author != none {
      metadata.push(text(size: 1em, fill: white.transparentize(15%), info.author))
    }
    if info.institution != none {
      metadata.push(text(size: 0.9em, fill: white.transparentize(15%), info.institution))
    }
    if info.date != none {
      metadata.push(text(size: 0.85em, fill: white.transparentize(15%), utils.display-info-date(self)))
    }
    if metadata.len() > 0 {
      title-items.push(stack(spacing: .8em, ..metadata))
    }

    stack(spacing: .8em, ..title-items)
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.deep,
      margin: 2em,
    ),
  )
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)
    stack(
      spacing: .8em,
      line(length: 20%, stroke: 2pt + palette.gold),
      {
        set text(size: 2em, fill: palette.primary, weight: "medium")
        utils.display-current-heading(level: 1)
      },
      line(length: 20%, stroke: 2pt + palette.gold),
    )
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.deep,
      margin: 2em,
    ),
  )
  set text(fill: palette.gold, size: 2em, weight: "semibold")
  let content = block(width: 90%, inset: (x: 0.5em))[#body]
  touying-slide(self: self, align(horizon + center, content))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.deep,
      margin: 2em,
    ),
  )
  let content = {
    set align(center + horizon)
    set text(fill: white, size: 2em, weight: "semibold")
    stack(
      spacing: .8em,
      body,
      line(length: 25%, stroke: 1.5pt + palette.gold),
      {
        let sz = 6pt
        box(
          width: sz, height: sz,
          rotate(45deg, reflow: true, square(size: sz, fill: palette.gold)),
        )
      },
    )
  }
  touying-slide(self: self, content)
})

// ═══ 2. Reusable Components ═══

// Card with gold top border and green-tinted background
#let gem-card(title, body, accent: none) = {
  let accent-color = if accent != none { accent } else { palette.gold }
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (top: 3pt + accent-color, rest: 0.5pt + palette.accent.lighten(60%)),
    inset: 14pt,
    radius: (top: 0pt, bottom: 4pt),
  )[
    #stack(spacing: .8em,
      [#text(weight: "semibold", fill: palette.primary, size: 1.05em, title)],
      [#body
       #lazy-v(1fr)]
    )
  ]
}

// Large value display for financial data
#let value-display(label, value) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.5pt + palette.accent.lighten(50%),
    inset: 14pt,
    radius: 4pt,
  )[
    #align(center)[
      #stack(
        spacing: .8em,
        text(fill: palette.text-light, size: 0.8em, weight: "medium", upper(label)),
        text(fill: palette.primary, size: 1.8em, weight: "bold", value),
      )
    ]
  ]
}

// Decorative gold divider with diamond in center
#let gold-divider() = {
  block(
    width: 100%,
    inset: (y: 0.3em),
    grid(
      columns: (1fr, auto, 1fr),
      column-gutter: 8pt,
      align: horizon,
      line(length: 100%, stroke: 1pt + palette.gold.lighten(30%)),
      {
        let sz = 5pt
        box(
          width: sz, height: sz,
          rotate(45deg, reflow: true, square(size: sz, fill: palette.gold)),
        )
      },
      line(length: 100%, stroke: 1pt + palette.gold.lighten(30%)),
    ),
  )
}

// ═══ 3. Theme Entry Point ═══

#let emerald-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)

  show: checklist.with(
    marker-map: ("x": text(fill: palette.accent, weight: "bold", size: 1.1em)[#sym.checkmark])
  )

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      margin: (top: 4em, bottom: 2em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      secondary: palette.secondary,
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
