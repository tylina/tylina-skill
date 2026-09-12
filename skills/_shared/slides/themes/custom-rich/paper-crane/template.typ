// Paper Crane Theme -- Origami-Inspired Geometric Folds and Angular Shapes
// You are in a quiet studio where light filters through shoji screens.
// Folded paper cranes hang from invisible threads, casting angular shadows.
// Crisp geometric fold lines trace invisible creases across every surface,
// and diamond patterns shimmer like origami paper catching afternoon light.
// Features: persistent fold-line atmosphere on content slides, crane silhouettes,
// geometric diamond patterns, angular card components, warm coral accents.
// Touying 0.7.4 compatible. Rich tier.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow


// === Color Palette ===

#let palette = (
  primary: rgb("#E8736A"),         // coral -- warm, inviting fold accent
  dark: rgb("#3D5A80"),            // indigo -- depth, contrast headings
  accent: rgb("#D4A574"),          // cream gold -- warm metallic highlights
  sage: rgb("#7BA08C"),            // muted sage -- natural complement
  bg: rgb("#FFF9F5"),              // warm white -- paper surface
  card: rgb("#FFFCF9"),            // slightly warmer card surface
  text-dark: rgb("#2C3040"),       // near-black with warm undertone
  text-body: rgb("#3D4055"),       // softer body text
  text-light: rgb("#7A7E8F"),      // captions, metadata
  border: rgb("#EDE6DE"),          // subtle warm border
  fold-line: rgb("#D4CCC4"),      // crease color
)


// === SVG Definitions ===

// Origami crane silhouette -- the iconic folded paper bird
// Geometric, angular, unmistakably origami. Used as persistent motif.
#let _crane-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="100" viewBox="0 0 120 100">
  <polygon points="60,15 75,40 95,35 80,55 90,75 60,60 30,75 40,55 25,35 45,40" fill="currentColor" opacity="0.35"/>
  <polygon points="30,75 10,55 25,35 40,55" fill="currentColor" opacity="0.25"/>
  <polygon points="90,75 110,55 95,35 80,55" fill="currentColor" opacity="0.25"/>
  <polygon points="60,15 55,5 65,5 62,15" fill="currentColor" opacity="0.4"/>
  <polygon points="60,60 55,80 65,80 60,65" fill="currentColor" opacity="0.3"/>
  <line x1="60" y1="15" x2="60" y2="60" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
  <line x1="60" y1="40" x2="25" y2="35" stroke="currentColor" stroke-width="0.4" opacity="0.15"/>
  <line x1="60" y1="40" x2="95" y2="35" stroke="currentColor" stroke-width="0.4" opacity="0.15"/>
  <line x1="45" y1="40" x2="30" y2="75" stroke="currentColor" stroke-width="0.4" opacity="0.15"/>
  <line x1="75" y1="40" x2="90" y2="75" stroke="currentColor" stroke-width="0.4" opacity="0.15"/>
</svg>```.text

// Geometric fold-line pattern -- full-width decorative fold creases
// Represents the crease pattern of an unfolded piece of origami paper
// Used as PERSISTENT BACKGROUND on every content slide
#let _fold-lines-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="480" viewBox="0 0 840 480">
  <line x1="0" y1="0" x2="420" y2="480" stroke="currentColor" stroke-width="0.4" opacity="0.06" stroke-dasharray="8,12"/>
  <line x1="420" y1="0" x2="840" y2="480" stroke="currentColor" stroke-width="0.4" opacity="0.05" stroke-dasharray="8,12"/>
  <line x1="840" y1="0" x2="420" y2="480" stroke="currentColor" stroke-width="0.4" opacity="0.06" stroke-dasharray="8,12"/>
  <line x1="420" y1="0" x2="0" y2="480" stroke="currentColor" stroke-width="0.4" opacity="0.05" stroke-dasharray="8,12"/>
  <line x1="0" y1="240" x2="840" y2="240" stroke="currentColor" stroke-width="0.3" opacity="0.04" stroke-dasharray="4,16"/>
  <line x1="420" y1="0" x2="420" y2="480" stroke="currentColor" stroke-width="0.3" opacity="0.04" stroke-dasharray="4,16"/>
  <line x1="0" y1="120" x2="210" y2="0" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <line x1="630" y1="0" x2="840" y2="120" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <line x1="0" y1="360" x2="210" y2="480" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <line x1="630" y1="480" x2="840" y2="360" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <polygon points="420,200 440,240 420,280 400,240" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.05"/>
  <polygon points="210,100 225,120 210,140 195,120" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <polygon points="630,100 645,120 630,140 615,120" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <polygon points="210,340 225,360 210,380 195,360" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <polygon points="630,340 645,360 630,380 615,360" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
</svg>```.text

// Diamond/triangle scatter pattern -- decorative geometric shapes
// For title and ending slides as bookending element
#let _diamond-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="480" viewBox="0 0 840 480">
  <polygon points="40,20 55,40 40,60 25,40" fill="currentColor" opacity="0.15"/>
  <polygon points="50,30 60,40 50,50 40,40" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <polygon points="800,20 815,40 800,60 785,40" fill="currentColor" opacity="0.15"/>
  <polygon points="790,30 800,40 790,50 780,40" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <polygon points="40,420 55,440 40,460 25,440" fill="currentColor" opacity="0.12"/>
  <polygon points="800,420 815,440 800,460 785,440" fill="currentColor" opacity="0.12"/>
  <polygon points="150,15 160,30 140,30" fill="currentColor" opacity="0.08"/>
  <polygon points="690,18 700,33 680,33" fill="currentColor" opacity="0.08"/>
  <polygon points="320,10 328,22 312,22" fill="currentColor" opacity="0.06"/>
  <polygon points="520,12 528,24 512,24" fill="currentColor" opacity="0.06"/>
  <polygon points="150,465 160,450 140,450" fill="currentColor" opacity="0.08"/>
  <polygon points="690,462 700,447 680,447" fill="currentColor" opacity="0.08"/>
  <polygon points="15,150 25,165 15,180 5,165" fill="currentColor" opacity="0.07"/>
  <polygon points="825,150 835,165 825,180 815,165" fill="currentColor" opacity="0.07"/>
  <polygon points="15,320 25,335 15,350 5,335" fill="currentColor" opacity="0.07"/>
  <polygon points="825,320 835,335 825,350 815,335" fill="currentColor" opacity="0.07"/>
  <polygon points="750,400 758,415 770,412 762,425 768,440 750,430 732,440 738,425 730,412 742,415" fill="currentColor" opacity="0.06"/>
</svg>```.text

// Fold-corner decoration -- small triangular fold in card corners
#let _fold-corner-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
  <polygon points="0,0 24,0 0,24" fill="currentColor" opacity="0.12"/>
  <line x1="0" y1="24" x2="24" y2="0" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
  <polygon points="2,2 20,2 2,20" fill="currentColor" opacity="0.06"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render fold-lines background (persistent atmosphere on every content slide)
#let _fold-bg() = {
  let svg = _fold-lines-svg.replace("currentColor", palette.fold-line.to-hex())
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(svg), width: 100%, height: 100%, fit: "cover")))
}

/// Render crane silhouette
#let _crane-ornament(size: 50pt, color: palette.primary) = {
  let svg = _crane-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size)
}

/// Render diamond frame (bookending decoration for title/ending)
#let _diamond-frame(color: palette.primary) = {
  let svg = _diamond-frame-svg.replace("currentColor", color.to-hex())
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(svg), width: 100%, height: 100%, fit: "cover")))
}

/// Render fold-corner decoration
#let _fold-corner(size: 18pt, color: palette.accent) = {
  let svg = _fold-corner-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}


// === Background Atmosphere (MANDATORY on every content slide) ===

/// Persistent "paper crane" feeling: faint fold lines + tiny crane in corner
#let _slide-atmosphere() = {
  // Full-page fold-line crease pattern
  _fold-bg()
  // Tiny crane silhouette in top-right corner
  place(top + right, dx: -1.8em, dy: 0.5em,
    _crane-ornament(size: 22pt, color: palette.primary.transparentize(65%)))
  // Small diamond accent bottom-left
  place(bottom + left, dx: 1.5em, dy: -0.6em,
    box(width: 6pt, height: 6pt,
      rotate(45deg, block(width: 100%, height: 100%, fill: palette.accent.transparentize(75%)))))
}


// === 1. Slide Functions ===

/// Standard content slide -- clean header with angular fold-line accent
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
        set text(fill: palette.dark, size: 1.3em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Angular fold-line accent -- like a paper crease beneath the title
      {
        box(width: 55pt, height: 0pt,
          place(top + left,
            polygon(
              fill: palette.primary.transparentize(30%),
              (0pt, 0pt), (50pt, 0pt), (55pt, 2pt), (0pt, 2pt),
            )
          )
        )
      },
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
        // Small diamond as center marker
        box(width: 6pt, height: 6pt,
          place(center + horizon,
            rotate(45deg, block(width: 5pt, height: 5pt, fill: palette.primary.transparentize(40%)))))
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    _slide-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide -- spacious, centered, diamond frame + crane silhouette as bookending
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Diamond frame decoration (bookending element -- shared with ending)
    _diamond-frame(color: palette.primary)
    // Crane silhouette at top-right
    place(top + right, dx: -3em, dy: 2em,
      _crane-ornament(size: 70pt, color: palette.primary.transparentize(40%)))
    // Second smaller crane, lower-left
    place(bottom + left, dx: 4em, dy: -3em,
      _crane-ornament(size: 40pt, color: palette.accent.transparentize(50%)))
    // Center content
    set std.align(center + horizon)
    pad(x: 6em)[
      // Title
      #text(size: 2.4em, weight: "semibold", fill: palette.dark, info.title)
      #v(0.5em)
      // Angular accent line
      #std.align(center, {
        box(width: 70pt, height: 0pt,
          place(top + left,
            polygon(
              fill: palette.primary,
              (0pt, 0pt), (65pt, 0pt), (70pt, 2.5pt), (5pt, 2.5pt),
            )
          )
        )
      })
      #v(0.9em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.text-body, info.subtitle)
        v(0.6em)
      }
      // Author
      #if info.author != none {
        text(size: 0.9em, fill: palette.text-light, info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.78em, fill: palette.text-light.transparentize(20%), info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.72em, fill: palette.text-light.transparentize(30%))[#utils.display-info-date(self)]
      }
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// New section slide -- geometric with large section number and fold accent
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Subtle fold lines
    _fold-bg()
    // Section content -- left-aligned with generous whitespace
    place(left + horizon,
      block(width: 70%, inset: (left: 5em, right: 4em))[
        // Section number in faint coral
        #text(size: 3.5em, fill: palette.primary.transparentize(50%), weight: "light")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ]
        #v(0.4em)
        // Section title
        #set text(fill: palette.dark, size: 2em, weight: "medium")
        #utils.display-current-heading(level: 1, numbered: false)
        #v(0.5em)
        // Angular fold accent
        #box(width: 45pt, height: 0pt,
          place(top + left,
            polygon(
              fill: palette.primary.transparentize(20%),
              (0pt, 0pt), (40pt, 0pt), (45pt, 2pt), (0pt, 2pt),
            )
          )
        )
      ]
    )
    // Small crane in bottom-right
    place(bottom + right, dx: -3em, dy: -2em,
      _crane-ornament(size: 35pt, color: palette.primary.transparentize(60%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- dramatic, indigo background with centered text and crane motif
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Deep indigo background for dramatic contrast
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))
    // Faint fold lines on dark background
    {
      let svg = _fold-lines-svg.replace("currentColor", rgb("#FFFFFF").to-hex())
      place(top + left,
        box(width: 100%, height: 100%,
          image(bytes(svg), width: 100%, height: 100%, fit: "cover")))
    }
    // Large translucent crane in background
    place(center + horizon,
      _crane-ornament(size: 200pt, color: rgb("#FFFFFF").transparentize(92%)))
    // Centered text content
    place(center + horizon,
      block(width: 75%, inset: (x: 2em, y: 1.5em))[
        #set std.align(center)
        #set text(fill: palette.bg, size: 1.4em, weight: "medium")
        #body
        #v(0.8em)
        // Diamond dot beneath
        #box(width: 8pt, height: 8pt,
          place(center + horizon,
            rotate(45deg, block(width: 6pt, height: 6pt, fill: palette.primary.transparentize(30%)))))
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- bookends with title: diamond frame + cranes
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Diamond frame (bookends with title slide)
    _diamond-frame(color: palette.primary)
    // Crane silhouettes (bookend with title)
    place(bottom + right, dx: -3em, dy: -2.5em,
      _crane-ornament(size: 65pt, color: palette.primary.transparentize(45%)))
    place(top + left, dx: 4em, dy: 3em,
      _crane-ornament(size: 38pt, color: palette.accent.transparentize(55%)))
    // Center content
    set std.align(center + horizon)
    block(width: 65%)[
      #set std.align(center)
      #text(size: 2.2em, weight: "medium", fill: palette.dark, body)
      #v(0.5em)
      // Angular accent line
      #std.align(center, {
        box(width: 60pt, height: 0pt,
          place(top + left,
            polygon(
              fill: palette.primary,
              (0pt, 0pt), (55pt, 0pt), (60pt, 2.5pt), (5pt, 2.5pt),
            )
          )
        )
      })
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Concept card -- angular card with subtle fold-corner decoration
#let concept-card(title, body, accent: palette.primary) = {
  shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: rgb(0, 0, 0, 5%), radius: 4pt)[
    #block(
      width: 100%,
      fill: palette.card,
      stroke: 0.5pt + palette.border,
      inset: (x: 1.2em, y: 0.9em),
      radius: 4pt,
    )[
      // Fold corner decoration in top-right
      #place(top + right, dx: 0pt, dy: 0pt, _fold-corner(size: 16pt, color: accent))
      #stack(
        spacing: .8em,
        text(weight: "medium", fill: accent, size: 0.88em, title),
        [
          #set text(fill: palette.text-body, size: 0.82em)
          #body
          #lazy-v(1fr)
        ]
      )
    ]
  ]
}

/// Insight box -- left-border accent with angular emphasis (like a paper fold edge)
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.primary.transparentize(94%),
    stroke: (left: 2.5pt + palette.primary.transparentize(30%)),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "medium", fill: palette.primary.darken(10%), size: 0.88em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      ],
    )
  ]
}

/// Stat card -- diamond-shaped number display (geometric origami motif)
#let stat-card(label, value, accent: palette.dark) = {
  block(width: 100%, fill: palette.card, inset: (x: 0.8em, y: 0.7em), radius: 4pt, stroke: 0.5pt + palette.border)[
    #set std.align(center)
    #stack(
      spacing: .8em,
      box(
        width: 54pt, height: 54pt,
        inset: 0pt,
      )[
        #set std.align(center + horizon)
        #place(center + horizon,
          rotate(45deg, block(width: 38pt, height: 38pt,
            fill: accent.transparentize(90%),
            stroke: 0.8pt + accent.transparentize(55%),
          )))
        #text(fill: accent, size: 1.5em, weight: "semibold", value)
      ],
      text(fill: palette.text-light, size: 0.72em, label),
    )
  ]
}

/// Quote card -- origami-inspired quotation with SVG crane accent
#let quote-card(quote, author: none) = {
  block(width: 100%, fill: palette.card, inset: (x: 1.5em, y: 1em), radius: 4pt, stroke: 0.5pt + palette.border)[
    // Small crane icon as quote decoration
    #place(top + right, dx: -0.3em, dy: -0.3em,
      _crane-ornament(size: 20pt, color: palette.accent.transparentize(40%)))
    #set std.align(left)
    #set text(fill: palette.text-dark, size: 0.9em, style: "italic")
    #quote
    #if author != none {
      v(0.5em)
      set text(fill: palette.primary, size: 0.75em, weight: "medium", style: "normal")
      [-- #author]
    }
  ]
}

/// Fold card -- card with NO visible border, just background fill and fold-corner (borderless pattern)
#let fold-card(title, body) = {
  block(
    width: 100%,
    fill: palette.bg,
    inset: (x: 1.2em, y: 0.9em),
    radius: 4pt,
  )[
    // Fold corner top-left
    #place(top + left, dx: -0.4em, dy: -0.4em, _fold-corner(size: 14pt, color: palette.fold-line))
    #stack(
      spacing: .8em,
      text(weight: "medium", fill: palette.dark, size: 0.88em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Origami box -- colorful accent card with angular top bar (stacked pattern)
#let origami-box(title, body, accent: palette.sage) = {
  stack(spacing: 0pt,
    // Angular colored header bar
    block(width: 100%, fill: accent, inset: (x: 1em, y: 0.4em), radius: (top: 4pt), clip: true)[
      #set text(fill: white, size: 0.8em, weight: "medium")
      #title
    ],
    // Content body
    block(width: 100%, fill: palette.card, inset: (x: 1em, y: 0.7em), radius: (bottom: 4pt), stroke: (left: 0.5pt + palette.border, right: 0.5pt + palette.border, bottom: 0.5pt + palette.border), clip: true)[
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
    ],
  )
}

/// Timeline entry -- angular step indicator with fold-line connector (divider pattern)
#let timeline-entry(step, title, description) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 12pt,
    align: (center, left),
    // Step indicator -- diamond shape
    {
      box(width: 32pt, height: 32pt, inset: 0pt)[
        #set std.align(center + horizon)
        #place(center + horizon,
          rotate(45deg, block(width: 22pt, height: 22pt,
            fill: palette.primary.transparentize(85%),
            stroke: 1pt + palette.primary.transparentize(40%),
          )))
        #text(fill: palette.primary, size: 0.8em, weight: "bold", step)
      ]
    },
    // Content
    {
      block(width: 100%, inset: (y: 0.2em))[
        #stack(
          spacing: .8em,
          text(weight: "medium", fill: palette.dark, size: 0.88em, title),
          [
            #set text(fill: palette.text-body, size: 0.78em)
            #description
          ],
        )
      ]
    },
  )
}

/// Comparison card -- two-panel side-by-side with angular divider
#let comparison-card(left-title, left-body, right-title, right-body, left-accent: palette.primary, right-accent: palette.sage) = {
  block(width: 100%, fill: palette.card, stroke: 0.5pt + palette.border, radius: 4pt, clip: true)[
    #cols(
      columns: (1fr, auto, 1fr),
      column-gutter: 0pt,
      // Left panel
      block(width: 100%, inset: (x: 1em, y: 0.8em))[
        #stack(
          spacing: .8em,
          text(weight: "medium", fill: left-accent, size: 0.85em, left-title),
          [
            #set text(fill: palette.text-body, size: 0.78em)
            #left-body
          ],
        )
      ],
      // Angular divider
      block(width: 2pt, fill: palette.border)[#lazy-v(1fr)],
      // Right panel
      block(width: 100%, inset: (x: 1em, y: 0.8em))[
        #stack(
          spacing: .8em,
          text(weight: "medium", fill: right-accent, size: 0.85em, right-title),
          [
            #set text(fill: palette.text-body, size: 0.78em)
            #right-body
          ],
        )
      ],
    )
  ]
}

/// Crane divider -- SVG-based decorative separator with crane motif (NOT a plain line)
#let crane-divider(width: 80%) = {
  let svg = ```
  <svg xmlns="http://www.w3.org/2000/svg" width="400" height="16" viewBox="0 0 400 16">
    <line x1="0" y1="8" x2="170" y2="8" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
    <polygon points="185,8 190,4 195,8 200,4 205,8 200,12 195,8 190,12" fill="currentColor" opacity="0.25"/>
    <line x1="215" y1="8" x2="400" y2="8" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
    <polygon points="170,6 175,8 170,10" fill="currentColor" opacity="0.2"/>
    <polygon points="230,6 225,8 230,10" fill="currentColor" opacity="0.2"/>
  </svg>```.text
  let rendered = svg.replace("currentColor", palette.primary.to-hex())
  std.align(center, box(width: width, image(bytes(rendered), width: width, height: 10pt)))
}

/// Fold tag -- small inline tag with angular shape (like a paper label)
#let fold-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 0.5pt + color.transparentize(45%),
    inset: (x: 0.6em, y: 0.2em),
    radius: 2pt,
  )[
    #set text(fill: color, size: 0.72em, weight: "medium")
    #content
  ]
}


// === 3. Theme Entry Point ===

#let paper-crane-theme(
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
