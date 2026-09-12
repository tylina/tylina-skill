// Data-Ink Theme — A Tufte-inspired presentation theme for Touying
// Maximum data-ink ratio, minimal chart junk, sparklines, small multiples
// Inspired by Edward Tufte's "The Visual Display of Quantitative Information"
// Features: inline SVG sparklines, margin annotations, hairline rules, dense data
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// ═══ Color Palette ═══

#let palette = (
  paper: rgb("#FFFFF8"),    // Tufte's signature off-white
  ink: rgb("#111111"),      // Not pure black
  gray: rgb("#5E5E5E"),    // Secondary information
  light-gray: rgb("#D0D0D0"), // Grid lines, rules
  red: rgb("#BE2D26"),     // Emphasis, sparingly
)

// ═══ SVG Sparklines ═══

#let _sparkline-up-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 24"><polyline points="0,20 12,18 24,16 36,14 48,10 60,8 72,4 80,2" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>```.text

#let _sparkline-down-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 24"><polyline points="0,4 12,6 24,8 36,10 48,14 60,18 72,20 80,22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>```.text

#let _sparkline-volatile-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 24"><polyline points="0,12 10,4 20,18 30,8 40,20 50,6 60,16 70,2 80,14" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>```.text

#let _sparkline-plateau-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 24"><polyline points="0,18 12,14 24,10 36,8 48,8 60,7 72,7 80,8" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>```.text

#let _sparkline-recovery-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 24"><polyline points="0,8 12,12 24,18 36,20 48,16 60,10 72,6 80,4" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>```.text

/// Inline sparkline — tiny trend visualization
/// trend: "up", "down", "volatile", "plateau", "recovery"
#let sparkline(trend: "up", color: rgb("#111111"), width: 60pt) = {
  let svg = if trend == "up" {
    _sparkline-up-svg
  } else if trend == "down" {
    _sparkline-down-svg
  } else if trend == "volatile" {
    _sparkline-volatile-svg
  } else if trend == "plateau" {
    _sparkline-plateau-svg
  } else {
    _sparkline-recovery-svg
  }
  box(baseline: 3pt, image(bytes(svg.replace("currentColor", color.to-hex())), width: width, height: 14pt))
}

// ═══ Reusable Components ═══

/// tufte-stat — Number + label + inline sparkline. The signature component.
#let tufte-stat(value, label, trend: "up", accent: palette.ink) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.4em))[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: .4em,
        text(size: 1.8em, weight: "bold", fill: accent, value),
        sparkline(trend: trend, color: palette.gray, width: 48pt),
      ),
      text(size: 0.7em, fill: palette.gray, label),
      lazy-v(1fr),
    )
  ]
}

/// margin-note — Small text at right margin, Tufte's sidenotes
#let margin-note(body) = {
  place(right, dx: 0.8em,
    block(width: 120pt)[
      #set text(size: 8pt, fill: palette.gray, style: "italic")
      #body
    ]
  )
}

/// data-card — Ultra-clean card with 0.5pt hairline border, no fill
#let data-card(title, body) = {
  block(
    width: 100%,
    stroke: 0.5pt + palette.light-gray,
    inset: (x: 0.8em, y: 0.6em),
  )[
    #stack(
      spacing: .8em,
      text(size: 0.8em, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 0.75em, fill: palette.gray)
        #body
      ],
      lazy-v(1fr),
    )
  ]
}

/// evidence-box — Callout with thin red left line for emphasis
#let evidence-box(title, body) = {
  block(
    width: 100%,
    stroke: (left: 1.5pt + palette.red),
    inset: (left: 0.8em, right: 0.5em, y: 0.5em),
  )[
    #stack(
      spacing: .8em,
      text(size: 0.8em, weight: "bold", fill: palette.red, title),
      [
        #set text(size: 0.75em, fill: palette.ink)
        #body
      ],
      lazy-v(1fr),
    )
  ]
}

/// small-multiple — Grid of tiny stat blocks (Tufte's "small multiples" concept)
#let small-multiple(..items) = {
  let cells = items.pos().map(item => {
    block(width: 100%, inset: (x: 0.4em, y: 0.3em), stroke: (right: 0.5pt + palette.light-gray))[
      #text(size: 0.6em, fill: palette.gray, item.at("label"))
      #v(0.1em)
      #text(size: 1.2em, weight: "bold", fill: palette.ink, item.at("value"))
      #if item.at("trend", default: none) != none {
        h(0.3em)
        sparkline(trend: item.at("trend"), color: palette.gray, width: 36pt)
      }
    ]
  })
  grid(columns: cells.len(), column-gutter: 0pt, ..cells)
}

/// hairline-divider — 0.5pt thin gray line
#let hairline-divider() = {
  v(0.4em)
  line(length: 100%, stroke: 0.5pt + palette.light-gray)
  v(0.4em)
}

/// annotation — Small gray italic annotation text
#let annotation(body) = {
  text(size: 0.6em, fill: palette.gray, style: "italic", body)
}

/// stat-row — Horizontal layout of tufte-stat blocks
#let stat-row(..items) = {
  let cells = items.pos().map(item => {
    tufte-stat(
      item.at("value"),
      item.at("label"),
      trend: item.at("trend", default: "up"),
      accent: item.at("accent", default: palette.ink),
    )
  })
  grid(columns: cells.len(), column-gutter: 0.5em, ..cells)
}

/// data-table — Clean Tufte-style table (no vertical rules, minimal horizontal)
#let data-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    stroke: none,
    inset: (x: 0.6em, y: 0.4em),
    align: align,
    table.header(
      ..headers.map(h => table.cell(stroke: (bottom: 0.5pt + palette.ink, rest: none))[
        #set text(size: 0.75em, weight: "bold", fill: palette.ink)
        #h
      ])
    ),
    ..rows.enumerate().map(((i, row)) => {
      row.map(cell => {
        table.cell(stroke: (bottom: 0.5pt + palette.light-gray, rest: none))[
          #set text(size: 0.7em, fill: palette.gray)
          #cell
        ]
      })
    }).flatten(),
  )
}

// ═══ Slide Functions ═══

/// slide — Ultra-clean content slide: title in black, 0.5pt hairline below, gray page number
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.ink, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      line(length: 100%, stroke: 0.5pt + palette.light-gray),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.gray, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        line(length: 20pt, stroke: 0.5pt + palette.light-gray)
      },
      {
        set std.align(right)
        context { text(fill: palette.gray, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number] }
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

/// title-slide — Minimal: huge title in thin weight, hairline rule, author in gray. Nothing else.
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.paper))
    // Thin top hairline
    place(top + left, block(width: 100%, height: 0.5pt, fill: palette.light-gray))
    // Content - left aligned, vertically centered
    set std.align(left + horizon)
    pad(x: 4em, y: 3em)[
      // Title in large, light weight
      #text(size: 2.4em, weight: "regular", fill: palette.ink, info.title)
      #v(0.6em)
      // Hairline rule
      #line(length: 120pt, stroke: 0.5pt + palette.ink)
      #v(0.8em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.gray, info.subtitle)
        v(0.5em)
      }
      // Author in small gray
      #if info.author != none {
        text(size: 0.8em, fill: palette.gray, info.author)
      }
      #if info.date != none {
        h(1.5em)
        text(size: 0.7em, fill: palette.light-gray)[#utils.display-info-date(self)]
      }
    ]
    // Thin bottom hairline
    place(bottom + left, block(width: 100%, height: 0.5pt, fill: palette.light-gray))
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide — Gray left panel (40%) with white number, right (60%) with section title
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Left 40% gray panel
    place(top + left, block(
      width: 40%,
      height: 100%,
      fill: palette.ink.lighten(85%),
    ))
    // Section number in left panel
    place(left + horizon, dx: 3em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(size: 4em, weight: "bold", fill: white, num-str)
      }
    )
    // Right 60% — section title
    place(right + horizon, dx: -4em,
      block(width: 50%)[
        #set std.align(left)
        #text(size: 0.7em, fill: palette.gray, tracking: 1pt, upper[SECTION])
        #v(0.3em)
        #{
          set text(size: 1.8em, weight: "bold", fill: palette.ink)
          utils.display-current-heading(level: 1, numbered: false)
        }
        #v(0.4em)
        #line(length: 60pt, stroke: 0.5pt + palette.ink)
      ]
    )
    // Top and bottom hairlines
    place(top + left, block(width: 100%, height: 0.5pt, fill: palette.light-gray))
    place(bottom + left, block(width: 100%, height: 0.5pt, fill: palette.light-gray))
  }
  touying-slide(self: self, main-body)
})

/// focus-slide — Centered text on paper bg, thin hairline frame
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.paper,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Hairline frame inset from edges
    place(top + left, dx: 2em, dy: 1.5em,
      block(width: 100% - 4em, height: 100% - 3em, stroke: 0.5pt + palette.light-gray)
    )
    set text(fill: palette.ink, size: 1.6em, weight: "regular")
    std.align(horizon + center, body)
  }
  touying-slide(self: self, main-body)
})

/// ending-slide — Minimal centered farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.paper))
    // Top hairline
    place(top + left, block(width: 100%, height: 0.5pt, fill: palette.light-gray))
    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      #line(length: 80pt, stroke: 0.5pt + palette.ink)
      #v(1em)
      #text(size: 1.8em, weight: "regular", fill: palette.ink, body)
      #v(1em)
      #line(length: 40pt, stroke: 0.5pt + palette.light-gray)
    ]
    // Bottom hairline
    place(bottom + left, block(width: 100%, height: 0.5pt, fill: palette.light-gray))
  }
  touying-slide(self: self, main-body)
})

// ═══ Theme Entry Point ═══

#let data-ink-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.paper,
      margin: (top: 3.7em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.ink,
      neutral-lightest: palette.paper,
      neutral-darkest: palette.ink,
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
