// Astrolabe Theme — Medieval astronomical instrument aesthetic
// Warm ivory/cream background with deep navy text, brass/gold accents, aged copper highlights
// Precise engraved arcs, celestial coordinate lines, rotating dials with degree markings
// Features: arc sweeps, graduated scales, polar coordinates, precision metalwork patterns
// Perfect for academic presentations, research talks, scholarly discourse
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FDFBF5"),
  ivory: rgb("#F8F4EA"),
  ink: rgb("#1B2340"),
  brass: rgb("#B8860B"),
  copper: rgb("#A0522D"),
  gold-light: rgb("#DAA520"),
  navy-muted: rgb("#3B4A6B"),
  warm-gray: rgb("#6B6560"),
  card-bg: rgb("#FFFDF7"),
  border: rgb("#E8DFC8"),
  arc-faint: rgb("#B8860B"),
  text-muted: rgb("#7A7268"),
)


// ═══ SVG Definitions ═══

// Full-page celestial coordinate grid — concentric arcs and radial lines
#let _celestial-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <circle cx="420" cy="237" r="220" fill="none" stroke="#B8860B" stroke-width="0.6" opacity="0.12"/>
  <circle cx="420" cy="237" r="180" fill="none" stroke="#B8860B" stroke-width="0.5" opacity="0.10"/>
  <circle cx="420" cy="237" r="140" fill="none" stroke="#B8860B" stroke-width="0.4" opacity="0.08"/>
  <circle cx="420" cy="237" r="100" fill="none" stroke="#B8860B" stroke-width="0.4" opacity="0.07"/>
  <circle cx="420" cy="237" r="60" fill="none" stroke="#B8860B" stroke-width="0.3" opacity="0.06"/>
  <line x1="420" y1="17" x2="420" y2="457" stroke="#B8860B" stroke-width="0.4" opacity="0.08"/>
  <line x1="200" y1="237" x2="640" y2="237" stroke="#B8860B" stroke-width="0.4" opacity="0.08"/>
  <line x1="265" y1="82" x2="575" y2="392" stroke="#B8860B" stroke-width="0.3" opacity="0.06"/>
  <line x1="575" y1="82" x2="265" y2="392" stroke="#B8860B" stroke-width="0.3" opacity="0.06"/>
  <path d="M420,17 A220,220 0 0,1 640,237" fill="none" stroke="#A0522D" stroke-width="0.5" opacity="0.10"/>
  <path d="M200,237 A220,220 0 0,1 420,457" fill="none" stroke="#A0522D" stroke-width="0.5" opacity="0.08"/>
  <circle cx="420" cy="237" r="3" fill="#B8860B" opacity="0.20"/>
  <circle cx="420" cy="17" r="2" fill="#B8860B" opacity="0.15"/>
  <circle cx="640" cy="237" r="2" fill="#B8860B" opacity="0.15"/>
  <circle cx="420" cy="457" r="2" fill="#B8860B" opacity="0.12"/>
  <circle cx="200" cy="237" r="2" fill="#B8860B" opacity="0.12"/>
</svg>```.text

// Ecliptic ring pattern — ornate ring for title/ending frames (bookend element)
#let _ecliptic-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="28" y="18" width="784" height="438" rx="2" ry="2" fill="none" stroke="#B8860B" stroke-width="1.8" opacity="0.6"/>
  <rect x="36" y="26" width="768" height="422" rx="1" ry="1" fill="none" stroke="#A0522D" stroke-width="0.8" opacity="0.35"/>
  <circle cx="420" cy="237" r="200" fill="none" stroke="#B8860B" stroke-width="1.2" opacity="0.25"/>
  <circle cx="420" cy="237" r="195" fill="none" stroke="#B8860B" stroke-width="0.4" opacity="0.18"/>
  <circle cx="420" cy="237" r="205" fill="none" stroke="#A0522D" stroke-width="0.4" opacity="0.15"/>
  <path d="M28,18 L56,46" stroke="#B8860B" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M812,18 L784,46" stroke="#B8860B" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M28,456 L56,428" stroke="#B8860B" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M812,456 L784,428" stroke="#B8860B" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <circle cx="28" cy="18" r="3" fill="#B8860B" opacity="0.7"/>
  <circle cx="812" cy="18" r="3" fill="#B8860B" opacity="0.7"/>
  <circle cx="28" cy="456" r="3" fill="#B8860B" opacity="0.7"/>
  <circle cx="812" cy="456" r="3" fill="#B8860B" opacity="0.7"/>
  <line x1="220" y1="18" x2="220" y2="26" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
  <line x1="320" y1="18" x2="320" y2="26" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
  <line x1="420" y1="18" x2="420" y2="30" stroke="#B8860B" stroke-width="1.2" opacity="0.5"/>
  <line x1="520" y1="18" x2="520" y2="26" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
  <line x1="620" y1="18" x2="620" y2="26" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
  <line x1="220" y1="456" x2="220" y2="448" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
  <line x1="320" y1="456" x2="320" y2="448" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
  <line x1="420" y1="456" x2="420" y2="444" stroke="#B8860B" stroke-width="1.2" opacity="0.5"/>
  <line x1="520" y1="456" x2="520" y2="448" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
  <line x1="620" y1="456" x2="620" y2="448" stroke="#B8860B" stroke-width="1" opacity="0.4"/>
</svg>```.text

// Engraved arc divider — graduated tick marks along a sweep
#let _arc-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <path d="M10,12 Q75,2 150,8 Q225,14 290,4" fill="none" stroke="#B8860B" stroke-width="1.5" opacity="0.7" stroke-linecap="round"/>
  <line x1="30" y1="9" x2="30" y2="5" stroke="#B8860B" stroke-width="1" opacity="0.6"/>
  <line x1="60" y1="6" x2="60" y2="2" stroke="#B8860B" stroke-width="1" opacity="0.5"/>
  <line x1="90" y1="5" x2="90" y2="1" stroke="#B8860B" stroke-width="1.2" opacity="0.6"/>
  <line x1="120" y1="5" x2="120" y2="2" stroke="#B8860B" stroke-width="1" opacity="0.5"/>
  <line x1="150" y1="7" x2="150" y2="3" stroke="#B8860B" stroke-width="1.2" opacity="0.7"/>
  <line x1="180" y1="9" x2="180" y2="5" stroke="#B8860B" stroke-width="1" opacity="0.5"/>
  <line x1="210" y1="11" x2="210" y2="7" stroke="#B8860B" stroke-width="1.2" opacity="0.6"/>
  <line x1="240" y1="10" x2="240" y2="6" stroke="#B8860B" stroke-width="1" opacity="0.5"/>
  <line x1="270" y1="7" x2="270" y2="3" stroke="#B8860B" stroke-width="1" opacity="0.6"/>
  <circle cx="10" cy="12" r="2.5" fill="#B8860B" opacity="0.8"/>
  <circle cx="150" cy="8" r="2" fill="#A0522D" opacity="0.6"/>
  <circle cx="290" cy="4" r="2.5" fill="#B8860B" opacity="0.8"/>
</svg>```.text

// Celestial pointer (rete) ornament — small decorative star pointer
#let _rete-pointer-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48">
  <circle cx="24" cy="24" r="18" fill="none" stroke="#B8860B" stroke-width="1.2" opacity="0.5"/>
  <circle cx="24" cy="24" r="14" fill="none" stroke="#A0522D" stroke-width="0.6" opacity="0.4"/>
  <line x1="24" y1="6" x2="24" y2="42" stroke="#B8860B" stroke-width="0.5" opacity="0.3"/>
  <line x1="6" y1="24" x2="42" y2="24" stroke="#B8860B" stroke-width="0.5" opacity="0.3"/>
  <path d="M24,8 L26,22 L24,24 L22,22 Z" fill="#B8860B" opacity="0.6"/>
  <circle cx="24" cy="24" r="3" fill="#B8860B" opacity="0.7"/>
  <circle cx="24" cy="24" r="1.5" fill="#FDFBF5" opacity="0.9"/>
  <circle cx="24" cy="8" r="1.5" fill="#A0522D" opacity="0.5"/>
</svg>```.text

// Degree scale segment — horizontal graduated line for section headers
#let _degree-scale-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="140" height="12" viewBox="0 0 140 12">
  <line x1="0" y1="6" x2="140" y2="6" stroke="#B8860B" stroke-width="1.2" opacity="0.6"/>
  <line x1="0" y1="2" x2="0" y2="10" stroke="#B8860B" stroke-width="1.2" opacity="0.7"/>
  <line x1="14" y1="4" x2="14" y2="8" stroke="#B8860B" stroke-width="0.8" opacity="0.5"/>
  <line x1="28" y1="4" x2="28" y2="8" stroke="#B8860B" stroke-width="0.8" opacity="0.5"/>
  <line x1="42" y1="3" x2="42" y2="9" stroke="#B8860B" stroke-width="1" opacity="0.6"/>
  <line x1="56" y1="4" x2="56" y2="8" stroke="#B8860B" stroke-width="0.8" opacity="0.5"/>
  <line x1="70" y1="2" x2="70" y2="10" stroke="#B8860B" stroke-width="1.2" opacity="0.7"/>
  <line x1="84" y1="4" x2="84" y2="8" stroke="#B8860B" stroke-width="0.8" opacity="0.5"/>
  <line x1="98" y1="4" x2="98" y2="8" stroke="#B8860B" stroke-width="0.8" opacity="0.5"/>
  <line x1="112" y1="3" x2="112" y2="9" stroke="#B8860B" stroke-width="1" opacity="0.6"/>
  <line x1="126" y1="4" x2="126" y2="8" stroke="#B8860B" stroke-width="0.8" opacity="0.5"/>
  <line x1="140" y1="2" x2="140" y2="10" stroke="#B8860B" stroke-width="1.2" opacity="0.7"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render celestial coordinate grid background
#let celestial-grid-bg() = {
  image(bytes(_celestial-grid-svg), width: 100%, height: 100%)
}

/// Render ecliptic frame overlay (title/ending bookend)
#let ecliptic-frame() = {
  image(bytes(_ecliptic-frame-svg), width: 100%, height: 100%)
}

/// Render arc divider
#let arc-divider-render(width: 100%) = {
  box(width: width, image(bytes(_arc-divider-svg), width: width, height: 12pt))
}

/// Render rete pointer ornament
#let rete-pointer(size: 36pt) = {
  let svg = _rete-pointer-svg
  box(image(bytes(svg), width: size, height: size))
}

/// Render degree scale decoration
#let degree-scale(width: 100pt) = {
  box(width: width, image(bytes(_degree-scale-svg), width: width, height: 10pt))
}


// ═══ Background Atmosphere ═══

/// Persistent background atmosphere for content slides — celestial grid + corner markers
#let _content-atmosphere() = {
  // Faint celestial coordinate grid across entire slide
  place(top + left, box(width: 100%, height: 100%, celestial-grid-bg()))
  // Corner brass markers
  place(top + right, dx: -1.2em, dy: 0.8em,
    circle(radius: 2.5pt, fill: palette.brass.transparentize(70%)))
  place(bottom + left, dx: 1.2em, dy: -0.8em,
    circle(radius: 2pt, fill: palette.copper.transparentize(75%)))
  place(bottom + right, dx: -1.8em, dy: -1.2em,
    circle(radius: 1.8pt, fill: palette.brass.transparentize(80%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — ivory bg, celestial grid atmosphere, brass/navy accents
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
        set text(fill: palette.ink, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Arc divider under title
      arc-divider-render(width: 160pt),
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
        // Brass dot separator
        box(width: 5pt, height: 5pt, radius: 2.5pt, fill: palette.brass)
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    _content-atmosphere()
    show: std.align.with(horizon)
    body
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

/// Title slide — ecliptic frame border, celestial grid, centered title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Celestial grid background
    place(top + left, box(width: 100%, height: 100%, celestial-grid-bg()))
    // Ecliptic frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, ecliptic-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Rete pointer ornament above title
      #rete-pointer(size: 40pt)
      #v(0.5em)
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.ink, info.title)
      #v(0.4em)
      // Arc divider
      #std.align(center, arc-divider-render(width: 220pt))
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.navy-muted, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.ink, weight: "regular", info.author)
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
        text(size: 0.8em, fill: palette.copper)[#utils.display-info-date(self)]
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

/// New section slide — brass accent, degree scale, arc sweep
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
    // Celestial grid
    place(top + left, box(width: 100%, height: 100%, celestial-grid-bg()))
    // Left accent bar — brass gradient feel
    place(top + left, block(width: 4pt, height: 100%, fill: palette.brass))
    // Decorative corner arcs
    place(top + right, dx: -3em, dy: 2em,
      circle(radius: 3.5pt, fill: palette.brass.transparentize(40%)))
    place(top + right, dx: -5em, dy: 4em,
      circle(radius: 2.5pt, fill: palette.copper.transparentize(50%)))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in brass
      #text(size: 3.5em, fill: palette.brass, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Degree scale decoration
      #degree-scale(width: 120pt)
      #v(0.4em)
      // Section title
      #set text(fill: palette.ink, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.brass.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — ivory bg with concentric arcs emphasis
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
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Celestial grid
    place(top + left, box(width: 100%, height: 100%, celestial-grid-bg()))
    // Corner brass nodes
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 3.5pt, fill: palette.brass.transparentize(30%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 3.5pt, fill: palette.copper.transparentize(40%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 2.5pt, fill: palette.copper.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 2.5pt, fill: palette.brass.transparentize(30%)))
    // Center content
    place(center + horizon,
      block(width: 72%, height: auto,
        align(center)[
          #set text(fill: palette.ink, size: 1.4em, weight: "bold")
          #body
          #v(0.5em)
          #arc-divider-render(width: 180pt)
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — ivory bg with ecliptic frame (bookend), rete pointer, farewell
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
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Celestial grid
    place(top + left, box(width: 100%, height: 100%, celestial-grid-bg()))
    // Ecliptic frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, ecliptic-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Rete pointer above
      #rete-pointer(size: 44pt)
      #v(0.6em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.ink, body)
      #v(0.5em)
      // Arc divider below
      #arc-divider-render(width: 200pt)
      #v(0.4em)
      // Small brass accent
      #block(width: 4em, height: 2pt, fill: palette.brass, radius: 1pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Dial card — card with arc-accent left border and brass node indicator
#let dial-card(title, body, accent: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Brass node + title
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 7pt, height: 7pt, radius: 3.5pt, fill: accent),
        text(weight: "bold", fill: palette.ink, size: 0.92em, title),
      ),
      { set text(fill: palette.ink, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Rete box — highlighted content box with celestial overlay accent
#let rete-box(title, body) = {
  block(
    width: 100%,
    fill: palette.ivory,
    stroke: (left: 4pt + palette.brass),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        degree-scale(width: 60pt),
        text(weight: "bold", fill: palette.brass, size: 0.95em, title),
      ),
      { set text(fill: palette.ink, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Degree tag — capsule tag with graduated marker dot
#let degree-tag(content, color: palette.brass) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color),
      text(fill: color, size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Azimuth card — data/metric display with large value and brass accent
#let azimuth-card(label, value, color: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    // Top-right brass node
    #place(top + right, dx: -6pt, dy: 6pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color.transparentize(40%)))
    #stack(spacing: .8em,
      { set text(fill: palette.text-muted, size: 0.75em); label },
      { set text(fill: color, size: 1.8em, weight: "bold"); value },
      lazy-v(1fr),
    )
  ]
}

/// Ecliptic divider — decorative arc separator with SVG
#let ecliptic-divider(color: palette.brass, width: 80%) = {
  std.align(center, box(width: width, arc-divider-render(width: 100%)))
}

/// Altitude stat — KPI card with top arc indicator band
#let altitude-stat(label, value, description, color: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (bottom: 4pt),
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        text(fill: color, size: 1.6em, weight: "bold", value),
        degree-scale(width: 50pt),
      ),
      text(fill: palette.ink, size: 0.85em, weight: "semibold", label),
      text(fill: palette.text-muted, size: 0.72em, description),
      lazy-v(1fr),
    )
  ]
}

/// Meridian card — timeline/step card with numbered brass circle
#let meridian-card(step-num, title, body, accent: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        box(width: 22pt, height: 22pt, radius: 11pt, fill: accent,
          align(center + horizon, text(fill: white, size: 0.7em, weight: "bold", step-num))),
        text(weight: "bold", fill: palette.ink, size: 0.92em, title),
      ),
      { set text(fill: palette.ink, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Quadrant grid — multi-item comparison layout in a 2x2 grid
#let quadrant-grid(tl-title, tl-body, tr-title, tr-body, bl-title, bl-body, br-title, br-body) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #stack(spacing: 0pt,
      grid(columns: (1fr, 1fr),
        // Top-left
        block(fill: palette.card-bg, inset: (x: 0.8em, y: 0.6em), width: 100%)[
          #text(weight: "bold", fill: palette.brass, size: 0.85em, tl-title)
          #v(3pt)
          #set text(fill: palette.ink, size: 0.78em)
          #tl-body
        ],
        // Top-right
        block(fill: palette.ivory, inset: (x: 0.8em, y: 0.6em), width: 100%)[
          #text(weight: "bold", fill: palette.copper, size: 0.85em, tr-title)
          #v(3pt)
          #set text(fill: palette.ink, size: 0.78em)
          #tr-body
        ],
      ),
      grid(columns: (1fr, 1fr),
        // Bottom-left
        block(fill: palette.ivory, inset: (x: 0.8em, y: 0.6em), width: 100%)[
          #text(weight: "bold", fill: palette.copper, size: 0.85em, bl-title)
          #v(3pt)
          #set text(fill: palette.ink, size: 0.78em)
          #bl-body
        ],
        // Bottom-right
        block(fill: palette.card-bg, inset: (x: 0.8em, y: 0.6em), width: 100%)[
          #text(weight: "bold", fill: palette.brass, size: 0.85em, br-title)
          #v(3pt)
          #set text(fill: palette.ink, size: 0.78em)
          #br-body
        ],
      ),
    )
  ]
}

/// Plate box — technical/code content with monospace styling and copper accent
#let plate-box(title, body, accent: palette.copper) = {
  block(
    width: 100%,
    fill: rgb("#FDFCF8"),
    stroke: (left: 3pt + accent, rest: 1pt + rgb("#E8DFC8")),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Title with engraved indicator
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 6pt, height: 6pt, fill: accent, radius: 1pt),
        text(weight: "bold", fill: accent, size: 0.88em, title),
      ),
      { set text(fill: palette.ink, size: 0.80em); body },
      lazy-v(1fr),
    )
  ]
}

/// Observation note — annotation/insight box with brass quote-style left border
#let observation-note(title, body, accent: palette.navy-muted) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
      { set text(fill: palette.ink, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let astrolabe-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
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
      primary: palette.brass,
      neutral-lightest: palette.card-bg,
      neutral-darkest: palette.ink,
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
