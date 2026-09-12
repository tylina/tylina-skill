// Aurora Borealis Theme — Northern lights ethereal glow
// Soft violet, teal, and emerald gradients on clean white/light backgrounds.
// Wavy aurora-band SVG decorations across slide headers. Elegant, dreamy, scientific yet beautiful.
// Best for: Science presentations, creative pitches, research talks, data storytelling
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FAFCFF"),             // Clean white/blue tint
  primary: rgb("#4A2C6E"),        // Deep violet
  secondary: rgb("#2EC4B6"),      // Aurora teal
  accent: rgb("#3DDC97"),         // Aurora green/emerald
  pink: rgb("#E8A1D0"),           // Soft pink
  focus-bg: rgb("#186F69"),       // Deep teal for accessible inverse pages
  secondary-text: rgb("#17776F"), // Text-safe teal on light surfaces (5.38:1)
  accent-text: rgb("#14734E"),    // Text-safe green on light surfaces (5.85:1)
  pink-text: rgb("#9A3D75"),      // Text-safe pink on light surfaces (6.37:1)
  text-dark: rgb("#2B2D42"),      // Dark text
  text-body: rgb("#3D4055"),      // Body text
  text-muted: rgb("#686B7E"),     // Muted text, still readable on white (5.26:1)
  card-bg: rgb("#FFFFFF"),        // Card white
  border: rgb("#E4E6F0"),         // Subtle border
  // Aurora band colors
  aurora-violet: rgb("#7B4FA2"),
  aurora-teal: rgb("#2EC4B6"),
  aurora-green: rgb("#3DDC97"),
  aurora-cyan: rgb("#45E3D0"),
)


// ═══ SVG Definitions ═══

// Aurora wave band — flowing cubic bezier curves simulating northern lights
#let _aurora-wave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="80" viewBox="0 0 800 80">
  <defs>
    <linearGradient id="auroraGrad1" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#4A2C6E;stop-opacity:0.6"/>
      <stop offset="25%" style="stop-color:#7B4FA2;stop-opacity:0.5"/>
      <stop offset="50%" style="stop-color:#2EC4B6;stop-opacity:0.45"/>
      <stop offset="75%" style="stop-color:#3DDC97;stop-opacity:0.4"/>
      <stop offset="100%" style="stop-color:#45E3D0;stop-opacity:0.3"/>
    </linearGradient>
    <linearGradient id="auroraGrad2" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#2EC4B6;stop-opacity:0.35"/>
      <stop offset="30%" style="stop-color:#3DDC97;stop-opacity:0.3"/>
      <stop offset="60%" style="stop-color:#7B4FA2;stop-opacity:0.25"/>
      <stop offset="100%" style="stop-color:#E8A1D0;stop-opacity:0.2"/>
    </linearGradient>
    <linearGradient id="auroraGrad3" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#3DDC97;stop-opacity:0.2"/>
      <stop offset="40%" style="stop-color:#45E3D0;stop-opacity:0.18"/>
      <stop offset="70%" style="stop-color:#2EC4B6;stop-opacity:0.15"/>
      <stop offset="100%" style="stop-color:#4A2C6E;stop-opacity:0.12"/>
    </linearGradient>
  </defs>
  <path d="M0,45 C80,20 160,55 240,35 C320,15 400,50 480,30 C560,10 640,45 720,25 C760,18 780,22 800,20"
    fill="none" stroke="url(#auroraGrad1)" stroke-width="3.5" stroke-linecap="round"/>
  <path d="M0,55 C100,35 180,65 280,42 C380,20 440,58 540,38 C640,18 720,52 800,35"
    fill="none" stroke="url(#auroraGrad2)" stroke-width="2.5" stroke-linecap="round"/>
  <path d="M0,65 C120,48 200,72 320,52 C440,32 520,68 640,48 C720,35 760,42 800,40"
    fill="none" stroke="url(#auroraGrad3)" stroke-width="2" stroke-linecap="round"/>
  <path d="M0,38 C60,28 140,48 220,30 C300,12 380,42 460,25 C540,8 620,38 700,22 C750,15 775,18 800,16"
    fill="none" stroke="url(#auroraGrad1)" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M0,72 C90,58 180,75 300,60 C420,45 500,72 620,55 C700,43 750,50 800,48"
    fill="none" stroke="url(#auroraGrad3)" stroke-width="1.8" opacity="0.4" stroke-linecap="round"/>
</svg>```.text

// Full-page aurora atmosphere — faint flowing bands across the entire slide
#let _aurora-atmosphere-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600" viewBox="0 0 800 600">
  <defs>
    <linearGradient id="atmoGrad1" x1="0%" y1="0%" x2="100%" y2="30%">
      <stop offset="0%" style="stop-color:#4A2C6E;stop-opacity:0.06"/>
      <stop offset="50%" style="stop-color:#2EC4B6;stop-opacity:0.04"/>
      <stop offset="100%" style="stop-color:#3DDC97;stop-opacity:0.03"/>
    </linearGradient>
    <linearGradient id="atmoGrad2" x1="100%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#E8A1D0;stop-opacity:0.04"/>
      <stop offset="50%" style="stop-color:#7B4FA2;stop-opacity:0.03"/>
      <stop offset="100%" style="stop-color:#2EC4B6;stop-opacity:0.02"/>
    </linearGradient>
  </defs>
  <!-- Flowing aurora bands across top area -->
  <path d="M0,80 C100,40 200,90 350,50 C500,10 600,70 800,30 L800,0 L0,0 Z"
    fill="url(#atmoGrad1)"/>
  <path d="M0,120 C150,70 300,130 450,80 C600,30 700,100 800,60 L800,20 L0,50 Z"
    fill="url(#atmoGrad2)"/>
  <!-- Subtle mid-page curves -->
  <path d="M0,320 C200,290 400,340 600,300 C700,280 750,295 800,285"
    fill="none" stroke="#2EC4B6" stroke-width="0.8" opacity="0.08"/>
  <path d="M0,350 C180,325 360,365 540,330 C680,305 740,320 800,310"
    fill="none" stroke="#3DDC97" stroke-width="0.6" opacity="0.06"/>
  <!-- Bottom subtle glow -->
  <ellipse cx="650" cy="550" rx="200" ry="80" fill="#2EC4B6" opacity="0.03"/>
  <ellipse cx="150" cy="520" rx="150" ry="60" fill="#7B4FA2" opacity="0.025"/>
  <!-- Corner constellation dots -->
  <circle cx="720" cy="45" r="1.5" fill="#7B4FA2" opacity="0.15"/>
  <circle cx="750" cy="30" r="1" fill="#2EC4B6" opacity="0.12"/>
  <circle cx="735" cy="55" r="0.8" fill="#3DDC97" opacity="0.1"/>
  <circle cx="60" cy="560" r="1.2" fill="#E8A1D0" opacity="0.12"/>
  <circle cx="80" cy="545" r="0.8" fill="#7B4FA2" opacity="0.1"/>
  <circle cx="45" cy="550" r="1" fill="#2EC4B6" opacity="0.08"/>
</svg>```.text

// Constellation dots — small star points forming a subtle pattern
#let _constellation-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="120" viewBox="0 0 200 120">
  <circle cx="25" cy="30" r="2" fill="#7B4FA2" opacity="0.5"/>
  <circle cx="60" cy="15" r="1.5" fill="#2EC4B6" opacity="0.45"/>
  <circle cx="95" cy="40" r="2.5" fill="#3DDC97" opacity="0.4"/>
  <circle cx="130" cy="20" r="1.8" fill="#E8A1D0" opacity="0.5"/>
  <circle cx="165" cy="35" r="2" fill="#4A2C6E" opacity="0.4"/>
  <circle cx="45" cy="70" r="1.2" fill="#2EC4B6" opacity="0.35"/>
  <circle cx="80" cy="85" r="2" fill="#7B4FA2" opacity="0.4"/>
  <circle cx="115" cy="65" r="1.5" fill="#3DDC97" opacity="0.45"/>
  <circle cx="150" cy="90" r="1.8" fill="#E8A1D0" opacity="0.35"/>
  <circle cx="180" cy="75" r="1.3" fill="#4A2C6E" opacity="0.3"/>
  <!-- Connecting lines (constellation) -->
  <line x1="25" y1="30" x2="60" y2="15" stroke="#7B4FA2" stroke-width="0.4" opacity="0.25"/>
  <line x1="60" y1="15" x2="95" y2="40" stroke="#2EC4B6" stroke-width="0.4" opacity="0.2"/>
  <line x1="95" y1="40" x2="130" y2="20" stroke="#3DDC97" stroke-width="0.4" opacity="0.2"/>
  <line x1="130" y1="20" x2="165" y2="35" stroke="#E8A1D0" stroke-width="0.4" opacity="0.2"/>
  <line x1="45" y1="70" x2="80" y2="85" stroke="#2EC4B6" stroke-width="0.4" opacity="0.2"/>
  <line x1="80" y1="85" x2="115" y2="65" stroke="#7B4FA2" stroke-width="0.4" opacity="0.2"/>
  <line x1="115" y1="65" x2="150" y2="90" stroke="#3DDC97" stroke-width="0.4" opacity="0.2"/>
</svg>```.text

// Aurora curtain — vertical flowing curtain effect for title/section slides
#let _aurora-curtain-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600" viewBox="0 0 800 600">
  <defs>
    <linearGradient id="curtainGrad1" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#4A2C6E;stop-opacity:0.7"/>
      <stop offset="30%" style="stop-color:#7B4FA2;stop-opacity:0.5"/>
      <stop offset="60%" style="stop-color:#2EC4B6;stop-opacity:0.3"/>
      <stop offset="100%" style="stop-color:#3DDC97;stop-opacity:0.1"/>
    </linearGradient>
    <linearGradient id="curtainGrad2" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#2EC4B6;stop-opacity:0.5"/>
      <stop offset="40%" style="stop-color:#3DDC97;stop-opacity:0.35"/>
      <stop offset="70%" style="stop-color:#45E3D0;stop-opacity:0.2"/>
      <stop offset="100%" style="stop-color:#E8A1D0;stop-opacity:0.08"/>
    </linearGradient>
    <linearGradient id="curtainGrad3" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#E8A1D0;stop-opacity:0.3"/>
      <stop offset="50%" style="stop-color:#7B4FA2;stop-opacity:0.2"/>
      <stop offset="100%" style="stop-color:#4A2C6E;stop-opacity:0.05"/>
    </linearGradient>
  </defs>
  <!-- Main aurora curtain bands - vertical flowing ribbons -->
  <path d="M100,0 C110,100 80,200 120,300 C160,400 90,500 130,600"
    fill="none" stroke="url(#curtainGrad1)" stroke-width="40" opacity="0.4" stroke-linecap="round"/>
  <path d="M250,0 C230,120 270,240 240,360 C210,480 260,540 235,600"
    fill="none" stroke="url(#curtainGrad2)" stroke-width="35" opacity="0.35" stroke-linecap="round"/>
  <path d="M420,0 C440,80 400,180 430,280 C460,380 410,480 440,600"
    fill="none" stroke="url(#curtainGrad1)" stroke-width="30" opacity="0.3" stroke-linecap="round"/>
  <path d="M580,0 C560,110 600,220 570,330 C540,440 590,520 565,600"
    fill="none" stroke="url(#curtainGrad2)" stroke-width="28" opacity="0.25" stroke-linecap="round"/>
  <path d="M700,0 C720,90 690,200 710,310 C730,420 695,510 715,600"
    fill="none" stroke="url(#curtainGrad3)" stroke-width="25" opacity="0.3" stroke-linecap="round"/>
  <!-- Thin shimmer lines -->
  <path d="M150,0 C140,150 170,300 145,450 C120,550 155,580 140,600"
    fill="none" stroke="#45E3D0" stroke-width="1.5" opacity="0.3"/>
  <path d="M350,0 C365,130 340,260 360,390 C380,500 350,560 365,600"
    fill="none" stroke="#E8A1D0" stroke-width="1.2" opacity="0.25"/>
  <path d="M520,0 C510,140 535,280 515,420 C495,530 525,570 510,600"
    fill="none" stroke="#7B4FA2" stroke-width="1" opacity="0.2"/>
  <!-- Star dots scattered -->
  <circle cx="50" cy="80" r="2" fill="#FFFFFF" opacity="0.6"/>
  <circle cx="180" cy="150" r="1.5" fill="#FFFFFF" opacity="0.5"/>
  <circle cx="320" cy="60" r="1.8" fill="#FFFFFF" opacity="0.4"/>
  <circle cx="480" cy="120" r="1.3" fill="#FFFFFF" opacity="0.5"/>
  <circle cx="620" cy="80" r="2" fill="#FFFFFF" opacity="0.45"/>
  <circle cx="750" cy="140" r="1.5" fill="#FFFFFF" opacity="0.4"/>
  <circle cx="90" cy="350" r="1" fill="#FFFFFF" opacity="0.3"/>
  <circle cx="660" cy="400" r="1.2" fill="#FFFFFF" opacity="0.35"/>
  <circle cx="400" cy="500" r="1.5" fill="#FFFFFF" opacity="0.3"/>
</svg>```.text

// Aurora divider — horizontal wavy separator with glow
#let _aurora-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="12" viewBox="0 0 400 12">
  <defs>
    <linearGradient id="divGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#4A2C6E;stop-opacity:0.8"/>
      <stop offset="25%" style="stop-color:#7B4FA2;stop-opacity:0.7"/>
      <stop offset="50%" style="stop-color:#2EC4B6;stop-opacity:0.8"/>
      <stop offset="75%" style="stop-color:#3DDC97;stop-opacity:0.7"/>
      <stop offset="100%" style="stop-color:#45E3D0;stop-opacity:0.5"/>
    </linearGradient>
  </defs>
  <path d="M0,6 C30,3 60,9 90,5 C120,1 150,8 180,4 C210,0 240,7 270,3 C300,0 330,8 360,4 C380,2 390,5 400,6"
    fill="none" stroke="url(#divGrad)" stroke-width="2" stroke-linecap="round"/>
  <path d="M0,6 C30,3 60,9 90,5 C120,1 150,8 180,4 C210,0 240,7 270,3 C300,0 330,8 360,4 C380,2 390,5 400,6"
    fill="none" stroke="url(#divGrad)" stroke-width="6" opacity="0.15" stroke-linecap="round"/>
</svg>```.text

// Quote aurora mark — stylized quotation mark with aurora glow
#let _quote-mark-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="50" viewBox="0 0 60 50">
  <defs>
    <linearGradient id="quoteGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#7B4FA2;stop-opacity:0.7"/>
      <stop offset="50%" style="stop-color:#2EC4B6;stop-opacity:0.6"/>
      <stop offset="100%" style="stop-color:#3DDC97;stop-opacity:0.5"/>
    </linearGradient>
  </defs>
  <path d="M8,35 C8,20 15,12 25,12 C20,18 18,22 18,28 C22,28 26,31 26,36 C26,41 22,44 18,44 C12,44 8,40 8,35 Z"
    fill="url(#quoteGrad)"/>
  <path d="M32,35 C32,20 39,12 49,12 C44,18 42,22 42,28 C46,28 50,31 50,36 C50,41 46,44 42,44 C36,44 32,40 32,35 Z"
    fill="url(#quoteGrad)"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render aurora wave band
#let aurora-wave(width: 100%, height: 18pt) = {
  box(width: width, image(bytes(_aurora-wave-svg), width: width, height: height))
}

/// Render aurora divider
#let aurora-divider(width: 100%, height: 8pt) = {
  box(width: width, image(bytes(_aurora-divider-svg), width: width, height: height))
}

/// Render constellation dots
#let constellation-dots(width: 120pt) = {
  box(image(bytes(_constellation-svg), width: width))
}

// Keep saturated aurora hues for decoration while mapping component text to
// light-surface colors that meet WCAG AA at normal text sizes.
#let _text-safe-accent(color) = {
  if color == palette.secondary or color == palette.aurora-teal or color == palette.aurora-cyan {
    palette.secondary-text
  } else if color == palette.accent or color == palette.aurora-green {
    palette.accent-text
  } else if color == palette.pink {
    palette.pink-text
  } else if color == palette.primary or color == palette.aurora-violet {
    color
  } else {
    color.darken(35%)
  }
}


// ═══ Background Atmosphere ═══

/// Persistent aurora atmosphere for content slides
#let _aurora-bg-atmosphere() = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_aurora-atmosphere-svg), width: 100%, height: 100%)))
  // Corner constellation accents
  place(top + right, dx: -0.5em, dy: 0.3em,
    constellation-dots(width: 80pt))
  place(bottom + left, dx: 0.5em, dy: -0.3em,
    constellation-dots(width: 60pt))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — light background, aurora wave header, constellation atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Aurora wave band across the top
    block(width: 100%, height: 18pt, {
      aurora-wave(width: 100%, height: 18pt)
    })
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        // Absolute chrome typography prevents relative card text sizes from
        // leaking into header metrics on dashboard-first slides.
        set text(fill: palette.text-dark, size: 28pt, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Aurora gradient underline (violet → teal → green)
      stack(dir: ltr, spacing: 2pt,
        block(width: 40pt, height: 3pt, fill: palette.primary, radius: 1.5pt),
        block(width: 30pt, height: 3pt, fill: palette.secondary, radius: 1.5pt),
        block(width: 20pt, height: 3pt, fill: palette.accent, radius: 1.5pt),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 14pt)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      {
        // Aurora dots
        stack(dir: ltr, spacing: 5pt,
          box(circle(radius: 2.5pt, fill: palette.primary)),
          box(circle(radius: 2.5pt, fill: palette.secondary)),
          box(circle(radius: 2.5pt, fill: palette.accent)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 12.5pt)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    // Persistent aurora background atmosphere
    _aurora-bg-atmosphere()
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

/// Title slide — deep violet sky with aurora curtain, stars, and centered content
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Deep violet base
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // Aurora curtain overlay
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_aurora-curtain-svg), width: 100%, height: 100%)))

    // Decorative border frame (bookend element)
    place(center + horizon,
      rect(width: 92%, height: 88%,
        stroke: 1pt + white.transparentize(75%),
        radius: 12pt, fill: none))

    // Corner star clusters (bookend element)
    place(top + left, dx: 24pt, dy: 20pt, {
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 3pt, fill: white.transparentize(30%))),
        box(circle(radius: 1.5pt, fill: palette.secondary.transparentize(20%))),
        box(circle(radius: 2pt, fill: palette.accent.transparentize(30%))),
      )
    })
    place(bottom + right, dx: -24pt, dy: -20pt, {
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 2pt, fill: palette.accent.transparentize(30%))),
        box(circle(radius: 1.5pt, fill: palette.secondary.transparentize(20%))),
        box(circle(radius: 3pt, fill: white.transparentize(30%))),
      )
    })

    // Aurora wave at bottom
    place(bottom + left, dy: -30pt,
      aurora-wave(width: 100%, height: 18pt))

    // Center content
    set std.align(center + horizon)
    pad(x: 4em, stack(
      spacing: .8em,
      text(size: 2.4em, weight: "bold", fill: white, info.title),
      if info.subtitle != none {
        text(size: 1.1em, fill: white.transparentize(20%), info.subtitle)
      },
      // Aurora glow line
      std.align(center, stack(dir: ltr, spacing: 3pt,
        block(width: 30pt, height: 3pt, fill: palette.secondary, radius: 1.5pt),
        block(width: 50pt, height: 3pt, fill: palette.accent, radius: 1.5pt),
        block(width: 30pt, height: 3pt, fill: palette.pink, radius: 1.5pt),
      )),
      stack(
        spacing: .8em,
        if info.author != none {
          text(size: 1.15em, weight: "bold", fill: white, info.author)
        },
        if info.institution != none {
          text(size: 0.9em, fill: white.transparentize(30%), info.institution)
        },
        if info.date != none {
          text(size: 0.85em, fill: palette.secondary.lighten(30%))[#utils.display-info-date(self)]
        },
      ),
    ))
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

/// New section slide — deep background with aurora wave band and section title
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
    // Deep violet base
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // Subtle curtain effect (partial)
    place(top + right,
      box(width: 50%, height: 100%,
        image(bytes(_aurora-curtain-svg), width: 100%, height: 100%)))

    // Aurora wave across middle
    place(left + horizon, dy: 30pt,
      aurora-wave(width: 100%, height: 22pt))

    // Section content
    set std.align(left + horizon)
    pad(left: 4em, right: 4em, stack(
      spacing: .8em,
      // Aurora accent dots
      stack(dir: ltr, spacing: 4pt,
        box(circle(radius: 4pt, fill: palette.secondary)),
        box(circle(radius: 3pt, fill: palette.accent)),
        box(circle(radius: 2pt, fill: palette.pink)),
      ),
      // Section title
      {
        set text(fill: white, size: 2.4em, weight: "bold")
        utils.display-current-heading(level: 1)
      },
      aurora-divider(width: 180pt, height: 8pt),
    ))

    // Bottom constellation
    place(bottom + right, dx: -2em, dy: -1.5em,
      constellation-dots(width: 100pt))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — teal background with aurora shimmer, bold centered text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.focus-bg,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle aurora streaks
    place(top + left,
      aurora-wave(width: 100%, height: 16pt))
    place(bottom + left,
      aurora-wave(width: 100%, height: 16pt))

    // Star dots
    place(top + right, dx: -40pt, dy: 30pt, {
      stack(dir: ltr, spacing: 10pt,
        box(circle(radius: 2pt, fill: white.transparentize(40%))),
        box(circle(radius: 1.5pt, fill: white.transparentize(50%))),
        box(circle(radius: 2.5pt, fill: white.transparentize(35%))),
      )
    })

    // Constrained centered content
    set text(fill: white, size: 2em, weight: "bold")
    std.align(horizon + center, block(width: 80%, body))
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light background with aurora frame (bookend with title)
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
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))

    // Aurora atmosphere
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_aurora-atmosphere-svg), width: 100%, height: 100%)))

    // Decorative border frame (bookend — matches title-slide)
    place(center + horizon,
      rect(width: 92%, height: 88%,
        stroke: 1pt + palette.primary.transparentize(60%),
        radius: 12pt, fill: none))

    // Corner star clusters (bookend — matches title-slide)
    place(top + left, dx: 24pt, dy: 20pt, {
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 3pt, fill: palette.primary.transparentize(50%))),
        box(circle(radius: 1.5pt, fill: palette.secondary.transparentize(40%))),
        box(circle(radius: 2pt, fill: palette.accent.transparentize(50%))),
      )
    })
    place(bottom + right, dx: -24pt, dy: -20pt, {
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 2pt, fill: palette.accent.transparentize(50%))),
        box(circle(radius: 1.5pt, fill: palette.secondary.transparentize(40%))),
        box(circle(radius: 3pt, fill: palette.primary.transparentize(50%))),
      )
    })

    // Aurora wave bands
    place(top + left, dy: 50pt,
      aurora-wave(width: 100%, height: 16pt))
    place(bottom + left, dy: -50pt,
      aurora-wave(width: 100%, height: 16pt))

    // Center content
    set std.align(center + horizon)
    block(width: 60%, {
      set std.align(center)
      stack(
        spacing: .8em,
        // Aurora divider top
        aurora-divider(width: 120pt, height: 8pt),
        text(size: 2.4em, weight: "bold", fill: palette.text-dark, body),
        // Aurora gradient underline
        stack(dir: ltr, spacing: 3pt,
        block(width: 25pt, height: 3pt, fill: palette.primary, radius: 1.5pt),
        block(width: 35pt, height: 3pt, fill: palette.secondary, radius: 1.5pt),
        block(width: 25pt, height: 3pt, fill: palette.accent, radius: 1.5pt),
        ),
        // Constellation dots
        constellation-dots(width: 100pt),
      )
    })
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — aurora-bordered card with gradient left accent
#let concept-card(title, body, accent: palette.primary) = {
  let title-color = _text-safe-accent(accent)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 8pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: title-color, size: 0.95em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Insight box — highlighted callout with violet aurora accent and SVG quote mark
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.primary.lighten(95%),
    stroke: (left: 4pt + palette.primary),
    inset: (left: 1.2em, right: 1em, y: 0.8em),
    radius: (right: 8pt),
  )[
    // SVG quote decoration
    #place(top + right, dx: -0.3em, dy: -0.2em,
      box(width: 24pt, image(bytes(_quote-mark-svg), width: 24pt)))
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.9em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Stat card — large metric display with aurora teal accent
#let stat-card(label, value, unit: none, accent: palette.secondary) = {
  let value-color = _text-safe-accent(accent)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (bottom: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.55em),
    radius: (top: 8pt),
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(fill: value-color, size: 1.55em, weight: "bold", value),
      text(fill: palette.text-dark, size: 0.68em, weight: "semibold", label),
      if unit != none {
        text(fill: palette.text-muted, size: 0.6em, weight: "regular", unit)
      },
      lazy-v(1fr),
    )
  ]
}

/// Quote card — blockquote with aurora SVG quotation marks
#let quote-card(quote-text, attribution: none) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1.2em, y: 1em),
    radius: 8pt,
  )[
    // SVG quote marks
    #place(top + left, dx: -0.2em, dy: -0.2em,
      box(width: 28pt, image(bytes(_quote-mark-svg), width: 28pt)))
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text-body, size: 0.88em, style: "italic")
        quote-text
      },
      if attribution != none {
        text(fill: palette.primary, size: 0.78em, style: "normal", weight: "semibold",
          [--- #attribution])
      },
      lazy-v(1fr),
    )
  ]
}

/// Feature card — numbered card with aurora color cycling
#let feature-card(number, title, description) = {
  let colors = (palette.primary, palette.secondary, palette.accent, palette.aurora-violet, palette.pink)
  let color = colors.at(calc.rem(number - 1, colors.len()))
  let badge-color = _text-safe-accent(color)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: .8em,
      // Number badge and title
      stack(
        dir: ltr,
        spacing: 0.6em,
        box(
          fill: badge-color,
          width: 1.8em,
          height: 1.8em,
          radius: 50%,
          inset: 0pt,
        )[
          #set std.align(center + horizon)
          #set text(fill: white, weight: "bold", size: 0.85em)
          #str(number)
        ],
        text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.78em)
        description
      },
      lazy-v(1fr),
    )
  ]
}

/// Highlight box — teal aurora-glow emphasis box for featured content
#let highlight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.secondary.lighten(95%),
    stroke: (top: 3pt + palette.secondary, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (bottom: 8pt),
  )[
    // Mini constellation decoration
    #place(top + right, dx: -0.5em, dy: 0.2em,
      constellation-dots(width: 40pt))
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.secondary-text, size: 0.92em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Data card — structured data display with aurora accent and divider
#let data-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 8pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.9em, title),
      // Mini aurora divider inside card
      aurora-divider(width: 100%, height: 5pt),
      {
        set text(fill: palette.text-body, size: 0.8em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Callout box — versatile alert/info box with color variants
#let callout-box(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 6pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: _text-safe-accent(accent), size: 0.9em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Roadmap card — compact year/title/list panel for timeline matrices
#let roadmap-card(year, title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: .8em,
      text(size: 0.7em, weight: "bold", fill: _text-safe-accent(accent), year),
      text(size: 0.9em, weight: "bold", fill: palette.text-dark, title),
      {
        set text(size: 0.72em, fill: palette.text-body)
        body
      },
    )
  ]
}

/// Aurora tag — small colored pill/chip element
#let aurora-tag(content, color: palette.secondary) = {
  box(
    fill: color.transparentize(85%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: _text-safe-accent(color), size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Aurora data table — table with aurora gradient header
#let aurora-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary }
      else if calc.odd(row) { palette.card-bg } else { palette.bg },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.6em, y: 0.36em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.76em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.76em, c)),
  )
}


// ═══ 3. Theme Entry Point ═══

#let aurora-borealis-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: white,
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
