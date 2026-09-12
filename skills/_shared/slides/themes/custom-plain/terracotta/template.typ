// Terracotta Theme — Mediterranean warm earth tones
// Burnt orange, clay, olive green, sandy tones
// Perfect for travel, culture, food, architecture presentations

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#BF5B21"),
  secondary: rgb("#D4845A"),
  accent: rgb("#6B7F3B"),
  accent-deep: rgb("#5D7132"),
  bg: rgb("#FDF6ED"),
  card-bg: rgb("#FFFFFF"),
  deep: rgb("#8B3A0F"),
  text-dark: rgb("#3B2316"),
  text-light: rgb("#795548"),
  sand: rgb("#E8D5B7"),
)

// ═══ Color Definitions ═══

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
      stack(
        dir: ltr,
        spacing: 3pt,
        block(width: 42pt, height: 3pt, fill: palette.primary),
        block(width: 12pt, height: 3pt, fill: palette.sand),
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
      box(circle(radius: 2.5pt, fill: palette.primary)),
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
    self, config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

#let title-slide(..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    fill: palette.bg, margin: 0pt, header: none, footer: none,
  ))
  let info = self.info + args.named()
  let body = {
    // Decorative arch at top center
    place(top + center, dy: -30pt)[
      #circle(radius: 120pt, fill: palette.sand.transparentize(50%))
    ]
    place(top + left, dx: -40pt, dy: -20pt)[
      #circle(radius: 60pt, fill: palette.secondary.transparentize(80%))
    ]
    place(bottom + right, dx: 30pt, dy: 20pt)[
      #circle(radius: 80pt, fill: palette.accent.transparentize(85%))
    ]
    set std.align(center + horizon)
    let title-items = (
      text(size: 42pt, weight: "bold", fill: palette.deep, info.title),
      line(length: 100pt, stroke: 2.5pt + palette.primary),
    )
    if info.subtitle != none {
      title-items.push(text(size: 18pt, fill: palette.deep, info.subtitle))
    }
    let metadata = ()
    if info.author != none {
      metadata.push(text(size: 14pt, fill: palette.text-light, info.author))
    }
    if info.institution != none {
      metadata.push(text(size: 14pt, fill: palette.text-light, info.institution))
    }
    if info.date != none {
      metadata.push(text(size: 14pt, fill: palette.text-light, utils.display-info-date(self)))
    }
    if metadata.len() > 0 {
      title-items.push(stack(spacing: .8em, ..metadata))
    }
    pad(x: 80pt, stack(spacing: .8em, ..title-items))
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set std.align(center + horizon)
    stack(
      spacing: .8em,
      line(length: 60pt, stroke: 2pt + palette.primary),
      text(
        size: 2em,
        fill: palette.deep,
        weight: "semibold",
        utils.display-current-heading(level: 1),
      ),
      line(length: 60pt, stroke: 2pt + palette.primary),
    )
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    fill: palette.deep, margin: 2em, header: none, footer: none,
  ))
  set text(fill: palette.sand, size: 2em, weight: "bold")
  let main-body = block(width: 100%, inset: (x: 1em))[#body]
  touying-slide(self: self, std.align(horizon + center, main-body))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    fill: palette.primary, margin: 2em, header: none, footer: none,
  ))
  set text(fill: palette.bg, size: 2.5em, weight: "bold")
  touying-slide(self: self, std.align(center + horizon, body))
})

// ═══ 2. Reusable Components ═══

#let clay-card(title, body, accent: none) = {
  let border-color = if accent != none { accent } else { palette.primary }
  block(
    width: 100%, fill: palette.sand.lighten(40%),
    stroke: (top: 3pt + border-color, rest: 0.5pt + palette.sand),
    inset: 14pt, radius: 6pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.deep, title),
      [#body
       #lazy-v(1fr)],
    )
  ]
}

#let olive-tag(label) = {
  box(
    fill: palette.accent-deep, inset: (x: 8pt, y: 3pt), radius: 10pt,
  )[
    #text(fill: white, size: 0.8em, weight: "bold", label)
  ]
}

#let arch-divider() = {
  block(
    width: 100%,
    inset: (y: 6pt),
    align(center, stack(
      dir: ltr,
      spacing: 4pt,
      line(length: 80pt, stroke: 0.8pt + palette.sand),
      box(circle(radius: 4pt, fill: palette.primary)),
      line(length: 80pt, stroke: 0.8pt + palette.sand),
    )),
  )
}

// ═══ 3. Theme Entry Point ═══

#let terracotta-theme(
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
      margin: (top: 4em, bottom: 2em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.deep,
      neutral-lightest: palette.bg,
      neutral-darkest: palette.text-dark,
    ),
    config-store(title: none, align: align, footer: footer),
    ..args,
  )

  body
}
