// Morning Dew Theme — Fresh Academic / Gentle Dawn
// Soft watercolor wash backgrounds, translucent dewdrop shapes, leaf vein patterns,
// dawn rays, and petal scatter decorations. Light, fresh, and contemplative.
// Perfect for academic research, scientific presentations, biology/ecology conferences,
// dissertation defense, and seminar talks.
// Touying 0.7.4 compatible. Rich tier.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#F9F7F4"),           // Dawn BG — warm white
  dewdrop: rgb("#5B8FA8"),      // Primary accent — water blue
  petal: rgb("#D4899A"),        // Secondary accent — soft rose
  leaf: rgb("#7CAA82"),         // Tertiary accent — morning leaf
  dewdrop-text: rgb("#3E718A"), // Text-safe water blue
  petal-text: rgb("#A95065"),   // Text-safe petal rose
  leaf-text: rgb("#46754C"),    // Text-safe leaf green
  gold-text: rgb("#8B6E18"),    // Text-safe dawn gold
  dewdrop-soft: rgb("#EDF4F7"), // Opaque water-blue surface
  petal-soft: rgb("#FAEEF1"),   // Opaque petal surface
  leaf-soft: rgb("#EFF6F0"),    // Opaque leaf surface
  gold-soft: rgb("#F8F3E5"),    // Opaque dawn surface
  dark-text: rgb("#2B3640"),    // Heading text
  body-text: rgb("#4A5B66"),    // Body copy
  muted-text: rgb("#60717C"),   // Small secondary text
  card-bg: rgb("#FFFFFF"),      // Card backgrounds
  mist: rgb("#EEF2F5"),         // Subtle fills — morning mist
  border: rgb("#D8E0E6"),       // Borders
  gold: rgb("#C9A855"),         // Highlight accent — dawn light
  focus-bg: rgb("#3E718A"),     // Accessible focus-slide background
  focus-depth: rgb("#315D73"),  // Focus-slide lower wash
)


// ═══ SVG Definitions ═══

// Dewdrop cluster — 7 circular/oval translucent drops with white highlight reflections
// Used on title and ending slides as bookending element
#let _dewdrop-cluster-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="180" viewBox="0 0 200 180">
  <ellipse cx="80" cy="90" rx="28" ry="32" fill="#5B8FA8" fill-opacity="0.18"/>
  <ellipse cx="80" cy="90" rx="20" ry="24" fill="#5B8FA8" fill-opacity="0.08"/>
  <ellipse cx="68" cy="78" rx="5" ry="4" fill="#FFFFFF" fill-opacity="0.6"/>
  <ellipse cx="130" cy="70" rx="20" ry="22" fill="#5B8FA8" fill-opacity="0.22"/>
  <ellipse cx="122" cy="62" rx="4" ry="3" fill="#FFFFFF" fill-opacity="0.55"/>
  <ellipse cx="50" cy="50" rx="14" ry="16" fill="#5B8FA8" fill-opacity="0.15"/>
  <ellipse cx="45" cy="44" rx="3" ry="2.5" fill="#FFFFFF" fill-opacity="0.5"/>
  <ellipse cx="150" cy="120" rx="18" ry="20" fill="#5B8FA8" fill-opacity="0.16"/>
  <ellipse cx="143" cy="112" rx="4" ry="3" fill="#FFFFFF" fill-opacity="0.5"/>
  <ellipse cx="100" cy="140" rx="12" ry="14" fill="#5B8FA8" fill-opacity="0.14"/>
  <ellipse cx="96" cy="134" rx="3" ry="2" fill="#FFFFFF" fill-opacity="0.45"/>
  <ellipse cx="40" cy="130" rx="10" ry="11" fill="#5B8FA8" fill-opacity="0.12"/>
  <ellipse cx="37" cy="126" rx="2" ry="1.5" fill="#FFFFFF" fill-opacity="0.4"/>
  <ellipse cx="170" cy="50" rx="9" ry="10" fill="#5B8FA8" fill-opacity="0.13"/>
  <ellipse cx="167" cy="46" rx="2" ry="1.5" fill="#FFFFFF" fill-opacity="0.45"/>
</svg>```.text

// Watercolor wash — Soft gradient blob shapes with varying opacity (background atmosphere)
#let _watercolor-wash-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M-50,350 C50,300 150,380 280,360 C410,340 500,390 640,370 C780,350 850,380 900,360" fill="#5B8FA8" fill-opacity="0.04" stroke="none"/>
  <path d="M-30,380 C80,350 200,410 350,390 C500,370 600,420 750,400 C850,385 880,400 900,395" fill="#7CAA82" fill-opacity="0.03" stroke="none"/>
  <path d="M-20,420 C100,400 250,440 400,425 C550,410 680,445 840,430" fill="#D4899A" fill-opacity="0.025" stroke="none"/>
  <path d="M700,30 C750,20 790,40 840,35 L840,0 L680,0 C700,10 710,25 700,30 Z" fill="#C9A855" fill-opacity="0.04" stroke="none"/>
  <circle cx="760" cy="60" r="40" fill="#C9A855" fill-opacity="0.02"/>
  <circle cx="80" cy="420" r="60" fill="#5B8FA8" fill-opacity="0.025"/>
  <circle cx="420" cy="450" r="45" fill="#7CAA82" fill-opacity="0.02"/>
  <path d="M0,0 L0,80 C30,60 60,70 90,50 C120,30 80,10 40,5 Z" fill="#EEF2F5" fill-opacity="0.3" stroke="none"/>
  <ellipse cx="200" cy="460" rx="80" ry="20" fill="#D4899A" fill-opacity="0.02"/>
  <ellipse cx="650" cy="440" rx="60" ry="15" fill="#5B8FA8" fill-opacity="0.02"/>
</svg>```.text

// Leaf vein pattern — Detailed leaf skeleton with branching veins
// Used on title, ending, and new-section slides
#let _leaf-vein-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="260" viewBox="0 0 200 260">
  <path d="M100,10 C100,10 60,60 50,130 C40,200 70,240 100,250 C130,240 160,200 150,130 C140,60 100,10 100,10 Z" fill="none" stroke="#7CAA82" stroke-opacity="0.12" stroke-width="1.5"/>
  <path d="M100,20 L100,245" fill="none" stroke="#7CAA82" stroke-opacity="0.15" stroke-width="1.2"/>
  <path d="M100,50 C85,60 70,75 60,90" fill="none" stroke="#7CAA82" stroke-opacity="0.10" stroke-width="0.8"/>
  <path d="M100,50 C115,60 130,75 140,90" fill="none" stroke="#7CAA82" stroke-opacity="0.10" stroke-width="0.8"/>
  <path d="M100,80 C80,95 65,110 55,130" fill="none" stroke="#7CAA82" stroke-opacity="0.09" stroke-width="0.7"/>
  <path d="M100,80 C120,95 135,110 145,130" fill="none" stroke="#7CAA82" stroke-opacity="0.09" stroke-width="0.7"/>
  <path d="M100,110 C82,125 68,140 58,160" fill="none" stroke="#7CAA82" stroke-opacity="0.08" stroke-width="0.6"/>
  <path d="M100,110 C118,125 132,140 142,160" fill="none" stroke="#7CAA82" stroke-opacity="0.08" stroke-width="0.6"/>
  <path d="M100,140 C85,155 72,170 65,185" fill="none" stroke="#7CAA82" stroke-opacity="0.07" stroke-width="0.5"/>
  <path d="M100,140 C115,155 128,170 135,185" fill="none" stroke="#7CAA82" stroke-opacity="0.07" stroke-width="0.5"/>
  <path d="M100,170 C88,182 78,195 73,210" fill="none" stroke="#7CAA82" stroke-opacity="0.06" stroke-width="0.5"/>
  <path d="M100,170 C112,182 122,195 127,210" fill="none" stroke="#7CAA82" stroke-opacity="0.06" stroke-width="0.5"/>
  <path d="M100,200 C92,210 85,220 82,230" fill="none" stroke="#7CAA82" stroke-opacity="0.05" stroke-width="0.4"/>
  <path d="M100,200 C108,210 115,220 118,230" fill="none" stroke="#7CAA82" stroke-opacity="0.05" stroke-width="0.4"/>
</svg>```.text

// Dawn rays — Subtle radiating lines from a corner (sunrise effect)
// Used on title and ending slides as bookending element
#let _dawn-rays-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="250" viewBox="0 0 300 250">
  <line x1="300" y1="0" x2="200" y2="180" stroke="#C9A855" stroke-opacity="0.08" stroke-width="1.2"/>
  <line x1="300" y1="0" x2="150" y2="160" stroke="#C9A855" stroke-opacity="0.07" stroke-width="1.0"/>
  <line x1="300" y1="0" x2="100" y2="130" stroke="#C9A855" stroke-opacity="0.06" stroke-width="0.9"/>
  <line x1="300" y1="0" x2="60" y2="90" stroke="#C9A855" stroke-opacity="0.05" stroke-width="0.8"/>
  <line x1="300" y1="0" x2="30" y2="50" stroke="#C9A855" stroke-opacity="0.04" stroke-width="0.7"/>
  <line x1="300" y1="0" x2="240" y2="200" stroke="#C9A855" stroke-opacity="0.06" stroke-width="0.8"/>
  <line x1="300" y1="0" x2="270" y2="220" stroke="#C9A855" stroke-opacity="0.05" stroke-width="0.7"/>
  <line x1="300" y1="0" x2="280" y2="250" stroke="#C9A855" stroke-opacity="0.04" stroke-width="0.6"/>
  <circle cx="300" cy="0" r="20" fill="#C9A855" fill-opacity="0.04"/>
  <circle cx="300" cy="0" r="40" fill="#C9A855" fill-opacity="0.025"/>
</svg>```.text

// Petal scatter — Small petal silhouettes scattered as corner decoration
// Used on content slides and focus slide corners
#let _petal-scatter-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" viewBox="0 0 140 140">
  <path d="M30,40 C32,30 40,28 42,35 C44,42 38,48 34,45 C30,42 28,50 30,40 Z" fill="#D4899A" fill-opacity="0.12"/>
  <path d="M70,20 C73,12 80,11 81,18 C82,25 77,28 74,26 C71,24 67,28 70,20 Z" fill="#D4899A" fill-opacity="0.10"/>
  <path d="M110,50 C113,42 120,41 121,48 C122,55 117,58 114,56 C111,54 107,58 110,50 Z" fill="#D4899A" fill-opacity="0.09"/>
  <path d="M50,90 C52,83 58,82 59,88 C60,94 56,96 53,95 C50,94 48,97 50,90 Z" fill="#D4899A" fill-opacity="0.08"/>
  <path d="M90,110 C92,103 98,102 99,108 C100,114 96,116 93,115 C90,114 88,117 90,110 Z" fill="#D4899A" fill-opacity="0.07"/>
  <path d="M20,100 C22,95 26,94 27,98 C28,102 25,104 23,103 C21,102 19,105 20,100 Z" fill="#D4899A" fill-opacity="0.06"/>
  <path d="M120,90 C121,85 125,84 126,88 C127,92 124,93 122,92 Z" fill="#D4899A" fill-opacity="0.07"/>
  <path d="M60,60 C61,55 64,54 65,58 C66,62 63,63 62,62 Z" fill="#D4899A" fill-opacity="0.06"/>
</svg>```.text

// Morning divider vine — SVG separator with dewdrop dots along a vine line
#let _morning-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="16" viewBox="0 0 400 16">
  <path d="M0,8 C30,6 60,10 90,8 C120,6 150,10 180,8 C210,6 240,10 270,8 C300,6 330,10 360,8 C380,7 395,8 400,8" fill="none" stroke="#7CAA82" stroke-opacity="0.3" stroke-width="0.8"/>
  <circle cx="50" cy="8" r="2.5" fill="#5B8FA8" fill-opacity="0.35"/>
  <circle cx="50" cy="7" r="0.8" fill="#FFFFFF" fill-opacity="0.5"/>
  <circle cx="130" cy="8" r="2" fill="#5B8FA8" fill-opacity="0.3"/>
  <circle cx="130" cy="7" r="0.6" fill="#FFFFFF" fill-opacity="0.45"/>
  <circle cx="200" cy="8" r="3" fill="#5B8FA8" fill-opacity="0.35"/>
  <circle cx="199" cy="6.5" r="1" fill="#FFFFFF" fill-opacity="0.5"/>
  <circle cx="270" cy="8" r="2" fill="#5B8FA8" fill-opacity="0.3"/>
  <circle cx="270" cy="7" r="0.6" fill="#FFFFFF" fill-opacity="0.45"/>
  <circle cx="350" cy="8" r="2.5" fill="#5B8FA8" fill-opacity="0.35"/>
  <circle cx="350" cy="7" r="0.8" fill="#FFFFFF" fill-opacity="0.5"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render watercolor wash atmosphere (persistent on every content slide)
#let _wash-atmosphere() = {
  place(top + left, image(bytes(_watercolor-wash-svg), width: 100%, height: 100%))
  place(bottom + right, dx: -0.5em, dy: -0.5em,
    image(bytes(_petal-scatter-svg), width: 100pt, height: 100pt))
}

/// Render dewdrop cluster decoration
#let _dewdrop-cluster(width: 160pt) = {
  image(bytes(_dewdrop-cluster-svg), width: width)
}

/// Render leaf vein decoration
#let _leaf-vein(height: 200pt) = {
  image(bytes(_leaf-vein-svg), height: height)
}

/// Render dawn rays decoration
#let _dawn-rays(width: 240pt) = {
  image(bytes(_dawn-rays-svg), width: width)
}

/// Map bright decorative accents to opaque, text-safe semantic colors
#let _accent-text(color) = if color == palette.dewdrop {
  palette.dewdrop-text
} else if color == palette.petal {
  palette.petal-text
} else if color == palette.leaf {
  palette.leaf-text
} else if color == palette.gold {
  palette.gold-text
} else {
  palette.dark-text
}

/// Map bright decorative accents to opaque component surfaces
#let _accent-surface(color) = if color == palette.dewdrop {
  palette.dewdrop-soft
} else if color == palette.petal {
  palette.petal-soft
} else if color == palette.leaf {
  palette.leaf-soft
} else if color == palette.gold {
  palette.gold-soft
} else {
  palette.card-bg
}


// ═══ Reusable Components ═══

/// dew-card — Card with dewdrop circle accent in top-left corner
#let dew-card(title, body, accent: palette.dewdrop) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.5pt + palette.border,
    inset: (x: 1.2em, y: 0.9em),
    radius: 8pt,
  )[
    // Dewdrop circle accent top-left
    #place(top + left, dx: -0.4em, dy: -0.4em,
      circle(radius: 6pt, fill: accent.transparentize(70%)))
    #place(top + left, dx: -0.25em, dy: -0.3em,
      circle(radius: 1.5pt, fill: white.transparentize(30%)))
    #stack(spacing: .8em,
      text(weight: "bold", fill: _accent-text(accent), size: 0.9em, title),
      [
      #set text(fill: palette.body-text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// mist-box — Callout with soft mist fill and left border
#let mist-box(title, body, accent: palette.dewdrop) = {
  block(
    width: 100%,
    fill: palette.mist,
    stroke: (left: 3pt + accent.transparentize(30%)),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 6pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: _accent-text(accent), size: 0.88em, title),
      [
      #set text(fill: palette.body-text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// droplet-stat — KPI with dewdrop shape above the number
#let droplet-stat(value, label, accent: palette.dewdrop) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.7em),
    radius: 8pt,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      box(width: 24pt, height: 28pt)[
        #place(center + horizon,
          circle(radius: 10pt, fill: accent.transparentize(80%)))
        #place(center + horizon, dy: -1pt,
          circle(radius: 2pt, fill: white.transparentize(20%)))
      ],
      text(fill: _accent-text(accent), size: 1.6em, weight: "bold", value),
      text(fill: palette.body-text, size: 0.72em, label),
      lazy-v(1fr),
    )
    // Dewdrop shape above number
  ]
}

/// petal-quote — Quote with petal-rose left border and italic text
#let petal-quote(quote-text, author: none, accent: palette.petal) = {
  block(
    width: 100%,
    fill: _accent-surface(accent),
    stroke: (left: 3pt + accent.transparentize(30%)),
    inset: (x: 1.4em, y: 0.9em),
    radius: (right: 6pt),
  )[
    #place(top + right, dx: -0.4em, dy: -0.4em,
      image(bytes(_petal-scatter-svg), width: 44pt, height: 44pt))
    #stack(
      spacing: .8em,
      text(fill: palette.dark-text, size: 0.88em, style: "italic", quote-text),
      if author != none {
        text(fill: _accent-text(accent), size: 0.78em, weight: "semibold")[-- #author]
      },
      lazy-v(1fr),
    )
  ]
}

/// leaf-card — Card with small leaf icon and green top accent line
#let leaf-card(title, body, accent: palette.leaf) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 2.5pt + accent.transparentize(30%), rest: 0.5pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        // Small leaf shape
        box(width: 12pt, height: 12pt)[
          #place(center + horizon,
            circle(radius: 5pt, fill: accent.transparentize(75%)))
        ],
        text(weight: "bold", fill: _accent-text(accent), size: 0.9em, title),
      ),
      {
        set text(fill: palette.body-text, size: 0.82em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// dawn-tag — Rounded pill tag in dawn colors
#let dawn-tag(content, color: palette.dewdrop) = {
  box(
    fill: color.transparentize(88%),
    stroke: 0.6pt + color.transparentize(50%),
    inset: (x: 0.7em, y: 0.25em),
    radius: 12pt,
  )[
    #set text(fill: _accent-text(color), size: 0.72em, weight: "semibold")
    #content
  ]
}

/// branch-entry — Timeline with branching vine connector
#let branch-entry(step, title, body, accent: palette.leaf) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 12pt,
    {
      // Vine connector circle
      box(width: 28pt)[
        #set std.align(center)
        #circle(radius: 11pt, fill: accent.transparentize(80%), stroke: 1pt + accent.transparentize(40%))
        #place(center + horizon, text(fill: _accent-text(accent), size: 0.7em, weight: "bold", step))
      ]
    },
    {
      block(width: 100%, inset: (bottom: 0.6em))[
        #stack(spacing: .8em,
          text(weight: "bold", fill: palette.dark-text, size: 0.88em, title),
          [
          #set text(fill: palette.body-text, size: 0.8em)
          #body
          ],
        )
      ]
    },
  )
}

/// specimen-table — Academic table with mist/white alternating rows
#let specimen-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.mist }
      else if calc.odd(row) { palette.mist.transparentize(50%) } else { palette.card-bg },
    stroke: 0.5pt + palette.border,
    inset: 9pt,
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.dark-text, size: 0.82em, h))),
    ..rows.flatten().map(c => text(fill: palette.body-text, size: 0.78em, c)),
  )
}

/// morning-divider — SVG separator with dewdrop dots along a vine
#let morning-divider(width: 80%) = {
  std.align(center, box(width: width, image(bytes(_morning-divider-svg), width: 100%, height: 12pt)))
}

/// prism-card — Card with subtle rainbow light refraction at top edge
#let prism-card(title, body, accent: palette.gold) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.5pt + palette.border,
    inset: 0pt,
    radius: 8pt,
    clip: true,
  )[
    // Rainbow refraction top edge
    #stack(spacing: 0pt,
      grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr),
        block(width: 100%, height: 3pt, fill: palette.petal.transparentize(50%)),
        block(width: 100%, height: 3pt, fill: palette.gold.transparentize(50%)),
        block(width: 100%, height: 3pt, fill: palette.leaf.transparentize(50%)),
        block(width: 100%, height: 3pt, fill: palette.dewdrop.transparentize(50%)),
        block(width: 100%, height: 3pt, fill: palette.dewdrop.darken(20%).transparentize(50%)),
      ),
      block(width: 100%, inset: (x: 1.2em, y: 0.8em))[
        #stack(
          spacing: .8em,
          text(weight: "bold", fill: _accent-text(accent), size: 0.9em, title),
          {
            set text(fill: palette.body-text, size: 0.82em)
            body
            lazy-v(1fr)
          },
        )
      ],
    )
  ]
}


// ═══ Slide Functions ═══

/// Standard content slide — Dawn BG, dewdrop accent in header, watercolor wash atmosphere, petal scatter
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 1em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.dark-text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Dewdrop accent dots under heading
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3pt, fill: palette.dewdrop.transparentize(40%))),
        box(circle(radius: 2pt, fill: palette.dewdrop.transparentize(55%))),
        box(circle(radius: 1.5pt, fill: palette.dewdrop.transparentize(70%))),
        block(width: 40pt, height: 1.5pt, fill: palette.dewdrop.transparentize(60%), radius: 1pt),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.35em))
    set std.align(horizon)
    set text(fill: palette.muted-text, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Tiny dewdrop as center marker
        box(circle(radius: 2pt, fill: palette.dewdrop.transparentize(45%)))
      },
      {
        set std.align(right)
        context text(fill: palette.muted-text, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    _wash-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — Large dewdrop cluster center, leaf vein in corner, dawn rays from top-right, watercolor wash
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Watercolor wash atmosphere
    place(top + left, image(bytes(_watercolor-wash-svg), width: 100%, height: 100%))
    // Dawn rays from top-right (bookending)
    place(top + right, _dawn-rays(width: 280pt))
    // Leaf vein in bottom-left corner (bookending)
    place(bottom + left, dx: 0.5em, dy: -0.5em, _leaf-vein(height: 180pt))
    // Dewdrop cluster center-right area (bookending)
    place(right + horizon, dx: -2em, _dewdrop-cluster(width: 150pt))
    // Content centered
    set std.align(center + horizon)
    pad(x: 4em, right: 8em)[
      // Title
      #text(size: 2.2em, weight: "bold", fill: palette.dark-text, info.title)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 0.95em, fill: palette.body-text, info.subtitle)
        v(0.5em)
      }
      // Morning divider
      #image(bytes(_morning-divider-svg), width: 200pt, height: 10pt)
      #v(0.5em)
      // Author
      #if info.author != none {
        text(size: 1em, weight: "semibold", fill: palette.dewdrop, info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.82em, fill: palette.body-text.transparentize(20%), info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.78em, fill: palette.body-text.transparentize(30%))[#utils.display-info-date(self)]
      }
    ]
    // Petal scatter in top-left
    place(top + left, dx: 1em, dy: 0.5em,
      image(bytes(_petal-scatter-svg), width: 80pt, height: 80pt))
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// New section slide — Left panel with large leaf vein, section number in dewdrop circle, title right
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Watercolor wash
    place(top + left, image(bytes(_watercolor-wash-svg), width: 100%, height: 100%))
    // Large leaf vein on left panel
    place(left + horizon, dx: 1.5em,
      _leaf-vein(height: 280pt))
    // Content on right side
    place(right + horizon,
      block(width: 60%, inset: (right: 4em, left: 2em))[
        // Section number in dewdrop circle
        #box(width: 48pt, height: 48pt)[
          #place(center + horizon,
            circle(radius: 22pt, fill: palette.dewdrop.transparentize(80%), stroke: 1.5pt + palette.dewdrop.transparentize(40%)))
          #place(center + horizon,
            text(fill: palette.dewdrop, size: 1.4em, weight: "bold")[
              #utils.display-current-heading-number(depth: 1, numbering: "1")
            ])
          // Highlight reflection
          #place(top + left, dx: 10pt, dy: 8pt,
            circle(radius: 3pt, fill: white.transparentize(30%)))
        ]
        #v(0.6em)
        // Section title
        #set text(fill: palette.dark-text, size: 2em, weight: "bold")
        #utils.display-current-heading(level: 1, numbered: false)
        #v(0.4em)
        // Accent line
        #stack(dir: ltr, spacing: 5pt,
          block(width: 40pt, height: 2pt, fill: palette.dewdrop.transparentize(30%), radius: 1pt),
          circle(radius: 2.5pt, fill: palette.dewdrop.transparentize(50%)),
          circle(radius: 1.5pt, fill: palette.dewdrop.transparentize(65%)),
        )
      ]
    )
    // Petal scatter bottom-right
    place(bottom + right, dx: -1em, dy: -1em,
      image(bytes(_petal-scatter-svg), width: 90pt, height: 90pt))
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — Clean TOC with dewdrop bullet markers
#let outline-slide(title: [Outline]) = touying-slide-wrapper(self => {
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
    // Watercolor wash atmosphere
    _wash-atmosphere()
    // Small dewdrop cluster top-right
    place(top + right, dx: -1em, dy: 0.5em, _dewdrop-cluster(width: 80pt))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.5em, weight: "bold", fill: palette.dark-text)
        title
      },
      // Accent line
      stack(dir: ltr, spacing: 5pt,
        block(width: 50pt, height: 2pt, fill: palette.dewdrop.transparentize(30%), radius: 1pt),
        circle(radius: 2.5pt, fill: palette.dewdrop.transparentize(50%)),
      ),
      {
        v(0.3em)
        set text(size: 1.05em, fill: palette.body-text)
        outline(
          title: none,
          depth: 1,
        )
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — Dewdrop blue background, white text, petal scatter corners
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Dewdrop blue background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dewdrop.darken(10%)))
    // Subtle darker wash overlay
    place(bottom + left,
      block(width: 100%, height: 40%, fill: palette.dewdrop.darken(25%).transparentize(50%)))
    // Petal scatter top-left
    place(top + left, dx: 1em, dy: 0.5em,
      image(bytes(_petal-scatter-svg), width: 100pt, height: 100pt))
    // Petal scatter bottom-right
    place(bottom + right, dx: -1em, dy: -0.5em,
      image(bytes(_petal-scatter-svg), width: 100pt, height: 100pt))
    // Dewdrop highlights scattered
    place(top + right, dx: -4em, dy: 2em,
      circle(radius: 8pt, fill: white.transparentize(85%)))
    place(bottom + left, dx: 3em, dy: -3em,
      circle(radius: 6pt, fill: white.transparentize(88%)))
    // Center content
    set std.align(center + horizon)
    block(width: 100%, inset: (x: 1em))[
      #set text(fill: white, size: 1.5em, weight: "bold")
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — Bookend with title — dewdrop cluster, leaf vein, dawn rays
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Watercolor wash
    place(top + left, image(bytes(_watercolor-wash-svg), width: 100%, height: 100%))
    // Dawn rays from top-right (bookends with title)
    place(top + right, _dawn-rays(width: 280pt))
    // Leaf vein bottom-left (bookends with title)
    place(bottom + left, dx: 0.5em, dy: -0.5em, _leaf-vein(height: 180pt))
    // Dewdrop cluster (bookends with title)
    place(right + horizon, dx: -2em, dy: 1em, _dewdrop-cluster(width: 140pt))
    // Petal scatter top-left
    place(top + left, dx: 1em, dy: 0.5em,
      image(bytes(_petal-scatter-svg), width: 90pt, height: 90pt))
    // Center text
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Morning divider above
      #image(bytes(_morning-divider-svg), width: 180pt, height: 10pt)
      #v(0.6em)
      #text(size: 2.2em, weight: "bold", fill: palette.dark-text, body)
      #v(0.5em)
      // Morning divider below
      #image(bytes(_morning-divider-svg), width: 180pt, height: 10pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ Theme Entry Point ═══

#let morning-dew-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.dark-text)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3.5em, bottom: 1.75em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.dewdrop,
      neutral-lightest: palette.bg,
      neutral-darkest: palette.dark-text,
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
