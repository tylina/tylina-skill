// Nordic Theme — A Touying theme inspired by Scandinavian design
// Muted cool tones, clean lines, airy spacing. Functional and beautiful.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#37474F"),
  secondary: rgb("#546E7A"),
  accent: rgb("#80CBC4"),
  accent-text: rgb("#2F7772"),
  bg: rgb("#ECEFF1"),
  card-bg: rgb("#FFFFFF"),
  warm: rgb("#BCAAA4"),
  text-dark: rgb("#263238"),
  text-light: rgb("#546E7A"),
)

// ═══ Color Palette ═══


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
    show: pad.with(x: 2em, top: 1em, bottom: 0.4em)
    set text(fill: palette.text-dark, size: 1.2em, weight: "medium")
    stack(
      spacing: .8em,
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      },
      block(width: 100%, height: 0.5pt, fill: palette.accent)
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: pad.with(x: 2em, y: 0.5em)
    set text(fill: palette.text-light, size: 0.65em)
    stack(
      spacing: .8em,
      block(width: 100%, height: 0.3pt, fill: palette.bg.darken(10%)),
      grid(
        columns: (1fr, auto, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        [],
        {
          set std.align(right)
          context {
            text(fill: palette.text-light)[
              #utils.slide-counter.display() #h(0.2em) #sym.slash #h(0.2em) #utils.last-slide-number
            ]
          }
        },
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
    set align(left + horizon)
    show: pad.with(x: 4em, y: 2em)
    stack(
      spacing: 0.9em,
      stack(
        spacing: .8em,
        text(size: 2.4em, fill: palette.primary, weight: 600, info.title),
        block(width: 8em, height: 2pt, fill: palette.accent),
      ),
      if info.subtitle != none {
        text(size: 1.1em, fill: palette.secondary, info.subtitle)
      },
      if info.author != none or info.institution != none or info.date != none or info.contact != none {
        stack(
          spacing: .8em,
          if info.author != none { text(size: 0.85em, fill: palette.text-light, info.author) },
          if info.institution != none { text(size: 0.85em, fill: palette.text-light, info.institution) },
          if info.date != none { text(size: 0.85em, fill: palette.text-light, utils.display-info-date(self)) },
          if info.contact != none { text(size: 0.85em, fill: palette.accent-text, info.contact) },
        )
      },
    )
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(left + horizon)
    show: pad.with(x: 4em)
    stack(
      spacing: .8em,
      text(size: 0.8em, fill: palette.text-light, weight: 500, tracking: 0.15em,
        upper[Section]),
      text(size: 2em, fill: palette.primary, weight: 500,
        utils.display-current-heading(level: 1)),
      block(width: 5em, height: 1.5pt, fill: palette.accent),
    )
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 1.8em, weight: "light")
  touying-slide(self: self, align(horizon + center, block(width: 88%)[#body]))
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
  let content = {
    set align(center + horizon)
    stack(
      spacing: .8em,
      {
        set text(fill: white, size: 2em, weight: 500)
        body
      },
      block(width: 4em, height: 1pt, fill: palette.accent),
    )
  }
  touying-slide(self: self, content)
})

// ═══ 2. Reusable Components ═══

/// A card with soft rounded corners, subtle border, and muted accent top bar.
#let hygge-card(title, body) = {
  block(
    width: 100%,
    radius: 6pt,
    clip: true,
    stroke: 0.5pt + palette.bg.darken(8%),
    {
      // Accent top bar
      stack(
        spacing: 0pt,
        block(
          width: 100%,
          fill: palette.accent,
          height: 3pt,
        ),
        // Card body
        block(
          width: 100%,
          fill: palette.card-bg,
          inset: (x: 16pt, top: 12pt, bottom: 14pt),
        )[
          #stack(spacing: .8em,
            [#text(weight: 600, fill: palette.primary, size: 0.95em, title)],
            [#text(fill: palette.text-dark, body)
             #lazy-v(1fr)]
          )
        ]
      )
    },
  )
}

/// A thin muted horizontal separator line.
#let separator() = {
  line(length: 100%, stroke: 0.4pt + palette.warm)
}

// ═══ 3. Theme Entry Point ═══

#let nordic-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)
  set list(marker: text(fill: palette.accent-text, weight: 600)[--])
  show raw.where(block: false): body => box(
    fill: palette.card-bg,
    inset: (x: 4pt, y: 1pt),
    outset: (y: 2pt),
    radius: 2pt,
    { set text(fill: palette.text-dark); body },
  )
  show raw.where(block: true): body => block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + palette.accent-text),
    inset: (x: 12pt, y: 9pt),
    radius: 4pt,
    { set par(justify: false); set text(fill: palette.text-dark); body },
  )

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      fill: palette.bg,
      header-ascent: 30%,
      footer-descent: 30%,
      margin: (top: 3.5em, bottom: 2em, x: 2em),
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
