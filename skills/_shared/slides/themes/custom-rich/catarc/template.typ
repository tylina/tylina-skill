// CATARC Theme — Modern Automotive Industry Touying Theme
// Combines standard, business, and modern futuristic CATARC (中汽研) design variants
// Features: deep blue gradients, tech lines, neon cyan accents, card-based layouts
// Perfect for automotive industry presentations, NEV certification, technology promotion
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  blue: rgb("#003366"),
  tech: rgb("#0050B3"),
  bright: rgb("#007ACC"),
  cyan: rgb("#00E5FF"),
  red: rgb("#D32F2F"),
  bg: rgb("#FFFFFF"),
  bg-cool: rgb("#F0F2F5"),
  card-bg: rgb("#FFFFFF"),
  text-dark: rgb("#1A1A2E"),
  text-body: rgb("#4A5568"),
  text-light: rgb("#718096"),
  border: rgb("#CBD5E0"),
  success: rgb("#2E7D32"),
  fail: rgb("#C62828"),
)

// Border & utility

// ═══ Helper Functions ═══

/// Blue gradient top bar for content slides
#let tech-bar(height: 5pt) = {
  block(width: 100%, height: height,
    fill: gradient.linear(palette.blue, palette.tech, palette.bright, angle: 0deg))
}

/// Subtle decorative tech line (thin cyan/blue dashed-feel line)
#let tech-line() = {
  block(width: 100%, height: 1.5pt, inset: 0pt,
    fill: gradient.linear(
      palette.cyan.transparentize(80%),
      palette.cyan.transparentize(20%),
      palette.bright.transparentize(60%),
      palette.cyan.transparentize(80%),
    )
  )
}

// ═══ 1. Slide Functions ═══

/// Standard content slide — white bg, blue gradient top bar, bold dark blue title
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Blue gradient top bar
    block(width: 100%, height: 5pt,
      fill: gradient.linear(palette.blue, palette.tech, palette.bright, angle: 0deg))
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.3em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.blue, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Cyan accent underline
      block(width: 60pt, height: 3pt,
        fill: gradient.linear(palette.cyan, palette.bright), radius: 1.5pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set text(fill: palette.text-light, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      // Footer left: institution/footer
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      // Thin tech accent line in center
      box(width: 40pt, height: 2pt,
        fill: gradient.linear(palette.cyan.transparentize(60%), palette.bright.transparentize(60%))),
      // Page number
      context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number],
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

/// Title slide — deep blue gradient background, tech line decorations, white title, cyan accents
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Deep blue gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.blue, palette.tech, palette.blue.darken(20%), angle: 135deg),
    ))
    // Decorative geometric tech lines (angled)
    place(top + left, dx: 0pt, dy: 12%,
      block(width: 100%, height: 1.5pt,
        fill: gradient.linear(palette.cyan.transparentize(90%), palette.cyan.transparentize(20%), palette.cyan.transparentize(90%))))
    place(top + left, dx: 0pt, dy: 14%,
      block(width: 60%, height: 1pt,
        fill: gradient.linear(palette.cyan.transparentize(70%), palette.cyan.transparentize(95%))))
    place(bottom + left, dx: 0pt, dy: -12%,
      block(width: 100%, height: 1.5pt,
        fill: gradient.linear(palette.cyan.transparentize(90%), palette.cyan.transparentize(20%), palette.cyan.transparentize(90%))))
    place(bottom + left, dx: 0pt, dy: -14%,
      block(width: 60%, height: 1pt,
        fill: gradient.linear(palette.cyan.transparentize(95%), palette.cyan.transparentize(70%))))
    // Subtle geometric circles
    place(top + right, dx: -40pt, dy: 30pt,
      circle(radius: 80pt, fill: palette.cyan.transparentize(94%)))
    place(bottom + left, dx: 40pt, dy: -40pt,
      circle(radius: 60pt, fill: palette.cyan.transparentize(95%)))
    // Red accent stripe (top-left corner)
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 6pt, height: 60pt, fill: palette.red))
    // Center content
    set std.align(center + horizon)
    pad(x: 3em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: white, info.title)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.1em, fill: palette.cyan, weight: "regular", info.subtitle)
        v(0.5em)
      }
      // Cyan divider line
      #align(center,
        block(width: 200pt, height: 2pt,
          fill: gradient.linear(palette.cyan.transparentize(80%), palette.cyan, palette.cyan.transparentize(80%))))
      #v(0.8em)
      // Author
      #if info.author != none {
        text(size: 1.1em, weight: "bold", fill: white.transparentize(10%), info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.9em, fill: white.transparentize(30%), info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.85em, fill: palette.cyan.transparentize(30%))[#utils.display-info-date(self)]
      }
    ]
    // Bottom tech line
    place(bottom, dy: -8pt,
      block(width: 80%, height: 1pt,
        fill: gradient.linear(palette.cyan.transparentize(90%), palette.cyan.transparentize(30%), palette.cyan.transparentize(90%))))
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

/// New section slide — deep blue radial gradient bg, large semi-transparent number, white section title
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
    // Deep blue radial-feel gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.radial(palette.tech, palette.blue.darken(30%)),
    ))
    // Tech line decorations
    place(top + left, dx: 0pt, dy: 15%,
      block(width: 100%, height: 1pt,
        fill: gradient.linear(palette.cyan.transparentize(95%), palette.cyan.transparentize(40%), palette.cyan.transparentize(95%))))
    place(bottom + left, dx: 0pt, dy: -15%,
      block(width: 100%, height: 1pt,
        fill: gradient.linear(palette.cyan.transparentize(95%), palette.cyan.transparentize(40%), palette.cyan.transparentize(95%))))
    // Subtle geometric shapes
    place(top + right, dx: -60pt, dy: 40pt,
      circle(radius: 100pt, fill: white.transparentize(97%)))
    place(bottom + left, dx: 30pt, dy: -30pt,
      circle(radius: 70pt, fill: palette.cyan.transparentize(96%)))
    // Large semi-transparent section number
    place(right, dx: -60pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(
          fill: white.transparentize(88%),
          size: 12em,
          weight: "bold",
          num-str,
        )
      }
    )
    // Red accent vertical bar (left side)
    place(left, dx: 0pt, dy: 35%, block(width: 6pt, height: 30%, fill: palette.red.transparentize(30%)))
    // Section title content
    pad(left: 4em, top: 4em, right: 6em)[
      #v(1fr)
      // Cyan small label
      #text(fill: palette.cyan, size: 0.85em, weight: "bold", tracking: 2pt)[SECTION]
      #v(0.3em)
      // Section title
      #set text(fill: white, size: 2.4em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.5em)
      // Cyan underline accent
      #block(width: 80pt, height: 3pt,
        fill: gradient.linear(palette.cyan, palette.bright.transparentize(60%)), radius: 1.5pt)
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom, dy: -6pt,
      block(width: 60%, height: 1.5pt,
        fill: gradient.linear(palette.cyan.transparentize(90%), palette.cyan.transparentize(20%), palette.cyan.transparentize(90%))))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep blue background, white text, centered
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.blue, palette.tech, angle: 135deg),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 2em, weight: "bold")
  touying-slide(self: self, std.align(horizon + center, body))
})

/// Ending slide — blue gradient bg, centered white text with tech accents
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
    // Deep blue gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.blue, palette.tech, palette.blue.darken(15%), angle: 135deg),
    ))
    // Tech line decorations
    place(top + left, dx: 0pt, dy: 25%,
      block(width: 100%, height: 1pt,
        fill: gradient.linear(palette.cyan.transparentize(90%), palette.cyan.transparentize(30%), palette.cyan.transparentize(90%))))
    place(bottom + left, dx: 0pt, dy: -25%,
      block(width: 100%, height: 1pt,
        fill: gradient.linear(palette.cyan.transparentize(90%), palette.cyan.transparentize(30%), palette.cyan.transparentize(90%))))
    // Decorative circles
    place(top + right, dx: -50pt, dy: 50pt,
      circle(radius: 70pt, fill: palette.cyan.transparentize(95%)))
    place(bottom + left, dx: 50pt, dy: -50pt,
      circle(radius: 50pt, fill: palette.cyan.transparentize(95%)))
    // Center content
    set std.align(center + horizon)
    block(width: 70%)[
      #set std.align(center)
      #text(size: 2.8em, weight: "bold", fill: white, body)
      #v(0.5em)
      // Cyan accent line
      #block(width: 160pt, height: 2pt,
        fill: gradient.linear(palette.cyan.transparentize(70%), palette.cyan, palette.cyan.transparentize(70%)))
      #v(0.6em)
      // Red accent dot
      #circle(radius: 4pt, fill: palette.red)
    ]
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Specification/feature card with numbered badge — for automotive specs, features
#let spec-card(number, title, description, accent: auto) = {
  let color = if accent == auto { palette.tech } else { accent }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + color, rest: 1pt + palette.border),
    inset: 1em,
    radius: (right: 8pt),
  )[
    // Numbered badge
    #box(
      fill: color,
      width: 1.8em,
      height: 1.8em,
      radius: 4pt,
      inset: 0pt,
    )[
      #set align(center + horizon)
      #set text(fill: white, weight: "bold", size: 0.85em)
      #str(number)
    ]
    #h(0.5em)
    #text(weight: "bold", fill: palette.blue, size: 1em, title)
    #v(0.3em)
    #set text(fill: palette.text-body, size: 0.8em)
    #description
    #lazy-v(1fr)
  ]
}

/// Automotive metric card — display key performance metrics
#let metric-card(label, value, unit: none, accent: palette.tech) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 8pt),
  )[
    #set text(fill: palette.text-body, size: 0.8em)
    #stack(
      spacing: .8em,
      label,
      [
        #text(fill: accent, size: 1.8em, weight: "bold", value)
        #if unit != none {
          h(0.2em)
          text(fill: palette.text-light, size: 0.85em, unit)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Test/certification result card — pass/fail indicator
#let test-result(title, status, body) = {
  let is-pass = status == "pass"
  let status-color = if is-pass { palette.success } else { palette.fail }
  let status-label = if is-pass { "PASS" } else { "FAIL" }
  let status-bg = if is-pass { palette.success.lighten(90%) } else { palette.fail.lighten(90%) }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + status-color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 8pt),
  )[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(weight: "bold", fill: palette.blue, size: 0.95em, title),
      box(
        fill: status-bg,
        inset: (x: 8pt, y: 3pt),
        radius: 4pt,
      )[
        #text(fill: status-color, weight: "bold", size: 0.75em, status-label)
      ],
    )
    #v(0.3em)
    #set text(fill: palette.text-body, size: 0.8em)
    #body
    #lazy-v(1fr)
  ]
}

/// Highlight box — blue-accented information highlight
#let highlight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.bright.lighten(92%),
    stroke: (left: 4pt + palette.bright),
    inset: 14pt,
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.blue, size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.85em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Styled data table with deep blue header
#let data-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.blue }
      else if calc.odd(row) { palette.card-bg } else { palette.bg-cool },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.35em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.85em, c)),
  )
}

// ═══ 3. Theme Entry Point ═══

#let catarc-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt,
    fill: palette.text-body)
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
      primary: palette.bright,
      neutral-lightest: white,
      neutral-darkest: palette.blue,
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
