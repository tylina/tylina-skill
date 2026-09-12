// Topographic Theme -- Contour lines, elevation data, geological survey aesthetics
// Organic flowing SVG contour patterns as structural decorative elements
// Earth tones with survey marker orange accent
// 3 presets: forest (green on cream), ocean (blue on gray), desert (brown on sand)
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  forest: (
    terrain: rgb("#2D3B2D"),
    paper: rgb("#F7F4EF"),
    contour: rgb("#5B7553"),
    water: rgb("#4A90A4"),
    marker: rgb("#E85D04"),
    grid-brown: rgb("#8B7355"),
  ),
  ocean: (
    terrain: rgb("#1B2D3A"),
    paper: rgb("#EDF2F4"),
    contour: rgb("#4A90A4"),
    water: rgb("#2C6E8A"),
    marker: rgb("#E85D04"),
    grid-brown: rgb("#5A7A8A"),
  ),
  desert: (
    terrain: rgb("#3D2E1F"),
    paper: rgb("#F5EDD8"),
    contour: rgb("#8B7355"),
    water: rgb("#4A90A4"),
    marker: rgb("#E85D04"),
    grid-brown: rgb("#A0845C"),
  ),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  (
    terrain: p.terrain,
    paper: p.paper,
    contour: p.contour,
    contour-text: p.contour.darken(20%),
    water: p.water,
    marker: p.marker,
    marker-text: p.marker.darken(20%),
    grid-brown: p.grid-brown,
    grid-text: p.grid-brown.darken(25%),
    // Derived tones
    terrain-light: p.terrain.transparentize(25%),
    terrain-faint: p.terrain.transparentize(80%),
    terrain-ghost: p.terrain.transparentize(94%),
    terrain-muted: p.terrain.transparentize(28%),
    contour-light: p.contour.transparentize(50%),
    contour-faint: p.contour.transparentize(75%),
    meta-color: p.terrain.transparentize(25%),
  )
}

// Default palette
#let palette = build-palette("forest")

// =====================================================================
// Typography & Font Constants
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _sans-font = ("IBM Plex Sans", "Hiragino Sans GB")

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 22pt,
  lead: 16pt,
  body: 14pt,
  meta-size: 8pt,
  coord-size: 9pt,
)

// =====================================================================
// SVG Decorative Elements
// =====================================================================

// Flowing contour line SVG - organic curves at multiple elevations
#let _contour-svg-1 = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 200\"><path d=\"M0,100 C100,60 200,140 300,100 C400,60 500,130 600,90 C700,50 750,110 800,80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.25\"/><path d=\"M0,130 C120,90 220,160 320,120 C420,80 520,150 620,110 C720,70 760,130 800,100\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.18\"/><path d=\"M0,70 C80,40 180,110 280,70 C380,30 480,100 580,60 C680,20 740,80 800,50\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.12\"/></svg>"

// Denser contour SVG for title slides
#let _contour-svg-dense = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 300\"><path d=\"M0,50 C100,20 200,80 300,50 C400,20 500,70 600,40 C700,10 750,60 800,30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.3\"/><path d=\"M0,90 C130,55 230,120 330,85 C430,50 530,110 630,75 C730,40 770,95 800,65\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.25\"/><path d=\"M0,130 C100,100 200,160 300,130 C400,100 500,155 600,120 C700,85 750,140 800,110\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.0\" opacity=\"0.2\"/><path d=\"M0,170 C120,140 220,200 320,170 C420,140 520,195 620,160 C720,125 760,180 800,150\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.15\"/><path d=\"M0,210 C80,185 180,240 280,210 C380,185 480,235 580,200 C680,170 740,220 800,190\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.1\"/><path d=\"M0,250 C110,225 210,275 310,245 C410,215 510,265 610,235 C710,205 760,255 800,230\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.08\"/></svg>"

// Survey marker SVG (crosshair + circle)
#let _marker-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 40 40\"><circle cx=\"20\" cy=\"20\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\"/><line x1=\"20\" y1=\"4\" x2=\"20\" y2=\"36\" stroke=\"currentColor\" stroke-width=\"1\"/><line x1=\"4\" y1=\"20\" x2=\"36\" y2=\"20\" stroke=\"currentColor\" stroke-width=\"1\"/></svg>"

// =====================================================================
// SVG Rendering Functions
// =====================================================================

/// contour-decoration -- Renders flowing contour lines
#let contour-decoration(color: palette.contour, width: 100%, height: 60pt, dense: false) = {
  let svg-src = if dense { _contour-svg-dense } else { _contour-svg-1 }
  let svg = svg-src.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

/// survey-marker -- Renders the crosshair/circle survey marker
#let survey-marker(color: palette.marker, size: 20pt) = {
  let svg = _marker-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

// =====================================================================
// Reusable Components
// =====================================================================

/// elevation-card -- Card with contour-green top border, earth-tone bg
#let elevation-card(title, body, accent: palette.contour) = {
  block(
    width: 100%,
    fill: palette.paper.darken(3%),
    stroke: (top: 2.5pt + accent, rest: 0.5pt + palette.terrain-faint),
    inset: (x: 1em, y: 0.8em),
    radius: 0pt,
  )[
    #stack(spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.terrain, title),
      [
        #set text(size: 12pt, fill: palette.terrain-light)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// depth-stat -- Big number with monospace "elevation" annotation
#let depth-stat(value, label, unit: none) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #stack(spacing: .8em,
      [
        #text(
          size: 48pt,
          weight: "bold",
          fill: palette.terrain,
          value,
        )
        #if unit != none {
          h(0.2em)
          text(
            size: typo.coord-size,
            fill: palette.contour-text,
            font: _mono-font,
            weight: "medium",
            unit,
          )
        }
      ],
      [
        #text(
          size: typo.body,
          fill: palette.terrain-light,
          font: _sans-font,
          label,
        )
        #lazy-v(1fr)
      ],
    )
  ]
}

/// coordinate-tag -- Monospace tag styled like map coordinates
#let coordinate-tag(body, accent: palette.grid-brown) = {
  box(
    fill: accent.transparentize(88%),
    inset: (x: 0.5em, y: 0.25em),
    radius: 0pt,
    stroke: 0.5pt + accent.transparentize(60%),
  )[
    #text(
      size: typo.meta-size,
      fill: accent.darken(25%),
      font: _mono-font,
      tracking: 0.5pt,
      weight: "medium",
      body,
    )
  ]
}

/// terrain-quote -- Quote with contour-green left border
#let terrain-quote(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 3pt + palette.contour),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #set text(size: typo.lead, style: "italic", fill: palette.terrain)
    #body
    #if cite != none {
      v(0.4em)
      text(
        size: typo.meta-size,
        style: "normal",
        weight: "medium",
        fill: palette.terrain-muted,
        font: _mono-font,
      )[-- #cite]
    }
  ]
}

/// contour-divider -- SVG contour lines as content separator
#let contour-divider(color: palette.contour, width: 100%) = {
  v(0.4em)
  contour-decoration(color: color, width: width, height: 30pt)
  v(0.4em)
}

/// survey-note -- Callout with survey-marker orange left bar + monospace label
#let survey-note(label, body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + palette.marker, rest: 0.5pt + palette.terrain-faint),
    inset: (x: 1em, y: 0.7em),
    fill: palette.marker.transparentize(95%),
    radius: 0pt,
  )[
    #stack(spacing: .8em,
      text(
        size: typo.meta-size,
        weight: "bold",
        fill: palette.marker-text,
        font: _mono-font,
        tracking: 1pt,
        upper(label),
      ),
      [
        #set text(size: 12pt, fill: palette.terrain)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

// =====================================================================
// Internal Helpers (header/footer factories)
// =====================================================================

/// _light-header -- Standard header for paper-bg slides
#let _light-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    // Title
    {
      set text(fill: pal.terrain, size: 1.5em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    // Contour-green thin underline
    block(width: 60pt, height: 1.5pt, fill: pal.contour),
  )
}

/// _light-footer -- Standard footer with coordinate-style page numbers
#let _light-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt, fill: pal.grid-text)
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      }
    },
    {
      box(width: 4pt, height: 4pt, fill: pal.contour.transparentize(60%))
    },
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt, fill: pal.grid-text)
      context {
        let n = utils.slide-counter.display()
        let t = utils.last-slide-number
        text[N #n #sym.dot.c E #t]
      }
    },
  )
}

/// _dark-header -- Inverted header for terrain-dark slides
#let _dark-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    // Title
    {
      set text(fill: pal.paper, size: 1.5em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 60pt, height: 1.5pt, fill: pal.contour-light),
  )
}

/// _dark-footer -- Inverted footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.paper.transparentize(40%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      }
    },
    {
      box(width: 4pt, height: 4pt, fill: pal.paper.transparentize(70%))
    },
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context {
        let n = utils.slide-counter.display()
        let t = utils.last-slide-number
        text[N #n #sym.dot.c E #t]
      }
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Standard content slide (paper background, contour decoration at bottom)
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _light-header(self)
  let footer(self) = _light-footer(self)
  let setting(body) = {
    let pal = self.store.palette
    // Subtle contour lines at bottom
    place(bottom + left,
      contour-decoration(color: pal.contour, width: 100%, height: 50pt),
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

/// dark-slide -- Terrain dark background, paper-colored contours, survey marker accent
#let dark-slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _dark-header(self)
  let footer(self) = _dark-footer(self)
  let setting(body) = {
    // Contour lines in paper color (visible on dark bg)
    place(bottom + left,
      contour-decoration(color: pal.paper.transparentize(30%), width: 100%, height: 50pt),
    )
    // Survey marker accent in top-right
    place(top + right, dx: -2.5em, dy: 0.5em,
      survey-marker(color: pal.marker, size: 16pt),
    )
    set text(fill: pal.paper)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.terrain,
      header: header,
      footer: footer,
      margin: (top: 4em, bottom: 1.3em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Cover with large flowing contour SVG pattern
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    // Large flowing contour SVG at ~40% height
    place(top + left, dy: 15%,
      contour-decoration(color: pal.contour, width: 100%, height: 180pt, dense: true),
    )
    // Survey marker orange accent dot
    place(top + left, dx: 4em, dy: 2em,
      survey-marker(color: pal.marker, size: 24pt),
    )
    // Title content
    set std.align(left + horizon)
    pad(x: 4em, y: 3em)[
      #v(2fr)
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.terrain, info.title)
      #v(0.4em)
      // Thin contour underline
      #block(width: 80pt, height: 2pt, fill: pal.contour)
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", fill: pal.terrain-light, info.subtitle)
        v(0.6em)
      }
      // Monospace coordinates-style metadata
      #{
        set text(size: typo.coord-size, fill: pal.grid-text, font: _mono-font)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.grid-text.transparentize(20%))[|]
          h(1.5em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
      #v(3fr)
    ]
    // Bottom coordinate line
    place(bottom + left,
      block(width: 100%, height: 1.5pt, fill: pal.contour.transparentize(50%)),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with grid coordinate number + survey marker
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    // Large ghost section number (grid coordinate style)
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.terrain.transparentize(92%), size: 160pt, weight: "bold", font: _mono-font, num-str)
      },
    )
    // Contour lines at low opacity
    place(bottom + left, dy: -20pt,
      contour-decoration(color: pal.contour, width: 100%, height: 60pt),
    )
    // Top contour line
    place(top + left, block(width: 100%, height: 1.5pt, fill: pal.contour.transparentize(50%)))
    // Content area
    pad(left: 4em, right: 6em, top: 4em, bottom: 2em)[
      #v(1fr)
      // Survey marker next to section title
      #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
        survey-marker(color: pal.marker, size: 22pt),
        {
          text(
            size: typo.coord-size,
            weight: "medium",
            tracking: 1.8pt,
            fill: pal.grid-text,
            font: _mono-font,
          )[SECTION #context {
            let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
            num-str
          }]
        },
      )
      #v(0.6em)
      #{
        set text(fill: pal.terrain, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.3em)
      #block(width: 60pt, height: 2pt, fill: pal.contour)
      #v(3fr)
    ]
    // Bottom line
    place(bottom + left, block(width: 100%, height: 1.5pt, fill: pal.contour.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Water blue background, white text, subtle contour lines
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.water,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle contour lines in lighter shade
    place(bottom + left,
      contour-decoration(color: white.transparentize(70%), width: 100%, height: 80pt),
    )
    place(top + left,
      contour-decoration(color: white.transparentize(80%), width: 100%, height: 60pt),
    )
    set text(fill: white, size: 1.6em, weight: "regular")
    set std.align(horizon + center)
    body
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Paper bg, contour pattern, centered farewell, survey marker
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    // Contour pattern
    place(center + horizon,
      contour-decoration(color: pal.contour, width: 100%, height: 120pt, dense: true),
    )
    // Top/bottom lines
    place(top + left, block(width: 100%, height: 1.5pt, fill: pal.contour.transparentize(50%)))
    place(bottom + left, block(width: 100%, height: 1.5pt, fill: pal.contour.transparentize(50%)))
    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      #survey-marker(color: pal.marker, size: 28pt)
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.terrain, body)
      #v(0.6em)
      #block(width: 40pt, height: 2pt, fill: pal.contour)
      #v(1em)
      #text(size: typo.meta-size, fill: pal.grid-text, font: _mono-font)[SURVEY COMPLETE]
    ]
  }
  touying-slide(self: self, main-body)
})

/// hero-slide -- Full color with contour overlay
#let hero-slide(bg-color: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  let fill-color = if bg-color != none { bg-color } else { pal.terrain }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: fill-color,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Contour overlay
    place(top + left, dy: 10%,
      contour-decoration(color: white.transparentize(75%), width: 100%, height: 100pt, dense: true),
    )
    place(bottom + left, dy: -5%,
      contour-decoration(color: white.transparentize(80%), width: 100%, height: 80pt),
    )
    set text(fill: white)
    body
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let topographic-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "forest",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.terrain)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.paper,
      margin: (top: 4em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.contour,
      neutral-lightest: pal.paper,
      neutral-darkest: pal.terrain,
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
