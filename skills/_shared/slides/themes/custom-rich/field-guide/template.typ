// Field Guide Theme — Naturalist's pocket reference book aesthetic
// Soft sage/mint white background with deep forest text, bookmark tabs, numbered entries
// Features: topographic line backgrounds, book-cover borders, compass markers, entry numbering
// Perfect for training materials, onboarding, instructional guides, reference decks
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct -- Rich Theme) ===

#let palette = (
  bg: rgb("#F5F9F5"),
  ink: rgb("#1A3A2A"),
  accent: rgb("#5F8A6B"),
  tab: rgb("#C4A35A"),
  ink-muted: rgb("#1A3A2A").transparentize(50%),
  ink-light: rgb("#1A3A2A").transparentize(70%),
  border: rgb("#5F8A6B").transparentize(60%),
  entry-num: rgb("#2E5E3E"),
  cream: rgb("#FFFDF7"),
  topo-line: rgb("#5F8A6B").transparentize(92%),
  tab-dark: rgb("#8B6914"),
)


// === SVG Definitions ===

// Topographic contour lines background -- subtle trail map effect across slide
#let _topo-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M0,80 C60,75 120,90 180,85 C240,80 300,95 360,88 C420,81 480,92 540,87 C600,82 660,93 720,86 C780,79 820,88 840,84" fill="none" stroke="#5F8A6B" stroke-width="0.8" opacity="0.06"/>
  <path d="M0,140 C70,135 140,148 210,142 C280,136 350,150 420,144 C490,138 560,151 630,145 C700,139 770,149 840,143" fill="none" stroke="#5F8A6B" stroke-width="0.7" opacity="0.05"/>
  <path d="M0,200 C80,195 160,208 240,202 C320,196 400,210 480,204 C560,198 640,211 720,205 C800,199 830,206 840,203" fill="none" stroke="#5F8A6B" stroke-width="0.9" opacity="0.04"/>
  <path d="M0,260 C50,257 100,268 150,262 C200,256 250,270 300,264 C350,258 400,271 450,265 C500,259 550,272 600,266 C650,260 700,271 750,265 C800,259 830,267 840,263" fill="none" stroke="#5F8A6B" stroke-width="0.6" opacity="0.07"/>
  <path d="M0,320 C90,315 180,328 270,322 C360,316 450,330 540,324 C630,318 720,331 810,325 L840,323" fill="none" stroke="#5F8A6B" stroke-width="0.8" opacity="0.05"/>
  <path d="M0,370 C65,366 130,378 195,372 C260,366 325,380 390,374 C455,368 520,381 585,375 C650,369 715,380 780,374 L840,371" fill="none" stroke="#5F8A6B" stroke-width="0.7" opacity="0.06"/>
  <path d="M0,420 C75,416 150,428 225,422 C300,416 375,429 450,423 C525,417 600,430 675,424 C750,418 810,427 840,423" fill="none" stroke="#5F8A6B" stroke-width="0.5" opacity="0.08"/>
  <path d="M0,50 C100,45 200,58 300,52 C400,46 500,59 600,53 C700,47 800,56 840,52" fill="none" stroke="#5F8A6B" stroke-width="0.6" opacity="0.03"/>
  <path d="M0,450 C55,447 110,456 165,451 C220,446 275,457 330,452 C385,447 440,458 495,453 C550,448 605,457 660,452 C715,447 770,456 840,451" fill="none" stroke="#5F8A6B" stroke-width="0.7" opacity="0.04"/>
</svg>```.text

// Book cover frame -- stitched border with corner ornaments for title/ending
#let _book-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="20" y="16" width="800" height="442" fill="none" stroke="#1A3A2A" stroke-width="3" rx="4"/>
  <rect x="28" y="24" width="784" height="426" fill="none" stroke="#5F8A6B" stroke-width="1.2" rx="2" stroke-dasharray="8,4"/>
  <circle cx="36" cy="32" r="4" fill="none" stroke="#C4A35A" stroke-width="1.5"/>
  <circle cx="804" cy="32" r="4" fill="none" stroke="#C4A35A" stroke-width="1.5"/>
  <circle cx="36" cy="442" r="4" fill="none" stroke="#C4A35A" stroke-width="1.5"/>
  <circle cx="804" cy="442" r="4" fill="none" stroke="#C4A35A" stroke-width="1.5"/>
  <line x1="36" y1="38" x2="36" y2="436" stroke="#C4A35A" stroke-width="0.6" opacity="0.4"/>
  <line x1="804" y1="38" x2="804" y2="436" stroke="#C4A35A" stroke-width="0.6" opacity="0.4"/>
  <path d="M32,28 L40,28 M36,24 L36,32" stroke="#C4A35A" stroke-width="1" opacity="0.6"/>
  <path d="M800,28 L808,28 M804,24 L804,32" stroke="#C4A35A" stroke-width="1" opacity="0.6"/>
  <path d="M32,442 L40,442 M36,438 L36,446" stroke="#C4A35A" stroke-width="1" opacity="0.6"/>
  <path d="M800,442 L808,442 M804,438 L804,446" stroke="#C4A35A" stroke-width="1" opacity="0.6"/>
</svg>```.text

// Compass mark -- small directional indicator for trail-note
#let _compass-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
  <circle cx="10" cy="10" r="8" fill="none" stroke="#C4A35A" stroke-width="1.2"/>
  <polygon points="10,3 12,9 10,7 8,9" fill="#C4A35A" opacity="0.9"/>
  <polygon points="10,17 8,11 10,13 12,11" fill="#5F8A6B" opacity="0.7"/>
  <circle cx="10" cy="10" r="1.5" fill="#1A3A2A"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render topographic background
#let topo-background() = {
  image(bytes(_topo-bg-svg), width: 100%, height: 100%)
}

/// Render book cover frame
#let book-frame() = {
  image(bytes(_book-frame-svg), width: 100%, height: 100%)
}

/// Render compass mark
#let compass-mark(size: 16pt) = {
  box(image(bytes(_compass-svg), width: size, height: size))
}


// === Helper Functions ===

/// Entry counter state
#let _entry-counter = state("field-guide-entry", 0)

/// Reset entry counter (call at new section)
#let reset-entries() = {
  _entry-counter.update(0)
}


// === 1. Slide Functions ===

/// Standard content slide -- sage background, topo lines, forest text
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
        set text(fill: palette.ink, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Accent underline
      block(width: 100pt, height: 2.5pt, fill: palette.accent, radius: 1pt),
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
      [],
      {
        set std.align(right)
        context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide -- book cover with stitched border, naturalist motif
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Cream paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.cream))
    // Topographic background
    place(top + left, box(width: 100%, height: 100%, topo-background()))
    // Book cover frame
    place(top + left, box(width: 100%, height: 100%, book-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 6em)[
      // Small compass above title
      #compass-mark(size: 28pt)
      #v(0.5em)
      // Title
      #text(size: 2.2em, weight: "bold", fill: palette.ink, info.title)
      #v(0.3em)
      // Accent line
      #block(width: 160pt, height: 3pt, fill: palette.tab, radius: 1.5pt)
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.accent, weight: "medium", info.subtitle)
        v(0.4em)
      }
      // Author
      #if info.author != none {
        text(size: 0.95em, fill: palette.ink, weight: "regular", info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.ink-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.tab-dark)[#utils.display-info-date(self)]
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

/// New section slide -- bookmark tab motif, section number prominent
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
    // Topographic lines
    place(top + left, box(width: 100%, height: 100%, topo-background()))
    // Bookmark tab on right side
    place(right + horizon,
      block(
        width: 48pt,
        height: 80pt,
        fill: palette.tab,
        radius: (left: 6pt, right: 0pt),
        inset: (x: 8pt, y: 12pt),
      )[
        #set std.align(center + horizon)
        #set text(fill: white, size: 1.6em, weight: "bold")
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
    )
    // Section content
    pad(left: 5em, right: 6em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number
      #text(size: 3em, fill: palette.tab, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "01")
      ]
      #v(0.3em)
      // Section title
      #set text(fill: palette.ink, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Accent bar
      #block(width: 180pt, height: 3pt, fill: palette.accent, radius: 1.5pt)
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- single statement, width-constrained, centered
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Topo lines
    place(top + left, box(width: 100%, height: 100%, topo-background()))
    // Left accent border
    place(left + horizon,
      block(width: 5pt, height: 60%, fill: palette.tab, radius: (right: 2pt)))
    // Center content, width-constrained
    place(center + horizon,
      block(width: 70%, height: auto,
        align(center)[
          #set text(fill: palette.ink, size: 1.4em, weight: "bold")
          #body
          #v(0.5em)
          #block(width: 120pt, height: 2.5pt, fill: palette.accent, radius: 1pt)
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- book cover frame, compass, closing message
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.cream))
    // Topo lines
    place(top + left, box(width: 100%, height: 100%, topo-background()))
    // Book frame
    place(top + left, box(width: 100%, height: 100%, book-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Compass above
      #compass-mark(size: 36pt)
      #v(0.5em)
      // Main text
      #text(size: 2.2em, weight: "bold", fill: palette.ink, body)
      #v(0.4em)
      // Accent bar
      #block(width: 140pt, height: 3pt, fill: palette.tab, radius: 1.5pt)
      #v(0.4em)
      // Muted tagline
      #text(size: 0.8em, fill: palette.ink-muted)[End of Field Guide]
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Entry card -- numbered entry like a field guide species card
/// Number badge + title + description
#let entry-card(title, body, number: auto, accent: palette.accent) = {
  _entry-counter.update(n => n + 1)
  block(
    width: 100%,
    fill: palette.cream,
    stroke: (paint: palette.border, thickness: 1pt),
    inset: (left: 1em, right: 2em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(dir: ltr, spacing: 10pt,
      // Number badge
      context {
        let num = if number != auto { number } else { _entry-counter.get() }
        box(
          width: 28pt, height: 28pt,
          fill: accent,
          radius: 14pt,
          align(center + horizon,
            text(fill: white, size: 0.8em, weight: "bold")[#num]
          )
        )
      },
      // Title and body
      box(width: 1fr)[
        #stack(spacing: .8em,
          text(weight: "bold", fill: palette.ink, size: 0.92em, title),
          { set text(fill: palette.ink, size: 0.82em); body },
          lazy-v(1fr),
        )
      ],
    )
  ]
}

/// Tab section -- section header with physical bookmark tab sticking out right
#let tab-section(title, body, tab-label: none, color: palette.tab) = {
  block(width: 100%)[
    // Tab that sticks out
    #set std.align(right)
    #box(
      fill: color,
      inset: (x: 0.8em, y: 0.3em),
      radius: (top: 4pt),
    )[
      #set text(fill: white, size: 0.7em, weight: "bold")
      #if tab-label != none { tab-label } else { title }
    ]
    #v(-2pt)
    // Content area with top border matching tab
    #block(
      width: 100%,
      stroke: (top: (paint: color, thickness: 2.5pt)),
      inset: (x: 0.8em, y: 0.6em),
    )[
      #stack(spacing: .8em,
        text(weight: "bold", fill: palette.ink, size: 0.95em, title),
        [
        #set text(fill: palette.ink, size: 0.82em)
        #body
        ],
      )
    ]
  ]
}

/// Trail note -- important note with compass marker and colored left border
#let trail-note(body, color: palette.tab) = {
  block(
    width: 100%,
    fill: color.transparentize(92%),
    stroke: (left: (paint: color, thickness: 3.5pt)),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(dir: ltr, spacing: 8pt,
      compass-mark(size: 14pt),
      box(width: 1fr)[
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Waypoint step -- numbered step with connecting dotted line between steps
#let waypoint-step(number, title, body, is-last: false) = {
  block(width: 100%)[
    #stack(dir: ltr, spacing: 12pt,
      // Step circle and connecting line
      block(width: 28pt)[
        #stack(spacing: .8em,
          box(
          width: 26pt, height: 26pt,
          fill: palette.accent,
          radius: 13pt,
          stroke: (paint: palette.ink.transparentize(70%), thickness: 0.5pt),
          align(center + horizon,
            text(fill: white, size: 0.75em, weight: "bold")[#number]
          )
          ),
          if not is-last { block(width: 2pt, height: 20pt,
            fill: none,
            stroke: (paint: palette.accent.transparentize(50%), thickness: 1.5pt, dash: "dotted")) },
        )
      ],
      // Step content
      box(width: 1fr)[
        #stack(spacing: .8em,
          text(weight: "bold", fill: palette.ink, size: 0.88em, title),
          { set text(fill: palette.ink-muted, size: 0.78em); body },
        )
      ],
    )
  ]
}

/// Specimen tag -- inline pill/badge for categorization
#let specimen-tag(content, color: palette.accent) = {
  box(
    fill: color.transparentize(82%),
    stroke: (paint: color, thickness: 1pt),
    inset: (x: 0.6em, y: 0.25em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(20%), size: 0.72em, weight: "semibold")
    #content
  ]
}

/// Topo divider -- wavy contour line divider (NOT straight)
#let topo-divider(color: palette.accent, width: 80%) = {
  let svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="8" viewBox="0 0 300 8">
    <path d="M0,4 C10,2 20,6 30,4 C40,2 50,6 60,4 C70,2 80,5 90,3 C100,5 110,2 120,4 C130,6 140,3 150,4 C160,5 170,2 180,4 C190,6 200,3 210,4 C220,5 230,3 240,4 C250,5 260,3 270,4 C280,5 290,3 300,4" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.5"/>
    <path d="M0,6 C15,5 30,7 45,6 C60,5 75,7 90,6 C105,5 120,7 135,6 C150,5 165,7 180,6 C195,5 210,7 225,6 C240,5 255,7 270,6 C285,5 295,6 300,6" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.3"/>
  </svg>```.text
  let rendered = svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(rendered), width: width, height: 6pt)))
}


// === 3. Theme Entry Point ===

#let field-guide-theme(
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
      background: {
        place(top + left, box(width: 100%, height: 100%, topo-background()))
      },
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
