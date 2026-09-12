// CMB Bank Theme — A brand-consistent financial presentation theme
// Inspired by China Merchants Bank (招商银行) design system
// Features: red brand header strip, large translucent chapter numerals,
//   finance blue accent for case storytelling, structured card layouts
// Perfect for banking product intros, financial solutions, customer cases, training
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  red: rgb("#C8152D"),
  deep-red: rgb("#8F0F1B"),
  signal: rgb("#E26A74"),
  blue: rgb("#2175D9"),
  bg: rgb("#FFFFFF"),
  bg-light: rgb("#F5F5F5"),
  card-bg: rgb("#FFFFFF"),
  text-dark: rgb("#1F1F1F"),
  text-body: rgb("#4A4A4A"),
  text-light: rgb("#6F6F6F"),
  border: rgb("#E9E9E9"),
)

// ═══ 1. Slide Functions ═══

/// Content slide — white bg, red top bar, bold dark title, footer with page number
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Brand red top bar
    block(width: 100%, height: 4pt, fill: palette.red)
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 16pt,
      block(width: 100%, {
        set std.align(left)
        set text(fill: palette.text-dark, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      }),
      block(width: 70pt, height: 3pt, fill: palette.red, radius: 1.5pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    block(width: 100%, grid(
        columns: (1fr, auto, 1fr),
        column-gutter: 0.6em,
        {
          set std.align(left + horizon)
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        std.align(center + horizon, stack(
          dir: ltr,
          spacing: 3pt,
          box(width: 22pt, height: 2pt, fill: palette.red.transparentize(55%), radius: 1pt),
          box(width: 8pt, height: 2pt, fill: palette.signal.transparentize(45%), radius: 1pt),
          box(width: 4pt, height: 2pt, fill: palette.blue.transparentize(45%), radius: 1pt),
        )),
        std.align(right + horizon, box(width: 4em, std.align(right, context {
          let current = utils.slide-counter.get().first()
          let total = utils.last-slide-counter.final().first()
          text(size: 0.85em, str(current) + " / " + str(total))
        }))),
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

/// Title slide — red gradient bg, white title, centered card design
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Red gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.red, palette.deep-red, angle: 135deg),
    ))
    // Decorative circles
    place(top + right, dx: -40pt, dy: 30pt,
      circle(radius: 110pt, fill: white.transparentize(93%)))
    place(bottom + left, dx: 50pt, dy: -40pt,
      circle(radius: 130pt, fill: white.transparentize(94%)))
    place(top + left, dx: 80pt, dy: 80pt,
      circle(radius: 55pt, fill: white.transparentize(92%)))
    place(bottom + right, dx: -100pt, dy: -80pt,
      circle(radius: 70pt, fill: white.transparentize(95%)))
    // Center content card
    set align(center + horizon)
    block(
      width: 80%,
      fill: white,
      stroke: 0.5pt + rgb(0, 0, 0, 15),
      radius: 12pt,
      inset: (x: 2.5em, y: 2em),
    )[
      #set align(center)
      #stack(
        dir: ttb,
        spacing: 1em,
        stack(
          dir: ttb,
          spacing: .8em,
          text(size: 2.2em, weight: "bold", fill: palette.deep-red, info.title),
          if info.subtitle != none {
            text(size: 0.9em, fill: palette.text-body, info.subtitle)
          },
        ),
        stack(
          dir: ltr,
          spacing: 4pt,
          box(width: 70pt, height: 3pt, fill: palette.red),
          box(width: 30pt, height: 3pt, fill: palette.signal),
          box(width: 15pt, height: 3pt, fill: palette.blue),
        ),
        stack(
          dir: ttb,
          spacing: .8em,
          if info.author != none {
            text(size: 1.1em, weight: "bold", fill: palette.text-dark, info.author)
          },
          if info.institution != none {
            text(size: 0.85em, fill: palette.text-body, info.institution)
          },
          if info.date != none {
            stack(
              dir: ttb,
              spacing: .8em,
              box(circle(radius: 3pt, fill: palette.red)),
              std.align(center, text(size: 0.8em, fill: palette.text-light)[#utils.display-info-date(self)]),
            )
          },
        ),
      )
    ]
    // Bottom subtle accent line
    place(bottom + center, dy: -1em,
      block(width: 120pt, height: 2pt, fill: white.transparentize(70%), radius: 1pt))
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// Section slide — red gradient bg, large semi-transparent number, white section title
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Red gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.red, palette.deep-red, angle: 150deg),
    ))
    // Decorative circles
    place(top + right, dx: -60pt, dy: 30pt,
      circle(radius: 110pt, fill: white.transparentize(94%)))
    place(bottom + left, dx: 40pt, dy: -40pt,
      circle(radius: 80pt, fill: white.transparentize(95%)))
    place(bottom + right, dx: -100pt, dy: -60pt,
      circle(radius: 60pt, fill: white.transparentize(96%)))
    // Large semi-transparent section number
    place(left + horizon, dx: 2.5em, dy: -0.8em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(size: 12em, weight: "bold", fill: white.transparentize(75%), num-str)
      }
    )
    // Section title — positioned to the right of the large number
    place(left + horizon, dx: 5.5em,
      block(width: 68%)[
        #set align(left)
        #stack(
          dir: ttb,
          spacing: .8em,
          block(width: 45pt, height: 4pt, fill: white.transparentize(30%), radius: 2pt),
          {
            set text(fill: white, size: 2.4em, weight: "bold")
            utils.display-current-heading(level: 1, numbered: false)
          },
        )
      ],
    )
    // Bottom accent
    place(bottom + center, dy: -1.2em, stack(dir: ltr, spacing: 8pt,
      block(width: 20pt, height: 3pt, fill: white.transparentize(50%), radius: 1.5pt),
      block(width: 10pt, height: 3pt, fill: white.transparentize(60%), radius: 1.5pt),
      block(width: 6pt, height: 3pt, fill: white.transparentize(70%), radius: 1.5pt),
    ))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — red bg, white centered text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.red, palette.deep-red, angle: 135deg),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    set text(fill: white, size: 2em, weight: "bold")
    set std.align(center)
    block(width: 80%, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// Ending slide — red gradient bg, white centered text
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Red gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.red, palette.deep-red, angle: 135deg),
    ))
    // Decorative circles
    place(top + left, dx: 40pt, dy: 30pt,
      circle(radius: 35pt, fill: white.transparentize(93%)))
    place(top + right, dx: -50pt, dy: 50pt,
      circle(radius: 80pt, fill: white.transparentize(95%)))
    place(bottom + left, dx: 80pt, dy: -40pt,
      circle(radius: 60pt, fill: white.transparentize(94%)))
    place(bottom + right, dx: -30pt, dy: -30pt,
      circle(radius: 40pt, fill: white.transparentize(93%)))
    // Center content
    place(center + horizon,
      block(width: 600pt, inset: (x: 2em, y: 2em))[
        #grid(
          columns: (1fr,),
          row-gutter: 0.5em,
          align: center,
          text(size: 2.6em, weight: "bold", fill: white, body),
          stack(
            dir: ltr,
            spacing: 4pt,
            box(width: 50pt, height: 2.5pt, fill: white.transparentize(40%)),
            box(width: 20pt, height: 2.5pt, fill: white.transparentize(60%)),
            box(width: 10pt, height: 2.5pt, fill: white.transparentize(70%)),
          ),
        )
      ],
    )
    // Bottom subtle line
    place(bottom + center, dy: -1em,
      block(width: 100pt, height: 2pt, fill: white.transparentize(70%), radius: 1pt))
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Financial product card with colored left accent
#let product-card(title, body, accent: palette.red) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.8em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Financial metric display card with large value
#let metric-card(label, value, trend: none, accent: palette.blue) = {
  block(
    width: 100%,
    fill: palette.bg-light,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 8pt),
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      stack(
        dir: ltr,
        spacing: 0.3em,
        text(fill: accent, size: 1.8em, weight: "bold", value),
        if trend != none {
          text(fill: rgb("#2E7D32"), size: 0.8em, weight: "bold", trend)
        },
      ),
      text(fill: palette.text-body, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Customer case study card with blue accent
#let case-card(title, body) = {
  block(
    width: 100%,
    fill: palette.blue.lighten(93%),
    stroke: (left: 4pt + palette.blue),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.blue.darken(15%), size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.8em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Horizontal process flow diagram
#let process-flow(steps) = {
  let n = steps.len()
  let cells = steps.enumerate().map(((i, step)) => {
    let is-last = (i == n - 1)
    stack(
      dir: ltr,
      spacing: .2em,
      box(width: 5em)[
        #set align(center)
        // Step circle
        #stack(
          spacing: 16pt,
          circle(
            fill: palette.red,
            radius: 1em,
          )[
            #set align(center + horizon)
            #text(fill: white, weight: "bold", size: 0.85em, str(i + 1))
          ],
          text(fill: palette.text-dark, weight: "bold", size: 0.75em, step)
        )
      ],
      {
        if not is-last {
          box(width: 0.6em, height: 2em)[
            #set align(center + horizon)
            #text(fill: palette.signal, size: 1em, sym.arrow.r)
          ]
        }
      }
    )
  }).flatten()
  // Wrap in a stack
  set align(center)
  block(width: 100%, inset: (y: 0.4em))[
    #set align(center + horizon)
    #stack(dir: ltr, spacing: 0.3em, ..cells)
  ]
}

/// Financial data table with red header
#let fin-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.red }
      else if calc.odd(row) { palette.card-bg } else { palette.bg-light },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.45em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.8em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.8em, c)),
  )
}

// ═══ 3. Theme Entry Point ═══

#let cmb-bank-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.red,
      neutral-lightest: white,
      neutral-darkest: palette.deep-red,
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
