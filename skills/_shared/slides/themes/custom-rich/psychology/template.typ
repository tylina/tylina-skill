// Psychology Theme — Professional, warm, healing, trustworthy
// A light-themed Touying presentation theme with blue-green gradient accents
// Features: left accent bars, warm orange decorations, concentric circles, quote cards
// Perfect for psychotherapy training, attachment theory, counseling, developmental psychology
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  blue: rgb("#2E5C8E"),
  dark: rgb("#1E3A5F"),
  orange: rgb("#E07843"),
  green: rgb("#3D8B7A"),
  gray: rgb("#64748B"),
  red: rgb("#B54545"),
  bg: rgb("#F8FAFC"),
  card-bg: rgb("#FFFFFF"),
  border: rgb("#E2E8F0"),
  text-dark: rgb("#1E293B"),
  text-body: rgb("#475569"),
  text-light: rgb("#94A3B8"),
)

// ═══ Helper Functions ═══

// ═══ 1. Slide Functions ═══

/// Content slide — light bg, blue top bar, blue title with left accent, warm footer
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 3em,
      block(width: 100%, height: 6pt, fill: gradient.linear(palette.dark, palette.blue, palette.green)),
      stack(dir: ltr, spacing: 10pt,
        block(width: 8pt, height: 1.6em, fill: palette.blue, radius: (right: 2pt)),
        {
          set text(fill: palette.dark, size: 1.4em, weight: "bold")
          if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        },
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    grid(
      columns: (1fr, auto, 1fr),
      // Orange warm line accent on the left
      line(length: 40pt, stroke: 2pt + palette.orange),
      // Footer text
      if self.store.footer != none {
        set text(fill: palette.text-light, size: 0.7em)
        utils.call-or-display(self, self.store.footer)
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.7em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
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

/// Title slide — dark blue-to-green gradient bg, centered white card, warm decorations
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Full gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.dark, palette.blue, palette.green, angle: 135deg),
    ))
    // Concentric circle decorations
    place(top + right, dx: -40pt, dy: 30pt,
      circle(radius: 90pt, fill: white.transparentize(96%)))
    place(top + right, dx: -15pt, dy: 55pt,
      circle(radius: 65pt, fill: white.transparentize(95%)))
    place(top + right, dx: 5pt, dy: 75pt,
      circle(radius: 40pt, fill: white.transparentize(94%)))
    place(bottom + left, dx: 40pt, dy: -40pt,
      circle(radius: 70pt, fill: white.transparentize(96%)))
    place(bottom + left, dx: 60pt, dy: -60pt,
      circle(radius: 45pt, fill: white.transparentize(95%)))
    // Center white card
    set std.align(center + horizon)
    block(
      width: 62%,
      fill: white,
      stroke: none,
      radius: 16pt,
      inset: (x: 2.2em, y: 2.5em),
    )[
      #set std.align(center)
      // Title
      #text(size: 2em, weight: "bold", fill: palette.dark, info.title)
      #v(0.3em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 0.95em, fill: palette.text-body, info.subtitle)
        v(0.5em)
      }
      // Orange decorative line
      #std.align(center, line(length: 120pt, stroke: 3pt + palette.orange))
      #v(0.7em)
      // Author
      #if info.author != none {
        text(size: 1.1em, weight: "bold", fill: palette.blue, info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.85em, fill: palette.text-body, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.text-light)[#utils.display-info-date(self)]
      }
    ]
    // Bottom warm line decoration
    place(bottom, dy: -1.2em, std.align(center,
      line(length: 200pt, stroke: 2pt + palette.orange.transparentize(40%))
    ))
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

/// Section divider slide — blue-green gradient bg, white title, orange accent
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
    // Blue-green gradient background
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.dark, palette.blue, palette.green, angle: 135deg),
    ))
    // Concentric circle decorations
    place(top + right, dx: -60pt, dy: 40pt,
      circle(radius: 100pt, fill: white.transparentize(97%)))
    place(top + right, dx: -35pt, dy: 65pt,
      circle(radius: 75pt, fill: white.transparentize(96%)))
    place(bottom + left, dx: 50pt, dy: -50pt,
      circle(radius: 80pt, fill: white.transparentize(97%)))
    // Left accent bar
    place(left, dx: 40pt, dy: 35%, block(width: 8pt, height: 30%, fill: palette.orange, radius: 4pt))
    // Section content
    pad(left: 5em, top: 4em)[
      #v(1fr)
      #set text(fill: white, size: 2.2em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.6em)
      // Orange underline
      #line(length: 100pt, stroke: 3pt + palette.orange)
      #v(1fr)
    ]
    // Bottom warm line
    place(bottom, dy: -1.5em, std.align(center,
      line(length: 160pt, stroke: 2pt + palette.orange.transparentize(50%))
    ))
  }
  touying-slide(self: self, main-body)
})

/// TOC slide — light background with section list, warm accents
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
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
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.bg, white, angle: 135deg),
    ))
    // Concentric circle decorations top-right
    place(top + right, dx: -30pt, dy: 20pt,
      circle(radius: 60pt, fill: palette.blue.transparentize(95%)))
    place(top + right, dx: -10pt, dy: 40pt,
      circle(radius: 40pt, fill: palette.green.transparentize(94%)))
    // Bottom-left decoration
    place(bottom + left, dx: 30pt, dy: -30pt,
      circle(radius: 50pt, fill: palette.orange.transparentize(95%)))
    // Content
    pad(left: 4em, right: 4em, top: 2em, bottom: 1em)[
      // Title
      #text(size: 1.5em, weight: "bold", fill: palette.dark, title)
      #v(0.2em)
      // Orange underline
      #line(length: 80pt, stroke: 3pt + palette.orange)
      #v(1fr)
      // Section list using Touying's progressive outline
      #set text(size: 1.6em, fill: palette.text-dark, weight: "semibold")
      #outline(title: none, depth: 1)
      #v(2fr)
    ]
    // Bottom warm line
    place(bottom, dy: -1em, std.align(center,
      line(length: 160pt, stroke: 2pt + palette.orange.transparentize(50%))
    ))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — blue gradient bg, white text, centered
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.dark, palette.blue, angle: 135deg),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: white, size: 2em, weight: "bold")
  touying-slide(self: self, std.align(horizon + center, body))
})

/// Ending slide — light bg, centered card with warm accents
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
    place(top + left, block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(palette.bg, white, palette.green.transparentize(92%), angle: 135deg),
    ))
    // Concentric circles decoration
    place(top + right, dx: -30pt, dy: 30pt,
      circle(radius: 50pt, fill: palette.blue.transparentize(92%)))
    place(top + right, dx: -10pt, dy: 50pt,
      circle(radius: 30pt, fill: palette.green.transparentize(90%)))
    place(bottom + left, dx: 40pt, dy: -40pt,
      circle(radius: 45pt, fill: palette.orange.transparentize(92%)))
    place(bottom + left, dx: 60pt, dy: -60pt,
      circle(radius: 25pt, fill: palette.blue.transparentize(90%)))
    // Center card
    set std.align(center + horizon)
    block(
      width: 60%,
      fill: white,
      stroke: 1pt + palette.border,
      radius: 16pt,
      inset: (x: 2em, y: 2.2em),
    )[
      #set std.align(center)
      #text(size: 2.4em, weight: "bold", fill: palette.blue, body)
      #v(0.5em)
      // Orange decorative line
      #line(length: 140pt, stroke: 3pt + palette.orange)
      #v(0.4em)
      // Blue-green dot pair
      #stack(dir: ltr, spacing: 12pt,
        circle(radius: 4pt, fill: palette.blue),
        circle(radius: 4pt, fill: palette.green),
        circle(radius: 4pt, fill: palette.orange),
      )
    ]
    // Bottom warm line
    place(bottom, dy: -1em, std.align(center,
      line(length: 180pt, stroke: 2pt + palette.orange.transparentize(50%))
    ))
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Quote card — green left-border quote with optional author
#let quote-card(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.green.lighten(92%),
    stroke: (left: 4pt + palette.green),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      [
        #set text(fill: palette.text-dark, size: 0.9em, style: "italic")
        #sym.quote.double.low#quote#sym.quote.double.high
      ],
      if author != none {
        text(fill: palette.green, size: 0.8em, weight: "bold", style: "normal")[-- #author]
      },
      lazy-v(1fr),
    )
  ]
}

/// Concept card — theory/concept card with colored top accent
#let concept-card(title, body, accent: palette.blue) = {
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
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Callout box — generic accented box for key messages (case, insight, warning)
#let callout-box(title, body, accent: palette.blue, icon: none, title-color: auto) = {
  let t-color = if title-color == auto { accent } else { title-color }
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      if icon != none {
        stack(dir: ltr, spacing: 8pt,
          text(size: 1.1em, fill: t-color, icon),
          text(weight: "bold", fill: t-color, size: 0.95em, title),
        )
      } else {
        text(weight: "bold", fill: t-color, size: 0.95em, title)
      },
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
      ],
      lazy-v(1fr),
    )
  ]
}

/// Case study box — orange-accented case presentation
#let case-box(title, body) = callout-box(title, body, accent: palette.orange, icon: sym.bullet, title-color: palette.orange.darken(15%))

/// Capsule-shaped tag
#let tag(content, color: palette.blue) = {
  box(
    fill: color.lighten(85%),
    stroke: 1pt + color.lighten(50%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(10%), size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Insight/finding box — green-accented research insight
#let insight-box(title, body) = callout-box(title, body, accent: palette.green, icon: sym.arrow.r, title-color: palette.green.darken(10%))

/// Warning/risk box — red-accented clinical caution
#let warning-box(title, body) = callout-box(title, body, accent: palette.red)

// ═══ 3. Theme Entry Point ═══

#let psychology-theme(
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
      primary: palette.blue,
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
