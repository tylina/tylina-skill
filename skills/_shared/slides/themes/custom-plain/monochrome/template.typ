// Monochrome Theme — Swiss/International Design Style
// Sophisticated black-and-white minimalist theme with strong typography
// Perfect for formal business, design portfolios, architecture presentations

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  black: rgb("#212121"),
  dark: rgb("#424242"),
  medium: rgb("#616161"),
  light: rgb("#E0E0E0"),
  lighter: rgb("#F5F5F5"),
  white: rgb("#FAFAFA"),
)

// ═══ Color Definitions ═══
#let pure-black = rgb("#000000")
#let pure-white = rgb("#FFFFFF")

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
    block(width: 100%, inset: (x: 2em, top: 0.8em, bottom: 0.6em))[
      #stack(
        spacing: .8em,
        {
          set text(size: 0.7em, fill: palette.medium, weight: 500)
          utils.display-current-heading(level: 1)
        },
        {
          set text(size: 1.35em, fill: palette.black, weight: 500)
          if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        },
        block(width: 100%, height: 2.5pt, fill: pure-black)
      )
    ]
  }
  let footer(self) = {
    set std.align(bottom)
    pad(x: 2em, bottom: 0.6em)[
      #grid(
        columns: (1fr, auto, 1fr),
        {
          set text(size: 0.7em, fill: palette.medium, weight: 500)
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        [],
        {
          set std.align(right)
          set text(size: 0.7em, fill: palette.medium, weight: 500)
          context {
            utils.slide-counter.display() + " / " + utils.last-slide-number
          }
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
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

#let title-slide(..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      margin: (top: 0pt, bottom: 0pt, left: 0pt, right: 0pt),
      header: none,
      footer: none,
    ),
  )
  let info = self.info + args.named()
  let body = {
    set align(left + horizon)
    pad(x: 80pt, y: 60pt)[
      #stack(
        spacing: .8em,
        stack(
          spacing: .8em,
          text(size: 44pt, weight: 300, fill: palette.black, info.title),
          line(length: 120pt, stroke: 3pt + pure-black),
        ),
        if info.subtitle != none {
          text(size: 18pt, weight: 400, fill: palette.dark, info.subtitle)
        },
        if info.author != none or info.institution != none or info.date != none {
          stack(
            spacing: .8em,
            if info.author != none { text(size: 14pt, fill: palette.medium, info.author) },
            if info.institution != none { text(size: 14pt, fill: palette.medium, info.institution) },
            if info.date != none { text(size: 14pt, fill: palette.medium, utils.display-info-date(self)) },
          )
        },
      )
    ]
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    set align(left + horizon)
    pad(left: 40pt)[
      #grid(
        columns: (4pt, 1fr),
        column-gutter: 20pt,
        align: horizon,
        block(width: 4pt, height: 64pt, fill: pure-black),
        {
          set text(size: 38pt, weight: 300, fill: palette.black)
          utils.display-current-heading(level: 1)
        },
      )
    ]
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pure-black,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: pure-white, size: 2em, weight: 300)
  touying-slide(self: self, align(horizon + center, block(width: 80%)[#body]))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pure-black,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: pure-white, size: 2.5em, weight: 300)
  touying-slide(self: self, align(center + horizon, block(width: 80%)[#body]))
})

// ═══ 2. Reusable Components ═══

#let mono-card(title, body) = {
  block(
    width: 100%,
    stroke: 1.5pt + palette.black,
    inset: 14pt,
    radius: 0pt,
  )[
    #stack(spacing: .8em,
      [#text(weight: 600, size: 1.05em, fill: palette.black, title)],
      [#body
       #lazy-v(1fr)]
    )
  ]
}

#let quote-block(body, author: none) = {
  block(
    width: 100%,
    inset: (left: 20pt, y: 10pt, right: 10pt),
    stroke: (left: 4pt + pure-black),
  )[
    #set text(style: "italic", size: 1em, fill: palette.dark)
    #stack(spacing: .8em,
      [#body],
      [#if author != none {
         set text(style: "normal", size: 0.85em, fill: palette.medium)
         [— #author]
       }
       #lazy-v(1fr)]
    )
  ]
}

#let divider() = {
  pad(y: 8pt, line(length: 100%, stroke: 0.8pt + palette.light))
}


// ═══ 3. Theme Entry Point ═══

#let monochrome-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set raw(theme: none)
  show raw.where(block: false): body => box(
    fill: palette.lighter,
    inset: (x: 4pt, y: 1pt),
    outset: (y: 2pt),
    radius: 0pt,
    { set text(fill: palette.black); body },
  )
  show raw.where(block: true): body => block(
    width: 100%,
    fill: palette.lighter,
    stroke: (left: 3pt + palette.black),
    inset: (x: 12pt, y: 10pt),
    radius: 0pt,
    { set par(justify: false); set text(fill: palette.black); body },
  )

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      fill: palette.white,
      margin: (top: 3em, bottom: 2em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      init: (self: none, body) => {
        set text(fill: palette.black, size: 20pt)
        set enum(numbering: n => text(size: 24pt, weight: 600, fill: palette.dark)[#n.], body-indent: 12pt, spacing: 16pt)
        show heading.where(level: 2): it => {
          text(size: 28pt, weight: 500, fill: palette.black, it.body)
        }
        body
      },
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.black,
      neutral-lightest: palette.white,
      neutral-darkest: pure-black,
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
