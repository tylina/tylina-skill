// Midnight Theme — A dark, elegant Touying theme
// Inspired by a midnight sky with deep navy blue tones
// Designed for tech conferences and professional presentations
// Touying 0.7.4 compatible

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#4fc3f7"),
  bg: rgb("#0d1b2a"),
  card-bg: rgb("#1b2838"),
  accent: rgb("#4fc3f7"),
  accent2: rgb("#7c4dff"),
  text: rgb("#e0e0e0"),
  text-sec: rgb("#90a4ae"),
  code-bg: rgb("#0a1628"),
  code-text: rgb("#c5e1f5"),
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
    set std.align(top + left)
    show: components.cell.with(fill: palette.bg, inset: (x: 2em, top: 0.7em, bottom: 0.2em))
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-sec, size: 0.6em, weight: "medium")
        utils.display-current-heading(level: 1)
      },
      {
        set text(fill: palette.text, size: 1.25em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(
        width: 64pt,
        height: 2pt,
        fill: gradient.linear(palette.accent, palette.accent2),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(fill: palette.bg, inset: (x: 2em, y: 0.4em))
    set text(fill: palette.text-sec, size: 0.7em)
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
    // Star-like decorative dots
    place(top + left, dx: 8%, dy: 15%,
      circle(radius: 2pt, fill: palette.accent.transparentize(40%)))
    place(top + right, dx: -12%, dy: 10%,
      circle(radius: 1.5pt, fill: palette.accent2.transparentize(50%)))
    place(top + right, dx: -25%, dy: 20%,
      circle(radius: 1pt, fill: palette.accent.transparentize(60%)))
    place(bottom + left, dx: 15%, dy: -18%,
      circle(radius: 1.5pt, fill: palette.accent2.transparentize(40%)))
    place(bottom + right, dx: -10%, dy: -25%,
      circle(radius: 2pt, fill: palette.accent.transparentize(50%)))
    place(top + left, dx: 35%, dy: 12%,
      circle(radius: 1pt, fill: palette.text-sec.transparentize(60%)))
    place(bottom + left, dx: 40%, dy: -12%,
      circle(radius: 1pt, fill: palette.accent.transparentize(70%)))
    place(bottom + right, dx: -35%, dy: -15%,
      circle(radius: 1.5pt, fill: palette.accent2.transparentize(55%)))

    let headline = (
      text(size: 2.2em, fill: palette.text, weight: "bold", info.title),
      align(center, line(
        length: 40%,
        stroke: 2pt + gradient.linear(palette.accent, palette.accent2),
      )),
    )
    if info.subtitle != none {
      headline.push(text(size: 1.2em, fill: palette.accent, info.subtitle))
    }

    let metadata = ()
    if info.author != none {
      metadata.push(text(size: 1em, fill: palette.text, info.author))
    }
    if info.institution != none {
      metadata.push(text(size: 0.85em, fill: palette.text-sec, info.institution))
    }
    if info.date != none {
      metadata.push(text(size: 0.85em, fill: palette.text-sec, utils.display-info-date(self)))
    }

    let groups = (stack(spacing: .8em, ..headline),)
    if metadata.len() > 0 {
      groups.push(stack(spacing: .8em, ..metadata))
    }
    block(inset: (x: 2em))[#stack(spacing: .8em, ..groups)]
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: (x: 2em, y: 2em),
    ),
  )
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)
    stack(
      spacing: .8em,
      line(length: 20%, stroke: 1.5pt + palette.accent.transparentize(50%)),
      {
        set text(size: 2em, fill: palette.text, weight: "semibold")
        utils.display-current-heading(level: 1)
      },
      line(length: 20%, stroke: 1.5pt + palette.accent2.transparentize(50%)),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 2em,
    ),
  )
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let content = {
    set align(horizon + center)
    set text(fill: palette.text, size: 2em, weight: "semibold")
    // Top decorative accent line
    place(top + center, dy: 1.5em,
      line(length: 30%, stroke: 2pt + palette.accent.transparentize(40%)))
    block(width: 88%, inset: (x: 0.5em))[#body]
    // Bottom decorative accent line
    place(bottom + center, dy: -1.5em,
      line(length: 30%, stroke: 2pt + palette.accent2.transparentize(40%)))
  }
  touying-slide(self: self, content)
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let content = {
    set align(center + horizon)
    // Star decorations
    place(top + left, dx: 10%, dy: 20%,
      circle(radius: 2pt, fill: palette.accent.transparentize(40%)))
    place(top + right, dx: -15%, dy: 15%,
      circle(radius: 1.5pt, fill: palette.accent2.transparentize(40%)))
    place(bottom + left, dx: 20%, dy: -20%,
      circle(radius: 1pt, fill: palette.accent.transparentize(60%)))
    place(bottom + right, dx: -12%, dy: -18%,
      circle(radius: 2pt, fill: palette.accent2.transparentize(50%)))

    stack(
      spacing: .8em,
      text(size: 2.2em, fill: palette.text, weight: "semibold", body),
      line(length: 25%, stroke: 2pt + gradient.linear(palette.accent, palette.accent2)),
    )
  }
  touying-slide(self: self, content)
})


// ═══ 2. Reusable Components ═══

/// A card with a glowing border effect, simulating a box-shadow glow.
#let glow-card(title, body, accent: none) = {
  let glow-color = if accent != none { accent } else { palette.accent }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (
      left: 3pt + glow-color,
      rest: 1pt + glow-color.transparentize(70%),
    ),
    inset: 14pt,
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      [#text(weight: "semibold", fill: glow-color, size: 1em, title)],
      [#text(fill: palette.text, body)
       #lazy-v(1fr)]
    )
  ]
}

/// A metric/KPI display card for dashboards.
#let stat-card(label, value, trend: none) = {
  let metric-items = (
    text(fill: palette.accent, size: 1.8em, weight: "bold", value),
    text(fill: palette.text-sec, size: 0.8em, label),
  )
  if trend != none {
    metric-items.push(text(fill: palette.text-sec, size: 0.75em, trend))
  }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.accent.transparentize(70%),
    inset: 14pt,
    radius: 6pt,
  )[
    #align(center)[#stack(spacing: .8em, ..metric-items)]
    #lazy-v(1fr)
  ]
}


// ═══ 3. Theme Entry Point ═══

#let midnight-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text)
  set list(marker: box(baseline: .6em, circle(radius: .2em, fill: palette.accent)))

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      fill: palette.bg,
      header-ascent: 30%,
      footer-descent: 30%,
      margin: (top: 4em, bottom: 2em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
      init: (self: none, body) => {
        // Dark theme text styling
        set text(fill: palette.text)
        // Style headings for dark background
        show heading: set text(fill: palette.accent)
        // Style strong/bold
        show strong: set text(fill: palette.text)
        // Style code blocks for dark background
        show raw.where(block: true): it => block(
          width: 100%,
          fill: palette.code-bg,
          stroke: 1pt + palette.accent.transparentize(80%),
          inset: 10pt,
          radius: 4pt,
          text(fill: palette.code-text, it),
        )
        show raw.where(block: false): it => {
          box(
            fill: palette.code-bg,
            inset: (x: 4pt, y: 2pt),
            radius: 2pt,
            text(fill: palette.accent, it),
          )
        }
        body
      },
    ),
    config-colors(
      primary: palette.primary,
      neutral-lightest: palette.text,
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
