// Smart-Red Theme — A modern, energetic Touying presentation theme
// Features: Dark/colorful cover + light content hybrid, geometric triangle motifs,
// red-black contrast, multi-layer semi-transparent overlays, shadow effects
// Best for: Company introductions, product launches, solution presentations, education courseware
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  red: rgb("#DE3545"),
  orange: rgb("#F0964D"),
  red-text: rgb("#B52334"),
  orange-text: rgb("#91460D"),
  dark: rgb("#333333"),
  bg: rgb("#F5F5F7"),
  card-bg: rgb("#FFFFFF"),
  text-dark: rgb("#222222"),
  text-body: rgb("#555555"),
  text-light: rgb("#6B6B70"),
  border: rgb("#E0E0E0"),
)

#let accent-colors = (palette.red, palette.orange)

// ═══ Helper Functions ═══

/// Returns accent color by index (cycles red, orange)
#let accent-color(index) = {
  accent-colors.at(calc.rem(index, 2))
}

/// Accessible foreground companion for decorative accent colors
#let semantic-accent-color(color) = {
  if color == palette.red {
    palette.red-text
  } else if color == palette.orange {
    palette.orange-text
  } else {
    color.darken(30%)
  }
}

/// Red top bar decoration
#let red-bar(height: 4pt) = {
  block(width: 100%, height: height, fill: palette.red)
}

/// Decorative triangle accent — a filled polygon triangle
#let triangle-accent(size: 40pt, fill-color: palette.red, opacity: 100%) = {
  let clr = if opacity < 100% { fill-color.transparentize(100% - opacity) } else { fill-color }
  box(width: size, height: size)[
    #polygon(fill: clr, stroke: none,
      (0pt, size),
      (size, size),
      (size, 0pt),
    )
  ]
}

/// Dual-line decoration (two parallel lines with red/orange)
#let dual-lines(width: 120pt) = {
  stack(dir: ttb, spacing: 0.8em,
    line(length: width, stroke: 2.5pt + palette.red),
    line(length: width * 0.6, stroke: 2pt + palette.orange),
  )
}

/// Red dots footer decoration
#let red-dots(count: 3, size: 3pt) = {
  stack(dir: ltr, spacing: 8pt,
    ..range(count).map(i => {
      let clr = if calc.rem(i, 2) == 0 { palette.red } else { palette.orange }
      box(circle(radius: size, fill: clr))
    })
  )
}

/// Persistent geometric atmosphere for content slides
#let _slide-atmosphere() = {
  place(top + right, dx: -8pt, dy: 4pt,
    triangle-accent(size: 92pt, fill-color: palette.red, opacity: 4%))
  place(bottom + left, dx: 8pt, dy: -4pt,
    rotate(180deg,
      triangle-accent(size: 72pt, fill-color: palette.orange, opacity: 5%)))
}

// ═══ 1. Slide Functions ═══

/// Standard content slide — light background, red top bar, bold title with red underline
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Red top bar
    block(width: 100%, height: 4pt, fill: palette.red)
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Red underline with orange tail
      stack(dir: ltr, spacing: 4pt,
        block(width: 60pt, height: 3.5pt, fill: palette.red, radius: 1.5pt),
        block(width: 25pt, height: 3.5pt, fill: palette.orange, radius: 1.5pt),
      ),
    )
  }
  let footer(self) = {
    let footer-content = if self.store.footer != none {
      utils.call-or-display(self, self.store.footer)
    } else {
      []
    }
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    context {
      let current = utils.slide-counter.get().first()
      let total = utils.last-slide-counter.final().first()
      grid(
        columns: (1fr, auto, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        box(width: 100%, footer-content),
        // Red dots
        stack(dir: ltr, spacing: 6pt,
          box(circle(radius: 3pt, fill: palette.red)),
          box(circle(radius: 3pt, fill: palette.orange)),
          box(circle(radius: 3pt, fill: palette.red)),
        ),
        box(width: 4em, {
          std.align(right, str(current) + " / " + str(total))
        }),
      )
    }
  }
  let setting(body) = {
    _slide-atmosphere()
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

/// Title slide — dark background with red triangular geometric overlays
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Dark background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))

    // Large triangle overlays — signature geometric design
    // Bottom-right large triangle
    place(bottom + right,
      polygon(fill: palette.red.transparentize(25%), stroke: none,
        (0pt, 0pt),
        (480pt, 0pt),
        (480pt, -320pt),
      )
    )
    // Second layer triangle (darker red)
    place(bottom + right,
      polygon(fill: palette.red.transparentize(55%), stroke: none,
        (0pt, 0pt),
        (380pt, 0pt),
        (380pt, -250pt),
      )
    )
    // Top-left accent triangle
    place(top + left, dx: 0pt, dy: 0pt,
      polygon(fill: palette.orange.transparentize(80%), stroke: none,
        (0pt, 0pt),
        (200pt, 0pt),
        (0pt, 140pt),
      )
    )
    // Small decorative triangle
    place(top + right, dx: -80pt, dy: 60pt,
      polygon(fill: palette.red.transparentize(70%), stroke: none,
        (0pt, 50pt),
        (50pt, 50pt),
        (50pt, 0pt),
      )
    )

    // Diagonal line texture (subtle)
    place(top + left, dx: 160pt, dy: 30pt,
      line(length: 180pt, angle: 35deg, stroke: 0.5pt + white.transparentize(90%))
    )
    place(top + left, dx: 190pt, dy: 30pt,
      line(length: 160pt, angle: 35deg, stroke: 0.5pt + white.transparentize(92%))
    )

    // Center content
    set std.align(center + horizon)
    pad(x: 3em)[
      #stack(
        spacing: 0.8em,
        stack(
          spacing: 0.8em,
          text(size: 2.4em, weight: "bold", fill: white, info.title),
          if info.subtitle != none {
            text(size: 1.1em, fill: white.transparentize(30%), info.subtitle)
          },
        ),
        align(center, stack(dir: ltr, spacing: 6pt,
          line(length: 100pt, stroke: 3pt + palette.red),
          line(length: 50pt, stroke: 2.5pt + palette.orange),
        )),
        stack(
          spacing: 0.8em,
          if info.author != none {
            text(size: 1.15em, weight: "semibold", fill: white, info.author)
          },
          if info.institution != none {
            text(size: 0.9em, fill: white.transparentize(40%), info.institution)
          },
          if info.date != none {
            text(size: 0.85em, fill: palette.orange)[#utils.display-info-date(self)]
          },
        ),
      )
    ]

    // Bottom dual-line decoration
    place(bottom + left, dx: 2em, dy: -1.5em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3.5pt, fill: palette.red)),
        box(circle(radius: 3.5pt, fill: palette.orange)),
        box(circle(radius: 3.5pt, fill: palette.red)),
      )
    )
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

/// New section slide — dark background with red triangle decoration, large white section title
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
    // Dark background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))

    // Large triangle cutout — right side
    place(right + bottom,
      polygon(fill: palette.red.transparentize(20%), stroke: none,
        (0pt, 0pt),
        (350pt, 0pt),
        (350pt, -260pt),
      )
    )
    // Second layer triangle
    place(right + bottom,
      polygon(fill: palette.red.transparentize(50%), stroke: none,
        (0pt, 0pt),
        (260pt, 0pt),
        (260pt, -180pt),
      )
    )
    // Top-left small triangle
    place(top + left, dx: 0pt, dy: 0pt,
      polygon(fill: palette.orange.transparentize(75%), stroke: none,
        (0pt, 0pt),
        (120pt, 0pt),
        (0pt, 80pt),
      )
    )

    // Diagonal line textures
    place(top + right, dx: -40pt, dy: 20pt,
      line(length: 100pt, angle: -40deg, stroke: 0.5pt + white.transparentize(88%))
    )

    // Section content — left aligned, vertically centered
    set std.align(left + horizon)
    pad(left: 4em, right: 4em)[
      #stack(
        spacing: 0.8em,
        block(width: 50pt, height: 5pt, fill: palette.red, radius: 2pt),
        {
          set text(fill: white, size: 2.4em, weight: "semibold")
          utils.display-current-heading(level: 1)
        },
        block(width: 80pt, height: 3pt, fill: palette.orange, radius: 1.5pt),
      )
    ]

    // Bottom dots
    place(bottom + left, dx: 4em, dy: -1.5em,
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 3pt, fill: palette.red)),
        box(circle(radius: 3pt, fill: palette.orange)),
        box(circle(radius: 3pt, fill: palette.red)),
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — full red background, large white bold text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.red,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle triangle overlays on red
    place(bottom + right,
      polygon(fill: white.transparentize(90%), stroke: none,
        (0pt, 0pt),
        (300pt, 0pt),
        (300pt, -200pt),
      )
    )
    place(top + left,
      polygon(fill: white.transparentize(93%), stroke: none,
        (0pt, 0pt),
        (150pt, 0pt),
        (0pt, 100pt),
      )
    )
    set text(fill: white, size: 2em, weight: "bold")
    std.align(horizon + center, body)
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light background, centered card with red accent
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))

    // Decorative triangles in corners
    place(top + right,
      polygon(fill: palette.red.transparentize(80%), stroke: none,
        (0pt, 0pt),
        (-160pt, 0pt),
        (0pt, 110pt),
      )
    )
    place(bottom + left,
      polygon(fill: palette.orange.transparentize(80%), stroke: none,
        (0pt, 0pt),
        (160pt, 0pt),
        (0pt, -110pt),
      )
    )

    // Center card
    set std.align(center + horizon)
    block(
      width: 60%,
      fill: palette.card-bg,
      stroke: 1pt + palette.border,
      radius: 12pt,
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        block(width: 60pt, height: 4pt, fill: palette.red, radius: 2pt),
        text(size: 2.4em, weight: "bold", fill: palette.text-dark, body),
        stack(dir: ltr, spacing: 6pt,
          line(length: 60pt, stroke: 3pt + palette.red),
          line(length: 30pt, stroke: 2pt + palette.orange),
        ),
        stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 3pt, fill: palette.red)),
          box(circle(radius: 3pt, fill: palette.orange)),
          box(circle(radius: 3pt, fill: palette.red)),
        ),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Feature card with numbered badge — cycles red/orange accent
#let feature-card(number, title, description, accent: auto) = {
  let color = if accent == auto { accent-color(number - 1) } else { accent }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: 0.8em,
      box(
        fill: color,
        width: 1.8em,
        height: 1.8em,
        radius: 4pt,
        inset: 0pt,
      )[
        #set std.align(center + horizon)
        #set text(
          fill: if color == palette.orange { palette.text-dark } else { white },
          weight: "bold",
          size: 0.85em,
        )
        #str(number)
      ],
      text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
      [
        #set text(fill: palette.text-body, size: 0.78em)
        #description
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Metric/KPI card — large value with optional trend indicator
#let metric-card(label, value, trend: none, accent: palette.red) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 8pt),
  )[
    #set text(fill: palette.text-body, size: 0.78em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: semantic-accent-color(accent), size: 1.7em, weight: "bold")
        #value
        #if trend != none {
          h(0.3em)
          text(fill: palette.text-body, size: 0.45em, weight: "bold", trend)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Highlight box — red-accented box for key information
#let highlight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.red.lighten(93%),
    stroke: (left: 4pt + palette.red),
    inset: 14pt,
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.red-text, size: 0.9em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Product card — clean showcase card with border
#let product-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1.2em, y: 1em),
    radius: 10pt,
  )[
    #stack(spacing: .8em,
      [
        #box(circle(radius: 4pt, fill: palette.red))
        #h(0.45em)
        #text(weight: "bold", fill: palette.text-dark, size: 1em, title)
      ],
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Rollout phase card — compact milestone card for side-by-side timelines
#let phase-card(phase, title, period, body, accent: palette.red) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: 0.8em,
      text(size: 0.7em, weight: "bold", fill: semantic-accent-color(accent), phase),
      text(size: 0.9em, weight: "bold", fill: palette.text-dark, title),
      text(size: 0.72em, fill: palette.text-body, period),
      [
        #set text(size: 0.72em, fill: palette.text-body)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Data table with red header
#let data-table(
  align: center + horizon,
  text-size: 0.82em,
  cell-inset: (x: 0.8em, y: 0.5em),
  headers,
  rows,
) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.red-text }
      else if calc.odd(row) { palette.card-bg } else { palette.bg },
    stroke: 0.5pt + palette.border,
    inset: cell-inset,
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: text-size, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: text-size, c)),
  )
}

// ═══ 3. Theme Entry Point ═══

#let smart-red-theme(
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
      primary: palette.red-text,
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
