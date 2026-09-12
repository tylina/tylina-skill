// Prism Light Theme — Light refraction through a crystal prism: rainbow spectrum accents on clean white
// White light splits into pure spectral colors. Scientific beauty made visible through physics.
// Features: Prism SVG decorations, spectrum gradient bars, light ray convergence patterns,
//           wavelength sine wave overlays, rainbow corner accents on bookend slides
// Best for: Optics, physics, data visualization, creative technology, scientific presentations
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FCFCFE"),              // Pure white with slight cool tint
  primary: rgb("#4A3FA8"),         // Violet/purple - short wavelength
  secondary: rgb("#D4543B"),       // Warm red-orange - long wavelength
  tertiary: rgb("#1B8A6E"),        // Emerald green - mid spectrum
  accent-blue: rgb("#3B7DD8"),     // Blue spectrum
  accent-amber: rgb("#D4890B"),    // Amber/yellow spectrum
  text-dark: rgb("#1E1E3C"),       // Deep violet-black
  text-body: rgb("#3D3D5C"),       // Dark violet-gray
  text-muted: rgb("#686887"),      // Muted violet-gray (WCAG AA on light surfaces)
  card-bg: rgb("#FFFFFF"),         // Pure white
  border: rgb("#E5E3F0"),          // Faint violet border
  spectrum: rgb("#F5F3FA"),        // Very light violet fill
  // Full spectral progression
  violet: rgb("#4A3FA8"),
  indigo: rgb("#5B4FD4"),
  blue: rgb("#3B7DD8"),
  cyan: rgb("#1BA8B8"),
  green: rgb("#1B8A6E"),
  yellow: rgb("#D4890B"),
  orange: rgb("#D4643B"),
  red: rgb("#D4543B"),
  // Darker spectral variants for text on light surfaces
  blue-text: rgb("#245EAA"),
  cyan-text: rgb("#087785"),
  green-text: rgb("#0D755B"),
  amber-text: rgb("#805100"),
  orange-text: rgb("#A54124"),
  red-text: rgb("#A83B29"),
)

#let spectrum-colors = (palette.violet, palette.indigo, palette.blue, palette.cyan, palette.green, palette.yellow, palette.orange, palette.red)


// ═══ SVG Definitions (8+ elements each) ═══

// Prism shape with rainbow refraction beams — triangular prism dispersing white light
#let _prism-refraction-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="280" height="200" viewBox="0 0 280 200">
  <defs>
    <linearGradient id="prismFill" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#4A3FA8;stop-opacity:0.12"/>
      <stop offset="50%" style="stop-color:#3B7DD8;stop-opacity:0.08"/>
      <stop offset="100%" style="stop-color:#1B8A6E;stop-opacity:0.05"/>
    </linearGradient>
  </defs>
  <!-- Main prism triangle -->
  <polygon points="120,20 200,170 40,170" fill="url(#prismFill)" stroke="#4A3FA8" stroke-width="1.8" stroke-opacity="0.4"/>
  <!-- Inner facet highlight -->
  <polygon points="120,40 180,155 60,155" fill="none" stroke="#3B7DD8" stroke-width="0.8" stroke-opacity="0.2"/>
  <!-- Incoming white light beam -->
  <line x1="0" y1="100" x2="80" y2="100" stroke="#7A7A9C" stroke-width="2.5" opacity="0.4" stroke-linecap="round"/>
  <!-- Dispersed rainbow beams (7 spectral lines) -->
  <line x1="180" y1="85" x2="280" y2="30" stroke="#4A3FA8" stroke-width="1.8" opacity="0.5" stroke-linecap="round"/>
  <line x1="180" y1="90" x2="280" y2="50" stroke="#5B4FD4" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <line x1="180" y1="95" x2="280" y2="70" stroke="#3B7DD8" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <line x1="180" y1="100" x2="280" y2="100" stroke="#1BA8B8" stroke-width="1.8" opacity="0.4" stroke-linecap="round"/>
  <line x1="180" y1="105" x2="280" y2="130" stroke="#1B8A6E" stroke-width="1.8" opacity="0.4" stroke-linecap="round"/>
  <line x1="180" y1="110" x2="280" y2="155" stroke="#D4890B" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <line x1="180" y1="115" x2="280" y2="180" stroke="#D4543B" stroke-width="1.8" opacity="0.5" stroke-linecap="round"/>
  <!-- Refraction angle markers -->
  <circle cx="80" cy="100" r="3" fill="#7A7A9C" opacity="0.4"/>
  <circle cx="180" cy="100" r="3" fill="#4A3FA8" opacity="0.4"/>
</svg>```.text

// Spectrum gradient bar — full rainbow horizontal strip
#let _spectrum-bar-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="6" viewBox="0 0 600 6">
  <defs>
    <linearGradient id="specGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#4A3FA8;stop-opacity:1"/>
      <stop offset="14%" style="stop-color:#5B4FD4;stop-opacity:1"/>
      <stop offset="28%" style="stop-color:#3B7DD8;stop-opacity:1"/>
      <stop offset="42%" style="stop-color:#1BA8B8;stop-opacity:1"/>
      <stop offset="57%" style="stop-color:#1B8A6E;stop-opacity:1"/>
      <stop offset="71%" style="stop-color:#D4890B;stop-opacity:1"/>
      <stop offset="85%" style="stop-color:#D4643B;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#D4543B;stop-opacity:1"/>
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="600" height="6" rx="3" fill="url(#specGrad)"/>
</svg>```.text

// Light ray convergence pattern — subtle converging lines from top-left (full page background)
#let _light-rays-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Converging rays from top-left focal point -->
  <line x1="0" y1="0" x2="840" y2="120" stroke="#4A3FA8" stroke-width="0.4" opacity="0.04"/>
  <line x1="0" y1="0" x2="840" y2="200" stroke="#5B4FD4" stroke-width="0.4" opacity="0.035"/>
  <line x1="0" y1="0" x2="840" y2="280" stroke="#3B7DD8" stroke-width="0.4" opacity="0.04"/>
  <line x1="0" y1="0" x2="840" y2="360" stroke="#1BA8B8" stroke-width="0.4" opacity="0.035"/>
  <line x1="0" y1="0" x2="840" y2="440" stroke="#1B8A6E" stroke-width="0.4" opacity="0.04"/>
  <line x1="0" y1="0" x2="700" y2="474" stroke="#D4890B" stroke-width="0.4" opacity="0.035"/>
  <line x1="0" y1="0" x2="500" y2="474" stroke="#D4643B" stroke-width="0.4" opacity="0.04"/>
  <line x1="0" y1="0" x2="300" y2="474" stroke="#D4543B" stroke-width="0.4" opacity="0.035"/>
  <!-- Secondary set from bottom-right -->
  <line x1="840" y1="474" x2="0" y2="350" stroke="#4A3FA8" stroke-width="0.3" opacity="0.025"/>
  <line x1="840" y1="474" x2="0" y2="250" stroke="#3B7DD8" stroke-width="0.3" opacity="0.025"/>
  <line x1="840" y1="474" x2="0" y2="150" stroke="#1B8A6E" stroke-width="0.3" opacity="0.025"/>
  <line x1="840" y1="474" x2="200" y2="0" stroke="#D4890B" stroke-width="0.3" opacity="0.02"/>
  <!-- Faint arc near focal point -->
  <circle cx="0" cy="0" r="120" fill="none" stroke="#4A3FA8" stroke-width="0.4" opacity="0.03"/>
  <circle cx="0" cy="0" r="240" fill="none" stroke="#3B7DD8" stroke-width="0.3" opacity="0.025"/>
  <circle cx="0" cy="0" r="400" fill="none" stroke="#1B8A6E" stroke-width="0.3" opacity="0.02"/>
</svg>```.text

// Wavelength sine wave overlay — oscillating wave pattern across full width
#let _wavelength-wave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="40" viewBox="0 0 600 40">
  <!-- Violet (short wavelength, tight oscillation) -->
  <path d="M0,20 C15,5 30,5 45,20 C60,35 75,35 90,20 C105,5 120,5 135,20 C150,35 165,35 180,20 C195,5 210,5 225,20 C240,35 255,35 270,20 C285,5 300,5 315,20 C330,35 345,35 360,20 C375,5 390,5 405,20 C420,35 435,35 450,20 C465,5 480,5 495,20 C510,35 525,35 540,20 C555,5 570,5 585,20" fill="none" stroke="#4A3FA8" stroke-width="1.2" opacity="0.25" stroke-linecap="round"/>
  <!-- Blue (medium wavelength) -->
  <path d="M0,20 C25,5 50,5 75,20 C100,35 125,35 150,20 C175,5 200,5 225,20 C250,35 275,35 300,20 C325,5 350,5 375,20 C400,35 425,35 450,20 C475,5 500,5 525,20 C550,35 575,35 600,20" fill="none" stroke="#3B7DD8" stroke-width="1" opacity="0.15" stroke-linecap="round"/>
  <!-- Green (longer wavelength) -->
  <path d="M0,20 C37,2 75,2 112,20 C150,38 187,38 225,20 C262,2 300,2 337,20 C375,38 412,38 450,20 C487,2 525,2 562,20 C600,38 600,38 600,20" fill="none" stroke="#1B8A6E" stroke-width="0.8" opacity="0.12" stroke-linecap="round"/>
  <!-- Red (longest wavelength, broad oscillation) -->
  <path d="M0,20 C50,0 100,0 150,20 C200,40 250,40 300,20 C350,0 400,0 450,20 C500,40 550,40 600,20" fill="none" stroke="#D4543B" stroke-width="0.7" opacity="0.1" stroke-linecap="round"/>
  <!-- Dotted baseline -->
  <line x1="0" y1="20" x2="600" y2="20" stroke="#7A7A9C" stroke-width="0.3" opacity="0.15" stroke-dasharray="4,4"/>
  <!-- Amplitude markers -->
  <circle cx="0" cy="20" r="2" fill="#4A3FA8" opacity="0.3"/>
  <circle cx="300" cy="20" r="2" fill="#3B7DD8" opacity="0.3"/>
  <circle cx="600" cy="20" r="2" fill="#D4543B" opacity="0.3"/>
</svg>```.text

// Diamond/crystal icon — small prism-like decorative element
#let _diamond-icon-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
  <polygon points="12,2 22,9 12,22 2,9" fill="none" stroke="#4A3FA8" stroke-width="1.5" opacity="0.7"/>
  <line x1="2" y1="9" x2="22" y2="9" stroke="#4A3FA8" stroke-width="1" opacity="0.5"/>
  <line x1="12" y1="2" x2="8" y2="9" stroke="#3B7DD8" stroke-width="0.8" opacity="0.4"/>
  <line x1="12" y1="2" x2="16" y2="9" stroke="#3B7DD8" stroke-width="0.8" opacity="0.4"/>
  <line x1="8" y1="9" x2="12" y2="22" stroke="#1B8A6E" stroke-width="0.8" opacity="0.4"/>
  <line x1="16" y1="9" x2="12" y2="22" stroke="#D4890B" stroke-width="0.8" opacity="0.4"/>
  <circle cx="12" cy="9" r="1.5" fill="#4A3FA8" opacity="0.5"/>
  <circle cx="12" cy="2" r="1" fill="#5B4FD4" opacity="0.6"/>
</svg>```.text

// Lens convergence lines — lines converging through a lens shape
#let _lens-rays-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="80" viewBox="0 0 200 80">
  <!-- Converging rays from left -->
  <line x1="0" y1="10" x2="100" y2="40" stroke="#4A3FA8" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <line x1="0" y1="30" x2="100" y2="40" stroke="#3B7DD8" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <line x1="0" y1="50" x2="100" y2="40" stroke="#1B8A6E" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <line x1="0" y1="70" x2="100" y2="40" stroke="#D4890B" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <!-- Diverging rays to right -->
  <line x1="100" y1="40" x2="200" y2="10" stroke="#D4543B" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <line x1="100" y1="40" x2="200" y2="30" stroke="#D4890B" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <line x1="100" y1="40" x2="200" y2="50" stroke="#1B8A6E" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <line x1="100" y1="40" x2="200" y2="70" stroke="#3B7DD8" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <!-- Lens shape (double convex) -->
  <ellipse cx="100" cy="40" rx="8" ry="35" fill="none" stroke="#4A3FA8" stroke-width="1.2" opacity="0.4"/>
  <!-- Focal point -->
  <circle cx="100" cy="40" r="3" fill="#4A3FA8" opacity="0.35"/>
  <!-- Optical axis -->
  <line x1="0" y1="40" x2="200" y2="40" stroke="#7A7A9C" stroke-width="0.4" opacity="0.2" stroke-dasharray="3,3"/>
</svg>```.text

// Light particle/photon icon — small decorative element
#let _photon-icon-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
  <circle cx="10" cy="10" r="4" fill="#D4890B" opacity="0.3"/>
  <circle cx="10" cy="10" r="2" fill="#D4890B" opacity="0.6"/>
  <line x1="10" y1="2" x2="10" y2="5" stroke="#D4890B" stroke-width="1" opacity="0.5" stroke-linecap="round"/>
  <line x1="10" y1="15" x2="10" y2="18" stroke="#D4890B" stroke-width="1" opacity="0.5" stroke-linecap="round"/>
  <line x1="2" y1="10" x2="5" y2="10" stroke="#D4890B" stroke-width="1" opacity="0.5" stroke-linecap="round"/>
  <line x1="15" y1="10" x2="18" y2="10" stroke="#D4890B" stroke-width="1" opacity="0.5" stroke-linecap="round"/>
  <line x1="4" y1="4" x2="6" y2="6" stroke="#D4890B" stroke-width="0.8" opacity="0.35" stroke-linecap="round"/>
  <line x1="14" y1="14" x2="16" y2="16" stroke="#D4890B" stroke-width="0.8" opacity="0.35" stroke-linecap="round"/>
  <line x1="14" y1="4" x2="16" y2="6" stroke="#D4890B" stroke-width="0.8" opacity="0.35" stroke-linecap="round"/>
  <line x1="4" y1="14" x2="6" y2="16" stroke="#D4890B" stroke-width="0.8" opacity="0.35" stroke-linecap="round"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render prism refraction decoration
#let prism-refraction(width: 180pt) = {
  box(image(bytes(_prism-refraction-svg), width: width))
}

/// Render spectrum bar
#let spectrum-bar(width: 100%) = {
  box(width: width, image(bytes(_spectrum-bar-svg), width: width, height: 4pt))
}

/// Render wavelength wave decoration
#let wavelength-wave(width: 100%) = {
  box(width: width, image(bytes(_wavelength-wave-svg), width: width, height: 20pt))
}

/// Render lens convergence
#let lens-convergence(width: 140pt) = {
  box(image(bytes(_lens-rays-svg), width: width))
}

/// Render diamond icon
#let diamond-icon(size: 18pt) = {
  box(image(bytes(_diamond-icon-svg), width: size, height: size))
}

/// Render photon icon
#let photon-icon(size: 14pt) = {
  box(image(bytes(_photon-icon-svg), width: size, height: size))
}


// ═══ Helper Functions ═══

/// Returns spectrum color by index (cycles through 8 spectral colors)
#let spectrum-color(index) = {
  spectrum-colors.at(calc.rem(index, spectrum-colors.len()))
}

/// Map bright spectral accents to WCAG-AA text colors on light surfaces.
#let spectrum-text-color(color) = {
  if color == palette.accent-blue or color == palette.blue {
    palette.blue-text
  } else if color == palette.cyan {
    palette.cyan-text
  } else if color == palette.tertiary or color == palette.green {
    palette.green-text
  } else if color == palette.accent-amber or color == palette.yellow {
    palette.amber-text
  } else if color == palette.orange {
    palette.orange-text
  } else if color == palette.secondary or color == palette.red {
    palette.red-text
  } else {
    color
  }
}

/// Background atmosphere — converging light rays (placed on every content slide)
#let _bg-atmosphere() = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_light-rays-bg-svg), width: 100%, height: 100%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — white background with persistent light ray atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Rainbow spectrum bar at very top
    block(width: 100%, height: 4pt, {
      box(width: 100%, image(bytes(_spectrum-bar-svg), width: 100%, height: 4pt))
    })
    // Title area
    show: components.cell.with(inset: (x: 1.8em, top: 0.5em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 1.35em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Multi-color underline dots (spectral progression)
      stack(dir: ltr, spacing: 4pt,
        block(width: 40pt, height: 3pt, fill: palette.primary, radius: 1.5pt),
        block(width: 25pt, height: 3pt, fill: palette.accent-blue, radius: 1.5pt),
        block(width: 15pt, height: 3pt, fill: palette.tertiary, radius: 1.5pt),
        block(width: 8pt, height: 3pt, fill: palette.accent-amber, radius: 1.5pt),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      {
        // Spectral dots in footer
        stack(dir: ltr, spacing: 4pt,
          box(circle(radius: 2pt, fill: palette.violet)),
          box(circle(radius: 2pt, fill: palette.blue)),
          box(circle(radius: 2pt, fill: palette.green)),
          box(circle(radius: 2pt, fill: palette.yellow)),
          box(circle(radius: 2pt, fill: palette.red)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
    )
  }
  let setting(body) = {
    // Persistent background atmosphere
    _bg-atmosphere()
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

/// Title slide — deep violet with prism + spectrum frame, rainbow corner accents
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Deep violet background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // Prism refraction decoration — right side
    place(right + horizon, dx: -20pt, dy: -10pt,
      box(image(bytes(_prism-refraction-svg), width: 220pt)))

    // Rainbow corner accents (bookend element)
    // Top-left corner rainbow arc
    place(top + left, dx: 15pt, dy: 15pt, {
      stack(dir: ltr, spacing: 2pt,
        block(width: 3pt, height: 50pt, fill: palette.red.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 40pt, fill: palette.orange.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 30pt, fill: palette.yellow.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 20pt, fill: palette.green.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 15pt, fill: palette.blue.transparentize(40%), radius: 1.5pt),
      )
    })
    // Bottom-right corner rainbow
    place(bottom + right, dx: -15pt, dy: -15pt, {
      stack(dir: ltr, spacing: 2pt,
        block(width: 3pt, height: 15pt, fill: palette.blue.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 20pt, fill: palette.green.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 30pt, fill: palette.yellow.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 40pt, fill: palette.orange.transparentize(40%), radius: 1.5pt),
        block(width: 3pt, height: 50pt, fill: palette.red.transparentize(40%), radius: 1.5pt),
      )
    })

    // Spectrum frame border at bottom
    place(bottom + left, dy: -50pt,
      box(width: 100%, image(bytes(_spectrum-bar-svg), width: 100%, height: 4pt)))

    // Wavelength wave overlay near bottom (subtle)
    place(bottom + left, dy: -70pt, dx: 60pt,
      box(width: 70%, image(bytes(_wavelength-wave-svg), width: 70%, height: 18pt)))

    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: 0.8em,
        text(size: 2.3em, weight: "bold", fill: white, info.title),
        if info.subtitle != none {
          text(size: 1.05em, fill: white.transparentize(20%), info.subtitle)
        },
        std.align(center, stack(dir: ltr, spacing: 3pt,
          block(width: 35pt, height: 3pt, fill: palette.accent-blue.lighten(20%), radius: 1.5pt),
          block(width: 50pt, height: 3pt, fill: palette.tertiary.lighten(20%), radius: 1.5pt),
          block(width: 35pt, height: 3pt, fill: palette.accent-amber, radius: 1.5pt),
        )),
        stack(
          spacing: 0.8em,
          if info.author != none {
            text(size: 1.1em, weight: "bold", fill: white, info.author)
          },
          if info.institution != none {
            text(size: 0.85em, fill: white.transparentize(30%), info.institution)
          },
          if info.date != none {
            text(size: 0.8em, fill: palette.accent-amber.lighten(30%))[#utils.display-info-date(self)]
          },
        ),
      )
    ]

    // Bottom-left spectral dots
    place(bottom + left, dx: 2em, dy: -1.5em,
      stack(dir: ltr, spacing: 5pt,
        box(circle(radius: 3pt, fill: palette.accent-blue.lighten(20%))),
        box(circle(radius: 3pt, fill: palette.tertiary.lighten(20%))),
        box(circle(radius: 3pt, fill: palette.accent-amber)),
      )
    )
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

/// New section slide — violet background with spectral accents
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
    // Dark violet background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // Subtle lens convergence at right
    place(right + horizon, dx: -40pt,
      box(image(bytes(_lens-rays-svg), width: 180pt)))

    // Top-right small prism
    place(top + right, dx: -30pt, dy: 20pt,
      polygon(fill: white.transparentize(90%), stroke: 0.6pt + white.transparentize(80%),
        (0pt, 50pt),
        (25pt, 0pt),
        (50pt, 50pt),
      )
    )

    // Section content — left aligned
    set std.align(left + horizon)
    pad(left: 4em, right: 4em)[
      #stack(
        spacing: 0.8em,
        stack(dir: ltr, spacing: 2pt,
          block(width: 30pt, height: 4pt, fill: palette.accent-blue.lighten(20%), radius: 2pt),
          block(width: 20pt, height: 4pt, fill: palette.tertiary.lighten(20%), radius: 2pt),
          block(width: 12pt, height: 4pt, fill: palette.accent-amber, radius: 2pt),
        ),
        {
          set text(fill: white, size: 2.2em, weight: "bold")
          utils.display-current-heading(level: 1)
        },
        box(width: 200pt, image(bytes(_wavelength-wave-svg), width: 200pt, height: 16pt)),
      )
    ]

    // Bottom spectral dots
    place(bottom + left, dx: 4em, dy: -1.5em,
      stack(dir: ltr, spacing: 5pt,
        box(circle(radius: 3pt, fill: palette.blue.lighten(30%))),
        box(circle(radius: 3pt, fill: palette.green.lighten(30%))),
        box(circle(radius: 3pt, fill: palette.yellow.lighten(20%))),
        box(circle(radius: 3pt, fill: palette.red.lighten(20%))),
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — light background with table of contents
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      fill: palette.bg,
      margin: (x: 4em, y: 2.5em),
    ),
  )
  let main-body = {
    // Background atmosphere
    _bg-atmosphere()
    // Prism decoration top-right
    place(top + right, dx: -1.5em, dy: 1em,
      box(image(bytes(_prism-refraction-svg), width: 120pt)))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "bold", fill: palette.text-dark)
        title
      },
      // Spectrum bar separator
      box(width: 120pt, image(bytes(_spectrum-bar-svg), width: 120pt, height: 3pt)),
      {
        set text(size: 1.1em, fill: palette.text-body)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — violet background with centered bold text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Triangle overlays
    place(bottom + right,
      polygon(fill: palette.secondary.transparentize(75%), stroke: none,
        (0pt, 0pt),
        (-250pt, 0pt),
        (-125pt, -180pt),
      )
    )
    place(top + left,
      polygon(fill: white.transparentize(92%), stroke: none,
        (0pt, 0pt),
        (130pt, 0pt),
        (65pt, 90pt),
      )
    )
    // Spectrum bar at top
    place(top + left, dy: 0pt,
      box(width: 100%, image(bytes(_spectrum-bar-svg), width: 100%, height: 3pt)))
    // Wavelength wave
    place(bottom + center, dy: -30pt,
      box(width: 60%, image(bytes(_wavelength-wave-svg), width: 60%, height: 16pt)))
    set text(fill: white, size: 1.8em, weight: "bold")
    std.align(horizon + center, body)
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light background with prism + spectrum frame, rainbow corners (bookend with title)
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
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))

    // Prism decoration — left side (mirrors title which has it on right)
    place(left + horizon, dx: 20pt, dy: -10pt,
      box(image(bytes(_prism-refraction-svg), width: 180pt)))

    // Rainbow corner accents (bookend with title slide)
    place(top + right, dx: -15pt, dy: 15pt, {
      stack(dir: ltr, spacing: 2pt,
        block(width: 3pt, height: 15pt, fill: palette.blue.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 20pt, fill: palette.green.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 30pt, fill: palette.yellow.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 40pt, fill: palette.orange.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 50pt, fill: palette.red.transparentize(50%), radius: 1.5pt),
      )
    })
    place(bottom + left, dx: 15pt, dy: -15pt, {
      stack(dir: ltr, spacing: 2pt,
        block(width: 3pt, height: 50pt, fill: palette.red.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 40pt, fill: palette.orange.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 30pt, fill: palette.yellow.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 20pt, fill: palette.green.transparentize(50%), radius: 1.5pt),
        block(width: 3pt, height: 15pt, fill: palette.blue.transparentize(50%), radius: 1.5pt),
      )
    })

    // Spectrum frame at top (bookend)
    place(top + left, dy: 40pt,
      box(width: 100%, image(bytes(_spectrum-bar-svg), width: 100%, height: 4pt)))

    // Center card
    set std.align(center + horizon)
    block(
      width: 55%,
      fill: palette.card-bg,
      stroke: 1pt + palette.border,
      radius: 12pt,
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        box(width: 100pt, image(bytes(_spectrum-bar-svg), width: 100pt, height: 3pt)),
        text(size: 2.2em, weight: "bold", fill: palette.text-dark, body),
        diamond-icon(size: 24pt),
        stack(dir: ltr, spacing: 6pt,
          box(circle(radius: 3pt, fill: palette.violet)),
          box(circle(radius: 3pt, fill: palette.blue)),
          box(circle(radius: 3pt, fill: palette.green)),
          box(circle(radius: 3pt, fill: palette.yellow)),
          box(circle(radius: 3pt, fill: palette.orange)),
          box(circle(radius: 3pt, fill: palette.red)),
        ),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components (11 components) ═══

/// Spectrum card — card with rainbow gradient top border
#let spectrum-card(title, body) = {
  stack(spacing: 0pt,
    // Rainbow gradient header bar
    block(width: 100%, height: 4pt, radius: (top: 6pt), clip: true,
      box(width: 100%, image(bytes(_spectrum-bar-svg), width: 100%, height: 4pt))),
    // Card body
    block(
      width: 100%,
      fill: palette.card-bg,
      stroke: (top: none, rest: 1pt + palette.border),
      inset: (x: 1.1em, y: 0.9em),
      radius: (bottom: 6pt),
    )[
      #stack(
        spacing: 0.8em,
        text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
        {
          set text(fill: palette.text-body, size: 0.82em)
          body
        },
        lazy-v(1fr),
      )
    ],
  )
}

/// Lens box — box with converging ray SVG decoration
#let lens-box(title, body) = {
  block(
    width: 100%,
    fill: palette.spectrum,
    stroke: (left: 4pt + palette.accent-blue, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 8pt),
  )[
    // Lens convergence decoration top-right
    #place(top + right, dx: -0.3em, dy: -0.3em,
      box(image(bytes(_lens-rays-svg), width: 60pt)))
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: palette.blue-text, size: 0.92em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Wavelength tag — small inline tag with spectral color dot
#let wavelength-tag(label, color: palette.primary) = {
  box(
    fill: color.transparentize(94%),
    stroke: 0.8pt + color.transparentize(50%),
    inset: (x: 0.6em, y: 0.25em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(circle(radius: 3pt, fill: color)),
      text(fill: spectrum-text-color(color), size: 0.72em, weight: "semibold", label),
    )
  ]
}

/// Refraction divider — SVG light beam split divider
#let refraction-divider() = {
  block(inset: (y: 0.35em))[
    #std.align(center,
      box(width: 70%, image(bytes(_wavelength-wave-svg), width: 70%, height: 16pt)))
  ]
}

/// Stat card — metric with prism/crystal SVG accent
#let stat-card(value, label, color: palette.primary) = {
  let text-color = spectrum-text-color(color)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (bottom: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.3em),
    radius: (top: 8pt),
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      diamond-icon(size: 13pt),
      text(fill: text-color, size: 1.55em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.62em, weight: "regular", label),
      lazy-v(1fr),
    )
  ]
}

/// Code card — code container with spectrum header line
#let code-card(title, body) = {
  stack(spacing: 0pt,
    // Spectrum header
    block(
      width: 100%,
      fill: palette.text-dark,
      inset: (x: 1em, y: 0.5em),
      radius: (top: 6pt),
    )[
      #stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3pt, fill: palette.secondary.transparentize(30%))),
        box(circle(radius: 3pt, fill: palette.accent-amber.transparentize(30%))),
        box(circle(radius: 3pt, fill: palette.tertiary.transparentize(30%))),
        h(0.5em),
        text(fill: white.transparentize(30%), size: 0.75em, weight: "medium", title),
      )
    ],
    // Code body
    block(
      width: 100%,
      fill: rgb("#F8F7FC"),
      stroke: (top: none, rest: 1pt + palette.border),
      inset: (x: 1em, y: 0.8em),
      radius: (bottom: 6pt),
    )[
      #set text(fill: palette.text-dark, size: 0.78em)
      #body
    ],
    lazy-v(1fr),
  )
}

/// Beam card — card with light beam side accent (gradient left border)
#let beam-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + palette.tertiary, rest: 1pt + palette.border),
    inset: (x: 1.1em, y: 0.75em),
    radius: (right: 8pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: palette.green-text, size: 0.92em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Insight box — callout with diamond/prism icon (borderless style)
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.primary.lighten(95%),
    stroke: none,
    inset: (x: 1.2em, y: 0.8em),
    radius: 8pt,
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        diamond-icon(size: 20pt),
        text(weight: "bold", fill: palette.primary, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Comparison table — clean scientific table with spectral header
#let comparison-table(align: center + horizon, columns: auto, text-size: 0.8em, headers, rows) = {
  let resolved-columns = if columns == auto { headers.len() * (1fr,) } else { columns }
  table(
    columns: resolved-columns,
    fill: (_, row) => if row == 0 { palette.primary }
      else if calc.odd(row) { palette.card-bg } else { palette.spectrum },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.7em, y: 0.35em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: text-size, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: text-size, c)),
  )
}

/// Photon note — borderless note with light particle icon
#let photon-note(body) = {
  block(
    width: 100%,
    fill: none,
    stroke: none,
    inset: (x: 0.3em, y: 0.15em),
  )[
    #stack(dir: ltr, spacing: 8pt,
      photon-icon(size: 16pt),
      {
        set text(fill: palette.text-body, size: 0.72em, style: "italic")
        body
      },
    )
  ]
}

/// Focus card — large focal metric with lens effect
#let focus-card(value, label, color: palette.primary) = {
  let text-color = spectrum-text-color(color)
  block(
    width: 100%,
    fill: color.lighten(94%),
    stroke: 1.2pt + color.transparentize(50%),
    inset: (x: 1em, y: 0.65em),
    radius: 10pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      lens-convergence(width: 42pt),
      text(fill: text-color, size: 2em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.76em, weight: "regular", label),
      lazy-v(1fr),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let prism-light-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: palette.bg,
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
