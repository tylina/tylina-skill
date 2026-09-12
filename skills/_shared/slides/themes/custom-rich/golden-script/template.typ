// Golden-Script Theme — Mathematical elegance and proof notation aesthetics
// Golden ratio spirals, Q.E.D. tombstones, theorem boxes with vertical bars
// Proof indentation markers, mathematical symbol decorations
// Clean, precise, with subtle golden-ratio proportional layouts
// Inspired by beautifully typeset math textbooks (Knuth's Art of Programming)
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Light — Mathematical Elegance) ===

#let palette = (
  bg: rgb("#FDFCFA"),
  bg-warm: rgb("#F9F7F4"),
  text: rgb("#1B1464"),
  text-muted: rgb("#5C5A8A"),
  accent-blue: rgb("#2B4ACB"),
  accent-gold: rgb("#C8910D"),
  gold-light: rgb("#FDF6E3"),
  gold-border: rgb("#E8C547"),
  indigo-light: rgb("#EDE9FF"),
  card-bg: rgb("#FFFFFF"),
  border: rgb("#E5E3DF"),
  proof-gray: rgb("#6B6B7B"),
  qed-fill: rgb("#1B1464"),
)


// === SVG Definitions ===

// Golden ratio spiral — full page background texture (very subtle)
#let _golden-spiral-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M420,237 C420,180 380,130 330,110 C280,90 220,100 180,140 C140,180 130,240 155,290 C180,340 230,370 285,370 C340,370 385,340 410,300 C435,260 435,210 420,237" fill="none" stroke="#C8910D" stroke-width="0.6" opacity="0.12"/>
  <path d="M420,237 C420,270 440,300 465,315 C490,330 520,330 545,315 C570,300 580,270 575,245 C570,220 550,200 525,195 C500,190 480,195 465,210 C450,225 445,240 420,237" fill="none" stroke="#C8910D" stroke-width="0.5" opacity="0.10"/>
  <path d="M420,237 C420,225 415,215 407,208 C399,201 389,198 380,200 C371,202 364,208 360,217 C356,226 358,236 363,243 C368,250 376,254 384,253 C392,252 398,248 402,242 C406,236 407,230 420,237" fill="none" stroke="#C8910D" stroke-width="0.4" opacity="0.08"/>
  <path d="M660,80 C680,60 710,50 740,55 C770,60 790,80 795,105 C800,130 790,155 770,170" fill="none" stroke="#2B4ACB" stroke-width="0.4" opacity="0.06"/>
  <path d="M100,380 C120,400 110,430 90,440 C70,450 45,445 30,430 C15,415 15,395 25,380" fill="none" stroke="#2B4ACB" stroke-width="0.4" opacity="0.06"/>
  <rect x="780" y="420" width="8" height="8" fill="#1B1464" opacity="0.04"/>
  <rect x="50" y="40" width="6" height="6" fill="#1B1464" opacity="0.03"/>
  <circle cx="700" cy="50" r="2" fill="#C8910D" opacity="0.10"/>
  <circle cx="140" cy="420" r="2" fill="#C8910D" opacity="0.10"/>
  <circle cx="420" cy="237" r="3" fill="#C8910D" opacity="0.08"/>
  <line x1="0" y1="293" x2="840" y2="293" stroke="#E5E3DF" stroke-width="0.3" opacity="0.15"/>
  <line x1="519" y1="0" x2="519" y2="474" stroke="#E5E3DF" stroke-width="0.3" opacity="0.12"/>
</svg>```.text

// Fibonacci grid pattern — for section slides
#let _fibonacci-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="0" y="0" width="519" height="293" fill="none" stroke="#C8910D" stroke-width="0.8" opacity="0.15"/>
  <rect x="0" y="293" width="519" height="181" fill="none" stroke="#C8910D" stroke-width="0.6" opacity="0.12"/>
  <rect x="519" y="0" width="321" height="293" fill="none" stroke="#C8910D" stroke-width="0.6" opacity="0.12"/>
  <rect x="519" y="293" width="321" height="181" fill="none" stroke="#C8910D" stroke-width="0.5" opacity="0.10"/>
  <rect x="519" y="293" width="198" height="181" fill="none" stroke="#C8910D" stroke-width="0.4" opacity="0.08"/>
  <rect x="717" y="293" width="123" height="112" fill="none" stroke="#C8910D" stroke-width="0.3" opacity="0.06"/>
  <rect x="717" y="405" width="76" height="69" fill="none" stroke="#C8910D" stroke-width="0.3" opacity="0.05"/>
  <path d="M519,293 C519,130 400,0 260,0" fill="none" stroke="#C8910D" stroke-width="0.7" opacity="0.10"/>
  <path d="M519,293 C519,394 600,474 700,474" fill="none" stroke="#C8910D" stroke-width="0.5" opacity="0.08"/>
  <circle cx="519" cy="293" r="4" fill="#C8910D" opacity="0.12"/>
  <circle cx="260" cy="0" r="2" fill="#2B4ACB" opacity="0.08"/>
  <circle cx="0" cy="293" r="2" fill="#2B4ACB" opacity="0.08"/>
</svg>```.text

// Golden ratio frame — shared bookend for title and ending slides
#let _golden-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="28" y="18" width="784" height="438" rx="2" ry="2" fill="none" stroke="#C8910D" stroke-width="1.8" opacity="0.5"/>
  <rect x="36" y="26" width="768" height="422" rx="1" ry="1" fill="none" stroke="#2B4ACB" stroke-width="0.6" opacity="0.2"/>
  <path d="M28,18 L28,80 M28,18 L90,18" fill="none" stroke="#C8910D" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <path d="M812,18 L812,80 M812,18 L750,18" fill="none" stroke="#C8910D" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <path d="M28,456 L28,394 M28,456 L90,456" fill="none" stroke="#C8910D" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <path d="M812,456 L812,394 M812,456 L750,456" fill="none" stroke="#C8910D" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <path d="M380,18 C400,8 420,8 440,18" fill="none" stroke="#C8910D" stroke-width="1" opacity="0.4"/>
  <path d="M380,456 C400,466 420,466 440,456" fill="none" stroke="#C8910D" stroke-width="1" opacity="0.4"/>
  <circle cx="28" cy="18" r="3.5" fill="#C8910D" opacity="0.7"/>
  <circle cx="812" cy="18" r="3.5" fill="#C8910D" opacity="0.7"/>
  <circle cx="28" cy="456" r="3.5" fill="#C8910D" opacity="0.7"/>
  <circle cx="812" cy="456" r="3.5" fill="#C8910D" opacity="0.7"/>
  <rect x="790" y="434" width="10" height="10" fill="#1B1464" opacity="0.15"/>
</svg>```.text

// Coordinate axes — for section slides
#let _axes-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <line x1="10" y1="110" x2="110" y2="110" stroke="#2B4ACB" stroke-width="1.5" opacity="0.4"/>
  <line x1="10" y1="110" x2="10" y2="10" stroke="#2B4ACB" stroke-width="1.5" opacity="0.4"/>
  <path d="M110,110 L105,107 M110,110 L105,113" fill="none" stroke="#2B4ACB" stroke-width="1.2" opacity="0.4"/>
  <path d="M10,10 L7,15 M10,10 L13,15" fill="none" stroke="#2B4ACB" stroke-width="1.2" opacity="0.4"/>
  <path d="M10,110 C30,90 50,60 70,50 C90,40 100,35 110,20" fill="none" stroke="#C8910D" stroke-width="1" opacity="0.3"/>
  <circle cx="10" cy="110" r="2" fill="#2B4ACB" opacity="0.5"/>
  <circle cx="70" cy="50" r="1.5" fill="#C8910D" opacity="0.4"/>
  <circle cx="110" cy="20" r="1.5" fill="#C8910D" opacity="0.4"/>
</svg>```.text

// Integral curve border — decorative left border element
#let _integral-border-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="200" viewBox="0 0 20 200">
  <path d="M10,0 C14,10 16,20 16,30 C16,50 14,70 12,90 C10,110 10,130 12,150 C14,170 14,180 10,200" fill="none" stroke="#C8910D" stroke-width="1.5" opacity="0.5"/>
  <path d="M10,0 C6,5 4,10 5,15" fill="none" stroke="#C8910D" stroke-width="2" opacity="0.6" stroke-linecap="round"/>
  <path d="M10,200 C14,195 16,190 15,185" fill="none" stroke="#C8910D" stroke-width="2" opacity="0.6" stroke-linecap="round"/>
  <circle cx="10" cy="0" r="2" fill="#C8910D" opacity="0.5"/>
  <circle cx="10" cy="200" r="2" fill="#C8910D" opacity="0.5"/>
  <circle cx="12" cy="100" r="1.5" fill="#2B4ACB" opacity="0.3"/>
  <circle cx="16" cy="30" r="1" fill="#2B4ACB" opacity="0.25"/>
  <circle cx="12" cy="150" r="1" fill="#2B4ACB" opacity="0.25"/>
</svg>```.text

// QED tombstone decorative divider
#let _qed-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <line x1="0" y1="8" x2="130" y2="8" stroke="#C8910D" stroke-width="0.8" opacity="0.4"/>
  <line x1="170" y1="8" x2="300" y2="8" stroke="#C8910D" stroke-width="0.8" opacity="0.4"/>
  <rect x="140" y="3" width="10" height="10" fill="#1B1464" opacity="0.6"/>
  <circle cx="130" cy="8" r="1.5" fill="#C8910D" opacity="0.5"/>
  <circle cx="170" cy="8" r="1.5" fill="#C8910D" opacity="0.5"/>
  <circle cx="60" cy="8" r="1" fill="#2B4ACB" opacity="0.2"/>
  <circle cx="240" cy="8" r="1" fill="#2B4ACB" opacity="0.2"/>
  <line x1="135" y1="8" x2="140" y2="8" stroke="#1B1464" stroke-width="0.5" opacity="0.3"/>
  <line x1="150" y1="8" x2="155" y2="8" stroke="#1B1464" stroke-width="0.5" opacity="0.3"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render golden spiral background
#let golden-spiral-bg() = {
  image(bytes(_golden-spiral-svg), width: 100%, height: 100%)
}

/// Render fibonacci grid background
#let fibonacci-grid-bg() = {
  image(bytes(_fibonacci-grid-svg), width: 100%, height: 100%)
}

/// Render golden frame overlay (bookend for title/ending)
#let golden-frame() = {
  image(bytes(_golden-frame-svg), width: 100%, height: 100%)
}

/// Render coordinate axes decoration
#let axes-decoration(size: 80pt) = {
  image(bytes(_axes-svg), width: size, height: size)
}

/// Render integral curve border
#let integral-border(height: 120pt) = {
  image(bytes(_integral-border-svg), width: 14pt, height: height)
}

/// Render QED divider
#let qed-divider-svg(width: 100%) = {
  box(width: width, image(bytes(_qed-divider-svg), width: width, height: 12pt))
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides — golden spiral + corner markers
#let _content-atmosphere() = {
  // Faint golden spiral across entire slide
  place(top + left, box(width: 100%, height: 100%, golden-spiral-bg()))
  // Small golden ratio marker dots at golden-ratio positions
  place(top + left, dx: 61.8%, dy: 5pt,
    circle(radius: 2pt, fill: palette.accent-gold.transparentize(80%)))
  place(bottom + right, dx: -38.2%, dy: -8pt,
    circle(radius: 1.5pt, fill: palette.accent-blue.transparentize(85%)))
  // Subtle QED tombstone in bottom-right corner
  place(bottom + right, dx: -1em, dy: -0.6em,
    rect(width: 5pt, height: 5pt, fill: palette.qed-fill.transparentize(90%)))
}


// === 1. Slide Functions ===

/// Standard content slide — warm white bg, golden spiral atmosphere, indigo text
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.5em, bottom: 0.15em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Gold underline accent
      block(width: 140pt, height: 2pt, fill: palette.accent-gold, radius: 1pt),
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
        // QED tombstone as page separator
        rect(width: 5pt, height: 5pt, fill: palette.qed-fill.transparentize(60%))
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

/// Title slide — golden frame bookend, spiral background, centered info
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Golden spiral background
    place(top + left, box(width: 100%, height: 100%, golden-spiral-bg()))
    // Golden frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, golden-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.text, info.title)
      #v(0.4em)
      // Gold rule
      #block(width: 200pt, height: 2.5pt, fill: palette.accent-gold, radius: 1pt)
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.accent-blue, weight: "medium", info.subtitle)
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
        text(size: 0.8em, fill: palette.accent-gold)[#utils.display-info-date(self)]
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

/// New section slide — Fibonacci grid, axes decoration, section title
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg-warm))
    // Fibonacci grid
    place(top + left, box(width: 100%, height: 100%, fibonacci-grid-bg()))
    // Left gold accent bar
    place(top + left, block(width: 4pt, height: 100%, fill: palette.accent-gold))
    // Axes decoration in top-right corner
    place(top + right, dx: -2.5em, dy: 1.5em, axes-decoration(size: 70pt))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in gold
      #text(size: 3.5em, fill: palette.accent-gold, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Gold rule
      #block(width: 180pt, height: 2pt, fill: palette.accent-gold, radius: 1pt)
      #v(0.5em)
      // Section title
      #set text(fill: palette.text, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(1fr)
    ]
    // QED tombstone at bottom-right
    place(bottom + right, dx: -2em, dy: -1.5em,
      rect(width: 8pt, height: 8pt, fill: palette.qed-fill.transparentize(70%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — centered statement with golden accents
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg-warm))
    // Golden spiral
    place(top + left, box(width: 100%, height: 100%, golden-spiral-bg()))
    // Emphasis frame
    place(center + horizon,
      rect(width: 82%, height: 70%,
        fill: none,
        stroke: (paint: palette.accent-gold, thickness: 1.5pt)))
    // Keep the focal copy in normal flow so Touying can measure the slide.
    align(center + horizon,
      block(width: 70%)[
        #set text(fill: palette.text, size: 1.4em, weight: "bold")
        #stack(spacing: .8em,
          body,
          std.align(center, qed-divider-svg(width: 180pt)),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — golden frame bookend (shared with title), centered farewell
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
    // Golden spiral
    place(top + left, box(width: 100%, height: 100%, golden-spiral-bg()))
    // Golden frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, golden-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // QED divider above
      #qed-divider-svg(width: 220pt)
      #v(0.8em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.text, body)
      #v(0.5em)
      // Gold accent rule below
      #block(width: 5em, height: 2.5pt, fill: palette.accent-gold, radius: 1pt)
      #v(0.4em)
      // Final QED tombstone
      #rect(width: 10pt, height: 10pt, fill: palette.qed-fill)
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Theorem box — formal theorem statement with gold left border
#let theorem-box(title, body, number: none) = {
  block(
    width: 100%,
    fill: palette.gold-light,
    stroke: (left: 4pt + palette.accent-gold, rest: 1pt + palette.gold-border),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 3pt),
  )[
    // Header with theorem label
    #stack(dir: ltr, spacing: 6pt,
      text(weight: "bold", fill: palette.accent-gold, size: 0.9em)[Theorem],
      if number != none { text(fill: palette.accent-gold, size: 0.9em)[(#number)] },
      text(weight: "bold", fill: palette.text, size: 0.9em, title),
    )
    #v(4pt)
    #block(width: 60pt, height: 1.5pt, fill: palette.accent-gold.transparentize(50%))
    #v(4pt)
    #set text(fill: palette.text, size: 0.82em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}

/// Proof block — indented proof with Q.E.D. tombstone at end
#let proof-block(body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 2pt + palette.proof-gray),
    inset: (left: 1.5em, right: 1em, y: 0.7em),
    radius: (right: 2pt),
  )[
    #text(weight: "semibold", fill: palette.proof-gray, size: 0.82em, style: "italic")[Proof.]
    #h(4pt)
    #set text(fill: palette.text, size: 0.80em)
    #body
    #h(1fr)
    // Q.E.D. tombstone
    #rect(width: 7pt, height: 7pt, fill: palette.qed-fill)
    #lazy-v(1fr)
  ]
}

/// Lemma card — subsidiary result card
#let lemma-card(title, body, number: none) = {
  block(
    width: 100%,
    fill: palette.indigo-light,
    stroke: (left: 3pt + palette.accent-blue, rest: 1pt + palette.accent-blue.transparentize(60%)),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      text(weight: "bold", fill: palette.accent-blue, size: 0.88em)[Lemma],
      if number != none { text(fill: palette.accent-blue, size: 0.88em)[(#number)] },
      text(weight: "bold", fill: palette.text, size: 0.88em, title),
    )
    #v(4pt)
    #set text(fill: palette.text, size: 0.80em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}

/// Corollary note — derived result annotation
#let corollary-note(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + palette.accent-gold.transparentize(30%), rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      text(weight: "bold", fill: palette.accent-gold, size: 0.85em)[Corollary.],
      text(weight: "semibold", fill: palette.text, size: 0.85em, title),
    )
    #v(3pt)
    #set text(fill: palette.text, size: 0.80em)
    #body
    #lazy-v(1fr)
  ]
}

/// Definition box — formal definition with distinct styling
#let definition-box(term, body) = {
  block(
    width: 100%,
    fill: palette.bg-warm,
    stroke: (left: 4pt + palette.text, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      text(weight: "bold", fill: palette.text, size: 0.9em)[Definition.],
      text(weight: "bold", fill: palette.accent-blue, size: 0.9em, term),
    )
    #v(4pt)
    #block(width: 50pt, height: 1.5pt, fill: palette.text.transparentize(70%))
    #v(4pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Axiom tag — capsule label for assumptions
#let axiom-tag(content, number: none) = {
  box(
    fill: palette.gold-light,
    stroke: 1pt + palette.accent-gold.transparentize(30%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      text(fill: palette.accent-gold, size: 0.72em, weight: "bold")[A#if number != none [#number]],
      text(fill: palette.text, size: 0.72em, weight: "semibold", content),
    )
  ]
}

/// QED divider — decorative separator with tombstone
#let qed-divider(width: 80%) = {
  std.align(center, qed-divider-svg(width: width))
}

/// Proposition card — general claim card
#let proposition-card(title, body, number: none) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + palette.accent-gold, top: 1pt + palette.border, right: 1pt + palette.border, bottom: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      text(weight: "bold", fill: palette.accent-gold, size: 0.88em)[Proposition],
      if number != none { text(fill: palette.accent-gold, size: 0.88em)[(#number)] },
      text(weight: "bold", fill: palette.text, size: 0.88em, title),
    )
    #v(4pt)
    #set text(fill: palette.text, size: 0.80em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}

/// Example box — worked example with distinct header
#let example-box(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + palette.proof-gray, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      text(weight: "bold", fill: palette.proof-gray, size: 0.88em)[Example.],
      text(weight: "semibold", fill: palette.text, size: 0.88em, title),
    )
    #v(4pt)
    #set text(fill: palette.text, size: 0.80em)
    #body
    #lazy-v(1fr)
  ]
}

/// Remark note — side observation/annotation
#let remark-note(body) = {
  block(
    width: 100%,
    fill: palette.bg-warm,
    stroke: (left: 2pt + palette.text-muted),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
    radius: (right: 2pt),
  )[
    #text(weight: "semibold", fill: palette.text-muted, size: 0.78em)[Remark.]
    #h(4pt)
    #set text(fill: palette.text-muted, size: 0.78em)
    #body
    #lazy-v(1fr)
  ]
}

/// Conjecture card — open question/hypothesis
#let conjecture-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + rgb("#D4380D"), rest: 1pt + rgb("#D4380D").transparentize(70%)),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      text(weight: "bold", fill: rgb("#D4380D"), size: 0.88em)[Conjecture.],
      text(weight: "semibold", fill: palette.text, size: 0.88em, title),
    )
    #v(4pt)
    #set text(fill: palette.text, size: 0.80em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}


// === 3. Theme Entry Point ===

#let golden-script-theme(
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
      primary: palette.accent-gold,
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
