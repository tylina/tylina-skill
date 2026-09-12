// Carbon Fiber Theme — Precision engineering aesthetic
// Light gray backgrounds with subtle carbon-weave texture patterns (SVG)
// Metallic blue accents, sharp geometric lines. Aerospace/automotive engineering feel.
// Lightweight but incredibly strong. Clean, technical, premium. Light theme.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#F4F5F7"),
  primary: rgb("#2563EB"),
  titanium: rgb("#64748B"),
  silver: rgb("#94A3B8"),
  accent-red: rgb("#DC2626"),
  text: rgb("#0F172A"),
  text-muted: rgb("#475569"),
  card-bg: rgb("#FFFFFF"),
  border: rgb("#CBD5E1"),
  primary-light: rgb("#2563EB").lighten(90%),
  titanium-light: rgb("#64748B").lighten(88%),
  silver-light: rgb("#94A3B8").lighten(85%),
)


// ═══ SVG Definitions ═══

// Carbon weave pattern — diagonal crosshatch simulating woven carbon fiber fabric (full-page)
#let _carbon-weave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <defs>
    <pattern id="carbonweave" width="20" height="20" patternUnits="userSpaceOnUse" patternTransform="rotate(0)">
      <rect width="20" height="20" fill="none"/>
      <path d="M0,0 L10,10 M10,0 L20,10 M0,10 L10,20 M10,10 L20,20" stroke="#64748B" stroke-width="0.4" opacity="0.12"/>
      <path d="M10,0 L0,10 M20,0 L10,10 M10,10 L0,20 M20,10 L10,20" stroke="#94A3B8" stroke-width="0.3" opacity="0.08"/>
      <rect x="0" y="0" width="10" height="10" fill="#64748B" opacity="0.015"/>
      <rect x="10" y="10" width="10" height="10" fill="#64748B" opacity="0.015"/>
    </pattern>
  </defs>
  <rect width="840" height="474" fill="url(#carbonweave)"/>
  <!-- Subtle fade edges for depth -->
  <rect x="0" y="0" width="840" height="20" fill="#F4F5F7" opacity="0.3"/>
  <rect x="0" y="454" width="840" height="20" fill="#F4F5F7" opacity="0.3"/>
</svg>```.text

// Precision measurement lines — engineering ruler marks along edges
#let _precision-lines-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Top measurement rail -->
  <line x1="40" y1="12" x2="800" y2="12" stroke="#94A3B8" stroke-width="0.5" opacity="0.4"/>
  <line x1="40" y1="12" x2="40" y2="18" stroke="#2563EB" stroke-width="0.8" opacity="0.5"/>
  <line x1="200" y1="12" x2="200" y2="16" stroke="#64748B" stroke-width="0.5" opacity="0.35"/>
  <line x1="360" y1="12" x2="360" y2="16" stroke="#64748B" stroke-width="0.5" opacity="0.35"/>
  <line x1="520" y1="12" x2="520" y2="16" stroke="#64748B" stroke-width="0.5" opacity="0.35"/>
  <line x1="680" y1="12" x2="680" y2="16" stroke="#64748B" stroke-width="0.5" opacity="0.35"/>
  <line x1="800" y1="12" x2="800" y2="18" stroke="#2563EB" stroke-width="0.8" opacity="0.5"/>
  <!-- Minor ticks -->
  <line x1="120" y1="12" x2="120" y2="14" stroke="#94A3B8" stroke-width="0.3" opacity="0.25"/>
  <line x1="280" y1="12" x2="280" y2="14" stroke="#94A3B8" stroke-width="0.3" opacity="0.25"/>
  <line x1="440" y1="12" x2="440" y2="14" stroke="#94A3B8" stroke-width="0.3" opacity="0.25"/>
  <line x1="600" y1="12" x2="600" y2="14" stroke="#94A3B8" stroke-width="0.3" opacity="0.25"/>
  <line x1="760" y1="12" x2="760" y2="14" stroke="#94A3B8" stroke-width="0.3" opacity="0.25"/>
  <!-- Bottom measurement rail -->
  <line x1="40" y1="462" x2="800" y2="462" stroke="#94A3B8" stroke-width="0.5" opacity="0.4"/>
  <line x1="40" y1="462" x2="40" y2="456" stroke="#2563EB" stroke-width="0.8" opacity="0.5"/>
  <line x1="800" y1="462" x2="800" y2="456" stroke="#2563EB" stroke-width="0.8" opacity="0.5"/>
  <!-- Left measurement rail -->
  <line x1="12" y1="40" x2="12" y2="434" stroke="#94A3B8" stroke-width="0.5" opacity="0.3"/>
  <line x1="12" y1="40" x2="18" y2="40" stroke="#2563EB" stroke-width="0.8" opacity="0.5"/>
  <line x1="12" y1="434" x2="18" y2="434" stroke="#2563EB" stroke-width="0.8" opacity="0.5"/>
  <line x1="12" y1="138" x2="15" y2="138" stroke="#64748B" stroke-width="0.4" opacity="0.3"/>
  <line x1="12" y1="237" x2="15" y2="237" stroke="#64748B" stroke-width="0.4" opacity="0.3"/>
  <line x1="12" y1="336" x2="15" y2="336" stroke="#64748B" stroke-width="0.4" opacity="0.3"/>
  <!-- Corner registration marks -->
  <path d="M30,30 L30,20 L40,20" fill="none" stroke="#2563EB" stroke-width="1.2" opacity="0.6"/>
  <path d="M810,30 L810,20 L800,20" fill="none" stroke="#2563EB" stroke-width="1.2" opacity="0.6"/>
  <path d="M30,444 L30,454 L40,454" fill="none" stroke="#2563EB" stroke-width="1.2" opacity="0.6"/>
  <path d="M810,444 L810,454 L800,454" fill="none" stroke="#2563EB" stroke-width="1.2" opacity="0.6"/>
  <!-- Center crosshair -->
  <circle cx="420" cy="237" r="2" fill="none" stroke="#94A3B8" stroke-width="0.4" opacity="0.2"/>
  <line x1="415" y1="237" x2="425" y2="237" stroke="#94A3B8" stroke-width="0.3" opacity="0.2"/>
  <line x1="420" y1="232" x2="420" y2="242" stroke="#94A3B8" stroke-width="0.3" opacity="0.2"/>
</svg>```.text

// Hexagonal honeycomb fragments — partial honeycomb structure in corner
#let _honeycomb-fragment-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="180" viewBox="0 0 200 180">
  <!-- Row 1 -->
  <path d="M30,10 L50,10 L60,27 L50,44 L30,44 L20,27 Z" fill="none" stroke="#2563EB" stroke-width="1" opacity="0.2"/>
  <path d="M65,10 L85,10 L95,27 L85,44 L65,44 L55,27 Z" fill="none" stroke="#2563EB" stroke-width="1" opacity="0.15"/>
  <path d="M100,10 L120,10 L130,27 L120,44 L100,44 L90,27 Z" fill="none" stroke="#64748B" stroke-width="0.8" opacity="0.12"/>
  <path d="M135,10 L155,10 L165,27 L155,44 L135,44 L125,27 Z" fill="none" stroke="#64748B" stroke-width="0.6" opacity="0.08"/>
  <!-- Row 2 offset -->
  <path d="M47,40 L67,40 L77,57 L67,74 L47,74 L37,57 Z" fill="none" stroke="#2563EB" stroke-width="1" opacity="0.18"/>
  <path d="M82,40 L102,40 L112,57 L102,74 L82,74 L72,57 Z" fill="none" stroke="#2563EB" stroke-width="0.8" opacity="0.14"/>
  <path d="M117,40 L137,40 L147,57 L137,74 L117,74 L107,57 Z" fill="none" stroke="#64748B" stroke-width="0.7" opacity="0.1"/>
  <path d="M152,40 L172,40 L182,57 L172,74 L152,74 L142,57 Z" fill="none" stroke="#64748B" stroke-width="0.5" opacity="0.06"/>
  <!-- Row 3 -->
  <path d="M30,70 L50,70 L60,87 L50,104 L30,104 L20,87 Z" fill="none" stroke="#2563EB" stroke-width="0.9" opacity="0.15"/>
  <path d="M65,70 L85,70 L95,87 L85,104 L65,104 L55,87 Z" fill="none" stroke="#64748B" stroke-width="0.7" opacity="0.1"/>
  <path d="M100,70 L120,70 L130,87 L120,104 L100,104 L90,87 Z" fill="none" stroke="#64748B" stroke-width="0.6" opacity="0.07"/>
  <!-- Row 4 fading -->
  <path d="M47,100 L67,100 L77,117 L67,134 L47,134 L37,117 Z" fill="none" stroke="#64748B" stroke-width="0.6" opacity="0.08"/>
  <path d="M82,100 L102,100 L112,117 L102,134 L82,134 L72,117 Z" fill="none" stroke="#64748B" stroke-width="0.5" opacity="0.06"/>
  <!-- Single faded hex -->
  <path d="M30,130 L50,130 L60,147 L50,164 L30,164 L20,147 Z" fill="none" stroke="#94A3B8" stroke-width="0.4" opacity="0.05"/>
  <!-- Highlight fill on one hex for accent -->
  <path d="M30,10 L50,10 L60,27 L50,44 L30,44 L20,27 Z" fill="#2563EB" opacity="0.04"/>
  <path d="M47,40 L67,40 L77,57 L67,74 L47,74 L37,57 Z" fill="#2563EB" opacity="0.03"/>
</svg>```.text

// Geometric divider line — precision engineered separator
#let _geo-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="8" viewBox="0 0 300 8">
  <line x1="0" y1="4" x2="130" y2="4" stroke="#CBD5E1" stroke-width="1.5"/>
  <polygon points="135,4 140,1 145,4 140,7" fill="#2563EB" opacity="0.8"/>
  <line x1="145" y1="4" x2="155" y2="4" stroke="#2563EB" stroke-width="1.5" opacity="0.8"/>
  <polygon points="155,4 160,1 165,4 160,7" fill="#2563EB" opacity="0.6"/>
  <line x1="165" y1="4" x2="300" y2="4" stroke="#CBD5E1" stroke-width="1.5"/>
</svg>```.text

// Engineering frame — technical blueprint-style border for title/ending slides
#let _eng-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Outer frame -->
  <rect x="20" y="15" width="800" height="444" fill="none" stroke="#2563EB" stroke-width="1.8" opacity="0.5"/>
  <!-- Inner frame -->
  <rect x="28" y="23" width="784" height="428" fill="none" stroke="#64748B" stroke-width="0.6" opacity="0.35"/>
  <!-- Corner brackets (top-left) -->
  <path d="M20,50 L10,50 L10,15 L50,15" fill="none" stroke="#2563EB" stroke-width="2.2" opacity="0.7"/>
  <!-- Corner brackets (top-right) -->
  <path d="M790,15 L830,15 L830,50" fill="none" stroke="#2563EB" stroke-width="2.2" opacity="0.7"/>
  <!-- Corner brackets (bottom-left) -->
  <path d="M10,424 L10,459 L50,459" fill="none" stroke="#2563EB" stroke-width="2.2" opacity="0.7"/>
  <!-- Corner brackets (bottom-right) -->
  <path d="M790,459 L830,459 L830,424" fill="none" stroke="#2563EB" stroke-width="2.2" opacity="0.7"/>
  <!-- Corner dots -->
  <circle cx="20" cy="15" r="2.5" fill="#2563EB" opacity="0.6"/>
  <circle cx="820" cy="15" r="2.5" fill="#2563EB" opacity="0.6"/>
  <circle cx="20" cy="459" r="2.5" fill="#2563EB" opacity="0.6"/>
  <circle cx="820" cy="459" r="2.5" fill="#2563EB" opacity="0.6"/>
  <!-- Title block bottom-right (engineering drawing style) -->
  <rect x="580" y="430" width="232" height="26" fill="none" stroke="#64748B" stroke-width="0.6" opacity="0.3"/>
  <line x1="700" y1="430" x2="700" y2="456" stroke="#64748B" stroke-width="0.4" opacity="0.25"/>
  <!-- Dimension markers top -->
  <line x1="100" y1="10" x2="100" y2="6" stroke="#94A3B8" stroke-width="0.5" opacity="0.3"/>
  <line x1="260" y1="10" x2="260" y2="6" stroke="#94A3B8" stroke-width="0.5" opacity="0.3"/>
  <line x1="420" y1="10" x2="420" y2="6" stroke="#94A3B8" stroke-width="0.5" opacity="0.3"/>
  <line x1="580" y1="10" x2="580" y2="6" stroke="#94A3B8" stroke-width="0.5" opacity="0.3"/>
  <line x1="740" y1="10" x2="740" y2="6" stroke="#94A3B8" stroke-width="0.5" opacity="0.3"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render full-page carbon weave texture overlay
#let carbon-weave-bg() = {
  image(bytes(_carbon-weave-svg), width: 100%, height: 100%)
}

/// Render precision measurement lines overlay
#let precision-lines-overlay() = {
  image(bytes(_precision-lines-svg), width: 100%, height: 100%)
}

/// Render hexagonal honeycomb fragment decoration
#let honeycomb-fragment(width: 160pt) = {
  image(bytes(_honeycomb-fragment-svg), width: width)
}

/// Render geometric divider
#let geo-divider(width: 70%) = {
  std.align(center, box(width: width, image(bytes(_geo-divider-svg), width: width, height: 6pt)))
}

/// Render engineering frame overlay
#let eng-frame() = {
  image(bytes(_eng-frame-svg), width: 100%, height: 100%)
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — light gray bg, carbon weave texture, precision measurement decoration
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 0.6em, bottom: 0.2em))
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
      // Metallic blue accent bar under title
      box(width: 48pt, height: 2.5pt, fill: palette.primary, radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.6em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Diamond separator
        box(width: 5pt, height: 5pt, fill: palette.primary,
          rotate(45deg, box(width: 4pt, height: 4pt, fill: palette.primary)))
      },
      {
        set std.align(right)
        context text(fill: palette.titanium, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  // Background decoration rendered behind content via config-page background
  let bg-decoration = {
    place(top + left, box(width: 100%, height: 100%, carbon-weave-bg()))
    place(top + left, box(width: 100%, height: 100%, precision-lines-overlay()))
    place(bottom + right, dx: 10pt, dy: 10pt, honeycomb-fragment(width: 140pt))
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
      background: bg-decoration,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — engineering frame, carbon weave texture, precision aesthetics
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light gray background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Carbon weave texture
    place(top + left, box(width: 100%, height: 100%, carbon-weave-bg()))
    // Engineering frame border
    place(top + left, box(width: 100%, height: 100%, eng-frame()))
    // Honeycomb fragment in top-right
    place(top + right, dx: -30pt, dy: 30pt, honeycomb-fragment(width: 180pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.text, info.title)
      #v(0.2em)
      // Metallic blue accent bar
      #std.align(center, box(width: 80pt, height: 3pt, fill: palette.primary, radius: 1.5pt))
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.primary, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.text, weight: "regular", info.author)
        v(0.25em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.titanium, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.15em)
        text(size: 0.8em, fill: palette.silver)[#utils.display-info-date(self)]
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

/// New section slide — sharp geometric divider with section title
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
    // Carbon weave
    place(top + left, box(width: 100%, height: 100%, carbon-weave-bg()))
    // Precision lines
    place(top + left, box(width: 100%, height: 100%, precision-lines-overlay()))
    // Left accent stripe (metallic blue)
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number — large titanium
      #text(size: 3.5em, fill: palette.silver, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Section title
      #set text(fill: palette.text, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Blue accent bar
      #box(width: 60pt, height: 3pt, fill: palette.primary, radius: 1.5pt)
      #v(1fr)
    ]
    // Bottom precision line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.border))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — dark engineering aesthetic, metallic blue bg, white text
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
    // Dark primary background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Carbon weave (visible on dark)
    place(top + left, box(width: 100%, height: 100%, carbon-weave-bg()))
    // Engineering frame
    place(top + left, box(width: 100%, height: 100%, eng-frame()))
    // Center content
    place(center + horizon,
      block(width: 78%, height: auto,
        align(center)[
          #set text(fill: white, size: 1.4em, weight: "bold")
          #body
          #v(0.5em)
          #std.align(center, box(width: 60pt, height: 2.5pt, fill: white.transparentize(40%), radius: 1pt))
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — engineering frame bookend, premium close
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.text))
    // Carbon weave texture (subtle on dark)
    place(top + left, box(width: 100%, height: 100%, carbon-weave-bg()))
    // Engineering frame
    place(top + left, box(width: 100%, height: 100%, eng-frame()))
    // Honeycomb decoration bottom-left
    place(bottom + left, dx: 20pt, dy: -20pt, honeycomb-fragment(width: 150pt))
    // Center content
    set std.align(center + horizon)
    block(width: 65%)[
      #set std.align(center)
      // Accent bar above
      #box(width: 60pt, height: 3pt, fill: palette.primary, radius: 1.5pt)
      #v(0.7em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: white, body)
      #v(0.4em)
      // Geo divider below
      #geo-divider(width: 50%)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — primary knowledge container with left metallic blue stripe
#let concept-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 4pt),
  )[
    // Title with small geometric marker
    #stack(dir: ltr, spacing: 6pt,
      box(width: 6pt, height: 6pt, fill: accent,
        rotate(45deg, box(width: 5pt, height: 5pt, fill: accent))),
      text(weight: "bold", fill: palette.text, size: 0.92em, title),
    )
    #v(5pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Insight box — highlighted key insight with titanium background accent
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.primary-light,
    stroke: (left: 4pt + palette.primary),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.95em, title),
      [
      #box(width: 36pt, height: 2pt, fill: palette.primary.transparentize(50%))
      #v(4pt)
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Stat card — large metric display with engineering precision feel
#let stat-card(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #stack(
      spacing: .8em,
      text(fill: palette.text-muted, size: 0.72em, weight: "medium", upper(label)),
      text(fill: color, size: 1.8em, weight: "bold", value),
    )
    // Top accent line (precision marker)
    #place(top + left, dx: -1pt, dy: -5pt,
      box(width: 24pt, height: 2pt, fill: color, radius: 1pt))
    #lazy-v(1fr)
  ]
}

/// Spec card — specification/data card with titanium header bar
#let spec-card(title, body, accent: palette.titanium) = {
  block(
    width: 100%,
    stroke: 1pt + palette.border,
    radius: 4pt,
    clip: true,
  )[
    // Seamless joined header/body regions intentionally have no gap.
    #stack(spacing: 0pt,
      // Header bar
      block(width: 100%, fill: accent, inset: (x: 0.9em, y: 0.45em))[
        #text(fill: white, weight: "bold", size: 0.82em, title)
      ],
      // Body
      block(width: 100%, fill: palette.card-bg, inset: (x: 0.9em, y: 0.7em))[
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Material box — carbon fiber material properties style card with subtle texture reference
#let material-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    // Honeycomb icon hint (small hex)
    #place(top + right, dx: -4pt, dy: -4pt,
      box(width: 16pt, height: 16pt,
        align(center + horizon,
          text(fill: accent.transparentize(60%), size: 0.7em)[◆])))
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      [
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Quote card — precision-styled quotation with geometric marks
#let quote-card(quote-text, attribution: none) = {
  block(
    width: 100%,
    fill: palette.titanium-light,
    stroke: (left: 3pt + palette.titanium),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    // Large geometric quote mark
    #place(top + left, dx: -0.4em, dy: -0.2em,
      text(fill: palette.titanium.transparentize(50%), size: 2.5em, weight: "bold")["])
    #v(0.3em)
    #set text(fill: palette.text, size: 0.88em, style: "italic")
    #quote-text
    #if attribution != none {
      v(0.4em)
      set text(fill: palette.titanium, size: 0.78em, style: "normal", weight: "medium")
      [--- #attribution]
    }
    #lazy-v(1fr)
  ]
}

/// Benchmark card — performance comparison card with red/blue indicators
#let benchmark-card(title, items) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #text(weight: "bold", fill: palette.text, size: 0.92em, title)
    #v(6pt)
    #for item in items {
      stack(dir: ltr, spacing: 8pt,
        box(width: 5pt, height: 5pt, fill: item.at("color", default: palette.primary), radius: 1pt),
        text(fill: palette.text, size: 0.8em)[#item.label],
        h(1fr),
        text(fill: item.at("color", default: palette.primary), size: 0.8em, weight: "bold")[#item.value],
      )
      v(4pt)
    }
    #lazy-v(1fr)
  ]
}

/// Callout box — alert/warning style with accent color and geometric icon
#let callout-box(body, type: "info") = {
  let (accent, icon) = if type == "warning" {
    (palette.accent-red, "▲")
  } else if type == "success" {
    (rgb("#16A34A"), "●")
  } else {
    (palette.primary, "◆")
  }
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 3pt + accent, rest: 1pt + accent.lighten(70%)),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 4pt),
  )[
    #stack(dir: ltr, spacing: 8pt,
      text(fill: accent, size: 0.9em)[#icon],
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}

/// Engineering tag — small capsule label for categorization
#let eng-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(50%),
    inset: (x: 0.6em, y: 0.25em),
    radius: 2pt,
  )[
    #text(fill: color, size: 0.72em, weight: "semibold", upper(content))
  ]
}

/// Precision divider — horizontal separator styled as measurement line
#let precision-divider(width: 80%) = {
  std.align(center,
    box(width: width)[
      #set std.align(horizon + center)
      #stack(dir: ltr, spacing: 0pt,
        box(width: 8pt, height: 2pt, fill: palette.primary, radius: 1pt),
        box(width: 1fr, height: 1pt, fill: palette.border),
        box(width: 6pt, height: 6pt, fill: none,
          stroke: 1.2pt + palette.primary,
          rotate(45deg, box(width: 4pt, height: 4pt))),
        box(width: 1fr, height: 1pt, fill: palette.border),
        box(width: 8pt, height: 2pt, fill: palette.primary, radius: 1pt),
      )
    ]
  )
}


// ═══ 3. Theme Entry Point ═══

#let carbon-fiber-theme(
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
      primary: palette.primary,
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
