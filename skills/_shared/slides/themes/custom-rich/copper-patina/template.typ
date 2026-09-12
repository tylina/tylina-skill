// Copper Patina Theme — Aged Copper & Verdigris Industrial Elegance
// You are inside a Victorian engineering workshop where brass instruments gleam,
// copper pipes carry steam, and years of oxidation have painted everything
// in warm amber and cool verdigris green. Rivets hold the world together,
// gears turn with mechanical precision, and every surface tells a story of time.
// Features: persistent gear/rivet atmosphere on EVERY content slide, rivet-card
// components, gauge-stat displays, blueprint-box technical drawings, brass-tag labels.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow


// === Color Palette (Copper & Verdigris) ===

#let palette = (
  primary: rgb("#B87333"),         // warm copper
  primary-ink: rgb("#995721"),     // text-safe dark copper
  dark: rgb("#1A1A2E"),            // dark steel
  accent: rgb("#4A8C7B"),          // verdigris green patina
  accent-ink: rgb("#356F61"),      // text-safe dark verdigris
  bg: rgb("#FAF6F0"),             // warm cream (old engineering paper)
  card: rgb("#FFFFFF"),           // clean white card
  text-dark: rgb("#2A1F14"),      // dark brown-black
  text-body: rgb("#4A3F35"),      // warm dark brown
  text-light: rgb("#7B6D5C"),     // accessible aged brass label
  border: rgb("#D4C4A8"),         // oxidized border
  copper-light: rgb("#D4956A"),   // polished copper highlight
  verdigris: rgb("#4A8C7B"),      // green patina
  steel: rgb("#3A4A5C"),          // blued steel
  rivet: rgb("#8B6914"),          // brass rivet
  patina-light: rgb("#A8D5C8"),   // light verdigris wash
)


// === SVG Definitions ===

// Gear/Cog pattern — interlocking mechanical gears of various sizes
// Used as persistent background atmosphere on content slides
#let _gear-pattern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <circle cx="760" cy="80" r="55" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.06"/>
  <circle cx="760" cy="80" r="42" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.05"/>
  <circle cx="760" cy="80" r="12" fill="currentColor" opacity="0.04"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(0, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(30, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(60, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(90, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(120, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(150, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(180, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(210, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(240, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(270, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(300, 760, 80)"/>
  <rect x="750" y="20" width="20" height="10" rx="2" fill="currentColor" opacity="0.05" transform="rotate(330, 760, 80)"/>
  <circle cx="90" cy="400" r="38" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.05"/>
  <circle cx="90" cy="400" r="28" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.04"/>
  <circle cx="90" cy="400" r="8" fill="currentColor" opacity="0.04"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(0, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(40, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(80, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(120, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(160, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(200, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(240, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(280, 90, 400)"/>
  <rect x="82" y="358" width="16" height="8" rx="2" fill="currentColor" opacity="0.04" transform="rotate(320, 90, 400)"/>
  <circle cx="700" cy="380" r="22" fill="none" stroke="currentColor" stroke-width="1" opacity="0.04"/>
  <circle cx="700" cy="380" r="15" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.03"/>
  <circle cx="700" cy="380" r="5" fill="currentColor" opacity="0.03"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(0, 700, 380)"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(45, 700, 380)"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(90, 700, 380)"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(135, 700, 380)"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(180, 700, 380)"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(225, 700, 380)"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(270, 700, 380)"/>
  <rect x="694" y="355" width="12" height="6" rx="1" fill="currentColor" opacity="0.035" transform="rotate(315, 700, 380)"/>
</svg>
```.text

// Rivet row — horizontal band of evenly spaced brass rivets
// Used as decorative separator and in rivet-card edges
#let _rivet-row-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="12" viewBox="0 0 400 12">
  <rect x="0" y="4" width="400" height="4" fill="currentColor" opacity="0.08"/>
  <circle cx="20" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="20" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="50" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="50" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="80" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="80" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="110" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="110" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="140" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="140" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="170" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="170" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="200" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="200" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="230" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="230" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="260" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="260" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="290" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="290" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="320" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="320" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="350" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="350" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="380" cy="6" r="3.5" fill="currentColor" opacity="0.35"/>
  <circle cx="380" cy="5" r="1.2" fill="currentColor" opacity="0.15"/>
</svg>
```.text

// Pipe/conduit lines — industrial piping with joints and valves
// Used on title/ending slides as a frame element (bookending)
#let _pipe-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M30,0 L30,30 Q30,45 45,45 L120,45" fill="none" stroke="currentColor" stroke-width="3" opacity="0.25" stroke-linecap="round"/>
  <circle cx="30" cy="0" r="4" fill="currentColor" opacity="0.2"/>
  <rect x="115" y="40" width="12" height="10" rx="2" fill="currentColor" opacity="0.15"/>
  <path d="M810,0 L810,30 Q810,45 795,45 L720,45" fill="none" stroke="currentColor" stroke-width="3" opacity="0.25" stroke-linecap="round"/>
  <circle cx="810" cy="0" r="4" fill="currentColor" opacity="0.2"/>
  <rect x="713" y="40" width="12" height="10" rx="2" fill="currentColor" opacity="0.15"/>
  <path d="M30,474 L30,444 Q30,429 45,429 L120,429" fill="none" stroke="currentColor" stroke-width="3" opacity="0.25" stroke-linecap="round"/>
  <circle cx="30" cy="474" r="4" fill="currentColor" opacity="0.2"/>
  <rect x="115" y="424" width="12" height="10" rx="2" fill="currentColor" opacity="0.15"/>
  <path d="M810,474 L810,444 Q810,429 795,429 L720,429" fill="none" stroke="currentColor" stroke-width="3" opacity="0.25" stroke-linecap="round"/>
  <circle cx="810" cy="474" r="4" fill="currentColor" opacity="0.2"/>
  <rect x="713" y="424" width="12" height="10" rx="2" fill="currentColor" opacity="0.15"/>
  <circle cx="75" cy="45" r="5" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18"/>
  <line x1="75" y1="40" x2="75" y2="50" stroke="currentColor" stroke-width="1.2" opacity="0.15"/>
  <circle cx="765" cy="45" r="5" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18"/>
  <line x1="765" y1="40" x2="765" y2="50" stroke="currentColor" stroke-width="1.2" opacity="0.15"/>
  <circle cx="420" cy="30" r="14" fill="none" stroke="currentColor" stroke-width="2" opacity="0.15"/>
  <circle cx="420" cy="30" r="10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.1"/>
  <line x1="420" y1="30" x2="427" y2="24" stroke="currentColor" stroke-width="1.5" opacity="0.2"/>
  <circle cx="420" cy="30" r="2" fill="currentColor" opacity="0.15"/>
  <path d="M130,45 L370,45" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.08" stroke-dasharray="8,6"/>
  <path d="M470,45 L710,45" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.08" stroke-dasharray="8,6"/>
</svg>
```.text


// === SVG Rendering Helpers ===

/// Render gear pattern background (persistent atmosphere)
#let _gear-bg(color: palette.primary) = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_gear-pattern-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%, fit: "cover")))
}

/// Render rivet row decoration
#let rivet-row(color: palette.rivet, width: 100%) = {
  let svg = _rivet-row-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 8pt))
}

/// Render pipe frame (bookending element for title/ending)
#let _pipe-frame(color: palette.primary) = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_pipe-frame-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%, fit: "cover")))
}


// === Background Atmosphere (MANDATORY on every content slide) ===

/// Persistent industrial workshop atmosphere: faint gears + corner rivets
#let _slide-atmosphere() = {
  // Gear pattern across entire slide (very subtle)
  _gear-bg(color: palette.primary)
  // Corner rivet accents (like metal plate joints)
  place(top + left, dx: 0.8em, dy: 0.4em,
    circle(radius: 2.5pt, fill: palette.rivet.transparentize(75%)))
  place(top + right, dx: -0.8em, dy: 0.4em,
    circle(radius: 2.5pt, fill: palette.rivet.transparentize(75%)))
  place(bottom + left, dx: 0.8em, dy: -0.4em,
    circle(radius: 2.5pt, fill: palette.rivet.transparentize(75%)))
  place(bottom + right, dx: -0.8em, dy: -0.4em,
    circle(radius: 2.5pt, fill: palette.rivet.transparentize(75%)))
}


// === 1. Slide Functions ===

/// Standard content slide — warm cream bg, copper header with rivet accent, gear atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Copper accent line with rivet dots at ends
      stack(dir: ltr, spacing: 0pt,
        box(circle(radius: 3pt, fill: palette.primary.transparentize(30%))),
        box(width: 80pt, height: 2.5pt, fill: gradient.linear(palette.primary, palette.accent, angle: 0deg)),
        box(circle(radius: 3pt, fill: palette.accent.transparentize(30%))),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
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
        // Small gear icon as footer center
        box(circle(radius: 3pt, fill: palette.primary.transparentize(50%)))
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // PERSISTENT ATMOSPHERE on every content slide
    _slide-atmosphere()
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

/// Title slide — full industrial frame with pipe borders, pressure gauge, rivets
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Pipe frame (bookending element)
    _pipe-frame(color: palette.primary)
    // Rivet row top and bottom (bookending element)
    place(top + left, dy: 58pt,
      box(width: 100%, rivet-row(color: palette.rivet, width: 100%)))
    place(bottom + left, dy: -58pt,
      box(width: 100%, rivet-row(color: palette.rivet, width: 100%)))
    // Center content
    set std.align(center + horizon)
    pad(x: 6em)[
      // Title in copper
      #text(size: 2.4em, weight: "bold", fill: palette.primary, info.title)
      #v(0.4em)
      // Copper-to-verdigris gradient line
      #std.align(center, box(width: 200pt, height: 3pt,
        fill: gradient.linear(palette.primary, palette.accent, angle: 0deg)))
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.text-body, style: "italic", info.subtitle)
        v(0.4em)
      }
      // Author
      #if info.author != none {
        text(size: 0.9em, fill: palette.text-dark, weight: "regular", info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.text-light, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.75em, fill: palette.text-light)[#utils.display-info-date(self)]
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

/// New section slide — large section number, copper accent, gear motif
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
    // Warm background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Subtle gear atmosphere
    _gear-bg(color: palette.primary)
    // Left accent bar (copper-to-verdigris gradient)
    place(top + left, dx: 2em,
      block(width: 4pt, height: 100%, fill: gradient.linear(palette.primary, palette.accent, angle: 180deg)))
    // Section content
    place(center + horizon,
      block(width: 70%, inset: (left: 5em, right: 3em))[
        // Section number in faded copper
        #text(size: 4em, fill: palette.primary.transparentize(60%), weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ]
        #v(0.2em)
        // Section title
        #set text(fill: palette.text-dark, size: 2em, weight: "bold")
        #utils.display-current-heading(level: 1, numbered: false)
        #v(0.4em)
        // Rivet row separator
        #rivet-row(color: palette.rivet, width: 60%)
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — dark steel background with copper text, centered
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
    // Dark steel background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))
    // Subtle gear pattern on dark
    _gear-bg(color: palette.bg)
    // Rivet rows top and bottom
    place(top + left, dy: 30pt,
      box(width: 100%, rivet-row(color: palette.copper-light.transparentize(40%), width: 100%)))
    place(bottom + left, dy: -30pt,
      box(width: 100%, rivet-row(color: palette.copper-light.transparentize(40%), width: 100%)))
    // Centered content
    place(center + horizon,
      block(width: 80%, inset: (x: 2em, y: 1.5em))[
        #set std.align(center)
        #set text(fill: palette.copper-light, size: 1.4em, weight: "bold")
        #body
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — bookends with title: pipe frame + rivets (shared elements)
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
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Pipe frame (bookending with title)
    _pipe-frame(color: palette.primary)
    // Rivet rows (bookending with title)
    place(top + left, dy: 58pt,
      box(width: 100%, rivet-row(color: palette.rivet, width: 100%)))
    place(bottom + left, dy: -58pt,
      box(width: 100%, rivet-row(color: palette.rivet, width: 100%)))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #text(size: 2.2em, weight: "bold", fill: palette.primary, body)
      #v(0.4em)
      // Copper-to-verdigris gradient line
      #std.align(center, box(width: 160pt, height: 3pt,
        fill: gradient.linear(palette.primary, palette.accent, angle: 0deg)))
      #v(0.6em)
      #text(size: 0.8em, fill: palette.text-light)[Forged with precision]
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Rivet card — card with rivet dots along top and bottom edges (signature component)
#let rivet-card(title, body, accent: palette.primary) = {
  shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: rgb(0, 0, 0, 8%), radius: 3pt)[
    #block(
      width: 100%,
      fill: palette.card,
      stroke: 0.5pt + palette.border,
      inset: 0pt,
      radius: 3pt,
      clip: true,
    )[
      #stack(spacing: 0pt,
        block(width: 100%, height: 6pt, fill: accent.transparentize(75%))[
          #place(left + horizon, dx: 8pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
          #place(left + horizon, dx: 22pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
          #place(right + horizon, dx: -8pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
          #place(right + horizon, dx: -22pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
        ],
        block(width: 100%, inset: (x: 1em, top: 0.55em, bottom: 0.65em), fill: palette.card)[
          #stack(spacing: .8em,
            text(weight: "bold", fill: accent.darken(15%), size: 0.88em, title),
            {
              set text(fill: palette.text-body, size: 0.82em)
              body
            },
          )
        ],
        lazy-v(1fr),
        block(width: 100%, height: 6pt, fill: accent.transparentize(75%))[
          #place(left + horizon, dx: 8pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
          #place(left + horizon, dx: 22pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
          #place(right + horizon, dx: -8pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
          #place(right + horizon, dx: -22pt, circle(radius: 2pt, fill: accent.transparentize(40%)))
        ],
      )
    ]
  ]
}

/// Gauge stat — circular meter-style display for numbers (like a pressure gauge)
#let gauge-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    inset: (x: 1em, y: 0.7em),
    radius: 4pt,
    stroke: 0.5pt + palette.border,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      box(width: 58pt, height: 58pt,
        place(center + horizon,
          circle(radius: 27pt, stroke: 2.5pt + color.transparentize(30%))
        ) +
        place(center + horizon,
          circle(radius: 23pt, stroke: 1pt + color.transparentize(60%))
        ) +
        place(center + horizon,
          text(size: 0.8em, weight: "bold", fill: color.darken(15%), value)
        )
      ),
      text(fill: palette.text-light, size: 0.72em, label),
    )
  ]
}

/// Blueprint box — technical drawing style with dashed border and measurement marks
#let blueprint-box(title, body) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (dash: "dashed", paint: palette.steel, thickness: 1pt),
    inset: (x: 1.2em, top: 0.8em, bottom: 1em),
    radius: 0pt,
  )[
    // Corner measurement marks
    #place(top + left, dx: -0.3em, dy: -0.3em,
      text(size: 0.5em, fill: palette.steel)[+])
    #place(top + right, dx: 0.3em, dy: -0.3em,
      text(size: 0.5em, fill: palette.steel)[+])
    #place(bottom + left, dx: -0.3em, dy: 0.3em,
      text(size: 0.5em, fill: palette.steel)[+])
    #place(bottom + right, dx: 0.3em, dy: 0.3em,
      text(size: 0.5em, fill: palette.steel)[+])
    #stack(
      spacing: .8em,
      text(weight: "semibold", fill: palette.steel, size: 0.85em)[#sym.triangle.stroked.r #title],
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Patina highlight — green-tinted accent box for key information
#let patina-highlight(title, body) = {
  block(
    width: 100%,
    fill: palette.patina-light.lighten(55%),
    stroke: (left: 3pt + palette.accent),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.accent-ink, size: 0.88em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Brass tag — small inline label like a stamped brass plate
#let brass-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(85%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.2em),
    radius: 2pt,
  )[
    #set text(fill: color.darken(15%), size: 0.7em, weight: "semibold")
    #content
  ]
}

/// Copper divider — gradient line from copper to verdigris
#let copper-divider(width: 80%) = {
  std.align(center,
    box(width: width, height: 2pt,
      fill: gradient.linear(palette.primary, palette.accent, angle: 0deg)))
}

/// Forge quote — industrial-style blockquote with pipe-like left border
#let forge-quote(quote, source: none) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (left: 4pt + palette.primary),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 0.88em, style: "italic")
        quote
      },
      if source != none {
        text(fill: palette.primary-ink, size: 0.72em, weight: "semibold", style: "normal")[-- #source]
      } else {
        none
      },
    )
  ]
}

/// Oxide section — borderless title + copper divider + content (typography-only pattern)
#let oxide-section(title, body) = {
  block(width: 100%)[
    #stack(spacing: .8em,
      text(fill: palette.primary-ink, size: 0.92em, weight: "bold", title),
      copper-divider(width: 100%),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
    )
  ]
}


// === 3. Theme Entry Point ===

#let copper-patina-theme(
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
      primary: palette.primary-ink,
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
