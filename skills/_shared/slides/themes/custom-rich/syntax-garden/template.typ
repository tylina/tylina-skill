// Syntax Garden Theme — A garden where code grows like plants
// Soft cream background with deep forest greens, leaf accents, warm earth tones
// Growing/branching tree metaphor where each lesson builds on previous
// Perfect for programming tutorials, coding workshops, tech education
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct -- Rich Theme) ===

#let palette = (
  bg: rgb("#FDFCF7"),
  ink: rgb("#1B4332"),
  accent: rgb("#40916C"),
  secondary: rgb("#8B5E3C"),
  leaf-light: rgb("#95D5B2"),
  earth-light: rgb("#D4A574"),
  ink-muted: rgb("#1B4332").transparentize(50%),
  bg-dark: rgb("#2D6A4F"),
  error-red: rgb("#9B2226"),
  success-green: rgb("#2D6A4F"),
)


// === SVG Definitions ===

// Branch-corner SVG -- subtle growing branch for bottom-right of content slides
// 8+ path elements with varying opacities simulating growth
#let _branch-corner-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="180" height="160" viewBox="0 0 180 160">
  <path d="M180,160 C170,140 165,120 168,100" fill="none" stroke="#8B5E3C" stroke-width="2.5" opacity="0.35" stroke-linecap="round"/>
  <path d="M168,100 C165,85 160,70 155,58" fill="none" stroke="#8B5E3C" stroke-width="2" opacity="0.3" stroke-linecap="round"/>
  <path d="M168,100 C175,88 178,75 176,62" fill="none" stroke="#8B5E3C" stroke-width="1.5" opacity="0.25" stroke-linecap="round"/>
  <path d="M155,58 C148,50 142,45 135,42" fill="none" stroke="#8B5E3C" stroke-width="1.2" opacity="0.2" stroke-linecap="round"/>
  <path d="M176,62 C180,50 179,40 175,32" fill="none" stroke="#8B5E3C" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <ellipse cx="135" cy="40" rx="6" ry="4" fill="#40916C" opacity="0.2" transform="rotate(-20 135 40)"/>
  <ellipse cx="150" cy="52" rx="5" ry="3.5" fill="#40916C" opacity="0.18" transform="rotate(15 150 52)"/>
  <ellipse cx="175" cy="30" rx="5" ry="3" fill="#40916C" opacity="0.15" transform="rotate(-10 175 30)"/>
  <ellipse cx="160" cy="68" rx="4" ry="3" fill="#95D5B2" opacity="0.2" transform="rotate(25 160 68)"/>
  <ellipse cx="142" cy="48" rx="4" ry="2.5" fill="#95D5B2" opacity="0.15" transform="rotate(-30 142 48)"/>
  <path d="M180,160 C172,150 170,142 172,132" fill="none" stroke="#8B5E3C" stroke-width="1.8" opacity="0.25" stroke-linecap="round"/>
  <ellipse cx="172" cy="128" rx="5" ry="3" fill="#40916C" opacity="0.15" transform="rotate(10 172 128)"/>
</svg>```.text

// Tree-frame SVG -- trunk+canopy silhouette forming a frame border for title/ending
#let _tree-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="6" y="6" width="828" height="462" fill="none" stroke="#8B5E3C" stroke-width="4" rx="12"/>
  <rect x="12" y="12" width="816" height="450" fill="none" stroke="#40916C" stroke-width="1.5" rx="8" opacity="0.4"/>
  <path d="M30,474 L30,400 C30,380 35,360 45,345 C55,330 50,315 42,300 C34,285 38,265 50,250 C62,235 58,220 48,205" fill="none" stroke="#8B5E3C" stroke-width="5" opacity="0.5" stroke-linecap="round"/>
  <ellipse cx="48" cy="195" rx="25" ry="18" fill="#40916C" opacity="0.2"/>
  <ellipse cx="35" cy="210" rx="20" ry="14" fill="#95D5B2" opacity="0.15"/>
  <ellipse cx="62" cy="200" rx="18" ry="12" fill="#40916C" opacity="0.15"/>
  <path d="M810,474 L810,410 C810,392 805,375 798,360 C791,345 795,328 805,315 C815,302 812,285 802,270" fill="none" stroke="#8B5E3C" stroke-width="5" opacity="0.5" stroke-linecap="round"/>
  <ellipse cx="802" cy="260" rx="22" ry="16" fill="#40916C" opacity="0.2"/>
  <ellipse cx="815" cy="275" rx="18" ry="12" fill="#95D5B2" opacity="0.15"/>
  <ellipse cx="790" cy="265" rx="16" ry="11" fill="#40916C" opacity="0.15"/>
  <path d="M100,6 C105,20 115,30 130,35 C145,40 155,32 160,20 C165,8 170,6 180,6" fill="none" stroke="#40916C" stroke-width="1.5" opacity="0.3" stroke-linecap="round"/>
  <ellipse cx="130" cy="18" rx="8" ry="5" fill="#95D5B2" opacity="0.15"/>
  <path d="M650,6 C655,18 665,28 680,32 C695,36 705,28 708,18 C711,8 718,6 728,6" fill="none" stroke="#40916C" stroke-width="1.5" opacity="0.3" stroke-linecap="round"/>
  <ellipse cx="680" cy="16" rx="7" ry="4.5" fill="#95D5B2" opacity="0.12"/>
</svg>```.text

// Vine-divider SVG -- horizontal vine with leaves
#let _vine-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <path d="M0,8 C15,6 30,10 45,8 C60,6 75,10 90,8 C105,6 120,10 135,8 C150,6 165,10 180,8 C195,6 210,10 225,8 C240,6 255,10 270,8 C285,6 295,8 300,8" fill="none" stroke="#8B5E3C" stroke-width="1.5" opacity="0.6" stroke-linecap="round"/>
  <ellipse cx="45" cy="6" rx="5" ry="3" fill="#40916C" opacity="0.5" transform="rotate(-15 45 6)"/>
  <ellipse cx="105" cy="10" rx="4.5" ry="2.8" fill="#40916C" opacity="0.45" transform="rotate(10 105 10)"/>
  <ellipse cx="165" cy="5" rx="5" ry="3" fill="#95D5B2" opacity="0.4" transform="rotate(-20 165 5)"/>
  <ellipse cx="225" cy="10" rx="4" ry="2.5" fill="#40916C" opacity="0.45" transform="rotate(15 225 10)"/>
  <ellipse cx="270" cy="6" rx="4.5" ry="2.8" fill="#95D5B2" opacity="0.35" transform="rotate(-10 270 6)"/>
</svg>```.text

// Small leaf icon SVG for seed-card titles
#let _leaf-icon-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
  <path d="M8,14 C8,14 3,10 3,6 C3,2 8,1 8,1 C8,1 13,2 13,6 C13,10 8,14 8,14 Z" fill="currentColor" opacity="0.8"/>
  <path d="M8,4 L8,12" fill="none" stroke="white" stroke-width="0.8" opacity="0.6"/>
  <path d="M8,6 L6,5" fill="none" stroke="white" stroke-width="0.6" opacity="0.5"/>
  <path d="M8,8 L10,7" fill="none" stroke="white" stroke-width="0.6" opacity="0.5"/>
</svg>```.text

// Flower bud SVG for bloom-highlight
#let _flower-bud-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
  <ellipse cx="8" cy="6" rx="3" ry="4" fill="currentColor" opacity="0.7"/>
  <ellipse cx="6" cy="7" rx="2.5" ry="3.5" fill="currentColor" opacity="0.5" transform="rotate(-20 6 7)"/>
  <ellipse cx="10" cy="7" rx="2.5" ry="3.5" fill="currentColor" opacity="0.5" transform="rotate(20 10 7)"/>
  <path d="M8,10 L8,15" fill="none" stroke="#40916C" stroke-width="1.2" stroke-linecap="round"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render the branch-corner decoration
#let branch-corner() = {
  image(bytes(_branch-corner-svg), width: 140pt, height: 120pt)
}

/// Render the tree-frame border (for title/ending slides)
#let tree-frame() = {
  image(bytes(_tree-frame-svg), width: 100%, height: 100%)
}

/// Render vine divider
#let vine-divider(width: 60%) = {
  let svg = _vine-divider-svg
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 12pt)))
}

/// Render leaf icon with given color
#let leaf-icon(color: palette.accent, size: 14pt) = {
  let svg = _leaf-icon-svg.replace("currentColor", color.to-hex())
  box(baseline: 2pt, image(bytes(svg), width: size, height: size))
}

/// Render flower bud with given color
#let flower-bud(color: palette.error-red, size: 14pt) = {
  let svg = _flower-bud-svg.replace("currentColor", color.to-hex())
  box(baseline: 2pt, image(bytes(svg), width: size, height: size))
}


// === 1. Slide Functions ===

/// Standard content slide -- cream bg, branch-corner decoration, green text
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 0.5em, bottom: 0.1em))
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
      // Organic underline (thin accent bar)
      block(width: 80pt, height: 2.5pt, fill: palette.accent, radius: 2pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.65em)
    stack(dir: ltr, spacing: 8pt,
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      // Leaf separator
      leaf-icon(color: palette.ink-muted, size: 8pt),
      context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number],
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
      background: {
        // Cream background
        place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
        // Subtle branch-corner decoration
        place(bottom + right, dx: -10pt, dy: -8pt, branch-corner())
      },
    ),
  )
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide -- full tree-frame SVG, centered title with nature styling
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Tree frame border
    place(top + left, box(width: 100%, height: 100%, tree-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Leaf icon above title
      #leaf-icon(color: palette.accent, size: 28pt)
      #v(0.4em)
      // Title
      #text(size: 2.2em, weight: "bold", fill: palette.ink, info.title)
      #v(0.3em)
      // Vine underline
      #vine-divider(width: 200pt)
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.accent, info.subtitle)
        v(0.4em)
      }
      // Author
      #if info.author != none {
        text(size: 0.95em, fill: palette.secondary, weight: "regular", info.author)
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

/// New section slide -- section number with leaf marker, nature styling
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
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Branch corner decoration
    place(bottom + right, dx: -20pt, dy: -20pt, branch-corner())
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Leaf icon
      #leaf-icon(color: palette.accent, size: 22pt)
      #h(0.5em)
      // Section number
      #text(size: 2.5em, fill: palette.secondary, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.4em)
      // Section title
      #set text(fill: palette.ink, size: 1.8em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Vine divider
      #vine-divider(width: 180pt)
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- single statement, centered with organic frame
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
    // Background with slight green tint
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Organic rounded frame
    place(center + horizon,
      rect(width: 80%, height: 70%,
        fill: none,
        stroke: (paint: palette.accent.transparentize(50%), thickness: 2pt),
        radius: 24pt))
    // Branch decorations
    place(bottom + right, dx: -30pt, dy: -20pt, branch-corner())
    // Center content -- width constrained
    place(center + horizon,
      block(width: 65%, height: auto,
        align(center)[
          #set text(fill: palette.ink, size: 1.3em, weight: "bold")
          #body
          #v(0.5em)
          #vine-divider(width: 120pt)
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- tree-frame with garden farewell
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
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Tree frame
    place(top + left, box(width: 100%, height: 100%, tree-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Leaf icon
      #leaf-icon(color: palette.accent, size: 32pt)
      #v(0.5em)
      // Main text
      #text(size: 2.2em, weight: "bold", fill: palette.ink, body)
      #v(0.4em)
      // Vine divider
      #vine-divider(width: 160pt)
      #v(0.5em)
      // Subtitle
      #text(size: 0.85em, fill: palette.ink-muted)[Every line of code plants a seed.]
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Seed card -- rounded card with leaf SVG icon before the title
#let seed-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: palette.bg.darken(2%),
    stroke: (paint: accent.transparentize(40%), thickness: 1.5pt),
    inset: (x: 1em, y: 0.8em),
    radius: 12pt,
  )[
    #stack(
      spacing: .8em,
      {
        // Leaf icon + title
        stack(dir: ltr, spacing: 6pt,
          leaf-icon(color: accent, size: 13pt),
          text(weight: "bold", fill: accent, size: 0.92em, title),
        )
      },
      [
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Branch step -- numbered step with vertical stem line connecting steps
#let branch-step(number, title, body) = {
  block(width: 100%, inset: (left: 1.5em, y: 0.3em))[
    // Vertical stem line (placed on left)
    #place(top + left, dx: -1.2em, dy: 0pt,
      block(width: 2pt, height: 100%, fill: palette.secondary.transparentize(40%), radius: 1pt))
    // Step number circle
    #place(top + left, dx: -1.7em, dy: 2pt,
      circle(radius: 6pt, fill: palette.accent, stroke: none)[
        #set text(fill: white, size: 0.6em, weight: "bold")
        #set std.align(center + horizon)
        #number
      ])
    // Content
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: palette.ink, size: 0.88em, title),
      {
        set text(fill: palette.ink, size: 0.78em)
        body
      },
    )
  ]
}

/// Root block -- code explanation: dark bg code area + light interpretation side by side
#let root-block(code-content, explanation) = {
  block(width: 100%, radius: 10pt, clip: true,
    stroke: (paint: palette.ink.transparentize(80%), thickness: 1pt),
  )[
    #grid(columns: (1fr, 1fr), rows: auto,
      // Dark code area
      block(width: 100%, fill: palette.bg-dark, inset: (x: 0.8em, y: 0.7em))[
        #set text(fill: rgb("#F0EDE5"), size: 0.78em)
        #code-content
      ],
      // Light explanation area
      block(width: 100%, fill: palette.bg.darken(3%), inset: (x: 0.8em, y: 0.7em))[
        #set text(fill: palette.ink, size: 0.78em)
        #explanation
      ],
    )
  ]
}

/// Leaf tag -- small organic pill badge
#let leaf-tag(content, color: palette.accent) = {
  box(
    fill: color.transparentize(82%),
    stroke: (paint: color.transparentize(30%), thickness: 1pt),
    inset: (x: 0.7em, y: 0.25em),
    radius: 99pt,
  )[
    #set text(fill: color, size: 0.72em, weight: "semibold")
    #content
  ]
}

/// Bloom highlight -- alert/important box with flower-bud marker, colored left border only
#let bloom-highlight(title, body, color: palette.error-red) = {
  block(
    width: 100%,
    fill: color.transparentize(92%),
    stroke: (left: (paint: color, thickness: 3.5pt)),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 8pt),
  )[
    #stack(
      spacing: .8em,
      {
        stack(dir: ltr, spacing: 6pt,
          flower-bud(color: color, size: 13pt),
          text(weight: "bold", fill: color, size: 0.88em, title),
        )
      },
      [
        #set text(fill: palette.ink, size: 0.78em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Canopy quote -- quote with organic curved left border
#let canopy-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.accent.transparentize(92%),
    stroke: (left: (paint: palette.accent, thickness: 3pt)),
    inset: (x: 1.2em, y: 0.8em),
    radius: 12pt,
  )[
    #set text(fill: palette.ink, size: 0.85em, style: "italic")
    #quote
    #if author != none {
      v(0.3em)
      set text(fill: palette.secondary, size: 0.78em, weight: "bold", style: "normal")
      [-- #author]
    }
    #lazy-v(1fr)
  ]
}


// === 3. Theme Entry Point ===

#let syntax-garden-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  show raw: set text(size: 13pt)
  set heading(numbering: (..args) => none)

  let raw-color = palette.bg.darken(3%)
  show raw.where(block: false): body => box(
    fill: raw-color,
    inset: (x: 3pt, y: 0pt),
    outset: (x: 0pt, y: 3pt),
    radius: 2pt,
    { set par(justify: false); body },
  )
  show raw.where(block: true): body => block(
    width: 100%,
    fill: raw-color,
    outset: (x: 0pt, y: 4pt),
    inset: (x: 8pt, y: 4pt),
    radius: 4pt,
    { set par(justify: false); body },
  )

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
