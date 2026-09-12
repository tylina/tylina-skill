// Google Style Theme — A vibrant, data-driven Touying theme
// Inspired by Google's brand design system with four signature colors
// Features: four-color gradient top bar, KPI data cards, chapter dividers
// Perfect for tech reports, annual reviews, product launches, data presentations
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  blue: rgb("#4285F4"),
  red: rgb("#EA4335"),
  yellow: rgb("#FBBC04"),
  green: rgb("#34A853"),
  deep-blue: rgb("#1A237E"),
  medium-blue: rgb("#1A73E8"),
  dark-blue: rgb("#0D47A1"),
  bg: rgb("#FFFFFF"),
  bg-light: rgb("#F8F9FA"),
  card-bg: rgb("#FFFFFF"),
  border: rgb("#E8EAED"),
  text-primary: rgb("#1A237E"),
  text-body: rgb("#5F6368"),
  text-secondary: rgb("#9AA0A6"),
  success: rgb("#34A853"),
  danger: rgb("#EA4335"),
  warning: rgb("#FBBC04"),
)


// Brand color cycle for auto-indexing
#let brand-colors = (palette.blue, palette.red, palette.yellow, palette.green)

// ═══ Helper Functions ═══

/// Returns brand color by index (cycles through blue, red, yellow, green)
#let brand-color(index) = {
  brand-colors.at(calc.rem(index, 4))
}

/// Four-color gradient top bar (6pt height)
#let four-color-bar(height: 6pt) = {
  block(width: 100%, height: height, fill: gradient.linear(palette.blue, palette.red, palette.yellow, palette.green))
}

/// Four-color dots decoration
#let four-color-dots(size: 6pt, spacing: 12pt) = {
  stack(dir: ltr, spacing: spacing,
    box(circle(radius: size, fill: palette.blue)),
    box(circle(radius: size, fill: palette.red)),
    box(circle(radius: size, fill: palette.yellow)),
    box(circle(radius: size, fill: palette.green)),
    box(circle(radius: size, fill: palette.blue)),
  )
}

/// Four-color underline segments
#let four-color-underline(width: 240pt) = {
  let seg = width / 4
  stack(dir: ltr, spacing: 8pt,
    line(length: seg * 1.5, stroke: 3pt + palette.blue),
    line(length: seg * 0.7, stroke: 3pt + palette.red),
    line(length: seg * 0.7, stroke: 3pt + palette.yellow),
    line(length: seg * 1.5, stroke: 3pt + palette.green),
  )
}

/// Blue underline for slide titles
#let title-underline(width: 80pt) = {
  block(width: width, height: 4pt, fill: palette.blue, radius: 2pt)
}

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
    // Four-color gradient top bar
    block(width: 100%, height: 6pt, fill: gradient.linear(palette.blue, palette.red, palette.yellow, palette.green))
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.3em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.deep-blue, size: 1.5em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 80pt, height: 4pt, fill: palette.blue, radius: 2pt)
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-secondary, size: 0.7em)
    // Four-color dots in footer center
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 3pt, fill: palette.blue)),
          box(circle(radius: 3pt, fill: palette.red)),
          box(circle(radius: 3pt, fill: palette.yellow)),
          box(circle(radius: 3pt, fill: palette.green)),
          box(circle(radius: 3pt, fill: palette.blue)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-secondary, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
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
    // Full-page light background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(rgb("#F5F8FE"), white, rgb("#F5FAF6"), angle: 135deg),
    ))
    // Left four-color vertical bar
    place(left, dy: 0pt, block(width: 10pt, height: 25%, fill: palette.blue))
    place(left, dy: 25%, block(width: 10pt, height: 25%, fill: palette.red))
    place(left, dy: 50%, block(width: 10pt, height: 25%, fill: palette.yellow))
    place(left, dy: 75%, block(width: 10pt, height: 25%, fill: palette.green))
    // Decorative shapes (very subtle)
    place(top + left, dx: 60pt, dy: 50pt,
      circle(radius: 60pt, fill: palette.blue.transparentize(96%)))
    place(bottom + right, dx: -60pt, dy: -60pt,
      circle(radius: 75pt, fill: palette.green.transparentize(96%)))
    // Center content card
    set align(center + horizon)
    block(
      width: 60%,
      fill: white,
      stroke: 1pt + palette.border,
      radius: 16pt,
      inset: (x: 2em, y: 1.5em),
    )[
      #set align(center)
      // Title — render with Google-style colorful letters
      #{
        let title-str = if type(info.title) == str { info.title } else { "" }
        let google-colors = (palette.blue, palette.red, palette.yellow, palette.blue, palette.green, palette.red)
        if title-str.len() > 0 {
          set text(size: 2em, weight: "bold")
          for (i, ch) in title-str.clusters().enumerate() {
            let color = google-colors.at(calc.rem(i, google-colors.len()))
            text(fill: color, ch)
          }
        } else {
          text(size: 2em, weight: "bold", fill: palette.deep-blue, info.title)
        }
      }
      #v(0.2em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.text-body, info.subtitle)
        v(0.4em)
      }
      // Four-color underline
      #align(center, stack(dir: ltr, spacing: 6pt,
        line(length: 80pt, stroke: 3pt + palette.blue),
        line(length: 40pt, stroke: 3pt + palette.red),
        line(length: 40pt, stroke: 3pt + palette.yellow),
        line(length: 80pt, stroke: 3pt + palette.green),
      ))
      #v(0.5em)
      // Author
      #if info.author != none {
        text(size: 1.1em, weight: "bold", fill: palette.deep-blue, info.author)
        v(0.15em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.85em, fill: palette.text-body, info.institution)
        v(0.15em)
      }
      // Date with blue dot
      #if info.date != none {
        v(0.2em)
        box(circle(radius: 3pt, fill: palette.blue))
        v(0.2em)
        text(size: 0.85em, fill: palette.text-body)[#utils.display-info-date(self)]
      }
    ]
    // Bottom decorative dots
    place(bottom + center, dy: -0.5em, four-color-dots(size: 5pt, spacing: 16pt))
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
    // Dark gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.deep-blue, palette.dark-blue, angle: 135deg),
    ))
    // Subtle decorative circles
    place(top + right, dx: -80pt, dy: 40pt,
      circle(radius: 100pt, fill: white.transparentize(97%)))
    place(bottom + right, dx: -40pt, dy: -30pt,
      circle(radius: 125pt, fill: white.transparentize(98%)))
    place(bottom + left, dx: 30pt, dy: -30pt,
      circle(radius: 75pt, fill: white.transparentize(98%)))
    // Left four-color vertical bar
    place(left, dx: 40pt, dy: 28%, block(width: 8pt, height: 11%, fill: palette.blue))
    place(left, dx: 40pt, dy: 39%, block(width: 8pt, height: 11%, fill: palette.red))
    place(left, dx: 40pt, dy: 50%, block(width: 8pt, height: 11%, fill: palette.yellow))
    place(left, dx: 40pt, dy: 61%, block(width: 8pt, height: 11%, fill: palette.green))
    // Section content
    pad(left: 5em, top: 4em)[
      // Large section number
      #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: palette.blue.transparentize(10%), size: 7em, weight: "bold", num-str)
      }
      #v(1fr)
      #set text(fill: white, size: 2.2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.8em)
      #v(1fr)
    ]
    // Bottom decorative elements
    place(bottom + center, dy: -1.5em, stack(dir: ltr, spacing: 10pt,
      box(circle(radius: 4pt, fill: palette.blue)),
      box(circle(radius: 4pt, fill: palette.red)),
      box(circle(radius: 4pt, fill: palette.yellow)),
      box(circle(radius: 4pt, fill: palette.green)),
      box(circle(radius: 4pt, fill: palette.blue)),
    ))
    // Bottom-right colored lines
    place(bottom + right, dx: -3em, dy: -2.5em, stack(dir: ltr, spacing: 6pt,
      line(length: 60pt, stroke: 2pt + palette.blue.transparentize(40%)),
      line(length: 30pt, stroke: 2pt + palette.red.transparentize(40%)),
      line(length: 30pt, stroke: 2pt + palette.yellow.transparentize(40%)),
      line(length: 30pt, stroke: 2pt + palette.green.transparentize(40%)),
    ))
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.deep-blue, palette.dark-blue, angle: 135deg),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 2em, weight: "bold")
  touying-slide(self: self, align(horizon + center, body))
})

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
    // Light gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(white, palette.bg-light, rgb("#E8F5E9").transparentize(50%), angle: 135deg),
    ))
    // Decorative corner circles
    place(top + left, dx: 30pt, dy: 30pt,
      circle(radius: 30pt, fill: palette.blue.transparentize(88%)))
    place(top + right, dx: -30pt, dy: 30pt,
      circle(radius: 22pt, fill: palette.red.transparentize(88%)))
    place(bottom + left, dx: 30pt, dy: -30pt,
      circle(radius: 25pt, fill: palette.yellow.transparentize(88%)))
    place(bottom + right, dx: -30pt, dy: -30pt,
      circle(radius: 28pt, fill: palette.green.transparentize(88%)))
    // Center card
    set align(center + horizon)
    block(
      width: 65%,
      fill: white,
      stroke: 1pt + palette.border,
      radius: 16pt,
      inset: (x: 2em, y: 2em),
    )[
      #set align(center)
      // Thank you text with gradient feel
      #text(size: 2.6em, weight: "bold", fill: palette.medium-blue, body)
      #v(0.5em)
      // Four-color line
      #stack(dir: ltr, spacing: 6pt,
        line(length: 50pt, stroke: 3pt + palette.blue),
        line(length: 30pt, stroke: 3pt + palette.red),
        line(length: 30pt, stroke: 3pt + palette.yellow),
        line(length: 30pt, stroke: 3pt + palette.green),
      )
    ]
    // Bottom dots
    place(bottom + center, dy: -1em, four-color-dots(size: 4pt, spacing: 14pt))
  }
  touying-slide(self: self, main-body)
})

/// TOC slide — shows table of contents with color-coded chapter numbers
#let outline-slide(title: [Contents], items) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: white))
    // Top gradient bar
    four-color-bar()
    // Title
    pad(left: 2.5em, top: 1.2em)[
      #text(size: 1.6em, weight: "bold", fill: palette.deep-blue, title)
      #v(-0.2em)
      #title-underline()
    ]
    // Chapter list
    pad(left: 2.5em, top: 0em)[
      #for (i, item) in items.enumerate() {
        let color = brand-color(i)
        v(0.4em)
        stack(dir: ltr, spacing: 10pt,
          // Number badge
          box(
            width: 1.5em,
            height: 1.5em,
            fill: color,
            radius: 0.75em,
          )[
            #set align(center + horizon)
            #set text(fill: white, weight: "bold", size: 0.8em)
            #str(i + 1).clusters().map(c => "0" + c).last()
          ],
          // Chapter title
          align(horizon, text(size: 1em, weight: "semibold", fill: palette.deep-blue, item)),
        )
      }
    ]
    // Right decorative area
    place(right, dx: -6em, dy: 30%,
      circle(radius: 90pt, fill: palette.blue.transparentize(95%)))
    place(right, dx: -4em, dy: 45%,
      circle(radius: 60pt, fill: palette.green.transparentize(95%)))
    place(right, dx: -5em, dy: 55%,
      circle(radius: 40pt, fill: palette.yellow.transparentize(92%)))
    // Bottom dots
    place(bottom + center, dy: -1em, four-color-dots(size: 4pt, spacing: 14pt))
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// KPI data card with large number and colored left accent
#let kpi-card(label, value, trend: none, trend-color: none, accent: palette.blue) = {
  let t-color = if trend-color != none { trend-color } else { palette.text-body }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 10pt),
  )[
    #set text(fill: palette.text-body, size: 0.8em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: accent, size: 1.8em, weight: "bold")
        #value
        #if trend != none {
          h(0.4em)
          text(fill: t-color, size: 0.5em, weight: "bold", trend)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Callout box — generic accented box for key messages (insight, alert, success)
#let callout-box(title, body, accent: palette.blue, title-color: auto) = {
  let t-color = if title-color == auto { accent } else { title-color }
  block(
    width: 100%,
    fill: accent.lighten(93%),
    stroke: (left: 4pt + accent),
    inset: 14pt,
    radius: (right: 8pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: t-color, size: 0.95em, title),
      [
        #set text(fill: palette.text-body, size: 0.85em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Insight/highlight box with Google Blue left border
#let insight-box(title, body) = callout-box(title, body, accent: palette.blue, title-color: palette.deep-blue)

/// Warning/alert box with red accent
#let alert-box(title, body) = callout-box(title, body, accent: palette.red)

/// Success box with green accent
#let success-box(title, body) = callout-box(title, body, accent: palette.green, title-color: palette.green.darken(20%))

/// Styled data table with blue header
#let data-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.deep-blue }
      else if calc.odd(row) { palette.card-bg } else { palette.bg-light },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.55em, y: 0.3em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.75em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.75em, c)),
  )
}

/// Feature/pillar card with color-coded number badge
#let feature-card(number, title, description, accent: auto) = {
  let color = if accent == auto { brand-color(number - 1) } else { accent }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: 1em,
    radius: 10pt,
  )[
    #stack(
      spacing: .8em,
      // Color-coded number badge
      box(
        fill: color,
        width: 1.8em,
        height: 1.8em,
        radius: 0.9em,
        inset: 0pt,
      )[
        #set align(center + horizon)
        #set text(fill: white, weight: "bold", size: 0.9em)
        #str(number)
      ],
      text(weight: "bold", fill: palette.deep-blue, size: 1em, title),
      [
        #set text(fill: palette.text-body, size: 0.8em)
        #description
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Stat row — horizontal layout of key metrics
#let stat-row(..items) = {
  let cells = items.pos().enumerate().map(((i, item)) => {
    let color = brand-color(i)
    block(width: 100%, inset: 0.4em)[
      #set align(center)
      #stack(
        spacing: 0.8em,
        text(size: 2em, weight: "bold", fill: color, item.at("value")),
        text(size: 0.8em, fill: palette.text-body, item.at("label")),
      )
    ]
  })
  grid(columns: cells.len(), column-gutter: 0.5em, ..cells)
}

/// Timeline phase card (for roadmaps)
#let phase-card(phase, title, items, accent: auto) = {
  let color = if accent == auto { palette.blue } else { accent }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: .8em,
      text(size: 0.7em, weight: "bold", fill: color, phase),
      text(size: 0.95em, weight: "bold", fill: palette.deep-blue, title),
      [
        #set text(size: 0.75em, fill: palette.text-body)
        #items
        #lazy-v(1fr)
      ]
    )
  ]
}

// ═══ 3. Theme Entry Point ═══

#let google-theme(
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
      margin: (top: 5.5em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.blue,
      neutral-lightest: white,
      neutral-darkest: palette.deep-blue,
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
