// Medical Theme — A professional, trustworthy Touying presentation theme
// Designed for medical academic reports, case discussions, research presentations
// Features: medical blue header, orange accent bars, clinical data components
// Style: Professional, rigorous, life-affirming, tech-forward, light theme
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  blue: rgb("#0066B3"),
  deep: rgb("#004080"),
  green: rgb("#00A86B"),
  orange: rgb("#FF6B35"),
  bg: rgb("#FFFFFF"),
  bg-blue: rgb("#E6F3FA"),
  bg-green: rgb("#E8F5EE"),
  card-bg: rgb("#FFFFFF"),
  text-dark: rgb("#1A365D"),
  text-body: rgb("#4A5568"),
  text-light: rgb("#718096"),
  border: rgb("#CBD5E0"),
)

// Backgrounds & surfaces

// Border

// ═══ Helper Functions ═══

/// Medical blue top bar
#let blue-bar(height: 4pt) = {
  block(width: 100%, height: height, fill: palette.blue)
}

/// Left orange vertical accent bar
#let orange-accent(height) = {
  block(width: 6pt, height: height, fill: palette.orange)
}

/// Cross decoration element (medical cross)
#let med-cross(size: 16pt, color: palette.blue, thickness: 3pt) = {
  let arm = size
  let t = thickness
  box(width: arm, height: arm)[
    #place(center + horizon, line(length: arm, stroke: t + color))
    #place(center + horizon, line(length: arm, angle: 90deg, stroke: t + color))
  ]
}

/// ECG-style line decoration
#let ecg-line(width: 200pt, color: palette.green) = {
  let stroke-style = 1.5pt + color
  box(width: width, height: 20pt)[
    #place(left + horizon, line(length: width * 0.15, stroke: stroke-style))
    #place(left + horizon, dx: width * 0.15, dy: 0pt,
      line(start: (0pt, 0pt), end: (width * 0.04, -6pt), stroke: stroke-style))
    #place(left + horizon, dx: width * 0.19, dy: -6pt,
      line(start: (0pt, 0pt), end: (width * 0.04, 14pt), stroke: stroke-style))
    #place(left + horizon, dx: width * 0.23, dy: 8pt,
      line(start: (0pt, 0pt), end: (width * 0.05, -14pt), stroke: stroke-style))
    #place(left + horizon, dx: width * 0.28, dy: -6pt,
      line(start: (0pt, 0pt), end: (width * 0.04, 6pt), stroke: stroke-style))
    #place(left + horizon, dx: width * 0.32, line(length: width * 0.68, stroke: stroke-style))
  ]
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
    // Medical blue top bar
    block(width: 100%, height: 4pt, fill: palette.blue)
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.deep, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Green accent underline
      block(width: 60pt, height: 3pt, fill: palette.green, radius: 1.5pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    // Footer content
    if self.store.footer != none {
      utils.call-or-display(self, self.store.footer)
    }
    h(1fr)
    // Small cross decoration
    med-cross(size: 8pt, color: palette.blue.transparentize(60%), thickness: 1.5pt)
    h(0.5em)
    context text(fill: palette.text-light, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number]
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
    // Light blue gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.bg-blue, white, palette.bg-green.transparentize(60%), angle: 150deg),
    ))
    // Left blue accent strip
    place(left, block(width: 8pt, height: 100%, fill: palette.blue))
    // Decorative cross top-right
    place(top + right, dx: -50pt, dy: 40pt,
      med-cross(size: 40pt, color: palette.blue.transparentize(85%), thickness: 4pt))
    // Subtle circle decoration
    place(bottom + right, dx: -80pt, dy: -60pt,
      circle(radius: 70pt, fill: palette.green.transparentize(94%)))
    place(top + left, dx: 80pt, dy: 60pt,
      circle(radius: 50pt, fill: palette.blue.transparentize(94%)))
    // Center content card
    set std.align(center + horizon)
    block(
      width: 65%,
      fill: white,
      stroke: (top: 4pt + palette.blue, rest: 1pt + palette.border),
      radius: (bottom: 12pt),
      inset: (x: 2em, y: 2em),
    )[
      #stack(
        spacing: .8em,
      text(size: 2em, weight: "bold", fill: palette.deep, info.title),
      if info.subtitle != none {
        text(size: 0.95em, fill: palette.text-body, info.subtitle)
      },
      align(center, block(width: 120pt, height: 3pt, fill: palette.green, radius: 1.5pt)),
      if info.author != none {
        text(size: 1.1em, weight: "bold", fill: palette.deep, info.author)
      },
      if info.institution != none {
        text(size: 0.85em, fill: palette.text-body, info.institution)
      },
      if info.date != none {
        stack(
          spacing: .8em,
          med-cross(size: 10pt, color: palette.blue, thickness: 1.5pt),
          text(size: 0.8em, fill: palette.text-light, utils.display-info-date(self)),
        )
        },
      )
    ]
    // Bottom ECG decoration
    place(bottom, dy: -1.2em, align(center, ecg-line(width: 240pt, color: palette.green.transparentize(50%))))
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
    // Medical blue gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.blue, palette.deep, angle: 135deg),
    ))
    // Orange left vertical accent bar (6px)
    place(left, dx: 40pt, dy: 30%, block(width: 6pt, height: 40%, fill: palette.orange))
    // Subtle decorative circles
    place(top + right, dx: -80pt, dy: 40pt,
      circle(radius: 90pt, fill: white.transparentize(96%)))
    place(bottom + left, dx: 60pt, dy: -40pt,
      circle(radius: 60pt, fill: white.transparentize(97%)))
    // Cross decoration top-right
    place(top + right, dx: -40pt, dy: 30pt,
      med-cross(size: 30pt, color: white.transparentize(85%), thickness: 3pt))
    // Section content
    set std.align(left + horizon)
    pad(left: 5em, top: 4em, right: 3em,
      stack(
        spacing: .8em,
        {
          set text(fill: white, size: 2.2em, weight: "bold")
          utils.display-current-heading(level: 1)
        },
        block(width: 80pt, height: 3pt, fill: palette.green, radius: 1.5pt),
      ),
    )
    // Bottom ECG decoration
    place(bottom, dy: -1em, align(center, ecg-line(width: 200pt, color: white.transparentize(70%))))
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.blue, palette.deep, angle: 135deg),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 2em, weight: "bold")
  touying-slide(self: self, std.align(horizon + center, body))
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
      fill: gradient.linear(white, palette.bg-blue.transparentize(40%), palette.bg-green.transparentize(60%), angle: 135deg),
    ))
    // Left blue accent strip
    place(left, block(width: 6pt, height: 100%, fill: palette.blue))
    // Decorative cross elements
    place(top + right, dx: -40pt, dy: 30pt,
      med-cross(size: 35pt, color: palette.blue.transparentize(88%), thickness: 3pt))
    place(bottom + left, dx: 40pt, dy: -30pt,
      med-cross(size: 25pt, color: palette.green.transparentize(88%), thickness: 2pt))
    // Subtle circles
    place(top + left, dx: 80pt, dy: 60pt,
      circle(radius: 40pt, fill: palette.blue.transparentize(94%)))
    place(bottom + right, dx: -60pt, dy: -50pt,
      circle(radius: 50pt, fill: palette.green.transparentize(94%)))
    // Center content
    set std.align(center + horizon)
    block(
      width: 60%,
      fill: white,
      stroke: (
        top: 4pt + palette.blue,
        rest: 1pt + palette.border,
      ),
      radius: (bottom: 12pt),
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.deep, body),
        block(width: 100pt, height: 3pt, fill: palette.green, radius: 1.5pt),
      )
    ]
    // Bottom ECG decoration
    place(bottom, dy: -1em, align(center, ecg-line(width: 200pt, color: palette.green.transparentize(60%))))
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Clinical case display card with colored top border
#let case-card(title, body, accent: palette.blue) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 8pt),
  )[
      #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.85em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Key finding box — base callout box for findings and warnings
/// accent color controls left border, fill, and title color.
#let finding-box(title, body, accent: palette.green) = {
  block(
    width: 100%,
    fill: accent.lighten(90%),
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

/// Warning/caution box with orange accent (alias of finding-box)
#let warning-box(title, body) = finding-box(title, body, accent: palette.orange)

/// Styled clinical data table with medical blue header
#let clinical-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.deep }
      else if calc.odd(row) { palette.card-bg } else { palette.bg-blue.transparentize(50%) },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.35em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.85em, c)),
  )
}

/// Medical metric / stat card with large number
#let stat-card(label, value, unit: none, accent: palette.blue) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 8pt),
  )[
    #set text(fill: palette.text-light, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: accent, size: 1.8em, weight: "bold")
        #value
        #if unit != none {
          h(0.2em)
          text(fill: palette.text-light, size: 0.45em, weight: "regular", unit)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

// ═══ 3. Theme Entry Point ═══

#let medical-theme(
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
      primary: palette.blue,
      neutral-lightest: white,
      neutral-darkest: palette.deep,
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
