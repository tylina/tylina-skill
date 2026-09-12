// Lavender Theme — A soft, elegant Touying theme with purple/lilac tones
// Perfect for wellness, education, psychology, and design presentations.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#7E57C2"),
  secondary: rgb("#AB47BC"),
  accent: rgb("#CE93D8"),
  bg: rgb("#F3E5F5"),
  card-bg: rgb("#FFFFFF"),
  deep: rgb("#4527A0"),
  text-dark: rgb("#311B92"),
  text-light: rgb("#7E57C2"),
  soft: rgb("#E1BEE7"),
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
        set text(fill: palette.deep, size: 1.35em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 54pt, height: 2pt, fill: palette.accent),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: pad.with(.4em)
    set text(fill: palette.text-light, size: .7em)
    grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set text(fill: palette.primary)
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
    set align(center + horizon)
    // Decorative circles in corners
    place(top + left, dx: -30pt, dy: -30pt,
      circle(radius: 60pt, fill: palette.soft.transparentize(40%))
    )
    place(top + left, dx: 20pt, dy: 10pt,
      circle(radius: 25pt, fill: palette.accent.transparentize(50%))
    )
    place(bottom + right, dx: 40pt, dy: 40pt,
      circle(radius: 70pt, fill: palette.soft.transparentize(40%))
    )
    place(bottom + right, dx: -20pt, dy: -10pt,
      circle(radius: 30pt, fill: palette.accent.transparentize(60%))
    )
    place(top + right, dx: 10pt, dy: -20pt,
      circle(radius: 40pt, fill: palette.accent.transparentize(55%))
    )

    let title-items = (
      text(size: 2.2em, fill: palette.deep, weight: "semibold", info.title),
    )
    if info.subtitle != none {
      title-items.push(text(size: 1.2em, fill: palette.text-light, info.subtitle))
    }
    title-items.push(line(length: 30%, stroke: 2pt + palette.accent))

    let metadata = ()
    if info.author != none {
      metadata.push(text(fill: palette.text-dark, size: 0.9em, weight: "medium", info.author))
    }
    if info.institution != none {
      metadata.push(text(fill: palette.text-dark, size: 0.9em, info.institution))
    }
    if info.date != none {
      metadata.push(text(fill: palette.text-dark, size: 0.9em, style: "italic", utils.display-info-date(self)))
    }
    if info.contact != none {
      metadata.push(text(size: 0.9em, fill: palette.text-light, info.contact))
    }
    if metadata.len() > 0 {
      title-items.push(stack(spacing: .8em, ..metadata))
    }

    stack(spacing: .8em, ..title-items)
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)
    stack(
      spacing: .8em,
      line(length: 20%, stroke: 3pt + palette.accent),
      {
        set text(size: 2em, fill: palette.deep, weight: "medium")
        utils.display-current-heading(level: 1)
      },
      line(length: 20%, stroke: 3pt + palette.accent),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 2em,
      header: none,
      footer: none,
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
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 2em)
  let content = block(width: 90%, inset: (x: 0.5em))[#body]
  touying-slide(self: self, align(horizon + center, content))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)
    // Gradient-like effect using layered shapes
    place(center + horizon,
      rect(width: 100%, height: 100%, fill: palette.deep)
    )
    place(bottom + left, dx: -40pt, dy: 30pt,
      circle(radius: 80pt, fill: palette.primary.transparentize(50%))
    )
    place(top + right, dx: 30pt, dy: -30pt,
      circle(radius: 60pt, fill: palette.secondary.transparentize(50%))
    )
    place(bottom + right, dx: 20pt, dy: 20pt,
      circle(radius: 45pt, fill: palette.accent.transparentize(60%))
    )
    set text(fill: white, size: 2em, weight: "semibold")
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.deep,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

#let petal-card(title, body, accent: none) = {
  let accent-color = if accent != none { accent } else { palette.primary }
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (left: 3.5pt + accent-color),
    inset: 14pt,
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      [#text(weight: "semibold", fill: accent-color, size: 1.05em, title)],
      [#body
       #lazy-v(1fr)]
    )
  ]
}

#let soft-box(body) = {
  block(
    width: 100%,
    fill: palette.soft.lighten(30%),
    inset: 14pt,
    radius: 10pt,
  )[
    #body
    #lazy-v(1fr)
  ]
}

// ═══ 3. Theme Entry Point ═══

#let lavender-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt)
  set enum(numbering: n => box(
    width: 26pt, height: 26pt, radius: 13pt, fill: palette.primary,
    std.align(center + horizon, text(fill: white, weight: "bold", size: 0.8em, str(n)))
  ), body-indent: 10pt, spacing: 12pt)

  show raw.where(block: true): it => {
    block(
      width: 100%,
      fill: palette.card-bg,
      stroke: 0.5pt + palette.accent,
      inset: 8pt,
      radius: 4pt,
      text(size: 0.72em, it),
    )
  }

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
