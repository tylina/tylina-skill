// Chalkboard Theme — Classic green chalkboard / blackboard academic aesthetic
// Dark green background with chalk-white text, hand-drawn style SVG elements
// Features: chalk strokes, dashed borders, wooden frame, chalk dust effects
// Perfect for academic lectures, university talks, math/science presentations
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#2D4A3E"),
  ink: rgb("#F0EDE5"),
  accent: rgb("#FFE066"),
  secondary: rgb("#7FDBDA"),
  chalk-pink: rgb("#FFB4B4"),
  chalk-orange: rgb("#FFB366"),
  wood-frame: rgb("#5C3D2E"),
  dust: rgb("#F0EDE5").transparentize(85%),
  ink-muted: rgb("#F0EDE5").transparentize(35%),
  grid-faint: rgb("#F0EDE5").transparentize(90%),
)


// ═══ SVG Definitions ═══

// Chalk stroke underline — wavy imperfect line simulating hand-drawn chalk
#let _chalk-underline-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="8" viewBox="0 0 200 8">
  <path d="M0,5 C5,3 10,6 15,4 C20,2 25,6 30,4 C35,2 40,5 45,3 C50,5 55,2 60,4 C65,6 70,3 75,5 C80,3 85,6 90,4 C95,2 100,5 105,3 C110,5 115,2 120,4 C125,6 130,3 135,5 C140,3 145,6 150,4 C155,2 160,5 165,3 C170,5 175,3 180,5 C185,3 190,5 195,4 L200,4" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"/>
</svg>```.text

// Wooden frame border — rectangle with wood-grain texture (parallel wavy lines)
#let _wood-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="4" y="4" width="832" height="466" fill="none" stroke="#5C3D2E" stroke-width="12" rx="3"/>
  <rect x="14" y="14" width="812" height="446" fill="none" stroke="#5C3D2E" stroke-width="2" rx="2"/>
  <path d="M6,20 C10,18 14,22 18,20 C22,18 26,21 30,19" fill="none" stroke="#7A5440" stroke-width="0.8" opacity="0.5"/>
  <path d="M6,30 C12,28 16,32 22,29 C26,27 30,31 34,29" fill="none" stroke="#7A5440" stroke-width="0.6" opacity="0.4"/>
  <path d="M810,20 C814,18 818,22 822,20 C826,18 830,21 834,19" fill="none" stroke="#7A5440" stroke-width="0.8" opacity="0.5"/>
  <path d="M6,450 C10,448 14,452 18,450 C22,448 26,451 30,449" fill="none" stroke="#7A5440" stroke-width="0.8" opacity="0.5"/>
  <path d="M810,450 C814,448 818,452 822,450 C826,448 830,451 834,449" fill="none" stroke="#7A5440" stroke-width="0.8" opacity="0.5"/>
</svg>```.text

// Hand-drawn quotation marks — rough curves
#let _chalk-quote-open-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="28" viewBox="0 0 32 28">
  <path d="M4,20 C3,16 4,12 7,9 C9,7 12,6 14,6 C13,10 11,13 11,16 C12,16 14,17 14,20 C14,23 12,25 9,25 C6,25 4,23 4,20Z" fill="currentColor" opacity="0.8"/>
  <path d="M18,20 C17,16 18,12 21,9 C23,7 26,6 28,6 C27,10 25,13 25,16 C26,16 28,17 28,20 C28,23 26,25 23,25 C20,25 18,23 18,20Z" fill="currentColor" opacity="0.8"/>
</svg>```.text

// Hand-drawn star for ending slide
#let _chalk-star-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48">
  <path d="M24,4 L28,18 L42,18 L31,27 L35,42 L24,33 L13,42 L17,27 L6,18 L20,18 Z" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M24,8 L27,17 L38,17 L29,24 L32,37 L24,30 L16,37 L19,24 L10,17 L21,17 Z" fill="currentColor" opacity="0.3"/>
</svg>```.text

// Chalk divider line — irregular horizontal separator
#let _chalk-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="6" viewBox="0 0 300 6">
  <path d="M0,3 C8,1 16,5 24,3 C32,1 40,4 48,2 C56,4 64,1 72,3 C80,5 88,2 96,4 C104,2 112,5 120,3 C128,1 136,4 144,2 C152,4 160,1 168,3 C176,5 184,2 192,3 C200,4 208,2 216,3 C224,4 232,2 240,3 C248,4 256,2 264,3 C272,4 280,2 288,3 L300,3" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" opacity="0.9"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render the chalk underline with a given color
#let chalk-underline(color: palette.ink, width: 100%) = {
  let svg = _chalk-underline-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 6pt))
}

/// Render chalk divider
#let chalk-divider(color: palette.ink, width: 60%) = {
  let svg = _chalk-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 5pt)))
}

/// Render wooden frame overlay (for title slide)
#let wood-frame() = {
  let svg = _wood-frame-svg.replace("#5C3D2E", palette.wood-frame.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render chalk quotation marks
#let chalk-quote-mark(color: palette.ink) = {
  let svg = _chalk-quote-open-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: 24pt, height: 20pt))
}

/// Render chalk star
#let chalk-star(color: palette.accent) = {
  let svg = _chalk-star-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: 36pt, height: 36pt))
}


// ═══ Helper Functions ═══

/// Faint ruled lines background (like ruled chalkboard)
#let ruled-lines-bg(line-count: 12) = {
  for i in range(line-count) {
    let y-pos = (i + 1) * (100% / (line-count + 1))
    place(top + left, dy: y-pos,
      line(length: 100%, stroke: (paint: palette.grid-faint, thickness: 0.5pt, dash: "loosely-dashed")))
  }
}

/// Chalk dust scatter effect (decorative dots)
#let chalk-dust(count: 8, color: palette.dust) = {
  let positions = (
    (5pt, 2pt), (15pt, 5pt), (28pt, 1pt), (42pt, 4pt),
    (55pt, 2pt), (68pt, 5pt), (80pt, 1pt), (92pt, 3pt),
  )
  for i in range(calc.min(count, positions.len())) {
    let (x, y) = positions.at(i)
    place(dx: x, dy: y, circle(radius: 1pt, fill: color))
  }
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — green chalkboard bg, faint ruled lines, chalk-white text
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
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
      // Chalk underline below title
      chalk-underline(color: palette.accent, width: 120pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.65em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      // Small chalk dot separator
      box(circle(radius: 2pt, fill: palette.ink-muted)),
      {
        set std.align(right)
        context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    ruled-lines-bg(line-count: 12)
    place(bottom + right, dx: -70pt, dy: -10pt,
      chalk-dust(count: 5, color: palette.dust))
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

/// Title slide — wooden frame border, "Class: Title" in chalk, date below
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Green chalkboard background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Wooden frame border
    place(top + left, box(width: 100%, height: 100%, wood-frame()))
    // Faint ruled lines
    ruled-lines-bg(line-count: 10)
    // Chalk dust in corners
    place(top + right, dx: -40pt, dy: 20pt, chalk-dust(count: 5, color: palette.dust))
    place(bottom + left, dx: 30pt, dy: -20pt, chalk-dust(count: 4, color: palette.dust))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title in chalk
      #text(size: 2.4em, weight: "bold", fill: palette.ink, info.title)
      #v(0.3em)
      // Chalk underline
      #chalk-underline(color: palette.accent, width: 180pt)
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.secondary, info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.ink, weight: "regular", info.author)
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
        text(size: 0.8em, fill: palette.chalk-orange)[#utils.display-info-date(self)]
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

/// New section slide — yellow chalk section number, white title, chalk underline
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
    // Green chalkboard background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Faint ruled lines
    ruled-lines-bg(line-count: 8)
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in yellow chalk
      #text(size: 3em, fill: palette.accent, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.4em)
      // Section title in white chalk
      #set text(fill: palette.ink, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Chalk underline
      #chalk-underline(color: palette.accent, width: 200pt)
      #v(0.5em)
      // Chalk dust decoration
      #chalk-dust(count: 6, color: palette.dust)
      #v(1fr)
    ]
    // Chalk divider at bottom
    place(bottom + center, dy: -2em, chalk-divider(color: palette.ink-muted, width: 40%))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — single chalk statement, large and centered, with chalk emphasis marks
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
    // Green chalkboard background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Ruled lines
    ruled-lines-bg(line-count: 10)
    // Dashed chalk border (emphasis frame)
    place(center + horizon,
      rect(width: 88%, height: 82%,
        fill: none,
        stroke: (paint: palette.ink-muted, thickness: 1.5pt, dash: "dashed")))
    // Center content
    place(center + horizon,
      block(width: 76%, height: auto,
        align(center)[
          #set text(fill: palette.ink, size: 1.4em, weight: "bold")
          #body
          #v(0.5em)
          #chalk-underline(color: palette.accent, width: 150pt)
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — chalkboard with "Class Dismissed" and chalk-drawn star
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
    // Green chalkboard background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Wooden frame
    place(top + left, box(width: 100%, height: 100%, wood-frame()))
    // Ruled lines
    ruled-lines-bg(line-count: 8)
    // Chalk dust scattered
    place(top + left, dx: 60pt, dy: 40pt, chalk-dust(count: 6, color: palette.dust))
    place(bottom + right, dx: -50pt, dy: -30pt, chalk-dust(count: 5, color: palette.dust))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Chalk star above
      #chalk-star(color: palette.accent)
      #v(0.6em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.ink, body)
      #v(0.4em)
      // Chalk underline decoration
      #chalk-underline(color: palette.secondary, width: 160pt)
      #v(0.6em)
      // Small chalk divider
      #chalk-divider(color: palette.ink-muted, width: 120pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Chalk card — card with dashed chalk border, optional colored chalk header
#let chalk-card(title, body, accent: palette.ink) = {
  block(
    width: 100%,
    fill: palette.bg.lighten(5%),
    stroke: (paint: accent, thickness: 2pt, dash: "dashed"),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Colored chalk header
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      block(width: 60pt, height: 1.5pt, fill: accent.transparentize(50%)),
      [
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Chalk stat — Centered value above its label, with chalk-dust decoration
#let chalk-stat(label, value, color: palette.accent) = {
  block(
    width: 100%,
    fill: palette.bg.lighten(3%),
    stroke: (paint: color.transparentize(40%), thickness: 1.5pt, dash: "dashed"),
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      block(width: 100%, height: 2.25em, inset: 0pt)[
        #set std.align(center + horizon)
        #set text(fill: color, size: 1.5em, weight: "bold")
        #place(top + right, dx: -5pt, dy: 5pt,
          chalk-dust(count: 4, color: palette.dust))
        #box(value)
      ],
      text(fill: palette.ink-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Chalk quote — quote with large hand-drawn quotation marks
#let chalk-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.bg.lighten(4%),
    stroke: (left: (paint: palette.secondary, thickness: 3pt, dash: "dashed")),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    // Large chalk quotation mark
    #place(top + left, dx: -0.3em, dy: -0.2em, chalk-quote-mark(color: palette.secondary.transparentize(40%)))
    #h(1.2em)
    #set text(fill: palette.ink, size: 0.88em, style: "italic")
    #quote
    #if author != none {
      v(0.3em)
      set text(fill: palette.accent, size: 0.8em, weight: "bold", style: "normal")
      [-- #author]
    }
    #lazy-v(1fr)
  ]
}

/// Eraser box — content box with slightly "smudged" appearance (lower opacity bg)
#let eraser-box(title, body) = {
  block(
    width: 100%,
    fill: palette.ink.transparentize(92%),
    stroke: (paint: palette.ink.transparentize(70%), thickness: 1pt, dash: "dotted"),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.ink.transparentize(20%), size: 0.9em, title),
      [
      #set text(fill: palette.ink.transparentize(15%), size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Lesson tag — small tag with chalk-circle around text
#let lesson-tag(content, color: palette.accent) = {
  box(
    fill: color.transparentize(85%),
    stroke: (paint: color, thickness: 1.5pt, dash: "dashed"),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color, size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Board section — divided area with hand-drawn chalk divider line
#let board-section(title, body) = {
  block(width: 100%)[
    #stack(spacing: .8em,
      text(fill: palette.accent, size: 0.95em, weight: "bold", title),
      stack(
        spacing: .8em,
        chalk-divider(color: palette.ink-muted, width: 100%),
        {
          set text(fill: palette.ink, size: 0.82em)
          body
        },
      ),
    )
  ]
}

/// Formula box — display box for equations/key formulas with chalk border emphasis
#let formula-box(body, color: palette.accent) = {
  block(
    width: 100%,
    fill: palette.bg.lighten(6%),
    stroke: (paint: color, thickness: 2.5pt, dash: "dashed"),
    inset: (x: 1.5em, y: 1em),
    radius: 4pt,
  )[
    #set std.align(center)
    #set text(fill: palette.ink, size: 1.1em)
    #body
  ]
}


// ═══ 3. Theme Entry Point ═══

#let chalkboard-theme(
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
      primary: palette.accent,
      neutral-lightest: palette.ink,
      neutral-darkest: palette.bg,
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
