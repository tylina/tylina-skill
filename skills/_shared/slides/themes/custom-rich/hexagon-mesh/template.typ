// Hexagon Mesh Theme — Molecular structures, honeycomb patterns, crystalline lattice aesthetics
// Light grey-white background with teal primary, dark slate secondary, amber accent
// Features: hexagonal grid patterns, molecular bonds, node dots at vertices, crystalline borders, lattice mesh backgrounds
// Perfect for chemistry, materials science, tech architecture, network presentations, biotech
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  bg: rgb("#F9FAFB"),
  primary: rgb("#0D9488"),
  secondary: rgb("#334155"),
  accent: rgb("#D97706"),
  text: rgb("#374151"),
  text-muted: rgb("#6B7280"),
  card-bg: rgb("#FFFFFF"),
  primary-light: rgb("#0D9488").lighten(90%),
  accent-light: rgb("#D97706").lighten(88%),
  secondary-light: rgb("#334155").lighten(88%),
  border: rgb("#D1D5DB"),
  node-color: rgb("#0D9488"),
  bond-color: rgb("#334155"),
)


// === SVG Definitions ===

// Full-page hexagonal mesh background — tessellating hexagons with nodes and molecular bonds
#let _hex-mesh-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M60,30 L90,13 L120,30 L120,64 L90,81 L60,64 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.10"/>
  <path d="M120,30 L150,13 L180,30 L180,64 L150,81 L120,64 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.08"/>
  <path d="M240,30 L270,13 L300,30 L300,64 L270,81 L240,64 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.09"/>
  <path d="M420,47 L450,30 L480,47 L480,81 L450,98 L420,81 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.07"/>
  <path d="M540,30 L570,13 L600,30 L600,64 L570,81 L540,64 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.10"/>
  <path d="M660,47 L690,30 L720,47 L720,81 L690,98 L660,81 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.08"/>
  <path d="M90,130 L120,113 L150,130 L150,164 L120,181 L90,164 Z" fill="none" stroke="#334155" stroke-width="0.4" opacity="0.06"/>
  <path d="M330,147 L360,130 L390,147 L390,181 L360,198 L330,181 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.09"/>
  <path d="M480,130 L510,113 L540,130 L540,164 L510,181 L480,164 Z" fill="none" stroke="#334155" stroke-width="0.4" opacity="0.07"/>
  <path d="M690,130 L720,113 L750,130 L750,164 L720,181 L690,164 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.08"/>
  <path d="M30,247 L60,230 L90,247 L90,281 L60,298 L30,281 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.09"/>
  <path d="M180,230 L210,213 L240,230 L240,264 L210,281 L180,264 Z" fill="none" stroke="#334155" stroke-width="0.4" opacity="0.06"/>
  <path d="M390,247 L420,230 L450,247 L450,281 L420,298 L390,281 Z" fill="#0D9488" fill-opacity="0.03" stroke="#0D9488" stroke-width="0.5" opacity="0.10"/>
  <path d="M570,230 L600,213 L630,230 L630,264 L600,281 L570,264 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.07"/>
  <path d="M750,247 L780,230 L810,247 L810,281 L780,298 L750,281 Z" fill="none" stroke="#334155" stroke-width="0.4" opacity="0.06"/>
  <path d="M120,347 L150,330 L180,347 L180,381 L150,398 L120,381 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.08"/>
  <path d="M300,364 L330,347 L360,364 L360,398 L330,415 L300,398 Z" fill="#0D9488" fill-opacity="0.02" stroke="#0D9488" stroke-width="0.5" opacity="0.09"/>
  <path d="M510,347 L540,330 L570,347 L570,381 L540,398 L510,381 Z" fill="none" stroke="#334155" stroke-width="0.4" opacity="0.07"/>
  <path d="M660,364 L690,347 L720,364 L720,398 L690,415 L660,398 Z" fill="none" stroke="#0D9488" stroke-width="0.5" opacity="0.08"/>
  <path d="M60,430 L90,413 L120,430 L120,464 L90,474 L60,464 Z" fill="none" stroke="#0D9488" stroke-width="0.4" opacity="0.06"/>
  <line x1="90" y1="47" x2="150" y2="47" stroke="#334155" stroke-width="0.4" opacity="0.08"/>
  <line x1="270" y1="47" x2="330" y2="47" stroke="#334155" stroke-width="0.4" opacity="0.06"/>
  <line x1="570" y1="47" x2="630" y2="47" stroke="#334155" stroke-width="0.4" opacity="0.07"/>
  <line x1="120" y1="147" x2="180" y2="147" stroke="#0D9488" stroke-width="0.4" opacity="0.07"/>
  <line x1="360" y1="164" x2="420" y2="164" stroke="#334155" stroke-width="0.4" opacity="0.06"/>
  <line x1="510" y1="147" x2="570" y2="147" stroke="#0D9488" stroke-width="0.4" opacity="0.06"/>
  <line x1="60" y1="264" x2="120" y2="264" stroke="#334155" stroke-width="0.4" opacity="0.07"/>
  <line x1="420" y1="264" x2="480" y2="264" stroke="#0D9488" stroke-width="0.4" opacity="0.06"/>
  <line x1="600" y1="247" x2="660" y2="247" stroke="#334155" stroke-width="0.4" opacity="0.05"/>
  <line x1="150" y1="364" x2="210" y2="364" stroke="#0D9488" stroke-width="0.4" opacity="0.07"/>
  <line x1="540" y1="364" x2="600" y2="364" stroke="#334155" stroke-width="0.4" opacity="0.06"/>
  <circle cx="90" cy="47" r="2" fill="#0D9488" opacity="0.15"/>
  <circle cx="150" cy="47" r="1.5" fill="#334155" opacity="0.12"/>
  <circle cx="270" cy="47" r="1.5" fill="#0D9488" opacity="0.13"/>
  <circle cx="570" cy="47" r="2" fill="#0D9488" opacity="0.14"/>
  <circle cx="690" cy="64" r="1.5" fill="#334155" opacity="0.10"/>
  <circle cx="120" cy="147" r="1.5" fill="#0D9488" opacity="0.12"/>
  <circle cx="360" cy="164" r="2" fill="#0D9488" opacity="0.14"/>
  <circle cx="510" cy="147" r="1.5" fill="#334155" opacity="0.11"/>
  <circle cx="720" cy="147" r="1.5" fill="#0D9488" opacity="0.12"/>
  <circle cx="60" cy="264" r="2" fill="#0D9488" opacity="0.13"/>
  <circle cx="210" cy="247" r="1.5" fill="#334155" opacity="0.10"/>
  <circle cx="420" cy="264" r="2" fill="#0D9488" opacity="0.15"/>
  <circle cx="600" cy="247" r="1.5" fill="#0D9488" opacity="0.12"/>
  <circle cx="780" cy="264" r="1.5" fill="#334155" opacity="0.10"/>
  <circle cx="150" cy="364" r="2" fill="#0D9488" opacity="0.14"/>
  <circle cx="330" cy="381" r="1.5" fill="#0D9488" opacity="0.12"/>
  <circle cx="540" cy="364" r="1.5" fill="#334155" opacity="0.11"/>
  <circle cx="690" cy="381" r="2" fill="#0D9488" opacity="0.13"/>
</svg>```.text

// Lattice frame SVG — border made of connected hexagons with node dots (bookend element)
#let _lattice-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M30,20 L50,8 L70,20 L70,44 L50,56 L30,44 Z" fill="none" stroke="#0D9488" stroke-width="1.8" opacity="0.55"/>
  <path d="M70,20 L90,8 L110,20 L110,44 L90,56 L70,44 Z" fill="none" stroke="#0D9488" stroke-width="1.2" opacity="0.35"/>
  <path d="M730,20 L750,8 L770,20 L770,44 L750,56 L730,44 Z" fill="none" stroke="#0D9488" stroke-width="1.2" opacity="0.35"/>
  <path d="M770,20 L790,8 L810,20 L810,44 L790,56 L770,44 Z" fill="none" stroke="#0D9488" stroke-width="1.8" opacity="0.55"/>
  <path d="M30,430 L50,418 L70,430 L70,454 L50,466 L30,454 Z" fill="none" stroke="#0D9488" stroke-width="1.8" opacity="0.55"/>
  <path d="M70,430 L90,418 L110,430 L110,454 L90,466 L70,454 Z" fill="none" stroke="#0D9488" stroke-width="1.2" opacity="0.35"/>
  <path d="M730,430 L750,418 L770,430 L770,454 L750,466 L730,454 Z" fill="none" stroke="#0D9488" stroke-width="1.2" opacity="0.35"/>
  <path d="M770,430 L790,418 L810,430 L810,454 L790,466 L770,454 Z" fill="none" stroke="#0D9488" stroke-width="1.8" opacity="0.55"/>
  <line x1="110" y1="32" x2="730" y2="32" stroke="#0D9488" stroke-width="1" opacity="0.25"/>
  <line x1="110" y1="442" x2="730" y2="442" stroke="#0D9488" stroke-width="1" opacity="0.25"/>
  <line x1="30" y1="56" x2="30" y2="430" stroke="#0D9488" stroke-width="1" opacity="0.20"/>
  <line x1="810" y1="56" x2="810" y2="430" stroke="#0D9488" stroke-width="1" opacity="0.20"/>
  <circle cx="50" cy="32" r="3.5" fill="#0D9488" opacity="0.60"/>
  <circle cx="90" cy="32" r="2.5" fill="#0D9488" opacity="0.40"/>
  <circle cx="750" cy="32" r="2.5" fill="#0D9488" opacity="0.40"/>
  <circle cx="790" cy="32" r="3.5" fill="#0D9488" opacity="0.60"/>
  <circle cx="50" cy="442" r="3.5" fill="#0D9488" opacity="0.60"/>
  <circle cx="90" cy="442" r="2.5" fill="#0D9488" opacity="0.40"/>
  <circle cx="750" cy="442" r="2.5" fill="#0D9488" opacity="0.40"/>
  <circle cx="790" cy="442" r="3.5" fill="#0D9488" opacity="0.60"/>
  <circle cx="420" cy="32" r="2" fill="#D97706" opacity="0.50"/>
  <circle cx="420" cy="442" r="2" fill="#D97706" opacity="0.50"/>
  <path d="M380,32 L400,24 L420,32 L420,44 L400,52 L380,44 Z" fill="none" stroke="#D97706" stroke-width="0.8" opacity="0.30"/>
  <path d="M380,430 L400,418 L420,430 L420,454 L400,466 L380,454 Z" fill="none" stroke="#D97706" stroke-width="0.8" opacity="0.30"/>
</svg>```.text

// Bond divider SVG — molecular bond separator with alternating single/double lines and atom nodes
#let _bond-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <circle cx="6" cy="6" r="4" fill="#0D9488" opacity="0.7"/>
  <line x1="10" y1="6" x2="60" y2="6" stroke="#334155" stroke-width="1.5" opacity="0.5"/>
  <circle cx="60" cy="6" r="2.5" fill="#334155" opacity="0.5"/>
  <line x1="63" y1="4" x2="110" y2="4" stroke="#0D9488" stroke-width="1" opacity="0.5"/>
  <line x1="63" y1="8" x2="110" y2="8" stroke="#0D9488" stroke-width="1" opacity="0.5"/>
  <circle cx="110" cy="6" r="3" fill="#0D9488" opacity="0.6"/>
  <line x1="113" y1="6" x2="150" y2="6" stroke="#334155" stroke-width="1.5" opacity="0.5"/>
  <circle cx="150" cy="6" r="3.5" fill="#D97706" opacity="0.65"/>
  <line x1="154" y1="6" x2="190" y2="6" stroke="#334155" stroke-width="1.5" opacity="0.5"/>
  <circle cx="190" cy="6" r="3" fill="#0D9488" opacity="0.6"/>
  <line x1="193" y1="4" x2="240" y2="4" stroke="#0D9488" stroke-width="1" opacity="0.5"/>
  <line x1="193" y1="8" x2="240" y2="8" stroke="#0D9488" stroke-width="1" opacity="0.5"/>
  <circle cx="240" cy="6" r="2.5" fill="#334155" opacity="0.5"/>
  <line x1="243" y1="6" x2="294" y2="6" stroke="#334155" stroke-width="1.5" opacity="0.5"/>
  <circle cx="294" cy="6" r="4" fill="#0D9488" opacity="0.7"/>
</svg>```.text

// Crystal accent SVG — small cluster of 3-4 hexagons for corner decorations
#let _crystal-accent-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="70" viewBox="0 0 80 70">
  <path d="M20,10 L35,2 L50,10 L50,26 L35,34 L20,26 Z" fill="#0D9488" fill-opacity="0.06" stroke="#0D9488" stroke-width="1" opacity="0.45"/>
  <path d="M50,10 L65,2 L80,10 L80,26 L65,34 L50,26 Z" fill="none" stroke="#0D9488" stroke-width="0.8" opacity="0.35"/>
  <path d="M5,26 L20,18 L35,26 L35,42 L20,50 L5,42 Z" fill="none" stroke="#334155" stroke-width="0.8" opacity="0.30"/>
  <path d="M35,26 L50,18 L65,26 L65,42 L50,50 L35,42 Z" fill="#0D9488" fill-opacity="0.04" stroke="#0D9488" stroke-width="1" opacity="0.40"/>
  <circle cx="35" cy="10" r="2.5" fill="#0D9488" opacity="0.55"/>
  <circle cx="50" cy="26" r="2" fill="#0D9488" opacity="0.45"/>
  <circle cx="20" cy="26" r="2" fill="#334155" opacity="0.40"/>
  <circle cx="65" cy="10" r="1.5" fill="#0D9488" opacity="0.35"/>
  <circle cx="35" cy="42" r="2" fill="#D97706" opacity="0.45"/>
  <line x1="35" y1="10" x2="50" y2="26" stroke="#0D9488" stroke-width="0.8" opacity="0.30"/>
  <line x1="50" y1="26" x2="35" y2="42" stroke="#0D9488" stroke-width="0.8" opacity="0.25"/>
  <line x1="20" y1="26" x2="35" y2="42" stroke="#334155" stroke-width="0.6" opacity="0.25"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render hexagonal mesh background
#let _hex-mesh-bg() = {
  image(bytes(_hex-mesh-bg-svg), width: 100%, height: 100%)
}

/// Render lattice frame overlay (bookend element for title/ending)
#let _lattice-frame() = {
  image(bytes(_lattice-frame-svg), width: 100%, height: 100%)
}

/// Render bond divider
#let _bond-divider-graphic(color: palette.primary, width: 100%) = {
  let svg = _bond-divider-svg.replace("#0D9488", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 10pt))
}

/// Render crystal accent decoration
#let _crystal-accent-graphic(size: 50pt) = {
  box(width: size, image(bytes(_crystal-accent-svg), width: size))
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides — hex mesh + corner crystal accents
#let _content-atmosphere() = {
  // Faint hexagonal mesh across entire slide
  place(top + left, box(width: 100%, height: 100%, _hex-mesh-bg()))
  // Corner crystal accents
  place(top + right, dx: -0.8em, dy: 0.5em, _crystal-accent-graphic(size: 40pt))
  place(bottom + left, dx: 0.8em, dy: -0.5em, _crystal-accent-graphic(size: 35pt))
  // Small node dots
  place(top + left, dx: 1.8em, dy: 1.2em,
    circle(radius: 2.5pt, fill: palette.primary.transparentize(70%)))
  place(bottom + right, dx: -1.8em, dy: -1.2em,
    circle(radius: 2pt, fill: palette.accent.transparentize(75%)))
}


// === 1. Slide Functions ===

/// Standard content slide — light bg, hex mesh atmosphere, teal/slate accents
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.6em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.secondary, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Bond divider under title
      _bond-divider-graphic(width: 160pt),
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
        // Teal hexagon node
        box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    _content-atmosphere()
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

/// Title slide — lattice frame (bookend), hex mesh background, centered content
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Hexagonal mesh background
    place(top + left, box(width: 100%, height: 100%, _hex-mesh-bg()))
    // Lattice frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, _lattice-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.secondary, info.title),
        std.align(center, _bond-divider-graphic(width: 220pt)),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.primary.darken(18%), weight: "medium", info.subtitle)
        },
        if info.author != none {
          text(size: 1em, fill: palette.text, weight: "regular", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-muted, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.accent.darken(20%))[#utils.display-info-date(self)]
        },
      )
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

/// New section slide — left teal accent bar, section title, hex decoration
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
    // Hex mesh background
    place(top + left, box(width: 100%, height: 100%, _hex-mesh-bg()))
    // Left accent bar — teal
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Right side crystal accent
    place(top + right, dx: -2em, dy: 2em, _crystal-accent-graphic(size: 55pt))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      #stack(
        spacing: .8em,
        text(size: 3.5em, fill: palette.primary, weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        _bond-divider-graphic(width: 140pt),
        {
          set text(fill: palette.secondary, size: 2em, weight: "semibold")
          utils.display-current-heading(level: 1, numbered: false)
        },
      )
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.primary.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — dark slate background, teal glowing text
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
    // Dark slate background
    place(top + left, block(width: 100%, height: 100%, fill: palette.secondary))
    // Hex mesh (visible faintly on dark)
    place(top + left, box(width: 100%, height: 100%, _hex-mesh-bg()))
    // Corner nodes
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.primary.transparentize(30%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.accent.transparentize(40%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.accent.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.primary.transparentize(30%)))
    // Center content stays in flow so the slide has meaningful measured height.
    std.align(center + horizon,
      block(width: 72%, height: auto,
        align(center)[
          #set text(fill: palette.primary-light, size: 1.4em, weight: "bold")
          #stack(
            spacing: .8em,
            body,
            _bond-divider-graphic(width: 180pt),
          )
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light bg with lattice frame (bookend), hex mesh, farewell
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
    // Hex mesh
    place(top + left, box(width: 100%, height: 100%, _hex-mesh-bg()))
    // Lattice frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, _lattice-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        _bond-divider-graphic(width: 200pt),
        text(size: 2.4em, weight: "bold", fill: palette.secondary, body),
        block(width: 5em, height: 3pt, fill: palette.primary, radius: 1.5pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// hex-card — card with hexagonal pattern top border
#let hex-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.55em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        {
          box(width: 10pt, height: 10pt,
            place(center + horizon,
              polygon(
                fill: accent,
                (5pt, 0pt), (10pt, 3pt), (10pt, 7pt), (5pt, 10pt), (0pt, 7pt), (0pt, 3pt)
              )
            )
          )
        },
        text(weight: "semibold", fill: palette.text, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}

/// molecule-box — insight box with bond-line left decoration
#let molecule-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.75em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        stack(spacing: .8em,
          circle(radius: 2.5pt, fill: accent),
          circle(radius: 1.5pt, fill: accent.transparentize(40%)),
          circle(radius: 2.5pt, fill: accent),
        ),
        text(weight: "semibold", fill: palette.secondary, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}

/// node-stat — metric display centered with node styling
#let node-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #std.align(center + horizon)[
      #stack(
        spacing: .8em,
        box(width: 10pt, height: 10pt)[
          #place(center + horizon, circle(radius: 4.5pt, stroke: 1pt + color.transparentize(35%)))
          #place(center + horizon, circle(radius: 1.8pt, fill: color))
        ],
        text(fill: color.darken(20%), size: 1.3em, weight: "semibold", value),
        text(fill: palette.text-muted, size: 0.72em, label),
        lazy-v(1fr),
      )
    ]
  ]
}

/// lattice-quote — quote with crystalline border accent
#let lattice-quote(body, attribution: none) = {
  block(
    width: 100%,
    fill: palette.bg.darken(2%),
    stroke: (left: 3pt + palette.primary, rest: 1pt + palette.border),
    inset: (x: 1.4em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text, size: 0.88em, style: "italic")
        body
      },
      if attribution != none {
        text(fill: palette.text-muted, size: 0.75em, style: "normal", weight: "medium")[-- #attribution]
      },
    )
    // Corner node decoration
    #place(top + right, dx: -8pt, dy: 4pt,
      circle(radius: 2pt, fill: palette.primary.transparentize(50%)))
    #place(bottom + right, dx: -12pt, dy: -4pt,
      circle(radius: 1.5pt, fill: palette.primary.transparentize(60%)))
    #lazy-v(1fr)
  ]
}

/// atom-tag — small circular tag with orbital ring
#let atom-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      // Orbital ring with center dot
      {
        box(width: 8pt, height: 8pt)[
          #place(center + horizon, circle(radius: 4pt, stroke: 0.6pt + color))
          #place(center + horizon, circle(radius: 1.5pt, fill: color))
        ]
      },
      text(fill: color.darken(20%), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// bond-divider — molecular bond separator line component
#let bond-divider(color: palette.primary, width: 80%) = {
  std.align(center, box(width: width, _bond-divider-graphic(color: color, width: 100%)))
}

/// mesh-card — card with full hexagonal mesh background pattern
#let mesh-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 0.75em),
    radius: 6pt,
    clip: true,
  )[
    // Subtle hex pattern in background
    #place(top + right, dx: 1em, dy: -0.5em, _crystal-accent-graphic(size: 45pt))
    #stack(
      spacing: .8em,
      text(weight: "semibold", fill: palette.secondary, size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(30%), radius: 1pt),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}

/// structure-box — large box with connected-hex border styling
#let structure-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (
      top: 3pt + accent,
      bottom: 3pt + palette.primary,
      left: 1pt + palette.border,
      right: 1pt + palette.border,
    ),
    inset: (x: 1.4em, y: 0.8em),
    radius: 0pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        {
          box(width: 12pt, height: 12pt,
            place(center + horizon,
              polygon(
                stroke: 1pt + accent,
                fill: accent.lighten(85%),
                (6pt, 0pt), (12pt, 3pt), (12pt, 9pt), (6pt, 12pt), (0pt, 9pt), (0pt, 3pt)
              )
            )
          )
        },
        text(weight: "semibold", fill: accent.darken(15%), size: 0.95em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}

/// electron-list — scoped standard list with an orbital marker
#let electron-list(body, color: palette.primary) = {
  let marker = box(width: 8pt, height: 8pt)[
    #place(center + horizon, circle(radius: 4pt, stroke: 0.8pt + color))
    #place(center + horizon, circle(radius: 1.5pt, fill: palette.accent))
  ]
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.55em),
    radius: 4pt,
  )[
    #set list(marker: marker, spacing: 3pt)
    #set text(fill: palette.text, size: 0.76em)
    #body
    #lazy-v(1fr)
  ]
}


// === 3. Theme Entry Point ===

#let hexagon-mesh-theme(
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
      primary: palette.primary.darken(18%),
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
