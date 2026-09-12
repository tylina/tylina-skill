// Coral Theme — A warm, vibrant custom Touying theme
// Perfect for marketing, creative, or startup presentations
// Coral/salmon tones with a teal accent for contrast

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#C43C4A"),
  secondary: rgb("#B64F3D"),
  accent: rgb("#177D78"),
  bg: rgb("#FFF5F5"),
  card-bg: rgb("#FFFFFF"),
  dark: rgb("#2D3436"),
  light: rgb("#636E72"),
)

// ═══ Color Definitions ═══


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
    // Gradient-style header bar using coral primary
    show: components.cell.with(
      fill: gradient.linear(palette.primary, palette.secondary, angle: 0deg),
      inset: (x: 1.2em, y: 0.45em),
    )
    set std.align(horizon)
    set text(fill: white)
    stack(
      spacing: 0.8em,
      {
        set text(size: 0.7em, weight: "regular")
        utils.display-current-heading(level: 1)
      },
      {
        set text(size: 1.35em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: pad.with(0.4em)
    set text(fill: palette.light, size: 0.8em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        set std.align(left)
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      [],
      {
        set std.align(right)
        block(width: 4.2em, {
          set std.align(right)
          stack(
            dir: ltr,
            spacing: 0.3em,
            box(text(fill: palette.primary, sym.circle.filled)),
            block(width: 3em, {
              set std.align(right)
              context {
                utils.slide-counter.display() + " / " + utils.last-slide-number
              }
            }),
          )
        })
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

#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set align(center + horizon)
    // Decorative coral circles in background
    place(top + right, dx: 2em, dy: -1em,
      circle(radius: 80pt, fill: palette.primary.lighten(70%))
    )
    place(top + right, dx: -3em, dy: 2em,
      circle(radius: 40pt, fill: palette.secondary.lighten(60%))
    )
    place(bottom + left, dx: -1em, dy: 1em,
      circle(radius: 60pt, fill: palette.accent.lighten(70%))
    )
    place(bottom + left, dx: 4em, dy: -2em,
      circle(radius: 30pt, fill: palette.primary.lighten(80%))
    )
    // Title content
    stack(
      spacing: 0.8em,
      block(width: 85%, inset: (x: 2em), {
        stack(
          spacing: 0.8em,
          text(size: 2.4em, fill: palette.dark, weight: "bold", info.title),
          if info.subtitle != none {
            text(size: 1.2em, fill: palette.light, info.subtitle)
          },
        )
      }),
      // Coral accent line
      line(length: 9em, stroke: 2.5pt + palette.primary),
      {
        set text(fill: palette.dark, size: 0.9em)
        stack(
          spacing: 0.8em,
          if info.author != none {
            text(weight: "semibold", info.author)
          },
          if info.institution != none {
            text(fill: palette.light, info.institution)
          },
          if info.date != none {
            text(fill: palette.light, utils.display-info-date(self))
          },
          if info.keys().contains("contact") and info.contact != none {
            text(fill: palette.accent, info.contact)
          },
        )
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(fill: palette.bg),
  )
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)
    stack(
      spacing: 0.8em,
      line(length: 20%, stroke: 2pt + palette.secondary.lighten(40%)),
      {
        set text(size: 2.2em, fill: palette.primary, weight: "bold")
        utils.display-current-heading(level: 1)
      },
      line(length: 15%, stroke: 2pt + palette.accent),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(fill: palette.bg),
  )
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.primary, palette.secondary, angle: 135deg),
      margin: 2em,
    ),
  )
  set text(fill: white, size: 2em, weight: "bold")
  touying-slide(
    self: self,
    align(horizon + center, block(width: 85%, inset: (x: 1em))[#body]),
  )
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: gradient.linear(palette.primary, palette.accent, angle: 135deg),
      margin: 2em,
    ),
  )
  let main-body = {
    set align(center + horizon)
    // Decorative circles
    place(top + left, dx: 1em, dy: 1em,
      circle(radius: 25pt, fill: white.transparentize(85%))
    )
    place(bottom + right, dx: -1em, dy: -1em,
      circle(radius: 35pt, fill: white.transparentize(85%))
    )
    set text(fill: white, size: 2em, weight: "bold")
    block(width: 85%, inset: (x: 1em))[#body]
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Colored callout / highlight box
/// variant: "primary" (coral), "accent" (teal), or "neutral" (gray)
#let highlight-box(title, body, variant: "primary") = {
  let (accent-color, bg-color) = if variant == "accent" {
    (palette.accent, palette.accent.lighten(88%))
  } else if variant == "neutral" {
    (palette.light, palette.light.lighten(85%))
  } else {
    (palette.primary, palette.primary.lighten(88%))
  }
  block(
    width: 100%,
    fill: bg-color,
    stroke: (left: 3.5pt + accent-color),
    inset: 12pt,
    radius: (right: 6pt),
  )[
    #stack(spacing: .8em,
      [#text(weight: "bold", fill: accent-color, size: 1.05em, title)],
      [#body
       #lazy-v(1fr)],
    )
  ]
}

/// Horizontal row of metric / stat items
/// items: array of dicts with `label` and `value` keys
#let metric-row(items) = {
  let cells = items.map(item => {
    block(
      width: 100%,
      inset: (x: 0.5em, y: 0.6em),
    )[
      #set align(center)
      #stack(
        spacing: 0.8em,
        text(size: 1.8em, weight: "bold", fill: palette.primary, item.value),
        text(size: 0.8em, fill: palette.light, item.label),
      )
    ]
  })
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.primary.lighten(70%),
    radius: 8pt,
    inset: 6pt,
    grid(
      columns: items.len() * (1fr,),
      ..cells,
    ),
  )
}

/// Inline tag / badge component
#let tag(label, color: none) = {
  let tag-color = if color != none { color } else { palette.primary }
  box(
    fill: tag-color.lighten(80%),
    stroke: 0.5pt + tag-color.lighten(40%),
    radius: 4pt,
    inset: (x: 6pt, y: 3pt),
    text(fill: tag-color.darken(10%), size: 0.8em, weight: "medium", label),
  )
}

// ═══ 3. Theme Entry Point ═══

#let coral-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.dark)

  // List styling with coral bullets
  set list(marker: text(fill: palette.primary, sym.circle.filled))

  show raw.where(block: true): it => {
    block(
      width: 30em,
      fill: palette.card-bg,
      stroke: 0.5pt + palette.primary.lighten(65%),
      inset: 8pt,
      radius: 4pt,
      text(size: 0.72em, it),
    )
  }

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 0pt,
      footer-descent: 0pt,
      margin: (top: 4em, bottom: 2em, x: 2em),
      fill: palette.bg,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
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
