// Solar Flare Theme — Warm solar energy aesthetic with radiating patterns
// Gold/amber radiating ray patterns, warm orange accents on cream/white backgrounds.
// Inspired by solar physics: corona, sunspots, magnetic field lines as SVG decorations.
// Energetic, optimistic, powerful. Light theme with warm tones.
// Features: concept-card, insight-box, stat-card, energy-card, radiance-box,
//           quote-card, timeline-entry, callout-box
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  bg: rgb("#FFFDF7"),             // Warm white
  primary: rgb("#F59E0B"),        // Solar gold
  deep-amber: rgb("#B45309"),     // Deep amber
  sunset: rgb("#EA580C"),         // Sunset orange
  cream: rgb("#FEF3C7"),          // Cream
  text: rgb("#451A03"),           // Text dark
  text-muted: rgb("#92400E"),     // Muted amber-brown
  surface: rgb("#FFFBEB"),        // Slightly warm card bg
  corona: rgb("#FBBF24"),         // Corona yellow
  flare: rgb("#F97316"),          // Flare orange
)


// === SVG Definitions ===

// Radiating sun rays — concentric rays emanating from a point (full-page background)
#let _sun-rays-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Radiating ray lines from top-right corner -->
  <line x1="840" y1="0" x2="0" y2="474" stroke="#F59E0B" stroke-width="0.5" opacity="0.06"/>
  <line x1="840" y1="0" x2="100" y2="474" stroke="#F59E0B" stroke-width="0.5" opacity="0.05"/>
  <line x1="840" y1="0" x2="200" y2="474" stroke="#F59E0B" stroke-width="0.5" opacity="0.07"/>
  <line x1="840" y1="0" x2="300" y2="474" stroke="#F59E0B" stroke-width="0.6" opacity="0.05"/>
  <line x1="840" y1="0" x2="400" y2="474" stroke="#F59E0B" stroke-width="0.5" opacity="0.08"/>
  <line x1="840" y1="0" x2="500" y2="474" stroke="#F59E0B" stroke-width="0.6" opacity="0.06"/>
  <line x1="840" y1="0" x2="600" y2="474" stroke="#F59E0B" stroke-width="0.5" opacity="0.05"/>
  <line x1="840" y1="0" x2="700" y2="474" stroke="#F59E0B" stroke-width="0.5" opacity="0.07"/>
  <line x1="840" y1="0" x2="840" y2="474" stroke="#F59E0B" stroke-width="0.5" opacity="0.04"/>
  <line x1="840" y1="0" x2="0" y2="300" stroke="#F59E0B" stroke-width="0.5" opacity="0.05"/>
  <line x1="840" y1="0" x2="0" y2="150" stroke="#F59E0B" stroke-width="0.5" opacity="0.06"/>
  <line x1="840" y1="0" x2="0" y2="50" stroke="#F59E0B" stroke-width="0.5" opacity="0.04"/>
  <!-- Faint concentric arcs (corona rings) -->
  <circle cx="840" cy="0" r="200" fill="none" stroke="#FBBF24" stroke-width="0.8" opacity="0.04"/>
  <circle cx="840" cy="0" r="350" fill="none" stroke="#FBBF24" stroke-width="0.6" opacity="0.05"/>
  <circle cx="840" cy="0" r="500" fill="none" stroke="#FBBF24" stroke-width="0.5" opacity="0.04"/>
  <circle cx="840" cy="0" r="650" fill="none" stroke="#FBBF24" stroke-width="0.4" opacity="0.03"/>
  <circle cx="840" cy="0" r="800" fill="none" stroke="#FBBF24" stroke-width="0.4" opacity="0.03"/>
</svg>```.text

// Corona arc lines — curved arcs suggesting solar corona eruptions
#let _corona-arcs-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Large corona loops -->
  <path d="M680,0 C700,80 720,120 750,80 C780,40 800,60 820,0" fill="none" stroke="#F59E0B" stroke-width="1.2" opacity="0.15" stroke-linecap="round"/>
  <path d="M600,0 C620,60 650,100 680,90 C710,80 730,50 760,0" fill="none" stroke="#FBBF24" stroke-width="0.8" opacity="0.12" stroke-linecap="round"/>
  <path d="M720,0 C730,40 760,70 790,50 C810,35 830,20 840,0" fill="none" stroke="#F97316" stroke-width="1" opacity="0.1" stroke-linecap="round"/>
  <!-- Medium arcs -->
  <path d="M550,0 C570,50 590,70 620,60 C640,50 660,30 680,0" fill="none" stroke="#F59E0B" stroke-width="0.7" opacity="0.08" stroke-linecap="round"/>
  <path d="M740,0 C745,25 755,40 770,35 C785,30 795,15 800,0" fill="none" stroke="#FBBF24" stroke-width="0.6" opacity="0.1" stroke-linecap="round"/>
  <!-- Small plasma loops -->
  <path d="M650,0 C655,15 665,25 675,20 C685,15 690,8 695,0" fill="none" stroke="#F97316" stroke-width="0.5" opacity="0.12" stroke-linecap="round"/>
  <path d="M780,0 C782,10 788,18 794,15 C800,12 804,6 808,0" fill="none" stroke="#F59E0B" stroke-width="0.5" opacity="0.08" stroke-linecap="round"/>
  <!-- Coronal mass ejection traces (bottom) -->
  <path d="M100,474 C130,420 160,400 200,410 C240,420 270,440 300,474" fill="none" stroke="#F59E0B" stroke-width="0.6" opacity="0.06" stroke-linecap="round"/>
  <path d="M0,400 C30,370 60,360 90,370 C120,380 140,400 160,420" fill="none" stroke="#FBBF24" stroke-width="0.5" opacity="0.05" stroke-linecap="round"/>
</svg>```.text

// Magnetic field curves — elegant curved lines suggesting solar magnetic topology
#let _magnetic-field-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="60" viewBox="0 0 200 60">
  <path d="M0,50 C30,50 50,10 100,10 C150,10 170,50 200,50" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.6" stroke-linecap="round"/>
  <path d="M0,55 C35,55 55,20 100,20 C145,20 165,55 200,55" fill="none" stroke="currentColor" stroke-width="1" opacity="0.4" stroke-linecap="round"/>
  <path d="M0,45 C25,45 45,5 100,5 C155,5 175,45 200,45" fill="none" stroke="currentColor" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <path d="M10,58 C40,58 60,28 100,28 C140,28 160,58 190,58" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.25" stroke-linecap="round"/>
</svg>```.text

// Circular halo — concentric rings with varying opacity (sunspot-like)
#let _halo-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <circle cx="60" cy="60" r="12" fill="none" stroke="currentColor" stroke-width="2" opacity="0.5"/>
  <circle cx="60" cy="60" r="22" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.35"/>
  <circle cx="60" cy="60" r="33" fill="none" stroke="currentColor" stroke-width="1" opacity="0.25"/>
  <circle cx="60" cy="60" r="45" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <circle cx="60" cy="60" r="56" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.1"/>
  <!-- Radial tick marks -->
  <line x1="60" y1="2" x2="60" y2="8" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="60" y1="112" x2="60" y2="118" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="2" y1="60" x2="8" y2="60" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="112" y1="60" x2="118" y2="60" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="18" y1="18" x2="22" y2="22" stroke="currentColor" stroke-width="0.6" opacity="0.2"/>
  <line x1="98" y1="18" x2="102" y2="22" stroke="currentColor" stroke-width="0.6" opacity="0.2"/>
  <line x1="18" y1="102" x2="22" y2="98" stroke="currentColor" stroke-width="0.6" opacity="0.2"/>
  <line x1="98" y1="102" x2="102" y2="98" stroke="currentColor" stroke-width="0.6" opacity="0.2"/>
</svg>```.text

// Solar flare burst — radiating spikes from center (for title/ending)
#let _flare-burst-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 300 300">
  <!-- Central glow -->
  <circle cx="150" cy="150" r="20" fill="#F59E0B" opacity="0.15"/>
  <circle cx="150" cy="150" r="35" fill="#FBBF24" opacity="0.08"/>
  <circle cx="150" cy="150" r="55" fill="#FEF3C7" opacity="0.06"/>
  <!-- Radiating rays (varying lengths and opacities) -->
  <line x1="150" y1="150" x2="150" y2="10" stroke="#F59E0B" stroke-width="1.5" opacity="0.3" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="150" y2="290" stroke="#F59E0B" stroke-width="1.5" opacity="0.3" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="10" y2="150" stroke="#F59E0B" stroke-width="1.5" opacity="0.3" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="290" y2="150" stroke="#F59E0B" stroke-width="1.5" opacity="0.3" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="50" y2="50" stroke="#FBBF24" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="250" y2="50" stroke="#FBBF24" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="50" y2="250" stroke="#FBBF24" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="250" y2="250" stroke="#FBBF24" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <!-- Secondary shorter rays -->
  <line x1="150" y1="150" x2="80" y2="100" stroke="#F97316" stroke-width="0.8" opacity="0.15" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="220" y2="100" stroke="#F97316" stroke-width="0.8" opacity="0.15" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="80" y2="200" stroke="#F97316" stroke-width="0.8" opacity="0.15" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="220" y2="200" stroke="#F97316" stroke-width="0.8" opacity="0.15" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="100" y2="40" stroke="#F59E0B" stroke-width="0.6" opacity="0.12" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="200" y2="40" stroke="#F59E0B" stroke-width="0.6" opacity="0.12" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="100" y2="260" stroke="#F59E0B" stroke-width="0.6" opacity="0.12" stroke-linecap="round"/>
  <line x1="150" y1="150" x2="200" y2="260" stroke="#F59E0B" stroke-width="0.6" opacity="0.12" stroke-linecap="round"/>
</svg>```.text

// Sunspot cluster — small decorative element
#let _sunspot-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 60 60">
  <circle cx="30" cy="30" r="10" fill="#451A03" opacity="0.15"/>
  <circle cx="30" cy="30" r="7" fill="#451A03" opacity="0.25"/>
  <circle cx="30" cy="30" r="4" fill="#451A03" opacity="0.35"/>
  <circle cx="30" cy="30" r="14" fill="none" stroke="#F59E0B" stroke-width="0.8" opacity="0.3"/>
  <circle cx="30" cy="30" r="18" fill="none" stroke="#FBBF24" stroke-width="0.5" opacity="0.2"/>
  <circle cx="22" cy="25" r="2" fill="#451A03" opacity="0.2"/>
  <circle cx="36" cy="35" r="1.5" fill="#451A03" opacity="0.15"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render radiating sun rays background
#let sun-rays-bg() = {
  image(bytes(_sun-rays-svg), width: 100%, height: 100%)
}

/// Render corona arcs overlay
#let corona-arcs-overlay() = {
  image(bytes(_corona-arcs-svg), width: 100%, height: 100%)
}

/// Render magnetic field curves with a given color
#let magnetic-field(color: palette.primary, width: 100%) = {
  let svg = _magnetic-field-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 24pt))
}

/// Render circular halo with a given color
#let halo(color: palette.primary, size: 60pt) = {
  let svg = _halo-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render solar flare burst
#let flare-burst(size: 200pt) = {
  image(bytes(_flare-burst-svg), width: size, height: size)
}

/// Render sunspot cluster
#let sunspot(size: 30pt) = {
  image(bytes(_sunspot-svg), width: size, height: size)
}

/// Solar divider — magnetic field line separator
#let solar-divider(color: palette.primary) = {
  magnetic-field(color: color, width: 60%)
}


// === 1. Slide Functions ===

/// Content slide — warm white bg with faint radiating rays, gold title accent
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Solar gold gradient bar
      stack(dir: ltr, spacing: 0pt,
        block(width: 50pt, height: 2.5pt, fill: palette.primary, radius: (left: 1.5pt)),
        block(width: 20pt, height: 2.5pt, fill: palette.corona, radius: (right: 1.5pt)),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Solar dot separator
        stack(dir: ltr, spacing: 4pt,
          circle(radius: 1.5pt, fill: palette.primary.transparentize(50%)),
          circle(radius: 2.5pt, fill: palette.primary),
          circle(radius: 1.5pt, fill: palette.primary.transparentize(50%)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // Persistent solar atmosphere stays behind the aligned slide content.
    place(top + left, box(width: 100%, height: 100%, sun-rays-bg()))
    place(bottom + right, dx: -1.2em, dy: -0.6em,
      halo(color: palette.primary.transparentize(50%), size: 28pt))
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

/// Title slide — solar flare burst, corona arcs, warm cream background
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.cream))
    // Full-page radiating rays
    place(top + left, box(width: 100%, height: 100%, sun-rays-bg()))
    // Corona arcs at top
    place(top + left, box(width: 100%, height: 100%, corona-arcs-overlay()))
    // Flare burst decoration (top-right)
    place(top + right, dx: -20pt, dy: -30pt, flare-burst(size: 240pt))
    // Halo decoration (bottom-left)
    place(bottom + left, dx: 40pt, dy: -30pt, halo(color: palette.primary, size: 80pt))
    // Frame border with solar gold
    place(center + horizon,
      rect(
        width: 92%,
        height: 88%,
        fill: none,
        stroke: 1.5pt + palette.primary.transparentize(40%),
        radius: 8pt,
      ))
    // Content centered
    set std.align(center + horizon)
    pad(x: 4em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.text, info.title)
      #v(0.3em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.text-muted, info.subtitle)
        v(0.5em)
      }
      // Magnetic field line divider
      #std.align(center, magnetic-field(color: palette.primary, width: 160pt))
      #v(0.6em)
      // Author
      #if info.author != none {
        text(size: 1.1em, weight: "semibold", fill: palette.deep-amber, info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.85em, fill: palette.text-muted, info.institution)
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

/// Section divider slide — solar burst left, bold section title
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
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Faint sun rays
    place(top + left, box(width: 100%, height: 100%, sun-rays-bg()))
    // Left amber accent band with gradient feel
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Halo decoration at right
    place(horizon + right, dx: -60pt, halo(color: palette.corona, size: 100pt))
    // Small sunspot cluster
    place(bottom + left, dx: 80pt, dy: -40pt, sunspot(size: 36pt))
    // Section content
    pad(left: 4.5em, right: 4em, top: 4em, bottom: 3em)[
      #v(1fr)
      // Small label
      #text(fill: palette.primary, size: 0.8em, weight: "bold", tracking: 0.08em)[SECTION]
      #v(0.3em)
      #set text(fill: palette.text, size: 2.2em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.4em)
      // Solar gold bar
      #stack(dir: ltr, spacing: 0pt,
        block(width: 60pt, height: 3pt, fill: palette.primary, radius: (left: 1.5pt)),
        block(width: 25pt, height: 3pt, fill: palette.sunset, radius: (right: 1.5pt)),
      )
      #v(0.4em)
      // Radiating dots
      #stack(dir: ltr, spacing: 5pt,
        circle(radius: 3.5pt, fill: palette.primary),
        circle(radius: 2.5pt, fill: palette.corona),
        circle(radius: 2pt, fill: palette.primary.transparentize(50%)),
        circle(radius: 1.5pt, fill: palette.primary.transparentize(70%)),
      )
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep amber/sunset background, white text, flare burst centered
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
    // Deep amber background
    place(top + left, block(width: 100%, height: 100%, fill: palette.deep-amber))
    // Subtle flare burst centered
    place(center + horizon, flare-burst(size: 350pt))
    // Circular halo rings
    place(top + left, dx: 40pt, dy: 30pt, halo(color: white.transparentize(70%), size: 60pt))
    place(bottom + right, dx: -30pt, dy: -30pt, halo(color: white.transparentize(75%), size: 50pt))
    // Content
    place(center + horizon,
      block(width: 78%)[
        #set text(fill: white, size: 1.6em, weight: "bold")
        #set std.align(center)
        #body
      ])
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — warm cream with flare burst, corona arcs bookend with title
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
    // Warm cream background (matches title slide)
    place(top + left, block(width: 100%, height: 100%, fill: palette.cream))
    // Full-page radiating rays (bookend with title)
    place(top + left, box(width: 100%, height: 100%, sun-rays-bg()))
    // Corona arcs (bookend with title)
    place(top + left, box(width: 100%, height: 100%, corona-arcs-overlay()))
    // Flare burst center
    place(center + horizon, flare-burst(size: 280pt))
    // Frame border (bookend with title)
    place(center + horizon,
      rect(
        width: 92%,
        height: 88%,
        fill: none,
        stroke: 1.5pt + palette.primary.transparentize(40%),
        radius: 8pt,
      ))
    // Center content
    set std.align(center + horizon)
    block(width: 100%)[
      #text(size: 2.4em, weight: "bold", fill: palette.text, body)
      #v(0.5em)
      // Magnetic field divider
      #std.align(center, magnetic-field(color: palette.primary, width: 140pt))
      #v(0.4em)
      // Radiating dots
      #std.align(center, stack(dir: ltr, spacing: 5pt,
        circle(radius: 2pt, fill: palette.primary.transparentize(60%)),
        circle(radius: 3pt, fill: palette.primary),
        circle(radius: 4pt, fill: palette.sunset),
        circle(radius: 3pt, fill: palette.primary),
        circle(radius: 2pt, fill: palette.primary.transparentize(60%)),
      ))
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Concept card — warm surface card with solar gold top accent, for key concepts
#let concept-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (top: 3pt + accent, rest: 0.8pt + palette.cream.darken(8%)),
    inset: (x: 1.2em, y: 1em),
    radius: 6pt,
  )[
    // Subtle halo decoration top-right
    #place(top + right, dx: -0.3em, dy: -0.3em,
      circle(radius: 10pt, fill: accent.transparentize(90%)))
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.text, size: 0.95em, title),
      [
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Insight box — left-bordered panel with sunset/orange accent, for insights
#let insight-box(title, body, accent: palette.sunset) = {
  block(
    width: 100%,
    fill: accent.transparentize(94%),
    stroke: (left: 3.5pt + accent, rest: 0.8pt + accent.transparentize(75%)),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 6pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      circle(radius: 3pt, fill: accent),
      text(weight: "bold", fill: accent.darken(10%), size: 0.92em, title),
    )
    #v(5pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Stat card — KPI metric with large solar gold number
#let stat-card(label, value, trend: none) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (top: 3pt + palette.primary, rest: 0.8pt + palette.cream.darken(8%)),
    inset: (x: 1em, y: 0.8em),
    radius: 6pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: palette.primary, size: 1.7em, weight: "bold")
        #value
        #if trend != none {
          h(0.3em)
          text(fill: palette.sunset, size: 0.5em, weight: "bold", trend)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Energy card — vibrant card with sunset gradient feel, for high-energy content
#let energy-card(title, body) = {
  block(
    width: 100%,
    fill: palette.sunset.transparentize(93%),
    stroke: (
      top: 3pt + palette.sunset,
      bottom: 1.5pt + palette.primary.transparentize(50%),
      rest: 0.8pt + palette.sunset.transparentize(70%),
    ),
    inset: (x: 1.2em, y: 1em),
    radius: 6pt,
  )[
    // Inline SVG sunspot decoration
    #place(top + right, dx: -0.2em, dy: -0.2em, sunspot(size: 22pt))
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.sunset.darken(10%), size: 0.95em, title),
      [
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Radiance box — glowing box with halo rings, for featured/highlighted content
#let radiance-box(title, body, accent: palette.corona) = {
  block(
    width: 100%,
    fill: accent.transparentize(92%),
    stroke: 1.2pt + accent.transparentize(40%),
    inset: (x: 1.2em, y: 1em),
    radius: 8pt,
  )[
    // Inline halo decoration
    #place(top + left, dx: -0.5em, dy: -0.5em,
      halo(color: accent, size: 36pt))
    #pad(left: 1.5em)[
      #stack(spacing: .8em,
        text(weight: "bold", fill: accent.darken(20%), size: 0.95em, title),
        [
        #set text(fill: palette.text, size: 0.82em)
        #body
        ],
      )
    ]
    #lazy-v(1fr)
  ]
}

/// Quote card — solar-themed quotation block with magnetic field line below
#let quote-card(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (left: 3pt + palette.primary),
    inset: (left: 1.4em, right: 1em, y: 1em),
    radius: (right: 6pt),
  )[
    // Decorative quotation mark via unicode
    #place(top + left, dx: -0.8em, dy: -0.4em,
      text(size: 2em, fill: palette.primary.transparentize(60%), weight: "bold")[\u{201C}])
    #set text(fill: palette.text, size: 0.88em, style: "italic")
    #quote
    #if author != none {
      v(0.4em)
      set text(fill: palette.text-muted, size: 0.78em, weight: "medium", style: "normal")
      [-- #author]
    }
    #v(0.3em)
    #magnetic-field(color: palette.primary.transparentize(40%), width: 80%)
    #lazy-v(1fr)
  ]
}

/// Timeline entry — chronological item with solar dot marker
#let timeline-entry(date, title, description: none) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    // Left: date + marker
    {
      stack(
        spacing: .8em,
        std.align(center,
          stack(
            // The marker and its continuation stem deliberately touch.
            spacing: 0pt,
            circle(radius: 5pt, fill: palette.primary),
            block(width: 1.5pt, height: 20pt, fill: palette.primary.transparentize(60%)),
          )
        ),
        std.align(center, text(fill: palette.text-muted, size: 0.7em, weight: "bold", date)),
      )
    },
    // Right: content
    {
      block(width: 100%, inset: (bottom: 0.6em))[
        #text(weight: "bold", fill: palette.text, size: 0.88em, title)
        #if description != none {
          v(3pt)
          text(fill: palette.text-muted, size: 0.78em, description)
        }
      ]
    },
  )
}

/// Callout box — attention-grabbing box with flare icon feel
#let callout-box(title, body, kind: "info") = {
  let accent = if kind == "warning" { palette.sunset }
    else if kind == "success" { rgb("#059669") }
    else { palette.primary }
  let icon-char = if kind == "warning" [!]
    else if kind == "success" [\u{2713}]
    else [\u{2600}]
  block(
    width: 100%,
    fill: accent.transparentize(92%),
    stroke: (top: 2.5pt + accent, rest: 0.8pt + accent.transparentize(60%)),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(dir: ltr, spacing: 8pt,
      // Icon circle
      {
        set std.align(center + horizon)
        circle(radius: 10pt, fill: accent.transparentize(80%), stroke: 1pt + accent)[
          #text(fill: accent, size: 0.8em, weight: "bold", icon-char)
        ]
      },
      {
        text(weight: "bold", fill: accent.darken(10%), size: 0.92em, title)
      },
    )
    #v(5pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Solar tag — pill-shaped label
#let solar-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color.transparentize(30%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(10%), size: 0.75em, weight: "semibold")
    #content
  ]
}


// === 3. Theme Entry Point ===

#let solar-flare-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: palette.bg,
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
