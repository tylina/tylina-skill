// Rosewood Theme — A warm, earthy Touying theme
// Inspired by rosewood furniture: rich browns, warm reds, and cream tones.
// Perfect for architecture, interior design, history, or premium brand presentations.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#5D4037"),
  secondary: rgb("#795548"),
  accent: rgb("#A1887F"),
  accent-light: rgb("#D7CCC8"),
  warm-red: rgb("#BF360C"),
  bg: rgb("#EFEBE9"),
  card-bg: rgb("#FFFFFF"),
  deep: rgb("#3E2723"),
  text-dark: rgb("#3E2723"),
  text-light: rgb("#795548"),
  cream: rgb("#FFF8E1"),
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
    show: components.cell.with(fill: palette.primary, inset: (x: 1em, y: .65em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.cream, size: .65em)
        utils.display-current-heading(level: 1)
      },
      {
        set text(fill: palette.cream, size: 1.35em, weight: "medium")
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
    show: pad.with(x: .6em, y: .35em)
    set text(fill: palette.text-light, size: .75em)
    block(width: 100%)[
      #grid(
        columns: (1fr, auto, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        [],
        {
          set std.align(right)
          context { utils.slide-counter.display() + " / " + utils.last-slide-number }
        },
      )
    ]
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
    // Dark brown background
    place(top + left, rect(width: 100%, height: 100%, fill: palette.deep))
    // Subtle wood-grain pattern: thin horizontal lines of varying opacity
    for i in range(0, 30) {
      let y-pos = calc.rem(i * 23 + 7, 100)
      let opacity = calc.rem(i * 17 + 3, 40) + 5
      place(
        top + left,
        dy: y-pos * 1% * (1),
        rect(
          width: 100%,
          height: 0.5pt,
          fill: palette.cream.transparentize(100% - opacity * 1%),
        ),
      )
    }
    // Title text
    v(1fr)
    text(size: 2.4em, fill: palette.cream, weight: "bold", info.title)
    if info.subtitle != none {
      v(0.3em)
      text(size: 1.2em, fill: palette.accent-light, info.subtitle)
    }
    v(0.6em)
    // Decorative thin line
    line(length: 30%, stroke: 1.5pt + palette.warm-red)
    v(0.6em)
    // Author / date / institution in cream
    set text(fill: palette.cream, size: 0.9em)
    if info.author != none {
      block(spacing: 0.5em, info.author)
    }
    if info.date != none {
      block(spacing: 0.5em, utils.display-info-date(self))
    }
    if info.institution != none {
      block(spacing: 0.5em, text(fill: palette.accent-light, info.institution))
    }
    v(1fr)
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.deep,
      margin: (x: 2em, y: 0em),
    ),
  )
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set std.align(center + horizon)
    // Left accent bar
    place(left + top, rect(width: 6pt, height: 100%, fill: palette.warm-red))
    // Section number and title
    block(inset: (left: 2em))[
      #stack(
        spacing: .8em,
        text(size: 1em, fill: palette.text-light)[Section],
        {
          set text(size: 2.2em, fill: palette.primary, weight: "semibold")
          utils.display-current-heading(level: 1)
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 0em,
    ),
  )
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
  set text(fill: palette.cream, size: 2em)
  let main-body = block(width: 90%, inset: (x: .5em))[
    #body
  ]
  touying-slide(self: self, std.align(horizon + center, main-body))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  let content = {
    set std.align(center + horizon)
    place(top + left, rect(width: 100%, height: 100%, fill: palette.deep))
    // Warm decorative lines
    for i in range(0, 15) {
      let y-pos = calc.rem(i * 31 + 11, 100)
      let opacity = calc.rem(i * 13 + 7, 30) + 5
      place(
        top + left,
        dy: y-pos * 1% * (1),
        rect(
          width: 100%,
          height: 0.5pt,
          fill: palette.warm-red.transparentize(100% - opacity * 1%),
        ),
      )
    }
    v(1fr)
    stack(
      spacing: .8em,
      line(length: 20%, stroke: 1pt + palette.warm-red),
      {
        set text(fill: palette.cream, size: 2em, weight: "bold")
        body
      },
      line(length: 20%, stroke: 1pt + palette.warm-red),
    )
    v(1fr)
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.deep,
      margin: (x: 2em, y: 0em),
    ),
  )
  touying-slide(self: self, content)
})

// ═══ 2. Reusable Components ═══

#let wood-card(title, body, accent: none) = {
  let accent-color = if accent != none { accent } else { palette.primary }
  block(
    width: 100%,
    fill: palette.cream,
    stroke: (left: 4pt + accent-color, rest: 0.5pt + palette.accent.lighten(60%)),
    inset: 14pt,
    radius: 3pt,
  )[
    #set text(fill: palette.text-dark)
    #stack(spacing: .8em,
      [#text(weight: "bold", fill: accent-color, size: 1.05em, title)],
      [#body
       #lazy-v(1fr)]
    )
  ]
}

#let chapter-heading(number, title) = {
  set align(left)
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    align: (right + horizon, left + horizon),
    text(size: 3em, fill: palette.warm-red, weight: "bold", str(number)),
    block[
      #stack(
        spacing: .8em,
        line(length: 100%, stroke: 0.5pt + palette.accent),
        text(size: 1.4em, fill: palette.primary, weight: "semibold", title),
      )
    ],
  )
}

#let ornament-divider() = {
  set align(center)
  v(0.4em)
  grid(
    columns: (1fr, auto, 1fr),
    column-gutter: 0.5em,
    align: (right + horizon, center + horizon, left + horizon),
    line(length: 100%, stroke: 0.7pt + palette.accent),
    // Centered diamond ornament: rotated square
    box(width: 8pt, height: 8pt,
      place(center + horizon,
        rotate(45deg, square(size: 6pt, fill: palette.warm-red))
      )
    ),
    line(length: 100%, stroke: 0.7pt + palette.accent),
  )
  v(0.4em)
}

#let quote-block(body, author: none) = {
  block(
    width: 100%,
    inset: (left: 20pt, rest: 14pt),
    stroke: (left: 4pt + palette.warm-red),
    fill: palette.bg,
  )[
    #set text(style: "italic", fill: palette.text-dark, size: 1.05em)
    #if author != none {
      stack(
        spacing: .8em,
        body,
        {
          set text(style: "normal", size: 0.9em, fill: palette.text-light)
          sym.dash.em + " " + author
        },
      )
    } else {
      body
    }
  ]
}

// ═══ 3. Theme Entry Point ═══

#let rosewood-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)

  show heading: set text(fill: palette.primary)

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
      primary: palette.primary,
      secondary: palette.secondary,
      neutral-lightest: palette.cream,
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
