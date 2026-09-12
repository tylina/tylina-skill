// Hologram Theme — Futuristic glass-morphism / iridescent aesthetic
// Light backgrounds with iridescent gradient accent strips (violet-to-teal-to-gold)
// Frosted glass card effects, subtle rainbow edge glows, holographic grid patterns
// Inspired by holographic materials and AR interfaces
// Best for: Tech keynotes, futurism talks, AR/VR presentations, innovation showcases
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#F8FAFF"),             // Ice white
  primary: rgb("#7C3AED"),        // Holo violet
  secondary: rgb("#0EA5E9"),      // Holo teal
  accent: rgb("#EAB308"),         // Holo gold
  frosted-bg: rgb("#F1F5F9"),     // Frosted background
  text-dark: rgb("#1E1B4B"),      // Deep indigo-black
  text-body: rgb("#334155"),      // Slate body text
  text-muted: rgb("#94A3B8"),     // Muted slate
  card-bg: rgb("#FFFFFF"),        // Pure white cards
  border: rgb("#E2E8F0"),         // Light border
  glass: rgb("#FFFFFF").transparentize(40%),  // Frosted glass
  // Iridescent progression
  violet: rgb("#7C3AED"),
  indigo: rgb("#6366F1"),
  teal: rgb("#0EA5E9"),
  cyan: rgb("#06B6D4"),
  emerald: rgb("#10B981"),
  gold: rgb("#EAB308"),
  rose: rgb("#F43F5E"),
)

#let iridescent-colors = (palette.violet, palette.indigo, palette.teal, palette.cyan, palette.emerald, palette.gold, palette.rose)


// ═══ SVG Definitions ═══

// Iridescent gradient strip — shifting violet-to-teal-to-gold horizontal bar
#let _iridescent-strip-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="5" viewBox="0 0 600 5">
  <defs>
    <linearGradient id="iridescentGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#7C3AED;stop-opacity:1"/>
      <stop offset="20%" style="stop-color:#6366F1;stop-opacity:1"/>
      <stop offset="40%" style="stop-color:#0EA5E9;stop-opacity:1"/>
      <stop offset="60%" style="stop-color:#06B6D4;stop-opacity:1"/>
      <stop offset="80%" style="stop-color:#10B981;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#EAB308;stop-opacity:1"/>
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="600" height="5" rx="2.5" fill="url(#iridescentGrad)"/>
</svg>```.text

// Holographic grid — subtle perspective grid lines for AR interface feel
#let _holo-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="500" viewBox="0 0 800 500">
  <defs>
    <linearGradient id="gridFade" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#7C3AED;stop-opacity:0.06"/>
      <stop offset="100%" style="stop-color:#0EA5E9;stop-opacity:0.03"/>
    </linearGradient>
  </defs>
  <!-- Vertical grid lines -->
  <line x1="100" y1="0" x2="100" y2="500" stroke="#7C3AED" stroke-width="0.5" opacity="0.08"/>
  <line x1="200" y1="0" x2="200" y2="500" stroke="#6366F1" stroke-width="0.5" opacity="0.07"/>
  <line x1="300" y1="0" x2="300" y2="500" stroke="#0EA5E9" stroke-width="0.5" opacity="0.06"/>
  <line x1="400" y1="0" x2="400" y2="500" stroke="#06B6D4" stroke-width="0.5" opacity="0.06"/>
  <line x1="500" y1="0" x2="500" y2="500" stroke="#0EA5E9" stroke-width="0.5" opacity="0.07"/>
  <line x1="600" y1="0" x2="600" y2="500" stroke="#6366F1" stroke-width="0.5" opacity="0.08"/>
  <line x1="700" y1="0" x2="700" y2="500" stroke="#7C3AED" stroke-width="0.5" opacity="0.06"/>
  <!-- Horizontal grid lines -->
  <line x1="0" y1="80" x2="800" y2="80" stroke="#7C3AED" stroke-width="0.4" opacity="0.06"/>
  <line x1="0" y1="160" x2="800" y2="160" stroke="#0EA5E9" stroke-width="0.4" opacity="0.05"/>
  <line x1="0" y1="240" x2="800" y2="240" stroke="#06B6D4" stroke-width="0.4" opacity="0.05"/>
  <line x1="0" y1="320" x2="800" y2="320" stroke="#0EA5E9" stroke-width="0.4" opacity="0.05"/>
  <line x1="0" y1="400" x2="800" y2="400" stroke="#7C3AED" stroke-width="0.4" opacity="0.06"/>
  <!-- Corner markers (AR reticle style) -->
  <path d="M20,20 L50,20 M20,20 L20,50" stroke="#7C3AED" stroke-width="1.2" opacity="0.12" fill="none"/>
  <path d="M780,20 L750,20 M780,20 L780,50" stroke="#0EA5E9" stroke-width="1.2" opacity="0.12" fill="none"/>
  <path d="M20,480 L50,480 M20,480 L20,450" stroke="#0EA5E9" stroke-width="1.2" opacity="0.12" fill="none"/>
  <path d="M780,480 L750,480 M780,480 L780,450" stroke="#EAB308" stroke-width="1.2" opacity="0.12" fill="none"/>
  <!-- Diagonal light refraction lines -->
  <line x1="0" y1="0" x2="200" y2="500" stroke="#7C3AED" stroke-width="0.3" opacity="0.05"/>
  <line x1="600" y1="0" x2="800" y2="500" stroke="#0EA5E9" stroke-width="0.3" opacity="0.05"/>
  <line x1="300" y1="0" x2="100" y2="500" stroke="#EAB308" stroke-width="0.3" opacity="0.04"/>
</svg>```.text

// Frosted circle — soft radial gradient circle for glass-morphism decoration
#let _frosted-circle-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200">
  <defs>
    <radialGradient id="frostGrad" cx="50%" cy="50%" r="50%">
      <stop offset="0%" style="stop-color:#7C3AED;stop-opacity:0.08"/>
      <stop offset="40%" style="stop-color:#0EA5E9;stop-opacity:0.05"/>
      <stop offset="70%" style="stop-color:#06B6D4;stop-opacity:0.03"/>
      <stop offset="100%" style="stop-color:#FFFFFF;stop-opacity:0"/>
    </radialGradient>
    <filter id="blur1">
      <feGaussianBlur in="SourceGraphic" stdDeviation="8"/>
    </filter>
  </defs>
  <circle cx="100" cy="100" r="90" fill="url(#frostGrad)" filter="url(#blur1)"/>
  <circle cx="100" cy="100" r="70" fill="none" stroke="#7C3AED" stroke-width="0.5" opacity="0.1"/>
  <circle cx="100" cy="100" r="50" fill="none" stroke="#0EA5E9" stroke-width="0.4" opacity="0.08"/>
</svg>```.text

// Light refraction pattern — prismatic light beams diverging
#let _refraction-pattern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="200" viewBox="0 0 300 200">
  <defs>
    <linearGradient id="beam1" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#7C3AED;stop-opacity:0.2"/>
      <stop offset="100%" style="stop-color:#7C3AED;stop-opacity:0"/>
    </linearGradient>
    <linearGradient id="beam2" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#0EA5E9;stop-opacity:0.15"/>
      <stop offset="100%" style="stop-color:#0EA5E9;stop-opacity:0"/>
    </linearGradient>
    <linearGradient id="beam3" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#EAB308;stop-opacity:0.12"/>
      <stop offset="100%" style="stop-color:#EAB308;stop-opacity:0"/>
    </linearGradient>
  </defs>
  <!-- Converging beam (white light) -->
  <polygon points="0,80 0,120 80,98 80,102" fill="#94A3B8" opacity="0.1"/>
  <!-- Diverging beams (spectral) -->
  <line x1="80" y1="100" x2="300" y2="20" stroke="url(#beam1)" stroke-width="3"/>
  <line x1="80" y1="100" x2="300" y2="50" stroke="#6366F1" stroke-width="2" opacity="0.15"/>
  <line x1="80" y1="100" x2="300" y2="80" stroke="url(#beam2)" stroke-width="3"/>
  <line x1="80" y1="100" x2="300" y2="110" stroke="#06B6D4" stroke-width="2" opacity="0.12"/>
  <line x1="80" y1="100" x2="300" y2="140" stroke="#10B981" stroke-width="2" opacity="0.1"/>
  <line x1="80" y1="100" x2="300" y2="170" stroke="url(#beam3)" stroke-width="3"/>
  <!-- Prism shape -->
  <polygon points="60,70 100,70 80,130" fill="none" stroke="#7C3AED" stroke-width="1.5" opacity="0.2"/>
  <polygon points="65,75 95,75 80,125" fill="#7C3AED" opacity="0.03"/>
</svg>```.text

// AR interface frame — HUD-style corner brackets and scan lines
#let _ar-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Corner brackets -->
  <path d="M30,30 L80,30 M30,30 L30,80" stroke="#7C3AED" stroke-width="2" opacity="0.3" fill="none" stroke-linecap="round"/>
  <path d="M810,30 L760,30 M810,30 L810,80" stroke="#0EA5E9" stroke-width="2" opacity="0.3" fill="none" stroke-linecap="round"/>
  <path d="M30,444 L80,444 M30,444 L30,394" stroke="#0EA5E9" stroke-width="2" opacity="0.25" fill="none" stroke-linecap="round"/>
  <path d="M810,444 L760,444 M810,444 L810,394" stroke="#EAB308" stroke-width="2" opacity="0.25" fill="none" stroke-linecap="round"/>
  <!-- Scan line accents -->
  <line x1="80" y1="30" x2="200" y2="30" stroke="#7C3AED" stroke-width="0.8" opacity="0.15"/>
  <line x1="640" y1="30" x2="760" y2="30" stroke="#0EA5E9" stroke-width="0.8" opacity="0.15"/>
  <line x1="80" y1="444" x2="200" y2="444" stroke="#0EA5E9" stroke-width="0.8" opacity="0.12"/>
  <line x1="640" y1="444" x2="760" y2="444" stroke="#EAB308" stroke-width="0.8" opacity="0.12"/>
  <!-- Small dots at intersections -->
  <circle cx="30" cy="30" r="2.5" fill="#7C3AED" opacity="0.35"/>
  <circle cx="810" cy="30" r="2.5" fill="#0EA5E9" opacity="0.35"/>
  <circle cx="30" cy="444" r="2.5" fill="#0EA5E9" opacity="0.3"/>
  <circle cx="810" cy="444" r="2.5" fill="#EAB308" opacity="0.3"/>
  <!-- Center crosshair (subtle) -->
  <circle cx="420" cy="237" r="6" fill="none" stroke="#7C3AED" stroke-width="0.5" opacity="0.1"/>
  <line x1="414" y1="237" x2="426" y2="237" stroke="#7C3AED" stroke-width="0.5" opacity="0.1"/>
  <line x1="420" y1="231" x2="420" y2="243" stroke="#7C3AED" stroke-width="0.5" opacity="0.1"/>
</svg>```.text

// Iridescent orb — floating holographic sphere
#let _holo-orb-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <defs>
    <radialGradient id="orbGrad" cx="40%" cy="35%" r="60%">
      <stop offset="0%" style="stop-color:#FFFFFF;stop-opacity:0.6"/>
      <stop offset="30%" style="stop-color:#7C3AED;stop-opacity:0.15"/>
      <stop offset="60%" style="stop-color:#0EA5E9;stop-opacity:0.12"/>
      <stop offset="100%" style="stop-color:#EAB308;stop-opacity:0.08"/>
    </radialGradient>
    <linearGradient id="orbRing" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#7C3AED;stop-opacity:0.4"/>
      <stop offset="50%" style="stop-color:#0EA5E9;stop-opacity:0.3"/>
      <stop offset="100%" style="stop-color:#EAB308;stop-opacity:0.2"/>
    </linearGradient>
  </defs>
  <circle cx="60" cy="60" r="50" fill="url(#orbGrad)"/>
  <circle cx="60" cy="60" r="50" fill="none" stroke="url(#orbRing)" stroke-width="1.5"/>
  <ellipse cx="60" cy="60" rx="50" ry="18" fill="none" stroke="#0EA5E9" stroke-width="0.8" opacity="0.25" transform="rotate(-20 60 60)"/>
  <ellipse cx="60" cy="60" rx="50" ry="18" fill="none" stroke="#7C3AED" stroke-width="0.6" opacity="0.2" transform="rotate(25 60 60)"/>
  <circle cx="45" cy="42" r="8" fill="#FFFFFF" opacity="0.3"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render iridescent gradient strip
#let iridescent-strip(width: 100%) = {
  box(width: width, image(bytes(_iridescent-strip-svg), width: width, height: 4pt))
}

/// Render holographic grid background
#let holo-grid(width: 100%, height: 100%) = {
  image(bytes(_holo-grid-svg), width: width, height: height)
}

/// Render frosted circle decoration
#let frosted-circle(size: 120pt) = {
  box(image(bytes(_frosted-circle-svg), width: size))
}

/// Render light refraction pattern
#let refraction-pattern(width: 200pt) = {
  box(image(bytes(_refraction-pattern-svg), width: width))
}

/// Render AR interface frame
#let ar-frame() = {
  image(bytes(_ar-frame-svg), width: 100%, height: 100%)
}

/// Render holographic orb
#let holo-orb(size: 80pt) = {
  box(image(bytes(_holo-orb-svg), width: size))
}


// ═══ Helper Functions ═══

/// Returns iridescent color by index (cycles through 7 colors)
#let iris-color(index) = {
  iridescent-colors.at(calc.rem(index, iridescent-colors.len()))
}

/// Frosted glass background effect for content slides
#let glass-atmosphere() = {
  // Holographic grid in background
  place(top + left, box(width: 100%, height: 100%, holo-grid()))
  // Frosted circle decorations
  place(top + right, dx: -30pt, dy: 20pt, frosted-circle(size: 100pt))
  place(bottom + left, dx: 15pt, dy: -20pt, frosted-circle(size: 70pt))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — ice white bg, holographic grid atmosphere, iridescent header strip
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Iridescent strip at very top
    block(width: 100%, height: 4pt, {
      box(width: 100%, image(bytes(_iridescent-strip-svg), width: 100%, height: 4pt))
    })
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.5em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Iridescent underline dots
      stack(dir: ltr, spacing: 4pt,
        block(width: 40pt, height: 3pt, fill: palette.violet, radius: 1.5pt),
        block(width: 25pt, height: 3pt, fill: palette.teal, radius: 1.5pt),
        block(width: 15pt, height: 3pt, fill: palette.gold, radius: 1.5pt),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      {
        // Iridescent dots
        stack(dir: ltr, spacing: 5pt,
          box(circle(radius: 2.5pt, fill: palette.violet)),
          box(circle(radius: 2.5pt, fill: palette.teal)),
          box(circle(radius: 2.5pt, fill: palette.gold)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    // Holographic grid atmosphere
    glass-atmosphere()
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

/// Title slide — deep violet-to-dark background with AR frame, holographic orb, iridescent accents
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Deep violet gradient background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // Holographic orb — top right
    place(top + right, dx: -60pt, dy: 30pt, holo-orb(size: 110pt))

    // Refraction pattern — left side
    place(left + horizon, dx: -20pt, dy: -30pt, refraction-pattern(width: 220pt))

    // AR frame overlay
    place(top + left, box(width: 100%, height: 100%, ar-frame()))

    // Iridescent strip at bottom
    place(bottom + left, dy: -50pt,
      box(width: 100%, image(bytes(_iridescent-strip-svg), width: 100%, height: 4pt))
    )

    // Secondary frosted circle — bottom left
    place(bottom + left, dx: 40pt, dy: -80pt, frosted-circle(size: 90pt))

    // Center content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: white, info.title)
      #v(0.3em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.1em, fill: white.transparentize(20%), info.subtitle)
        v(0.6em)
      }
      // Iridescent separator
      #align(center, stack(dir: ltr, spacing: 4pt,
        block(width: 35pt, height: 3pt, fill: palette.teal, radius: 1.5pt),
        block(width: 50pt, height: 3pt, fill: palette.gold, radius: 1.5pt),
        block(width: 35pt, height: 3pt, fill: palette.violet.lighten(30%), radius: 1.5pt),
      ))
      #v(0.8em)
      // Author
      #if info.author != none {
        text(size: 1.15em, weight: "bold", fill: white, info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.9em, fill: white.transparentize(30%), info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.3em)
        text(size: 0.85em, fill: palette.teal.lighten(40%))[#utils.display-info-date(self)]
      }
    ]

    // Bottom-right iridescent dots
    place(bottom + right, dx: -2em, dy: -1.5em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3pt, fill: palette.gold)),
        box(circle(radius: 3pt, fill: palette.teal)),
        box(circle(radius: 3pt, fill: palette.violet)),
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

/// New section slide — deep background with holographic accents, AR bracket frame
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
    // Deep violet-indigo background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // AR frame
    place(top + left, box(width: 100%, height: 100%, ar-frame()))

    // Frosted circle — right
    place(right + horizon, dx: -50pt, frosted-circle(size: 140pt))

    // Holographic orb — top left subtle
    place(top + left, dx: 40pt, dy: 30pt, holo-orb(size: 60pt))

    // Section content — left aligned, vertically centered
    set std.align(left + horizon)
    pad(left: 4em, right: 4em)[
      // Iridescent accent blocks
      #stack(dir: ltr, spacing: 4pt,
        block(width: 30pt, height: 4pt, fill: palette.teal, radius: 2pt),
        block(width: 20pt, height: 4pt, fill: palette.gold, radius: 2pt),
      )
      #v(0.8em)
      // Section title
      #set text(fill: white, size: 2.4em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.5em)
      // Iridescent strip below title
      #box(width: 200pt, image(bytes(_iridescent-strip-svg), width: 200pt, height: 4pt))
    ]

    // Bottom iridescent dots
    place(bottom + left, dx: 4em, dy: -1.5em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3pt, fill: palette.teal)),
        box(circle(radius: 3pt, fill: palette.gold)),
        box(circle(radius: 3pt, fill: palette.emerald)),
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — frosted glass panel on deep background, bold centered text
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
    // AR frame overlay
    place(top + left, dx: -2em, dy: -2em, box(width: 900pt, height: 520pt, ar-frame()))

    // Frosted circles
    place(top + right, dx: -20pt, dy: 10pt, frosted-circle(size: 80pt))
    place(bottom + left, dx: 10pt, dy: -10pt, frosted-circle(size: 60pt))

    // Iridescent strip at top
    place(top + left, dx: -2em, dy: -2em,
      box(width: 900pt, image(bytes(_iridescent-strip-svg), width: 100%, height: 4pt))
    )

    // Frosted glass panel in center
    set text(fill: white, size: 1.7em, weight: "bold")
    set std.align(horizon + center)
    block(
      width: 80%,
      fill: white.transparentize(90%),
      stroke: 1pt + white.transparentize(70%),
      radius: 16pt,
      inset: (x: 2em, y: 1.5em),
    )[
      #set std.align(center)
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light background with holographic card, AR frame bookend
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
    // Light frosted background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))

    // Holographic grid
    place(top + left, box(width: 100%, height: 100%, holo-grid()))

    // AR frame (bookend with title slide)
    place(top + left, box(width: 100%, height: 100%, ar-frame()))

    // Frosted circles
    place(top + left, dx: 50pt, dy: 40pt, frosted-circle(size: 100pt))
    place(bottom + right, dx: -40pt, dy: -30pt, frosted-circle(size: 80pt))

    // Center card with frosted glass effect
    set std.align(center + horizon)
    block(
      width: 55%,
      fill: white,
      stroke: 1pt + palette.border,
      radius: 16pt,
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      // Iridescent strip top decoration
      #box(width: 120pt, image(bytes(_iridescent-strip-svg), width: 120pt, height: 3pt))
      #v(0.8em)
      // Content
      #text(size: 2.4em, weight: "bold", fill: palette.text-dark, body)
      #v(0.5em)
      // Iridescent underline
      #stack(dir: ltr, spacing: 4pt,
        block(width: 25pt, height: 3pt, fill: palette.violet, radius: 1.5pt),
        block(width: 25pt, height: 3pt, fill: palette.teal, radius: 1.5pt),
        block(width: 25pt, height: 3pt, fill: palette.gold, radius: 1.5pt),
      )
      #v(0.6em)
      // Holographic orb
      #holo-orb(size: 50pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — frosted glass card with iridescent left border for key concepts
#let concept-card(title, body, index: 0) = {
  let color = iris-color(index)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 10pt),
  )[
    #stack(spacing: 0.8em,
      text(weight: "bold", fill: color, size: 0.95em, title),
      {
        set text(fill: palette.text-body, size: 0.78em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Insight box — highlighted callout with violet gradient accent for key insights
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.violet.lighten(96%),
    stroke: (left: 4pt + palette.violet),
    inset: 14pt,
    radius: (right: 10pt),
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        text(size: 1.1em)[💡],
        text(weight: "bold", fill: palette.violet, size: 0.9em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.78em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Stat card — large metric display with iridescent bottom accent
#let stat-card(label, value, unit: none, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (bottom: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (top: 10pt),
  )[
    #stack(
      spacing: 0.8em,
      {
        set text(fill: color, size: 1.8em, weight: "bold")
        value
        if unit != none {
          h(0.2em)
          text(fill: palette.text-muted, size: 0.4em, weight: "regular", unit)
        }
      },
      text(fill: palette.text-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Holo card — card with iridescent top gradient strip and glass morphism
#let holo-card(title, body, index: 0) = {
  let color = iris-color(index)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.55em),
    radius: (bottom: 10pt),
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 4pt, fill: color)),
        text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.78em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Projection box — frosted glass panel with teal emphasis for projections/forecasts
#let projection-box(title, body) = {
  block(
    width: 100%,
    fill: palette.teal.lighten(96%),
    stroke: (top: 3pt + palette.teal, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (bottom: 10pt),
  )[
    #stack(spacing: 0.8em,
      text(weight: "bold", fill: palette.teal, size: 0.92em, title),
      {
        set text(fill: palette.text-body, size: 0.78em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Quote card — holographic quote block with decorative quote marks
#let quote-card(quote-text, attribution: none) = {
  block(
    width: 100%,
    fill: palette.frosted-bg,
    stroke: (left: 4pt + palette.gold, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.5em),
    radius: (right: 10pt),
  )[
    #place(top + left, dy: -0.35em,
      text(fill: palette.gold, size: 1.5em, weight: "bold")["])
    #stack(spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 0.82em, style: "italic")
        quote-text
      },
      {
        if attribution != none {
          text(fill: palette.text-muted, size: 0.72em, style: "normal", weight: "semibold")[-- #attribution]
        }
      },
      lazy-v(1fr),
    )
  ]
}

/// Interface card — AR-style card with corner markers and status indicator
#let interface-card(title, body, status: "active") = {
  let status-color = if status == "active" { palette.emerald } else if status == "pending" { palette.gold } else { palette.text-muted }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 10pt,
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 4pt, fill: status-color)),
        text(weight: "bold", fill: palette.text-dark, size: 0.9em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.76em)
        body
      },
      lazy-v(1fr),
    )
    #place(bottom + right, block(width: 12pt, height: 1.5pt, fill: palette.teal.transparentize(60%)))
  ]
}

/// Callout box — iridescent gradient border alert box
#let callout-box(title, body, variant: "info") = {
  let color = if variant == "info" { palette.teal } else if variant == "warning" { palette.gold } else if variant == "success" { palette.emerald } else { palette.violet }
  let icon = if variant == "info" { "ℹ" } else if variant == "warning" { "⚠" } else if variant == "success" { "✓" } else { "◆" }
  block(
    width: 100%,
    fill: color.lighten(96%),
    stroke: (left: 4pt + color, top: 1pt + color.transparentize(60%), rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 10pt),
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        text(fill: color, size: 1em, weight: "bold", icon),
        text(weight: "bold", fill: color, size: 0.9em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.78em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Iridescent divider — holographic gradient horizontal separator
#let holo-divider(width: 100%) = {
  v(0.4em)
  box(width: width, image(bytes(_iridescent-strip-svg), width: width, height: 3pt))
  v(0.4em)
}

/// Holo tag — small iridescent-colored chip/tag
#let holo-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color.transparentize(50%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color, size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Data table — styled table with iridescent header
#let holo-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary }
      else if calc.odd(row) { palette.card-bg } else { palette.frosted-bg },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.82em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.82em, c)),
  )
}


// ═══ 3. Theme Entry Point ═══

#let hologram-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(
    size: 20pt,
    fill: palette.text-body,
  )

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
