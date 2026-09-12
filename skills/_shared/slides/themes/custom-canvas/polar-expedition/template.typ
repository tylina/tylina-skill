// Polar Expedition Theme -- Heroic Age of Antarctic Exploration
// Navigation charts on parchment, expedition diaries, compass bearings,
// the stark beauty of ice sheets. Shackleton, Scott, Amundsen.
// Adventure narrative meets scientific precision.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  expedition: (
    bg: rgb("#F8F5F0"),
    ink: rgb("#1A2A3A"),
    accent: rgb("#CC4400"),
    accent-text: rgb("#B83D00"),
    focus-accent: rgb("#FF6B35"),
    secondary: rgb("#4A6FA5"),
    surface: rgb("#EDE8E0"),
  ),
  ice-shelf: (
    bg: rgb("#E8F0F8"),
    ink: rgb("#0D1B2A"),
    accent: rgb("#B83200"),
    accent-text: rgb("#B83200"),
    focus-accent: rgb("#FF6B35"),
    secondary: rgb("#2C5282"),
    surface: rgb("#D4E6F1"),
  ),
  midnight-sun: (
    bg: rgb("#1A2A3A"),
    ink: rgb("#F8F5F0"),
    accent: rgb("#FF6B35"),
    accent-text: rgb("#FF6B35"),
    focus-accent: rgb("#B83D00"),
    secondary: rgb("#7EB8DA"),
    surface: rgb("#243B53"),
  ),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let accent = p.accent
  let accent-text = p.accent-text
  let focus-accent = p.focus-accent
  let secondary = p.secondary
  let surface = p.surface
  (
    bg: bg,
    ink: ink,
    accent: accent,
    accent-text: accent-text,
    focus-accent: focus-accent,
    secondary: secondary,
    surface: surface,
    // Derived from ink
    ink-light: ink.transparentize(30%),
    ink-muted: ink.transparentize(35%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent (signal orange)
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(55%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary (ice blue)
    secondary-dim: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(75%),
    secondary-ghost: secondary.transparentize(92%),
    // Surface tones
    surface-dark: surface.darken(15%),
    // Meta
    meta-color: ink.transparentize(35%),
    rule-color: ink.transparentize(70%),
  )
}

// Default palette
#let palette = build-palette("expedition")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 7.5pt,
)

// =====================================================================
// SVG Definitions
// =====================================================================

// Compass rose: detailed directional star with N/S/E/W points and degree marks
#let _compass-rose-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><circle cx=\"100\" cy=\"100\" r=\"85\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><circle cx=\"100\" cy=\"100\" r=\"70\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><circle cx=\"100\" cy=\"100\" r=\"4\" fill=\"currentColor\" opacity=\"0.6\"/><polygon points=\"100,15 105,85 100,70 95,85\" fill=\"currentColor\" opacity=\"0.8\"/><polygon points=\"100,185 95,115 100,130 105,115\" fill=\"currentColor\" opacity=\"0.4\"/><polygon points=\"15,100 85,95 70,100 85,105\" fill=\"currentColor\" opacity=\"0.4\"/><polygon points=\"185,100 115,105 130,100 115,95\" fill=\"currentColor\" opacity=\"0.4\"/><polygon points=\"40,40 90,92 80,80 92,90\" fill=\"currentColor\" opacity=\"0.25\"/><polygon points=\"160,40 110,92 120,80 108,90\" fill=\"currentColor\" opacity=\"0.25\"/><polygon points=\"40,160 92,110 80,120 90,108\" fill=\"currentColor\" opacity=\"0.25\"/><polygon points=\"160,160 108,110 120,120 110,108\" fill=\"currentColor\" opacity=\"0.25\"/><line x1=\"100\" y1=\"10\" x2=\"100\" y2=\"20\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/><line x1=\"100\" y1=\"180\" x2=\"100\" y2=\"190\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/><line x1=\"10\" y1=\"100\" x2=\"20\" y2=\"100\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/><line x1=\"180\" y1=\"100\" x2=\"190\" y2=\"100\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/></svg>"

// Ice shelf profile: jagged bottom-edge line suggesting glacial coastline
#let _ice-shelf-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 60\"><path d=\"M0,30 L20,28 L35,35 L50,25 L65,32 L80,20 L100,28 L115,15 L130,30 L150,22 L170,35 L190,18 L210,30 L230,25 L250,32 L270,20 L290,35 L310,15 L330,28 L350,22 L370,30 L390,18 L410,32 L430,25 L450,35 L470,20 L490,30 L510,15 L530,28 L550,22 L570,35 L590,20 L610,30 L630,25 L650,32 L670,18 L690,28 L710,22 L730,35 L750,30 L770,20 L790,28 L800,25\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.6\"/><path d=\"M0,45 L40,42 L80,48 L120,40 L160,46 L200,38 L240,44 L280,42 L320,48 L360,40 L400,45 L440,38 L480,46 L520,42 L560,48 L600,40 L640,44 L680,42 L720,46 L760,40 L800,44\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/></svg>"

// Sextant: angular measurement instrument silhouette
#let _sextant-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 120\"><path d=\"M60,10 L110,100\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\"/><path d=\"M60,10 L20,100\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\"/><path d=\"M20,100 Q60,70 110,100\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.5\"/><circle cx=\"60\" cy=\"10\" r=\"3\" fill=\"currentColor\" opacity=\"0.6\"/><line x1=\"60\" y1=\"10\" x2=\"60\" y2=\"55\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.4\"/><path d=\"M35,75 Q60,55 85,75\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" stroke-dasharray=\"2 2\" opacity=\"0.3\"/></svg>"

// Latitude lines: curved arcs across the page (like map projection lines)
#let _latitude-lines-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><path d=\"M0,60 Q200,30 400,55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.15\"/><path d=\"M0,120 Q200,95 400,115\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.18\"/><path d=\"M0,180 Q200,160 400,175\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.15\"/><path d=\"M0,240 Q200,225 400,235\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.12\"/><path d=\"M80,0 Q75,150 85,300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/><path d=\"M200,0 Q195,150 205,300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/><path d=\"M320,0 Q315,150 325,300\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.1\"/></svg>"

// Expedition flag: small pennant triangle shape for markers
#let _flag-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 40 50\"><line x1=\"8\" y1=\"5\" x2=\"8\" y2=\"48\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\"/><polygon points=\"10,6 38,14 10,22\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"8\" cy=\"5\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.8\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let compass-rose(color: palette.ink, size: 80pt) = {
  let svg = _compass-rose-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let ice-shelf-line(color: palette.secondary, width: 100%) = {
  let svg = _ice-shelf-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}

#let sextant(color: palette.ink, size: 60pt) = {
  let svg = _sextant-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let latitude-lines(color: palette.secondary, width: 100%, height: 100%) = {
  let svg = _latitude-lines-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let expedition-flag(color: palette.accent, size: 20pt) = {
  let svg = _flag-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// compass-dot -- Small precise dot representing a bearing point
#let compass-dot(color: palette.ink, size: 3pt) = {
  circle(radius: size / 2, fill: color)
}

/// bearing-mark -- Cross-hair style marker for coordinate points
#let bearing-mark(color: palette.ink, size: 8pt) = {
  box(width: size, height: size)[
    #place(center + horizon, line(length: size, stroke: 0.5pt + color))
    #place(center + horizon, line(length: size, angle: 90deg, stroke: 0.5pt + color))
    #place(center + horizon, circle(radius: size / 5, fill: color))
  ]
}

// =====================================================================
// Reusable Components
// =====================================================================

/// chart-card -- Parchment card with navy border, compass corner decoration
#let chart-card(title, body, accent: palette.ink) = {
  block(
    width: 100%,
    stroke: (left: 2.5pt + accent, rest: 0.5pt + palette.rule-color),
    inset: (x: 1.1em, top: 0.9em, bottom: 0.7em),
    fill: palette.surface,
  )[
    // Compass corner decoration
    #place(top + right, dx: -4pt, dy: -4pt,
      box(width: 14pt, height: 14pt)[
        #place(center + horizon, line(length: 10pt, stroke: 0.4pt + accent.transparentize(50%)))
        #place(center + horizon, line(length: 10pt, angle: 90deg, stroke: 0.4pt + accent.transparentize(50%)))
      ]
    )
    #stack(spacing: .8em,
      [#text(size: typo.body, weight: "bold", fill: accent, title)],
      [#set text(size: 13pt, fill: palette.ink-light)
       #body
       #lazy-v(1fr)],
    )
  ]
}

/// bearing-stat -- Large number like navigation coordinates
#let bearing-stat(label, value, description: none) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #std.align(center)[
      #stack(spacing: .8em,
        [#text(
          size: typo.meta,
          weight: "medium",
          tracking: 1.5pt,
          fill: palette.secondary,
          upper(label),
        )],
        [#text(size: 42pt, weight: "bold", fill: palette.ink, value)],
        [#block(width: 35pt, height: 2pt, fill: palette.accent)],
        [#if description != none {
          text(
            size: 12pt,
            weight: "regular",
            fill: palette.ink-muted,
            description,
          )
        }],
        [#lazy-v(1fr)],
      )
    ]
  ]
}

/// glacier-divider -- Jagged ice-shelf line separator
#let glacier-divider(total-width: 100%) = {
  block(width: total-width, height: 18pt)[
    #place(left + horizon,
      box(width: 100%, ice-shelf-line(color: palette.secondary, width: 100%)))
  ]
}

/// bearing-tag -- Small compass-style tag/badge
#let bearing-tag(body) = {
  box(
    fill: palette.surface,
    stroke: 0.5pt + palette.ink-faint,
    inset: (x: 8pt, y: 3pt),
    radius: 2pt,
  )[
    #text(size: typo.small, fill: palette.ink, weight: "medium", body)
  ]
}

/// journal-quote -- Italic handwriting style, dated, like an expedition diary entry
#let journal-quote(body, date: none, author: none) = {
  block(
    width: 100%,
    stroke: (left: 1.5pt + palette.accent),
    inset: (left: 1.2em, right: 1em, y: 0.8em),
    fill: palette.surface.lighten(3%),
  )[
    #stack(
      spacing: .8em,
      {
        set text(size: typo.body, style: "italic", fill: palette.ink)
        body
      },
      if date != none or author != none {
        set text(
          size: typo.tiny,
          style: "normal",
          weight: "medium",
          tracking: 1pt,
          fill: palette.meta-color,
        )
        if date != none { upper(date) }
        if date != none and author != none { h(1em) }
        if author != none { [-- #upper(author)] }
      },
    )
  ]
}

/// expedition-panel -- Framed like a chart section with title header
#let expedition-panel(title, body) = {
  block(
    width: 100%,
    stroke: 1pt + palette.ink-faint,
    inset: 0pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Header bar
      block(width: 100%, fill: palette.ink, inset: (x: 1em, y: 0.4em))[
        #text(size: typo.tiny, weight: "bold", tracking: 1.5pt, fill: palette.bg, upper(title))
      ],
      // Content area
      block(width: 100%, fill: palette.surface, inset: (x: 1em, y: 0.8em))[
        #set text(size: 13pt, fill: palette.ink-light)
        #body
      ],
    )
    #lazy-v(1fr)
  ]
}

/// coordinate-table -- Data table styled like a navigation log
#let coordinate-table(align: center + horizon, headers, ..rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.ink } else { palette.surface },
    stroke: 0.5pt + palette.ink-faint,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.bg, size: 9pt, tracking: 1pt, upper(h)))),
    ..rows.pos().flatten().map(c => text(fill: palette.ink-light, size: 11pt, c)),
  )
}

/// route-card -- A card representing a route/journey segment with flag marker
#let route-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    stroke: 0.5pt + palette.rule-color,
    inset: (left: 1.2em, right: 1em, top: 0.8em, bottom: 0.6em),
    fill: palette.bg,
  )[
    // Flag marker top-left
    #place(top + left, dx: -6pt, dy: -4pt,
      expedition-flag(color: accent, size: 16pt))
    #stack(spacing: .8em,
      [#text(size: 14pt, weight: "bold", fill: palette.ink, title)],
      [#set text(size: 12pt, fill: palette.ink-light)
       #body
       #lazy-v(1fr)],
    )
  ]
}

/// signal-box -- High-emphasis box using the danger/signal orange
#let signal-box(title, body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + palette.accent, rest: 0.5pt + palette.accent-muted),
    inset: (x: 1.1em, y: 0.8em),
    fill: palette.surface.lighten(3%),
  )[
    #stack(spacing: .8em,
      [#text(size: typo.small, weight: "bold", tracking: 1pt, fill: palette.accent-text, upper(title))],
      [#set text(size: 13pt, fill: palette.ink)
       #body
       #lazy-v(1fr)],
    )
  ]
}

/// ice-stat -- Metric display with ice-blue accent for environmental data
#let ice-stat(label, value, unit: none) = {
  block(width: 100%, fill: palette.surface, stroke: 0.5pt + palette.secondary-faint, inset: (x: 0.8em, y: 0.6em))[
    #std.align(center)[
      #stack(spacing: .8em,
        [#text(size: typo.meta, weight: "medium", tracking: 1.2pt, fill: palette.secondary, upper(label))],
        [#grid(columns: (auto, auto), column-gutter: 4pt, align: bottom,
          text(size: 36pt, weight: "bold", fill: palette.secondary, value),
          if unit != none { text(size: 14pt, weight: "medium", fill: palette.secondary-dim, unit) },
        )
         #lazy-v(1fr)],
      )
    ]
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides with thin accent underline
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.2em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 50pt, height: 2pt, fill: pal.accent),
  )
}

/// _slide-footer -- Standard footer styled like chart margin notes
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.8pt)
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      } else {
        upper[EXPEDITION LOG]
      }
    },
    text(fill: pal.accent, size: 5pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display() / #utils.last-slide-number]
    },
  )
}

/// _dark-header -- Header for dark/inverted slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(size: 8pt, fill: pal.bg.transparentize(40%))
        grid(
          columns: (1fr, 1fr),
          {
            if custom-left != none {
              custom-left
            } else if self.store.footer != none {
              utils.call-or-display(self, self.store.footer)
            }
          },
          {
            set std.align(right)
            if custom-right != none {
              custom-right
            } else {
              context [#utils.slide-counter.display() / #utils.last-slide-number]
            }
          },
        )
      },
      {
        if self.store.title != none {
          stack(
            spacing: .8em,
            {
              set text(size: 1.25em, weight: "bold", fill: pal.bg)
              utils.call-or-display(self, self.store.title)
            },
            block(width: 50pt, height: 2pt, fill: pal.accent),
          )
        }
      },
    )
  }
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.bg.transparentize(50%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.8pt)
      upper[POLAR EXPEDITION]
    },
    text(fill: pal.accent-dim, size: 5pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Parchment background with latitude lines, compass accents
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _slide-header(self)
  let footer(self) = _slide-footer(self)
  let background = {
    // Faint latitude lines in background
    place(top + left,
      box(width: 100%, height: 100%,
        latitude-lines(color: pal.secondary, width: 100%, height: 100%),
      ),
    )
    // Small compass corner accent (top-right)
    place(top + right, dx: -0.8em, dy: 0.3em,
      compass-dot(color: pal.ink-faint, size: 3pt),
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer, background: background),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Navy ink background with parchment text, scattered bearing marks
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ghost: none,
  ghost-size: 160pt,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(custom-left: header-left, custom-right: header-right)
  let footer(self) = _dark-footer(self)

  let background = {
    // Ghost text decoration
    if ghost != none {
      place(top + right, dx: -20pt, dy: 10pt,
        text(size: ghost-size, weight: "bold", fill: pal.bg.transparentize(94%), ghost))
    }
    // Scattered bearing marks
    place(top + right, dx: -50pt, dy: 40pt, compass-dot(color: pal.bg.transparentize(70%), size: 2pt))
    place(top + right, dx: -90pt, dy: 25pt, compass-dot(color: pal.accent.transparentize(60%), size: 2.5pt))
    place(bottom + left, dx: 40pt, dy: -35pt, compass-dot(color: pal.bg.transparentize(65%), size: 2pt))
    place(bottom + left, dx: 80pt, dy: -20pt, compass-dot(color: pal.accent.transparentize(50%), size: 3pt))
  }
  let setting(body) = {
    set text(fill: pal.bg)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      header: header,
      footer: footer,
      background: background,
      margin: (top: 4em, bottom: 1.3em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Grand expedition cover with compass rose and chart frame
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Parchment background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Latitude lines across entire page
    place(top + left,
      box(width: 100%, height: 100%,
        latitude-lines(color: pal.secondary.transparentize(30%), width: 100%, height: 100%),
      ),
    )

    // Large compass rose, upper-right corner
    place(top + right, dx: -30pt, dy: 15pt,
      compass-rose(color: pal.ink.transparentize(70%), size: 160pt),
    )

    // Sextant silhouette, lower-left
    place(bottom + left, dx: 30pt, dy: -20pt,
      sextant(color: pal.ink.transparentize(75%), size: 90pt),
    )

    // Ice shelf line at bottom
    place(bottom + left, dy: -8pt,
      box(width: 100%, ice-shelf-line(color: pal.secondary.transparentize(40%), width: 100%)))

    // Chart frame border
    place(center + horizon,
      rect(width: 94%, height: 90%, stroke: 0.8pt + pal.ink-faint, fill: none)
    )

    // Corner bearing marks on frame
    place(top + left, dx: 2.5%, dy: 4%, bearing-mark(color: pal.ink-muted, size: 10pt))
    place(top + right, dx: -2.5%, dy: 4%, bearing-mark(color: pal.ink-muted, size: 10pt))
    place(bottom + left, dx: 2.5%, dy: -4%, bearing-mark(color: pal.ink-muted, size: 10pt))
    place(bottom + right, dx: -2.5%, dy: -4%, bearing-mark(color: pal.ink-muted, size: 10pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      // Expedition label
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 2.5pt,
        fill: pal.accent-text,
      )[EXPEDITION REPORT]
      #v(1.5em)
      // Main title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.6em)
      // Decorative rule with diamond
      #block(width: 200pt, height: 12pt)[
        #place(left + horizon, line(length: 85pt, stroke: 0.8pt + pal.ink-muted))
        #place(center + horizon, text(fill: pal.accent, size: 6pt)[#sym.diamond.filled])
        #place(right + horizon, line(length: 85pt, stroke: 0.8pt + pal.ink-muted))
      ]
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", style: "italic", fill: pal.ink-light, info.subtitle)
        v(1.2em)
      }
      // Author and date
      #{
        set text(size: typo.tiny, fill: pal.meta-color)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(2em)
          text(fill: pal.accent, size: 5pt)[#sym.diamond.filled]
          h(2em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Compass bearing section divider with navigation labels
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Latitude lines background
    place(top + left,
      box(width: 100%, height: 100%,
        latitude-lines(color: pal.secondary.transparentize(50%), width: 100%, height: 100%),
      ),
    )

    // Compass rose in upper-right
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 130pt, height: 130pt)[
          #place(center + horizon, compass-rose(color: pal.ink.transparentize(60%), size: 120pt))
          #place(center + horizon, text(fill: pal.accent, size: 44pt, weight: "bold", num-str))
        ]
      },
    )

    // Navigation coordinate label (decorative)
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 7pt, fill: pal.meta-color)[LAT 77\u{00B0}51'S | LONG 166\u{00B0}40'E],
    )

    // Top accent line
    place(top + left, dx: 3em, dy: 3em,
      line(length: 70pt, stroke: 1.5pt + pal.accent))

    // Content
    pad(left: 4em, right: 10em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.meta,
        weight: "medium",
        tracking: 2pt,
        fill: pal.secondary,
      )[BEARING #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.8em)
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 50pt, height: 2pt, fill: pal.accent)
      #v(3fr)
    ]

    // Ice shelf at bottom
    place(bottom + left, dy: -5pt,
      box(width: 100%, ice-shelf-line(color: pal.secondary.transparentize(50%), width: 100%)))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, tracking: 1pt)[POLAR EXPEDITION],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Signal orange emphasis, stark and commanding like a flare
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Scattered compass dots
    place(top + left, dx: 15pt, dy: 15pt, compass-dot(color: pal.bg.transparentize(70%), size: 3pt))
    place(top + right, dx: -25pt, dy: 20pt, compass-dot(color: pal.accent.transparentize(40%), size: 4pt))
    place(bottom + left, dx: 30pt, dy: -25pt, compass-dot(color: pal.bg.transparentize(60%), size: 2.5pt))
    place(bottom + right, dx: -40pt, dy: -30pt, compass-dot(color: pal.accent.transparentize(50%), size: 3pt))

    // Corner accent lines (signal style)
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 35pt, stroke: 1.5pt + pal.accent))
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 25pt, angle: 90deg, stroke: 1.5pt + pal.accent))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 35pt, angle: 180deg, stroke: 1.5pt + pal.accent))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 25pt, angle: -90deg, stroke: 1.5pt + pal.accent))

    set text(fill: pal.bg, size: 1.5em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1.5em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Final page with compass rose and expedition farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Latitude arcs
    place(top + left,
      box(width: 100%, height: 100%,
        latitude-lines(color: pal.secondary.transparentize(40%), width: 100%, height: 100%),
      ),
    )

    // Large faded compass rose centered
    place(center + horizon,
      compass-rose(color: pal.ink.transparentize(85%), size: 280pt),
    )

    // Ghost text
    place(center + horizon, dy: 80pt,
      text(size: 80pt, weight: "bold", fill: pal.ink-ghost)[FINIS],
    )

    // Chart frame
    place(center + horizon,
      rect(width: 94%, height: 90%, stroke: 0.8pt + pal.ink-faint, fill: none)
    )

    // Corner bearing marks
    place(top + left, dx: 2em, dy: 1.2em, bearing-mark(color: pal.ink-muted, size: 10pt))
    place(top + right, dx: -2em, dy: 1.2em, bearing-mark(color: pal.ink-muted, size: 10pt))
    place(bottom + left, dx: 2em, dy: -1.2em, bearing-mark(color: pal.ink-muted, size: 10pt))
    place(bottom + right, dx: -2em, dy: -1.2em, bearing-mark(color: pal.ink-muted, size: 10pt))

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Sextant ornament
      #std.align(center, sextant(color: pal.ink.transparentize(30%), size: 50pt))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.8em)
      // Rule with diamond
      #std.align(center, block(width: 160pt, height: 12pt)[
        #place(left + horizon, line(length: 65pt, stroke: 0.8pt + pal.ink-muted))
        #place(center + horizon, text(fill: pal.accent, size: 6pt)[#sym.diamond.filled])
        #place(right + horizon, line(length: 65pt, stroke: 0.8pt + pal.ink-muted))
      ])
      #v(1em)
      #text(size: 10pt, fill: pal.meta-color, tracking: 2.5pt)[AD FINEM TERRAE]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let polar-expedition-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "expedition",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 4em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent-text,
      neutral-lightest: pal.bg,
      neutral-darkest: pal.ink,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
      palette: pal,
    ),
    ..args,
  )

  body
}
