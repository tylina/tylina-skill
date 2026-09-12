// Sunset Theme — A warm, gradient-rich Touying theme
// Inspired by sunset colors: deep amber, orange, golden yellow, and deep purple.
// Perfect for motivational talks, creative showcases, and storytelling.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#FF6F00"),
  primary-deep: rgb("#B54708"),
  secondary: rgb("#FF8F00"),
  tertiary: rgb("#6A1B9A"),
  bg: rgb("#FFF8E1"),
  card-bg: rgb("#FFFFFF"),
  accent-warm: rgb("#FFD54F"),
  text-dark: rgb("#3E2723"),
  text-light: rgb("#795548"),
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
    show: components.cell.with(inset: (x: 2em, top: .55em, bottom: .1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-light, size: .6em, weight: "medium")
        utils.display-current-heading(level: 1)
      },
      {
        set text(fill: palette.text-dark, size: 1.25em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(
        width: 52pt,
        height: 3pt,
        fill: gradient.linear(palette.primary, palette.secondary, angle: 0deg),
        radius: 1.5pt,
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: .35em))
    set text(fill: palette.text-light, size: .7em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      box(block(
        width: 24pt,
        height: 2pt,
        fill: gradient.linear(palette.primary, palette.secondary, angle: 0deg),
        radius: 1pt,
      )),
      {
        set std.align(right)
        context { utils.slide-counter.display() + " / " + utils.last-slide-number }
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
    // Decorative sun circle in background
    place(top + right, dx: -1em, dy: 1em,
      circle(radius: 3.5em, fill: palette.accent-warm.transparentize(70%))
    )
    place(top + right, dx: -2.5em, dy: 2.5em,
      circle(radius: 2em, fill: palette.primary.transparentize(80%))
    )
    // Small accent circle bottom-left
    place(bottom + left, dx: 2em, dy: -2em,
      circle(radius: 1.5em, fill: palette.tertiary.transparentize(85%))
    )
    let title-block = block(
      width: 85%,
      inset: (x: 1.5em, y: 1.2em),
      radius: 8pt,
      fill: gradient.linear(palette.primary, palette.secondary, angle: 0deg),
    )[
      #set text(size: 2em, fill: palette.text-dark, weight: "bold")
      #set align(center)
      #info.title
    ]
    let details = ()
    if info.subtitle != none {
      details.push(text(size: 1.2em, fill: palette.text-light, info.subtitle))
    }
    if info.author != none {
      details.push(text(weight: "bold", fill: palette.text-dark, info.author))
    }
    if info.date != none {
      details.push(text(fill: palette.text-light, utils.display-info-date(self)))
    }
    if info.institution != none {
      details.push(text(fill: palette.text-light, size: 0.9em, info.institution))
    }
    stack(spacing: .8em, title-block, ..details)
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set std.align(center + horizon)
    stack(
      spacing: .8em,
      block(
        width: 30%,
        height: 3pt,
        fill: gradient.linear(palette.primary, palette.secondary, angle: 0deg),
      ),
      text(
        size: 2em,
        fill: palette.primary-deep,
        weight: "semibold",
        style: "italic",
        utils.display-current-heading(level: 1),
      ),
      block(width: 20%, height: 2pt, fill: palette.accent-warm),
    )
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.primary-deep, palette.tertiary, angle: 135deg),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 1.8em)
  let main-body = block(width: 100%, inset: (x: 1em))[#body]
  touying-slide(self: self, std.align(horizon + center, main-body))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.secondary,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: palette.text-dark, size: 2em, weight: "bold")
  touying-slide(self: self, std.align(center + horizon, body))
})


// ═══ 2. Reusable Components ═══

#let warm-card(title, body, accent: none) = {
  let accent-color = if accent != none { accent } else { palette.primary-deep }
  block(
    width: 100%,
    fill: accent-color.lighten(92%),
    stroke: (left: 4pt + accent-color),
    inset: 12pt,
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      [#text(weight: "bold", fill: accent-color, size: 1.05em, title)],
      [#body
       #lazy-v(1fr)]
    )
  ]
}

#let timeline-item(year, title, description) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    align: (center, left),
    // Year badge
    block(
      fill: palette.primary-deep,
      inset: (x: 10pt, y: 5pt),
      radius: 14pt,
    )[
      #text(fill: white, weight: "bold", size: 0.85em, year)
    ],
    // Description block
    block(inset: (y: 2pt))[
      #text(weight: "bold", fill: palette.text-dark, title) \
      #text(fill: palette.text-light, size: 0.9em, description)
    ],
  )
}

#let callout(body, icon: "!") = {
  block(
    width: 100%,
    fill: palette.accent-warm.lighten(60%),
    stroke: 1.5pt + palette.accent-warm,
    inset: 12pt,
    radius: 6pt,
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (center + horizon, left),
      block(
        fill: palette.primary-deep,
        inset: (x: 8pt, y: 4pt),
        radius: 50%,
      )[#text(fill: white, weight: "bold", size: 1.1em, icon)],
      text(fill: palette.text-dark, body),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let sunset-theme(
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
      margin: (top: 4em, bottom: 2em, x: 2em),
      fill: palette.bg,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary-deep,
      secondary: palette.secondary,
      tertiary: palette.tertiary,
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
