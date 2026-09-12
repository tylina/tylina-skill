// McKinsey Style Theme — A premium, data-driven consulting Touying theme
// Inspired by McKinsey & Company's structured, analytical presentation style
// Features: clean whitespace, action titles, MECE frameworks, KPI cards, strategic pillars
// Perfect for executive briefings, strategic consulting, investment analysis, business proposals
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  blue: rgb("#005587"),
  teal: rgb("#004D5C"),
  amber: rgb("#F5A623"),
  bg: rgb("#FFFFFF"),
  bg-light: rgb("#ECF0F1"),
  card-bg: rgb("#FFFFFF"),
  border: rgb("#D5D8DC"),
  text-dark: rgb("#333333"),
  text-body: rgb("#5A5A5A"),
  text-light: rgb("#737373"),
  success: rgb("#27AE60"),
  success-text: rgb("#1E7F46"),
  danger: rgb("#E74C3C"),
  danger-text: rgb("#C83C30"),
  amber-text: rgb("#A96500"),
)

// ═══ Helper Functions ═══

#let _text-on-light(color) = {
  if color == palette.amber {
    palette.amber-text
  } else if color == palette.success {
    palette.success-text
  } else if color == palette.danger {
    palette.danger-text
  } else {
    color.darken(10%)
  }
}

// ═══ 1. Slide Functions ═══

/// Standard content slide — clean white bg, thin blue top bar, bold title
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // 4pt blue top bar
    block(width: 100%, height: 4pt, fill: palette.blue)
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.3em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 60pt, height: 2pt, fill: palette.blue, radius: 1pt)
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    block(width: 100%)[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1em,
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        },
        box(width: 4.5em)[
          #set std.align(right)
          #context {
            text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
          }
        ],
      )
    ]
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

/// Title slide — white cover with subtle geometric decorations
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Top blue bar
    place(top, block(width: 100%, height: 4pt, fill: palette.blue))
    // Subtle geometric decorations (low-opacity)
    place(top + right, dx: -40pt, dy: 40pt,
      rect(width: 120pt, height: 120pt, fill: palette.blue.transparentize(94%), radius: 4pt))
    place(top + right, dx: -80pt, dy: 80pt,
      rect(width: 80pt, height: 80pt, fill: palette.teal.transparentize(92%), radius: 4pt))
    place(bottom + left, dx: 60pt, dy: -60pt,
      rect(width: 100pt, height: 100pt, fill: palette.blue.transparentize(95%), radius: 4pt))
    place(bottom + left, dx: 90pt, dy: -30pt,
      rect(width: 60pt, height: 60pt, fill: palette.amber.transparentize(90%), radius: 4pt))
    // Left accent bar
    place(left, dy: 25%, block(width: 8pt, height: 50%, fill: palette.blue))
    // Center-left content
    set std.align(left + horizon)
    pad(left: 4em, right: 6em)[
      #stack(
        spacing: .8em,
        stack(
          spacing: .8em,
          text(size: 2.2em, weight: "bold", fill: palette.text-dark, info.title),
          block(width: 80pt, height: 3pt, fill: palette.blue, radius: 1.5pt),
        ),
        if info.subtitle != none {
          text(size: 1.1em, fill: palette.text-body, info.subtitle)
        },
        stack(
          spacing: .8em,
          if info.author != none {
            text(size: 1em, weight: "semibold", fill: palette.blue, info.author)
          },
          if info.institution != none {
            text(size: 0.85em, fill: palette.text-body, info.institution)
          },
          if info.date != none {
            text(size: 0.8em, fill: palette.text-light)[#utils.display-info-date(self)]
          },
        ),
      )
    ]
    // Bottom thin amber accent
    place(bottom, block(width: 100%, height: 2pt, fill: palette.amber))
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

/// Section divider slide — blue background, clean typography
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
    // Deep blue background
    place(top + left, block(width: 100%, height: 100%, fill: palette.blue))
    // Subtle geometric decorations
    place(top + right, dx: -60pt, dy: 50pt,
      rect(width: 160pt, height: 160pt, fill: white.transparentize(96%), radius: 4pt))
    place(bottom + left, dx: 80pt, dy: -60pt,
      rect(width: 100pt, height: 100pt, fill: white.transparentize(97%), radius: 4pt))
    // Left accent bar (amber)
    place(left, dx: 50pt, dy: 35%, block(width: 6pt, height: 30%, fill: palette.amber))
    // Section title
    pad(left: 5.5em, top: 4em)[
      #v(1fr)
      #set text(fill: white, size: 2.4em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.4em)
      #block(width: 60pt, height: 3pt, fill: palette.amber, radius: 1.5pt)
      #v(1fr)
    ]
    // Bottom amber line
    place(bottom, block(width: 100%, height: 2pt, fill: palette.amber))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — blue background, large centered white text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.blue,
      margin: 2.5em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle geometric decoration
    place(top + right, dx: -30pt, dy: 30pt,
      rect(width: 100pt, height: 100pt, fill: white.transparentize(95%), radius: 4pt))
    place(bottom + left, dx: 40pt, dy: -40pt,
      rect(width: 70pt, height: 70pt, fill: white.transparentize(96%), radius: 4pt))
    set text(fill: white, size: 1.8em, weight: "bold")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[#body]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — clean white, centered message
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Top blue bar
    place(top, block(width: 100%, height: 4pt, fill: palette.blue))
    // Subtle corner decorations
    place(top + right, dx: -40pt, dy: 40pt,
      rect(width: 80pt, height: 80pt, fill: palette.blue.transparentize(94%), radius: 4pt))
    place(bottom + left, dx: 40pt, dy: -40pt,
      rect(width: 60pt, height: 60pt, fill: palette.teal.transparentize(94%), radius: 4pt))
    // Center content remains in flow so diagnostics can measure it.
    set std.align(center + horizon)
    block(width: 60%, inset: 2em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.text-dark, body),
        block(width: 80pt, height: 3pt, fill: palette.blue, radius: 1.5pt),
      )
    ]
    // Bottom amber accent
    place(bottom, block(width: 100%, height: 2pt, fill: palette.amber))
  }
  touying-slide(self: self, main-body)
})

// ═══ 2. Reusable Components ═══

/// Takeaway box — amber left-border box for slide-level action title/key message
#let takeaway-box(content) = {
  block(
    width: 100%,
    fill: palette.amber.lighten(85%),
    stroke: (left: 4pt + palette.amber, rest: 1pt + palette.amber.lighten(60%)),
    inset: (x: 1em, y: 0.5em),
    radius: (right: 6pt),
  )[
    #set text(fill: palette.text-dark, size: 0.9em, weight: "semibold")
    #content
  ]
}

/// KPI card — clean metric card with accent color
#let kpi-card(label, value, trend: none, accent: palette.blue) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.4em),
    radius: (right: 6pt),
  )[
    #set text(fill: palette.text-body, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: _text-on-light(accent), size: 1.8em, weight: "bold")
        #value
        #if trend != none {
          h(0.4em)
          text(fill: palette.text-body, size: 0.45em, weight: "bold", trend)
        }
      ],
      lazy-v(1fr),
    )
  ]
}

// Internal accented-box base shared by semantic public components.
#let _callout-box(title, body, accent: palette.blue, fill: auto, border-width: 4pt, stroke-rest: none, inset: (x: 14pt, y: 7pt)) = {
  let bg = if fill == auto { accent.lighten(93%) } else { fill }
  let stroke-dict = if stroke-rest != none {
    (left: border-width + accent, rest: stroke-rest)
  } else {
    (left: border-width + accent)
  }
  block(
    width: 100%,
    fill: bg,
    stroke: stroke-dict,
    inset: inset,
    radius: (right: 6pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.9em, title),
      [
        #set text(fill: palette.text-body, size: 0.8em)
        #body
      ],
      lazy-v(1fr),
    )
  ]
}

/// Insight box — blue left border for key insights
#let insight-box(title, body) = _callout-box(title, body, accent: palette.blue)

/// Data table — clean styled table with blue header
#let data-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.blue }
      else if calc.odd(row) { palette.card-bg } else { palette.bg-light },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.8em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.8em, c)),
  )
}

/// Pillar card — numbered strategic pillar with accent
#let pillar-card(number, title, description) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + palette.blue, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.55em),
    radius: (bottom: 6pt),
  )[
    #stack(
      spacing: .8em,
      box(
        fill: palette.blue,
        width: 1.6em,
        height: 1.6em,
        radius: 0.8em,
        inset: 0pt,
      )[
        #set std.align(center + horizon)
        #set text(fill: white, weight: "bold", size: 0.85em)
        #str(number)
      ],
      text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
      {
        set text(fill: palette.text-body, size: 0.75em)
        description
      },
      lazy-v(1fr),
    )
  ]
}

/// Framework box — structured framework display (e.g., MECE, SCQA)
#let framework-box(title, body) = _callout-box(title, body, accent: palette.teal, fill: palette.bg-light, border-width: 6pt, stroke-rest: 1pt + palette.border, inset: (x: 1.2em, y: 0.6em))

/// Status badge — small colored badge for status indicators
#let status-badge(label, color: palette.success) = {
  box(
    fill: color.lighten(80%),
    stroke: 1pt + color,
    inset: (x: 0.5em, y: 0.2em),
    radius: 4pt,
  )[
    #set text(fill: _text-on-light(color), size: 0.7em, weight: "bold")
    #label
  ]
}

/// Progress bar — horizontal progress indicator
#let progress-bar(percentage, color: palette.blue, height: 8pt) = {
  block(width: 100%, height: height, fill: palette.bg-light, radius: height / 2)[
    #place(left, block(width: percentage * 1%, height: height, fill: color, radius: height / 2))
  ]
}

// ═══ 3. Theme Entry Point ═══

#let mckinsey-theme(
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
      header-ascent: 10%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4.5em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.blue,
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
