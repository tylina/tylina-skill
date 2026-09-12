// Gov-Red Theme — Authoritative, dignified government-style Touying theme
// Dual-color gradient bar (Government Red to Government Blue), gold accents
// Features: red number blocks, policy cards, achievement boxes, milestone timeline
// Perfect for government briefings, policy interpretation, work summaries, Party/state events
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  red: rgb("#8B0000"),
  blue: rgb("#003366"),
  gold: rgb("#DAA520"),
  bg: rgb("#FFFFFF"),
  bg-light: rgb("#F5F7FA"),
  card-bg: rgb("#FFFFFF"),
  border: rgb("#D5D8DC"),
  text-dark: rgb("#1A1A1A"),
  text-body: rgb("#4A4A4A"),
  text-light: rgb("#888888"),
)

// ═══ Helper Functions ═══

/// Dual-color gradient top bar (government red to government blue)
#let dual-gradient-bar(height: 6pt) = {
  block(width: 100%, height: height, fill: gradient.linear(palette.red, palette.blue))
}

/// Red number block with white number
#let red-number(num) = {
  box(
    fill: palette.red,
    width: 2em,
    height: 2em,
    radius: 4pt,
    inset: 0pt,
  )[
    #set align(center + horizon)
    #set text(fill: white, weight: "bold", size: 1em)
    #str(num)
  ]
}

/// Gold accent line
#let gold-line(width: 120pt) = {
  block(width: width, height: 3pt, fill: palette.gold, radius: 1.5pt)
}

/// Gold decorative dots
#let gold-dots(size: 4pt, spacing: 10pt) = {
  stack(dir: ltr, spacing: spacing,
    box(circle(radius: size, fill: palette.gold)),
    box(circle(radius: size * 0.7, fill: palette.red.transparentize(40%))),
    box(circle(radius: size, fill: palette.gold)),
    box(circle(radius: size * 0.7, fill: palette.blue.transparentize(40%))),
    box(circle(radius: size, fill: palette.gold)),
  )
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
    // Red-blue gradient top bar
    block(width: 100%, height: 6pt, fill: gradient.linear(palette.red, palette.blue))
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.3em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.red, size: 1.5em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 80pt, height: 3pt, fill: palette.gold, radius: 1.5pt)
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      {
        stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 3pt, fill: palette.gold)),
          box(circle(radius: 2pt, fill: palette.red.transparentize(40%))),
          box(circle(radius: 3pt, fill: palette.gold)),
          box(circle(radius: 2pt, fill: palette.blue.transparentize(40%))),
          box(circle(radius: 3pt, fill: palette.gold)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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
    // Light background with subtle warm tones
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.bg-light, white, palette.bg-light, angle: 135deg),
    ))
    // Top red-blue gradient bar (thicker for title)
    place(top, block(width: 100%, height: 8pt, fill: gradient.linear(palette.red, palette.blue)))
    // Left red vertical accent
    place(left, dy: 0pt, block(width: 8pt, height: 50%, fill: palette.red))
    place(left, dy: 50%, block(width: 8pt, height: 50%, fill: palette.blue))
    // Decorative circles (translucent but visible)
    place(top + right, dx: -80pt, dy: 50pt,
      circle(radius: 65pt, fill: palette.red.transparentize(88%)))
    place(bottom + left, dx: 80pt, dy: -60pt,
      circle(radius: 55pt, fill: palette.blue.transparentize(88%)))
    // Center content card
    set std.align(center + horizon)
    block(
      width: 65%,
      fill: white,
      stroke: (top: 4pt + palette.red, bottom: 4pt + palette.blue, left: 1pt + palette.border, right: 1pt + palette.border),
      radius: 4pt,
      inset: (x: 2em, y: 1.5em),
    )[
      #set std.align(center)
      // Gold star decoration
      #text(size: 1.2em, fill: palette.gold)[#sym.star.filled]
      #v(0.2em)
      // Title
      #text(size: 2em, weight: "bold", fill: palette.red, info.title)
      #v(0.2em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 0.95em, fill: palette.text-body, info.subtitle)
        v(0.3em)
      }
      // Gold line separator
      #align(center, block(width: 160pt, height: 3pt, fill: palette.gold, radius: 1.5pt))
      #v(0.4em)
      // Author
      #if info.author != none {
        text(size: 1.1em, weight: "bold", fill: palette.blue, info.author)
        v(0.15em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.85em, fill: palette.text-body, info.institution)
        v(0.15em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.text-light)[#utils.display-info-date(self)]
      }
    ]
    // Bottom gold dots
    place(bottom + center, dy: -1.5em, gold-dots(size: 5pt, spacing: 14pt))
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
    // Deep blue gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.blue, palette.blue.darken(30%), angle: 135deg),
    ))
    // Decorative circles (subtle on dark blue)
    place(top + right, dx: -60pt, dy: 40pt,
      circle(radius: 100pt, fill: white.transparentize(93%)))
    place(bottom + left, dx: 40pt, dy: -40pt,
      circle(radius: 80pt, fill: white.transparentize(94%)))
    // Left gold accent stripe
    place(left, dx: 40pt, dy: 30%, block(width: 6pt, height: 35%, fill: palette.gold))
    // Section content
    pad(left: 5em, top: 4em, right: 3em)[
      // Red number block
      #v(1fr)
      // Gold line above title
      #block(width: 80pt, height: 3pt, fill: palette.gold, radius: 1.5pt)
      #v(0.5em)
      #set text(fill: white, size: 2.2em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.4em)
      // Gold star decoration (prominent)
      #text(fill: palette.gold, size: 1.5em)[#sym.star.filled]
      #v(1fr)
    ]
    // Bottom red gradient line
    place(bottom, block(width: 100%, height: 4pt, fill: gradient.linear(palette.red, palette.gold)))
    // Bottom gold dots
    place(bottom + center, dy: -1.5em, stack(dir: ltr, spacing: 10pt,
      box(circle(radius: 4pt, fill: palette.gold)),
      box(circle(radius: 3pt, fill: white.transparentize(50%))),
      box(circle(radius: 4pt, fill: palette.gold)),
      box(circle(radius: 3pt, fill: white.transparentize(50%))),
      box(circle(radius: 4pt, fill: palette.gold)),
    ))
  }
  touying-slide(self: self, main-body)
})

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
    // Light warm background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.bg-light, white, palette.bg-light, angle: 135deg),
    ))
    // Top red-blue gradient bar
    place(top, block(width: 100%, height: 6pt, fill: gradient.linear(palette.red, palette.blue)))
    // Decorative corners (visible translucent circles)
    place(top + left, dx: 30pt, dy: 30pt,
      circle(radius: 28pt, fill: palette.red.transparentize(85%)))
    place(top + right, dx: -30pt, dy: 30pt,
      circle(radius: 23pt, fill: palette.blue.transparentize(85%)))
    place(bottom + left, dx: 30pt, dy: -30pt,
      circle(radius: 25pt, fill: palette.gold.transparentize(80%)))
    place(bottom + right, dx: -30pt, dy: -30pt,
      circle(radius: 28pt, fill: palette.red.transparentize(85%)))
    // Center card
    set std.align(center + horizon)
    block(
      width: 60%,
      fill: white,
      stroke: (top: 4pt + palette.red, bottom: 4pt + palette.blue, left: 1pt + palette.border, right: 1pt + palette.border),
      radius: 4pt,
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      // Gold star
      #text(size: 1.4em, fill: palette.gold)[#sym.star.filled]
      #v(0.4em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.red, body)
      #v(0.5em)
      // Gold separator
      #block(width: 120pt, height: 3pt, fill: palette.gold, radius: 1.5pt)
    ]
    // Bottom gold dots
    place(bottom + center, dy: -1em, gold-dots(size: 4pt, spacing: 12pt))
  }
  touying-slide(self: self, main-body)
})

/// TOC slide — table of contents with red number blocks
#let outline-slide(title: [目 录], items) = touying-slide-wrapper(self => {
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
    dual-gradient-bar()
    // Title
    pad(left: 2.5em, top: 1.2em)[
      #text(size: 1.8em, weight: "bold", fill: palette.red, title)
      #v(-0.2em)
      #gold-line()
    ]
    // Chapter list
    pad(left: 2.5em, top: 0em)[
      #for (i, item) in items.enumerate() {
        v(0.5em)
        stack(dir: ltr, spacing: 14pt,
          red-number("0" + str(i + 1)),
          // Chapter title
          std.align(horizon, text(size: 1.1em, weight: "semibold", fill: palette.blue, item)),
        )
      }
    ]
    // Right decorative area
    place(right, dx: -6em, dy: 30%,
      circle(radius: 80pt, fill: palette.red.transparentize(95%)))
    place(right, dx: -4em, dy: 50%,
      circle(radius: 50pt, fill: palette.blue.transparentize(95%)))
    // Bottom gold dots
    place(bottom + center, dy: -1em, gold-dots(size: 4pt, spacing: 12pt))
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Policy card with red number block, title, and description
#let policy-card(number, title, description) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + palette.red, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.6em),
    radius: (right: 6pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 10pt,
        // Red number block
        box(
          fill: palette.red,
          width: 1.8em,
          height: 1.8em,
          radius: 4pt,
          inset: 0pt,
        )[
          #set align(center + horizon)
          #set text(fill: white, weight: "bold", size: 0.9em)
          #str(number)
        ],
        std.align(horizon, text(weight: "bold", fill: palette.blue, size: 1em, title)),
      ),
      [
        #set text(fill: palette.text-body, size: 0.8em)
        #description
      ],
    )
    #lazy-v(1fr)
  ]
}

/// Info box — base callout box for notices, regulations, achievements
/// accent color controls left border, fill, and title color; icon is optional prefix.
#let info-box(title, body, accent: palette.blue, icon: none) = {
  block(
    width: 100%,
    fill: accent.lighten(93%),
    stroke: (left: 4pt + accent),
    inset: 14pt,
    radius: (right: 6pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent.darken(10%), size: 0.95em)[#if icon != none { icon; [ ] }#title],
      [
        #set text(fill: palette.text-body, size: 0.85em)
        #body
      ],
    )
    #lazy-v(1fr)
  ]
}

/// Achievement box with gold accent (alias of info-box)
#let achievement-box(title, body) = info-box(title, body, accent: palette.gold, icon: sym.star.filled)

/// Data/metric card with large number
#let data-card(label, value, accent: palette.red) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.6em),
    radius: (bottom: 6pt),
  )[
    #set align(center)
    #stack(
      spacing: .8em,
      text(fill: accent, size: 1.4em, weight: "bold", box(value)),
      text(fill: palette.text-body, size: 0.8em, label),
    )
    #lazy-v(1fr)
  ]
}

/// Styled report table with red header
#let report-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.red }
      else if calc.odd(row) { palette.card-bg } else { palette.bg-light },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.55em, y: 0.2em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.75em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.72em, c)),
  )
}

/// Milestone/timeline item with year marker
#let milestone-item(year, title, content) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.7em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 10pt,
        // Year badge in blue
        box(
          fill: palette.blue,
          inset: (x: 0.6em, y: 0.3em),
          radius: 4pt,
        )[
          #set text(fill: white, weight: "bold", size: 0.8em)
          #year
        ],
        std.align(horizon, text(weight: "bold", fill: palette.red, size: 0.95em, title)),
      ),
      [
        #set text(fill: palette.text-body, size: 0.8em)
        #content
      ],
    )
    #lazy-v(1fr)
  ]
}

/// Stat row — horizontal layout of key metrics
#let stat-row(..items) = {
  let accent-colors = (palette.red, palette.blue, palette.gold, palette.red.lighten(20%))
  let cells = items.pos().enumerate().map(((i, item)) => {
    let color = accent-colors.at(calc.rem(i, 4))
    block(width: 100%, inset: 0.5em)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "bold", fill: color, item.at("value")),
        text(size: 0.8em, fill: palette.text-body, item.at("label")),
      )
    ]
  })
  grid(columns: cells.len(), column-gutter: 0.5em, ..cells)
}

// ═══ 3. Theme Entry Point ═══

#let gov-red-theme(
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
      margin: (top: 6.2em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.red,
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
