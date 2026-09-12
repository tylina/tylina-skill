// Tensor Field Theme — Mathematical field visualization aesthetic
// Warm cream/ivory background with flowing vector field lines, gradient indicators, and tensor notation
// Features: streamline curves, coordinate axes, contour lines, differential geometry accents
// Perfect for mathematics, physics, machine learning, computational science, theoretical research
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FFFEF7"),
  primary: rgb("#312E81"),
  secondary: rgb("#B45309"),
  accent: rgb("#3B82F6"),
  text: rgb("#1C1917"),
  text-muted: rgb("#57534E"),
  card-bg: rgb("#FFFFFF"),
  border: rgb("#D6D3D1"),
  primary-light: rgb("#312E81").lighten(88%),
  secondary-light: rgb("#B45309").lighten(85%),
  accent-light: rgb("#3B82F6").lighten(88%),
  field-faint: rgb("#312E81").transparentize(92%),
)


// ═══ SVG Definitions ═══

// Flow field background — full-page vector field with coherent streamlines (phase portrait style)
// Curves follow a saddle-point / dipole flow pattern with varying thickness for magnitude
#let _flow-field-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M0,60 C120,55 240,48 360,80 C480,112 600,160 720,140 C780,130 820,120 840,115" fill="none" stroke="#312E81" stroke-width="1.2" opacity="0.12"/>
  <path d="M0,120 C100,115 220,105 340,130 C460,155 580,200 700,185 C770,175 810,165 840,160" fill="none" stroke="#312E81" stroke-width="0.8" opacity="0.10"/>
  <path d="M0,180 C80,178 200,170 320,195 C440,220 560,250 680,235 C760,225 810,215 840,208" fill="none" stroke="#312E81" stroke-width="1.5" opacity="0.08"/>
  <path d="M0,237 C140,237 280,237 420,237 C560,237 700,237 840,237" fill="none" stroke="#312E81" stroke-width="0.6" opacity="0.06" stroke-dasharray="4,8"/>
  <path d="M0,260 C100,265 220,275 340,255 C460,235 580,220 700,240 C770,250 810,258 840,262" fill="none" stroke="#B45309" stroke-width="1.0" opacity="0.10"/>
  <path d="M0,310 C120,315 240,325 360,300 C480,275 600,265 720,285 C780,295 820,305 840,310" fill="none" stroke="#312E81" stroke-width="1.3" opacity="0.11"/>
  <path d="M0,370 C100,375 220,385 340,365 C460,345 580,330 700,350 C770,358 810,365 840,370" fill="none" stroke="#312E81" stroke-width="0.9" opacity="0.09"/>
  <path d="M0,420 C130,425 260,432 390,415 C520,398 650,390 780,405 C810,408 830,412 840,415" fill="none" stroke="#B45309" stroke-width="0.7" opacity="0.08"/>
  <polygon points="838,113 830,109 830,117" fill="#312E81" opacity="0.12"/>
  <polygon points="838,158 830,154 830,162" fill="#312E81" opacity="0.10"/>
  <polygon points="838,260 830,256 830,264" fill="#B45309" opacity="0.10"/>
  <polygon points="2,372 10,368 10,376" fill="#312E81" opacity="0.09"/>
  <polygon points="2,422 10,418 10,426" fill="#B45309" opacity="0.08"/>
  <circle cx="420" cy="237" r="80" fill="none" stroke="#3B82F6" stroke-width="0.5" opacity="0.06"/>
  <circle cx="420" cy="237" r="140" fill="none" stroke="#3B82F6" stroke-width="0.4" opacity="0.05"/>
  <circle cx="420" cy="237" r="200" fill="none" stroke="#3B82F6" stroke-width="0.3" opacity="0.04"/>
</svg>```.text

// Field frame — border with coordinate axes in corners and flow lines wrapping edges
#let _field-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="20" y="15" width="800" height="444" rx="2" ry="2" fill="none" stroke="#312E81" stroke-width="1.8" opacity="0.5"/>
  <rect x="28" y="22" width="784" height="430" rx="1" ry="1" fill="none" stroke="#B45309" stroke-width="0.6" opacity="0.25"/>
  <line x1="35" y1="55" x2="35" y2="30" stroke="#312E81" stroke-width="1.5" opacity="0.6"/>
  <line x1="35" y1="55" x2="60" y2="55" stroke="#312E81" stroke-width="1.5" opacity="0.6"/>
  <polygon points="35,30 32,36 38,36" fill="#312E81" opacity="0.6"/>
  <polygon points="60,55 54,52 54,58" fill="#312E81" opacity="0.6"/>
  <line x1="805" y1="420" x2="805" y2="445" stroke="#312E81" stroke-width="1.5" opacity="0.6"/>
  <line x1="805" y1="420" x2="780" y2="420" stroke="#312E81" stroke-width="1.5" opacity="0.6"/>
  <polygon points="805,445 802,439 808,439" fill="#312E81" opacity="0.6"/>
  <polygon points="780,420 786,417 786,423" fill="#312E81" opacity="0.6"/>
  <path d="M80,15 C120,18 160,22 200,18 C240,14 280,12 320,15 C360,18 400,22 440,18 C480,14 520,12 560,15 C600,18 640,22 680,18 C720,14 760,12 800,15" fill="none" stroke="#3B82F6" stroke-width="0.8" opacity="0.20"/>
  <path d="M40,459 C80,456 120,453 160,456 C200,459 240,462 280,459 C320,456 360,453 400,456 C440,459 480,462 520,459 C560,456 600,453 640,456 C680,459 720,462 760,459 C800,456 820,454 840,456" fill="none" stroke="#3B82F6" stroke-width="0.8" opacity="0.20"/>
  <text x="62" y="58" font-size="8" fill="#312E81" opacity="0.5" font-family="serif" font-style="italic">x</text>
  <text x="32" y="28" font-size="8" fill="#312E81" opacity="0.5" font-family="serif" font-style="italic">y</text>
</svg>```.text

// Gradient divider — horizontal line with arrow and hash marks showing gradient
#let _gradient-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <line x1="0" y1="6" x2="280" y2="6" stroke="#312E81" stroke-width="1.2" opacity="0.5"/>
  <polygon points="280,6 272,3 272,9" fill="#312E81" opacity="0.5"/>
  <line x1="40" y1="3" x2="40" y2="9" stroke="#B45309" stroke-width="1.0" opacity="0.45"/>
  <line x1="80" y1="2.5" x2="80" y2="9.5" stroke="#B45309" stroke-width="1.0" opacity="0.50"/>
  <line x1="120" y1="2" x2="120" y2="10" stroke="#B45309" stroke-width="1.2" opacity="0.55"/>
  <line x1="160" y1="1.5" x2="160" y2="10.5" stroke="#B45309" stroke-width="1.2" opacity="0.60"/>
  <line x1="200" y1="1" x2="200" y2="11" stroke="#B45309" stroke-width="1.4" opacity="0.65"/>
  <line x1="240" y1="0.5" x2="240" y2="11.5" stroke="#B45309" stroke-width="1.4" opacity="0.70"/>
  <circle cx="4" cy="6" r="2.5" fill="#312E81" opacity="0.5"/>
</svg>```.text

// Manifold accent — small curved surface mesh for decoration
#let _manifold-accent-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="80" viewBox="0 0 120 80">
  <path d="M10,60 C30,50 50,35 70,30 C90,25 110,28 115,32" fill="none" stroke="#312E81" stroke-width="1.0" opacity="0.4"/>
  <path d="M10,50 C30,42 50,30 70,26 C90,22 110,25 115,28" fill="none" stroke="#312E81" stroke-width="0.8" opacity="0.35"/>
  <path d="M10,40 C30,34 50,25 70,22 C90,19 110,22 115,24" fill="none" stroke="#312E81" stroke-width="0.6" opacity="0.30"/>
  <path d="M25,65 C28,55 32,42 35,30 C38,22 40,18 42,15" fill="none" stroke="#B45309" stroke-width="0.8" opacity="0.35"/>
  <path d="M50,60 C52,50 55,38 58,28 C60,22 62,18 64,15" fill="none" stroke="#B45309" stroke-width="0.8" opacity="0.35"/>
  <path d="M75,55 C76,46 78,36 80,28 C82,22 84,18 85,15" fill="none" stroke="#B45309" stroke-width="0.8" opacity="0.35"/>
  <path d="M100,52 C100,44 101,35 102,28 C103,23 104,20 105,17" fill="none" stroke="#B45309" stroke-width="0.6" opacity="0.30"/>
  <circle cx="50" cy="35" r="2" fill="#3B82F6" opacity="0.4"/>
  <circle cx="75" cy="28" r="2" fill="#3B82F6" opacity="0.4"/>
  <circle cx="100" cy="30" r="1.5" fill="#3B82F6" opacity="0.35"/>
</svg>```.text

// Bookend element — tensor notation styled corner mark (used on title and ending slides)
#let _bookend-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 60 60">
  <path d="M5,55 L5,5 L55,5" fill="none" stroke="#312E81" stroke-width="2.5" opacity="0.7"/>
  <path d="M12,48 L12,12 L48,12" fill="none" stroke="#B45309" stroke-width="1.2" opacity="0.4"/>
  <circle cx="5" cy="5" r="3" fill="#312E81" opacity="0.6"/>
  <circle cx="30" cy="5" r="1.5" fill="#3B82F6" opacity="0.4"/>
  <circle cx="5" cy="30" r="1.5" fill="#3B82F6" opacity="0.4"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render flow field background
#let flow-field-bg() = {
  image(bytes(_flow-field-bg-svg), width: 100%, height: 100%)
}

/// Render field frame border
#let field-frame() = {
  image(bytes(_field-frame-svg), width: 100%, height: 100%)
}

/// Render gradient divider
#let gradient-divider(width: 100%) = {
  box(width: width, image(bytes(_gradient-divider-svg), width: width, height: 8pt))
}

/// Render manifold accent
#let manifold-accent(width: 60pt) = {
  box(width: width, image(bytes(_manifold-accent-svg), width: width))
}

/// Render bookend corner element
#let bookend-mark(size: 30pt) = {
  box(width: size, height: size, image(bytes(_bookend-svg), width: size, height: size))
}


// ═══ Helper Functions ═══

/// Persistent flow field atmosphere for all content slides
#let field-atmosphere() = {
  place(top + left, box(width: 100%, height: 100%, flow-field-bg()))
}


// ═══ Reusable Components ═══

// Component 1: field-card — Card with flowing vector lines along left edge
#let field-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3.5pt + accent, rest: 0.8pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: 3pt,
  )[
    // Vector flow decoration on left (simulated with overlapping arcs)
    #place(top + left, dx: -1em - 2pt, dy: 8pt,
      box(width: 3pt, height: 3pt, radius: 1.5pt, fill: accent.transparentize(40%)))
    #place(top + left, dx: -1em - 2pt, dy: 22pt,
      box(width: 2pt, height: 2pt, radius: 1pt, fill: accent.transparentize(60%)))
    #place(top + left, dx: -1em - 2pt, dy: 36pt,
      box(width: 3pt, height: 3pt, radius: 1.5pt, fill: accent.transparentize(40%)))
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 3pt, height: 12pt, fill: accent, radius: 1pt),
        text(weight: "bold", fill: palette.text, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}


// Component 2: manifold-box — Insight box with curved contour border styling
#let manifold-box(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: accent.lighten(93%),
    stroke: (paint: accent, thickness: 1.5pt, dash: "solid"),
    inset: (x: 1.2em, y: 0.7em),
    radius: 5pt,
  )[
    // Manifold accent decoration in top-right
    #place(top + right, dx: -6pt, dy: 4pt, manifold-accent(width: 36pt))
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent.darken(15%), size: 0.95em, title),
      block(width: 50pt, height: 2pt, fill: accent.transparentize(50%), radius: 1pt),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}


// Component 3: magnitude-stat — Metric with gradient-colored magnitude indicator
#let magnitude-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    // Magnitude gradient bar at top
    #place(top + left, dy: 0pt, dx: 0pt,
      block(width: 100%, height: 3pt, radius: (top: 4pt),
        fill: gradient.linear(color.transparentize(80%), color, color.transparentize(30%))))
    #v(.5em)
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(fill: palette.text-muted, size: 0.72em, label),
      text(fill: color, size: 1.8em, weight: "bold", value),
    )
    // Small vector arrow indicator
    #place(bottom + right, dx: -8pt, dy: -8pt,
      text(fill: color.transparentize(50%), size: 0.6em, weight: "bold")[
        #box(baseline: -1pt, sym.arrow.r)
      ])
    #lazy-v(1fr)
  ]
}


// Component 4: theorem-box — Formal theorem/definition box with double-line border
#let theorem-box(kind, title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (
      left: 4pt + accent,
      rest: 1pt + palette.border,
    ),
    inset: (x: 1.2em, y: 0.8em),
    radius: 2pt,
  )[
    // Double-line top border effect
    #place(top + left, dy: -0.9em + 1pt, dx: -1.2em,
      block(width: 100% + 2.4em, height: 0.5pt, fill: accent.transparentize(60%)))
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        text(
          fill: white,
          size: 0.7em,
          weight: "bold",
          box(fill: accent, inset: (x: 5pt, y: 2pt), radius: 2pt, kind)
        ),
        text(weight: "bold", fill: palette.text, size: 0.9em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}


// Component 5: vector-tag — Small tag with arrow decoration
#let vector-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 0.8pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 3pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      text(fill: color, size: 0.7em, weight: "bold")[#sym.arrow.r],
      text(fill: color, size: 0.75em, weight: "semibold", content),
    )
  ]
}


// Component 6: flow-divider — Flowing curve separator
#let flow-divider(color: palette.border, width: 80%) = {
  std.align(center,
    box(width: width)[
      #set std.align(horizon + center)
      #stack(dir: ltr, spacing: 0pt,
        box(width: 4pt, height: 4pt, radius: 2pt, fill: palette.primary),
        box(width: 1fr, height: 1pt, fill: color),
        box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.secondary),
        box(width: 1fr, height: 1pt, fill: color),
        box(width: 4pt, height: 4pt, radius: 2pt, fill: palette.primary),
      )
    ]
  )
}


// Component 7: basis-card — Card with coordinate axis overlay
#let basis-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1.2em, y: 0.55em),
    radius: 4pt,
  )[
    // Coordinate axis overlay in top-right corner
    #place(top + right, dx: -10pt, dy: 8pt)[
      #box(width: 24pt, height: 24pt)[
        // Vertical axis
        #place(bottom + left, dx: 2pt, dy: 0pt,
          block(width: 1pt, height: 20pt, fill: accent.transparentize(60%)))
        // Horizontal axis
        #place(bottom + left, dx: 2pt, dy: 0pt,
          block(width: 20pt, height: 1pt, fill: accent.transparentize(60%)))
        // Unit vectors labels
        #place(top + left, dx: 0pt, dy: 0pt,
          text(fill: accent.transparentize(40%), size: 0.5em, weight: "bold")[e#sub[2]])
        #place(bottom + right, dx: 0pt, dy: 2pt,
          text(fill: accent.transparentize(40%), size: 0.5em, weight: "bold")[e#sub[1]])
      ]
    ]
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}


// Component 8: eigenvalue-box — Highlighted result box with eigenvalue-style framing
#let eigenvalue-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(90%),
    stroke: (left: 4pt + accent, top: 1.5pt + accent, rest: 0.8pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (top-left: 0pt, rest: 4pt),
  )[
    // Lambda symbol decoration
    #place(top + right, dx: -10pt, dy: 4pt,
      text(fill: accent.transparentize(50%), size: 1.8em, weight: "bold")[#sym.lambda])
    // Title
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent.darken(10%), size: 0.92em, title),
      [
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}


// Component 9: topology-quote — Quote with manifold-surface decoration
#let topology-quote(body, attribution: none) = {
  block(
    width: 100%,
    fill: palette.primary-light,
    stroke: (left: 3pt + palette.primary),
    inset: (x: 1.4em, y: 0.8em),
    radius: (right: 4pt),
  )[
    // Manifold decoration
    #place(top + right, dx: -4pt, dy: 4pt, manifold-accent(width: 44pt))
    #stack(spacing: .8em,
      text(fill: palette.primary.transparentize(60%), size: 2em, weight: "bold")["],
      {
        set text(fill: palette.text, size: 0.88em, style: "italic")
        body
      },
      if attribution != none {
        text(fill: palette.text-muted, size: 0.75em, style: "normal", weight: "medium")[-- #attribution]
      },
    )
    #lazy-v(1fr)
  ]
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — warm cream bg, flow field atmosphere, structured header
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.5em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.primary, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      gradient-divider(width: 160pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        manifold-accent(width: 28pt)
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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

/// Title slide — field frame border, bookend corners, centered title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Flow field atmosphere
    field-atmosphere()
    // Field frame
    place(top + left, box(width: 100%, height: 100%, field-frame()))
    // Bookend corners (top-left and bottom-right)
    place(top + left, dx: 30pt, dy: 20pt, bookend-mark(size: 32pt))
    place(bottom + right, dx: -30pt, dy: -20pt,
      rotate(180deg, bookend-mark(size: 32pt)))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.primary, info.title)
      #v(0.3em)
      // Gradient divider decoration
      #std.align(center, gradient-divider(width: 220pt))
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.secondary, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.text, weight: "regular", info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.text-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.text-muted)[#utils.display-info-date(self)]
      }
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

/// New section slide — indigo left accent with flow field, section title
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
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Flow field atmosphere
    field-atmosphere()
    // Left accent bar (indigo)
    place(top + left, block(width: 6pt, height: 100%, fill: palette.primary))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number
      #text(size: 3em, fill: palette.secondary, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.4em)
      // Section title
      #set text(fill: palette.text, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Gradient divider
      #gradient-divider(width: 240pt)
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 3pt, fill: palette.border))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep indigo background, white text, flow field
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
    // Deep indigo background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Field frame
    place(top + left, box(width: 100%, height: 100%, field-frame()))
    // Keep focal content in flow so Touying can measure the slide correctly.
    set std.align(center + horizon)
    block(width: 76%, height: auto)[
      #set std.align(center)
      #set text(fill: white, size: 1.4em, weight: "bold")
      #body
      #v(.8em)
      #gradient-divider(width: 180pt)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — indigo bg, bookend corners, centered closing text
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
    // Indigo background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Flow field atmosphere
    field-atmosphere()
    // Field frame
    place(top + left, box(width: 100%, height: 100%, field-frame()))
    // Bookend corners (shared with title slide)
    place(top + left, dx: 30pt, dy: 20pt, bookend-mark(size: 32pt))
    place(bottom + right, dx: -30pt, dy: -20pt,
      rotate(180deg, bookend-mark(size: 32pt)))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Gradient divider above
      #gradient-divider(width: 200pt)
      #v(0.8em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: white, body)
      #v(0.5em)
      // Accent line below
      #block(width: 5em, height: 3pt, fill: palette.secondary, radius: 1.5pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Theme Entry Point ═══

#let tensor-field-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3.5em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: palette.card-bg,
      neutral-darkest: palette.text,
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
