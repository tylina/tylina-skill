// Atlas Trade Theme — World trade routes and cartographic design
// Light parchment backgrounds with deep navy text, ocean blue primary, warm amber/gold secondary
// Features: mercator projection grids, compass roses, trade route curves, port markers, rhumb lines
// Perfect for strategic presentations, global perspectives, research overviews
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FAF7F2"),
  primary: rgb("#1B4F72"),
  secondary: rgb("#996515"),
  secondary-light: rgb("#D4A03C"),
  accent-copper: rgb("#B87333"),
  text: rgb("#1B2631"),
  text-muted: rgb("#5D6D7E"),
  card-bg: rgb("#FFFFFF"),
  parchment: rgb("#F5F0E8"),
  ocean-light: rgb("#D6EAF8"),
  navy-deep: rgb("#0D2F4F"),
  border: rgb("#D5DBDB"),
  rose-red: rgb("#C0392B"),
)


// ═══ SVG Definitions ═══

// Full-page Mercator projection grid — latitude/longitude lines curving subtly
#let _mercator-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M0,79 C210,76 420,76 630,79 L840,79" fill="none" stroke="#1B4F72" stroke-width="0.5" opacity="0.08"/>
  <path d="M0,158 C210,154 420,154 630,158 L840,158" fill="none" stroke="#1B4F72" stroke-width="0.5" opacity="0.10"/>
  <path d="M0,237 C210,237 420,237 630,237 L840,237" fill="none" stroke="#1B4F72" stroke-width="0.6" opacity="0.12"/>
  <path d="M0,316 C210,320 420,320 630,316 L840,316" fill="none" stroke="#1B4F72" stroke-width="0.5" opacity="0.10"/>
  <path d="M0,395 C210,398 420,398 630,395 L840,395" fill="none" stroke="#1B4F72" stroke-width="0.5" opacity="0.08"/>
  <path d="M140,0 C138,118 138,237 140,355 L140,474" fill="none" stroke="#1B4F72" stroke-width="0.4" opacity="0.07"/>
  <path d="M280,0 C278,118 278,237 280,355 L280,474" fill="none" stroke="#1B4F72" stroke-width="0.4" opacity="0.09"/>
  <path d="M420,0 C420,118 420,237 420,355 L420,474" fill="none" stroke="#1B4F72" stroke-width="0.5" opacity="0.11"/>
  <path d="M560,0 C562,118 562,237 560,355 L560,474" fill="none" stroke="#1B4F72" stroke-width="0.4" opacity="0.09"/>
  <path d="M700,0 C702,118 702,237 700,355 L700,474" fill="none" stroke="#1B4F72" stroke-width="0.4" opacity="0.07"/>
  <circle cx="420" cy="237" r="2" fill="#1B4F72" opacity="0.15"/>
  <circle cx="280" cy="158" r="1.5" fill="#D4A03C" opacity="0.20"/>
  <circle cx="560" cy="316" r="1.5" fill="#D4A03C" opacity="0.18"/>
  <circle cx="140" cy="237" r="1.2" fill="#1B4F72" opacity="0.12"/>
  <circle cx="700" cy="237" r="1.2" fill="#1B4F72" opacity="0.12"/>
  <circle cx="420" cy="79" r="1" fill="#D4A03C" opacity="0.15"/>
  <circle cx="420" cy="395" r="1" fill="#D4A03C" opacity="0.15"/>
  <circle cx="280" cy="316" r="1.2" fill="#B87333" opacity="0.12"/>
</svg>```.text

// Compass rose ornament — multi-pointed star with directional marks
#let _compass-rose-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <circle cx="60" cy="60" r="55" fill="none" stroke="#1B4F72" stroke-width="1.2" opacity="0.3"/>
  <circle cx="60" cy="60" r="48" fill="none" stroke="#D4A03C" stroke-width="0.6" opacity="0.25"/>
  <polygon points="60,8 64,52 60,48 56,52" fill="#1B4F72" opacity="0.6"/>
  <polygon points="60,112 56,68 60,72 64,68" fill="#1B4F72" opacity="0.4"/>
  <polygon points="8,60 52,56 48,60 52,64" fill="#1B4F72" opacity="0.4"/>
  <polygon points="112,60 68,64 72,60 68,56" fill="#1B4F72" opacity="0.4"/>
  <polygon points="23,23 50,54 47,50 54,50" fill="#D4A03C" opacity="0.3"/>
  <polygon points="97,23 66,50 70,47 66,54" fill="#D4A03C" opacity="0.3"/>
  <polygon points="23,97 50,66 54,70 47,66" fill="#D4A03C" opacity="0.3"/>
  <polygon points="97,97 66,70 70,66 66,66" fill="#D4A03C" opacity="0.3"/>
  <circle cx="60" cy="60" r="4" fill="#B87333" opacity="0.7"/>
  <circle cx="60" cy="60" r="2" fill="#D4A03C" opacity="0.9"/>
  <line x1="60" y1="5" x2="60" y2="15" stroke="#1B4F72" stroke-width="1.5" opacity="0.5"/>
  <line x1="60" y1="105" x2="60" y2="115" stroke="#1B4F72" stroke-width="1" opacity="0.3"/>
  <line x1="5" y1="60" x2="15" y2="60" stroke="#1B4F72" stroke-width="1" opacity="0.3"/>
  <line x1="105" y1="60" x2="115" y2="60" stroke="#1B4F72" stroke-width="1" opacity="0.3"/>
</svg>```.text

// Trade route curves — smooth arcs connecting port dots
#let _trade-routes-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M80,200 C200,120 360,100 520,160" fill="none" stroke="#1B4F72" stroke-width="1.2" opacity="0.15" stroke-dasharray="6,4"/>
  <path d="M520,160 C620,190 700,250 780,220" fill="none" stroke="#1B4F72" stroke-width="1" opacity="0.12" stroke-dasharray="6,4"/>
  <path d="M120,350 C250,280 400,260 560,300" fill="none" stroke="#D4A03C" stroke-width="1" opacity="0.14" stroke-dasharray="4,3"/>
  <path d="M560,300 C650,320 720,360 800,340" fill="none" stroke="#D4A03C" stroke-width="0.8" opacity="0.10" stroke-dasharray="4,3"/>
  <path d="M60,100 C180,60 320,80 440,120" fill="none" stroke="#B87333" stroke-width="0.8" opacity="0.10" stroke-dasharray="5,4"/>
  <path d="M200,400 C350,370 500,380 650,420" fill="none" stroke="#B87333" stroke-width="0.7" opacity="0.08" stroke-dasharray="5,4"/>
  <circle cx="80" cy="200" r="4" fill="#C0392B" opacity="0.5"/>
  <circle cx="520" cy="160" r="4" fill="#C0392B" opacity="0.5"/>
  <circle cx="780" cy="220" r="3.5" fill="#C0392B" opacity="0.4"/>
  <circle cx="120" cy="350" r="3.5" fill="#D4A03C" opacity="0.5"/>
  <circle cx="560" cy="300" r="4" fill="#D4A03C" opacity="0.5"/>
  <circle cx="800" cy="340" r="3" fill="#D4A03C" opacity="0.4"/>
  <circle cx="60" cy="100" r="3" fill="#B87333" opacity="0.4"/>
  <circle cx="440" cy="120" r="3" fill="#B87333" opacity="0.4"/>
  <circle cx="200" cy="400" r="3" fill="#B87333" opacity="0.35"/>
  <circle cx="650" cy="420" r="3" fill="#B87333" opacity="0.35"/>
</svg>```.text

// Cartographic border frame with coordinate tick marks — bookend element
#let _cartographic-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="24" y="16" width="792" height="442" fill="none" stroke="#1B4F72" stroke-width="2" opacity="0.5" rx="2"/>
  <rect x="32" y="24" width="776" height="426" fill="none" stroke="#D4A03C" stroke-width="0.8" opacity="0.35" rx="1"/>
  <line x1="24" y1="95" x2="32" y2="95" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="24" y1="174" x2="32" y2="174" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="24" y1="253" x2="32" y2="253" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="24" y1="332" x2="32" y2="332" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="24" y1="411" x2="32" y2="411" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="808" y1="95" x2="816" y2="95" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="808" y1="174" x2="816" y2="174" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="808" y1="253" x2="816" y2="253" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="808" y1="332" x2="816" y2="332" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="808" y1="411" x2="816" y2="411" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="180" y1="16" x2="180" y2="24" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="336" y1="16" x2="336" y2="24" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="492" y1="16" x2="492" y2="24" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="648" y1="16" x2="648" y2="24" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="180" y1="450" x2="180" y2="458" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="336" y1="450" x2="336" y2="458" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="492" y1="450" x2="492" y2="458" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <line x1="648" y1="450" x2="648" y2="458" stroke="#1B4F72" stroke-width="1.5" opacity="0.4"/>
  <circle cx="24" cy="16" r="3" fill="#B87333" opacity="0.6"/>
  <circle cx="816" cy="16" r="3" fill="#B87333" opacity="0.6"/>
  <circle cx="24" cy="458" r="3" fill="#B87333" opacity="0.6"/>
  <circle cx="816" cy="458" r="3" fill="#B87333" opacity="0.6"/>
</svg>```.text

// Wind rose / rhumb line pattern (decorative background filler)
#let _rhumb-lines-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <line x1="420" y1="237" x2="840" y2="0" stroke="#1B4F72" stroke-width="0.4" opacity="0.06"/>
  <line x1="420" y1="237" x2="840" y2="118" stroke="#1B4F72" stroke-width="0.4" opacity="0.05"/>
  <line x1="420" y1="237" x2="840" y2="237" stroke="#1B4F72" stroke-width="0.5" opacity="0.07"/>
  <line x1="420" y1="237" x2="840" y2="356" stroke="#1B4F72" stroke-width="0.4" opacity="0.05"/>
  <line x1="420" y1="237" x2="840" y2="474" stroke="#1B4F72" stroke-width="0.4" opacity="0.06"/>
  <line x1="420" y1="237" x2="0" y2="0" stroke="#1B4F72" stroke-width="0.4" opacity="0.06"/>
  <line x1="420" y1="237" x2="0" y2="118" stroke="#1B4F72" stroke-width="0.4" opacity="0.05"/>
  <line x1="420" y1="237" x2="0" y2="237" stroke="#1B4F72" stroke-width="0.5" opacity="0.07"/>
  <line x1="420" y1="237" x2="0" y2="356" stroke="#1B4F72" stroke-width="0.4" opacity="0.05"/>
  <line x1="420" y1="237" x2="0" y2="474" stroke="#1B4F72" stroke-width="0.4" opacity="0.06"/>
  <line x1="420" y1="237" x2="420" y2="0" stroke="#1B4F72" stroke-width="0.5" opacity="0.07"/>
  <line x1="420" y1="237" x2="420" y2="474" stroke="#1B4F72" stroke-width="0.5" opacity="0.07"/>
  <circle cx="420" cy="237" r="3" fill="#B87333" opacity="0.15"/>
  <circle cx="420" cy="237" r="8" fill="none" stroke="#D4A03C" stroke-width="0.5" opacity="0.12"/>
</svg>```.text

// Route accent line — horizontal with port dots (for section headers/dividers)
#let _route-accent-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 C30,2 60,10 90,6 C120,2 150,10 180,6 C210,2 240,10 270,6 L300,6" fill="none" stroke="#1B4F72" stroke-width="1.5" opacity="0.6" stroke-linecap="round"/>
  <circle cx="0" cy="6" r="3" fill="#C0392B" opacity="0.8"/>
  <circle cx="75" cy="4" r="2" fill="#D4A03C" opacity="0.7"/>
  <circle cx="150" cy="8" r="2.5" fill="#1B4F72" opacity="0.7"/>
  <circle cx="225" cy="4" r="2" fill="#D4A03C" opacity="0.7"/>
  <circle cx="300" cy="6" r="3" fill="#C0392B" opacity="0.8"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render mercator grid background (full-page)
#let mercator-grid-bg() = {
  image(bytes(_mercator-grid-svg), width: 100%, height: 100%)
}

/// Render trade routes background (full-page)
#let trade-routes-bg() = {
  image(bytes(_trade-routes-svg), width: 100%, height: 100%)
}

/// Render cartographic border frame (bookend element for title/ending)
#let cartographic-frame() = {
  image(bytes(_cartographic-frame-svg), width: 100%, height: 100%)
}

/// Render compass rose ornament
#let compass-rose(size: 80pt) = {
  box(image(bytes(_compass-rose-svg), width: size, height: size))
}

/// Render route accent divider line
#let route-accent(width: 100%) = {
  box(width: width, image(bytes(_route-accent-svg), width: width, height: 10pt))
}

/// Render rhumb lines background
#let rhumb-lines-bg() = {
  image(bytes(_rhumb-lines-svg), width: 100%, height: 100%)
}


// ═══ Background Atmosphere ═══

/// Persistent background atmosphere for content slides — mercator grid + trade route hints
#let _content-atmosphere() = {
  // Faint mercator grid across entire slide
  place(top + left, box(width: 100%, height: 100%, mercator-grid-bg()))
  // Small port dot accents in corners
  place(top + right, dx: -1.5em, dy: 0.8em,
    circle(radius: 2.5pt, fill: palette.secondary.transparentize(70%)))
  place(bottom + left, dx: 1.5em, dy: -0.8em,
    circle(radius: 2pt, fill: palette.primary.transparentize(75%)))
  place(bottom + right, dx: -2.5em, dy: -1.2em,
    circle(radius: 1.8pt, fill: palette.accent-copper.transparentize(80%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — parchment bg, mercator grid atmosphere, navy/gold accents
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
      spacing: 0.8em,
      {
        set text(fill: palette.navy-deep, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Route accent divider under title
      route-accent(width: 160pt),
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
        // Copper compass dot separator
        box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent-copper)
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

/// Title slide — cartographic frame (bookend), trade routes, compass rose, centered branding
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Parchment background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Rhumb lines background texture
    place(top + left, box(width: 100%, height: 100%, rhumb-lines-bg()))
    // Trade routes overlay
    place(top + left, box(width: 100%, height: 100%, trade-routes-bg()))
    // Cartographic frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, cartographic-frame()))
    // Compass rose in corner
    place(bottom + right, dx: -3em, dy: -2em, compass-rose(size: 64pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.navy-deep, info.title)
      #v(0.4em)
      // Route accent divider
      #std.align(center, route-accent(width: 220pt))
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.primary, weight: "medium", info.subtitle)
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
        text(size: 0.8em, fill: palette.secondary)[#utils.display-info-date(self)]
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

/// New section slide — left navy accent bar, compass bearing number, route accent
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
    // Mercator grid
    place(top + left, box(width: 100%, height: 100%, mercator-grid-bg()))
    // Left accent bar — deep navy
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Compass rose decorative in top-right
    place(top + right, dx: -4em, dy: 2em, compass-rose(size: 50pt))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in gold
      #text(size: 3.5em, fill: palette.secondary, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Route accent decoration
      #route-accent(width: 120pt)
      #v(0.4em)
      // Section title
      #set text(fill: palette.navy-deep, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.secondary.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep navy background with compass rose, centered quote/statement
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
    // Deep navy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.navy-deep))
    // Rhumb lines (visible on dark)
    place(top + left, box(width: 100%, height: 100%, rhumb-lines-bg()))
    // Compass rose centered but faint
    place(center + horizon, compass-rose(size: 160pt))
    // Gold corner accents
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 3pt, fill: palette.secondary-light.transparentize(40%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 3pt, fill: palette.secondary-light.transparentize(40%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 2.5pt, fill: palette.accent-copper.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 2.5pt, fill: palette.accent-copper.transparentize(40%)))
    // Center content in flow so Touying can measure the slide as non-empty
    std.align(center + horizon,
      block(width: 72%, inset: (x: 1em))[
        #set text(fill: palette.secondary-light, size: 1.4em, weight: "bold")
        #stack(
          spacing: 0.8em,
          body,
          route-accent(width: 180pt),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — parchment bg with cartographic frame (bookend), compass rose, farewell
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
    // Parchment background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Rhumb lines
    place(top + left, box(width: 100%, height: 100%, rhumb-lines-bg()))
    // Trade routes
    place(top + left, box(width: 100%, height: 100%, trade-routes-bg()))
    // Cartographic frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, cartographic-frame()))
    // Compass rose centered above text
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Compass rose above
      #compass-rose(size: 56pt)
      #v(0.6em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.navy-deep, body)
      #v(0.4em)
      // Route accent decoration
      #route-accent(width: 200pt)
      #v(0.5em)
      // Small gold bar
      #block(width: 4em, height: 3pt, fill: palette.secondary, radius: 1.5pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Route card — content card with curved trade line accent on left border
#let route-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Port dot + title
    #stack(dir: ltr, spacing: 6pt,
      box(width: 8pt, height: 8pt, radius: 4pt, fill: accent),
      text(weight: "bold", fill: palette.navy-deep, size: 0.92em, title),
    )
    #v(4pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Port box — highlighted destination/milestone box with amber top border
#let port-box(title, body) = {
  block(
    width: 100%,
    fill: palette.ocean-light,
    stroke: (top: 3pt + palette.secondary, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (bottom: 4pt),
  )[
    #stack(dir: ltr, spacing: 8pt,
      box(circle(radius: 4pt, fill: palette.rose-red)),
      text(weight: "bold", fill: palette.navy-deep, size: 0.95em, title),
    )
    #v(6pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Waypoint tag — location marker capsule label
#let waypoint-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(circle(radius: 2.5pt, fill: color)),
      text(fill: color.darken(12%), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Compass card — data display with directional compass element accent
#let compass-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.parchment,
    stroke: 1.5pt + accent.transparentize(40%),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Title row with compass indicator
    #stack(dir: ltr, spacing: 6pt,
      box(width: 10pt, height: 10pt,
        place(center + horizon,
          rotate(45deg, box(width: 7pt, height: 7pt, fill: accent, radius: 1pt))
        )
      ),
      text(weight: "bold", fill: palette.navy-deep, size: 0.92em, title),
    )
    #v(5pt)
    #block(width: 30pt, height: 1.5pt, fill: accent.transparentize(40%), radius: 1pt)
    #v(4pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Latitude divider — coordinate line separator with degree marks
#let latitude-divider(color: palette.primary, width: 80%) = {
  std.align(center, box(width: width, route-accent(width: 100%)))
}

/// Tonnage stat — KPI with cargo/value display, large number + label
#let tonnage-stat(label, value, color: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    // Copper port dot in corner
    #place(top + right, dx: -6pt, dy: 6pt,
      circle(radius: 3pt, fill: palette.accent-copper.transparentize(40%)))
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: color, size: 1.8em, weight: "bold")
        #value
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Voyage card — timeline/journey card with route-like left border and waypoints
#let voyage-card(title, body, accent: palette.accent-copper) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Route dot indicator
    #stack(dir: ltr, spacing: 6pt,
      {
        stack(spacing: 0.8em,
          circle(radius: 3pt, fill: accent),
          block(width: 1.5pt, height: 12pt, fill: accent.transparentize(50%)),
          circle(radius: 2pt, fill: accent.transparentize(30%)),
        )
      },
      {
        stack(spacing: 0.8em,
          text(weight: "bold", fill: palette.navy-deep, size: 0.92em, title),
          {
            set text(fill: palette.text, size: 0.80em)
            body
          },
        )
      },
    )
    #lazy-v(1fr)
  ]
}

/// Hemisphere grid — multi-region comparison layout (two panels side-by-side)
#let hemisphere-grid(left-title, left-body, right-title, right-body) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #grid(columns: (1fr, auto, 1fr),
      // Left hemisphere
      block(fill: palette.ocean-light, inset: (x: 1em, y: 0.8em), width: 100%)[
        #text(weight: "bold", fill: palette.navy-deep, size: 0.88em, left-title)
        #v(4pt)
        #set text(fill: palette.text, size: 0.80em)
        #left-body
      ],
      // Meridian divider
      block(fill: palette.bg, inset: (x: 0.3em, y: 0.8em), width: auto)[
        #set std.align(center + horizon)
        #block(width: 1.5pt, height: 3em, fill: palette.primary.transparentize(60%))
      ],
      // Right hemisphere
      block(fill: palette.parchment, inset: (x: 1em, y: 0.8em), width: 100%)[
        #text(weight: "bold", fill: palette.navy-deep, size: 0.88em, right-title)
        #v(4pt)
        #set text(fill: palette.text, size: 0.80em)
        #right-body
      ],
    )
  ]
}

/// Manifest box — detailed content/inventory list with structured appearance
#let manifest-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.parchment,
    stroke: (top: 2pt + accent, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (bottom: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      [
      #block(width: 100%, height: 1pt, fill: palette.border)
      #v(5pt)
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Logbook note — annotation/observation box with italic styling and copper accent
#let logbook-note(body, author: none) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + palette.accent-copper, rest: none),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #set text(fill: palette.text, size: 0.85em, style: "italic")
    #body
    #if author != none {
      v(0.3em)
      set text(fill: palette.secondary, size: 0.78em, weight: "bold", style: "normal")
      [-- #author]
    }
    #lazy-v(1fr)
  ]
}


// ═══ 3. Theme Entry Point ═══

#let atlas-trade-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text)
  show raw: set text(font: "IBM Plex Mono")
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
