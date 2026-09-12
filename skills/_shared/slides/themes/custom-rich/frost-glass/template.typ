// Frost Glass Theme — Frosted glass morphism with depth layers
// Translucent panels floating over subtle gradient backgrounds
// Frosted blur effects simulated through layered SVG patterns
// Rounded cards with glass edges, soft depth shadows
// Modern UI glassmorphism inspired by Apple iOS design language
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct -- Rich Theme) ===

#let palette = (
  bg-start: rgb("#F0F4FF"),
  bg-end: rgb("#FFFFFF"),
  text: rgb("#1A2744"),
  text-muted: rgb("#5A6B8A"),
  primary: rgb("#4A8FE7"),
  primary-dark: rgb("#2B5EA3"),
  secondary: rgb("#7C5CFC"),
  secondary-light: rgb("#B8A4FF"),
  card-bg: rgb("#FFFFFF").transparentize(25%),
  card-border: rgb("#FFFFFF").transparentize(40%),
  frost-white: rgb("#FFFFFF").transparentize(10%),
  glass-edge: rgb("#FFFFFF"),
  shadow: rgb("#1A2744").transparentize(92%),
  glow-blue: rgb("#4A8FE7").transparentize(70%),
  glow-violet: rgb("#7C5CFC").transparentize(70%),
  surface: rgb("#F7F9FF"),
)


// === SVG Definitions ===

// Full-page gradient mesh background -- soft color blobs simulating iOS-style backdrop
#let _gradient-mesh-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <defs>
    <radialGradient id="blob1" cx="20%" cy="30%" r="40%">
      <stop offset="0%" stop-color="#4A8FE7" stop-opacity="0.12"/>
      <stop offset="100%" stop-color="#4A8FE7" stop-opacity="0"/>
    </radialGradient>
    <radialGradient id="blob2" cx="75%" cy="60%" r="35%">
      <stop offset="0%" stop-color="#7C5CFC" stop-opacity="0.10"/>
      <stop offset="100%" stop-color="#7C5CFC" stop-opacity="0"/>
    </radialGradient>
    <radialGradient id="blob3" cx="50%" cy="80%" r="30%">
      <stop offset="0%" stop-color="#4A8FE7" stop-opacity="0.08"/>
      <stop offset="100%" stop-color="#4A8FE7" stop-opacity="0"/>
    </radialGradient>
    <radialGradient id="blob4" cx="85%" cy="15%" r="25%">
      <stop offset="0%" stop-color="#7C5CFC" stop-opacity="0.07"/>
      <stop offset="100%" stop-color="#7C5CFC" stop-opacity="0"/>
    </radialGradient>
  </defs>
  <rect width="840" height="474" fill="#F0F4FF"/>
  <rect width="840" height="474" fill="url(#blob1)"/>
  <rect width="840" height="474" fill="url(#blob2)"/>
  <rect width="840" height="474" fill="url(#blob3)"/>
  <rect width="840" height="474" fill="url(#blob4)"/>
  <ellipse cx="160" cy="140" rx="120" ry="100" fill="#4A8FE7" opacity="0.04"/>
  <ellipse cx="680" cy="320" rx="140" ry="110" fill="#7C5CFC" opacity="0.035"/>
  <ellipse cx="420" cy="400" rx="180" ry="80" fill="#4A8FE7" opacity="0.025"/>
  <circle cx="750" cy="80" r="60" fill="#B8A4FF" opacity="0.04"/>
</svg>```.text

// Floating orb/blob shapes -- subtle depth texture
#let _floating-orbs-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <circle cx="120" cy="80" r="40" fill="#4A8FE7" opacity="0.06"/>
  <circle cx="720" cy="100" r="55" fill="#7C5CFC" opacity="0.05"/>
  <circle cx="400" cy="420" r="70" fill="#4A8FE7" opacity="0.04"/>
  <circle cx="680" cy="380" r="45" fill="#B8A4FF" opacity="0.05"/>
  <circle cx="200" cy="350" r="35" fill="#7C5CFC" opacity="0.04"/>
  <circle cx="500" cy="60" r="30" fill="#4A8FE7" opacity="0.05"/>
  <circle cx="80" cy="240" r="25" fill="#B8A4FF" opacity="0.06"/>
  <circle cx="760" cy="240" r="50" fill="#4A8FE7" opacity="0.03"/>
  <ellipse cx="300" cy="200" rx="60" ry="40" fill="#7C5CFC" opacity="0.03"/>
  <ellipse cx="580" cy="280" rx="45" ry="55" fill="#4A8FE7" opacity="0.03"/>
</svg>```.text

// Frosted glass frame -- bookend element for title/ending with refraction arc
#let _glass-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <defs>
    <linearGradient id="refraction" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#4A8FE7" stop-opacity="0.4"/>
      <stop offset="25%" stop-color="#7C5CFC" stop-opacity="0.5"/>
      <stop offset="50%" stop-color="#B8A4FF" stop-opacity="0.4"/>
      <stop offset="75%" stop-color="#4A8FE7" stop-opacity="0.5"/>
      <stop offset="100%" stop-color="#7C5CFC" stop-opacity="0.3"/>
    </linearGradient>
    <linearGradient id="edge-top" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#FFFFFF" stop-opacity="0.1"/>
      <stop offset="50%" stop-color="#FFFFFF" stop-opacity="0.8"/>
      <stop offset="100%" stop-color="#FFFFFF" stop-opacity="0.1"/>
    </linearGradient>
    <linearGradient id="edge-left" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" stop-color="#FFFFFF" stop-opacity="0.6"/>
      <stop offset="50%" stop-color="#FFFFFF" stop-opacity="0.2"/>
      <stop offset="100%" stop-color="#FFFFFF" stop-opacity="0.5"/>
    </linearGradient>
  </defs>
  <rect x="40" y="30" width="760" height="414" rx="18" ry="18" fill="#FFFFFF" opacity="0.35"/>
  <rect x="40" y="30" width="760" height="414" rx="18" ry="18" fill="none" stroke="url(#edge-top)" stroke-width="1.5"/>
  <rect x="42" y="32" width="756" height="410" rx="16" ry="16" fill="none" stroke="url(#edge-left)" stroke-width="0.8"/>
  <path d="M120,30 Q420,8 720,30" fill="none" stroke="url(#refraction)" stroke-width="2.5" stroke-linecap="round"/>
  <path d="M120,444 Q420,466 720,444" fill="none" stroke="url(#refraction)" stroke-width="1.5" stroke-linecap="round" opacity="0.5"/>
  <circle cx="120" cy="30" r="3" fill="#4A8FE7" opacity="0.6"/>
  <circle cx="720" cy="30" r="3" fill="#7C5CFC" opacity="0.6"/>
  <circle cx="420" cy="10" r="2.5" fill="#B8A4FF" opacity="0.5"/>
  <circle cx="270" cy="18" r="2" fill="#4A8FE7" opacity="0.4"/>
  <circle cx="570" cy="18" r="2" fill="#7C5CFC" opacity="0.4"/>
</svg>```.text

// Depth layer concentric rounded rectangles -- section slide decoration
#let _depth-layers-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200">
  <rect x="10" y="10" width="180" height="180" rx="24" ry="24" fill="none" stroke="#4A8FE7" stroke-width="1" opacity="0.15"/>
  <rect x="25" y="25" width="150" height="150" rx="20" ry="20" fill="none" stroke="#7C5CFC" stroke-width="1" opacity="0.2"/>
  <rect x="40" y="40" width="120" height="120" rx="16" ry="16" fill="none" stroke="#4A8FE7" stroke-width="1.2" opacity="0.25"/>
  <rect x="55" y="55" width="90" height="90" rx="12" ry="12" fill="none" stroke="#B8A4FF" stroke-width="1.2" opacity="0.3"/>
  <rect x="70" y="70" width="60" height="60" rx="10" ry="10" fill="none" stroke="#7C5CFC" stroke-width="1.5" opacity="0.35"/>
  <rect x="82" y="82" width="36" height="36" rx="8" ry="8" fill="#4A8FE7" opacity="0.12"/>
  <circle cx="100" cy="100" r="8" fill="#7C5CFC" opacity="0.2"/>
  <circle cx="100" cy="100" r="3" fill="#4A8FE7" opacity="0.4"/>
</svg>```.text

// Refraction divider -- rainbow gradient thin line
#let _refraction-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="6" viewBox="0 0 300 6">
  <defs>
    <linearGradient id="rainbow" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#4A8FE7" stop-opacity="0.3"/>
      <stop offset="20%" stop-color="#7C5CFC" stop-opacity="0.6"/>
      <stop offset="40%" stop-color="#B8A4FF" stop-opacity="0.8"/>
      <stop offset="60%" stop-color="#4A8FE7" stop-opacity="0.7"/>
      <stop offset="80%" stop-color="#7C5CFC" stop-opacity="0.6"/>
      <stop offset="100%" stop-color="#4A8FE7" stop-opacity="0.3"/>
    </linearGradient>
  </defs>
  <rect x="0" y="2" width="300" height="2" rx="1" fill="url(#rainbow)"/>
  <circle cx="0" cy="3" r="2" fill="#4A8FE7" opacity="0.5"/>
  <circle cx="75" cy="3" r="1.5" fill="#7C5CFC" opacity="0.4"/>
  <circle cx="150" cy="3" r="2" fill="#B8A4FF" opacity="0.6"/>
  <circle cx="225" cy="3" r="1.5" fill="#4A8FE7" opacity="0.4"/>
  <circle cx="300" cy="3" r="2" fill="#7C5CFC" opacity="0.5"/>
  <path d="M0,3 Q75,0.5 150,3 Q225,5.5 300,3" fill="none" stroke="#FFFFFF" stroke-width="0.5" opacity="0.4"/>
  <path d="M30,3 Q90,1 150,3" fill="none" stroke="#B8A4FF" stroke-width="0.3" opacity="0.3"/>
</svg>```.text

// Glass edge highlight line
#let _glass-edge-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="4" viewBox="0 0 200 4">
  <defs>
    <linearGradient id="edgeglow" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#FFFFFF" stop-opacity="0"/>
      <stop offset="15%" stop-color="#FFFFFF" stop-opacity="0.5"/>
      <stop offset="50%" stop-color="#FFFFFF" stop-opacity="0.9"/>
      <stop offset="85%" stop-color="#FFFFFF" stop-opacity="0.5"/>
      <stop offset="100%" stop-color="#FFFFFF" stop-opacity="0"/>
    </linearGradient>
  </defs>
  <rect x="0" y="1" width="200" height="2" rx="1" fill="url(#edgeglow)"/>
  <rect x="20" y="1.5" width="160" height="1" rx="0.5" fill="#4A8FE7" opacity="0.15"/>
  <circle cx="50" cy="2" r="1" fill="#FFFFFF" opacity="0.7"/>
  <circle cx="100" cy="2" r="1.2" fill="#FFFFFF" opacity="0.8"/>
  <circle cx="150" cy="2" r="1" fill="#FFFFFF" opacity="0.7"/>
  <circle cx="75" cy="2" r="0.8" fill="#B8A4FF" opacity="0.4"/>
  <circle cx="125" cy="2" r="0.8" fill="#4A8FE7" opacity="0.4"/>
  <path d="M10,2 Q50,0.8 100,2 Q150,3.2 190,2" fill="none" stroke="#FFFFFF" stroke-width="0.3" opacity="0.5"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render gradient mesh background
#let gradient-mesh-bg() = {
  image(bytes(_gradient-mesh-svg), width: 100%, height: 100%)
}

/// Render floating orbs background
#let floating-orbs-bg() = {
  image(bytes(_floating-orbs-svg), width: 100%, height: 100%)
}

/// Render glass frame overlay (title/ending bookend)
#let glass-frame() = {
  image(bytes(_glass-frame-svg), width: 100%, height: 100%)
}

/// Render depth layers decoration
#let depth-layers(size: 120pt) = {
  box(width: size, height: size, image(bytes(_depth-layers-svg), width: size, height: size))
}

/// Render refraction divider
#let refraction-divider(width: 100%) = {
  box(width: width, image(bytes(_refraction-divider-svg), width: width, height: 5pt))
}

/// Render glass edge highlight
#let glass-edge(width: 120pt) = {
  box(width: width, image(bytes(_glass-edge-svg), width: width, height: 3pt))
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides -- gradient mesh + orbs + corner accents
#let _content-atmosphere() = {
  // Full-page gradient mesh
  place(top + left, box(width: 100%, height: 100%, gradient-mesh-bg()))
  // Floating orbs layer
  place(top + left, box(width: 100%, height: 100%, floating-orbs-bg()))
  // Soft corner glow accents
  place(top + right, dx: -2em, dy: 1em,
    circle(radius: 4pt, fill: palette.glow-blue))
  place(bottom + left, dx: 1.5em, dy: -1em,
    circle(radius: 3pt, fill: palette.glow-violet))
}


// === 1. Slide Functions ===

/// Standard content slide -- frosted glass atmosphere, glass-edge title decoration
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
        set text(fill: palette.text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Glass edge highlight under title
      glass-edge(width: 140pt),
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
        // Frosted dot separator
        box(width: 6pt, height: 6pt, radius: 3pt,
          fill: gradient.linear(palette.primary, palette.secondary))
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

/// Title slide -- glass frame bookend, gradient mesh, centered branding
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Gradient mesh background
    place(top + left, box(width: 100%, height: 100%, gradient-mesh-bg()))
    // Floating orbs
    place(top + left, box(width: 100%, height: 100%, floating-orbs-bg()))
    // Glass frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, glass-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: .8em,
        stack(
          spacing: .8em,
          text(size: 2.4em, weight: "bold", fill: palette.text, info.title),
          std.align(center, refraction-divider(width: 240pt)),
        ),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.secondary, weight: "medium", info.subtitle)
        },
        stack(
          spacing: .8em,
          if info.author != none { text(size: 1em, fill: palette.text, weight: "regular", info.author) },
          if info.institution != none { text(size: 0.8em, fill: palette.text-muted, info.institution) },
          if info.date != none { text(size: 0.8em, fill: palette.primary-dark)[#utils.display-info-date(self)] },
        ),
      )
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

/// New section slide -- depth layers decoration, section title, frosted atmosphere
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
    // Gradient mesh background
    place(top + left, box(width: 100%, height: 100%, gradient-mesh-bg()))
    // Floating orbs
    place(top + left, box(width: 100%, height: 100%, floating-orbs-bg()))
    // Left frosted accent bar
    place(top + left, block(width: 5pt, height: 100%,
      fill: gradient.linear(palette.primary, palette.secondary, angle: 180deg)))
    // Depth layers decoration in bottom-right
    place(bottom + right, dx: -2em, dy: -1.5em, depth-layers(size: 100pt))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      #stack(
        spacing: .8em,
        text(size: 3.5em, fill: palette.primary, weight: "bold")[#utils.display-current-heading-number(depth: 1, numbering: "1")],
        glass-edge(width: 100pt),
        text(fill: palette.text, size: 2em, weight: "bold")[#utils.display-current-heading(level: 1, numbered: false)],
      )
      #v(1fr)
    ]
    // Bottom refraction line
    place(bottom + left, dx: 0pt, dy: -0.5em,
      box(width: 100%, std.align(center, refraction-divider(width: 50%))))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- deep frosted panel centered, glass edge emphasis
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
    // Gradient mesh background
    place(top + left, box(width: 100%, height: 100%, gradient-mesh-bg()))
    // Floating orbs
    place(top + left, box(width: 100%, height: 100%, floating-orbs-bg()))
    // Center frosted panel
    place(center + horizon,
      block(width: 78%, height: auto,
        fill: palette.frost-white,
        stroke: 1pt + palette.card-border,
        radius: 16pt,
        inset: (x: 2.5em, y: 2em),
        align(center)[
          #stack(
            spacing: .8em,
            text(fill: palette.text, size: 1.4em, weight: "bold")[#body],
            refraction-divider(width: 180pt),
          )
        ]
      )
    )
    // Corner glow accents
    place(top + left, dx: 3em, dy: 2em,
      circle(radius: 5pt, fill: palette.glow-blue))
    place(bottom + right, dx: -3em, dy: -2em,
      circle(radius: 5pt, fill: palette.glow-violet))
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- glass frame bookend, gradient mesh, farewell message
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
    // Gradient mesh background
    place(top + left, box(width: 100%, height: 100%, gradient-mesh-bg()))
    // Floating orbs
    place(top + left, box(width: 100%, height: 100%, floating-orbs-bg()))
    // Glass frame (bookend -- shared with title slide)
    place(top + left, box(width: 100%, height: 100%, glass-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        refraction-divider(width: 200pt),
        text(size: 2.4em, weight: "bold", fill: palette.text, body),
        glass-edge(width: 160pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Pane card -- frosted glass panel with translucent fill and glass border
#let pane-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.frost-white,
    stroke: (left: 3pt + accent, rest: 1pt + palette.card-border),
    inset: (x: 1em, y: 0.55em),
    radius: 8pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 8pt, height: 8pt, radius: 4pt,
          fill: gradient.linear(accent, accent.lighten(30%))),
        text(weight: "bold", fill: palette.text, size: 0.92em, title),
      ),
      { set text(fill: palette.text, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Frost box -- highlighted content with glass edge border all around
#let frost-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: 1.5pt + accent.transparentize(40%),
    inset: (x: 1.2em, y: 0.6em),
    radius: 10pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        glass-edge(width: 50pt),
        text(weight: "bold", fill: accent, size: 0.95em, title),
      ),
      { set text(fill: palette.text, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Blur tag -- rounded capsule with gradient background
#let blur-tag(content, color: palette.primary) = {
  box(
    fill: gradient.linear(color.lighten(80%), color.lighten(90%)),
    stroke: 1pt + color.transparentize(50%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt,
        fill: gradient.linear(color, color.lighten(20%))),
      text(fill: color.darken(20%), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Depth card -- layered card with shadow effect (double border creates depth)
#let depth-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (top: 3pt + accent, rest: 1pt + palette.shadow),
    inset: (x: 1em, y: 0.6em),
    radius: (bottom: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.text, size: 0.92em, title),
      stack(
        spacing: .8em,
        block(width: 40pt, height: 2pt, fill: accent.transparentize(50%), radius: 1pt),
        { set text(fill: palette.text, size: 0.82em); body },
      ),
      lazy-v(1fr),
    )
  ]
}

/// Refraction divider component -- rainbow-gradient thin separator (reusable)
#let refraction-separator(width: 80%) = {
  std.align(center, box(width: width, refraction-divider(width: 100%)))
}

/// Crystal stat -- KPI with glass panel display
#let crystal-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.frost-white,
    stroke: 1pt + palette.card-border,
    inset: (x: 0.8em, y: 0.4em),
    radius: 10pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    // Top-right glass glow dot
    #place(top + right, dx: -6pt, dy: 6pt,
      box(width: 8pt, height: 8pt, radius: 4pt,
        fill: gradient.linear(color.transparentize(40%), color.transparentize(70%))))
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: color, size: 1.8em, weight: "bold")
        #value
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Layer card -- stacked content with depth visual (offset shadow block)
#let layer-card(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.frost-white,
    stroke: (left: 4pt + accent, rest: 1pt + palette.card-border),
    inset: (x: 1.2em, y: 0.6em),
    radius: (right: 10pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      stack(
        spacing: .8em,
        block(width: 100%, height: 1.5pt,
          fill: gradient.linear(accent.transparentize(20%), accent.transparentize(90%)),
          radius: 0.75pt),
        { set text(fill: palette.text, size: 0.82em); body },
      ),
      lazy-v(1fr),
    )
  ]
}

/// Glass tile grid -- themed multi-item tile matrix (takes array content)
#let glass-tile-grid(items, columns: 2, gutter: 0.8em) = {
  let col-sizes = range(columns).map(_ => 1fr)
  grid(
    columns: col-sizes,
    column-gutter: gutter,
    row-gutter: gutter,
    ..items.map(item => {
      block(
        width: 100%,
        fill: palette.frost-white,
        stroke: 1pt + palette.card-border,
        inset: (x: 0.8em, y: 0.6em),
        radius: 8pt,
      )[
        #set text(fill: palette.text, size: 0.80em)
        #item
      ]
    })
  )
}

/// Glow box -- emphasis box with soft outer glow (via colored border)
#let glow-box(title, body, color: palette.primary) = {
  block(
    width: 100%,
    fill: color.lighten(95%),
    stroke: 2pt + color.transparentize(30%),
    inset: (x: 1.2em, y: 0.6em),
    radius: 12pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: color, size: 0.95em, title),
      stack(
        spacing: .8em,
        block(width: 30pt, height: 2pt, fill: color.transparentize(40%), radius: 1pt),
        { set text(fill: palette.text, size: 0.82em); body },
      ),
      lazy-v(1fr),
    )
  ]
}

/// Notification note -- floating alert/insight with icon indicator
#let notification-note(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(93%),
    stroke: (left: 4pt + accent, rest: 1pt + accent.transparentize(60%)),
    inset: (x: 1em, y: 0.55em),
    radius: (right: 8pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 8pt, height: 8pt, radius: 2pt, fill: accent),
        text(weight: "bold", fill: accent, size: 0.88em, title),
      ),
      { set text(fill: palette.text, size: 0.80em); body },
      lazy-v(1fr),
    )
  ]
}


// === 3. Theme Entry Point ===

#let frost-glass-theme(
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
      fill: palette.bg-start,
      margin: (top: 3.5em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: palette.surface,
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
