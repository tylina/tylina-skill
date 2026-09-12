// Hologram Theme -- Futuristic holographic projection aesthetic
// Translucent UI panels floating in space, scan lines, holographic grids,
// HUD-style corner brackets, data readouts with glowing edges.
// Light silvery background with electric blue holographic accents.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Palette Definition
// =====================================================================

#let build-palette() = {
  let bg = rgb("#F4F6FA")
  let primary = rgb("#0094FF")
  let accent = rgb("#00E5FF")
  let secondary = rgb("#7C4DFF")
  let ink = rgb("#0D1B2A")
  let card = rgb("#FFFFFF")
  (
    bg: bg,
    ink: ink,
    primary: primary,
    primary-text: primary.darken(25%),
    accent: accent,
    secondary: secondary,
    card: card,
    // Derived from ink
    ink-dim: ink.transparentize(20%),
    ink-muted: ink.transparentize(30%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(90%),
    // Derived from primary
    primary-dim: primary.transparentize(30%),
    primary-muted: primary.transparentize(50%),
    primary-faint: primary.transparentize(80%),
    primary-ghost: primary.transparentize(92%),
    // Derived from accent
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary
    secondary-dim: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(80%),
    // Dark mode
    dark-bg: rgb("#0A0F1E"),
    dark-ink: rgb("#E0F0FF"),
    dark-ink-dim: rgb("#E0F0FF").transparentize(25%),
    dark-ink-muted: rgb("#E0F0FF").transparentize(30%),
    // Meta
    meta-color: ink.transparentize(25%),
  )
}

// Default palette
#let palette = build-palette()

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 30pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 8pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "DejaVu Sans Mono"
#let _sans-font = ("IBM Plex Sans", "Noto Sans SC")

// =====================================================================
// SVG Definitions (5 SVGs, each 10+ paths/elements)
// =====================================================================

// 1. Holographic Grid Floor -- perspective grid with vanishing point
#let _holo-grid-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 200\"><line x1=\"200\" y1=\"20\" x2=\"0\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"20\" x2=\"50\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"20\" x2=\"100\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"20\" x2=\"150\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><line x1=\"200\" y1=\"20\" x2=\"250\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><line x1=\"200\" y1=\"20\" x2=\"300\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"20\" x2=\"350\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.25\"/><line x1=\"200\" y1=\"20\" x2=\"400\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"40\" y1=\"80\" x2=\"360\" y2=\"80\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\"/><line x1=\"20\" y1=\"120\" x2=\"380\" y2=\"120\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><line x1=\"0\" y1=\"160\" x2=\"400\" y2=\"160\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><line x1=\"0\" y1=\"200\" x2=\"400\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><circle cx=\"200\" cy=\"20\" r=\"2\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// 2. HUD Corner Brackets -- four L-shaped bracket corners forming a frame
#let _hud-corners-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><path d=\"M 10 10 L 10 40\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><path d=\"M 10 10 L 40 10\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><path d=\"M 390 10 L 390 40\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><path d=\"M 390 10 L 360 10\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><path d=\"M 10 290 L 10 260\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><path d=\"M 10 290 L 40 290\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><path d=\"M 390 290 L 390 260\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><path d=\"M 390 290 L 360 290\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.7\" fill=\"none\"/><circle cx=\"10\" cy=\"10\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"390\" cy=\"10\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"10\" cy=\"290\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"390\" cy=\"290\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// 3. Scan-line Pattern -- horizontal lines with varying opacity for holographic effect
#let _scanline-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 200\"><line x1=\"0\" y1=\"10\" x2=\"400\" y2=\"10\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/><line x1=\"0\" y1=\"25\" x2=\"400\" y2=\"25\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.05\"/><line x1=\"0\" y1=\"40\" x2=\"400\" y2=\"40\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/><line x1=\"0\" y1=\"55\" x2=\"400\" y2=\"55\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.05\"/><line x1=\"0\" y1=\"70\" x2=\"400\" y2=\"70\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/><line x1=\"0\" y1=\"85\" x2=\"400\" y2=\"85\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.05\"/><line x1=\"0\" y1=\"100\" x2=\"400\" y2=\"100\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><line x1=\"0\" y1=\"115\" x2=\"400\" y2=\"115\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.05\"/><line x1=\"0\" y1=\"130\" x2=\"400\" y2=\"130\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/><line x1=\"0\" y1=\"145\" x2=\"400\" y2=\"145\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.05\"/><line x1=\"0\" y1=\"160\" x2=\"400\" y2=\"160\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/><line x1=\"0\" y1=\"175\" x2=\"400\" y2=\"175\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.05\"/><line x1=\"0\" y1=\"190\" x2=\"400\" y2=\"190\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/></svg>"

// 4. Data Stream Lines -- diagonal flowing lines suggesting data transmission
#let _datastream-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><path d=\"M 0 180 Q 40 140 60 100 Q 80 60 100 40 Q 120 20 160 10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><path d=\"M 10 200 Q 50 160 70 120 Q 90 80 110 60 Q 140 30 180 20\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><path d=\"M 30 200 Q 60 170 80 140 Q 100 100 130 70 Q 150 50 200 30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.25\"/><circle cx=\"60\" cy=\"100\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"100\" cy=\"40\" r=\"1\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"130\" cy=\"70\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"160\" cy=\"10\" r=\"1\" fill=\"currentColor\" opacity=\"0.3\"/><path d=\"M 0 50 Q 30 45 60 35 Q 90 25 120 20\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\" stroke-dasharray=\"4 3\"/><path d=\"M 80 200 Q 100 170 120 150 Q 150 120 200 100\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.15\" stroke-dasharray=\"4 3\"/><rect x=\"55\" y=\"95\" width=\"10\" height=\"10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/><rect x=\"125\" y=\"65\" width=\"10\" height=\"10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.2\"/></svg>"

// 5. Projection Frame -- full holographic projection border with tick marks and readout zones
#let _projection-frame-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 300\"><rect x=\"5\" y=\"5\" width=\"390\" height=\"290\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.4\"/><rect x=\"15\" y=\"15\" width=\"370\" height=\"270\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><line x1=\"15\" y1=\"15\" x2=\"25\" y2=\"15\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"15\" y1=\"15\" x2=\"15\" y2=\"25\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"385\" y1=\"15\" x2=\"375\" y2=\"15\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"385\" y1=\"15\" x2=\"385\" y2=\"25\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"15\" y1=\"285\" x2=\"25\" y2=\"285\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"15\" y1=\"285\" x2=\"15\" y2=\"275\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"385\" y1=\"285\" x2=\"375\" y2=\"285\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"385\" y1=\"285\" x2=\"385\" y2=\"275\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"100\" y1=\"5\" x2=\"100\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"5\" x2=\"200\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"300\" y1=\"5\" x2=\"300\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"100\" y1=\"295\" x2=\"100\" y2=\"288\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"200\" y1=\"295\" x2=\"200\" y2=\"288\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"300\" y1=\"295\" x2=\"300\" y2=\"288\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let holo-grid(color: palette.primary, width: 100%, height: 100%) = {
  let svg = _holo-grid-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let hud-corners(color: palette.primary, width: 100%, height: 100%) = {
  let svg = _hud-corners-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let scanlines(color: palette.primary, width: 100%, height: 100%) = {
  let svg = _scanline-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let datastream(color: palette.accent, width: 200pt, height: 200pt) = {
  let svg = _datastream-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let projection-frame(color: palette.primary, width: 100%, height: 100%) = {
  let svg = _projection-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// holo-dot -- Glowing dot with outer ring
#let holo-dot(color: palette.primary, size: 4pt) = {
  box(width: size * 2, height: size * 2)[
    #place(center + horizon, circle(radius: size, fill: color.transparentize(70%)))
    #place(center + horizon, circle(radius: size / 2, fill: color))
  ]
}

// =====================================================================
// Reusable Components (9 components)
// =====================================================================

/// holo-card -- Frosted glass card with glowing border and HUD bracket accents
#let holo-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.8pt + palette.primary-muted,
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
  )[
    // Corner bracket accents
    #place(top + left, dx: -1em, dy: -0.8em, box(width: 10pt, height: 10pt)[
      #place(top + left, line(length: 8pt, stroke: 0.8pt + palette.accent))
      #place(top + left, line(length: 6pt, angle: 90deg, stroke: 0.8pt + palette.accent))
    ])
    #place(top + right, dx: 1em, dy: -0.8em, box(width: 10pt, height: 10pt)[
      #place(top + right, line(length: 8pt, angle: 180deg, stroke: 0.8pt + palette.accent))
      #place(top + right, line(length: 6pt, angle: 90deg, stroke: 0.8pt + palette.accent))
    ])
    #place(bottom + left, dx: -1em, dy: 0.6em, box(width: 10pt, height: 10pt)[
      #place(bottom + left, line(length: 8pt, stroke: 0.8pt + palette.accent))
      #place(bottom + left, line(length: 6pt, angle: -90deg, stroke: 0.8pt + palette.accent))
    ])
    #place(bottom + right, dx: 1em, dy: 0.6em, box(width: 10pt, height: 10pt)[
      #place(bottom + right, line(length: 8pt, angle: 180deg, stroke: 0.8pt + palette.accent))
      #place(bottom + right, line(length: 6pt, angle: -90deg, stroke: 0.8pt + palette.accent))
    ])
    // Title
    #stack(spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 13pt, fill: palette.ink-dim)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// readout-stat -- Large numeric readout with glowing accent line and label
#let readout-stat(label, value, description: none) = {
  block(width: 100%, fill: palette.bg, inset: (x: 0.6em, y: 0.5em))[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.primary-text,
        font: _mono-font,
        upper(label),
      ),
      text(size: 44pt, weight: "bold", fill: palette.ink, value),
      block(width: 40pt, height: 2pt, fill: palette.accent),
      if description != none {
        text(
          size: 13pt,
          weight: "regular",
          fill: palette.ink-muted,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// projection-box -- Content area with holographic glow layers simulating projection
#let projection-box(body) = {
  block(width: 100%, fill: palette.primary.lighten(96%), inset: 8pt)[
    #block(width: 100%, fill: palette.primary.lighten(92%), inset: 10pt)[
      #block(width: 100%, fill: palette.accent.lighten(94%), inset: (x: 1.2em, y: 1em))[
        #set text(fill: palette.ink, size: typo.body)
        #body
      ]
    ]
  ]
}

/// scanline-divider -- Horizontal divider with scan-line aesthetic and dots
#let scanline-divider(total-width: 100%) = {
  block(width: total-width, height: 14pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.5pt + palette.primary-muted))
    #place(left + horizon, dx: 10%, holo-dot(color: palette.accent, size: 2.5pt))
    #place(left + horizon, dx: 30%, holo-dot(color: palette.primary, size: 2pt))
    #place(left + horizon, dx: 50%, holo-dot(color: palette.accent, size: 3pt))
    #place(left + horizon, dx: 70%, holo-dot(color: palette.primary, size: 2pt))
    #place(left + horizon, dx: 90%, holo-dot(color: palette.accent, size: 2.5pt))
  ]
}

/// beacon-tag -- Small pill-shaped holographic tag
#let beacon-tag(body) = {
  box(
    fill: palette.primary.lighten(92%),
    stroke: 0.5pt + palette.primary-muted,
    inset: (x: 8pt, y: 3pt),
    radius: 12pt,
  )[
    #text(size: typo.small, fill: palette.primary-text, weight: "medium", font: _mono-font, body)
  ]
}

/// interface-highlight -- Highlighted text block with left accent glow
#let interface-highlight(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 2pt + palette.accent),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(
      spacing: .8em,
      {
        set text(size: typo.body, style: "italic", fill: palette.ink)
        body
      },
      if cite != none {
        text(
          size: typo.tiny,
          style: "normal",
          weight: "medium",
          tracking: 1.2pt,
          fill: palette.meta-color,
          font: _mono-font,
          [--- #upper(cite)],
        )
      },
    )
  ]
}

/// datastream-note -- Callout styled like a data transmission readout
#let datastream-note(body) = {
  block(
    width: 100%,
    fill: palette.primary.lighten(92%),
    stroke: (left: 2pt + palette.primary, rest: 0.4pt + palette.primary-faint),
    inset: (left: 1em, right: 0.8em, y: 0.5em),
  )[
    #set text(size: 12pt, fill: palette.ink-dim, font: _mono-font)
    #body
    #lazy-v(1fr)
  ]
}

/// terminal-badge -- Small monospace badge for labels/categories
#let terminal-badge(body) = {
  box(
    fill: palette.ink,
    inset: (x: 6pt, y: 2pt),
    radius: 2pt,
  )[
    #text(size: 8pt, fill: palette.bg, weight: "bold", font: _mono-font, upper(body))
  ]
}

/// matrix-grid -- Data table with holographic styling
#let matrix-grid(headers, align: center + horizon, ..rows) = {
  let row-data = rows.pos()
  let ncols = headers.len()
  let header-cells = headers.map(h => {
    set text(size: 9pt, weight: "bold", tracking: 1pt, fill: palette.primary-text, font: _mono-font)
    upper(h)
  })
  let body-cells = row-data.flatten().map(cell => {
    set text(size: 11pt, fill: palette.ink-dim, font: _mono-font)
    cell
  })
  table(
    columns: ncols * (1fr,),
    align: align,
    inset: (x: 0.8em, y: 0.45em),
    fill: (_x, y) => if y == 0 {
      palette.primary.lighten(85%)
    } else if calc.odd(y) {
      palette.card
    } else {
      palette.bg
    },
    stroke: 0.3pt + palette.primary-faint,
    table.header(..header-cells),
    ..body-cells,
  )
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
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
    block(width: 50pt, height: 2pt, fill: pal.primary),
  )
}

/// _slide-footer -- Standard footer for content slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[HOLOGRAM]
    },
    block(width: 4pt, height: 4pt, fill: pal.primary-muted),
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.dark-ink-muted, font: _mono-font)
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
  }
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.dark-ink-muted, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[HOLOGRAM]
    },
    block(width: 4pt, height: 4pt, fill: pal.accent-muted),
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Light silvery background with faint holographic grid and HUD corners (persistent atmosphere)
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
  let background = block(width: 100%, height: 100%)[
    // Persistent: Faint holographic grid in background
    #place(bottom + center,
      box(width: 100%, height: 40%,
        holo-grid(color: pal.primary.transparentize(60%), width: 100%, height: 100%),
      ),
    )
    // Persistent: Scan-lines subtle overlay
    #place(top + left,
      box(width: 100%, height: 100%,
        scanlines(color: pal.primary.transparentize(40%), width: 100%, height: 100%),
      ),
    )
    // Persistent: HUD corners
    #place(top + left,
      box(width: 100%, height: 100%,
        hud-corners(color: pal.primary.transparentize(40%), width: 100%, height: 100%),
      ),
    )
  ]
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

/// dark-slide -- Deep dark holographic mode with bright glow accents
#let dark-slide(
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(custom-left: header-left, custom-right: header-right)
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Holographic grid floor
    place(bottom + center,
      box(width: 100%, height: 50%,
        holo-grid(color: pal.accent.transparentize(40%), width: 100%, height: 100%),
      ),
    )
    // Data stream decoration
    place(top + right, dx: -20pt, dy: 20pt,
      datastream(color: pal.accent.transparentize(30%), width: 140pt, height: 140pt),
    )
    // HUD corners
    place(top + left,
      box(width: 100%, height: 100%,
        hud-corners(color: pal.accent.transparentize(20%), width: 100%, height: 100%),
      ),
    )
    set text(fill: pal.dark-ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.dark-bg,
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Full holographic projection frame (bookend)
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Dark background for title
    place(top + left, block(width: 100%, height: 100%, fill: pal.dark-bg))

    // Full projection frame SVG
    place(top + left,
      box(width: 100%, height: 100%,
        projection-frame(color: pal.primary, width: 100%, height: 100%),
      ),
    )

    // Holographic grid floor at bottom
    place(bottom + center,
      box(width: 100%, height: 45%,
        holo-grid(color: pal.accent.transparentize(30%), width: 100%, height: 100%),
      ),
    )

    // Scan-lines overlay
    place(top + left,
      box(width: 100%, height: 100%,
        scanlines(color: pal.primary.transparentize(30%), width: 100%, height: 100%),
      ),
    )

    // Data stream top-right
    place(top + right, dx: -40pt, dy: 20pt,
      datastream(color: pal.accent.transparentize(40%), width: 160pt, height: 160pt),
    )

    // Data stream bottom-left
    place(bottom + left, dx: 20pt, dy: -30pt,
      datastream(color: pal.secondary.transparentize(60%), width: 120pt, height: 120pt),
    )

    // HUD corner brackets
    place(top + left,
      box(width: 100%, height: 100%,
        hud-corners(color: pal.accent, width: 100%, height: 100%),
      ),
    )

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2pt,
          fill: pal.accent,
          font: _mono-font,
          upper(info.institution),
        )
        v(1.2em)
      }
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.dark-ink, info.title)
      #v(0.6em)
      // Holographic divider
      #block(width: 200pt, height: 12pt)[
        #place(left + horizon, line(length: 80pt, stroke: 0.8pt + pal.primary))
        #place(center + horizon, circle(radius: 3pt, fill: pal.accent))
        #place(right + horizon, line(length: 80pt, stroke: 0.8pt + pal.primary))
      ]
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", fill: pal.dark-ink-dim, info.subtitle)
        v(1em)
      }
      // Author + date
      #{
        set text(size: typo.tiny, fill: pal.dark-ink-muted, font: _mono-font)
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
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section transition with holographic number display
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.dark-bg))

    // Holographic grid
    place(bottom + center,
      box(width: 100%, height: 50%,
        holo-grid(color: pal.primary.transparentize(50%), width: 100%, height: 100%),
      ),
    )

    // HUD corners
    place(top + left,
      box(width: 100%, height: 100%,
        hud-corners(color: pal.primary.transparentize(30%), width: 100%, height: 100%),
      ),
    )

    // Large section number (holographic readout style)
    place(top + right, dx: -80pt, dy: 40pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 120pt, height: 120pt)[
          #place(center + horizon, circle(radius: 50pt, fill: none, stroke: 0.5pt + pal.primary.transparentize(60%)))
          #place(center + horizon, circle(radius: 35pt, fill: none, stroke: 0.3pt + pal.accent.transparentize(50%)))
          #place(center + horizon, text(fill: pal.accent, size: 48pt, weight: "bold", font: _mono-font, num-str))
        ]
      },
    )

    // Readout label
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 7pt, fill: pal.dark-ink-muted, font: _mono-font)[SYS.SECTION | ACTIVE],
    )

    // Accent line
    place(top + left, dx: 3em, dy: 3em,
      line(length: 80pt, stroke: 1pt + pal.primary))

    // Content
    pad(left: 4em, right: 8em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.accent,
        font: _mono-font,
      )[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.8em)
      #{
        set text(fill: pal.dark-ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 60pt, height: 2pt, fill: pal.primary)
      #v(3fr)
    ]

    // Bottom accent line
    place(bottom + right, dx: -3em, dy: -2em,
      line(length: 80pt, stroke: 1pt + pal.primary))

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.dark-ink-muted, size: 7pt, font: _mono-font)[HOLOGRAM],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Centered statement with holographic glow frame
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.dark-bg,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Scan lines
    place(top + left, dx: -3em, dy: -3em,
      box(width: 100% + 6em, height: 100% + 6em,
        scanlines(color: pal.primary.transparentize(40%), width: 100%, height: 100%),
      ),
    )

    // HUD bracket corners (inner)
    place(top + left, dx: 0pt, dy: 0pt, box(width: 14pt, height: 14pt)[
      #place(top + left, line(length: 14pt, stroke: 1pt + pal.accent))
      #place(top + left, line(length: 12pt, angle: 90deg, stroke: 1pt + pal.accent))
    ])
    place(top + right, dx: 0pt, dy: 0pt, box(width: 14pt, height: 14pt)[
      #place(top + right, line(length: 14pt, angle: 180deg, stroke: 1pt + pal.accent))
      #place(top + right, line(length: 12pt, angle: 90deg, stroke: 1pt + pal.accent))
    ])
    place(bottom + left, dx: 0pt, dy: 0pt, box(width: 14pt, height: 14pt)[
      #place(bottom + left, line(length: 14pt, stroke: 1pt + pal.accent))
      #place(bottom + left, line(length: 12pt, angle: -90deg, stroke: 1pt + pal.accent))
    ])
    place(bottom + right, dx: 0pt, dy: 0pt, box(width: 14pt, height: 14pt)[
      #place(bottom + right, line(length: 14pt, angle: 180deg, stroke: 1pt + pal.accent))
      #place(bottom + right, line(length: 12pt, angle: -90deg, stroke: 1pt + pal.accent))
    ])

    // Glow dots
    place(top + left, dx: 20pt, dy: 30pt, holo-dot(color: pal.primary, size: 2pt))
    place(top + right, dx: -30pt, dy: 40pt, holo-dot(color: pal.accent, size: 3pt))
    place(bottom + left, dx: 40pt, dy: -25pt, holo-dot(color: pal.accent, size: 2.5pt))
    place(bottom + right, dx: -50pt, dy: -35pt, holo-dot(color: pal.primary, size: 2pt))

    set text(fill: pal.dark-ink, size: 1.4em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    pad(x: 1.5em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Full holographic frame farewell (bookend, mirrors title)
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.dark-bg))

    // Full projection frame
    place(top + left,
      box(width: 100%, height: 100%,
        projection-frame(color: pal.primary, width: 100%, height: 100%),
      ),
    )

    // Holographic grid floor
    place(bottom + center,
      box(width: 100%, height: 45%,
        holo-grid(color: pal.accent.transparentize(40%), width: 100%, height: 100%),
      ),
    )

    // Scan lines
    place(top + left,
      box(width: 100%, height: 100%,
        scanlines(color: pal.primary.transparentize(40%), width: 100%, height: 100%),
      ),
    )

    // HUD corners
    place(top + left,
      box(width: 100%, height: 100%,
        hud-corners(color: pal.accent, width: 100%, height: 100%),
      ),
    )

    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.dark-ink.transparentize(92%), font: _mono-font)[END],
    )

    // Data streams
    place(top + right, dx: -50pt, dy: 30pt,
      datastream(color: pal.accent.transparentize(50%), width: 120pt, height: 120pt),
    )
    place(bottom + left, dx: 30pt, dy: -40pt,
      datastream(color: pal.secondary.transparentize(60%), width: 100pt, height: 100pt),
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Top accent diamond
      #std.align(center, text(size: 18pt, fill: pal.accent)[#sym.diamond.filled])
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.dark-ink, body)
      #v(0.8em)
      // Holographic divider
      #std.align(center, block(width: 160pt, height: 12pt)[
        #place(left + horizon, line(length: 60pt, stroke: 0.8pt + pal.primary))
        #place(center + horizon, circle(radius: 2.5pt, fill: pal.accent))
        #place(right + horizon, line(length: 60pt, stroke: 0.8pt + pal.primary))
      ])
      #v(1em)
      #text(size: 10pt, fill: pal.dark-ink-muted, font: _mono-font, tracking: 2pt)[TRANSMISSION COMPLETE]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let hologram-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  let pal = build-palette()

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
      primary: pal.primary,
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
