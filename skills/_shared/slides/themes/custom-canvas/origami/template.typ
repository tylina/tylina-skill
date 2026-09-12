// Origami Theme -- Japanese paper-folding aesthetic for Touying 0.7.4
// Geometric faceted shapes, fold lines, paper texture feeling.
// Colors from traditional Japanese washi paper. Triangular facets, crease lines, angular geometries.
// 3 presets: washi, twilight, cloud
// Canvas-level complexity with SVG decorative elements.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  washi:    (bg: rgb("#F5F0E8"), ink: rgb("#2D2926"), accent: rgb("#C41E3A"), secondary: rgb("#1B4332")),
  twilight: (bg: rgb("#1A1A2E"), ink: rgb("#E8E0D4"), accent: rgb("#E6B325"), secondary: rgb("#4A0E4E")),
  cloud:    (bg: rgb("#E8F0F2"), ink: rgb("#1A1A2E"), accent: rgb("#0077B6"), secondary: rgb("#FF6B35")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let accent = p.accent
  let secondary = p.secondary
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    // Derived tones
    ink-light: ink.transparentize(25%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(90%),
    // Accent variants
    accent-light: accent.transparentize(40%),
    accent-faint: accent.transparentize(75%),
    accent-ghost: accent.transparentize(90%),
    // Secondary variants
    secondary-light: secondary.transparentize(40%),
    secondary-faint: secondary.transparentize(75%),
    // Surface / Overlay
    surface: ink.transparentize(92%),
    divider: ink.transparentize(70%),
    overlay: bg.transparentize(40%),
    // Fold shadow color (subtle darkening for paper folds)
    fold-shadow: ink.transparentize(85%),
  )
}

// Default palette (washi)
#let palette = build-palette("washi")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 48pt,
  h1: 32pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  meta-size: 8pt,
  kicker-size: 9pt,
  stat-size: 48pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _sans-font = ("IBM Plex Sans", "Arial")

// =====================================================================
// SVG Decorative Elements
// =====================================================================

// Fold pattern: interconnected triangles forming a faceted surface (crane wing)
#let _fold-pattern-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 200\"><path d=\"M0,100 L50,30 L100,100 L50,170 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.2\"/><path d=\"M50,30 L100,100 L150,30 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.15\"/><path d=\"M100,100 L150,30 L200,100 L150,170 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.18\"/><path d=\"M150,30 L200,100 L250,30 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.12\"/><path d=\"M200,100 L250,30 L300,100 L250,170 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.16\"/><path d=\"M250,30 L300,100 L350,30 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.1\"/><path d=\"M300,100 L350,30 L400,100 L350,170 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.14\"/><path d=\"M50,170 L100,100 L150,170 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.1\"/><path d=\"M150,170 L200,100 L250,170 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.08\"/><path d=\"M250,170 L300,100 L350,170 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.06\"/></svg>"

// Crease-line divider: angular zigzag suggesting paper folds
#let _crease-divider-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 600 30\"><polyline points=\"0,15 30,5 60,25 90,5 120,25 150,5 180,25 210,5 240,25 270,5 300,25 330,5 360,25 390,5 420,25 450,5 480,25 510,5 540,25 570,5 600,15\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.35\" stroke-linejoin=\"bevel\"/><polyline points=\"0,15 30,8 60,22 90,8 120,22 150,8 180,22 210,8 240,22 270,8 300,22 330,8 360,22 390,8 420,22 450,8 480,22 510,8 540,22 570,8 600,15\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.15\" stroke-linejoin=\"bevel\"/></svg>"

// Corner fold decoration: triangular fold-over in top-right
#let _corner-fold-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 60 60\"><polygon points=\"0,0 60,0 60,60\" fill=\"currentColor\" opacity=\"0.12\"/><line x1=\"0\" y1=\"0\" x2=\"60\" y2=\"60\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.3\"/><polygon points=\"20,0 60,0 60,40\" fill=\"currentColor\" opacity=\"0.06\"/></svg>"

// Large crane watermark SVG for title slide
#let _crane-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 300\"><path d=\"M150,20 L180,80 L250,60 L200,120 L260,150 L200,160 L220,220 L150,180 L80,220 L100,160 L40,150 L100,120 L50,60 L120,80 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.12\"/><path d=\"M150,60 L170,100 L210,90 L180,130 L220,150 L180,155 L190,190 L150,165 L110,190 L120,155 L80,150 L120,130 L90,90 L130,100 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.08\"/><line x1=\"150\" y1=\"20\" x2=\"150\" y2=\"60\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><line x1=\"250\" y1=\"60\" x2=\"210\" y2=\"90\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><line x1=\"260\" y1=\"150\" x2=\"220\" y2=\"150\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><line x1=\"220\" y1=\"220\" x2=\"190\" y2=\"190\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><line x1=\"80\" y1=\"220\" x2=\"110\" y2=\"190\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><line x1=\"40\" y1=\"150\" x2=\"80\" y2=\"150\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/><line x1=\"50\" y1=\"60\" x2=\"90\" y2=\"90\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.1\"/></svg>"

// Faceted background pattern for section slides
#let _facet-bg-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 450\"><path d=\"M0,0 L100,0 L50,80 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M100,0 L200,0 L150,80 L50,80 Z\" fill=\"currentColor\" opacity=\"0.05\"/><path d=\"M200,0 L300,0 L250,80 L150,80 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M300,0 L400,0 L350,80 L250,80 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M400,0 L500,0 L450,80 L350,80 Z\" fill=\"currentColor\" opacity=\"0.06\"/><path d=\"M500,0 L600,0 L550,80 L450,80 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M600,0 L700,0 L650,80 L550,80 Z\" fill=\"currentColor\" opacity=\"0.05\"/><path d=\"M700,0 L800,0 L800,80 L650,80 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M50,80 L150,80 L100,160 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M150,80 L250,80 L200,160 L100,160 Z\" fill=\"currentColor\" opacity=\"0.06\"/><path d=\"M250,80 L350,80 L300,160 L200,160 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M350,80 L450,80 L400,160 L300,160 Z\" fill=\"currentColor\" opacity=\"0.05\"/><path d=\"M450,80 L550,80 L500,160 L400,160 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M550,80 L650,80 L600,160 L500,160 Z\" fill=\"currentColor\" opacity=\"0.06\"/><path d=\"M0,160 L100,160 L50,240 Z\" fill=\"currentColor\" opacity=\"0.05\"/><path d=\"M100,160 L200,160 L150,240 L50,240 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M200,160 L300,160 L250,240 L150,240 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M300,160 L400,160 L350,240 L250,240 Z\" fill=\"currentColor\" opacity=\"0.06\"/><path d=\"M400,160 L500,160 L450,240 L350,240 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M500,160 L600,160 L550,240 L450,240 Z\" fill=\"currentColor\" opacity=\"0.05\"/><path d=\"M50,240 L150,240 L100,320 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M150,240 L250,240 L200,320 L100,320 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M250,240 L350,240 L300,320 L200,320 Z\" fill=\"currentColor\" opacity=\"0.05\"/><path d=\"M350,240 L450,240 L400,320 L300,320 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M0,320 L100,320 L50,400 Z\" fill=\"currentColor\" opacity=\"0.03\"/><path d=\"M100,320 L200,320 L150,400 L50,400 Z\" fill=\"currentColor\" opacity=\"0.05\"/><path d=\"M200,320 L300,320 L250,400 L150,400 Z\" fill=\"currentColor\" opacity=\"0.04\"/><path d=\"M300,320 L400,320 L350,400 L250,400 Z\" fill=\"currentColor\" opacity=\"0.03\"/></svg>"

// =====================================================================
// SVG Rendering Functions
// =====================================================================

/// fold-pattern -- Renders the interconnected triangle faceted surface
#let fold-pattern(color: palette.ink, width: 100%, height: 60pt) = {
  let svg = _fold-pattern-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

/// crease-divider-render -- Renders the angular zigzag crease line
#let crease-divider-render(color: palette.ink, width: 100%, height: 12pt) = {
  let svg = _crease-divider-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

/// corner-fold-render -- Renders the corner fold decoration
#let corner-fold-render(color: palette.ink, size: 40pt) = {
  let svg = _corner-fold-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

/// crane-watermark -- Renders the large crane motif
#let crane-watermark(color: palette.ink, size: 200pt) = {
  let svg = _crane-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

/// facet-background -- Renders the faceted triangular background
#let facet-background(color: palette.accent, width: 100%, height: 100%) = {
  let svg = _facet-bg-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// 1. Reusable Components
// =====================================================================

/// origami-card -- Card with triangular fold corner (SVG fold-over in top-right)
#let origami-card(title, body) = {
  block(
    width: 100%,
    fill: palette.bg.darken(2%),
    stroke: 0.5pt + palette.ink-faint,
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
  )[
    // Corner fold decoration
    #place(top + right, dx: 0pt, dy: 0pt,
      corner-fold-render(color: palette.accent, size: 32pt),
    )
    #stack(
      spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 13pt, fill: palette.ink-light, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// facet-stat -- Number displayed inside a diamond/rhombus shape
#let facet-stat(value, label, pal: palette) = {
  block(width: 100%)[
    #std.align(center)[
      #stack(
        spacing: .8em,
        block(width: 80pt, height: 80pt)[
          // Diamond shape via rotated square
          #place(center + horizon,
            rotate(45deg,
              rect(
                width: 50pt,
                height: 50pt,
                fill: pal.accent-ghost,
                stroke: 1pt + pal.accent-light,
              ),
            ),
          )
          // Value in center
          #place(center + horizon,
            text(size: typo.stat-size, weight: "black", fill: pal.accent, value),
          )
        ],
        text(
          size: typo.kicker-size,
          weight: "bold",
          tracking: 1.5pt,
          fill: pal.ink-muted,
          font: _mono-font,
          upper(label),
        ),
      )
    ]
    #lazy-v(1fr)
  ]
}

/// crane-divider -- Angular zigzag crease-line divider
#let crane-divider(width: 100%) = {
  block(width: width, height: 16pt)[
    #std.align(center + horizon,
      crease-divider-render(color: palette.ink, width: 80%, height: 12pt),
    )
  ]
}

/// fold-quote -- Blockquote with fold-line border decoration
#let fold-quote(body, cite: none, pal: palette) = {
  block(
    width: 100%,
    inset: (left: 1.4em, right: 1em, y: 0.6em),
  )[
    // Zigzag left border (simulated with angled lines)
    #place(top + left, dx: -0.2em, dy: 0pt,
      block(width: 4pt, height: 100%)[
        #place(left,
          line(start: (0pt, 0pt), end: (4pt, 8pt), stroke: 1.2pt + pal.accent),
        )
        #place(left,
          line(start: (4pt, 8pt), end: (0pt, 16pt), stroke: 1.2pt + pal.accent),
        )
        #place(left,
          line(start: (0pt, 16pt), end: (4pt, 24pt), stroke: 1.2pt + pal.accent),
        )
        #place(left,
          line(start: (4pt, 24pt), end: (0pt, 32pt), stroke: 1.2pt + pal.accent),
        )
        #place(left,
          line(start: (0pt, 32pt), end: (4pt, 40pt), stroke: 1.2pt + pal.accent),
        )
        #place(left,
          line(start: (4pt, 40pt), end: (0pt, 48pt), stroke: 1.2pt + pal.accent),
        )
      ],
    )
    #text(size: typo.body, style: "italic", fill: pal.ink, body)
    #if cite != none {
      v(0.4em)
      text(
        size: typo.meta-size,
        style: "normal",
        weight: "bold",
        tracking: 1.2pt,
        fill: pal.ink-muted,
        font: _mono-font,
        [-- #upper(cite)],
      )
    }
  ]
}

/// tessellation-grid -- Grid layout with alternating triangular accent fills
#let tessellation-grid(items) = {
  let cols = calc.min(items.len(), 3)
  set text(size: 14pt)
  grid(
    columns: (1fr,) * cols,
    column-gutter: 12pt,
    row-gutter: 12pt,
    ..items.enumerate().map(((idx, item)) => {
      block(
        width: 100%,
        fill: if calc.rem(idx, 2) == 0 { palette.surface } else { palette.accent-ghost },
        stroke: 0.5pt + palette.ink-faint,
        inset: (x: 0.8em, y: 0.5em),
      )[
        // Small triangle accent in top-left
        #place(top + left, dx: -0.8em, dy: -0.5em,
          polygon(
            fill: if calc.rem(idx, 2) == 0 { palette.accent.transparentize(80%) } else { palette.secondary.transparentize(80%) },
            (0pt, 0pt), (20pt, 0pt), (0pt, 20pt),
          ),
        )
        #item
        #lazy-v(1fr)
      ]
    }),
  )
}

/// paper-tag -- Small label with folded corner appearance
#let paper-tag(body, color: palette.accent) = {
  box(
    fill: color.transparentize(85%),
    stroke: 0.5pt + color.transparentize(50%),
    inset: (x: 0.5em, y: 0.2em),
  )[
    // Tiny triangle fold indicator
    #place(top + right, dx: 2pt, dy: -2pt,
      polygon(
        fill: color.transparentize(40%),
        (0pt, 0pt), (6pt, 0pt), (6pt, 6pt),
      ),
    )
    #text(
      size: typo.meta-size,
      weight: "bold",
      fill: color,
      font: _mono-font,
      tracking: 0.5pt,
      upper(body),
    )
  ]
}

// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// _origami-header -- Standard header with fold accent
#let _origami-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    {
      set text(size: 8pt, weight: "bold", fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
      grid(
        columns: (1fr, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        {
          set std.align(right)
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        },
      )
    },
    {
      set text(fill: pal.ink, size: 1.3em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 40pt, height: 2pt, fill: pal.accent),
  )
}

/// _origami-footer -- Standard footer with geometric dot
#let _origami-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)
      upper[ORIGAMI]
    },
    // Diamond dot instead of circle
    rotate(45deg, rect(width: 4pt, height: 4pt, fill: pal.accent)),
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.ink-muted, font: _mono-font)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard content slide with subtle fold-line frame
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _origami-header(self)
  let footer(self) = _origami-footer(self)
  let setting(body) = {
    // Subtle fold-line frame via centered rect
    place(center + horizon,
      rect(
        width: 96%,
        height: 94%,
        fill: none,
        stroke: 0.3pt + self.store.palette.ink-faint,
      ),
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

/// dark-slide -- Twilight preset colors (inverted, dark background)
#let dark-slide(
  title: auto,
  align: auto,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  // Use twilight colors for dark slide regardless of preset
  let dark-pal = build-palette("twilight")

  let header(self) = {
    let dp = dark-pal
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(size: 8pt, weight: "bold", fill: dp.ink-muted, font: _mono-font, tracking: 0.5pt)
        grid(
          columns: (1fr, 1fr),
          {
            if self.store.footer != none {
              utils.call-or-display(self, self.store.footer)
            }
          },
          {
            set std.align(right)
            context [#utils.slide-counter.display() / #utils.last-slide-number]
          },
        )
      },
      {
        set text(fill: dp.ink, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
    )
  }

  let footer(self) = {
    let dp = dark-pal
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    grid(
      columns: (1fr, auto, 1fr),
      {
        set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: dp.ink-muted, font: _mono-font)
        upper[ORIGAMI]
      },
      rotate(45deg, rect(width: 4pt, height: 4pt, fill: dp.accent)),
      {
        set std.align(right)
        set text(size: 7pt, weight: "bold", fill: dp.ink-muted, font: _mono-font)
        context [#utils.slide-counter.display()]
      },
    )
  }

  let setting(body) = {
    // Fold pattern decoration in background
    place(bottom + right, dx: -10pt, dy: -10pt,
      fold-pattern(color: dark-pal.ink, width: 200pt, height: 50pt),
    )
    set text(fill: dark-pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: dark-pal.bg,
      header: header,
      footer: footer,
      margin: (top: 5.5em, bottom: 1.3em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Large origami crane SVG watermark, bold title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Crane watermark (top-right)
    place(top + right, dx: -20pt, dy: 20pt,
      crane-watermark(color: pal.accent, size: 240pt),
    )
    // Fold pattern decoration bottom
    place(bottom + left, dx: 0pt, dy: -20pt,
      fold-pattern(color: pal.ink, width: 300pt, height: 50pt),
    )
    // Top accent line
    place(top + left,
      block(width: 100%, height: 2.5pt, fill: pal.accent),
    )
    // Content
    set std.align(left + horizon)
    pad(x: 3.5em, y: 2.9em)[
      #stack(
        spacing: .8em,
        if info.institution != none { paper-tag(info.institution, color: pal.accent) },
        stack(
          spacing: .8em,
          text(size: 2.4em, weight: "black", fill: pal.ink, info.title),
          block(width: 60pt, height: 2.5pt, fill: pal.accent),
        ),
        if info.subtitle != none {
          text(size: typo.h2, weight: "regular", fill: pal.ink-light, info.subtitle)
        },
        {
        set text(size: 9pt, fill: pal.ink-muted, font: _mono-font, weight: "bold", tracking: 0.5pt)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1em)
          text(fill: pal.accent)[#sym.diamond.filled]
          h(1em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
        },
      )
    ]
    // Bottom accent bar
    place(bottom + left,
      block(width: 100%, height: 2.5pt, fill: pal.secondary),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Faceted background pattern, section number in geometric frame
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Faceted background
    place(top + left,
      block(width: 100%, height: 100%)[
        #facet-background(color: pal.accent, width: 100%, height: 100%)
      ],
    )
    // Top accent line
    place(top + left,
      block(width: 100%, height: 2.5pt, fill: pal.accent),
    )
    // Section number in diamond frame (top-right)
    place(top + right, dx: -60pt, dy: 40pt,
      block(width: 100pt, height: 100pt)[
        #place(center + horizon,
          rotate(45deg,
            rect(
              width: 60pt,
              height: 60pt,
              fill: none,
              stroke: 2pt + pal.accent,
            ),
          ),
        )
        #place(center + horizon,
          context {
            let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
            text(fill: pal.accent, size: 28pt, weight: "black", font: _mono-font, num-str)
          },
        )
      ],
    )
    // Content
    pad(left: 4em, right: 6em, top: 4em, bottom: 2em)[
      #v(1fr)
      // Kicker
      #paper-tag([SECTION], color: pal.accent)
      #v(0.8em)
      // Section title
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "black")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      // Crease divider
      #crease-divider-render(color: pal.ink, width: 120pt, height: 10pt)
      #v(3fr)
    ]
    // Bottom accent line
    place(bottom + left,
      block(width: 100%, height: 2.5pt, fill: pal.secondary),
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single message on faceted color background
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.accent,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Facet pattern in background (using bg color on accent background)
    place(top + left, dx: -3em, dy: -3em,
      block(width: 130%, height: 130%)[
        #facet-background(color: pal.bg, width: 100%, height: 100%)
      ],
    )
    // Diamond decorations
    place(top + left, dx: 0pt, dy: 0pt,
      rotate(45deg, rect(width: 12pt, height: 12pt, fill: none, stroke: 1pt + pal.bg.transparentize(50%))),
    )
    place(bottom + right, dx: 0pt, dy: 0pt,
      rotate(45deg, rect(width: 12pt, height: 12pt, fill: none, stroke: 1pt + pal.bg.transparentize(50%))),
    )
    set text(fill: pal.bg, size: 1.8em, weight: "bold")
    set std.align(horizon + center)
    body
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Crane motif, farewell text
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Top accent
    place(top + left,
      block(width: 100%, height: 2.5pt, fill: pal.accent),
    )
    // Crane watermark centered
    place(center + horizon,
      crane-watermark(color: pal.ink, size: 280pt),
    )
    // Content on top
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(
        spacing: .8em,
        std.align(center, block(width: 60pt, height: 2.5pt, fill: pal.accent)),
        text(size: 2.2em, weight: "black", fill: pal.ink, body),
        std.align(center, rotate(45deg, rect(width: 8pt, height: 8pt, fill: pal.accent))),
        text(size: 8pt, weight: "bold", tracking: 2pt, fill: pal.ink-muted, font: _mono-font)[ORIGAMI],
      )
    ]
    // Bottom accent
    place(bottom + left,
      block(width: 100%, height: 2.5pt, fill: pal.secondary),
    )
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let origami-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "washi",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 5.5em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
      neutral-lightest: pal.ink,
      neutral-darkest: pal.bg,
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
