// Ruled-Page Theme — Minimalist Notebook-Page Design
// A freshly opened ruled notebook: warm off-white background with restrained
// ruled-line accents. Pencil gray text. Terracotta accent sparingly.
// Perfect for academic lab meetings, paper readings, research presentations.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  paper: rgb("#FFFEF9"),       // warm off-white notebook paper
  text: rgb("#4B4B4B"),        // pencil gray — body text
  dark: rgb("#333333"),        // darker pencil — titles
  muted: rgb("#707070"),       // accessible pencil gray — metadata, footers
  rule-line: rgb("#E8E4DF"),   // faint ruled line color
  accent: rgb("#C75C2A"),      // terracotta — sparingly for emphasis
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
    block(width: 100%, inset: (x: 2em, top: 0.8em, bottom: 0.5em))[
      #set text(size: 0.65em, fill: palette.muted)
      #stack(
        spacing: .8em,
        utils.display-current-heading(level: 1),
        {
          set text(size: 1.4em, fill: palette.dark, weight: "medium")
          if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        },
        line(length: 100%, stroke: 1.2pt + palette.accent)
      )
    ]
  }
  let footer(self) = {
    set std.align(bottom)
    pad(x: 2em, bottom: 0.6em)[
      #set text(size: 0.65em, fill: palette.muted)
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
        context {
          utils.slide-counter.display() + " / " + utils.last-slide-number
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
    pad(x: 72pt, y: 56pt)[
      #let metadata = {
        set text(size: 13pt, fill: palette.muted)
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
          text(size: 38pt, weight: "bold", fill: palette.dark, info.title),
          line(length: 80pt, stroke: 2.5pt + palette.accent),
        ),
        if info.subtitle != none {
          stack(
            spacing: .9em,
            text(size: 16pt, fill: palette.text, info.subtitle),
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
    pad(left: 36pt)[
      #stack(
        spacing: .8em,
        line(length: 40pt, stroke: 2pt + palette.accent),
        text(size: 32pt, weight: "semibold", fill: palette.dark,
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
      fill: palette.paper,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: palette.dark, size: 1.8em, weight: "bold")
  touying-slide(self: self, align(horizon + center, block(width: 80%, body)))
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.paper,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: palette.dark, size: 2.2em, weight: "semibold")
  touying-slide(
    self: self,
    align(center + horizon, stack(
      spacing: .8em,
      line(length: 60pt, stroke: 2.5pt + palette.accent),
      body,
    )),
  )
})


// ═══ 2. Reusable Components ═══

#let ruled-card(title, body) = {
  block(
    width: 100%,
    stroke: (left: 2.5pt + palette.accent),
    inset: (left: 14pt, y: 10pt, right: 10pt),
    fill: palette.paper,
  )[
    #stack(spacing: .8em,
      [#text(weight: "semibold", size: 1.05em, fill: palette.dark, title)],
      [#body
       #lazy-v(1fr)]
    )
  ]
}

#let margin-note(body) = {
  block(
    width: 100%,
    inset: (left: 16pt, y: 8pt, right: 8pt),
    stroke: (left: 1.5pt + palette.muted),
  )[
    #set text(size: 0.9em, style: "italic", fill: palette.text)
    #body
    #lazy-v(1fr)
  ]
}

#let divider() = {
  block(width: 100%, inset: (y: 8pt))[
    #line(length: 100%, stroke: 0.6pt + palette.rule-line)
  ]
}



// ═══ 3. Theme Entry Point ═══

#let ruled-page-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      fill: palette.paper,
      margin: (top: 3em, bottom: 2em, x: 2em),
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
        set enum(numbering: n => text(size: 22pt, weight: "bold", fill: palette.accent)[#n.], body-indent: 10pt, spacing: 14pt)
        show heading.where(level: 2): it => {
          text(size: 26pt, weight: "medium", fill: palette.dark, it.body)
        }
        body
      },
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.accent,
      neutral-lightest: palette.paper,
      neutral-darkest: palette.dark,
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
