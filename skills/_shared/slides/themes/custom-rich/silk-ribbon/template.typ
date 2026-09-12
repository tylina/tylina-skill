// Silk Ribbon Theme — Elegant flowing ribbon motifs with champagne and rose gold on ivory
// Luxury fashion branding inspired: flowing SVG ribbon curves, soft serif feel, premium elegance
// Features: ribbon curve headers, bow/knot accents, decorative swirl flourishes
// Perfect for luxury brand pitches, fashion presentations, beauty & wellness, premium events
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  ivory: rgb("#FFFDF5"),
  champagne: rgb("#C9A96E"),
  rose: rgb("#D4848C"),
  mauve: rgb("#9B7E8E"),
  cream: rgb("#F5EDE3"),
  text-dark: rgb("#3D2C2E"),
  text-body: rgb("#4A3B3D"),
  text-muted: rgb("#79686A"),
  card-white: rgb("#FFFFFF"),
  border: rgb("#E8DDD4"),
  rose-light: rgb("#D4848C").lighten(70%),
  champagne-light: rgb("#C9A96E").lighten(70%),
  champagne-text: rgb("#836E48"),
  mauve-text: rgb("#846B79"),
)


// === SVG Definitions ===

// Flowing ribbon curve — wide elegant S-curve with multiple layers for depth
#let _ribbon-curve-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="60" viewBox="0 0 800 60">
  <path d="M0,30 C50,10 100,5 150,15 C200,25 250,45 300,50 C350,55 400,48 450,35 C500,22 550,10 600,15 C650,20 700,35 750,40 C775,42 790,38 800,35" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" opacity="0.7"/>
  <path d="M0,35 C60,15 120,8 180,18 C240,28 300,48 360,52 C420,56 460,45 520,32 C580,19 620,12 680,18 C740,24 770,38 800,40" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.4"/>
  <path d="M0,25 C40,12 90,8 140,12 C190,16 240,38 290,44 C340,50 390,46 440,38 C490,30 540,18 590,14 C640,10 690,22 740,30 C770,35 785,33 800,30" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" opacity="0.25"/>
  <circle cx="150" cy="15" r="2" fill="currentColor" opacity="0.5"/>
  <circle cx="450" cy="35" r="2.5" fill="currentColor" opacity="0.4"/>
  <circle cx="750" cy="40" r="2" fill="currentColor" opacity="0.5"/>
  <ellipse cx="300" cy="50" rx="3" ry="1.5" fill="currentColor" opacity="0.3"/>
  <ellipse cx="600" cy="15" rx="3" ry="1.5" fill="currentColor" opacity="0.3"/>
  <path d="M200,30 C210,28 215,32 220,30" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <path d="M500,28 C510,26 515,30 520,28" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
</svg>```.text

// Bow/knot accent — decorative ribbon bow with loops and tails
#let _bow-knot-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="40" viewBox="0 0 60 40">
  <path d="M30,20 C25,12 15,8 10,12 C5,16 8,22 14,22 C20,22 26,18 30,20" fill="currentColor" opacity="0.25" stroke="currentColor" stroke-width="1" stroke-opacity="0.7"/>
  <path d="M30,20 C35,12 45,8 50,12 C55,16 52,22 46,22 C40,22 34,18 30,20" fill="currentColor" opacity="0.25" stroke="currentColor" stroke-width="1" stroke-opacity="0.7"/>
  <ellipse cx="30" cy="20" rx="4" ry="3" fill="currentColor" opacity="0.6"/>
  <path d="M26,22 C24,28 22,34 20,38" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M34,22 C36,28 38,34 40,38" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.6"/>
  <circle cx="30" cy="20" r="1.5" fill="currentColor" opacity="0.8"/>
  <path d="M12,14 C10,13 9,15 11,16" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.4"/>
  <path d="M48,14 C50,13 51,15 49,16" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.4"/>
</svg>```.text

// Decorative swirl flourish — elegant calligraphic swirl ornament
#let _swirl-flourish-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="40" viewBox="0 0 120 40">
  <path d="M10,20 C15,10 25,8 35,12 C45,16 40,24 32,24 C24,24 22,18 28,16 C34,14 38,18 36,22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.7"/>
  <path d="M60,20 C60,14 65,10 72,12 C79,14 78,20 74,22 C70,24 66,22 66,18 C66,14 70,12 74,14" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.7"/>
  <path d="M85,20 C90,10 100,8 110,12 C115,14 112,20 106,20 C100,20 98,16 102,14 C106,12 110,16 108,20" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.7"/>
  <circle cx="10" cy="20" r="1.5" fill="currentColor" opacity="0.6"/>
  <circle cx="60" cy="20" r="1.5" fill="currentColor" opacity="0.6"/>
  <circle cx="85" cy="20" r="1.5" fill="currentColor" opacity="0.6"/>
  <path d="M42,18 C46,16 50,17 54,19" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.4"/>
  <path d="M76,18 C78,17 80,17 82,18" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.4"/>
  <circle cx="48" cy="17" r="1" fill="currentColor" opacity="0.3"/>
  <circle cx="79" cy="17" r="1" fill="currentColor" opacity="0.3"/>
</svg>```.text

// Full-page ribbon texture — flowing ribbons creating a delicate background pattern
#let _ribbon-texture-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="300" viewBox="0 0 400 300">
  <path d="M-10,50 C40,20 80,30 120,60 C160,90 200,80 240,50 C280,20 320,40 360,70 C380,85 400,75 410,65" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <path d="M-10,100 C30,70 70,80 110,110 C150,140 190,130 230,100 C270,70 310,85 350,115 C375,130 400,120 410,110" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.10"/>
  <path d="M-10,150 C50,120 90,130 130,160 C170,190 210,175 250,145 C290,115 330,135 370,165 C385,175 400,165 410,155" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.08"/>
  <path d="M-10,200 C40,170 80,180 120,210 C160,240 200,225 240,195 C280,165 320,185 360,215 C380,228 400,218 410,208" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.10"/>
  <path d="M-10,250 C30,220 70,235 110,260 C150,285 190,270 230,240 C270,210 310,230 350,260 C375,275 400,265 410,255" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.08"/>
  <circle cx="120" cy="60" r="2" fill="currentColor" opacity="0.08"/>
  <circle cx="240" cy="50" r="1.5" fill="currentColor" opacity="0.06"/>
  <circle cx="110" cy="110" r="2" fill="currentColor" opacity="0.07"/>
  <circle cx="350" cy="115" r="1.5" fill="currentColor" opacity="0.06"/>
  <circle cx="250" cy="145" r="2" fill="currentColor" opacity="0.05"/>
  <circle cx="360" cy="215" r="1.5" fill="currentColor" opacity="0.06"/>
  <ellipse cx="180" cy="80" rx="4" ry="2" fill="currentColor" opacity="0.05"/>
  <ellipse cx="300" cy="180" rx="4" ry="2" fill="currentColor" opacity="0.04"/>
</svg>```.text

// Ribbon frame border — elegant border for title/ending slides with ribbon curves at corners
#let _ribbon-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="300" viewBox="0 0 400 300">
  <rect x="15" y="15" width="370" height="270" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4" rx="2"/>
  <rect x="10" y="10" width="380" height="280" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.2" rx="3"/>
  <path d="M10,10 C20,5 30,8 35,15 C38,20 35,28 30,30 C25,32 20,28 20,24 C20,20 24,18 28,20" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M390,10 C380,5 370,8 365,15 C362,20 365,28 370,30 C375,32 380,28 380,24 C380,20 376,18 372,20" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M10,290 C20,295 30,292 35,285 C38,280 35,272 30,270 C25,268 20,272 20,276 C20,280 24,282 28,280" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M390,290 C380,295 370,292 365,285 C362,280 365,272 370,270 C375,268 380,272 380,276 C380,280 376,282 372,280" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M50,10 C55,7 60,9 65,10" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M335,10 C340,7 345,9 350,10" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M50,290 C55,293 60,291 65,290" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M335,290 C340,293 345,291 350,290" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <circle cx="10" cy="10" r="2" fill="currentColor" opacity="0.5"/>
  <circle cx="390" cy="10" r="2" fill="currentColor" opacity="0.5"/>
  <circle cx="10" cy="290" r="2" fill="currentColor" opacity="0.5"/>
  <circle cx="390" cy="290" r="2" fill="currentColor" opacity="0.5"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render ribbon curve decoration
#let ribbon-curve(color: palette.champagne, width: 100%) = {
  let svg = _ribbon-curve-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 20pt))
}

/// Render bow/knot accent
#let bow-knot(color: palette.rose, size: 28pt) = {
  let svg = _bow-knot-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size))
}

/// Render swirl flourish
#let swirl-flourish(color: palette.champagne, width: 80pt) = {
  let svg = _swirl-flourish-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: width, height: 24pt))
}

/// Render ribbon texture background
#let ribbon-texture-bg(color: palette.champagne) = {
  let svg = _ribbon-texture-svg.replace("currentColor", color.to-hex())
  place(top + left, box(width: 100%, height: 100%, image(bytes(svg), width: 100%, height: 100%)))
}

/// Render ribbon frame (for title/ending)
#let ribbon-frame(color: palette.champagne) = {
  let svg = _ribbon-frame-svg.replace("currentColor", color.to-hex())
  place(center + horizon, box(width: 92%, height: 88%, image(bytes(svg), width: 100%, height: 100%)))
}


// === Background Atmosphere ===

/// Persistent atmosphere for content slides — subtle ribbon texture + corner swirls
#let _content-atmosphere() = {
  ribbon-texture-bg(color: palette.champagne)
  // Top-right swirl ornament
  place(top + right, dx: -1.2em, dy: 0.5em,
    swirl-flourish(color: palette.champagne.transparentize(60%), width: 60pt))
  // Bottom-left small bow
  place(bottom + left, dx: 1.5em, dy: -0.8em,
    bow-knot(color: palette.rose.transparentize(70%), size: 20pt))
}


// === Helper Functions ===

/// Champagne accent line for titles
#let champagne-line(width: 60pt, color: palette.champagne) = {
  block(width: width, height: 2pt, fill: color, radius: 1pt)
}

/// Accessible foreground derived from decorative accent colors
#let _accent-text(color) = color.darken(35%)

/// Ribbon divider — SVG swirl-based decorative separator (not line())
#let ribbon-divider(color: palette.champagne, width: 50%) = {
  let svg = _swirl-flourish-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 16pt)))
}


// === 1. Slide Functions ===

/// Standard content slide with ivory background, ribbon header, and atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 1.2em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      champagne-line(width: 80pt, color: palette.champagne),
    )
  }
  let footer(self) = {
    let footer-content = if self.store.footer != none {
      utils.call-or-display(self, self.store.footer)
    } else {
      []
    }
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      box(width: 100%, footer-content),
      // Center: bow knot ornament
      bow-knot(color: palette.champagne.transparentize(30%), size: 18pt),
      box(width: 4em, context {
        let current = utils.slide-counter.get().first()
        let total = utils.last-slide-counter.final().first()
        std.align(right, str(current) + " / " + str(total))
      }),
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

/// Title slide — premium ivory with ribbon frame, bow accent, flowing ribbon curve
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Ribbon frame decoration (bookend element)
    ribbon-frame(color: palette.champagne)
    // Top ribbon curve
    place(top + left, dy: 30pt,
      ribbon-curve(color: palette.champagne.transparentize(30%), width: 100%))
    // Bottom ribbon curve (mirrored)
    place(bottom + left, dy: -30pt,
      ribbon-curve(color: palette.rose.transparentize(40%), width: 100%))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Bow accent
      #bow-knot(color: palette.champagne, size: 36pt)
      #v(.8em)
      // Title
      #text(size: 2em, weight: "bold", fill: palette.text-dark, info.title)
      #v(0.3em)
      // Swirl divider
      #ribbon-divider(color: palette.champagne, width: 40%)
      #v(0.3em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 0.9em, fill: palette.mauve-text, info.subtitle)
        v(0.4em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, weight: "semibold", fill: palette.text-dark, info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.text-muted, info.institution)
        v(0.15em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.75em, fill: palette.text-muted)[#utils.display-info-date(self)]
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

/// New section slide — flowing ribbon curve, large section title, bow knot accent
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
    // Ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Full-width ribbon curve at top
    place(top + left, dy: 40pt,
      ribbon-curve(color: palette.champagne, width: 100%))
    // Subtle texture
    ribbon-texture-bg(color: palette.rose.transparentize(30%))
    // Large faint section number
    place(right + horizon, dx: -50pt, dy: -10pt, {
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "1")
        text(
          size: 10em,
          weight: "bold",
          fill: palette.champagne.transparentize(85%),
          num-str,
        )
      }
    })
    // Section content
    pad(left: 4em, right: 5em, top: 5em, bottom: 3em)[
      #v(1fr)
      // Bow accent
      #bow-knot(color: palette.rose, size: 30pt)
      #v(0.5em)
      // Small label
      #text(size: 0.75em, weight: "semibold", fill: palette.champagne-text, tracking: 2pt)[SECTION]
      #v(0.4em)
      // Section heading
      #set text(fill: palette.text-dark, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.4em)
      // Champagne accent line
      #champagne-line(width: 100pt, color: palette.champagne)
      #v(1fr)
    ]
    // Bottom swirl flourish
    place(bottom, dy: -1.5em, swirl-flourish(color: palette.champagne.transparentize(30%), width: 100pt))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — rose-tinted background with ribbon curves for key statements
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
    // Deep rose/mauve background
    place(top + left, block(width: 100%, height: 100%, fill: palette.mauve.darken(30%)))
    // Top ribbon curve
    place(top + left, dy: 20pt,
      ribbon-curve(color: palette.champagne.transparentize(40%), width: 100%))
    // Bottom ribbon curve
    place(bottom + left, dy: -20pt,
      ribbon-curve(color: palette.rose.transparentize(50%), width: 100%))
    // Center swirl decorations
    place(center + horizon, dy: -60pt,
      swirl-flourish(color: palette.champagne.transparentize(50%), width: 120pt))
    // Center content remains in normal flow so overflow diagnostics can measure it.
    set std.align(center + horizon)
    block(width: 75%)[
      #set std.align(center)
      #set text(fill: palette.ivory, size: 1.5em, weight: "bold")
      #body
      #v(.8em)
      #ribbon-divider(color: palette.champagne.transparentize(30%), width: 45%)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — ivory with ribbon frame (bookend), bow knot, closing elegance
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
    // Ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Ribbon frame (bookend with title slide)
    ribbon-frame(color: palette.champagne)
    // Top ribbon curve (bookend)
    place(top + left, dy: 30pt,
      ribbon-curve(color: palette.champagne.transparentize(30%), width: 100%))
    // Bottom ribbon curve (bookend)
    place(bottom + left, dy: -30pt,
      ribbon-curve(color: palette.rose.transparentize(40%), width: 100%))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Bow knot
      #bow-knot(color: palette.champagne, size: 40pt)
      #v(0.5em)
      // Main text
      #text(size: 2.2em, weight: "bold", fill: palette.text-dark, body)
      #v(0.4em)
      // Swirl flourish
      #swirl-flourish(color: palette.champagne, width: 100pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Concept card — champagne-bordered card with ribbon top accent for key concepts
#let concept-card(title, body, accent: palette.champagne) = {
  block(
    width: 100%,
    fill: palette.card-white,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 3pt),
  )[
    // Small bow decoration at title
    #stack(dir: ltr, spacing: 6pt,
      bow-knot(color: accent, size: 16pt),
      text(weight: "semibold", fill: _accent-text(accent), size: 0.9em)[#title],
    )
    #v(6pt)
    #set text(fill: palette.text-body, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Insight box — left-accented box with swirl flourish header for insights/takeaways
#let insight-box(title, body, accent: palette.rose) = {
  block(
    width: 100%,
    fill: palette.cream,
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.text-dark, size: 0.9em)[#title],
      [
      #swirl-flourish(color: accent.transparentize(40%), width: 60pt)
      #v(6pt)
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Stat card — large statistic with rose/champagne accent number
#let stat-card(label, value, color: palette.champagne) = {
  block(
    width: 100%,
    fill: palette.card-white,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 3pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: _accent-text(color), size: 2em, weight: "semibold")
        #value
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Ribbon card — card with flowing ribbon SVG decoration across the top
#let ribbon-card(title, body, accent: palette.champagne) = {
  block(
    width: 100%,
    fill: palette.card-white,
    stroke: 1pt + palette.border,
    inset: 0pt,
    radius: 3pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Ribbon curve header
      block(width: 100%, fill: accent.transparentize(85%), inset: (x: 0pt, y: 0pt), clip: true)[
        #ribbon-curve(color: accent, width: 100%)
      ],
      // Content below
      block(width: 100%, inset: (x: 1em, y: 0.8em))[
        #text(weight: "bold", fill: palette.text-dark, size: 0.9em)[#title]
        #v(6pt)
        #set text(fill: palette.text-body, size: 0.82em)
        #body
      ],
    )
    #lazy-v(1fr)
  ]
}

/// Feature box — borderless typography-driven box with champagne bullet dots
#let feature-box(title, body) = {
  block(
    width: 100%,
    fill: palette.ivory,
    inset: (x: 0.5em, y: 0.3em),
    radius: 0pt,
    stroke: none,
  )[
    #text(weight: "bold", fill: palette.text-dark, size: 0.9em)[#title]
    #v(8pt)
    #set text(fill: palette.text-body, size: 0.82em)
    #show list.item: it => {
      grid(
        columns: (auto, 1fr),
        column-gutter: 8pt,
        text(fill: palette.champagne, size: 1.2em)[#sym.diamond.filled],
        {
          set std.align(left + horizon)
          it.body
        },
      )
      v(4pt)
    }
    #body
    #lazy-v(1fr)
  ]
}

/// Quote card — elegant quote with SVG swirl decorations and mauve accent
#let quote-card(quote, attribution: none) = {
  block(
    width: 100%,
    fill: palette.cream,
    stroke: 1pt + palette.border,
    inset: (x: 1.2em, y: 0.75em),
    radius: 3pt,
  )[
    // Flow ornaments are overlays, so they do not inflate the quote's measured height.
    #place(top + right, dx: -0.2em, dy: -0.45em,
      swirl-flourish(color: palette.mauve, width: 44pt))
    #place(bottom + left, dx: 0.2em, dy: 0.45em,
      swirl-flourish(color: palette.mauve.transparentize(40%), width: 36pt))
    #stack(
      spacing: 0.8em,
      [
        #set text(fill: palette.text-dark, size: 0.85em, style: "italic")
        #quote
      ],
      if attribution != none {
        std.align(right, text(fill: palette.text-muted, size: 0.75em)[-- #attribution])
      },
      lazy-v(1fr),
    )
  ]
}

/// Showcase card — premium card with place()-overlay bow decoration at corner
#let showcase-card(title, body, accent: palette.rose) = {
  block(
    width: 100%,
    fill: palette.card-white,
    stroke: 1pt + accent.transparentize(40%),
    inset: (x: 1em, y: 0.8em),
    radius: 3pt,
  )[
    // Overlay bow at top-right
    #place(top + right, dx: -0.3em, dy: -0.3em,
      bow-knot(color: accent.transparentize(30%), size: 22pt))
    #stack(spacing: .8em,
      text(weight: "semibold", fill: _accent-text(accent), size: 0.9em)[#title],
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Callout box — highlighted attention box with rose/champagne fill tint
#let callout-box(title, body, accent: palette.rose) = {
  block(
    width: 100%,
    fill: accent.transparentize(88%),
    stroke: (left: 4pt + accent, rest: 1pt + accent.transparentize(60%)),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #text(weight: "semibold", fill: _accent-text(accent), size: 0.9em)[#sym.arrow.r.filled #title]
    #v(4pt)
    #set text(fill: palette.text-body, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Silk tag — small inline tag/badge with elegant pill shape
#let silk-tag(content, color: palette.champagne) = {
  box(
    fill: color.transparentize(85%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 10pt,
  )[
    #set text(fill: _accent-text(color), size: 0.75em, weight: "semibold")
    #content
  ]
}


// === 3. Theme Entry Point ===

#let silk-ribbon-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)
  show raw: set text(font: "IBM Plex Mono")
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.ivory,
      margin: (top: 4.5em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.champagne-text,
      neutral-lightest: palette.card-white,
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
