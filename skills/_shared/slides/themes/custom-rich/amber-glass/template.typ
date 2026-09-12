// Amber Glass Theme — Warm amber/honey tones with translucent glass-morphism
// Looking through amber-tinted glass: warm, refractive, luminous.
// Cards have frosted-glass borders, content areas feel like light passing through honey.
// Features: honey-card, glass-panel, warm-stat, amber-divider
// Perfect for luxury brands, lifestyle products, premium services, wine/spirits
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  primary: rgb("#D4900A"),        // Warm amber
  secondary: rgb("#F5E6C8"),      // Pale honey
  honey-bg: rgb("#FFF5E0"),       // Honey-tinted special-slide background
  bg: rgb("#FFFDF8"),             // Warm white
  text: rgb("#3D2E1A"),           // Dark warm brown
  text-muted: rgb("#746247"),     // Accessible muted brown/gold
  accent: rgb("#9A5A00"),         // Deep amber accent for text and dark pages
  success: rgb("#3F6F2E"),        // Accessible botanical green
  surface: rgb("#FFF8EC"),        // Slightly tinted card background
)

#let _heading-font = ("Noto Serif SC", "Libertinus Serif")
#let _body-font = ("Arial", "Noto Sans SC", "Libertinus Serif")


// === Helper / Decorative Functions ===

/// Frosted glass border effect — a semi-transparent stroke that mimics light refraction
#let glass-stroke(weight: 1pt) = {
  (
    top: weight + palette.primary.transparentize(60%),
    rest: weight + palette.secondary.darken(5%),
  )
}

/// Small amber dot decoration
#let amber-dot(size: 5pt) = {
  circle(radius: size / 2, fill: palette.primary.transparentize(30%))
}


// === 1. Slide Functions ===

/// Content slide — warm white bg, amber title with honey underline
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text, size: 1.4em, weight: "semibold",
          font: _heading-font)
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Amber gradient underline
      block(width: 60pt, height: 2.5pt, fill: palette.primary, radius: 1.5pt),
    )
    // Subtle amber glow dot top-right
    place(top + right, dx: -2em, dy: 0.8em, amber-dot(size: 6pt))
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Amber diamond separator
        stack(dir: ltr, spacing: 4pt,
          line(length: 16pt, stroke: 0.8pt + palette.primary.transparentize(50%)),
          rotate(45deg, square(size: 3.5pt, fill: palette.primary.transparentize(30%))),
          line(length: 16pt, stroke: 0.8pt + palette.primary.transparentize(50%)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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

/// Title slide — amber-tinted bg, glass frame, centered title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm amber-tinted background
    place(top + left, block(width: 100%, height: 100%, fill: palette.honey-bg))
    // Soft amber radial glow at top-right
    place(top + right, dx: -3em, dy: 2em,
      circle(radius: 80pt, fill: palette.primary.transparentize(92%)))
    place(bottom + left, dx: 4em, dy: -3em,
      circle(radius: 60pt, fill: palette.secondary.transparentize(60%)))
    // Glass-morphism frame border
    place(center + horizon,
      rect(
        width: 92%,
        height: 86%,
        fill: none,
        stroke: 1.5pt + palette.primary.transparentize(50%),
        radius: 12pt,
      ))
    // Content centered with deterministic group spacing
    set std.align(center + horizon)
    let title-group = stack(
      spacing: 0.8em,
      text(size: 2.4em, weight: "bold", fill: palette.text,
        font: _heading-font, info.title),
      if info.subtitle != none {
        text(size: 1em, fill: palette.text-muted, font: _body-font, info.subtitle)
      },
    )
    let separator = std.align(center, stack(dir: ltr, spacing: 8pt,
      box(circle(radius: 2.5pt, fill: palette.primary.transparentize(40%))),
      line(length: 80pt, stroke: 1.5pt + palette.primary),
      box(circle(radius: 2.5pt, fill: palette.primary.transparentize(40%))),
    ))
    let metadata = stack(
      spacing: 0.8em,
      if info.author != none {
        text(size: 1.1em, weight: "semibold", fill: palette.accent,
          font: _body-font, info.author)
      },
      if info.institution != none {
        text(size: 0.85em, fill: palette.text-muted, font: _body-font, info.institution)
      },
      if info.date != none {
        text(size: 0.8em, fill: palette.text-muted, font: _body-font)[
          #utils.display-info-date(self)
        ]
      },
    )
    pad(x: 4em, stack(spacing: 1.1em, title-group, separator, metadata))
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

/// Section divider slide — amber accent band, warm bg, large section title
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
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Left amber accent band
    place(top + left, block(width: 6pt, height: 100%, fill: palette.primary))
    // Subtle amber glow circle
    place(top + right, dx: -4em, dy: 3em,
      circle(radius: 50pt, fill: palette.primary.transparentize(93%)))
    place(bottom + left, dx: 6em, dy: -2em,
      circle(radius: 35pt, fill: palette.secondary.transparentize(50%)))
    // Section content
    pad(left: 5em, right: 4em, top: 4em, bottom: 3em)[
      #v(1fr)
      #stack(spacing: 0.8em,
        {
          set text(fill: palette.text, size: 2.2em, weight: "semibold",
            font: _heading-font)
          utils.display-current-heading(level: 1)
        },
        block(width: 80pt, height: 3pt, fill: palette.primary, radius: 1.5pt),
        stack(dir: ltr, spacing: 6pt,
          box(circle(radius: 3pt, fill: palette.primary)),
          box(circle(radius: 2.5pt, fill: palette.primary.transparentize(40%))),
          box(circle(radius: 2pt, fill: palette.primary.transparentize(70%))),
        ),
      )
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep amber bg, white text, glass-morphism border
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Deep amber background
    place(top + left, block(width: 100%, height: 100%, fill: palette.accent))
    // Glass-morphism frosted overlay circle
    place(top + right, dx: -5em, dy: 2em,
      circle(radius: 70pt, fill: white.transparentize(93%)))
    place(bottom + left, dx: 3em, dy: -3em,
      circle(radius: 50pt, fill: white.transparentize(93%)))
    // Frosted glass inner frame
    place(center + horizon,
      block(
        width: 80%,
        height: 60%,
        fill: white.transparentize(90%),
        stroke: 1.5pt + white.transparentize(60%),
        radius: 12pt,
      ))
    // Center content
    set std.align(center + horizon)
    block(width: 100%, inset: (x: 2em))[
      #set text(fill: white, size: 1.8em, weight: "semibold",
        font: _heading-font)
      #set std.align(center)
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — warm gradient feel, amber accents, centered message
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
    // Warm honey-tinted background
    place(top + left, block(width: 100%, height: 100%, fill: palette.honey-bg))
    // Decorative amber circles
    place(top + left, dx: 3em, dy: 2em,
      circle(radius: 30pt, fill: palette.primary.transparentize(88%)))
    place(top + right, dx: -4em, dy: 3em,
      circle(radius: 45pt, fill: palette.secondary.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -2em,
      circle(radius: 25pt, fill: palette.primary.transparentize(85%)))
    // Glass-morphism frame remains in flow so diagnostics see the slide content
    set std.align(center + horizon)
    block(
      width: 60%,
      inset: (x: 2em, y: 1.5em),
      fill: white.transparentize(50%),
      stroke: 1pt + palette.primary.transparentize(50%),
      radius: 12pt,
    )[
      #stack(spacing: 0.8em,
        std.align(center, stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 2.5pt, fill: palette.primary.transparentize(50%))),
          box(circle(radius: 3.5pt, fill: palette.primary)),
          box(circle(radius: 2.5pt, fill: palette.primary.transparentize(50%))),
        )),
        text(size: 2.4em, weight: "bold", fill: palette.text,
          font: _heading-font, body),
        std.align(center, stack(dir: ltr, spacing: 6pt,
          line(length: 40pt, stroke: 1.2pt + palette.primary),
          box(rotate(45deg, square(size: 4pt, fill: palette.primary))),
          line(length: 40pt, stroke: 1.2pt + palette.primary),
        )),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Honey card — frosted glass card with amber top border, warm surface fill
#let honey-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (top: 3pt + accent, rest: 1pt + palette.secondary.darken(5%)),
    inset: (x: 1.1em, y: 0.8em),
    radius: 6pt,
  )[
    // Subtle glass shimmer at top-right
    #place(top + right, dx: -0.5em, dy: -0.3em,
      circle(radius: 8pt, fill: accent.transparentize(88%)))
    #stack(spacing: .8em,
      text(weight: "semibold", fill: palette.text, size: 0.92em,
        font: _heading-font, title),
      [
      #set text(fill: palette.text, size: 0.78em,
        font: _body-font)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Glass panel — translucent panel with frosted border, for highlighted content
#let glass-panel(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: accent.transparentize(92%),
    stroke: (left: 3pt + accent, rest: 1pt + accent.transparentize(70%)),
    inset: (x: 1.1em, y: 0.75em),
    radius: 6pt,
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3pt, fill: accent)),
        text(weight: "semibold", fill: accent.darken(25%), size: 0.9em,
          font: _heading-font, title),
      ),
      [
        #set text(fill: palette.text, size: 0.78em, font: _body-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Warm stat — KPI card with large amber number and label
#let warm-stat(label, value, trend: none) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (top: 3pt + palette.primary, rest: 1pt + palette.secondary.darken(5%)),
    inset: (x: 1em, y: 0.8em),
    radius: 6pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em,
      font: _body-font)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: palette.accent, size: 1.7em, weight: "bold",
          font: _heading-font)
        #value
        #if trend != none {
          h(0.3em)
          text(fill: palette.success, size: 0.5em, weight: "bold", trend)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Amber divider — decorative amber line separator with diamond accents
#let amber-divider() = {
  std.align(center, stack(dir: ltr, spacing: 4pt,
    line(length: 30pt, stroke: 0.8pt + palette.primary.transparentize(40%)),
    box(circle(radius: 2.5pt, fill: palette.primary.transparentize(30%))),
    line(length: 40pt, stroke: 1pt + palette.primary),
    box(circle(radius: 2.5pt, fill: palette.primary.transparentize(30%))),
    line(length: 30pt, stroke: 0.8pt + palette.primary.transparentize(40%)),
  ))
}

/// Amber tag — warm pill tag with honey border
#let amber-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color.transparentize(30%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(25%), size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Amber quote — quote block with warm amber left accent
#let amber-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (left: 3pt + palette.primary),
    inset: (left: 1.1em, right: 0.9em, y: 0.75em),
    radius: (right: 6pt),
  )[
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text, size: 0.84em, style: "italic",
          font: _heading-font)
        quote
      },
      if author != none {
        set text(fill: palette.text-muted, size: 0.75em, weight: "medium",
          style: "normal", font: _body-font)
        [-- #author]
      },
    )
    #lazy-v(1fr)
  ]
}


// === 3. Theme Entry Point ===

#let amber-glass-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text)
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
      primary: palette.accent,
      neutral-lightest: palette.bg,
      neutral-darkest: palette.text,
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
