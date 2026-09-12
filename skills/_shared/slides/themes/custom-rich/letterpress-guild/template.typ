// Letterpress Guild Theme — Movable type printing, typographic guilds, printer's marks
// The craft heritage of the printing press: fleurons, dingbats, type case grids,
// registration marks, ink impression textures, thick/thin rule combinations.
// Best for: Publishing, media, journalism, content strategy, brand agencies, editorial
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// =====================================================================
// Color Palette
// =====================================================================

#let palette = (
  bg: rgb("#FDF9F0"),             // Warm paper/cream background
  primary: rgb("#1C1C1C"),        // Printer's black
  secondary: rgb("#9B2335"),      // Press red
  accent: rgb("#1E40AF"),         // Typographer's blue
  text: rgb("#332E27"),           // Aged paper text
  text-muted: rgb("#6B6358"),     // Muted aged text
  rule: rgb("#A89F91"),           // Rule/line color (warm gray)
  rule-light: rgb("#D4CEC4"),     // Light rule color
  card-bg: rgb("#FEFCF6"),        // Slightly brighter card background
  ornament: rgb("#5C4A3A"),       // Ornament/decoration color
)


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 22pt,
  lead: 16pt,
  body: 14pt,
  small: 11pt,
  label-size: 9pt,
  meta-size: 8pt,
)


// =====================================================================
// SVG Definitions — Printer's Ornaments and Backgrounds
// =====================================================================

// Full-page type case grid background — evokes the compartments of a compositor's type case
#let _type-case-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600" viewBox="0 0 800 600">
  <!-- Vertical grid lines (type case compartment dividers) -->
  <line x1="100" y1="0" x2="100" y2="600" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="200" y1="0" x2="200" y2="600" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="300" y1="0" x2="300" y2="600" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="400" y1="0" x2="400" y2="600" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="500" y1="0" x2="500" y2="600" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="600" y1="0" x2="600" y2="600" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="700" y1="0" x2="700" y2="600" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <!-- Horizontal grid lines -->
  <line x1="0" y1="75" x2="800" y2="75" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="0" y1="150" x2="800" y2="150" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="0" y1="225" x2="800" y2="225" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="0" y1="300" x2="800" y2="300" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="0" y1="375" x2="800" y2="375" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="0" y1="450" x2="800" y2="450" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <line x1="0" y1="525" x2="800" y2="525" stroke="#A89F91" stroke-width="0.3" opacity="0.08"/>
  <!-- Registration marks in corners -->
  <g opacity="0.12">
    <!-- Top-left registration mark -->
    <line x1="25" y1="20" x2="25" y2="36" stroke="#1C1C1C" stroke-width="0.5"/>
    <line x1="17" y1="28" x2="33" y2="28" stroke="#1C1C1C" stroke-width="0.5"/>
    <circle cx="25" cy="28" r="5" fill="none" stroke="#1C1C1C" stroke-width="0.4"/>
    <!-- Top-right registration mark -->
    <line x1="775" y1="20" x2="775" y2="36" stroke="#1C1C1C" stroke-width="0.5"/>
    <line x1="767" y1="28" x2="783" y2="28" stroke="#1C1C1C" stroke-width="0.5"/>
    <circle cx="775" cy="28" r="5" fill="none" stroke="#1C1C1C" stroke-width="0.4"/>
    <!-- Bottom-left registration mark -->
    <line x1="25" y1="564" x2="25" y2="580" stroke="#1C1C1C" stroke-width="0.5"/>
    <line x1="17" y1="572" x2="33" y2="572" stroke="#1C1C1C" stroke-width="0.5"/>
    <circle cx="25" cy="572" r="5" fill="none" stroke="#1C1C1C" stroke-width="0.4"/>
    <!-- Bottom-right registration mark -->
    <line x1="775" y1="564" x2="775" y2="580" stroke="#1C1C1C" stroke-width="0.5"/>
    <line x1="767" y1="572" x2="783" y2="572" stroke="#1C1C1C" stroke-width="0.5"/>
    <circle cx="775" cy="572" r="5" fill="none" stroke="#1C1C1C" stroke-width="0.4"/>
  </g>
  <!-- Subtle ink-spatter texture dots -->
  <circle cx="150" cy="120" r="1.2" fill="#5C4A3A" opacity="0.04"/>
  <circle cx="450" cy="80" r="0.8" fill="#5C4A3A" opacity="0.05"/>
  <circle cx="620" cy="200" r="1.0" fill="#5C4A3A" opacity="0.04"/>
  <circle cx="320" cy="420" r="1.4" fill="#5C4A3A" opacity="0.03"/>
  <circle cx="680" cy="500" r="0.9" fill="#5C4A3A" opacity="0.04"/>
  <circle cx="90" cy="380" r="1.1" fill="#5C4A3A" opacity="0.03"/>
</svg>```.text

// Fleuron ornament — intricate symmetrical printer's flower (used as decoration)
#let _fleuron-ornament-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="60" viewBox="0 0 120 60">
  <!-- Central flower motif -->
  <path d="M60,10 C64,10 68,14 68,18 C68,22 64,26 60,30 C56,26 52,22 52,18 C52,14 56,10 60,10 Z" fill="#5C4A3A" opacity="0.7"/>
  <path d="M60,50 C64,50 68,46 68,42 C68,38 64,34 60,30 C56,34 52,38 52,42 C52,46 56,50 60,50 Z" fill="#5C4A3A" opacity="0.7"/>
  <path d="M40,30 C40,26 44,22 48,22 C52,22 56,26 60,30 C56,34 52,38 48,38 C44,38 40,34 40,30 Z" fill="#5C4A3A" opacity="0.7"/>
  <path d="M80,30 C80,26 76,22 72,22 C68,22 64,26 60,30 C64,34 68,38 72,38 C76,38 80,34 80,30 Z" fill="#5C4A3A" opacity="0.7"/>
  <!-- Diagonal petals -->
  <path d="M45,15 C48,13 52,14 54,17 C56,20 55,24 60,30 C55,24 51,23 48,21 C45,19 44,16 45,15 Z" fill="#5C4A3A" opacity="0.55"/>
  <path d="M75,15 C72,13 68,14 66,17 C64,20 65,24 60,30 C65,24 69,23 72,21 C75,19 76,16 75,15 Z" fill="#5C4A3A" opacity="0.55"/>
  <path d="M45,45 C48,47 52,46 54,43 C56,40 55,36 60,30 C55,36 51,37 48,39 C45,41 44,44 45,45 Z" fill="#5C4A3A" opacity="0.55"/>
  <path d="M75,45 C72,47 68,46 66,43 C64,40 65,36 60,30 C65,36 69,37 72,39 C75,41 76,44 75,45 Z" fill="#5C4A3A" opacity="0.55"/>
  <!-- Central dot -->
  <circle cx="60" cy="30" r="3.5" fill="#9B2335" opacity="0.6"/>
  <circle cx="60" cy="30" r="1.8" fill="#FDF9F0" opacity="0.8"/>
  <!-- Outer scroll flourishes -->
  <path d="M20,30 C20,24 26,20 32,22 C38,24 40,28 40,30" fill="none" stroke="#5C4A3A" stroke-width="1.2" opacity="0.5"/>
  <path d="M100,30 C100,24 94,20 88,22 C82,24 80,28 80,30" fill="none" stroke="#5C4A3A" stroke-width="1.2" opacity="0.5"/>
  <!-- Tiny terminal dots on scrolls -->
  <circle cx="20" cy="30" r="1.5" fill="#5C4A3A" opacity="0.5"/>
  <circle cx="100" cy="30" r="1.5" fill="#5C4A3A" opacity="0.5"/>
  <!-- Top and bottom terminal flourishes -->
  <path d="M60,6 C56,6 54,8 54,10" fill="none" stroke="#5C4A3A" stroke-width="0.8" opacity="0.4"/>
  <path d="M60,6 C64,6 66,8 66,10" fill="none" stroke="#5C4A3A" stroke-width="0.8" opacity="0.4"/>
  <path d="M60,54 C56,54 54,52 54,50" fill="none" stroke="#5C4A3A" stroke-width="0.8" opacity="0.4"/>
  <path d="M60,54 C64,54 66,52 66,50" fill="none" stroke="#5C4A3A" stroke-width="0.8" opacity="0.4"/>
</svg>```.text

// Guild mark emblem — printer's guild seal/mark for title and ending slides
#let _guild-mark-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
  <!-- Outer circle (guild seal ring) -->
  <circle cx="50" cy="50" r="44" fill="none" stroke="#1C1C1C" stroke-width="2.2" opacity="0.6"/>
  <circle cx="50" cy="50" r="40" fill="none" stroke="#1C1C1C" stroke-width="0.8" opacity="0.35"/>
  <!-- Inner diamond -->
  <polygon points="50,18 82,50 50,82 18,50" fill="none" stroke="#9B2335" stroke-width="1.5" opacity="0.5"/>
  <!-- Central press/type motif (stylized letter P for Press) -->
  <rect x="42" y="30" width="4" height="40" fill="#1C1C1C" opacity="0.6"/>
  <path d="M46,30 L62,30 C68,30 72,34 72,40 C72,46 68,50 62,50 L46,50" fill="none" stroke="#1C1C1C" stroke-width="3.5" opacity="0.6"/>
  <!-- Corner ornament dots (compass points) -->
  <circle cx="50" cy="8" r="2.5" fill="#9B2335" opacity="0.5"/>
  <circle cx="50" cy="92" r="2.5" fill="#9B2335" opacity="0.5"/>
  <circle cx="8" cy="50" r="2.5" fill="#1E40AF" opacity="0.4"/>
  <circle cx="92" cy="50" r="2.5" fill="#1E40AF" opacity="0.4"/>
  <!-- Small decorative crosses between compass points -->
  <line x1="25" y1="22" x2="29" y2="26" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <line x1="29" y1="22" x2="25" y2="26" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <line x1="71" y1="22" x2="75" y2="26" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <line x1="75" y1="22" x2="71" y2="26" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <line x1="25" y1="74" x2="29" y2="78" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <line x1="29" y1="74" x2="25" y2="78" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <line x1="71" y1="74" x2="75" y2="78" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <line x1="75" y1="74" x2="71" y2="78" stroke="#5C4A3A" stroke-width="1" opacity="0.35"/>
  <!-- Serif details at base of P -->
  <line x1="38" y1="70" x2="50" y2="70" stroke="#1C1C1C" stroke-width="1.5" opacity="0.5"/>
</svg>```.text

// Bookend frame — decorative border for title and ending slides (thick-thin-thick rule combo)
#let _bookend-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600" viewBox="0 0 800 600">
  <!-- Outer thick rule -->
  <rect x="30" y="25" width="740" height="550" fill="none" stroke="#1C1C1C" stroke-width="3" opacity="0.5"/>
  <!-- Inner thin rule -->
  <rect x="38" y="33" width="724" height="534" fill="none" stroke="#1C1C1C" stroke-width="0.8" opacity="0.35"/>
  <!-- Second inner thin rule -->
  <rect x="42" y="37" width="716" height="526" fill="none" stroke="#A89F91" stroke-width="0.4" opacity="0.3"/>
  <!-- Corner ornamental squares (printer's furniture) -->
  <rect x="30" y="25" width="12" height="12" fill="#9B2335" opacity="0.25"/>
  <rect x="758" y="25" width="12" height="12" fill="#9B2335" opacity="0.25"/>
  <rect x="30" y="563" width="12" height="12" fill="#9B2335" opacity="0.25"/>
  <rect x="758" y="563" width="12" height="12" fill="#9B2335" opacity="0.25"/>
  <!-- Registration marks outside frame -->
  <line x1="15" y1="300" x2="27" y2="300" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <line x1="21" y1="294" x2="21" y2="306" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <line x1="773" y1="300" x2="785" y2="300" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <line x1="779" y1="294" x2="779" y2="306" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <line x1="400" y1="10" x2="400" y2="22" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <line x1="394" y1="16" x2="406" y2="16" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <line x1="400" y1="578" x2="400" y2="590" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <line x1="394" y1="584" x2="406" y2="584" stroke="#1C1C1C" stroke-width="0.5" opacity="0.2"/>
  <!-- Decorative small fleuron marks at frame midpoints -->
  <circle cx="400" cy="25" r="2" fill="#5C4A3A" opacity="0.3"/>
  <circle cx="400" cy="575" r="2" fill="#5C4A3A" opacity="0.3"/>
  <circle cx="30" cy="300" r="2" fill="#5C4A3A" opacity="0.3"/>
  <circle cx="770" cy="300" r="2" fill="#5C4A3A" opacity="0.3"/>
</svg>```.text


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// leading-divider -- Thick-thin-thick rule separator (book section break style)
#let leading-divider(color: palette.primary) = {
  block(width: 100%, above: 0.8em, below: 0.8em,
    stack(
      spacing: 0pt,
      line(length: 100%, stroke: 1.5pt + color.transparentize(40%)),
      line(length: 100%, stroke: 0.4pt + color.transparentize(60%)),
      line(length: 100%, stroke: 1.5pt + color.transparentize(40%)),
    )
  )
}

/// type-card -- Card with thick/thin rule border (printer's style)
#let type-card(title, body-content) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (
      top: 2.5pt + palette.primary.transparentize(30%),
      bottom: 2.5pt + palette.primary.transparentize(30%),
      left: 0.5pt + palette.rule,
      right: 0.5pt + palette.rule,
    ),
    inset: (x: 1em, y: 0.8em),
  )[
    #stack(
      spacing: 0.8em,
      text(
        size: typo.label-size,
        weight: "bold",
        tracking: 1.4pt,
        fill: palette.secondary,
        upper(title),
      ),
      line(length: 100%, stroke: 0.3pt + palette.rule-light),
      {
        set text(size: typo.body, fill: palette.text)
        body-content
      },
    )
    #lazy-v(1fr)
  ]
}

/// impression-box -- Box with slightly irregular ink-impression styling
#let impression-box(body-content, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (
      left: 3pt + accent.transparentize(20%),
      top: 0.8pt + accent.transparentize(50%),
      right: 0.4pt + palette.rule-light,
      bottom: 1.2pt + accent.transparentize(40%),
    ),
    inset: (x: 1em, y: 0.8em),
  )[
    #set text(size: typo.body, fill: palette.text)
    #body-content
    #lazy-v(1fr)
  ]
}

/// broadside-stat -- Metric in announcement/poster style frame
#let broadside-stat(value, label, accent: palette.primary) = {
  block(
    width: 100%,
    height: 110pt,
    fill: palette.card-bg,
    stroke: (
      top: 3pt + accent,
      bottom: 3pt + accent,
      left: 0.5pt + palette.rule,
      right: 0.5pt + palette.rule,
    ),
    inset: (x: 1em, y: 0.6em),
  )[
    #align(center + horizon,
      stack(
        spacing: 0.8em,
        text(size: 40pt, weight: "bold", fill: accent, value),
        text(
          size: typo.label-size,
          weight: "medium",
          tracking: 1.6pt,
          fill: palette.text-muted,
          upper(label),
        ),
      ),
    )
  ]
}

/// pull-quote -- Quote with large fleuron ornament and rule lines
#let pull-quote(body-content, cite: none) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.5em))[
    #stack(
      spacing: 0.8em,
      stack(
        spacing: 0pt,
        line(length: 100%, stroke: 1.5pt + palette.primary.transparentize(40%)),
        line(length: 100%, stroke: 0.4pt + palette.rule),
      ),
      grid(
        columns: (auto, 1fr),
        column-gutter: 0.8em,
        text(size: 28pt, fill: palette.secondary.transparentize(30%))["],
        {
          set text(size: typo.lead, style: "italic", fill: palette.text, weight: "regular")
          body-content
        },
      ),
      if cite != none {
        text(
          size: typo.label-size,
          weight: "medium",
          tracking: 1.2pt,
          fill: palette.text-muted,
          [-- #upper(cite)],
        )
      },
      stack(
        spacing: 0pt,
        line(length: 100%, stroke: 0.4pt + palette.rule),
        line(length: 100%, stroke: 1.5pt + palette.primary.transparentize(40%)),
      ),
    )
    #lazy-v(1fr)
  ]
}

/// colophon-tag -- Printer's mark style tag
#let colophon-tag(body-content) = {
  box(
    fill: palette.card-bg,
    stroke: 0.8pt + palette.rule,
    inset: (x: 0.6em, y: 0.3em),
  )[
    #text(
      size: typo.meta-size,
      weight: "medium",
      tracking: 0.8pt,
      fill: palette.text-muted,
      body-content,
    )
  ]
}

/// galley-card -- Card with type-case grid background pattern
#let galley-card(title, body-content) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.6pt + palette.rule,
    inset: (x: 1em, y: 0.8em),
  )[
    // Subtle grid pattern overlay
    #place(top + left,
      block(width: 100%, height: 100%, clip: true)[
        #for row in range(6) {
          for col in range(8) {
            place(top + left, dx: col * 30pt, dy: row * 22pt,
              rect(width: 28pt, height: 20pt, stroke: 0.2pt + palette.rule-light.transparentize(50%))
            )
          }
        }
      ]
    )
    #stack(
      spacing: 0.8em,
      text(
        size: typo.label-size,
        weight: "bold",
        tracking: 1.4pt,
        fill: palette.ornament,
        upper(title),
      ),
      {
        set text(size: typo.body, fill: palette.text)
        body-content
      },
    )
    #lazy-v(1fr)
  ]
}

/// press-box -- Feature box with registration marks in corners
#let press-box(body-content) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.6pt + palette.rule,
    inset: (x: 1.2em, y: 1em),
  )[
    // Corner registration marks
    #place(top + left, dx: -0.8em, dy: -0.6em)[
      #text(size: 8pt, fill: palette.rule)[+]
    ]
    #place(top + right, dx: 0.8em, dy: -0.6em)[
      #text(size: 8pt, fill: palette.rule)[+]
    ]
    #place(bottom + left, dx: -0.8em, dy: 0.6em)[
      #text(size: 8pt, fill: palette.rule)[+]
    ]
    #place(bottom + right, dx: 0.8em, dy: 0.6em)[
      #text(size: 8pt, fill: palette.rule)[+]
    ]
    #set text(size: typo.body, fill: palette.text)
    #body-content
    #lazy-v(1fr)
  ]
}

/// compositor-list -- Scoped printer's-mark styling for native Typst lists
#let compositor-list(body-content) = {
  block(width: 100%, inset: (x: 0.4em, y: 0.3em))[
    #set text(size: typo.body, fill: palette.text)
    #set list(
      marker: box(
        baseline: 0.55em,
        text(size: 0.62em, fill: palette.secondary, weight: "bold", sym.diamond.filled),
      ),
      indent: 0pt,
      body-indent: 0.65em,
      spacing: 0.45em,
    )
    #body-content
    #lazy-v(1fr)
  ]
}

/// fleuron-divider -- Centered fleuron ornament between horizontal rules
#let fleuron-divider() = {
  block(width: 100%, above: 0.6em, below: 0.6em)[
    #set std.align(center)
    #grid(columns: (1fr, auto, 1fr), column-gutter: 0.8em, align: horizon,
      line(length: 100%, stroke: 0.5pt + palette.rule),
      image(bytes(_fleuron-ornament-svg), width: 50pt),
      line(length: 100%, stroke: 0.5pt + palette.rule),
    )
  ]
}


// =====================================================================
// 2. Internal Helpers (header/footer/background)
// =====================================================================

/// _content-bg -- Persistent background atmosphere on all content slides
#let _content-bg() = {
  place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
  place(top + left,
    image(bytes(_type-case-grid-svg), width: 100%, height: 100%)
  )
}

/// _content-header -- Standard header for content slides
#let _content-header(self) = {
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: 0.8em,
    {
      set text(fill: palette.primary, size: 1.4em, weight: "semibold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    // Thick-thin rule combo beneath title
    stack(spacing: 0pt,
      line(length: 80pt, stroke: 2pt + palette.secondary.transparentize(30%)),
      line(length: 120pt, stroke: 0.4pt + palette.rule),
    ),
  )
  // Page number in upper right with printer's mark style
  place(top + right, dx: -0.5em,
    text(size: typo.meta-size, fill: palette.text-muted,
      context [#utils.slide-counter.display("01")]
    )
  )
}

/// _content-footer -- Standard footer for content slides
#let _content-footer(self) = {
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: palette.text-muted, size: 0.6em)
  // Thin rule above footer
  place(top + left, dx: -2em, line(length: 200%, stroke: 0.3pt + palette.rule-light))
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      }
    },
    {
      // Fleuron separator
      text(size: 8pt, fill: palette.ornament, sym.diamond.filled)
    },
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display("01") / #utils.last-slide-number]
    },
  )
}


// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard content slide
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _content-header(self)
  let footer(self) = _content-footer(self)
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
      background: _content-bg(),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Cover page with bookend frame and guild mark
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Type case grid
    place(top + left, image(bytes(_type-case-grid-svg), width: 100%, height: 100%))
    // Bookend frame
    place(top + left, image(bytes(_bookend-frame-svg), width: 100%, height: 100%))
    // Guild mark in upper-right area
    place(top + right, dx: -4em, dy: 2.5em,
      image(bytes(_guild-mark-svg), width: 48pt)
    )
    // Main content area
    set std.align(left + horizon)
    pad(x: 5em, y: 4em)[
      #stack(
        spacing: 0.8em,
        text(size: typo.display, weight: "bold", fill: palette.primary, info.title),
        stack(
          spacing: 0pt,
          line(length: 100pt, stroke: 2.5pt + palette.secondary),
          line(length: 160pt, stroke: 0.5pt + palette.rule),
        ),
        if info.subtitle != none {
          text(size: typo.lead, weight: "regular", fill: palette.text-muted, info.subtitle)
        },
        if info.author != none or info.date != none {
          {
            set text(size: typo.label-size, fill: palette.text-muted, tracking: 1.4pt, weight: "medium")
            stack(
              dir: ltr,
              spacing: 2em,
              if info.author != none { upper(info.author) },
              if info.author != none and info.date != none { text(fill: palette.rule)[|] },
              if info.date != none { utils.display-info-date(self) },
            )
          }
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with fleuron ornament
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    place(top + left, image(bytes(_type-case-grid-svg), width: 100%, height: 100%))
    // Large section number (faded, decorative)
    place(top + right, dx: -3em, dy: 1em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: palette.primary.transparentize(88%), size: 120pt, weight: "bold", num-str)
      },
    )
    // Centered fleuron
    place(center + horizon,
      image(bytes(_fleuron-ornament-svg), width: 80pt)
    )
    // Content
    pad(left: 4em, right: 6em, top: 4em, bottom: 3em)[
      #v(1fr)
      #stack(
        spacing: 0.8em,
        text(
          size: typo.label-size,
          weight: "bold",
          tracking: 2pt,
          fill: palette.secondary,
        )[SECTION #context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          num-str
        }],
        {
          set text(fill: palette.primary, size: typo.h1, weight: "semibold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        stack(
          spacing: 0pt,
          line(length: 80pt, stroke: 2pt + palette.secondary.transparentize(30%)),
          line(length: 140pt, stroke: 0.4pt + palette.rule),
        ),
      )
      #v(3fr)
    ]
    // Bottom rule
    place(bottom + left, dx: 2em,
      stack(spacing: 0pt,
        line(length: 100%, stroke: 0.4pt + palette.rule-light),
        line(length: 100%, stroke: 1.5pt + palette.primary.transparentize(50%)),
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Dark background emphasis slide
#let focus-slide(body-content) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Thick-thin rule at top
    place(top + left, dx: -3em, dy: -2.5em,
      stack(spacing: 0pt,
        line(length: 100pt, stroke: 2.5pt + palette.secondary),
        line(length: 60pt, stroke: 0.5pt + palette.bg.transparentize(60%)),
      )
    )
    // Registration mark in bottom-right
    place(bottom + right, dx: 2em, dy: 2em,
      text(size: 12pt, fill: palette.bg.transparentize(70%))[+]
    )
    set text(fill: palette.bg, size: 1.6em, weight: "regular")
    set std.align(horizon + left)
    block(width: 90%, body-content)
  }
  touying-slide(self: self, main-body)
})

/// ending-slide -- Closing page with bookend frame (matches title)
#let ending-slide(body-content) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Type case grid
    place(top + left, image(bytes(_type-case-grid-svg), width: 100%, height: 100%))
    // Bookend frame (same as title)
    place(top + left, image(bytes(_bookend-frame-svg), width: 100%, height: 100%))
    // Guild mark centered
    place(center + horizon, dy: -3em,
      image(bytes(_guild-mark-svg), width: 52pt)
    )
    // Content centered
    std.align(center + horizon,
      stack(
        spacing: 0.8em,
        image(bytes(_fleuron-ornament-svg), width: 60pt),
        text(size: 30pt, weight: "bold", fill: palette.primary, body-content),
        stack(spacing: 0pt,
        std.align(center, line(length: 80pt, stroke: 2pt + palette.secondary.transparentize(30%))),
        std.align(center, line(length: 120pt, stroke: 0.4pt + palette.rule)),
        ),
      ),
    )
  }
  touying-slide(self: self, main-body)
})

/// outline-slide -- Table of contents with typographic styling
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: (x: 4em, y: 3em),
      background: _content-bg(),
    ),
  )
  let main-body = {
    stack(
      spacing: 16pt,
      text(size: typo.h1, weight: "semibold", fill: palette.primary, title),
      stack(
        spacing: 0pt,
        line(length: 80pt, stroke: 2pt + palette.secondary.transparentize(30%)),
        line(length: 140pt, stroke: 0.4pt + palette.rule),
      ),
      {
        set text(size: typo.lead, fill: palette.text, weight: "regular")
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let letterpress-guild-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.secondary,
      neutral-lightest: palette.bg,
      neutral-darkest: palette.primary,
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
