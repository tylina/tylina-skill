// Ukiyo-Wave Theme — Japanese ukiyo-e woodblock print aesthetic
// Inspired by Hokusai's Great Wave: bold curves, flat color areas, dramatic wave patterns
// Deep indigo backgrounds with vermillion accents and wave-blue secondary
// Strong asymmetry, dramatic scale contrast, Japanese whitespace (ma)
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  indigo: (
    bg: rgb("#1A2332"), ink: rgb("#F5F0E3"), accent: rgb("#D4493F"),
    accent-text: rgb("#F77367"), secondary: rgb("#4A90A4"),
    secondary-text: rgb("#6DB7C8"), surface: rgb("#243447"),
  ),
  sunrise: (
    bg: rgb("#2A1A10"), ink: rgb("#FFF8E7"), accent: rgb("#E8682A"),
    accent-text: rgb("#FF9159"), secondary: rgb("#C9A961"),
    secondary-text: rgb("#C9A961"), surface: rgb("#3D2B1A"),
  ),
  storm: (
    bg: rgb("#0F1A24"), ink: rgb("#E0E8F0"), accent: rgb("#8B3A3A"),
    accent-text: rgb("#E27E7E"), secondary: rgb("#3A6B7A"),
    secondary-text: rgb("#6FA6B4"), surface: rgb("#1A2A3A"),
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
  let secondary = p.secondary
  let secondary-text = p.secondary-text
  let surface = p.surface
  (
    bg: bg,
    ink: ink,
    accent: accent,
    accent-text: accent-text,
    secondary: secondary,
    secondary-text: secondary-text,
    surface: surface,
    // Derived from ink
    ink-dim: ink.transparentize(25%),
    ink-muted: ink.transparentize(40%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary
    secondary-dim: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(75%),
    secondary-ghost: secondary.transparentize(92%),
    // Surface variants
    surface-light: surface.lighten(10%),
    surface-dark: surface.darken(15%),
    // Meta
    meta-color: ink.transparentize(45%),
  )
}

// Default palette
#let palette = build-palette("indigo")

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

// Great Wave: bold curved crest with foam pattern (iconic Hokusai shape, simplified)
#let _great-wave-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 200\"><path d=\"M 0 180 Q 40 160 70 140 Q 100 120 120 90 Q 140 60 155 45 Q 170 30 185 25 Q 200 20 210 25 Q 225 30 230 45 Q 220 35 210 40 Q 195 50 190 65 Q 185 80 195 70 Q 210 55 230 50 Q 250 45 270 55 Q 290 65 310 90 Q 330 115 360 140 Q 380 155 400 165\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2.5\" stroke-linecap=\"round\"/><path d=\"M 155 45 Q 160 35 170 28 Q 180 20 195 18 Q 210 16 220 22\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\"/><path d=\"M 120 90 Q 130 75 145 65 Q 155 58 165 55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-linecap=\"round\"/><circle cx=\"175\" cy=\"22\" r=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"190\" cy=\"18\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"205\" cy=\"16\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"165\" cy=\"28\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"148\" cy=\"40\" r=\"2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"218\" cy=\"20\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"230\" cy=\"25\" r=\"1.2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"135\" cy=\"55\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"200\" cy=\"14\" r=\"1\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"160\" cy=\"18\" r=\"1.2\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// Cloud pattern: stylized Japanese kumo clouds (rounded scallop shapes)
#let _kumo-cloud-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 100\"><path d=\"M 20 70 Q 20 50 40 50 Q 40 35 60 35 Q 60 20 80 20 Q 100 20 100 35 Q 120 20 140 35 Q 140 20 160 20 Q 180 20 180 35 Q 180 50 200 50\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\"/><path d=\"M 10 85 Q 10 70 30 70 Q 30 60 50 60 Q 70 60 70 70 Q 90 60 110 70 Q 110 60 130 60 Q 150 60 150 70 Q 170 70 170 85\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\" stroke-linecap=\"round\"/></svg>"

// Torii gate: simple geometric silhouette
#let _torii-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 120\"><rect x=\"15\" y=\"20\" width=\"6\" height=\"100\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"79\" y=\"20\" width=\"6\" height=\"100\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"5\" y=\"15\" width=\"90\" height=\"7\" rx=\"2\" fill=\"currentColor\"/><rect x=\"10\" y=\"35\" width=\"80\" height=\"5\" fill=\"currentColor\" opacity=\"0.85\"/><path d=\"M 5 15 Q 50 0 95 15\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"3\" stroke-linecap=\"round\"/></svg>"

// Wave foam: scattered circles along a curved baseline
#let _wave-foam-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 60\"><path d=\"M 0 40 Q 50 25 100 30 Q 150 35 200 28 Q 250 20 300 30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.4\"/><circle cx=\"25\" cy=\"35\" r=\"2\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"50\" cy=\"28\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"75\" cy=\"30\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"100\" cy=\"30\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"130\" cy=\"32\" r=\"2\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"155\" cy=\"30\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"180\" cy=\"28\" r=\"2.2\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"210\" cy=\"26\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"240\" cy=\"24\" r=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"270\" cy=\"28\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"290\" cy=\"30\" r=\"2\" fill=\"currentColor\" opacity=\"0.6\"/></svg>"

// Mount Fuji silhouette: triangular mountain with snow cap
#let _fuji-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 120\"><path d=\"M 20 120 L 95 20 Q 100 12 105 20 L 180 120 Z\" fill=\"currentColor\" opacity=\"0.15\"/><path d=\"M 20 120 L 95 20 Q 100 12 105 20 L 180 120\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\"/><path d=\"M 78 50 Q 88 42 100 38 Q 112 42 122 50 Q 112 48 100 45 Q 88 48 78 50 Z\" fill=\"currentColor\" opacity=\"0.3\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let great-wave(color: palette.secondary, width: 400pt, height: 200pt) = {
  let svg = _great-wave-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let kumo-cloud(color: palette.ink-faint, width: 200pt, height: 100pt) = {
  let svg = _kumo-cloud-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let torii-gate(color: palette.accent, width: 60pt, height: 72pt) = {
  let svg = _torii-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let wave-foam(color: palette.secondary, width: 300pt, height: 60pt) = {
  let svg = _wave-foam-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let fuji-silhouette(color: palette.ink, width: 200pt, height: 120pt) = {
  let svg = _fuji-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// foam-dot -- Small circle representing wave foam
#let foam-dot(color: palette.secondary, size: 4pt) = {
  circle(radius: size / 2, fill: color)
}

/// wave-accent -- Thin curved accent line
#let wave-accent(color: palette.accent, width: 60pt) = {
  block(width: width, height: 3pt, fill: color)
}

/// hanko-seal -- Small vermillion square seal mark (like a stamp)
#let hanko-seal(label, color: palette.accent, size: 20pt) = {
  box(
    width: size, height: size,
    fill: color,
    stroke: none,
    inset: 2pt,
  )[
    #set text(size: size * 0.4, fill: palette.ink, weight: "bold")
    #set std.align(center + horizon)
    #label
  ]
}

// =====================================================================
// Reusable Components
// =====================================================================

/// wave-card -- Card with wave-foam decoration at bottom edge
#let wave-card(title, body) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (left: 2.5pt + palette.accent),
    inset: (x: 1.1em, top: 0.9em, bottom: 0.7em),
  )[
    #stack(spacing: .8em,
      [#text(size: typo.body, weight: "semibold", fill: palette.ink, title)],
      [#set text(size: 13pt, fill: palette.ink-dim)
       #body
       #lazy-v(1fr)],
    )
  ]
}

/// edo-stat -- Large statistic number with ukiyo-e style label
#let edo-stat(label, value, description: none) = {
  block(width: 100%, fill: palette.surface, inset: (x: 0.8em, y: 0.6em))[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(size: 42pt, weight: "bold", fill: palette.ink, value),
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.accent-text,
        upper(label),
      ),
      block(width: 24pt, height: 2pt, fill: palette.accent),
      if description != none {
        text(
          size: 12pt,
          weight: "regular",
          fill: palette.ink-muted,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// torii-divider -- Horizontal divider with torii gate icon centered
#let torii-divider(total-width: 100%) = {
  block(width: total-width, height: 28pt)[
    #place(left + horizon, line(length: 42%, stroke: 0.5pt + palette.accent-muted))
    #place(right + horizon, line(length: 42%, stroke: 0.5pt + palette.accent-muted))
    #place(center + horizon, torii-gate(color: palette.accent, width: 18pt, height: 22pt))
  ]
}

/// ukiyo-tag -- Small pill-shaped tag label
#let ukiyo-tag(body, accent: palette.secondary, text-color: palette.secondary-text) = {
  box(
    fill: accent.transparentize(80%),
    stroke: 0.4pt + accent.transparentize(40%),
    inset: (x: 8pt, y: 3pt),
    radius: 2pt,
  )[
    #text(size: typo.small, fill: text-color, weight: "medium", body)
  ]
}

/// scroll-quote -- Quote styled like a scroll with wave ornaments
#let scroll-quote(body, cite: none) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (left: 2pt + palette.secondary),
    inset: (left: 1.2em, right: 1em, y: 0.8em),
  )[
    #set text(size: typo.body, style: "italic", fill: palette.ink)
    #body
    #if cite != none {
      v(0.5em)
      text(
        size: typo.tiny,
        style: "normal",
        weight: "medium",
        tracking: 1pt,
        fill: palette.meta-color,
        [-- #upper(cite)],
      )
    }
    #lazy-v(1fr)
  ]
}

/// woodblock-panel -- Bold panel with flat color fill, no rounded corners
#let woodblock-panel(title, body, accent: palette.accent) = {
  block(width: 100%, stroke: none, inset: 0pt, clip: true)[
    #stack(spacing: 0pt,
      block(width: 100%, fill: accent, inset: (x: 1em, y: 0.5em))[
        #text(size: typo.small, weight: "bold", fill: palette.ink, tracking: 0.5pt, upper(title))
      ],
      block(width: 100%, fill: palette.surface, inset: (x: 1em, y: 0.8em))[
        #set text(size: 13pt, fill: palette.ink-dim)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// ukiyo-data-table -- Data table styled with woodblock print aesthetic
#let ukiyo-data-table(align: left + horizon, headers, ..rows) = {
  let row-data = rows.pos()
  let ncols = headers.len()
  table(
    columns: range(ncols).map(_ => 1fr),
    align: align,
    fill: (_, row) => if row == 0 { palette.secondary-ghost } else { none },
    stroke: 0.5pt + palette.secondary-faint,
    inset: (x: 0.8em, y: 0.4em),
    table.header(..headers.map(h => text(
      size: 9pt,
      weight: "bold",
      tracking: 1pt,
      fill: palette.secondary-text,
      upper(h),
    ))),
    ..row-data.flatten().map(cell => text(size: 11pt, fill: palette.ink-dim, cell)),
  )
}

/// wave-progress -- Horizontal progress indicator with foam dots
#let wave-progress(value, total, label: none) = {
  assert(total > 0, message: "wave-progress total must be greater than zero")
  let pct = calc.max(0.0, calc.min(value / total, 1.0))
  let bar = block(width: 100%, height: 6pt, fill: palette.surface-dark, radius: 0pt)[
    #place(left, block(width: pct * 100%, height: 6pt, fill: palette.accent))
    #place(left + horizon, dx: pct * 100% - 3pt,
      foam-dot(color: palette.ink, size: 6pt))
  ]
  block(width: 100%, inset: (y: 0.3em))[
    #if label != none {
      stack(
        spacing: .8em,
        text(size: typo.tiny, fill: palette.ink-muted, upper(label)),
        bar,
      )
    } else {
      bar
    }
  ]
}

/// kamon-icon -- Circular family crest style icon with text
#let kamon-icon(symbol, size: 36pt, color: palette.accent) = {
  box(width: size, height: size)[
    #place(center + horizon, circle(radius: size / 2, stroke: 1.5pt + color, fill: none))
    #place(center + horizon, circle(radius: size / 2 - 3pt, stroke: 0.5pt + color.transparentize(50%), fill: none))
    #place(center + horizon, text(size: size * 0.4, fill: color, weight: "bold", symbol))
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header with wave accent
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 1.3em, bottom: 0.1em))
  set std.align(top + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "semibold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 50pt, height: 2pt, fill: pal.accent),
  )
}

/// _slide-footer -- Standard footer with wave-theme branding
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      }
    },
    text(fill: pal.accent-muted, size: 7pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark slides
#let _dark-header(title: none, custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(top + left)
    stack(
      spacing: .8em,
      {
        set text(size: 8pt, fill: pal.meta-color)
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
      if title != none {
        stack(
          spacing: .8em,
          {
            set text(size: 1.15em, weight: "medium", fill: pal.ink)
            utils.call-or-display(self, title)
          },
          block(width: 50pt, height: 2pt, fill: pal.accent),
        )
      },
    )
  }
}

/// _dark-footer -- Minimal footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[UKIYO]
    },
    text(fill: pal.accent-muted, size: 7pt)[#sym.diamond.filled],
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

/// slide -- Standard content slide with subtle wave foam background
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
  let setting(body) = {
    // Subtle wave foam along bottom
    place(bottom + right, dx: -10pt, dy: -5pt,
      wave-foam(color: pal.secondary.transparentize(70%), width: 250pt, height: 40pt),
    )
    // Small foam dots in upper corner
    place(top + right, dx: -30pt, dy: 8pt,
      foam-dot(color: pal.secondary-muted, size: 3pt),
    )
    place(top + right, dx: -50pt, dy: 14pt,
      foam-dot(color: pal.secondary-faint, size: 2pt),
    )
    show: std.align.with(self.store.align)
    body
  }
self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deep indigo variant with wave decorations
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(
    title: if title == auto { none } else { title },
    custom-left: header-left,
    custom-right: header-right,
  )
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Large wave crest in background (bottom-left, dramatic scale)
    place(bottom + left, dx: -40pt, dy: 20pt,
      great-wave(color: pal.secondary.transparentize(75%), width: 350pt, height: 175pt),
    )
    // Kumo cloud top-right
    place(top + right, dx: -20pt, dy: 15pt,
      kumo-cloud(color: pal.ink.transparentize(85%), width: 150pt, height: 70pt),
    )
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.surface-dark,
      header: header,
      footer: footer,
      margin: (top: 4.6em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Woodblock print composition: wave, clouds, bold typography
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Deep background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Large great wave — right side, dramatic asymmetry
    place(bottom + right, dx: 20pt, dy: 10pt,
      great-wave(color: pal.secondary.transparentize(30%), width: 420pt, height: 210pt),
    )

    // Second wave layer (deeper, lighter)
    place(bottom + right, dx: 60pt, dy: 30pt,
      great-wave(color: pal.secondary.transparentize(60%), width: 350pt, height: 175pt),
    )

    // Kumo clouds top-left
    place(top + left, dx: 30pt, dy: 20pt,
      kumo-cloud(color: pal.ink.transparentize(80%), width: 220pt, height: 100pt),
    )

    // Scattered foam dots
    place(top + right, dx: -80pt, dy: 60pt, foam-dot(color: pal.secondary-muted, size: 3pt))
    place(top + right, dx: -120pt, dy: 45pt, foam-dot(color: pal.secondary-faint, size: 2pt))
    place(top + right, dx: -60pt, dy: 90pt, foam-dot(color: pal.ink-faint, size: 2.5pt))

    // Thin frame border
    place(center + horizon,
      rect(width: 95%, height: 91%, stroke: 0.5pt + pal.ink-faint, fill: none)
    )

    // Title content — left-aligned for dramatic asymmetry
    pad(left: 4em, right: 12em, top: 3.5em, bottom: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2pt,
          fill: pal.accent-text,
          upper(info.institution),
        )
        v(1em)
      }
      // Main title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.5em)
      // Accent bar
      #block(width: 60pt, height: 3pt, fill: pal.accent)
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", fill: pal.ink-dim, info.subtitle)
        v(1.2em)
      }
      // Author + date line
      #{
        set text(size: typo.tiny, fill: pal.meta-color)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.accent, size: 6pt)[#sym.diamond.filled]
          h(1.5em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]

    // Hanko seal in bottom-left corner
    place(bottom + left, dx: 3em, dy: -2em,
      hanko-seal([浮], color: pal.accent, size: 22pt),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Torii gate section marker with wave underline
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Large torii gate silhouette (right side, background)
    place(right + horizon, dx: -60pt, dy: 0pt,
      torii-gate(color: pal.accent.transparentize(70%), width: 140pt, height: 168pt),
    )

    // Wave foam line across bottom
    place(bottom + left, dx: 0pt, dy: -30pt,
      wave-foam(color: pal.secondary.transparentize(50%), width: 100%, height: 50pt),
    )

    // Section number (large, ghost)
    place(top + left, dx: 3em, dy: 1.5em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(size: 72pt, weight: "bold", fill: pal.ink-ghost, num-str)
      },
    )

    // Top accent line
    place(top + left, dx: 3em, dy: 4.5em,
      block(width: 50pt, height: 2.5pt, fill: pal.accent))

    // Content area
    pad(left: 4em, right: 10em, top: 6em, bottom: 3em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.accent-text,
      )[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.6em)
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.3em)
      #block(width: 40pt, height: 2pt, fill: pal.accent)
      #v(3fr)
    ]

    // Footer label
    place(bottom + right, dx: -2.5em, dy: -1em,
      text(fill: pal.meta-color, size: 7pt, tracking: 1pt)[UKIYO],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Bold statement on deep background with wave crest
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.surface-dark,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Wave crest top-right (dramatic)
    place(top + right, dx: 10pt, dy: -10pt,
      great-wave(color: pal.secondary.transparentize(60%), width: 300pt, height: 150pt),
    )

    // Corner accent marks
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 40pt, height: 2.5pt, fill: pal.accent))
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 2.5pt, height: 30pt, fill: pal.accent))
    place(bottom + right, dx: 0pt, dy: 0pt,
      block(width: 40pt, height: 2.5pt, fill: pal.accent))
    place(bottom + right, dx: -40pt, dy: 0pt,
      block(width: 2.5pt, height: 30pt, fill: pal.accent))

    // Foam dots scattered
    place(bottom + left, dx: 30pt, dy: -20pt, foam-dot(color: pal.secondary-muted, size: 3pt))
    place(bottom + left, dx: 60pt, dy: -30pt, foam-dot(color: pal.secondary-faint, size: 2pt))
    place(top + right, dx: -200pt, dy: 30pt, foam-dot(color: pal.ink-faint, size: 2pt))

    set text(fill: pal.ink, size: 1.4em, weight: "regular")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Mount Fuji silhouette, farewell composition
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Mount Fuji centered background
    place(bottom + center, dy: 10pt,
      fuji-silhouette(color: pal.secondary, width: 280pt, height: 168pt),
    )

    // Wave foam at bottom
    place(bottom + left, dx: 0pt, dy: -10pt,
      wave-foam(color: pal.secondary.transparentize(40%), width: 100%, height: 50pt),
    )

    // Ghost text
    place(center + horizon, dy: 40pt,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost)[浮世],
    )

    // Thin frame
    place(center + horizon,
      rect(width: 95%, height: 92%, stroke: 0.5pt + pal.ink-faint, fill: none)
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em, y: 3em)[
      // Hanko seal
      #std.align(center, hanko-seal([終], color: pal.accent, size: 26pt))
      #v(0.8em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.6em)
      // Accent bar
      #std.align(center, block(width: 50pt, height: 2pt, fill: pal.accent))
      #v(0.8em)
      #text(size: 9pt, fill: pal.meta-color, tracking: 1.5pt)[UKIYO-WAVE]
    ]
  }
  touying-slide(self: self, main-body)
})

/// outline-slide -- Table of contents with torii markers
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Decorative torii top-right
    place(top + right, dx: -40pt, dy: 30pt,
      torii-gate(color: pal.accent.transparentize(75%), width: 80pt, height: 96pt),
    )

    // Wave foam bottom
    place(bottom + left, dx: 0pt, dy: -15pt,
      wave-foam(color: pal.secondary.transparentize(60%), width: 100%, height: 40pt),
    )

    pad(left: 4em, right: 6em, top: 3em, bottom: 2.5em)[
      #text(size: typo.h1, weight: "bold", fill: pal.ink, title)
      #v(0.3em)
      #block(width: 40pt, height: 2pt, fill: pal.accent)
      #v(1.5em)
      #{
        set text(size: typo.body, fill: pal.ink-dim)
        set par(leading: 1.2em)
        show outline.entry: it => it.body() + linebreak()
        std.outline(title: none, depth: 1)
      }
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let ukiyo-wave-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "indigo",
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
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
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
