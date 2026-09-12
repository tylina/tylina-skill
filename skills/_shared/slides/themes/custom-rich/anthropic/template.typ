// Anthropic Theme — A tech-forward, professional Touying theme
// Inspired by Anthropic's brand with orange accents and dark/light mixed design
// Features: dark gradient covers, orange top bar, card shadows, glow effects
// Perfect for AI tech talks, developer conferences, technical training, product launches
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// ═══ Color Palette ═══

#let palette = (
  // Brand
  orange: rgb("#D97757"),
  dark: rgb("#1A1A2E"),
  blue: rgb("#4A90D9"),
  green: rgb("#10B981"),
  red: rgb("#EF4444"),
  // Background & surface
  bg: rgb("#F5F5F0"),
  card: rgb("#FFFFFF"),
  border: rgb("#E5E5E0"),
  // Text
  text-dark: rgb("#1A1A2E"),
  text-body: rgb("#4A4A5A"),
  text-light: rgb("#8A8A9A"),
  // Derived
  dark-surface: rgb("#16213E"),
  dark-accent: rgb("#0F3460"),
)

// Accent color cycle for auto-indexing
#let accents = (palette.orange, palette.blue, palette.green, palette.red)

// ═══ Helper Functions ═══

/// Returns accent color by index (cycles through orange, blue, green, red)
#let accent-color(index) = {
  accents.at(calc.rem(index, 4))
}

/// Orange top bar (6pt height)
#let orange-bar(height: 6pt) = {
  block(width: 100%, height: height, fill: palette.orange)
}

/// Accent line — short colored underline for titles
#let accent-line(width: 80pt, color: palette.orange) = {
  block(width: width, height: 3pt, fill: color, radius: 1.5pt)
}

/// Orange-blue gradient line decoration
#let gradient-line(width: 200pt) = {
  block(width: width, height: 3pt, fill: gradient.linear(palette.orange, palette.blue), radius: 1.5pt)
}

/// Decorative glow circle (for dark backgrounds)
#let glow-circle(radius: 80pt, color: palette.orange) = {
  circle(radius: radius, fill: color.transparentize(92%))
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
    // Orange top bar (6px)
    block(width: 100%, height: 6pt, fill: palette.orange)
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.3em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.5em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 80pt, height: 3pt, fill: palette.orange, radius: 1.5pt)
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    // Footer with orange dot and page numbers
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      {
        // Orange dot separator
        box(circle(radius: 3pt, fill: palette.orange))
      },
      {
        set std.align(right)
        context { text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number] }
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
    // Dark gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.dark, palette.dark-surface, palette.dark-accent, angle: 135deg),
    ))
    // Decorative glow circles
    place(top + right, dx: -60pt, dy: 40pt,
      circle(radius: 120pt, fill: palette.orange.transparentize(92%)))
    place(bottom + left, dx: 80pt, dy: -60pt,
      circle(radius: 90pt, fill: palette.blue.transparentize(93%)))
    place(top + left, dx: 200pt, dy: 120pt,
      circle(radius: 50pt, fill: palette.orange.transparentize(95%)))
    // Subtle decorative lines
    place(bottom + right, dx: -3em, dy: -3em,
      stack(dir: ltr, spacing: 8pt,
        line(length: 60pt, stroke: 1.5pt + palette.orange.transparentize(50%)),
        line(length: 30pt, stroke: 1.5pt + palette.blue.transparentize(50%)),
      ))
    // Left orange accent bar
    place(left, dy: 30%, block(width: 6pt, height: 40%, fill: gradient.linear(palette.orange, palette.orange.transparentize(80%))))
    // Center content
    set std.align(center + horizon)
    pad(x: 3em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: white, info.title)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.1em, fill: white.transparentize(30%), info.subtitle)
        v(0.6em)
      }
      // Orange gradient line
      #align(center, block(width: 200pt, height: 3pt, fill: gradient.linear(palette.orange, palette.blue), radius: 1.5pt))
      #v(0.8em)
      // Author
      #if info.author != none {
        text(size: 1.2em, weight: "semibold", fill: palette.orange, info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.9em, fill: white.transparentize(40%), info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.3em)
        circle(radius: 2.5pt, fill: palette.orange)
        v(0.3em)
        text(size: 0.85em, fill: white.transparentize(40%))[#utils.display-info-date(self)]
      }
    ]
    // Bottom orange accent dots
    place(bottom, dy: -1.5em, align(center, stack(dir: ltr, spacing: 14pt,
      circle(radius: 3pt, fill: palette.orange.transparentize(30%)),
      circle(radius: 4pt, fill: palette.orange),
      circle(radius: 3pt, fill: palette.blue.transparentize(30%)),
    )))
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
      fill: gradient.linear(palette.dark, palette.dark-surface, angle: 135deg),
    ))
    // Subtle decorative circles
    place(top + right, dx: -80pt, dy: 40pt,
      circle(radius: 100pt, fill: palette.orange.transparentize(94%)))
    place(bottom + right, dx: -40pt, dy: -30pt,
      circle(radius: 125pt, fill: palette.blue.transparentize(95%)))
    place(bottom + left, dx: 30pt, dy: -30pt,
      circle(radius: 75pt, fill: palette.orange.transparentize(96%)))
    // Left gradient bar (orange to blue)
    place(left, dx: 40pt, dy: 30%, block(width: 6pt, height: 40%, fill: gradient.linear(palette.orange, palette.blue)))
    // Section content
    pad(left: 5em, top: 4em)[
      #v(1fr)
      #set text(fill: white, size: 2.2em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.5em)
      #block(width: 120pt, height: 3pt, fill: gradient.linear(palette.orange, palette.blue), radius: 1.5pt)
      #v(1fr)
    ]
    // Bottom decorative elements
    place(bottom + right, dx: -3em, dy: -2em, stack(dir: ltr, spacing: 8pt,
      line(length: 50pt, stroke: 1.5pt + palette.orange.transparentize(50%)),
      line(length: 25pt, stroke: 1.5pt + palette.blue.transparentize(50%)),
    ))
    // Bottom center dot
    place(bottom, dy: -1.5em, align(center,
      circle(radius: 3pt, fill: palette.orange),
    ))
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.dark, palette.dark-surface, angle: 135deg),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Glow effects
    place(center, circle(radius: 200pt, fill: palette.orange.transparentize(95%)))
    place(center, circle(radius: 120pt, fill: palette.orange.transparentize(93%)))
    set text(fill: white, size: 2em, weight: "bold")
    std.align(horizon + center, body)
  }
  touying-slide(self: self, main-body)
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
    // Warm white background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: palette.bg,
    ))
    // Decorative corner circles
    place(top + left, dx: 40pt, dy: 40pt,
      circle(radius: 30pt, fill: palette.orange.transparentize(90%)))
    place(top + right, dx: -40pt, dy: 40pt,
      circle(radius: 22pt, fill: palette.blue.transparentize(90%)))
    place(bottom + left, dx: 40pt, dy: -40pt,
      circle(radius: 25pt, fill: palette.green.transparentize(90%)))
    place(bottom + right, dx: -40pt, dy: -40pt,
      circle(radius: 28pt, fill: palette.orange.transparentize(88%)))
    // Center card with shadow effect
    set std.align(center + horizon)
    block(
      width: 60%,
      fill: white,
      stroke: 1pt + palette.border,
      radius: 16pt,
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      #text(size: 2.6em, weight: "bold", fill: palette.orange, body)
      #v(0.5em)
      // Orange-blue gradient line
      #block(width: 160pt, height: 3pt, fill: gradient.linear(palette.orange, palette.blue), radius: 1.5pt)
    ]
    // Bottom dot
    place(bottom, dy: -1em, align(center, circle(radius: 3pt, fill: palette.orange)))
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Feature card with colored top border and number badge
#let feature-card(number, title, description, accent: auto) = {
  let color = if accent == auto { accent-color(number - 1) } else { accent }
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: 1em,
    radius: (bottom: 10pt),
  )[
    // Number badge
    #stack(
      stack(
        dir: ltr,
        spacing: 10pt,
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
        text(weight: "bold", fill: palette.text-dark, size: 1em, title),
      ),
      [
        #set text(fill: palette.text-body, size: 0.8em)
        #description
        #lazy-v(1fr)
      ]

    )
  ]
}

/// Metric card — KPI-like metric display with large value
#let metric-card(label, value, trend: none, accent: palette.orange, inset-y: .8em) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: inset-y),
    radius: (right: 10pt),
  )[
    #set text(fill: palette.text-body, size: 0.8em)

    #stack(
      spacing: .8em,
      label,
      stack(
        spacing: .8em,
        [
          #set text(fill: accent, size: 1.8em, weight: "bold")
          #value
        ],
        if trend != none {
          text(fill: palette.green, size: 0.5em, weight: "bold", trend)
        }
      ),
      lazy-v(1fr),
    )
  ]
}

/// Callout box — accent-colored callout for key insights, warnings, etc.
#let callout-box(title, body, accent: palette.orange) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent),
    inset: 14pt,
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent.darken(15%), size: 0.95em, title),
      [
        #set text(fill: palette.text-body, size: 0.85em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Convenience aliases
#let insight-box = callout-box
#let warning-box(title, body) = callout-box(title, body, accent: palette.red)
#let success-box(title, body) = callout-box(title, body, accent: palette.green)

/// Code block — styled code display area with dark header
#let code-block(title, body) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 1pt + palette.border,
    radius: 8pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Dark header bar
      block(
        width: 100%,
        fill: palette.dark,
        inset: (x: 1em, y: 0.5em),
      )[
        #set text(fill: palette.orange, size: 0.85em, weight: "bold")
        #title
      ],
      // Code body
      block(
        width: 100%,
        fill: rgb("#1E1E2E"),
        inset: (x: 1em, y: 0.8em),
      )[
        #set text(fill: rgb("#CDD6F4"), size: 0.75em)
        #show raw: set text(size: 1em)
        #body
      ],
    )
  ]
}

/// Data table with dark header
#let data-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.dark }
      else if calc.odd(row) { palette.card } else { palette.bg },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.85em, c)),
  )
}

/// Stat row — horizontal layout of key metrics with auto-cycling colors
#let stat-row(..items) = {
  let cells = items.pos().enumerate().map(((i, item)) => {
    let color = accent-color(i)
    block(width: 100%, inset: 0.5em)[
      #set align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "bold", fill: color, item.at("value")),
        text(size: 0.8em, fill: palette.text-body, item.at("label")),
      )
    ]
  })
  grid(columns: cells.len(), column-gutter: 0.5em, ..cells)
}

/// Phase card — timeline/roadmap card with colored top border
#let phase-card(phase, title, items, accent: auto) = {
  let color = if accent == auto { palette.orange } else { accent }
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: .8em,
      text(size: 0.7em, weight: "bold", fill: color, phase),
      text(size: 0.95em, weight: "bold", fill: palette.text-dark, title),
      [
        #set text(size: 0.75em, fill: palette.text-body)
        #items
        #lazy-v(1fr)
      ]
    )
  ]
}

// ═══ 3. Theme Entry Point ═══

#let anthropic-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)

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
      primary: palette.orange,
      neutral-lightest: white,
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
