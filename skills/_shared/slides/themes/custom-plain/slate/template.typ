// Slate Theme — Dark professional with amber accents
// Charcoal/slate gray with warm amber highlights
// Perfect for tech product launches, keynotes, sophisticated presentations

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#37474F"),
  bg: rgb("#1a1a2e"),
  card-bg: rgb("#252540"),
  accent: rgb("#FFB74D"),
  accent2: rgb("#4DD0E1"),
  border: rgb("#3a3a5c"),
  text: rgb("#ECEFF1"),
  text-sec: rgb("#90A4AE"),
  code-bg: rgb("#0D1117"),
  code-text: rgb("#C9D1D9"),
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
    block(width: 100%, inset: (x: 2em, top: 0.8em, bottom: 0.5em))[
      #set text(fill: palette.text-sec, size: 0.65em)
      #stack(
        spacing: .8em,
        utils.display-current-heading(level: 1),
        {
          set text(fill: palette.text, size: 1.4em, weight: "medium")
          if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        },
        line(length: 100%, stroke: 1.5pt + palette.accent),
      )
    ]
  }
  let footer(self) = {
    set std.align(bottom)
    pad(x: 2em, bottom: 0.5em)[
      #set text(fill: palette.text-sec, size: 0.7em)
      #grid(
        columns: (1fr, auto, 1fr),
        gutter: 1em,
        align: (left + horizon, center + horizon, right + horizon),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        [],
        text(fill: palette.accent, context {
          utils.slide-counter.display() + " / " + utils.last-slide-number
        }),
      )
    ]
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(self, config-page(header: header, footer: footer))
  touying-slide(self: self, setting: setting, ..args)
})

#let title-slide(..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    margin: 0pt, header: none, footer: none,
  ))
  let info = self.info + args.named()
  let body = {
    set std.align(left + horizon)
    pad(x: 80pt, y: 60pt)[
      #let metadata = {
        set text(size: 13pt, fill: palette.text-sec)
        stack(
          spacing: .8em,
          if info.author != none { info.author },
          if info.institution != none { info.institution },
          if info.date != none { utils.display-info-date(self) },
        )
      }
      #stack(
        spacing: .8em,
        stack(
          spacing: .8em,
          text(size: 44pt, weight: "bold", fill: palette.text, info.title),
          block(width: 100pt, height: 3pt, fill: palette.accent, radius: 1.5pt),
        ),
        if info.subtitle != none {
          stack(
            spacing: 1em,
            text(size: 18pt, fill: palette.text-sec, info.subtitle),
            metadata,
          )
        } else {
          metadata
        },
      )
    ]
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    header: none, footer: none, margin: 2em,
  ))
  let main-body = {
    set std.align(left + horizon)
    pad(left: 40pt)[
      #stack(
        spacing: .8em,
        block(width: 40pt, height: 3pt, fill: palette.accent, radius: 1.5pt),
        text(size: 2em, fill: palette.text, weight: "semibold",
          utils.display-current-heading(level: 1)),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    fill: palette.accent, margin: 2em, header: none, footer: none,
  ))
  set text(fill: palette.bg, size: 2em, weight: "bold")
  touying-slide(
    self: self,
    std.align(horizon + center, block(width: 80%, body)),
  )
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    fill: palette.bg, margin: 2em, header: none, footer: none,
  ))
  let content = {
    set std.align(center + horizon)
    stack(
      spacing: 0.8em,
      block(width: 60pt, height: 2pt, fill: palette.accent, radius: 1pt),
      text(fill: palette.text, size: 2.5em, weight: "semibold", body),
      block(width: 60pt, height: 2pt, fill: palette.accent, radius: 1pt),
    )
  }
  touying-slide(self: self, content)
})

// ═══ 2. Reusable Components ═══

#let slate-card(title, body, accent: none) = {
  let a = if accent != none { accent } else { palette.accent }
  block(
    width: 100%, fill: palette.card-bg,
    stroke: (left: 3pt + a, rest: 0.5pt + palette.border),
    inset: 14pt, radius: 4pt,
  )[
    #set text(fill: palette.text)
    #stack(spacing: .8em,
      [#text(weight: "semibold", fill: a, title)],
      [#body
       #lazy-v(1fr)]
    )
  ]
}

#let badge(label, color: none) = {
  let c = if color != none { color } else { palette.accent }
  box(
    fill: c, inset: (x: 8pt, y: 3pt), radius: 10pt,
  )[
    #text(fill: palette.bg, size: 0.75em, weight: "bold", label)
  ]
}

#let accent-line() = {
  block(width: 100%, inset: (y: 6pt))[
    #line(length: 100%, stroke: 0.8pt + palette.accent.transparentize(60%))
  ]
}

// ═══ 3. Theme Entry Point ═══

#let slate-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      fill: palette.bg,
      margin: (top: 4.5em, bottom: 1.5em, x: 2em),
      header-ascent: 0pt,
      footer-descent: 0pt,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      init: (self: none, body) => {
        set text(fill: palette.text, size: 20pt)
        show heading.where(level: 2): it => {
          text(size: 28pt, weight: "medium", fill: palette.text, it.body)
        }
        show raw.where(block: true): it => {
          block(
            width: 100%, fill: palette.code-bg,
            stroke: 0.5pt + palette.border,
            inset: 10pt, radius: 4pt,
            text(fill: palette.code-text, it),
          )
        }
        show raw.where(block: false): it => {
          box(
            fill: palette.code-bg, inset: (x: 4pt, y: 2pt), radius: 2pt,
            text(fill: palette.accent2, it),
          )
        }
        body
      },
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.accent,
      neutral-lightest: palette.text,
      neutral-darkest: palette.bg,
    ),
    config-store(title: none, align: align, footer: footer),
    ..args,
  )

  body
}
