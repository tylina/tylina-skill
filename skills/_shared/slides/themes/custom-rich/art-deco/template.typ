// Art Deco Theme — 1920s glamour meets modern corporate luxury
// Deep navy backgrounds with champagne gold accents, geometric patterns
// Features: gold frames, chevrons, sunburst decorations, fan shapes
// Perfect for luxury brands, fashion, awards, galas, finance, premium launches
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  gold: rgb("#C9A84C"),
  navy: rgb("#0A1628"),
  emerald: rgb("#2D4A3E"),
  cream: rgb("#FFFDF7"),
  white: rgb("#FFFFFF"),
  text-dark: rgb("#1A1A2E"),
  text-body: rgb("#3D3D56"),
  text-light: rgb("#756A42"),
  gold-text: rgb("#755A12"),
  border: rgb("#D4CFC2"),
)

// ═══ Helper / Decorative Functions ═══

/// Small gold diamond shape
#let gold-diamond(size: 6pt) = {
  rotate(45deg, square(size: size, fill: palette.gold))
}

// ═══ 1. Slide Functions ═══

/// Content slide — cream bg, navy title with gold underline, gold diamond accent
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.navy, size: 1.4em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Gold underline accent
      block(width: 60pt, height: 2.5pt, fill: palette.gold, radius: 1pt),
    )
    // Small gold diamond in top-right corner
    place(top + right, dx: -1.5em, dy: 0.6em, gold-diamond(size: 5pt))
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      // Gold chevron accent on left
      {
        stack(dir: ltr, spacing: 3pt,
          rotate(45deg, square(size: 3.5pt, fill: palette.gold)),
          line(length: 20pt, stroke: 1pt + palette.gold),
        )
      },
      // Footer text center
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // Persistent Art Deco atmosphere in the body area.
    place(right + horizon, dx: -1.25em,
      stack(spacing: 0.8em,
        rotate(45deg, square(size: 3pt, fill: palette.gold.transparentize(55%))),
        rotate(45deg, square(size: 2.5pt, fill: palette.gold.transparentize(70%))),
        rotate(45deg, square(size: 2pt, fill: palette.gold.transparentize(82%))),
      )
    )
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

/// Title slide — deep navy bg, gold geometric frame, centered title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Deep navy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.navy))
    // Gold corner brackets (frame effect)
    place(top + left, dx: 30pt, dy: 30pt, {
      line(length: 50pt, angle: 0deg, stroke: 2pt + palette.gold)
      line(length: 50pt, angle: 90deg, stroke: 2pt + palette.gold)
    })
    place(top + right, dx: -30pt, dy: 30pt, {
      line(length: 50pt, angle: 180deg, stroke: 2pt + palette.gold)
      line(length: 50pt, angle: 90deg, stroke: 2pt + palette.gold)
    })
    place(bottom + left, dx: 30pt, dy: -30pt, {
      line(length: 50pt, angle: 0deg, stroke: 2pt + palette.gold)
      line(length: 50pt, angle: -90deg, stroke: 2pt + palette.gold)
    })
    place(bottom + right, dx: -30pt, dy: -30pt, {
      line(length: 50pt, angle: 180deg, stroke: 2pt + palette.gold)
      line(length: 50pt, angle: -90deg, stroke: 2pt + palette.gold)
    })
    // Subtle gold lines connecting the corners (inner frame)
    place(top + left, dx: 80pt, dy: 30pt, line(length: 100% - 160pt, stroke: 0.5pt + palette.gold.transparentize(70%)))
    place(bottom + left, dx: 80pt, dy: -30pt, line(length: 100% - 160pt, stroke: 0.5pt + palette.gold.transparentize(70%)))
    // Center content
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(
        spacing: 0.8em,
        text(size: 2.4em, weight: "bold", fill: palette.gold, info.title),
        if info.subtitle != none {
          text(size: 1em, fill: palette.cream.transparentize(20%), info.subtitle)
        },
        // Gold decorative separator line with diamonds
        std.align(center, stack(dir: ltr, spacing: 8pt,
          line(length: 60pt, stroke: 1.5pt + palette.gold),
          rotate(45deg, square(size: 5pt, fill: palette.gold)),
          line(length: 60pt, stroke: 1.5pt + palette.gold),
        )),
        stack(
          spacing: 0.8em,
          if info.author != none {
            text(size: 1.1em, weight: "semibold", fill: palette.cream, info.author)
          },
          if info.institution != none {
            text(size: 0.85em, fill: palette.gold.transparentize(30%), info.institution)
          },
          if info.date != none {
            text(size: 0.8em, fill: palette.cream.transparentize(40%), utils.display-info-date(self))
          },
        ),
      )
    ]
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

/// Section divider slide — navy bg, gold fan/sunburst, section title in gold
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
    // Deep navy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.navy))
    // Gold fan/sunburst rays from bottom-left
    place(bottom + left, dx: 60pt, dy: -40pt, {
      let gold = palette.gold.transparentize(60%)
      for i in range(9) {
        let angle = -90deg + (i * 10deg)
        place(center + horizon,
          rotate(angle, line(length: 120pt, stroke: 1pt + gold))
        )
      }
    })
    // Gold corner accents top-right
    place(top + right, dx: -40pt, dy: 40pt, {
      line(length: 35pt, angle: 180deg, stroke: 1.5pt + palette.gold)
      line(length: 35pt, angle: 90deg, stroke: 1.5pt + palette.gold)
    })
    // Section content
    pad(left: 6em, top: 4em, bottom: 2em, right: 4em)[
      #v(1fr)
      #stack(
        spacing: 0.8em,
        {
          set text(fill: palette.gold, size: 2.2em, weight: "semibold")
          utils.display-current-heading(level: 1)
        },
        block(width: 100pt, height: 3pt, fill: palette.gold, radius: 1.5pt),
        stack(dir: ltr, spacing: 8pt,
          rotate(45deg, square(size: 4pt, fill: palette.gold)),
          rotate(45deg, square(size: 3pt, fill: palette.gold.transparentize(40%))),
          rotate(45deg, square(size: 2pt, fill: palette.gold.transparentize(70%))),
        ),
      )
      #v(1fr)
    ]
    // Bottom gold line accent
    place(bottom, dy: -1.5em, std.align(center,
      line(length: 200pt, stroke: 1pt + palette.gold.transparentize(50%))
    ))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — navy bg, gold border frame, elegant centered text
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
    // Navy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.navy))
    // Aspect-ratio-safe gold frame
    place(center + horizon,
      rect(width: 94%, height: 90%, stroke: 1.5pt + palette.gold)
    )
    // Corner accents at frame corners
    place(top + left, dx: 20pt, dy: 20pt, rotate(45deg, square(size: 6pt, fill: palette.gold)))
    place(top + right, dx: -20pt, dy: 20pt, rotate(45deg, square(size: 6pt, fill: palette.gold)))
    place(bottom + left, dx: 20pt, dy: -20pt, rotate(45deg, square(size: 6pt, fill: palette.gold)))
    place(bottom + right, dx: -20pt, dy: -20pt, rotate(45deg, square(size: 6pt, fill: palette.gold)))
    // Center content
    set std.align(center + horizon)
    pad(x: 3em)[
      #set text(fill: white, size: 1.8em, weight: "semibold")
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — navy bg, gold chevron pattern, "Thank You" display
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
    // Navy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.navy))
    // Chevron pattern (V-shapes) decorative top area
    place(top + center, dy: 40pt, {
      for i in range(5) {
        place(center, dy: i * 12pt, {
          let opacity = 30% + i * 12%
          let w = 120pt - i * 15pt
          // Draw V-shape using two lines meeting at center
          place(center, dx: -(w / 2), line(length: w / 1.4, angle: 30deg, stroke: 1pt + palette.gold.transparentize(opacity)))
          place(center, dx: (w / 2), line(length: w / 1.4, angle: 150deg, stroke: 1pt + palette.gold.transparentize(opacity)))
        })
      }
    })
    // Bottom fan pattern
    place(bottom + center, dy: -30pt, {
      for i in range(7) {
        let angle = -15deg + (i * 5deg)
        place(center, rotate(angle, line(length: 50pt, stroke: 0.8pt + palette.gold.transparentize(60%))))
      }
    })
    // Gold corner brackets
    place(top + left, dx: 30pt, dy: 30pt, {
      line(length: 40pt, angle: 0deg, stroke: 1.5pt + palette.gold)
      line(length: 40pt, angle: 90deg, stroke: 1.5pt + palette.gold)
    })
    place(bottom + right, dx: -30pt, dy: -30pt, {
      line(length: 40pt, angle: 180deg, stroke: 1.5pt + palette.gold)
      line(length: 40pt, angle: -90deg, stroke: 1.5pt + palette.gold)
    })
    // Center text
    set std.align(center + horizon)
    block(
      width: 55%,
      inset: (x: 2em, y: 1.5em),
    )[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        // Decorative diamonds above
        stack(dir: ltr, spacing: 10pt,
          rotate(45deg, square(size: 3pt, fill: palette.gold.transparentize(50%))),
          rotate(45deg, square(size: 5pt, fill: palette.gold)),
          rotate(45deg, square(size: 3pt, fill: palette.gold.transparentize(50%))),
        ),
        text(size: 2.6em, weight: "semibold", fill: palette.gold, body),
        // Gold decorative line with diamond
        stack(dir: ltr, spacing: 6pt,
          line(length: 50pt, stroke: 1.5pt + palette.gold),
          rotate(45deg, square(size: 4pt, fill: palette.gold)),
          line(length: 50pt, stroke: 1.5pt + palette.gold),
        ),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline/TOC slide — cream bg with gold markers
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
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.cream))
    // Gold corner accent top-right
    place(top + right, dx: -30pt, dy: 30pt, {
      line(length: 30pt, angle: 180deg, stroke: 1.5pt + palette.gold)
      line(length: 30pt, angle: 90deg, stroke: 1.5pt + palette.gold)
    })
    // Gold corner accent bottom-left
    place(bottom + left, dx: 30pt, dy: -30pt, {
      line(length: 30pt, angle: 0deg, stroke: 1.5pt + palette.gold)
      line(length: 30pt, angle: -90deg, stroke: 1.5pt + palette.gold)
    })
    // Content
    pad(left: 4em, right: 4em, top: 2.5em, bottom: 1.5em)[
      #stack(
        spacing: 0.8em,
        // Title with gold diamond marker
        stack(dir: ltr, spacing: 10pt,
          rotate(45deg, square(size: 6pt, fill: palette.gold)),
          text(size: 1.5em, weight: "semibold", fill: palette.navy, title),
        ),
        block(width: 80pt, height: 2.5pt, fill: palette.gold, radius: 1pt),
      )
      #v(1fr)
      // Section list
      #set text(size: 1.4em, fill: palette.text-dark, weight: "semibold")
      #outline(title: none, depth: 1)
      #v(2fr)
    ]
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Gilded card — card with gold top border + corner detail
#let gilded-card(title, body, accent: palette.gold) = {
  block(
    width: 100%,
    fill: palette.white,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 6pt),
  )[
    // Small corner triangle detail top-right
    #place(top + right, dx: -0.3em, dy: -0.3em,
      polygon(fill: accent.transparentize(60%),
        (0pt, 0pt), (12pt, 0pt), (0pt, 12pt)))
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.navy, size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Deco box — callout with geometric stepped left border
#let deco-box(title, body, accent: palette.gold) = {
  block(
    width: 100%,
    fill: accent.lighten(90%),
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 6pt),
  )[
    #stack(
      spacing: 0.8em,
      // Small diamond before title
      stack(dir: ltr, spacing: 6pt,
        rotate(45deg, square(size: 4pt, fill: accent)),
        text(weight: "bold", fill: if accent == palette.gold { palette.gold-text } else { accent.darken(20%) }, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}

/// Trophy stat — centered icon → value → label KPI card
#let trophy-stat(label, value, trend: none) = {
  block(
    width: 100%,
    fill: palette.white,
    stroke: (top: 3pt + palette.gold, rest: 1pt + palette.border),
    inset: (x: 0.65em, y: 0.5em),
    radius: (bottom: 6pt),
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      gold-diamond(size: 3.5pt),
      text(fill: palette.gold-text, size: 1.55em, weight: "semibold", value),
      text(fill: palette.text-dark, size: 0.68em, weight: "semibold", label),
      if trend != none {
        box(text(fill: palette.emerald, size: 0.64em, weight: "bold", trend))
      },
    )
    #lazy-v(1fr)
  ]
}

/// Chevron divider — decorative gold chevron line separator
#let chevron-divider() = {
  let chevron = box(width: 12pt, height: 7pt)[
    #place(top + left, line(length: 8pt, angle: 35deg, stroke: 1pt + palette.gold))
    #place(top + right, line(length: 8pt, angle: 145deg, stroke: 1pt + palette.gold))
  ]
  std.align(center, stack(dir: ltr, spacing: 4pt,
    line(length: 30pt, stroke: 1pt + palette.gold.transparentize(40%)),
    chevron,
    chevron,
    chevron,
    line(length: 30pt, stroke: 1pt + palette.gold.transparentize(40%)),
  ))
}

/// Gatsby tag — elegant pill tag with gold border
#let gatsby-tag(content, color: palette.gold) = {
  let text-color = if color == palette.gold { palette.gold-text } else { color.darken(10%) }
  box(
    fill: color.transparentize(90%),
    stroke: 1pt + color,
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: text-color, size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Marquee quote — quote with art deco quotation marks
#let marquee-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.cream,
    stroke: (left: 3pt + palette.gold),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 6pt),
  )[
    // Large gold quotation mark
    #place(top + left, dx: -0.2em, dy: -0.2em,
      text(size: 2em, fill: palette.gold.transparentize(40%), weight: "bold")["])
    #stack(
      spacing: 0.8em,
      text(fill: palette.text-dark, size: 0.88em, style: "italic", [#h(0.8em)#quote]),
      if author != none {
        text(fill: palette.gold-text, size: 0.8em, weight: "bold", style: "normal", [-- #author])
      },
    )
    #lazy-v(1fr)
  ]
}

// ═══ 3. Theme Entry Point ═══

#let art-deco-theme(
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
      fill: palette.cream,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.gold-text,
      neutral-lightest: palette.cream,
      neutral-darkest: palette.navy,
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
