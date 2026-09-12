// Reading Lamp Theme — Warm, intimate, text-focused
// For reading groups and seminar talks — warm cream background,
// dark brown-black text, single warm amber accent
// Like a beautifully typeset book page, not a slide deck.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  cream: rgb("#FBF7F0"),
  ink: rgb("#2C2417"),
  amber: rgb("#C67A1B"),
  ink-light: rgb("#5C4A35"),
  ink-muted: rgb("#80684C"),
  rule-faint: rgb("#E8DFD2"),
)


// === 1. Slide Functions ===

#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    block(width: 100%, inset: (x: 2.4em, top: 0.9em, bottom: 0.5em))[
      #stack(
        spacing: 0.8em,
        {
          set text(size: 0.65em, fill: palette.ink-muted, weight: 500)
          utils.display-current-heading(level: 1)
        },
        {
          set text(size: 1.1em, fill: palette.ink, weight: 600)
          if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        },
        block(width: 80pt, height: 2pt, fill: palette.amber),
      )
    ]
  }
  let footer(self) = {
    set std.align(bottom)
    pad(x: 2.4em, bottom: 0.6em)[
      #set text(size: 0.65em, fill: palette.ink-muted)
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
          context {
            text(fill: palette.ink-muted)[
              #utils.slide-counter.display() / #utils.last-slide-number
            ]
          }
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
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
        spacing: 0.8em,
        stack(
          spacing: 0.8em,
          text(size: 38pt, weight: 600, fill: palette.ink, info.title),
          block(width: 100pt, height: 2.5pt, fill: palette.amber),
        ),
        if info.subtitle != none {
          text(size: 16pt, fill: palette.ink-light, info.subtitle)
        },
        if info.author != none or info.institution != none or info.date != none {
          stack(
            spacing: 0.8em,
            if info.author != none { text(size: 13pt, fill: palette.ink-muted, info.author) },
            if info.institution != none { text(size: 13pt, fill: palette.ink-muted, info.institution) },
            if info.date != none { text(size: 13pt, fill: palette.ink-muted, utils.display-info-date(self)) },
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
    pad(left: 50pt)[
      #grid(
        columns: (3pt, auto),
        column-gutter: 18pt,
        align: horizon,
        block(width: 3pt, height: 50pt, fill: palette.amber),
        text(size: 32pt, weight: 500, fill: palette.ink,
          utils.display-current-heading(level: 1)),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.cream,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: palette.ink, size: 1.6em, weight: 500)
  touying-slide(self: self, align(horizon + center, block(width: 70%, body)))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.cream,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    set align(center + horizon)
    stack(
      spacing: 0.8em,
      text(fill: palette.ink, size: 2.2em, weight: 500, body),
      block(width: 60pt, height: 2pt, fill: palette.amber),
    )
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Lamp card — warm bordered card for key content
#let lamp-card(title, body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + palette.amber, rest: 0.8pt + palette.rule-faint),
    inset: 14pt,
    radius: 0pt,
    fill: palette.cream.darken(1%),
  )[
    #set text(fill: palette.ink-light, size: 0.9em)
    #stack(spacing: .8em,
      text(weight: 600, size: 1.05em, fill: palette.ink, title),
      body,
      lazy-v(1fr),
    )
  ]
}

/// Margin quote — warm blockquote with amber left bar
#let margin-quote(body, author: none) = {
  block(
    width: 100%,
    inset: (left: 20pt, y: 10pt, right: 10pt),
    stroke: (left: 3pt + palette.amber),
  )[
    #set text(style: "italic", size: 0.95em, fill: palette.ink-light)
    #stack(spacing: .8em,
      body,
      if author != none {
        text(style: "normal", size: 0.8em, fill: palette.ink-muted)[— #author]
      },
      lazy-v(1fr),
    )
  ]
}

/// Paper divider — subtle warm horizontal rule
#let paper-divider() = {
  block(width: 100%, inset: (y: 8pt))[
    #line(length: 100%, stroke: 0.6pt + palette.rule-faint)
  ]
}

/// Reading list — numbered items for paper/reading references

/// Annotation — small aside/note block
#let annotation(body) = {
  block(
    width: 100%,
    fill: palette.cream.darken(2%),
    inset: (x: 12pt, y: 8pt),
    radius: 2pt,
    stroke: 0.5pt + palette.rule-faint,
  )[
    #set text(size: 0.85em, fill: palette.ink-muted)
    #body
  ]
}


// === 3. Theme Entry Point ===

#let reading-lamp-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(fill: palette.ink, size: 20pt)
  set enum(
    numbering: n => text(size: 20pt, weight: 600, fill: palette.amber)[#n.],
    body-indent: 10pt,
    spacing: 14pt,
  )

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      fill: palette.cream,
      margin: (top: 3.2em, bottom: 2em, x: 2.4em),
      header-ascent: 0pt,
      footer-descent: 0pt,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.amber,
      neutral-lightest: palette.cream,
      neutral-darkest: palette.ink,
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
