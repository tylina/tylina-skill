// Cherry Theme — A Touying theme inspired by Japanese cherry blossoms (sakura)
// Soft pinks, warm reds, and white — elegant and poetic.
// Perfect for cultural presentations, art, literature, or any aesthetic topic.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#C62828"),
  secondary: rgb("#E91E63"),
  accent: rgb("#F8BBD0"),
  bg: rgb("#FFF0F0"),
  card-bg: rgb("#FFFFFF"),
  petal: rgb("#FCE4EC"),
  text-dark: rgb("#3E2723"),
  text-light: rgb("#806158"),
  gold: rgb("#9C5600"),
)

// ═══ 1. Slide Functions ═══

#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top + left)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.25em))
    stack(
      spacing: .8em,
      {
        set text(fill: palette.primary, size: 1.35em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 54pt, height: 2pt, fill: palette.accent),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: pad.with(.4em)
    set text(fill: palette.text-light, size: .8em)
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
        block(width: 2em, {
          set std.align(right)
          context { utils.slide-counter.display() }
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

    // Decorative cherry blossom circles scattered around
    place(top + left, dx: 5%, dy: 8%,
      circle(radius: 12pt, fill: palette.accent.lighten(20%), stroke: none))
    place(top + left, dx: 10%, dy: 15%,
      circle(radius: 6pt, fill: palette.petal, stroke: none))
    place(top + left, dx: 3%, dy: 22%,
      circle(radius: 8pt, fill: palette.secondary.lighten(60%), stroke: none))
    place(top + right, dx: -8%, dy: 10%,
      circle(radius: 14pt, fill: palette.petal, stroke: none))
    place(top + right, dx: -15%, dy: 5%,
      circle(radius: 7pt, fill: palette.accent, stroke: none))
    place(top + right, dx: -5%, dy: 20%,
      circle(radius: 9pt, fill: palette.secondary.lighten(50%), stroke: none))
    place(bottom + left, dx: 8%, dy: -10%,
      circle(radius: 10pt, fill: palette.accent.lighten(10%), stroke: none))
    place(bottom + left, dx: 15%, dy: -15%,
      circle(radius: 5pt, fill: palette.petal, stroke: none))
    place(bottom + right, dx: -10%, dy: -8%,
      circle(radius: 11pt, fill: palette.petal, stroke: none))
    place(bottom + right, dx: -18%, dy: -12%,
      circle(radius: 6pt, fill: palette.accent, stroke: none))
    place(bottom + right, dx: -6%, dy: -18%,
      circle(radius: 8pt, fill: palette.secondary.lighten(70%), stroke: none))

    stack(
      spacing: .8em,
      // Title block
      block(width: 85%, inset: (x: 1.5em, y: 1em), {
        stack(
          spacing: .8em,
          text(size: 2.2em, fill: palette.primary, weight: "bold", info.title),
          if info.subtitle != none {
            text(size: 1.1em, fill: palette.text-light, style: "italic", info.subtitle)
          },
        )
      }),
      // Decorative divider line
      line(length: 30%, stroke: 1.5pt + palette.accent),
      // Author, date, institution
      stack(
        spacing: .8em,
        if info.author != none {
          text(fill: palette.text-dark, size: 0.9em, weight: "medium", info.author)
        },
        if info.institution != none {
          text(fill: palette.text-light, size: 0.85em, info.institution)
        },
        if info.date != none {
          text(fill: palette.text-light, size: 0.85em, utils.display-info-date(self))
        },
      ),
    )
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)

    // Small decorative petals
    place(center + horizon, dx: -35%, dy: -15%,
      circle(radius: 8pt, fill: palette.petal, stroke: none))
    place(center + horizon, dx: 38%, dy: -10%,
      circle(radius: 6pt, fill: palette.accent, stroke: none))
    place(center + horizon, dx: -30%, dy: 18%,
      circle(radius: 5pt, fill: palette.accent.lighten(20%), stroke: none))
    place(center + horizon, dx: 35%, dy: 15%,
      circle(radius: 7pt, fill: palette.petal, stroke: none))

    stack(
      spacing: .8em,
      line(length: 15%, stroke: 2.5pt + palette.primary),
      {
        set text(size: 2em, fill: palette.primary, weight: "semibold")
        utils.display-current-heading(level: 1)
      },
      line(length: 15%, stroke: 2.5pt + palette.primary),
    )
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 2em,
    ),
  )
  set text(fill: white, size: 2em)
  touying-slide(
    self: self,
    align(horizon + center, block(width: 100%, inset: (x: 1em))[#body]),
  )
})

#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.petal,
      margin: 2em,
    ),
  )
  set text(fill: palette.primary, size: 2em, weight: "semibold")
  touying-slide(
    self: self,
    align(center + horizon, block(width: 100%, inset: (x: 1em))[#body]),
  )
})

// ═══ 2. Reusable Components ═══

// Sakura card — card with pink left border and petal-pink background
#let sakura-card(title, body, accent: none) = {
  let accent-color = if accent != none { accent } else { palette.secondary }
  block(
    width: 30em,
    fill: palette.petal,
    stroke: (left: 3pt + accent-color),
    inset: 12pt,
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      [#text(weight: "medium", fill: accent-color, title)],
      [#body
       #lazy-v(1fr)],
    )
  ]
}

// Haiku box — a three-line text display with elegant formatting
#let haiku-box(line1, line2, line3) = {
  block(
    width: 30em,
    fill: palette.bg,
    inset: (x: 2em, y: 1.2em),
    radius: 6pt,
    stroke: 0.5pt + palette.accent,
  )[
    #set align(center)
    #set text(fill: palette.text-dark, style: "italic", size: 1.05em)
    #stack(
      spacing: .8em,
      line1,
      line(length: 6em, stroke: 0.5pt + palette.accent),
      line2,
      line(length: 6em, stroke: 0.5pt + palette.accent),
      line3,
    )
  ]
}

// Accent tag — inline rounded badge in cherry red
#let accent-tag(label) = {
  box(
    fill: palette.primary,
    inset: (x: 8pt, y: 4pt),
    radius: 10pt,
    text(fill: white, size: 0.8em, weight: "bold", label),
  )
}

// Petal divider — decorative divider with small circle "petals"
#let petal-divider() = {
  set align(center)
  block(width: 30em, inset: (y: 0.3em), {
    stack(
      dir: ltr,
      spacing: 6pt,
      line(length: 10em, stroke: 0.8pt + palette.accent),
      box(circle(radius: 3pt, fill: palette.accent, stroke: none)),
      box(circle(radius: 4pt, fill: palette.secondary.lighten(40%), stroke: none)),
      box(circle(radius: 3pt, fill: palette.petal, stroke: none)),
      box(circle(radius: 4pt, fill: palette.accent, stroke: none)),
      box(circle(radius: 3pt, fill: palette.secondary.lighten(50%), stroke: none)),
      line(length: 10em, stroke: 0.8pt + palette.accent),
    )
  })
}

// ═══ 3. Theme Entry Point ═══

#let cherry-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)

  show raw.where(block: true): it => {
    block(
      width: 30em,
      fill: palette.card-bg,
      stroke: 0.5pt + palette.accent,
      inset: 8pt,
      radius: 4pt,
      text(size: 0.72em, it),
    )
  }

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
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
