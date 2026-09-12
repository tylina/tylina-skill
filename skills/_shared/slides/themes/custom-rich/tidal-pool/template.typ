// Tidal Pool Theme — Ocean science inspired
// Aquamarine, sand, and deep navy accents on light backgrounds
// Wave-form SVG decorations, tide line patterns, circular pool motifs
// Evokes marine biology fieldwork — scientific yet organic and beautiful
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#F8F6F0"),          // Sandy white
  ink: rgb("#1E2D3D"),          // Text dark
  primary: rgb("#4ECDC4"),      // Aquamarine
  navy: rgb("#1A3A4A"),         // Deep navy
  sand: rgb("#D4A76A"),         // Sand gold
  coral: rgb("#E87461"),        // Coral accent
  primary-text: rgb("#137D78"), // Text-safe aquamarine
  sand-text: rgb("#8A5A24"),    // Text-safe sand gold
  coral-text: rgb("#AC4637"),   // Text-safe coral
  ink-muted: rgb("#1E2D3D").transparentize(30%),
  primary-light: rgb("#4ECDC4").transparentize(85%),
  navy-light: rgb("#1A3A4A").transparentize(90%),
  sand-light: rgb("#D4A76A").transparentize(88%),
  coral-light: rgb("#E87461").transparentize(88%),
  card-bg: rgb("#FFFFFF"),
  border-light: rgb("#1A3A4A").transparentize(80%),
  water-tint: rgb("#4ECDC4").transparentize(94%),
)

#let accent-text(color) = if color == palette.primary {
  palette.primary-text
} else if color == palette.sand {
  palette.sand-text
} else if color == palette.coral {
  palette.coral-text
} else {
  color
}


// ═══ SVG Definitions ═══

// Wave form — gentle sine curves for ocean rhythm
#let _wave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M 0 420 Q 70 400, 140 420 T 280 420 T 420 420 T 560 420 T 700 420 T 840 420" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.15"/>
  <path d="M 0 435 Q 70 415, 140 435 T 280 435 T 420 435 T 560 435 T 700 435 T 840 435" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.10"/>
  <path d="M 0 450 Q 70 430, 140 450 T 280 450 T 420 450 T 560 450 T 700 450 T 840 450" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.07"/>
  <path d="M 0 40 Q 105 20, 210 40 T 420 40 T 630 40 T 840 40" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.08"/>
  <path d="M 0 55 Q 105 38, 210 55 T 420 55 T 630 55 T 840 55" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M -20 200 Q 130 185, 280 200 Q 430 215, 580 200 Q 730 185, 860 200" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M -20 260 Q 130 248, 280 260 Q 430 272, 580 260 Q 730 248, 860 260" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.04"/>
  <circle cx="680" cy="90" r="2" fill="currentColor" opacity="0.06"/>
  <circle cx="720" cy="110" r="1.5" fill="currentColor" opacity="0.05"/>
  <circle cx="750" cy="80" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="100" cy="380" r="1.5" fill="currentColor" opacity="0.05"/>
  <circle cx="130" cy="370" r="2" fill="currentColor" opacity="0.04"/>
</svg>
```.text

// Tidal lines — horizontal tide marks like water marks on rocks
#let _tidal-lines-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <line x1="30" y1="60" x2="810" y2="60" stroke="currentColor" stroke-width="0.5" opacity="0.06" stroke-dasharray="4 8"/>
  <line x1="60" y1="120" x2="780" y2="120" stroke="currentColor" stroke-width="0.4" opacity="0.05" stroke-dasharray="3 12"/>
  <line x1="90" y1="180" x2="750" y2="180" stroke="currentColor" stroke-width="0.3" opacity="0.04" stroke-dasharray="2 16"/>
  <line x1="40" y1="354" x2="800" y2="354" stroke="currentColor" stroke-width="0.4" opacity="0.05" stroke-dasharray="3 12"/>
  <line x1="70" y1="414" x2="770" y2="414" stroke="currentColor" stroke-width="0.5" opacity="0.06" stroke-dasharray="4 8"/>
  <circle cx="200" cy="60" r="1.2" fill="currentColor" opacity="0.05"/>
  <circle cx="400" cy="120" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="600" cy="354" r="1.2" fill="currentColor" opacity="0.05"/>
  <circle cx="300" cy="414" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="500" cy="60" r="0.8" fill="currentColor" opacity="0.04"/>
  <circle cx="700" cy="414" r="1.5" fill="currentColor" opacity="0.05"/>
</svg>
```.text

// Circular pool ripple motif — concentric circles like a rock pool
#let _pool-ripple-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <circle cx="60" cy="60" r="10" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5"/>
  <circle cx="60" cy="60" r="20" fill="none" stroke="currentColor" stroke-width="1.0" opacity="0.35"/>
  <circle cx="60" cy="60" r="30" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.25"/>
  <circle cx="60" cy="60" r="40" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.18"/>
  <circle cx="60" cy="60" r="50" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
  <circle cx="60" cy="60" r="58" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.08"/>
  <circle cx="60" cy="60" r="3" fill="currentColor" opacity="0.4"/>
  <circle cx="45" cy="48" r="1" fill="currentColor" opacity="0.2"/>
  <circle cx="72" cy="70" r="1.2" fill="currentColor" opacity="0.15"/>
  <circle cx="55" cy="78" r="0.8" fill="currentColor" opacity="0.18"/>
</svg>
```.text

// Full-page tidal atmosphere — combines waves, pools, and organic elements
#let _tidal-atmosphere-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M 0 440 Q 60 425, 120 440 T 240 440 T 360 440 T 480 440 T 600 440 T 720 440 T 840 440" fill="none" stroke="currentColor" stroke-width="1.0" opacity="0.12"/>
  <path d="M 0 452 Q 60 438, 120 452 T 240 452 T 360 452 T 480 452 T 600 452 T 720 452 T 840 452" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.08"/>
  <path d="M 0 462 Q 60 450, 120 462 T 240 462 T 360 462 T 480 462 T 600 462 T 720 462 T 840 462" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M 0 28 Q 105 18, 210 28 T 420 28 T 630 28 T 840 28" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.08"/>
  <circle cx="760" cy="80" r="15" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <circle cx="760" cy="80" r="25" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.04"/>
  <circle cx="760" cy="80" r="35" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.03"/>
  <circle cx="120" cy="420" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="200" cy="430" r="0.8" fill="currentColor" opacity="0.05"/>
  <circle cx="340" cy="425" r="1.2" fill="currentColor" opacity="0.04"/>
  <circle cx="500" cy="435" r="0.7" fill="currentColor" opacity="0.05"/>
  <circle cx="650" cy="422" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="780" cy="440" r="0.9" fill="currentColor" opacity="0.05"/>
  <path d="M 50 400 Q 52 390, 48 380 Q 50 370, 53 365" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M 790 400 Q 792 392, 788 384 Q 791 376, 793 370" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
</svg>
```.text

// Wave divider SVG — decorative horizontal wave separator
#let _wave-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="12" viewBox="0 0 200 12">
  <path d="M 0 6 Q 12.5 2, 25 6 T 50 6 T 75 6 T 100 6 T 125 6 T 150 6 T 175 6 T 200 6" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
  <path d="M 0 9 Q 12.5 5.5, 25 9 T 50 9 T 75 9 T 100 9 T 125 9 T 150 9 T 175 9 T 200 9" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
</svg>
```.text

// Quote decoration — stylized wave-quote marks
#let _quote-wave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="24" viewBox="0 0 32 24">
  <path d="M 2 18 Q 6 8, 14 8 Q 10 12, 10 16 Q 10 20, 14 20 Q 18 20, 18 16 Q 18 10, 10 6 Q 4 4, 2 8" fill="currentColor" opacity="0.3"/>
  <path d="M 18 18 Q 22 8, 30 8 Q 26 12, 26 16 Q 26 20, 30 20 Q 34 20, 34 16 Q 34 10, 26 6 Q 20 4, 18 8" fill="currentColor" opacity="0.3"/>
</svg>
```.text


// ═══ SVG Rendering Helpers ═══

/// Render wave background atmosphere
#let wave-bg(color: palette.primary) = {
  let svg = _wave-svg.replace("currentColor", color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%))
}

/// Render tidal lines background
#let tidal-lines-bg(color: palette.navy) = {
  let svg = _tidal-lines-svg.replace("currentColor", color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%))
}

/// Render full tidal atmosphere
#let tidal-atmosphere(color: palette.navy) = {
  let svg = _tidal-atmosphere-svg.replace("currentColor", color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%))
}

/// Render pool ripple decoration
#let pool-ripple(color: palette.primary, size: 80pt) = {
  let svg = _pool-ripple-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render wave divider
#let wave-divider-svg(color: palette.primary, width: 160pt) = {
  let svg = _wave-divider-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: width, height: width * 0.06))
}

/// Render quote wave marks
#let quote-waves(color: palette.primary, size: 24pt) = {
  let svg = _quote-wave-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size * 0.75))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — sandy white bg, tidal atmosphere, aquamarine header with wave accent
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.5em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.navy, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Wave-form underline
      box(width: 120pt, {
        let svg = _wave-divider-svg.replace("currentColor", palette.primary.to-hex())
        image(bytes(svg), width: 100%, height: 8pt)
      }),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      // Small wave dot separator
      {
        set std.align(center)
        stack(dir: ltr, spacing: 3pt,
          box(circle(radius: 1.5pt, fill: palette.primary.transparentize(40%))),
          box(circle(radius: 2.5pt, fill: palette.primary)),
          box(circle(radius: 1.5pt, fill: palette.primary.transparentize(40%))),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // Persistent tidal atmosphere on content slides
    tidal-atmosphere(color: palette.navy)
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

/// Title slide — sandy white with full wave decorations, pool ripple, navy/aquamarine typography
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Sandy white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Full wave background
    wave-bg(color: palette.primary)
    tidal-lines-bg(color: palette.navy)
    // Pool ripple decoration top-right
    place(top + right, dx: -30pt, dy: 20pt, pool-ripple(color: palette.primary.transparentize(20%), size: 100pt))
    // Pool ripple decoration bottom-left (smaller)
    place(bottom + left, dx: 40pt, dy: -30pt, pool-ripple(color: palette.sand.transparentize(40%), size: 60pt))
    // Top border — tidal frame
    place(top + center, dy: 14pt, block(width: 88%)[
      #line(length: 100%, stroke: 2pt + palette.navy)
      #v(3pt)
      #line(length: 100%, stroke: 0.7pt + palette.primary.transparentize(30%))
    ])
    // Bottom border — tidal frame
    place(bottom + center, dy: -14pt, block(width: 88%)[
      #line(length: 100%, stroke: 0.7pt + palette.primary.transparentize(30%))
      #v(3pt)
      #line(length: 100%, stroke: 2pt + palette.navy)
    ])
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.navy, info.title)
      #v(0.4em)
      // Wave divider
      #wave-divider-svg(color: palette.primary, width: 200pt)
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.primary-text, info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1.1em, fill: palette.ink, weight: "medium", info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.ink-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.sand-text)[#utils.display-info-date(self)]
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

/// New section slide — deep navy background with aquamarine accents and wave motifs
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
    // Deep navy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.navy))
    // Wave overlay in white
    {
      let svg = _wave-svg.replace("currentColor", rgb("#FFFFFF").to-hex())
      place(top + left, image(bytes(svg), width: 100%, height: 100%))
    }
    // Pool ripple bottom-right
    place(bottom + right, dx: -40pt, dy: -30pt, pool-ripple(color: palette.primary.transparentize(40%), size: 90pt))
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in sand gold
      #text(size: 2.6em, fill: palette.sand, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Section title in white
      #set text(fill: white, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.4em)
      // Wave divider accent
      #wave-divider-svg(color: palette.primary, width: 160pt)
      #v(1fr)
    ]
    // Bottom tide line
    place(bottom + center, dy: -16pt,
      line(length: 85%, stroke: 0.5pt + palette.primary.transparentize(40%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — aquamarine background, centered navy text with coral accent
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
    // Aquamarine gradient background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary.darken(10%)))
    // Wave overlay in white
    {
      let svg = _wave-svg.replace("currentColor", rgb("#FFFFFF").to-hex())
      place(top + left, image(bytes(svg), width: 100%, height: 100%))
    }
    // Pool ripples decorating corners
    place(top + left, dx: 30pt, dy: 20pt, pool-ripple(color: white.transparentize(70%), size: 50pt))
    place(bottom + right, dx: -30pt, dy: -20pt, pool-ripple(color: white.transparentize(70%), size: 50pt))
    // Tidal frame border
    place(center + horizon,
      rect(width: 84%, height: 76%,
        fill: none,
        stroke: 1pt + white.transparentize(50%),
        radius: 2pt))
    // Center content
    place(center + horizon,
      block(width: 70%, height: auto,
        align(center)[
          #set text(fill: palette.navy, size: 1.4em, weight: "bold")
          #body
          #v(0.6em)
          #wave-divider-svg(color: palette.sand, width: 140pt)
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — sandy white with pool ripple centered, navy text, tidal frame (bookends with title)
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
    // Sandy white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Wave + tidal decoration (same as title for bookend effect)
    wave-bg(color: palette.primary)
    tidal-lines-bg(color: palette.navy)
    // Pool ripple top-right (same position as title slide)
    place(top + right, dx: -30pt, dy: 20pt, pool-ripple(color: palette.primary.transparentize(20%), size: 100pt))
    // Top border — tidal frame (same as title)
    place(top + center, dy: 14pt, block(width: 88%)[
      #line(length: 100%, stroke: 2pt + palette.navy)
      #v(3pt)
      #line(length: 100%, stroke: 0.7pt + palette.primary.transparentize(30%))
    ])
    // Bottom border — tidal frame (same as title)
    place(bottom + center, dy: -14pt, block(width: 88%)[
      #line(length: 100%, stroke: 0.7pt + palette.primary.transparentize(30%))
      #v(3pt)
      #line(length: 100%, stroke: 2pt + palette.navy)
    ])
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Pool ripple above text
      #pool-ripple(color: palette.primary, size: 70pt)
      #v(0.8em)
      // Main text
      #text(size: 2.2em, weight: "bold", fill: palette.navy, body)
      #v(0.5em)
      // Wave divider
      #wave-divider-svg(color: palette.primary, width: 180pt)
      #v(0.4em)
      // Three dots ornament (sand/aquamarine/coral)
      #stack(dir: ltr, spacing: 10pt,
        box(circle(radius: 3pt, fill: palette.sand)),
        box(circle(radius: 3pt, fill: palette.primary)),
        box(circle(radius: 3pt, fill: palette.coral)),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — aquamarine top border card for structured ideas/concepts
#let concept-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 0.7pt + palette.border-light),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent-text(accent), size: 0.92em, title),
      wave-divider-svg(color: accent.transparentize(40%), width: 50pt),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Insight box — left-bordered callout with navy accent for key insights/observations
#let insight-box(title, body, accent: palette.navy) = {
  block(
    width: 100%,
    fill: accent.transparentize(94%),
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent-text(accent), size: 0.92em, title),
      [
      #set text(fill: palette.ink, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Stat card — large value display with colored bottom border, like a tide gauge reading
#let stat-card(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: color.transparentize(92%),
    stroke: (bottom: 3pt + color),
    inset: (x: 0.7em, y: 0.28em),
    radius: (top: 4pt),
  )[
    #stack(
      spacing: .8em,
      text(fill: palette.ink-muted, size: 0.7em, label),
      text(fill: accent-text(color), size: 1.3em, weight: "bold", value),
      lazy-v(1fr),
    )
  ]
}

/// Quote card — ocean-themed quote with SVG wave quote marks
#let quote-card(quote-text, author: none) = {
  block(
    width: 100%,
    fill: palette.primary.transparentize(95%),
    stroke: (left: 3pt + palette.primary, rest: 0.5pt + palette.border-light),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    // SVG wave quote decoration
    #quote-waves(color: palette.primary, size: 20pt)
    #v(4pt)
    #set text(fill: palette.ink, size: 0.88em, style: "italic")
    #quote-text
    #if author != none {
      v(0.4em)
      set text(fill: palette.sand-text, size: 0.8em, weight: "bold", style: "normal")
      [-- #author]
    }
    #lazy-v(1fr)
  ]
}

/// Specimen card — marine specimen/observation card with coral accent and pool ripple
#let specimen-card(title, body, accent: palette.coral) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.8pt + palette.border-light,
    inset: 0pt,
    radius: 4pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Colored header band
      block(width: 100%, fill: accent.transparentize(85%), inset: (x: 1em, y: 0.5em))[
        #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
          text(weight: "bold", fill: accent-text(accent), size: 0.88em, title),
          // Small pool ripple icon
          {
            let svg = _pool-ripple-svg.replace("currentColor", accent.to-hex())
            box(image(bytes(svg), width: 16pt, height: 16pt))
          },
        )
      ],
      // Body content
      block(width: 100%, inset: (x: 1em, y: 0.6em))[
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Depth card — dark navy card representing ocean depth zones, white text
#let depth-card(title, body, depth-label: none) = {
  block(
    width: 100%,
    fill: palette.navy,
    stroke: (left: 3pt + palette.primary),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #if depth-label != none {
      place(top + right, dx: -0.3em, dy: -0.3em,
        box(
          fill: palette.primary,
          inset: (x: 0.5em, y: 0.2em),
          radius: 2pt,
        )[#text(fill: white, size: 0.6em, weight: "bold", depth-label)]
      )
    }
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.92em, title),
      {
        set text(fill: white.transparentize(15%), size: 0.82em)
        show strong: it => text(weight: "bold", fill: palette.primary, it.body)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Wave box — full-width highlight box with wave background pattern
#let wave-box(body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: accent.transparentize(90%),
    stroke: (paint: accent, thickness: 1.5pt),
    inset: (x: 1.3em, y: 0.65em),
    radius: 4pt,
  )[
    // Subtle wave in background
    #place(bottom + left,
      box(width: 100%, {
        let svg = _wave-divider-svg.replace("currentColor", accent.transparentize(60%).to-hex())
        image(bytes(svg), width: 100%, height: 6pt)
      })
    )
    #set std.align(center)
    #set text(fill: palette.ink, size: 0.92em)
    #body
  ]
}

/// Callout box — sand-colored callout for notes, warnings, tips
#let callout-box(title, body, accent: palette.sand) = {
  block(
    width: 100%,
    fill: accent.transparentize(88%),
    stroke: (top: 2.5pt + accent, rest: 0.5pt + accent.transparentize(50%)),
    inset: (x: 1.2em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 4pt, fill: accent)),
        text(weight: "bold", fill: accent-text(accent), size: 0.88em, title),
      ),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Tide tag — capsule-shaped label for categorization (like species tags)
#let tide-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: accent-text(color), size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Wave divider — decorative SVG wave separator (not a plain line)
#let tide-divider(color: palette.primary, width: 80%) = {
  std.align(center,
    box(width: width)[
      #set std.align(horizon + center)
      #grid(
        columns: (1fr, auto, 1fr),
        align: horizon,
        line(length: 100%, stroke: 0.5pt + color.transparentize(50%)),
        pad(x: 6pt, wave-divider-svg(color: color, width: 60pt)),
        line(length: 100%, stroke: 0.5pt + color.transparentize(50%)),
      )
    ]
  )
}


// ═══ 3. Theme Entry Point ═══

#let tidal-pool-theme(
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
      margin: (top: 3.25em, bottom: 1.5em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary-text,
      neutral-lightest: palette.bg,
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
