// Aqua Desktop Theme — macOS/Aqua desktop UI inspired
// Window chrome with traffic light buttons, frosted glass panels, toolbar aesthetics,
// subtle dock reflections, clean San Francisco typography feel.
// Light theme with Apple gray backgrounds — tech presentations, developer tools, SaaS demos.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  bg: rgb("#F5F5F7"),             // Window BG (Apple gray)
  toolbar: rgb("#E8E8ED"),        // Toolbar/header fill
  active-blue: rgb("#007AFF"),    // Primary accent (system blue)
  purple: rgb("#AF52DE"),         // Secondary accent
  text-dark: rgb("#1D1D1F"),      // Heading text
  body-text: rgb("#424245"),      // Body copy
  card: rgb("#FFFFFF"),           // Card/window background
  border: rgb("#D2D2D7"),         // Window/card borders
  sidebar: rgb("#F0F0F5"),        // Sidebar panel fill
  traffic-red: rgb("#FF5F57"),    // Close button
  traffic-yellow: rgb("#FFBD2E"), // Minimize button
  traffic-green: rgb("#28C840"), // Fullscreen button
)


// === SVG Definitions ===

// Dot-grid pattern — subtle background texture for slides (full page)
#let _dot-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <defs>
    <pattern id="dotgrid" width="24" height="24" patternUnits="userSpaceOnUse">
      <circle cx="12" cy="12" r="0.8" fill="#D2D2D7" opacity="0.5"/>
    </pattern>
  </defs>
  <rect width="840" height="474" fill="url(#dotgrid)"/>
  <!-- Subtle gradient fade at edges -->
  <rect x="0" y="0" width="840" height="30" fill="#F5F5F7" opacity="0.6"/>
  <rect x="0" y="444" width="840" height="30" fill="#F5F5F7" opacity="0.6"/>
  <rect x="0" y="0" width="30" height="474" fill="#F5F5F7" opacity="0.4"/>
  <rect x="810" y="0" width="30" height="474" fill="#F5F5F7" opacity="0.4"/>
  <!-- Micro accent dots along right edge -->
  <circle cx="820" cy="120" r="1.2" fill="#007AFF" opacity="0.1"/>
  <circle cx="820" cy="240" r="1.2" fill="#AF52DE" opacity="0.08"/>
  <circle cx="820" cy="360" r="1.2" fill="#007AFF" opacity="0.1"/>
</svg>```.text

// Frosted glass panel — large translucent panel with layered opacity (for title/ending slides)
#let _frosted-panel-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="680" height="380" viewBox="0 0 680 380">
  <defs>
    <linearGradient id="frostGrad" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#FFFFFF;stop-opacity:0.92"/>
      <stop offset="40%" style="stop-color:#FFFFFF;stop-opacity:0.88"/>
      <stop offset="100%" style="stop-color:#F5F5F7;stop-opacity:0.85"/>
    </linearGradient>
    <filter id="frostBlur">
      <feGaussianBlur in="SourceGraphic" stdDeviation="1"/>
    </filter>
  </defs>
  <!-- Outer shadow layer -->
  <rect x="4" y="4" width="672" height="372" rx="12" ry="12" fill="#000000" opacity="0.04"/>
  <!-- Main frosted panel -->
  <rect x="0" y="0" width="672" height="368" rx="10" ry="10" fill="url(#frostGrad)" stroke="#D2D2D7" stroke-width="0.8"/>
  <!-- Inner highlight -->
  <rect x="1" y="1" width="670" height="366" rx="9" ry="9" fill="none" stroke="#FFFFFF" stroke-width="1" opacity="0.6"/>
  <!-- Subtle noise texture approximation -->
  <line x1="20" y1="60" x2="652" y2="60" stroke="#E8E8ED" stroke-width="0.3" opacity="0.5"/>
  <line x1="20" y1="120" x2="652" y2="120" stroke="#E8E8ED" stroke-width="0.2" opacity="0.3"/>
  <line x1="20" y1="180" x2="652" y2="180" stroke="#E8E8ED" stroke-width="0.2" opacity="0.3"/>
  <line x1="20" y1="240" x2="652" y2="240" stroke="#E8E8ED" stroke-width="0.2" opacity="0.3"/>
  <line x1="20" y1="300" x2="652" y2="300" stroke="#E8E8ED" stroke-width="0.2" opacity="0.3"/>
  <!-- Refraction light streaks -->
  <path d="M50,10 Q200,20 350,10 Q500,0 650,15" fill="none" stroke="#FFFFFF" stroke-width="1.5" opacity="0.4"/>
  <path d="M100,350 Q300,360 500,355 Q600,352 660,358" fill="none" stroke="#FFFFFF" stroke-width="1" opacity="0.2"/>
</svg>```.text

// Dock reflection — mirrored gradient bar for bottom of slides
#let _dock-reflection-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="40" viewBox="0 0 840 40">
  <defs>
    <linearGradient id="dockGrad" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#E8E8ED;stop-opacity:0.6"/>
      <stop offset="50%" style="stop-color:#D2D2D7;stop-opacity:0.3"/>
      <stop offset="100%" style="stop-color:#F5F5F7;stop-opacity:0"/>
    </linearGradient>
    <linearGradient id="dockShine" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#FFFFFF;stop-opacity:0"/>
      <stop offset="30%" style="stop-color:#FFFFFF;stop-opacity:0.4"/>
      <stop offset="50%" style="stop-color:#FFFFFF;stop-opacity:0.6"/>
      <stop offset="70%" style="stop-color:#FFFFFF;stop-opacity:0.4"/>
      <stop offset="100%" style="stop-color:#FFFFFF;stop-opacity:0"/>
    </linearGradient>
  </defs>
  <!-- Main dock reflection band -->
  <rect x="80" y="0" width="680" height="3" rx="1.5" fill="url(#dockGrad)"/>
  <!-- Shine highlight -->
  <rect x="200" y="0" width="440" height="1.5" rx="0.75" fill="url(#dockShine)"/>
  <!-- Dock divider marks -->
  <rect x="280" y="6" width="1" height="8" rx="0.5" fill="#D2D2D7" opacity="0.4"/>
  <rect x="420" y="6" width="1" height="8" rx="0.5" fill="#D2D2D7" opacity="0.4"/>
  <rect x="560" y="6" width="1" height="8" rx="0.5" fill="#D2D2D7" opacity="0.4"/>
  <!-- Subtle app icon placeholders -->
  <rect x="160" y="10" width="16" height="16" rx="4" fill="#E8E8ED" opacity="0.3"/>
  <rect x="240" y="10" width="16" height="16" rx="4" fill="#007AFF" opacity="0.12"/>
  <rect x="320" y="10" width="16" height="16" rx="4" fill="#E8E8ED" opacity="0.3"/>
  <rect x="400" y="10" width="16" height="16" rx="4" fill="#AF52DE" opacity="0.1"/>
  <rect x="480" y="10" width="16" height="16" rx="4" fill="#E8E8ED" opacity="0.3"/>
  <rect x="560" y="10" width="16" height="16" rx="4" fill="#28C840" opacity="0.12"/>
  <rect x="640" y="10" width="16" height="16" rx="4" fill="#E8E8ED" opacity="0.3"/>
</svg>```.text

// Toolbar texture — horizontal striped toolbar pattern
#let _toolbar-texture-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="48" viewBox="0 0 840 48">
  <defs>
    <linearGradient id="toolbarGrad" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#F0F0F5;stop-opacity:1"/>
      <stop offset="50%" style="stop-color:#E8E8ED;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#DCDCE2;stop-opacity:1"/>
    </linearGradient>
  </defs>
  <!-- Toolbar base -->
  <rect x="0" y="0" width="840" height="48" fill="url(#toolbarGrad)"/>
  <!-- Subtle horizontal striping -->
  <line x1="0" y1="12" x2="840" y2="12" stroke="#FFFFFF" stroke-width="0.5" opacity="0.4"/>
  <line x1="0" y1="24" x2="840" y2="24" stroke="#FFFFFF" stroke-width="0.3" opacity="0.3"/>
  <line x1="0" y1="36" x2="840" y2="36" stroke="#FFFFFF" stroke-width="0.5" opacity="0.4"/>
  <!-- Bottom border -->
  <line x1="0" y1="47" x2="840" y2="47" stroke="#D2D2D7" stroke-width="1"/>
  <!-- Toolbar button outlines (segmented controls) -->
  <rect x="300" y="10" width="80" height="28" rx="6" fill="none" stroke="#D2D2D7" stroke-width="0.8" opacity="0.5"/>
  <rect x="380" y="10" width="80" height="28" rx="6" fill="none" stroke="#D2D2D7" stroke-width="0.8" opacity="0.5"/>
  <rect x="460" y="10" width="80" height="28" rx="6" fill="none" stroke="#D2D2D7" stroke-width="0.8" opacity="0.5"/>
  <!-- Active segment highlight -->
  <rect x="301" y="11" width="78" height="26" rx="5" fill="#007AFF" opacity="0.08"/>
  <!-- Traffic lights in toolbar -->
  <circle cx="24" cy="24" r="6" fill="#FF5F57"/>
  <circle cx="44" cy="24" r="6" fill="#FFBD2E"/>
  <circle cx="64" cy="24" r="6" fill="#28C840"/>
</svg>```.text

// Window chrome frame — macOS-style window border for title/ending slides
#let _window-chrome-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="740" height="420" viewBox="0 0 740 420">
  <defs>
    <linearGradient id="titleBarGrad" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#F6F6F6;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#E8E8ED;stop-opacity:1"/>
    </linearGradient>
    <linearGradient id="windowShadow" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#000000;stop-opacity:0.08"/>
      <stop offset="100%" style="stop-color:#000000;stop-opacity:0.02"/>
    </linearGradient>
  </defs>
  <!-- Drop shadow -->
  <rect x="6" y="8" width="730" height="410" rx="12" ry="12" fill="url(#windowShadow)"/>
  <!-- Window body -->
  <rect x="0" y="0" width="730" height="405" rx="10" ry="10" fill="#FFFFFF" stroke="#D2D2D7" stroke-width="1"/>
  <!-- Title bar -->
  <rect x="1" y="1" width="728" height="38" rx="10" ry="10" fill="url(#titleBarGrad)"/>
  <rect x="1" y="20" width="728" height="19" fill="url(#titleBarGrad)"/>
  <!-- Title bar bottom border -->
  <line x1="1" y1="39" x2="729" y2="39" stroke="#D2D2D7" stroke-width="1"/>
  <!-- Traffic light buttons -->
  <circle cx="22" cy="20" r="6" fill="#FF5F57" stroke="#E0443E" stroke-width="0.5"/>
  <circle cx="42" cy="20" r="6" fill="#FFBD2E" stroke="#DEA123" stroke-width="0.5"/>
  <circle cx="62" cy="20" r="6" fill="#28C840" stroke="#1AAB29" stroke-width="0.5"/>
  <!-- Window title center text placeholder -->
  <rect x="300" y="14" width="130" height="12" rx="2" fill="#D2D2D7" opacity="0.4"/>
  <!-- Inner content area highlight -->
  <rect x="2" y="40" width="726" height="363" fill="none" stroke="#FFFFFF" stroke-width="0.5" opacity="0.6"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render dot-grid background atmosphere
#let dot-grid-bg() = {
  image(bytes(_dot-grid-svg), width: 100%, height: 100%)
}

/// Render frosted glass panel
#let frosted-panel(width: 80%) = {
  box(width: width, image(bytes(_frosted-panel-svg), width: 100%))
}

/// Render dock reflection bar
#let dock-reflection-bar() = {
  image(bytes(_dock-reflection-svg), width: 100%, height: 28pt)
}

/// Render toolbar texture
#let toolbar-texture() = {
  image(bytes(_toolbar-texture-svg), width: 100%, height: 36pt)
}

/// Render window chrome frame
#let window-chrome() = {
  image(bytes(_window-chrome-svg), width: 100%, height: 100%)
}


// === Background Atmosphere ===

/// Persistent dot-grid atmosphere for content slides
#let _bg-atmosphere() = {
  place(top + left,
    box(width: 100%, height: 100%, dot-grid-bg()))
  // Subtle dock reflection at bottom
  place(bottom + center, dy: -2pt, dock-reflection-bar())
}


// === 1. Slide Functions ===

/// Standard content slide — light gray bg, toolbar-style header with traffic lights
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
      spacing: 0.8em,
      // Traffic lights + title in toolbar style
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 5pt, fill: palette.traffic-red)),
        box(circle(radius: 5pt, fill: palette.traffic-yellow)),
        box(circle(radius: 5pt, fill: palette.traffic-green)),
        h(12pt),
        {
          set text(fill: palette.text-dark, size: 1.3em, weight: "semibold")
          if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        },
      ),
      // Toolbar underline
      block(width: 100%, height: 1pt, fill: palette.border),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.body-text, size: 0.6em)
    block(width: 100%)[
      #grid(columns: (1fr, auto, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        {
          // System blue dot
          std.align(center, box(circle(radius: 2.5pt, fill: palette.active-blue)))
        },
        std.align(right, context {
          text(fill: palette.body-text, size: 0.9em)[
            #utils.slide-counter.display() / #utils.last-slide-number
          ]
        }),
      )
    ]
  }
  let bg-decoration = {
    _bg-atmosphere()
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

/// Title slide — full desktop with frosted window panel, traffic lights, app title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Apple gray background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Dot grid atmosphere
    place(top + left, box(width: 100%, height: 100%, dot-grid-bg()))
    // Window chrome frame centered
    place(center + horizon, box(width: 88%, height: 88%, window-chrome()))
    // Keep the semantic content in flow so Touying can measure the slide.
    align(center + horizon)[
      #block(width: 86%, fill: none)[
        #set std.align(center + horizon)
        #pad(x: 3em, top: 3em)[
          // Title
          #text(size: 2.4em, weight: "semibold", fill: palette.text-dark, info.title)
          #v(0.3em)
          // System blue accent bar
          #std.align(center, box(width: 80pt, height: 3pt, fill: palette.active-blue, radius: 1.5pt))
          #v(0.5em)
          // Subtitle
          #if info.subtitle != none {
            text(size: 1.1em, fill: palette.active-blue, weight: "medium", info.subtitle)
            v(0.5em)
          }
          // Author
          #if info.author != none {
            text(size: 1em, fill: palette.text-dark, weight: "regular", info.author)
            v(0.25em)
          }
          // Institution
          #if info.institution != none {
            text(size: 0.8em, fill: palette.body-text, info.institution)
            v(0.2em)
          }
          // Date
          #if info.date != none {
            v(0.15em)
            text(size: 0.8em, fill: palette.body-text)[#utils.display-info-date(self)]
          }
        ]
      ]
    ]
    // Dock reflection at bottom
    place(bottom + center, dy: -8pt, dock-reflection-bar())
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

/// New section slide — sidebar left panel with section number, frosted glass main area
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
    // Dot grid
    place(top + left, box(width: 100%, height: 100%, dot-grid-bg()))
    // Sidebar panel (left 25%)
    place(top + left, block(width: 25%, height: 100%, fill: palette.sidebar, stroke: (right: 1pt + palette.border)))
    // Section number in sidebar
    place(left + horizon, dx: 3em,
      text(size: 4em, weight: "bold", fill: palette.active-blue.transparentize(30%))[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
    )
    // Main content stays in flow; the sidebar remains a decorative layer.
    align(right + horizon)[
      #block(width: 75%, fill: none)[
      #set std.align(left + horizon)
      #pad(left: 3em, right: 3em)[
        // Traffic lights
        #stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 5pt, fill: palette.traffic-red)),
          box(circle(radius: 5pt, fill: palette.traffic-yellow)),
          box(circle(radius: 5pt, fill: palette.traffic-green)),
        )
        #v(1em)
        // Section title
        #set text(fill: palette.text-dark, size: 2em, weight: "semibold")
        #utils.display-current-heading(level: 1, numbered: false)
        #v(0.4em)
        // Blue accent bar
        #box(width: 60pt, height: 3pt, fill: palette.active-blue, radius: 1.5pt)
      ]
      ]
    ]
    // Dock at bottom
    place(bottom + center, dy: -4pt, dock-reflection-bar())
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — clean list with toolbar header
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
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
    // Dot grid atmosphere
    _bg-atmosphere()
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      // Toolbar-style header
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 5pt, fill: palette.traffic-red)),
        box(circle(radius: 5pt, fill: palette.traffic-yellow)),
        box(circle(radius: 5pt, fill: palette.traffic-green)),
        h(12pt),
        text(size: 1.6em, weight: "semibold", fill: palette.text-dark, title),
      ),
      block(width: 100%, height: 1pt, fill: palette.border),
      {
        v(0.4em)
        set text(size: 1.1em, fill: palette.body-text)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — System Blue background, white text, minimal window frame
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
    // System Blue background
    place(top + left, block(width: 100%, height: 100%, fill: palette.active-blue))
    // Subtle dot grid (lighter)
    place(top + left, box(width: 100%, height: 100%, dot-grid-bg()))
    // Minimal window frame accent (top bar hint)
    place(top + center, dy: 20pt,
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 4pt, fill: white.transparentize(50%))),
        box(circle(radius: 4pt, fill: white.transparentize(50%))),
        box(circle(radius: 4pt, fill: white.transparentize(50%))),
      )
    )
    // Center content remains measurable by Touying.
    align(center + horizon)[
      #block(width: 100%, inset: (x: 1em))[
        #set std.align(center)
        #set text(fill: white, size: 1.6em, weight: "semibold")
        #body
        #v(0.5em)
        #std.align(center, box(width: 60pt, height: 2.5pt, fill: white.transparentize(40%), radius: 1pt))
      ]
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — frosted window, dock reflection (bookend with title slide)
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
    // Apple gray background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Dot grid atmosphere
    place(top + left, box(width: 100%, height: 100%, dot-grid-bg()))
    // Window chrome frame centered (bookend — matches title-slide)
    place(center + horizon, box(width: 88%, height: 88%, window-chrome()))
    // Keep the closing message in normal flow for Touying measurement.
    align(center + horizon)[
      #block(width: 86%, fill: none)[
        #set std.align(center + horizon)
        #pad(x: 3em)[
          // Blue accent bar above
          #std.align(center, box(width: 60pt, height: 3pt, fill: palette.active-blue, radius: 1.5pt))
          #v(0.7em)
          // Main text
          #text(size: 2.4em, weight: "semibold", fill: palette.text-dark, body)
          #v(0.4em)
          // Purple accent
          #std.align(center, box(width: 40pt, height: 2pt, fill: palette.purple.transparentize(40%), radius: 1pt))
        ]
      ]
    ]
    // Dock reflection at bottom (bookend — matches title-slide)
    place(bottom + center, dy: -8pt, dock-reflection-bar())
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Window card — macOS window with title bar + traffic lights + content area
#let window-card(title, body, accent: palette.active-blue) = {
  block(width: 100%, stroke: 0.5pt + palette.border, radius: 8pt, clip: true)[
    #stack(spacing: 0pt,
      // Title bar with traffic lights
      block(
        width: 100%,
        fill: palette.toolbar,
        stroke: (bottom: 1pt + accent.transparentize(35%)),
        inset: (x: 12pt, y: 8pt),
      )[
        #stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 5pt, fill: palette.traffic-red)),
          box(circle(radius: 5pt, fill: palette.traffic-yellow)),
          box(circle(radius: 5pt, fill: palette.traffic-green)),
          h(8pt),
          text(size: 0.75em, fill: palette.body-text, weight: "medium", title),
        )
      ],
      // Content area
      block(width: 100%, fill: palette.card, inset: 14pt)[
        #set text(fill: palette.body-text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Toolbar box — toolbar-style box with segmented controls look
#let toolbar-box(title, body, accent: palette.active-blue) = {
  block(width: 100%, stroke: 0.5pt + palette.border, radius: 8pt, clip: true)[
    #stack(spacing: 0pt,
      // Toolbar header with segmented control styling
      block(width: 100%, fill: palette.toolbar, inset: (x: 12pt, y: 7pt))[
        #stack(dir: ltr, spacing: 6pt,
          box(
            fill: accent.lighten(90%),
            stroke: 0.5pt + accent.transparentize(60%),
            inset: (x: 8pt, y: 3pt),
            radius: 4pt,
          )[
            #text(size: 0.7em, fill: accent, weight: "semibold", title)
          ],
        )
      ],
      // Body content
      block(width: 100%, fill: palette.card, inset: (x: 14pt, y: 12pt))[
        #set text(fill: palette.body-text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Notification card — rounded notification banner style
#let notification-card(title, body, accent: palette.active-blue) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (left: 3pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 10pt,
  )[
    #stack(dir: ltr, spacing: 8pt,
      // App icon placeholder
      box(width: 24pt, height: 24pt, fill: accent.lighten(80%), radius: 6pt,
        align(center + horizon, circle(radius: 4pt, fill: accent))),
      {
        stack(
          spacing: 0.8em,
          text(weight: "semibold", fill: palette.text-dark, size: 0.88em, title),
          {
            set text(fill: palette.body-text, size: 0.78em)
            body
          },
        )
      },
    )
    #lazy-v(1fr)
  ]
}

/// Metric panel — clean stat in a sidebar-style panel
#let metric-panel(value, label, accent: palette.active-blue) = {
  block(
    width: 100%,
    fill: palette.sidebar,
    stroke: (bottom: 2pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1em, y: 0.35em),
    radius: 8pt,
  )[
    #stack(
      spacing: 0.8em,
      text(fill: accent, size: 1.8em, weight: "semibold", value),
      {
        set text(fill: palette.body-text, size: 0.72em, weight: "medium")
        upper(label)
      },
      lazy-v(1fr),
    )
  ]
}

/// Code window — terminal/code window with dark title bar and code content
#let code-window(title, body) = {
  block(width: 100%, stroke: 0.5pt + palette.border, radius: 8pt, clip: true)[
    #stack(spacing: 0pt,
      // Dark terminal title bar
      block(width: 100%, fill: rgb("#2D2D2D"), inset: (x: 12pt, y: 7pt))[
        #stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 5pt, fill: palette.traffic-red)),
          box(circle(radius: 5pt, fill: palette.traffic-yellow)),
          box(circle(radius: 5pt, fill: palette.traffic-green)),
          h(8pt),
          text(size: 0.7em, fill: rgb("#AAAAAA"), weight: "medium", title),
        )
      ],
      // Code content area (dark)
      block(width: 100%, fill: rgb("#1E1E1E"), inset: (x: 14pt, y: 12pt))[
        #set text(fill: rgb("#D4D4D4"), size: 0.75em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Tag pill — rounded pill tag (like macOS tags)
#let tag-pill(content, color: palette.active-blue) = {
  box(
    fill: color.lighten(88%),
    stroke: 0.5pt + color.transparentize(50%),
    inset: (x: 0.7em, y: 0.25em),
    radius: 10pt,
  )[
    #box(circle(radius: 3pt, fill: color))
    #h(0.3em)
    #text(fill: color.darken(20%), size: 0.72em, weight: "medium", content)
  ]
}

/// Sidebar item — sidebar list item with dot indicator
#let sidebar-item(title, body, accent: palette.active-blue) = {
  block(
    width: 100%,
    fill: palette.sidebar,
    stroke: 0.5pt + palette.border,
    inset: (x: 1em, y: 0.35em),
    radius: 6pt,
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 4pt, fill: accent)),
        text(weight: "semibold", fill: palette.text-dark, size: 0.88em, title),
      ),
      {
        set text(fill: palette.body-text, size: 0.78em)
        pad(left: 16pt, body)
      },
      lazy-v(1fr),
    )
  ]
}

/// Dropdown card — dropdown menu styled card
#let dropdown-card(title, body, accent: palette.active-blue) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.5pt + palette.border,
    inset: (x: 1em, y: 0.35em),
    radius: 6pt,
  )[
    // Header with chevron
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        text(fill: accent, size: 0.8em, weight: "bold")[▾],
        text(weight: "bold", fill: palette.text-dark, size: 0.88em, title),
      ),
      block(width: 100%, height: 0.5pt, fill: palette.border),
    )
    #set text(fill: palette.body-text, size: 0.78em)
    #body
    #lazy-v(1fr)
  ]
}

/// Progress bar — macOS-style progress indicator
#let progress-bar(value, label, accent: palette.active-blue, progress: 70%) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.5pt + palette.border,
    inset: (x: 1em, y: 0.7em),
    radius: 6pt,
  )[
    #stack(
      spacing: 0.8em,
      grid(
        columns: (1fr, auto),
        text(fill: palette.body-text, size: 0.78em, weight: "medium", label),
        text(fill: accent, size: 0.78em, weight: "bold", value),
      ),
      block(width: 100%, height: 6pt, fill: palette.toolbar, radius: 3pt)[
        #place(top + left,
          block(width: progress, height: 6pt, fill: accent, radius: 3pt))
      ],
      lazy-v(1fr),
    )
  ]
}

/// Dock divider — decorative separator mimicking dock divider
#let dock-divider(width: 80%) = {
  std.align(center,
    block(width: width)[
      #grid(
        columns: (1fr, auto, 1fr),
        column-gutter: 8pt,
        align: horizon,
        line(length: 100%, stroke: 0.5pt + palette.border),
        box(width: 2pt, height: 16pt, fill: palette.border, radius: 1pt),
        line(length: 100%, stroke: 0.5pt + palette.border),
      )
    ]
  )
}


// === 3. Theme Entry Point ===

#let aqua-desktop-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.body-text)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 2em, bottom: 2em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.active-blue,
      neutral-lightest: palette.card,
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
