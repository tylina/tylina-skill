// Bauhaus Theme — Bold geometric design inspired by the 1920s Bauhaus school
// Primary colors + black + white. Asymmetric compositions. LARGE shapes.
// Persistent grid structure on every slide. Shapes DOMINATE the visual field.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct -- Rich Theme) ===

#let palette = (
  primary: rgb("#E63946"),
  dark: rgb("#1D1D2C"),
  accent: rgb("#457B9D"),
  bg: rgb("#FAFAFA"),
  card: rgb("#F0F0F0"),
  text-dark: rgb("#1D1D2C"),
  text-body: rgb("#333333"),
  text-light: rgb("#666666"),
  border: rgb("#E0E0E0"),
  bauhaus-yellow: rgb("#F4A261"),
  bauhaus-red: rgb("#E63946"),
  bauhaus-blue: rgb("#457B9D"),
)

// === SVG Definitions ===

// 1. Kandinsky composition -- 60x60 viewBox, overlapping shapes with internal lines
// At least 15 elements: circles, triangles, squares, lines creating intersections
#let _kandinsky-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 60">
  <rect x="8" y="22" width="22" height="22" fill="#457B9D" fill-opacity="0.2" stroke="#457B9D" stroke-width="1.5"/>
  <circle cx="35" cy="20" r="14" fill="#E63946" fill-opacity="0.2" stroke="#E63946" stroke-width="1.5"/>
  <polygon points="30,5 50,42 10,42" fill="#F4A261" fill-opacity="0.2" stroke="#F4A261" stroke-width="1.5"/>
  <line x1="0" y1="30" x2="60" y2="30" stroke="#1D1D2C" stroke-width="0.6" opacity="0.5"/>
  <line x1="30" y1="0" x2="30" y2="60" stroke="#1D1D2C" stroke-width="0.6" opacity="0.5"/>
  <line x1="5" y1="55" x2="55" y2="5" stroke="#1D1D2C" stroke-width="0.4" opacity="0.35"/>
  <line x1="5" y1="5" x2="55" y2="55" stroke="#1D1D2C" stroke-width="0.4" opacity="0.35"/>
  <circle cx="30" cy="30" r="5" fill="none" stroke="#1D1D2C" stroke-width="0.8" opacity="0.6"/>
  <circle cx="30" cy="30" r="2" fill="#1D1D2C" fill-opacity="0.4"/>
  <rect x="25" y="45" width="12" height="12" fill="none" stroke="#E63946" stroke-width="0.8" opacity="0.5"/>
  <circle cx="15" cy="48" r="6" fill="none" stroke="#457B9D" stroke-width="0.7" opacity="0.5"/>
  <line x1="18" y1="10" x2="50" y2="50" stroke="#F4A261" stroke-width="0.5" opacity="0.4"/>
  <polygon points="45,48 55,58 35,58" fill="none" stroke="#E63946" stroke-width="0.7" opacity="0.5"/>
  <line x1="0" y1="15" x2="25" y2="15" stroke="#1D1D2C" stroke-width="0.4" opacity="0.3"/>
  <line x1="40" y1="55" x2="60" y2="55" stroke="#1D1D2C" stroke-width="0.4" opacity="0.3"/>
  <circle cx="48" cy="12" r="3" fill="#F4A261" fill-opacity="0.3" stroke="#F4A261" stroke-width="0.5"/>
  <rect x="2" y="2" width="8" height="8" fill="#E63946" fill-opacity="0.15" stroke="none"/>
</svg>```.text

// 2. Grid structure -- Full-page orthogonal grid (Mondrian-style without fills)
// Varying line weights (1px and 3px). Used as PERSISTENT BACKGROUND.
#let _grid-structure-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 840 474">
  <line x1="0" y1="158" x2="840" y2="158" stroke="#1D1D2C" stroke-width="3" opacity="0.08"/>
  <line x1="0" y1="316" x2="840" y2="316" stroke="#1D1D2C" stroke-width="3" opacity="0.08"/>
  <line x1="280" y1="0" x2="280" y2="474" stroke="#1D1D2C" stroke-width="3" opacity="0.08"/>
  <line x1="560" y1="0" x2="560" y2="474" stroke="#1D1D2C" stroke-width="3" opacity="0.08"/>
  <line x1="0" y1="79" x2="840" y2="79" stroke="#1D1D2C" stroke-width="1" opacity="0.05"/>
  <line x1="0" y1="237" x2="840" y2="237" stroke="#1D1D2C" stroke-width="1" opacity="0.05"/>
  <line x1="0" y1="395" x2="840" y2="395" stroke="#1D1D2C" stroke-width="1" opacity="0.05"/>
  <line x1="140" y1="0" x2="140" y2="474" stroke="#1D1D2C" stroke-width="1" opacity="0.05"/>
  <line x1="420" y1="0" x2="420" y2="474" stroke="#1D1D2C" stroke-width="1" opacity="0.05"/>
  <line x1="700" y1="0" x2="700" y2="474" stroke="#1D1D2C" stroke-width="1" opacity="0.05"/>
  <line x1="0" y1="40" x2="840" y2="40" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="0" y1="118" x2="840" y2="118" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="0" y1="198" x2="840" y2="198" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="0" y1="276" x2="840" y2="276" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="0" y1="355" x2="840" y2="355" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="0" y1="434" x2="840" y2="434" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="70" y1="0" x2="70" y2="474" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="210" y1="0" x2="210" y2="474" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="350" y1="0" x2="350" y2="474" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="490" y1="0" x2="490" y2="474" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="630" y1="0" x2="630" y2="474" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
  <line x1="770" y1="0" x2="770" y2="474" stroke="#1D1D2C" stroke-width="0.5" opacity="0.03"/>
</svg>```.text

// 3. Diagonal stripe band -- 45-degree parallel lines bundle (8+ lines)
#let _diagonal-stripe-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 40">
  <line x1="0" y1="40" x2="40" y2="0" stroke="currentColor" stroke-width="2.5" opacity="0.8"/>
  <line x1="10" y1="40" x2="50" y2="0" stroke="currentColor" stroke-width="2" opacity="0.7"/>
  <line x1="20" y1="40" x2="60" y2="0" stroke="currentColor" stroke-width="2.5" opacity="0.8"/>
  <line x1="30" y1="40" x2="70" y2="0" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
  <line x1="40" y1="40" x2="80" y2="0" stroke="currentColor" stroke-width="2.5" opacity="0.8"/>
  <line x1="50" y1="40" x2="90" y2="0" stroke="currentColor" stroke-width="2" opacity="0.7"/>
  <line x1="60" y1="40" x2="100" y2="0" stroke="currentColor" stroke-width="2.5" opacity="0.8"/>
  <line x1="70" y1="40" x2="110" y2="0" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
  <line x1="80" y1="40" x2="120" y2="0" stroke="currentColor" stroke-width="2" opacity="0.7"/>
  <line x1="90" y1="40" x2="130" y2="0" stroke="currentColor" stroke-width="2.5" opacity="0.8"/>
</svg>```.text

// 4. Circle dot pattern -- 5x5 grid of circles at varying sizes
#let _circle-dot-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <circle cx="10" cy="10" r="4" fill="currentColor" opacity="0.7"/>
  <circle cx="30" cy="10" r="2.5" fill="currentColor" opacity="0.5"/>
  <circle cx="50" cy="10" r="5" fill="currentColor" opacity="0.8"/>
  <circle cx="70" cy="10" r="3" fill="currentColor" opacity="0.6"/>
  <circle cx="90" cy="10" r="4.5" fill="currentColor" opacity="0.7"/>
  <circle cx="10" cy="30" r="3" fill="currentColor" opacity="0.6"/>
  <circle cx="30" cy="30" r="5" fill="currentColor" opacity="0.8"/>
  <circle cx="50" cy="30" r="2" fill="currentColor" opacity="0.4"/>
  <circle cx="70" cy="30" r="4.5" fill="currentColor" opacity="0.7"/>
  <circle cx="90" cy="30" r="3.5" fill="currentColor" opacity="0.6"/>
  <circle cx="10" cy="50" r="5" fill="currentColor" opacity="0.8"/>
  <circle cx="30" cy="50" r="3.5" fill="currentColor" opacity="0.6"/>
  <circle cx="50" cy="50" r="6" fill="currentColor" opacity="0.9"/>
  <circle cx="70" cy="50" r="2.5" fill="currentColor" opacity="0.5"/>
  <circle cx="90" cy="50" r="4" fill="currentColor" opacity="0.7"/>
  <circle cx="10" cy="70" r="2.5" fill="currentColor" opacity="0.5"/>
  <circle cx="30" cy="70" r="4" fill="currentColor" opacity="0.7"/>
  <circle cx="50" cy="70" r="3" fill="currentColor" opacity="0.6"/>
  <circle cx="70" cy="70" r="5.5" fill="currentColor" opacity="0.85"/>
  <circle cx="90" cy="70" r="2" fill="currentColor" opacity="0.4"/>
  <circle cx="10" cy="90" r="4.5" fill="currentColor" opacity="0.7"/>
  <circle cx="30" cy="90" r="3" fill="currentColor" opacity="0.6"/>
  <circle cx="50" cy="90" r="4" fill="currentColor" opacity="0.7"/>
  <circle cx="70" cy="90" r="3.5" fill="currentColor" opacity="0.6"/>
  <circle cx="90" cy="90" r="5" fill="currentColor" opacity="0.8"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render Kandinsky composition at given size
#let kandinsky(size: 150pt) = {
  box(image(bytes(_kandinsky-svg), width: size, height: size))
}

/// Render grid structure as full-page background
#let grid-bg() = {
  place(top + left, box(width: 100%, height: 100%,
    image(bytes(_grid-structure-svg), width: 100%, height: 100%)))
}

/// Render diagonal stripe band with color
#let diagonal-stripe(color: palette.primary, width: 120pt, height: 30pt) = {
  let svg = _diagonal-stripe-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: width, height: height))
}

/// Render circle dot pattern
#let circle-dots(color: palette.primary, size: 60pt) = {
  let svg = _circle-dot-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}


// === Background Atmosphere ===

/// Large geometric shape for corner atmosphere (rotates color by slide)
/// This places a BOLD 80pt+ shape in a corner at low opacity
#let _corner-shape-red() = {
  place(bottom + right, dx: 30pt, dy: 30pt,
    circle(radius: 70pt, fill: palette.bauhaus-red.transparentize(85%),
      stroke: palette.bauhaus-red.transparentize(70%) + 2.5pt))
}

#let _corner-shape-yellow() = {
  place(top + right, dx: 30pt, dy: -20pt,
    block(width: 120pt, height: 110pt,
      rotate(15deg,
        polygon(
          fill: palette.bauhaus-yellow.transparentize(83%),
          stroke: palette.bauhaus-yellow.transparentize(68%) + 2.5pt,
          (55pt, 0pt), (110pt, 95pt), (0pt, 95pt)
        )
      )
    )
  )
}

#let _corner-shape-blue() = {
  place(bottom + left, dx: -20pt, dy: 20pt,
    rect(width: 90pt, height: 90pt,
      fill: palette.bauhaus-blue.transparentize(85%),
      stroke: palette.bauhaus-blue.transparentize(70%) + 2.5pt))
}

/// Full background atmosphere for content slides: grid + corner shapes
#let _bg-atmosphere() = {
  // Persistent grid on every content slide
  grid-bg()
  // Large corner shape -- red circle bottom-right
  _corner-shape-red()
  // Small accent -- blue square top-left (secondary)
  place(top + left, dx: -8pt, dy: -8pt,
    rect(width: 32pt, height: 32pt,
      fill: palette.bauhaus-blue.transparentize(90%),
      stroke: palette.bauhaus-blue.transparentize(78%) + 1.5pt))
}


// === Helper Functions ===

/// Derive accessible text/surface ink while preserving the supplied Bauhaus hue.
#let _accent-ink(color) = color.darken(40%)

/// Bold geometric header bar -- title integrated into composition
#let _bauhaus-header(self) = {
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.2em))
  set std.align(horizon + left)
  // Title with thick red vertical bar (Bauhaus style)
  stack(dir: ltr, spacing: 12pt,
    block(width: 6pt, height: 28pt, fill: palette.primary, radius: 0pt),
    {
      set text(fill: palette.dark, size: 1.3em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
  )
}

/// Footer with geometric separators
#let _bauhaus-footer(self) = {
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.4em))
  set std.align(horizon)
  set text(fill: palette.text-light, size: 0.65em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      }
    },
    {
      // Three small shapes as separator
      stack(dir: ltr, spacing: 4pt,
        box(circle(radius: 3pt, fill: palette.bauhaus-red)),
        block(width: 6pt, height: 6pt, fill: palette.bauhaus-blue),
        polygon(fill: palette.bauhaus-yellow, (3pt, 0pt), (6pt, 5.2pt), (0pt, 5.2pt)),
      )
    },
    {
      set std.align(right)
      context text(size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
    },
  )
}


// === 1. Slide Functions ===

/// Standard content slide -- grid background, corner shape, bold header
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _bauhaus-header(self)
  let footer(self) = _bauhaus-footer(self)
  let setting(body) = {
    // Background atmosphere on EVERY content slide
    _bg-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide -- BOLD Bauhaus composition: large shapes, primary colors, asymmetric layout
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Dark background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))
    // Grid at higher opacity on title
    place(top + left, box(width: 100%, height: 100%, {
      let svg = _grid-structure-svg.replace("opacity=\"0.06\"", "opacity=\"0.12\"").replace("opacity=\"0.04\"", "opacity=\"0.08\"").replace("opacity=\"0.03\"", "opacity=\"0.06\"")
      image(bytes(svg), width: 100%, height: 100%)
    }))
    // LARGE red circle -- 200pt, top-right
    place(top + right, dx: 60pt, dy: -40pt,
      circle(radius: 100pt, fill: palette.bauhaus-red.transparentize(70%),
        stroke: palette.bauhaus-red.transparentize(40%) + 3pt))
    // LARGE yellow triangle -- left side, full-height feel
    place(bottom + left, dx: -30pt, dy: 30pt,
      polygon(
        fill: palette.bauhaus-yellow.transparentize(75%),
        stroke: palette.bauhaus-yellow.transparentize(40%) + 3pt,
        (80pt, 0pt), (160pt, 180pt), (0pt, 180pt)
      ))
    // Blue square -- mid-right
    place(right + horizon, dx: -80pt, dy: 40pt,
      rect(width: 90pt, height: 90pt,
        fill: palette.bauhaus-blue.transparentize(75%),
        stroke: palette.bauhaus-blue.transparentize(40%) + 2.5pt))
    // Kandinsky composition -- large, center-left area
    place(top + left, dx: 30pt, dy: 30pt, kandinsky(size: 120pt))
    // Diagonal stripe accent
    place(bottom + right, dx: -20pt, dy: -60pt,
      diagonal-stripe(color: palette.primary, width: 150pt, height: 35pt))
    // Title content -- offset left, Bauhaus asymmetry
    place(left + horizon, dx: 4em, dy: -10pt,
      block(width: 60%)[
        #set text(fill: white)
        #stack(spacing: 0.8em,
          // Thick red bar above title
          block(width: 80pt, height: 6pt, fill: palette.primary),
          stack(spacing: 0.8em,
            text(size: 2.4em, weight: "bold", info.title),
            if info.subtitle != none {
              text(size: 1em, fill: palette.bauhaus-yellow, info.subtitle)
            },
            stack(spacing: 0.8em,
              if info.author != none {
                text(size: 0.9em, fill: white.transparentize(30%), info.author)
              },
              if info.institution != none {
                text(size: 0.75em, fill: white.transparentize(50%), info.institution)
              },
              if info.date != none {
                text(size: 0.75em, fill: white.transparentize(40%))[#utils.display-info-date(self)]
              },
            ),
          ),
        )
      ]
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// New section slide -- large geometric focal element + section title
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // White bg with grid
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    grid-bg()
    // LARGE circle in top-right corner (140pt radius)
    place(top + right, dx: 50pt, dy: -40pt,
      circle(radius: 70pt, fill: palette.bauhaus-red.transparentize(80%),
        stroke: palette.bauhaus-red.transparentize(50%) + 3pt))
    // Bold vertical bar on left
    place(top + left, block(width: 12pt, height: 100%, fill: palette.primary))
    // Kandinsky in bottom-right
    place(bottom + right, dx: -20pt, dy: -20pt, kandinsky(size: 80pt))
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em,
      block(width: 100%, height: 100%,
        align(horizon)[
          #stack(spacing: 0.8em,
            // Section number -- LARGE, bold
            text(size: 4em, fill: palette.primary, weight: "bold")[
              #utils.display-current-heading-number(depth: 1, numbering: "1")
            ],
            stack(spacing: 0.8em,
              // Section title
              {
                set text(fill: palette.dark, size: 2.2em, weight: "bold")
                utils.display-current-heading(level: 1, numbered: false)
              },
              // Diagonal stripe accent below title
              diagonal-stripe(color: palette.primary, width: 160pt, height: 25pt),
            ),
          )
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- dramatic dark background with BOLD geometric shapes
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Dark background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))
    // Grid visible
    place(top + left, box(width: 100%, height: 100%, {
      let svg = _grid-structure-svg.replace("opacity=\"0.06\"", "opacity=\"0.10\"").replace("opacity=\"0.04\"", "opacity=\"0.07\"").replace("opacity=\"0.03\"", "opacity=\"0.05\"")
      image(bytes(svg), width: 100%, height: 100%)
    }))
    // Large yellow circle left
    place(left + horizon, dx: -40pt,
      circle(radius: 80pt, fill: palette.bauhaus-yellow.transparentize(80%),
        stroke: palette.bauhaus-yellow.transparentize(50%) + 3pt))
    // Blue square top-right
    place(top + right, dx: -30pt, dy: 30pt,
      rect(width: 100pt, height: 100pt,
        fill: palette.bauhaus-blue.transparentize(80%),
        stroke: palette.bauhaus-blue.transparentize(50%) + 2.5pt))
    // Red triangle bottom-right
    place(bottom + right, dx: -20pt, dy: -10pt,
      polygon(
        fill: palette.bauhaus-red.transparentize(80%),
        stroke: palette.bauhaus-red.transparentize(50%) + 2.5pt,
        (40pt, 0pt), (80pt, 70pt), (0pt, 70pt)
      ))
    // Center content
    place(center + horizon,
      block(width: 70%, inset: (x: 1em))[
        #set std.align(center)
        #set text(fill: white, size: 1.8em, weight: "bold")
        #body
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- bookends with title (shared large shapes + dark bg + Kandinsky)
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Dark background (same as title)
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))
    // Grid at higher opacity (matching title)
    place(top + left, box(width: 100%, height: 100%, {
      let svg = _grid-structure-svg.replace("opacity=\"0.06\"", "opacity=\"0.12\"").replace("opacity=\"0.04\"", "opacity=\"0.08\"").replace("opacity=\"0.03\"", "opacity=\"0.06\"")
      image(bytes(svg), width: 100%, height: 100%)
    }))
    // LARGE red circle top-right (matching title)
    place(top + right, dx: 60pt, dy: -40pt,
      circle(radius: 100pt, fill: palette.bauhaus-red.transparentize(70%),
        stroke: palette.bauhaus-red.transparentize(40%) + 3pt))
    // Yellow triangle bottom-left (matching title)
    place(bottom + left, dx: -30pt, dy: 30pt,
      polygon(
        fill: palette.bauhaus-yellow.transparentize(75%),
        stroke: palette.bauhaus-yellow.transparentize(40%) + 3pt,
        (80pt, 0pt), (160pt, 180pt), (0pt, 180pt)
      ))
    // Kandinsky top-left (matching title)
    place(top + left, dx: 30pt, dy: 30pt, kandinsky(size: 120pt))
    // Diagonal stripe bottom-right (matching title)
    place(bottom + right, dx: -20pt, dy: -60pt,
      diagonal-stripe(color: palette.primary, width: 150pt, height: 35pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(spacing: 0.8em,
        // Three shapes as decoration
        stack(dir: ltr, spacing: 16pt,
          box(circle(radius: 8pt, fill: palette.bauhaus-red)),
          rect(width: 16pt, height: 16pt, fill: palette.bauhaus-blue),
          polygon(fill: palette.bauhaus-yellow, (8pt, 0pt), (16pt, 14pt), (0pt, 14pt)),
        ),
        stack(spacing: 0.8em,
          // Main text
          text(size: 2.4em, weight: "bold", fill: white, body),
          // Red bar below
          block(width: 80pt, height: 5pt, fill: palette.primary),
        ),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// form-card -- Card with a LARGE (40pt) geometric shape overlapping the top-right corner
#let form-card(title, body, shape: "circle", accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 1em),
    radius: 0pt,
  )[
    // LARGE shape overlapping top-right
    #place(top + right, dx: 10pt, dy: -10pt, {
      if shape == "circle" {
        circle(radius: 20pt, fill: accent.transparentize(85%),
          stroke: accent.transparentize(60%) + 1.5pt)
      } else if shape == "triangle" {
        polygon(
          fill: accent.transparentize(85%),
          stroke: accent.transparentize(60%) + 1.5pt,
          (20pt, 0pt), (40pt, 35pt), (0pt, 35pt)
        )
      } else {
        rect(width: 36pt, height: 36pt,
          fill: accent.transparentize(85%),
          stroke: accent.transparentize(60%) + 1.5pt)
      }
    })
    #stack(spacing: 0.8em,
      stack(spacing: 0.8em,
        text(weight: "bold", fill: _accent-ink(accent), size: 0.92em, title),
        block(width: 40pt, height: 2.5pt, fill: accent.transparentize(40%)),
      ),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// primary-stat -- Number inside/overlapping a colored geometric shape
#let primary-stat(label, value, accent: palette.primary) = {
  block(width: 100%, fill: palette.card, inset: (x: 1em, y: 0.8em), radius: 0pt,
    stroke: (bottom: 3pt + accent))[
    // Overlapping circle behind number
    #place(top + right, dx: 5pt, dy: -5pt,
      circle(radius: 22pt, fill: accent.transparentize(88%),
        stroke: accent.transparentize(70%) + 1.5pt))
    #set text(fill: palette.text-light, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #text(fill: _accent-ink(accent), size: 2em, weight: "bold", value)
        #lazy-v(1fr)
      ]
    )
  ]
}

/// manifesto-quote -- Quote with THICK (8pt+) colored vertical bar AND diagonal stripe accent
#let manifesto-quote(quote, author: none) = {
  block(width: 100%, fill: palette.card, radius: 0pt,
    stroke: (left: 8pt + palette.primary),
    inset: (left: 1.5em, right: 1.2em, y: 1em))[
    // Diagonal stripe accent in top-right
    #place(top + right, dx: -8pt, dy: 4pt,
      diagonal-stripe(color: palette.primary.transparentize(70%), width: 60pt, height: 16pt))
    #set text(fill: palette.text-dark, size: 0.9em, style: "italic")
    #stack(spacing: 0.8em,
      quote,
      if author != none {
        text(fill: _accent-ink(palette.primary), size: 0.8em, weight: "bold", style: "normal")[-- #author]
      },
    )
    #lazy-v(1fr)
  ]
}

/// grid-box -- Box with visible grid lines inside (like a Bauhaus grid exercise)
#let grid-box(title, body, accent: palette.accent) = {
  block(width: 100%, stroke: 2pt + accent, radius: 0pt, clip: true)[
    #stack(spacing: 0pt,
      block(width: 100%, fill: _accent-ink(accent), inset: (x: 0.8em, y: 0.4em))[
        #text(fill: white, weight: "bold", size: 0.85em, title)
      ],
      block(width: 100%, fill: palette.bg, inset: (x: 1em, y: 0.8em))[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// shape-tag -- Tag that IS a shape (circular, triangular, square -- not text in a pill)
#let shape-tag(content, shape: "circle", color: palette.primary) = {
  if shape == "circle" {
    box(
      width: auto,
      inset: (x: 0.6em, y: 0.25em),
      fill: color.transparentize(85%),
      stroke: 1.5pt + color,
      radius: 99pt,
    )[
      #set text(fill: _accent-ink(color), size: 0.72em, weight: "bold")
      #content
    ]
  } else if shape == "square" {
    box(
      inset: (x: 0.6em, y: 0.25em),
      fill: color.transparentize(85%),
      stroke: 1.5pt + color,
      radius: 0pt,
    )[
      #set text(fill: _accent-ink(color), size: 0.72em, weight: "bold")
      #content
    ]
  } else {
    // triangle-ish tag with angled edges (approximated with clip)
    box(
      inset: (x: 0.8em, y: 0.25em),
      fill: color.transparentize(85%),
      stroke: 1.5pt + color,
      radius: (top-left: 0pt, top-right: 8pt, bottom-left: 8pt, bottom-right: 0pt),
    )[
      #set text(fill: _accent-ink(color), size: 0.72em, weight: "bold")
      #content
    ]
  }
}

/// werkstatt-divider -- Row of alternating large circles, triangles, squares (20pt each)
#let werkstatt-divider(count: 6) = {
  let shapes = ()
  for i in range(count) {
    let mod = calc.rem(i, 3)
    if mod == 0 {
      shapes.push(box(circle(radius: 10pt, fill: palette.bauhaus-red.transparentize(60%),
        stroke: palette.bauhaus-red.transparentize(30%) + 1pt)))
    } else if mod == 1 {
      shapes.push(polygon(
        fill: palette.bauhaus-yellow.transparentize(60%),
        stroke: palette.bauhaus-yellow.transparentize(30%) + 1pt,
        (10pt, 0pt), (20pt, 17pt), (0pt, 17pt)
      ))
    } else {
      shapes.push(rect(width: 18pt, height: 18pt,
        fill: palette.bauhaus-blue.transparentize(60%),
        stroke: palette.bauhaus-blue.transparentize(30%) + 1pt))
    }
  }
  std.align(center,
    stack(dir: ltr, spacing: 12pt, ..shapes)
  )
}

/// module-highlight -- Content with BOLD geometric frame (thick borders + shape in corner)
#let module-highlight(title, body, accent: palette.primary) = {
  block(width: 100%, fill: palette.bg, stroke: 3pt + accent, radius: 0pt,
    inset: (x: 1.2em, y: 1em))[
    // Large shape in top-left corner
    #place(top + left, dx: -6pt, dy: -6pt,
      rect(width: 24pt, height: 24pt, fill: accent, radius: 0pt))
    #place(top + left, dx: -2pt, dy: -2pt,
      text(fill: white, size: 0.65em, weight: "bold")[
        #box(inset: 2pt, sym.diamond.filled)
      ])
    #h(1.2em)
    #stack(spacing: .8em,
      text(weight: "bold", fill: _accent-ink(accent), size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// color-block -- Full-width colored band with white text (Bauhaus poster style)
#let color-block(body, color: palette.primary) = {
  block(width: 100%, fill: _accent-ink(color), inset: (x: 1.5em, y: 1em), radius: 0pt)[
    #set text(fill: white, weight: "bold", size: 0.9em)
    #body
  ]
}


// === 3. Theme Entry Point ===

#let bauhaus-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text-dark)
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
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: palette.dark,
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
