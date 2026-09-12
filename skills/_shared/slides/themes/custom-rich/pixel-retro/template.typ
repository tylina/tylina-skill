// Pixel Retro Theme — A retro gaming, neon cyberpunk Touying theme
// 8-bit style dark theme with neon glow effects, scanlines, and pixel decorations
// Features: terminal boxes, stat bars, pixel cards, level-up cards, badge tags
// Perfect for tech talks, programming tutorials, game introductions, geek-style content
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  black: rgb("#0D1117"),
  dark: rgb("#161B22"),
  green: rgb("#39FF14"),
  pink: rgb("#FF2E97"),
  blue: rgb("#00D4FF"),
  gold: rgb("#FFD700"),
  bg: rgb("#0D1117"),
  card-bg: rgb("#161B22"),
  text-green: rgb("#39FF14"),
  text-white: rgb("#E6EDF3"),
  text-gray: rgb("#8B949E"),
  border: rgb("#30363D"),
)


// Border

// Neon color cycle for auto-indexing
#let neon-colors = (palette.green, palette.pink, palette.blue, palette.gold)

// ═══ Helper Functions ═══

/// Returns neon color by index (cycles through green, pink, blue, gold)
#let neon-color(index) = {
  neon-colors.at(calc.rem(index, 4))
}

/// Decorative neon-colored line
#let neon-line(color: palette.green, width: 100%) = {
  block(width: width, height: 2pt, fill: color)
}

/// Row of small square "pixel" dots
#let pixel-dots(count, color: palette.green, size: 4pt, gap: 6pt) = {
  stack(dir: ltr, spacing: gap,
    ..range(count).map(_ => rect(width: size, height: size, fill: color)),
  )
}

/// Pixel block corner decoration (L-shaped bracket made of small squares)
#let pixel-corner(color: palette.green, size: 4pt) = {
  grid(
    columns: (size, size, size),
    rows: (size, size, size),
    gutter: 1pt,
    rect(width: size, height: size, fill: color),
    rect(width: size, height: size, fill: color),
    rect(width: size, height: size, fill: color),
    rect(width: size, height: size, fill: color),
    rect(width: size, height: size, fill: color.transparentize(80%)),
    rect(width: size, height: size, fill: color.transparentize(90%)),
    rect(width: size, height: size, fill: color),
    rect(width: size, height: size, fill: color.transparentize(90%)),
    [],
  )
}

/// Scanline overlay effect (subtle horizontal lines).
/// The full-height block stays inside place(), so it never affects slide flow.
#let scanline-bg(line-opacity: 97%, count: 80) = {
  place(top + left,
    block(width: 100%, height: 100%, {
      for i in range(0, count) {
        place(top + left, dy: i * 8pt,
          block(width: 100%, height: 1pt, fill: white.transparentize(line-opacity)))
      }
    }))
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
    stack(
      spacing: .8em,
      block(width: 100%, height: 3pt, fill: palette.green),
      block(width: 100%, height: 1pt, fill: palette.green.transparentize(70%)),
      block(width: 100%, inset: (x: 1.5em, top: 0.25em, bottom: 0.1em), {
        set text(fill: palette.green, size: 1.25em, weight: "bold")
        grid(
          columns: (auto, 1fr),
          column-gutter: 0.25em,
          align: left + horizon,
          [\>],
          {
            if self.store.title != none {
              utils.call-or-display(self, self.store.title)
            } else {
              utils.display-current-heading(level: 2)
            }
          },
        )
      }),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-gray, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      // Left: pixel dots
      pixel-dots(4, color: palette.green.transparentize(50%), size: 3pt, gap: 4pt),
      // Center: footer text
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      // Right: page number
      {
        set std.align(right)
        context text(fill: palette.green, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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
    scanline-bg()
    // Top neon double line
    place(top + left,
      stack(spacing: .8em,
        block(width: 100%, height: 3pt, fill: palette.green),
        block(width: 100%, height: 1pt, fill: palette.green.transparentize(60%)),
      ))
    // Bottom neon double line
    place(bottom + left,
      stack(spacing: .8em,
        block(width: 100%, height: 1pt, fill: palette.green.transparentize(60%)),
        block(width: 100%, height: 3pt, fill: palette.green),
      ))
    // Pixel corner decorations
    place(top + left, dx: 20pt, dy: 20pt, pixel-corner(color: palette.green))
    place(top + right, dx: -35pt, dy: 20pt, pixel-corner(color: palette.pink))
    place(bottom + left, dx: 20pt, dy: -35pt, pixel-corner(color: palette.blue))
    place(bottom + right, dx: -35pt, dy: -35pt, pixel-corner(color: palette.gold))
    // Neon glow circles (ambient decoration)
    place(top + right, dx: -100pt, dy: 60pt,
      circle(radius: 80pt, fill: palette.green.transparentize(96%)))
    place(bottom + left, dx: 60pt, dy: -80pt,
      circle(radius: 100pt, fill: palette.pink.transparentize(96%)))
    // Center content
    set std.align(center + horizon)
    block(width: 70%, inset: (x: 1em, y: 1.5em))[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(
          size: 0.7em,
          fill: palette.green.transparentize(30%),
          weight: "bold",
          tracking: 4pt,
        )[PRESS START],
        text(size: 2em, weight: "bold", fill: palette.green, info.title),
        stack(
          spacing: .8em,
          align(center, block(width: 60%, height: 2pt, fill: palette.green)),
          align(center, block(width: 40%, height: 1pt, fill: palette.green.transparentize(60%))),
        ),
        if info.subtitle != none {
          text(size: 0.9em, fill: palette.text-gray, info.subtitle)
        },
        if info.author != none {
          text(size: 1.1em, weight: "bold", fill: palette.blue, info.author)
        },
        if info.institution != none {
          text(size: 0.85em, fill: palette.text-gray, info.institution)
        },
        if info.date != none {
          stack(
            spacing: .8em,
            pixel-dots(3, color: palette.green, size: 3pt, gap: 5pt),
            text(size: 0.8em, fill: palette.text-gray)[#utils.display-info-date(self)],
          )
        },
      )
    ]
    // Bottom center pixel dots
    place(bottom, dy: -1.2em, align(center,
      pixel-dots(7, color: palette.green.transparentize(40%), size: 3pt, gap: 8pt)))
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
    scanline-bg(line-opacity: 98%)
    // Top neon line
    place(top + left, block(width: 100%, height: 3pt, fill: palette.green))
    // Bottom neon line
    place(bottom + left, block(width: 100%, height: 3pt, fill: palette.green))
    // Left pixel bar decoration
    place(left, dx: 30pt, dy: 30%, block(width: 6pt, height: 8%, fill: palette.green))
    place(left, dx: 30pt, dy: 38.5%, block(width: 6pt, height: 8%, fill: palette.pink))
    place(left, dx: 30pt, dy: 47%, block(width: 6pt, height: 8%, fill: palette.blue))
    place(left, dx: 30pt, dy: 55.5%, block(width: 6pt, height: 8%, fill: palette.gold))
    // Pixel corner decorations
    place(top + left, dx: 16pt, dy: 16pt, pixel-corner(color: palette.green, size: 3pt))
    place(bottom + right, dx: -28pt, dy: -28pt, pixel-corner(color: palette.pink, size: 3pt))
    // Section content
    pad(left: 5em, top: 4em, right: 3em)[
      // Section heading label
      #text(fill: palette.text-gray, size: 0.8em, tracking: 2pt)[LOADING...]
      #v(0.5em)
      #v(1fr)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 0.4em,
        align: left + horizon,
        text(fill: palette.green, size: 2.2em, weight: "bold")[\>],
        {
          set text(fill: palette.green, size: 2.2em, weight: "bold")
          utils.display-current-heading(level: 1)
        },
      )
      #v(0.5em)
      #block(width: 200pt, height: 2pt, fill: palette.green)
      #v(0.2em)
      #block(width: 120pt, height: 1pt, fill: palette.green.transparentize(60%))
      #v(1fr)
    ]
    // Bottom pixel dots
    place(bottom, dy: -1.2em, align(center,
      pixel-dots(5, color: palette.green.transparentize(50%), size: 3pt, gap: 10pt)))
    // Right side decorative glow
    place(right, dx: -80pt, dy: -20pt,
      circle(radius: 60pt, fill: palette.green.transparentize(96%)))
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let content = {
    // Scanline overlay
    place(top + left, dx: -2em, dy: -2em, {
      block(width: 120%, height: 120%, {
        for i in range(0, 100) {
          place(top + left, dy: i * 8pt,
            block(width: 100%, height: 1pt, fill: white.transparentize(97%)))
        }
      })
    })
    // Corner pixel decorations
    place(top + left, pixel-corner(color: palette.green, size: 3pt))
    place(bottom + right, dx: -16pt, dy: -16pt, pixel-corner(color: palette.pink, size: 3pt))
    // Percentage-based border glow remains centered across aspect ratios.
    place(center + horizon,
      rect(width: 98%, height: 94%, stroke: 1pt + palette.green.transparentize(60%)))
    set text(fill: palette.green, size: 2em, weight: "bold")
    align(horizon + center,
      block(width: 100%, inset: (x: 1em))[#body])
  }
  touying-slide(self: self, content)
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
    scanline-bg()
    // Top & bottom neon lines (gold theme for ending)
    place(top + left,
      stack(spacing: .8em,
        block(width: 100%, height: 3pt, fill: palette.gold),
        block(width: 100%, height: 1pt, fill: palette.gold.transparentize(60%)),
      ))
    place(bottom + left,
      stack(spacing: .8em,
        block(width: 100%, height: 1pt, fill: palette.gold.transparentize(60%)),
        block(width: 100%, height: 3pt, fill: palette.gold),
      ))
    // Pixel corner decorations
    place(top + left, dx: 20pt, dy: 20pt, pixel-corner(color: palette.gold))
    place(top + right, dx: -35pt, dy: 20pt, pixel-corner(color: palette.gold))
    place(bottom + left, dx: 20pt, dy: -35pt, pixel-corner(color: palette.gold))
    place(bottom + right, dx: -35pt, dy: -35pt, pixel-corner(color: palette.gold))
    // Center content
    set std.align(center + horizon)
    block(width: 70%, inset: 2em)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(
          size: 0.7em,
          fill: palette.gold.transparentize(20%),
          weight: "bold",
          tracking: 4pt,
        )[GAME SAVED],
        text(size: 2.6em, weight: "bold", fill: palette.gold, body),
        stack(
          spacing: .8em,
          align(center, block(width: 50%, height: 2pt, fill: palette.gold)),
          align(center, block(width: 30%, height: 1pt, fill: palette.gold.transparentize(60%))),
        ),
        text(size: 0.7em, fill: palette.text-gray)[CONTINUE? Y/N #box(width: 0.5em, height: 0.8em, fill: palette.text-gray)],
      )
    ]
    // Bottom pixel dots
    place(bottom, dy: -1em, align(center,
      pixel-dots(7, color: palette.gold.transparentize(40%), size: 3pt, gap: 8pt)))
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Terminal/console style box with green border and "> " prompt feel.
/// Accepts raw code blocks (```lang ... ```) or plain content as body.
#let terminal-box(title: [Terminal], body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + palette.green, rest: 1pt + palette.border),
    inset: 0pt,
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0pt,
      // Title bar
      block(
        width: 100%,
        fill: palette.border,
        inset: (x: 0.8em, y: 0.3em),
      )[
        #set text(fill: palette.text-gray, size: 0.7em)
        #stack(dir: ltr, spacing: 6pt,
          rect(width: 8pt, height: 8pt, fill: palette.pink, radius: 1pt),
          rect(width: 8pt, height: 8pt, fill: palette.gold, radius: 1pt),
          rect(width: 8pt, height: 8pt, fill: palette.green, radius: 1pt),
          h(0.5em),
          title,
        )
      ],
      // Body content
      block(
        width: 100%,
        inset: (x: 1em, y: 0.6em),
      )[
        #set text(fill: palette.green)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Card cycling through neon colors with pixel-block number
#let pixel-card(number, title, description, accent: auto) = {
  let color = if accent == auto { neon-color(number - 1) } else { accent }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: 1em,
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: .8em,
      box(
        fill: color,
        width: 1.6em,
        height: 1.6em,
        inset: 0pt,
      )[
        #set align(center + horizon)
        #set text(fill: palette.black, weight: "bold", size: 0.85em)
        #str(number)
      ],
      text(weight: "bold", fill: color, size: 1em, title),
      text(fill: palette.text-gray, size: 0.8em, description),
      lazy-v(1fr),
    )
  ]
}

/// Progress bar visualization like an HP/XP bar
#let stat-bar(label, value, max: 100, color: palette.green) = {
  let pct = calc.min(calc.round(value / max * 100), 100)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    radius: 3pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr,
        text(fill: palette.text-gray, size: 0.75em, label),
        h(1fr),
        text(fill: color, size: 0.75em, weight: "bold")[#value / #max],
      ),
      block(width: 100%, height: 10pt, fill: palette.border, radius: 2pt)[
        #place(left,
          block(width: (pct * 1%), height: 10pt, fill: color, radius: 2pt))
      ],
      lazy-v(1fr),
    )
  ]
}

/// Small colored badge/tag
#let badge(text-content, color: palette.green) = {
  box(
    fill: color.transparentize(80%),
    stroke: 1pt + color,
    inset: (x: 0.5em, y: 0.15em),
    radius: 2pt,
  )[
    #set text(fill: color, size: 0.7em, weight: "bold")
    #text-content
  ]
}

/// RPG level-up style card
#let level-card(level, title, items) = {
  let colors = (palette.green, palette.blue, palette.pink, palette.gold)
  let color = colors.at(calc.rem(level - 1, 4))
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: 0pt,
    radius: 4pt,
  )[
    // Level header bar
    #stack(
      spacing: 0pt,
      block(
        width: 100%,
        fill: color.transparentize(80%),
        inset: (x: 0.8em, y: 0.4em),
      )[
        #stack(dir: ltr,
          text(fill: color, size: 0.7em, weight: "bold")[LVL #level],
          h(0.5em),
          pad(left: .5em, right: 2em, text(fill: palette.text-white, size: 0.9em, weight: "bold", title)),
        )
      ],
      // Items list
      block(
        width: 100%,
        inset: (x: 0.8em, y: 0.5em),
      )[
        #set text(fill: palette.text-gray, size: 0.8em)
        #items
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Neon alert/callout box
#let neon-box(title, body, color: palette.green) = {
  block(
    width: 100%,
    fill: color.transparentize(92%),
    stroke: (left: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: color, size: 0.9em, title),
      [
      #set text(fill: palette.text-gray, size: 0.85em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

// ═══ 3. Theme Entry Point ═══

#let pixel-retro-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-white)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3.5em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.green,
      neutral-lightest: palette.text-white,
      neutral-darkest: palette.black,
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
