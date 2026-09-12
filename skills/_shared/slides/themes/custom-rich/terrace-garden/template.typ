// Terrace Garden Theme -- Mediterranean Villa Terrace Aesthetic
// You are standing on a sun-warmed limestone terrace overlooking a Tuscan hillside.
// Terracotta planters overflow with herbs, olive branches cast dappled shadows,
// classical columns frame the view, and warm afternoon light pools on ancient stone.
// Features: persistent stone texture atmosphere, olive branch corners, arch motifs,
// terracotta accents, botanical SVG decorations, warm academic palette.
// Touying 0.7.4 compatible. Rich tier.

#import "@preview/touying:0.7.4": *


// === Color Palette (Warm Mediterranean Light) ===

#let palette = (
  primary: rgb("#7B6B4E"),         // warm olive/stone
  secondary: rgb("#C17040"),       // terracotta accent
  tertiary: rgb("#6B8E5A"),        // olive green
  bg: rgb("#FDF8F3"),              // warm limestone white
  card: rgb("#FFFFFF"),            // card white
  text-dark: rgb("#3D3226"),       // rich earth brown
  text-body: rgb("#5C4E3E"),       // warm dark brown
  text-light: rgb("#8B7B68"),      // faded stone caption
  border: rgb("#E5D9C8"),          // sandstone border
  stone: rgb("#F0E8DC"),           // light sandstone fill
  sand: rgb("#E8DFD2"),            // warm sand
  gold: rgb("#B8964A"),            // aged gold accent
)


// === SVG Definitions (Complex, 8+ elements each) ===

// Olive branch -- botanical element with leaves and small olives
// Used in corners of content slides as persistent atmosphere
#let _olive-branch-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="180" height="160" viewBox="0 0 180 160">

  <path d="M10,140 C30,120 50,105 70,90 C90,75 110,60 135,45 C150,36 165,28 175,20" fill="none" stroke="currentColor" stroke-width="1.8" opacity="0.25" stroke-linecap="round"/>

  <path d="M70,90 C80,95 90,100 100,108" fill="none" stroke="currentColor" stroke-width="1" opacity="0.18" stroke-linecap="round"/>

  <ellipse cx="45" cy="112" rx="8" ry="4" fill="currentColor" opacity="0.12" transform="rotate(-35,45,112)"/>
  <ellipse cx="55" cy="118" rx="7" ry="3.5" fill="currentColor" opacity="0.10" transform="rotate(25,55,118)"/>

  <ellipse cx="75" cy="82" rx="9" ry="4" fill="currentColor" opacity="0.14" transform="rotate(-40,75,82)"/>
  <ellipse cx="85" cy="88" rx="8" ry="3.5" fill="currentColor" opacity="0.11" transform="rotate(20,85,88)"/>

  <ellipse cx="110" cy="58" rx="9" ry="4.5" fill="currentColor" opacity="0.13" transform="rotate(-30,110,58)"/>
  <ellipse cx="120" cy="64" rx="8" ry="3.5" fill="currentColor" opacity="0.10" transform="rotate(30,120,64)"/>

  <ellipse cx="145" cy="38" rx="8" ry="3.5" fill="currentColor" opacity="0.12" transform="rotate(-25,145,38)"/>
  <ellipse cx="155" cy="32" rx="7" ry="3" fill="currentColor" opacity="0.09" transform="rotate(35,155,32)"/>

  <ellipse cx="62" cy="98" rx="3.5" ry="4.5" fill="currentColor" opacity="0.15" transform="rotate(10,62,98)"/>
  <ellipse cx="100" cy="70" rx="3" ry="4" fill="currentColor" opacity="0.13" transform="rotate(-5,100,70)"/>
  <ellipse cx="138" cy="42" rx="2.5" ry="3.5" fill="currentColor" opacity="0.11"/>
</svg>```.text

// Stone texture -- full page subtle limestone grain pattern
// Used as persistent background on every content slide
#let _stone-texture-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">

  <circle cx="120" cy="80" r="1.2" fill="currentColor" opacity="0.03"/>
  <circle cx="340" cy="150" r="0.8" fill="currentColor" opacity="0.025"/>
  <circle cx="560" cy="60" r="1" fill="currentColor" opacity="0.02"/>
  <circle cx="700" cy="200" r="1.3" fill="currentColor" opacity="0.03"/>
  <circle cx="200" cy="300" r="0.9" fill="currentColor" opacity="0.025"/>
  <circle cx="450" cy="380" r="1.1" fill="currentColor" opacity="0.02"/>
  <circle cx="650" cy="420" r="0.7" fill="currentColor" opacity="0.03"/>
  <circle cx="80" cy="400" r="1" fill="currentColor" opacity="0.025"/>

  <path d="M50,120 C80,118 110,122 140,119" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.025"/>
  <path d="M400,250 C430,248 460,252 490,249" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.02"/>
  <path d="M600,350 C630,348 660,353 690,350" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.025"/>
  <path d="M250,450 C280,447 310,451 340,448" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.02"/>

  <ellipse cx="180" cy="180" rx="15" ry="8" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.02"/>
  <ellipse cx="500" cy="100" rx="12" ry="6" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.018"/>
  <ellipse cx="720" cy="320" rx="18" ry="9" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.02"/>

  <circle cx="300" cy="50" r="0.5" fill="currentColor" opacity="0.035"/>
  <circle cx="150" cy="250" r="0.6" fill="currentColor" opacity="0.03"/>
  <circle cx="420" cy="200" r="0.4" fill="currentColor" opacity="0.025"/>
  <circle cx="580" cy="440" r="0.5" fill="currentColor" opacity="0.03"/>
  <circle cx="760" cy="130" r="0.6" fill="currentColor" opacity="0.025"/>
</svg>```.text

// Terracotta planter ornament -- decorative urn/pot shape
// Used on stat cards and decorative elements
#let _planter-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="70" viewBox="0 0 60 70">

  <ellipse cx="30" cy="12" rx="22" ry="5" fill="currentColor" opacity="0.20"/>
  <rect x="10" y="8" width="40" height="8" rx="2" fill="currentColor" opacity="0.15"/>

  <path d="M12,16 L10,55 C10,60 15,65 30,65 C45,65 50,60 50,55 L48,16" fill="currentColor" opacity="0.10"/>

  <rect x="14" y="28" width="32" height="3" rx="1" fill="currentColor" opacity="0.08"/>
  <rect x="16" y="34" width="28" height="2" rx="1" fill="currentColor" opacity="0.06"/>

  <ellipse cx="30" cy="65" rx="16" ry="4" fill="currentColor" opacity="0.12"/>

  <path d="M25,8 C22,2 28,-2 32,4 C29,6 26,7 25,8" fill="currentColor" opacity="0.18"/>
  <path d="M33,6 C36,0 40,2 38,8 C36,7 34,6 33,6" fill="currentColor" opacity="0.14"/>
</svg>```.text

// Mediterranean tile pattern -- geometric decorative border
// Used as divider element
#let _tile-pattern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="20" viewBox="0 0 400 20">

  <rect x="10" y="5" width="10" height="10" fill="currentColor" opacity="0.12" transform="rotate(45,15,10)"/>
  <circle cx="40" cy="10" r="2" fill="currentColor" opacity="0.10"/>
  <rect x="55" y="5" width="10" height="10" fill="currentColor" opacity="0.10" transform="rotate(45,60,10)"/>
  <circle cx="85" cy="10" r="2" fill="currentColor" opacity="0.08"/>
  <rect x="100" y="5" width="10" height="10" fill="currentColor" opacity="0.12" transform="rotate(45,105,10)"/>
  <circle cx="130" cy="10" r="2" fill="currentColor" opacity="0.10"/>
  <rect x="145" y="5" width="10" height="10" fill="currentColor" opacity="0.10" transform="rotate(45,150,10)"/>
  <circle cx="175" cy="10" r="2" fill="currentColor" opacity="0.08"/>
  <rect x="190" y="5" width="10" height="10" fill="currentColor" opacity="0.12" transform="rotate(45,195,10)"/>
  <circle cx="220" cy="10" r="2" fill="currentColor" opacity="0.10"/>
  <rect x="235" y="5" width="10" height="10" fill="currentColor" opacity="0.10" transform="rotate(45,240,10)"/>
  <circle cx="265" cy="10" r="2" fill="currentColor" opacity="0.08"/>
  <rect x="280" y="5" width="10" height="10" fill="currentColor" opacity="0.12" transform="rotate(45,285,10)"/>
  <circle cx="310" cy="10" r="2" fill="currentColor" opacity="0.10"/>
  <rect x="325" y="5" width="10" height="10" fill="currentColor" opacity="0.10" transform="rotate(45,330,10)"/>
  <circle cx="355" cy="10" r="2" fill="currentColor" opacity="0.08"/>
  <rect x="370" y="5" width="10" height="10" fill="currentColor" opacity="0.12" transform="rotate(45,375,10)"/>
  <circle cx="395" cy="10" r="2" fill="currentColor" opacity="0.10"/>
</svg>```.text

// Arch and column motif -- classical architectural element
// Used as bookending decoration on title and ending slides
#let _arch-columns-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="340" viewBox="0 0 400 340">

  <rect x="55" y="80" width="16" height="240" fill="currentColor" opacity="0.08"/>
  <rect x="52" y="75" width="22" height="8" rx="2" fill="currentColor" opacity="0.12"/>
  <rect x="50" y="68" width="26" height="8" rx="2" fill="currentColor" opacity="0.10"/>
  <rect x="52" y="316" width="22" height="8" rx="2" fill="currentColor" opacity="0.12"/>
  <rect x="50" y="322" width="26" height="10" rx="2" fill="currentColor" opacity="0.10"/>

  <line x1="58" y1="85" x2="58" y2="315" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
  <line x1="63" y1="85" x2="63" y2="315" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
  <line x1="68" y1="85" x2="68" y2="315" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>

  <rect x="329" y="80" width="16" height="240" fill="currentColor" opacity="0.08"/>
  <rect x="326" y="75" width="22" height="8" rx="2" fill="currentColor" opacity="0.12"/>
  <rect x="324" y="68" width="26" height="8" rx="2" fill="currentColor" opacity="0.10"/>
  <rect x="326" y="316" width="22" height="8" rx="2" fill="currentColor" opacity="0.12"/>
  <rect x="324" y="322" width="26" height="10" rx="2" fill="currentColor" opacity="0.10"/>

  <line x1="332" y1="85" x2="332" y2="315" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
  <line x1="337" y1="85" x2="337" y2="315" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
  <line x1="342" y1="85" x2="342" y2="315" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>

  <path d="M71,80 C71,30 200,5 200,5 C200,5 329,30 329,80" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.12" stroke-linecap="round"/>
  <path d="M75,78 C75,35 200,12 200,12 C200,12 325,35 325,78" fill="none" stroke="currentColor" stroke-width="1" opacity="0.08"/>

  <polygon points="193,8 207,8 210,18 190,18" fill="currentColor" opacity="0.10"/>

  <circle cx="200" cy="40" r="8" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.07"/>
  <circle cx="200" cy="40" r="4" fill="currentColor" opacity="0.05"/>

  <path d="M50,72 C48,66 52,62 56,66 C54,68 52,70 50,72" fill="currentColor" opacity="0.08"/>
  <path d="M76,72 C78,66 74,62 70,66 C72,68 74,70 76,72" fill="currentColor" opacity="0.08"/>
  <path d="M324,72 C322,66 326,62 330,66 C328,68 326,70 324,72" fill="currentColor" opacity="0.08"/>
  <path d="M350,72 C352,66 348,62 344,66 C346,68 348,70 350,72" fill="currentColor" opacity="0.08"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render stone texture background
#let _stone-bg(color: palette.primary) = {
  let svg = _stone-texture-svg.replace("currentColor", color.to-hex())
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(svg), width: 100%, height: 100%, fit: "cover")))
}

/// Render olive branch (top-right corner, flipped for top-left)
#let _olive-corner(color: palette.tertiary, width: 130pt) = {
  let svg = _olive-branch-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}

/// Render arch-columns decoration
#let _arch-decoration(color: palette.primary, width: 320pt) = {
  let svg = _arch-columns-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}

/// Render terracotta planter
#let _planter-icon(color: palette.secondary, width: 36pt) = {
  let svg = _planter-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}


// === Background Atmosphere (MANDATORY on every content slide) ===

/// Persistent Mediterranean terrace feeling: subtle stone texture + olive branch corners
#let _bg-atmosphere() = {
  // Stone texture across full page
  _stone-bg(color: palette.primary)
  // Olive branch in top-right corner
  place(top + right, dx: -0.5em, dy: 0.3em,
    _olive-corner(color: palette.tertiary, width: 110pt))
  // Mirrored smaller olive element bottom-left
  place(bottom + left, dx: 0.8em, dy: -0.5em,
    rotate(180deg, _olive-corner(color: palette.tertiary, width: 80pt)))
}


// === 1. Slide Functions ===

/// Standard content slide -- warm header with terracotta accent line
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2.2em, top: 0.8em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Terracotta accent line -- warm and grounding
      block(width: 55pt, height: 2pt, fill: palette.secondary.transparentize(30%), radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2.2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Small terracotta diamond as center marker
        rotate(45deg, square(size: 4pt, fill: palette.secondary.transparentize(50%)))
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
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

/// Title slide -- classical arch frame, warm stone, Mediterranean grandeur
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm limestone background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Stone texture
    _stone-bg(color: palette.primary)
    // Arch and columns decoration (bookending element -- NOT on content slides)
    place(center + horizon,
      _arch-decoration(color: palette.primary, width: 380pt))
    // Olive branches at top corners
    place(top + right, dx: -1em, dy: 0.5em,
      _olive-corner(color: palette.tertiary, width: 140pt))
    place(top + left, dx: 1em, dy: 0.5em,
      scale(x: -100%, _olive-corner(color: palette.tertiary, width: 140pt)))
    // Center content
    set std.align(center + horizon)
    pad(x: 6em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "semibold", fill: palette.text-dark, info.title),
        std.align(center, block(width: 70pt, height: 2.5pt, fill: palette.secondary.transparentize(20%), radius: 1pt)),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.text-body, info.subtitle)
        },
        stack(
          spacing: .8em,
          if info.author != none {
            text(size: 0.9em, fill: palette.text-light, info.author)
          },
          if info.institution != none {
            text(size: 0.78em, fill: palette.text-light.transparentize(20%), info.institution)
          },
          if info.date != none {
            text(size: 0.72em, fill: palette.text-light.transparentize(30%))[#utils.display-info-date(self)]
          },
        ),
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// New section slide -- warm stone with section name and olive accent
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Limestone background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Stone texture
    _stone-bg(color: palette.primary)
    // Olive branch accent
    place(bottom + right, dx: -1.5em, dy: -1em,
      _olive-corner(color: palette.tertiary, width: 150pt))
    // Keep section content in measured flow while preserving the left-centered composition.
    set std.align(left + horizon)
    block(width: 80%, inset: (left: 5em, right: 4em))[
      #stack(
        spacing: .8em,
        text(size: 3.5em, fill: palette.primary.transparentize(60%), weight: "light")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        {
          set text(fill: palette.text-dark, size: 1.9em, weight: "medium")
          utils.display-current-heading(level: 1, numbered: false)
        },
        block(width: 50pt, height: 2.5pt, fill: palette.secondary.transparentize(20%), radius: 1pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline slide -- table of contents with stone styling
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
    // Stone texture
    _stone-bg(color: palette.primary)
    // Olive branch corner
    place(top + right, dx: -1em, dy: 0.5em,
      _olive-corner(color: palette.tertiary, width: 100pt))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "semibold", fill: palette.text-dark)
        title
      },
      block(width: 55pt, height: 2.5pt, fill: palette.secondary.transparentize(20%), radius: 1pt),
      {
        set text(size: 1.1em, fill: palette.text-body)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- warm contemplative, centered text on stone
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Slightly warmer background
    place(top + left, block(width: 100%, height: 100%, fill: palette.stone))
    // Stone texture
    _stone-bg(color: palette.primary)
    // Olive branches framing
    place(top + right, dx: -1em, dy: 0.5em,
      _olive-corner(color: palette.tertiary, width: 100pt))
    place(bottom + left, dx: 1em, dy: -0.5em,
      rotate(180deg, _olive-corner(color: palette.tertiary, width: 100pt)))
    // Keep focal content in measured flow so the slide is not diagnostically empty.
    set std.align(center + horizon)
    block(width: 70%, inset: (x: 2em, y: 1.5em))[
      #set std.align(center)
      #set text(fill: palette.text-dark, size: 1.3em, weight: "medium")
      #stack(
        spacing: .8em,
        body,
        rotate(45deg, square(size: 6pt, fill: palette.secondary.transparentize(30%))),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- bookends with title: arch frame + columns (NOT on content slides)
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Limestone background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Stone texture
    _stone-bg(color: palette.primary)
    // Arch and columns (bookends with title slide)
    place(center + horizon,
      _arch-decoration(color: palette.primary, width: 380pt))
    // Olive branches at top corners (bookends with title)
    place(top + right, dx: -1em, dy: 0.5em,
      _olive-corner(color: palette.tertiary, width: 140pt))
    place(top + left, dx: 1em, dy: 0.5em,
      scale(x: -100%, _olive-corner(color: palette.tertiary, width: 140pt)))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "medium", fill: palette.text-dark, body),
        std.align(center, block(width: 55pt, height: 2.5pt, fill: palette.secondary.transparentize(20%), radius: 1pt)),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components (10+ with structural diversity) ===

/// Stone card -- limestone-textured card with arch-top accent stripe
#let stone-card(title, body, accent: palette.primary) = {
  block(width: 100%)[
    #stack(spacing: 0pt,
      // Arch-top accent header
      block(
        width: 100%,
        fill: accent.transparentize(88%),
        inset: (x: 1.2em, y: 0.5em),
        radius: (top: 8pt),
        stroke: (top: 2pt + accent.transparentize(50%), left: 0.5pt + palette.border, right: 0.5pt + palette.border),
      )[
        #text(weight: "medium", fill: accent, size: 0.88em, title)
      ],
      // Body
      block(
        width: 100%,
        fill: palette.card,
        inset: (x: 1.2em, y: 0.65em),
        radius: (bottom: 8pt),
        stroke: (bottom: 0.5pt + palette.border, left: 0.5pt + palette.border, right: 0.5pt + palette.border),
      )[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
      ],
    )
    #lazy-v(1fr)
  ]
}

/// Terrace box -- warm bordered box with terracotta left accent line
#let terrace-box(title, body) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (left: 3pt + palette.secondary.transparentize(30%), rest: 0.5pt + palette.border),
    inset: (x: 1.2em, y: 0.5em),
    radius: (right: 6pt),
  )[
    #stack(spacing: .8em,
      text(weight: "medium", fill: palette.text-dark, size: 0.88em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Olive quote -- quotation with olive branch SVG ornament
#let olive-quote(body, attribution) = {
  block(width: 100%, inset: (x: 1.5em, y: 0.6em))[
    #set std.align(left)
    #stack(
      spacing: .8em,
      _olive-corner(color: palette.tertiary, width: 45pt),
      {
        set text(fill: palette.text-dark, size: 0.92em, style: "italic")
        body
      },
      text(fill: palette.secondary, size: 0.75em, weight: "medium", style: "normal")[-- #attribution],
    )
  ]
}

/// Garden tag -- small inline tag/badge with leaf-like shape
#let garden-tag(label, color: palette.tertiary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 0.5pt + color.transparentize(50%),
    inset: (x: 0.6em, y: 0.2em),
    radius: 10pt,
  )[
    #set text(fill: color.darken(10%), size: 0.7em, weight: "medium")
    #sym.diamond.filled #label
  ]
}

/// Mosaic divider -- SVG Mediterranean tile pattern divider
#let mosaic-divider(color: palette.secondary, width: 85%) = {
  let svg = _tile-pattern-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 12pt)))
}

/// Arch card -- card with architectural arch-shaped header background
#let arch-card(title, body, accent: palette.primary) = {
  block(width: 100%)[
    #stack(spacing: 0pt,
      // Arch header with curved bottom
      block(
        width: 100%,
        fill: accent.transparentize(85%),
        inset: (x: 1.2em, y: 0.55em),
        radius: (top: 12pt),
        stroke: (top: 1.5pt + accent.transparentize(40%), left: 0.5pt + palette.border, right: 0.5pt + palette.border),
      )[
        #set std.align(center)
        #text(weight: "semibold", fill: accent.darken(10%), size: 0.88em, title)
      ],
      // Body section
      block(
        width: 100%,
        fill: palette.card,
        inset: (x: 1.2em, y: 0.65em),
        radius: (bottom: 6pt),
        stroke: (bottom: 0.5pt + palette.border, left: 0.5pt + palette.border, right: 0.5pt + palette.border),
      )[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
      ],
    )
    #lazy-v(1fr)
  ]
}

/// Timeline point -- timeline marker with stone dot and year
#let timeline-point(year, body) = {
  cols(
    columns: (auto, 1fr),
    column-gutter: 12pt,
    // Left: stone dot + vertical line
    {
      set std.align(center)
      stack(spacing: .8em,
        circle(radius: 5pt, fill: palette.secondary.transparentize(30%)),
        block(width: 1.5pt, height: 12pt, fill: palette.border),
      )
    },
    // Right: year + content
    {
      stack(spacing: .8em,
        text(weight: "semibold", fill: palette.secondary, size: 0.82em, year),
        {
          set text(fill: palette.text-body, size: 0.8em)
          body
        },
      )
    },
  )
}

/// Stat card -- metric display with terracotta planter SVG above
#let stat-card(value, label, accent: palette.secondary) = {
  block(width: 100%, fill: palette.card, inset: (x: 0.7em, y: 0.55em), radius: 8pt, stroke: 0.5pt + palette.border)[
    #set std.align(center)
    #stack(
      spacing: .8em,
      _planter-icon(color: accent, width: 24pt),
      text(fill: accent, size: 1.5em, weight: "bold", value),
      text(fill: palette.text-light, size: 0.72em, label),
      lazy-v(1fr),
    )
  ]
}

/// Comparison table -- sandstone-styled academic table
#let comparison-table(align: center + horizon, headers, ..rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.stone }
      else if calc.odd(row) { palette.bg } else { palette.card },
    stroke: 0.5pt + palette.border,
    inset: 10pt,
    align: align,
    table.header(..headers.map(h => text(weight: "semibold", fill: palette.text-dark, size: 0.82em, h))),
    ..rows.pos().flatten().map(c => text(fill: palette.text-body, size: 0.78em, c)),
  )
}

/// Column box -- content box with pillar/column side decoration
#let column-box(title, body) = {
  block(
    width: 100%,
    inset: (left: 12pt, y: 0.3em),
    stroke: (left: 4pt + palette.primary.transparentize(65%)),
  )[
    #stack(
      spacing: .8em,
      text(weight: "medium", fill: palette.primary, size: 0.88em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Inscription -- stone inscription style (engraved text feel)
#let inscription(body) = {
  block(
    width: 100%,
    fill: palette.stone,
    inset: (x: 1.5em, y: 1em),
    radius: 4pt,
    stroke: 1pt + palette.border,
  )[
    #set std.align(center)
    #set text(
      fill: palette.text-dark.transparentize(20%),
      size: 0.88em,
      weight: "medium",
      tracking: 0.5pt,
    )
    #smallcaps(body)
  ]
}


// === 3. Theme Entry Point ===

#let terrace-garden-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 2em, x: 2.2em),
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
