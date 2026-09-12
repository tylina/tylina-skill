// Aurora Theme — A Touying theme inspired by the Northern Lights
// Dark background with vibrant green/purple/cyan gradient accents
// Touying 0.7.4 compatible

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  green: rgb("#00E676"),
  purple: rgb("#7C4DFF"),
  cyan: rgb("#00BCD4"),
  bg: rgb("#0a0e17"),
  card-bg: rgb("#141b2d"),
  border: rgb("#1e2a3a"),
  code-bg: rgb("#0d1117"),
  code-text: rgb("#c9d1d9"),
  text-primary: rgb("#E8EAF6"),
  text-secondary: rgb("#78909C"),
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
    stack(
      spacing: 0pt,
      block(width: 100%, inset: (x: 1.2em, top: 0.8em, bottom: 0.6em), {
        set text(fill: palette.text-primary, size: 0.65em)
        utils.display-current-heading(level: 1)
        linebreak()
        set text(size: 1.6em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      }),
      // Gradient accent line under heading
      block(width: 100%, height: 2pt, fill: gradient.linear(palette.green, palette.purple, palette.cyan))
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: pad.with(0.5em)
    set text(fill: palette.text-secondary, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        set std.align(left)
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set text(fill: palette.green)
        std.align(right, block(width: 2em, {
          set std.align(right)
          context { utils.slide-counter.display() }
        }))
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

#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set std.align(center + horizon)
    stack(
      spacing: 1em,
      // Title with gradient text
      block(width: 90%, {
        set text(
          size: 2.4em,
          weight: "bold",
          fill: gradient.linear(palette.green, palette.purple, palette.cyan),
        )
        info.title
      }),
      // Gradient line decoration
      block(width: 50%, height: 2pt, fill: gradient.linear(palette.green, palette.purple, palette.cyan)),
      if info.subtitle != none {
        text(size: 1.2em, fill: palette.text-secondary, info.subtitle)
      },
      if info.author != none {
        text(fill: palette.text-primary, info.author)
      },
      if info.institution != none {
        text(fill: palette.text-secondary, size: 0.9em, info.institution)
      },
      if info.date != none {
        text(fill: palette.text-secondary, size: 0.85em, utils.display-info-date(self))
      },
    )
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set std.align(center + horizon)
    stack(
      spacing: .8em,
      block(width: 30%, height: 2pt, fill: palette.green),
      {
        set text(size: 2em, fill: palette.green, weight: "semibold")
        utils.display-current-heading(level: 1)
      },
      block(width: 30%, height: 2pt, fill: palette.green),
    )
  }
  let self = utils.merge-dicts(
    self,
    config-page(margin: (y: 1em)),
  )
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg.darken(30%),
      margin: 2em,
    ),
  )
  set text(fill: palette.green, size: 2em, weight: "semibold")
  touying-slide(
    self: self,
    std.align(horizon + center, block(width: 100%, inset: (x: 1em))[#body]),
  )
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 2em,
    ),
  )
  let content = {
    set std.align(center + horizon)
    stack(
      spacing: 1em,
      block(width: 40%, height: 2pt, fill: gradient.linear(palette.green, palette.purple, palette.cyan)),
      {
        set text(fill: palette.text-primary, size: 2em, weight: "semibold")
        body
      },
      block(width: 40%, height: 2pt, fill: gradient.linear(palette.cyan, palette.purple, palette.green)),
    )
  }
  touying-slide(self: self, content)
})

// ═══ 2. Reusable Components ═══

#let aurora-card(title, body, accent: none) = {
  let accent-start = if accent != none { accent } else { palette.green }
  block(
    width: 35em,
    fill: palette.card-bg,
    stroke: (
      left: 3pt + gradient.linear(accent-start, palette.purple, angle: 90deg),
      rest: 0.5pt + palette.border,
    ),
    inset: 14pt,
    radius: 4pt,
  )[
    #set text(fill: palette.text-primary)
    #stack(spacing: .8em,
      [#text(weight: "medium", fill: accent-start, title)],
      [#body
       #lazy-v(1fr)],
    )
  ]
}

#let feature-grid(items) = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: 0.8em,
    row-gutter: 0.7em,
    ..items.map(item => {
      block(
        width: 17em,
        fill: palette.card-bg,
        stroke: (
          top: 2pt + gradient.linear(palette.green, palette.purple),
          rest: 0.5pt + palette.border,
        ),
        inset: 10pt,
        radius: 4pt,
      )[
        #stack(
          spacing: .8em,
          text(weight: "medium", fill: palette.green, size: 0.95em, item.title),
          {
            set text(fill: palette.text-secondary, size: 0.85em)
            item.desc
          },
        )
      ]
    })
  )
}

#let gradient-line(width: 100%) = {
  block(width: width, height: 2pt, fill: gradient.linear(palette.green, palette.purple, palette.cyan))
}

// ═══ 3. Theme Entry Point ═══

#let aurora-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-primary)

  show heading: set text(fill: palette.green)

  // Style raw/code blocks for dark background
  show raw.where(block: true): it => {
    block(
      width: 100%,
      fill: palette.code-bg,
      stroke: 0.5pt + palette.border,
      inset: 8pt,
      radius: 4pt,
      text(fill: palette.code-text, size: 0.72em, it),
    )
  }
  show raw.where(block: false): it => {
    box(
      fill: palette.code-bg,
      inset: (x: 4pt, y: 2pt),
      radius: 2pt,
      text(fill: palette.cyan, it),
    )
  }

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      fill: palette.bg,
      header-ascent: 0pt,
      footer-descent: 0pt,
      margin: (top: 4.5em, bottom: 2em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.green,
      secondary: palette.purple,
      tertiary: palette.cyan,
      neutral-lightest: palette.text-primary,
      neutral-darkest: palette.bg,
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
