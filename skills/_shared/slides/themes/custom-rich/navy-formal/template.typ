// Navy Formal Theme — Professional, rigorous, research-oriented Touying theme
// Designed for thesis defense, academic presentations, and research progress reports
// Features: dark blue header bar, red vertical accent bar on section slides,
//           blue card borders, decorative dot dividers, semi-transparent chapter numbers
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#003366"),
  accent-blue: rgb("#0066CC"),
  accent-red: rgb("#CC0000"),
  bg-light: rgb("#E8F4FC"),
  white: rgb("#FFFFFF"),
  text-dark: rgb("#1A1A2E"),
  text-body: rgb("#333333"),
  text-secondary: rgb("#666666"),
  text-muted: rgb("#6B7280"),
  border: rgb("#C8D8E8"),
  bg-card: rgb("#F5F9FD"),
  success: rgb("#2E7D32"),
  warning: rgb("#E65100"),
)

// Extended palette

// ═══ Helper Functions ═══

/// Decorative divider with three dots
#let dot-divider(color: palette.accent-blue, dot-size: 4pt, spacing: 10pt) = {
  set std.align(center)
  stack(dir: ltr, spacing: spacing,
    line(length: 40pt, stroke: 1.5pt + color.transparentize(50%)),
    box(circle(radius: dot-size, fill: color.transparentize(30%))),
    box(circle(radius: dot-size, fill: color)),
    box(circle(radius: dot-size, fill: color.transparentize(30%))),
    line(length: 40pt, stroke: 1.5pt + color.transparentize(50%)),
  )
}

/// Blue underline accent for titles
#let title-accent-line(width: 60pt, color: palette.accent-blue) = {
  block(width: width, height: 3pt, fill: color, radius: 1.5pt)
}

/// Red vertical bar (used on section slides)
#let red-vertical-bar(height: 100%, width: 6pt) = {
  block(width: width, height: height, fill: palette.accent-red)
}

/// Restrained research-register marks that keep ordinary content slides in-theme.
#let _content-atmosphere() = {
  place(top + right, dx: 2.2em, dy: 0.8em,
    circle(radius: 26pt, fill: palette.bg-light.transparentize(35%)))
  place(top + right, dx: 2.2em, dy: 0.8em,
    circle(radius: 5pt, fill: palette.accent-blue.transparentize(70%)))
  place(bottom + left, dx: 0.2em, dy: -0.5em,
    block(width: 54pt, height: 2pt, fill: palette.accent-red.transparentize(80%)))
}

// ═══ 1. Slide Functions ═══

/// Standard content slide with dark blue header bar
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    stack(
      spacing: 0pt,
      // Dark blue header bar
      block(width: 100%, height: 3.2em, fill: palette.primary)[
        #set std.align(left + horizon)
        #pad(left: 1.5em, right: 1.5em)[
          #set text(fill: white, size: 1.2em, weight: "medium")
          #if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        ]
      ],
      // Thin accent line under header
      block(width: 100%, height: 2pt, fill: palette.accent-blue),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    stack(
      spacing: 0pt,
      block(width: 100%, height: 0.5pt, fill: palette.border),
      {
        show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
        set std.align(horizon)
        set text(fill: palette.text-muted, size: 0.7em)
        grid(
          columns: (1fr, auto, 1fr),
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          },
          stack(dir: ltr, spacing: 6pt,
            box(circle(radius: 2.5pt, fill: palette.primary)),
            box(circle(radius: 2.5pt, fill: palette.accent-blue)),
            box(circle(radius: 2.5pt, fill: palette.accent-red)),
          ),
          {
            set std.align(right)
            context text(fill: palette.text-secondary, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
          },
        )
      },
    )
  }
  let setting(body) = {
    _content-atmosphere()
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

/// Title slide — thesis defense cover page
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg-light))
    // Top dark blue banner
    place(top + left, block(width: 100%, height: 35%, fill: palette.primary))
    // Red accent line at banner bottom
    place(top + left, dy: 35%, block(width: 100%, height: 4pt, fill: palette.accent-red))
    // Decorative subtle circles in banner
    place(top + right, dx: -80pt, dy: 20pt,
      circle(radius: 60pt, fill: white.transparentize(95%)))
    place(top + right, dx: -30pt, dy: 60pt,
      circle(radius: 35pt, fill: white.transparentize(93%)))
    // Title content — centered white card overlapping banner
    set std.align(center + horizon)
    block(
      width: 70%,
      fill: white,
      stroke: 1.5pt + palette.border,
      radius: 4pt,
      inset: (x: 2em, y: 1.5em),
    )[
      #set std.align(center)
      #stack(
        spacing: .8em,
        pad(bottom: 0.45em,
          block(width: 100%)[
            #text(size: 1.8em, weight: "bold", fill: palette.primary, info.title)
          ]),
        if info.subtitle != none {
          block(width: 100%)[
            #text(size: 0.95em, fill: palette.text-secondary, info.subtitle)
          ]
        },
        dot-divider(color: palette.accent-blue, dot-size: 3pt),
        if info.author != none {
          text(size: 1.1em, weight: "bold", fill: palette.text-dark, info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-secondary, info.institution)
        },
        if info.date != none {
          text(size: 0.75em, fill: palette.text-muted)[#utils.display-info-date(self)]
        },
      )
    ]
    // Bottom decorative dots
    place(bottom, dy: -1.2em, {
      set std.align(center)
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 3pt, fill: palette.primary)),
        box(circle(radius: 3pt, fill: palette.accent-blue)),
        box(circle(radius: 3pt, fill: palette.accent-red)),
      )
    })
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

/// Section/chapter divider slide — auto-triggered by `= Heading`
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
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: palette.white))
    // Left red vertical bar
    place(left, red-vertical-bar())
    // Semi-transparent background number
    place(left + horizon, dx: 30pt, dy: -30pt, {
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "1")
        text(
          size: 10em,
          weight: "bold",
          fill: palette.accent-blue.transparentize(88%),
          num-str,
        )
      }
    })
    // Decorative subtle circles
    place(top + right, dx: -60pt, dy: 50pt,
      circle(radius: 80pt, fill: palette.bg-light))
    place(bottom + right, dx: -100pt, dy: -40pt,
      circle(radius: 50pt, fill: palette.bg-light))
    // Section title content
    pad(left: 5em, top: 4em, right: 3em, bottom: 3em)[
      #v(1fr)
      // Small label
      #text(size: 0.85em, weight: "bold", fill: palette.accent-red, tracking: 2pt)[CHAPTER]
      #v(0.5em)
      // Section heading
      #set text(fill: palette.primary, size: 2.2em, weight: "semibold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.6em)
      // Blue accent line
      #title-accent-line(width: 80pt, color: palette.accent-blue)
      #v(1fr)
    ]
    // Bottom decorative dots
    place(bottom, dy: -1.2em, {
      set std.align(center)
      dot-divider(color: palette.accent-blue, dot-size: 3pt)
    })
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — full-screen emphasis for key findings or quotes
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
  let main-body = {
    // Subtle decorative elements
    place(top + right, dx: -30pt, dy: 30pt,
      circle(radius: 50pt, fill: white.transparentize(95%)))
    place(bottom + left, dx: 30pt, dy: -30pt,
      circle(radius: 40pt, fill: white.transparentize(95%)))
    // Top red accent line
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 100%, height: 3pt, fill: palette.accent-red))
    set text(fill: white, size: 1.8em, weight: "semibold")
    std.align(horizon + center,
      block(width: 86%, inset: (x: 0.5em))[
        #set std.align(center)
        #body
      ])
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — closing / thank you page
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
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg-light))
    // Top dark blue bar
    place(top + left, block(width: 100%, height: 6pt, fill: palette.primary))
    // Bottom red accent line
    place(bottom + left, block(width: 100%, height: 4pt, fill: palette.accent-red))
    // Decorative circles
    place(top + left, dx: 40pt, dy: 40pt,
      circle(radius: 30pt, fill: palette.accent-blue.transparentize(90%)))
    place(bottom + right, dx: -40pt, dy: -40pt,
      circle(radius: 35pt, fill: palette.primary.transparentize(90%)))
    // Center content
    set std.align(center + horizon)
    block(
      width: 55%,
      fill: white,
      stroke: 1.5pt + palette.border,
      radius: 4pt,
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      #stack(
        spacing: .8em,
        block(width: 100%)[
          #text(size: 2.4em, weight: "bold", fill: palette.primary, body)
        ],
        dot-divider(color: palette.accent-blue, dot-size: 4pt),
      )
    ]
    // Bottom decorative dots
    place(bottom, dy: -1.5em, {
      set std.align(center)
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 3pt, fill: palette.primary)),
        box(circle(radius: 3pt, fill: palette.accent-blue)),
        box(circle(radius: 3pt, fill: palette.accent-red)),
      )
    })
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — table of contents
#let outline-slide(title: [Outline]) = touying-slide-wrapper(self => {
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.white))
    // Top dark blue bar
    place(top + left, block(width: 100%, height: 6pt, fill: palette.primary))
    // Red accent under bar
    place(top + left, dy: 6pt, block(width: 100%, height: 2pt, fill: palette.accent-red))
    // Title (absolutely positioned)
    place(top + left, dx: 2.5em, dy: 1.5em)[
      #stack(
        spacing: .8em,
        text(size: 1.6em, weight: "semibold", fill: palette.primary, title),
        title-accent-line(width: 70pt)
      )
    ]
    // Decorative circles at bottom right
    place(bottom + right, dx: -60pt, dy: -40pt,
      circle(radius: 50pt, fill: palette.bg-light))
    place(bottom + right, dx: -30pt, dy: -20pt,
      circle(radius: 30pt, fill: palette.accent-blue.transparentize(92%)))
    // Outline content
    pad(left: 2.5em, top: 4em, right: 3em, bottom: 4em)[
      #v(1fr)
      #set text(size: 0.95em, fill: palette.text-dark)
      #set text(weight: "bold", fill: palette.primary)
      #set text(1.5em)
      #outline(title: none, depth: 1)
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Theorem/Lemma box — for mathematical theorems, definitions, lemmas
/// Base box component: accent color controls left border and title color.
#let theorem-box(title, body, accent: palette.accent-blue, icon: sym.diamond.filled) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent, rest: 1pt + accent.lighten(70%)),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent, size: 0.9em)[#icon #title],
      [
      #set text(fill: palette.text-body, size: 0.85em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Highlight box — for key findings, important results (alias of theorem-box)
#let highlight-box(title, body) = theorem-box(title, body, accent: palette.accent-red, icon: sym.star.filled)

/// Source footer — for citations and references
#let source-footer(content) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.1em))[
    #set text(size: 0.65em, fill: palette.text-muted, style: "italic")
    #content
  ]
}

/// Comparison table — styled academic comparison table
#let comparison-table(
  columns: auto,
  align: center + horizon,
  compact: false,
  headers,
  rows,
) = {
  let column-spec = if columns == auto { headers.len() * (1fr,) } else { columns }
  let cell-size = if compact { 0.72em } else { 0.85em }
  let cell-inset = if compact { (x: 0.45em, y: 0.22em) } else { (x: 0.7em, y: 0.4em) }
  table(
    columns: column-spec,
    fill: (_, row) => if row == 0 { palette.primary }
      else if calc.odd(row) { palette.white } else { palette.bg-card },
    stroke: 0.5pt + palette.border,
    inset: cell-inset,
    align: align,
    table.header(..headers.map(h => text(weight: "semibold", fill: white, size: cell-size, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: cell-size, c)),
  )
}

/// Method card — for describing methodology steps
#let method-card(number, title, description) = {
  let color = if calc.rem(number, 2) == 1 { palette.accent-blue } else { palette.primary }
  block(
    width: 100%,
    fill: palette.white,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: .8em,
      grid(
        columns: (auto, 1fr),
        gutter: 0.4em,
        align: horizon,
        box(
          fill: color,
          width: 1.4em,
          height: 1.4em,
          radius: 0.7em,
          inset: 0pt,
        )[
          #set std.align(center + horizon)
          #set text(fill: white, weight: "bold", size: 0.8em)
          #str(number)
        ],
        text(weight: "semibold", fill: palette.primary, size: 0.9em, title),
      ),
      [
        #set text(fill: palette.text-body, size: 0.8em)
        #description
        #lazy-v(1fr)
      ],
    )
  ]
}

// ═══ 3. Theme Entry Point ═══

#let navy-formal-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(
    size: 20pt,
    fill: palette.text-body,
  )
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.white,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent-blue,
      neutral-lightest: palette.white,
      neutral-darkest: palette.primary,
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
