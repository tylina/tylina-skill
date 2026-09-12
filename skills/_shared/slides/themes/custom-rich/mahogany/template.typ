// Mahogany Theme — Rich wood-tone warmth with executive boardroom aesthetic
// Burgundy, cream, and dark wood brown. Leather-bound books, polished furniture.
// Authoritative yet warm. Brass-like divider lines, SVG wood grain texture accents.
// Light theme with warm cream backgrounds.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FDF8F0"),
  mahogany: rgb("#6B2D1A"),
  burgundy: rgb("#7C1D3E"),
  brass: rgb("#B8860B"),
  positive: rgb("#2E7D32"),
  tan: rgb("#D2B48C"),
  text-dark: rgb("#2C1810"),
  text-body: rgb("#4A3428"),
  cream-light: rgb("#FFF9F0"),
  card-bg: rgb("#FFFCF7"),
  border-warm: rgb("#D2B48C").transparentize(40%),
  brass-muted: rgb("#B8860B").transparentize(60%),
  mahogany-light: rgb("#6B2D1A").transparentize(80%),
  burgundy-light: rgb("#7C1D3E").transparentize(85%),
)


// ═══ SVG Definitions ═══

// Wood grain texture — horizontal wavy lines simulating polished mahogany grain
#let _wood-grain-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <path d="M0,40 C80,35 160,45 240,38 C320,31 400,42 480,36 C560,30 640,44 720,37 L800,40" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <path d="M0,80 C60,75 140,85 220,78 C300,71 380,88 460,80 C540,72 620,86 700,79 L800,82" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.10"/>
  <path d="M0,120 C90,116 180,126 270,118 C360,110 450,128 540,120 C630,112 720,125 800,118" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.14"/>
  <path d="M0,160 C70,155 150,167 230,158 C310,149 390,168 470,160 C550,152 630,166 710,158 L800,162" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.08"/>
  <path d="M0,200 C100,194 200,208 300,198 C400,188 500,210 600,200 C700,190 750,205 800,198" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.11"/>
  <path d="M0,240 C85,236 170,248 255,238 C340,228 425,250 510,240 C595,230 680,246 765,238 L800,240" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.09"/>
  <path d="M0,280 C75,274 155,288 235,278 C315,268 395,290 475,280 C555,270 635,286 715,278 L800,282" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.13"/>
  <path d="M0,320 C90,315 180,327 270,318 C360,309 450,330 540,320 C630,310 720,326 800,318" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.07"/>
  <path d="M0,360 C65,355 135,368 205,358 C275,348 345,370 415,360 C485,350 555,367 625,358 C695,349 760,365 800,360" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.10"/>
  <path d="M0,400 C80,394 160,408 240,398 C320,388 400,410 480,400 C560,390 640,406 720,398 L800,402" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
  <path d="M0,60 C120,54 240,68 360,58 C480,48 600,70 720,60 L800,62" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <path d="M0,140 C110,136 220,148 330,138 C440,128 550,150 660,140 L800,142" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.05"/>
</svg>
```.text

// Brass ornament divider — elegant horizontal rule with diamond centerpiece and scrollwork
#let _brass-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="20" viewBox="0 0 300 20">
  <line x1="20" y1="10" x2="120" y2="10" stroke="currentColor" stroke-width="1.2" opacity="0.7"/>
  <line x1="180" y1="10" x2="280" y2="10" stroke="currentColor" stroke-width="1.2" opacity="0.7"/>
  <polygon points="150,3 157,10 150,17 143,10" fill="currentColor" opacity="0.8"/>
  <circle cx="130" cy="10" r="2.5" fill="currentColor" opacity="0.6"/>
  <circle cx="170" cy="10" r="2.5" fill="currentColor" opacity="0.6"/>
  <circle cx="120" cy="10" r="1.5" fill="currentColor" opacity="0.4"/>
  <circle cx="180" cy="10" r="1.5" fill="currentColor" opacity="0.4"/>
  <path d="M125,10 C128,6 132,6 135,10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.5"/>
  <path d="M165,10 C168,6 172,6 175,10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.5"/>
  <path d="M125,10 C128,14 132,14 135,10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.5"/>
  <path d="M165,10 C168,14 172,14 175,10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.5"/>
  <line x1="30" y1="8" x2="30" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="50" y1="8" x2="50" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="70" y1="8" x2="70" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="90" y1="8" x2="90" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="110" y1="8" x2="110" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="190" y1="8" x2="190" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="210" y1="8" x2="210" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="230" y1="8" x2="230" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="250" y1="8" x2="250" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="270" y1="8" x2="270" y2="12" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
</svg>
```.text

// Corner bracket flourish — decorative corner element for frames
#let _corner-bracket-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 60 60">
  <path d="M5,55 L5,20 C5,12 12,5 20,5 L55,5" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.8" stroke-linecap="round"/>
  <path d="M10,55 L10,25 C10,17 17,10 25,10 L55,10" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <circle cx="5" cy="55" r="2.5" fill="currentColor" opacity="0.7"/>
  <circle cx="55" cy="5" r="2.5" fill="currentColor" opacity="0.7"/>
  <path d="M15,50 C12,48 10,45 10,42" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <path d="M42,10 C45,10 48,12 50,15" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
</svg>
```.text

// Bookplate frame — full-page ornamental border for title/ending slides
#let _bookplate-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="18" y="18" width="804" height="438" fill="none" stroke="currentColor" stroke-width="3" rx="2" opacity="0.7"/>
  <rect x="28" y="28" width="784" height="418" fill="none" stroke="currentColor" stroke-width="1" rx="1" opacity="0.4"/>
  <line x1="18" y1="40" x2="28" y2="40" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="18" y1="60" x2="28" y2="60" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="18" y1="80" x2="28" y2="80" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="812" y1="40" x2="822" y2="40" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="812" y1="60" x2="822" y2="60" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="812" y1="80" x2="822" y2="80" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="40" y1="18" x2="40" y2="28" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="60" y1="18" x2="60" y2="28" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="80" y1="18" x2="80" y2="28" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="760" y1="18" x2="760" y2="28" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="780" y1="18" x2="780" y2="28" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="800" y1="18" x2="800" y2="28" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="40" y1="446" x2="40" y2="456" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="60" y1="446" x2="60" y2="456" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="80" y1="446" x2="80" y2="456" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="760" y1="446" x2="760" y2="456" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="780" y1="446" x2="780" y2="456" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <line x1="800" y1="446" x2="800" y2="456" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <path d="M35,35 C35,32 37,30 40,30" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M805,35 C805,32 803,30 800,30" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M35,439 C35,442 37,444 40,444" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M805,439 C805,442 803,444 800,444" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
</svg>
```.text

// Small brass flourish — used inline next to section headings
#let _brass-flourish-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="12" viewBox="0 0 80 12">
  <path d="M0,6 C8,2 16,2 24,6 C32,10 40,10 48,6 C56,2 64,2 72,6 L80,6" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="0" cy="6" r="2" fill="currentColor" opacity="0.5"/>
  <circle cx="40" cy="6" r="2" fill="currentColor" opacity="0.6"/>
  <circle cx="80" cy="6" r="2" fill="currentColor" opacity="0.5"/>
</svg>
```.text


// ═══ SVG Rendering Helpers ═══

/// Render wood grain background texture
#let wood-grain-bg(color: palette.tan) = {
  let svg = _wood-grain-svg.replace("currentColor", color.to-hex())
  place(top + left, box(width: 100%, height: 100%,
    image(bytes(svg), width: 100%, height: 100%)))
}

/// Render brass divider ornament
#let brass-divider(color: palette.brass, width: 60%) = {
  let svg = _brass-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 12pt)))
}

/// Render corner bracket flourish at specified position
#let corner-bracket(color: palette.mahogany, size: 36pt, flip-h: false, flip-v: false) = {
  let svg = _corner-bracket-svg.replace("currentColor", color.to-hex())
  let img = box(image(bytes(svg), width: size, height: size))
  let sx = if flip-h { -100% } else { 100% }
  let sy = if flip-v { -100% } else { 100% }
  if flip-h or flip-v {
    scale(x: sx, y: sy, img)
  } else {
    img
  }
}

/// Render bookplate frame overlay (for title/ending slides)
#let bookplate-frame(color: palette.mahogany) = {
  let svg = _bookplate-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render brass flourish inline
#let brass-flourish(color: palette.brass, width: 60pt) = {
  let svg = _brass-flourish-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 9pt))
}


// ═══ Helper Functions ═══

/// Persistent background atmosphere — subtle wood grain + corner accents on content slides
#let _bg-atmosphere() = {
  // Faint wood grain texture across entire slide
  wood-grain-bg(color: palette.tan.transparentize(40%))
  // Small corner bracket flourishes (top-left and bottom-right)
  place(top + left, dx: 0.8em, dy: 0.3em,
    corner-bracket(color: palette.brass.transparentize(60%), size: 24pt))
  place(bottom + right, dx: -0.8em, dy: -0.3em,
    corner-bracket(color: palette.brass.transparentize(60%), size: 24pt, flip-h: true, flip-v: true))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — warm cream bg, mahogany header, brass accent line
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 0.5em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.mahogany, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Brass accent line under title
      block(width: 80pt, height: 2.5pt, fill: palette.brass, radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-body.transparentize(25%), size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Brass diamond separator
        box(
          width: 6pt, height: 6pt,
          rotate(45deg, block(width: 4pt, height: 4pt, fill: palette.brass.transparentize(40%)))
        )
      },
      {
        set std.align(right)
        context text(size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    _bg-atmosphere()
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

/// Title slide — bookplate frame, mahogany sidebar, cream main area
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Base cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Wood grain texture
    wood-grain-bg(color: palette.tan.transparentize(30%))
    // Bookplate frame
    place(top + left, box(width: 100%, height: 100%, bookplate-frame(color: palette.mahogany)))
    // Left mahogany panel
    place(top + left,
      block(width: 6pt, height: 100%, fill: palette.mahogany))
    // Content area
    set std.align(left + horizon)
    pad(left: 4em, right: 4em)[
      #stack(
        spacing: 0.8em,
        brass-flourish(color: palette.brass, width: 80pt),
        stack(
          spacing: 0.8em,
          text(size: 2.4em, weight: "bold", fill: palette.mahogany, info.title),
          if info.subtitle != none {
            text(size: 1.1em, fill: palette.text-body, info.subtitle)
          },
        ),
        brass-divider(color: palette.brass, width: 50%),
        stack(
          spacing: 0.8em,
          if info.author != none {
            text(size: 1em, weight: "semibold", fill: palette.text-dark, info.author)
          },
          if info.institution != none {
            text(size: 0.85em, fill: palette.text-body, info.institution)
          },
          if info.date != none {
            text(size: 0.85em, fill: palette.text-body.transparentize(20%), utils.display-info-date(self))
          },
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

/// New section slide — centered section title with brass ornament dividers
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
    // Subtle wood grain
    wood-grain-bg(color: palette.tan.transparentize(50%))
    // Corner brackets (all four corners)
    place(top + left, dx: 1.5em, dy: 1.5em,
      corner-bracket(color: palette.mahogany.transparentize(30%), size: 40pt))
    place(top + right, dx: -1.5em, dy: 1.5em,
      corner-bracket(color: palette.mahogany.transparentize(30%), size: 40pt, flip-h: true))
    place(bottom + left, dx: 1.5em, dy: -1.5em,
      corner-bracket(color: palette.mahogany.transparentize(30%), size: 40pt, flip-v: true))
    place(bottom + right, dx: -1.5em, dy: -1.5em,
      corner-bracket(color: palette.mahogany.transparentize(30%), size: 40pt, flip-h: true, flip-v: true))
    // Center content
    set std.align(center + horizon)
    block(width: 70%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        brass-flourish(color: palette.brass, width: 70pt),
        text(fill: palette.mahogany, size: 2em, weight: "bold",
          utils.display-current-heading(level: 1)),
        brass-divider(color: palette.brass, width: 60%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — burgundy background, cream text, brass frame
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
    // Deep burgundy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.burgundy))
    // Subtle wood grain on dark
    wood-grain-bg(color: palette.cream-light.transparentize(92%))
    // Brass frame rectangle
    place(center + horizon,
      rect(width: 88%, height: 78%,
        fill: none,
        stroke: 2pt + palette.brass.transparentize(30%),
        radius: 2pt))
    // Keep content in flow so overflow diagnostics measure the real body.
    set std.align(center + horizon)
    block(width: 74%)[
      #stack(
        spacing: 0.8em,
        {
          set text(fill: palette.cream-light, size: 1.5em, weight: "bold")
          body
        },
        brass-divider(color: palette.brass.transparentize(20%), width: 50%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — bookplate frame matching title slide, "closing the book"
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
    // Wood grain
    wood-grain-bg(color: palette.tan.transparentize(30%))
    // Bookplate frame (matches title slide — bookending)
    place(top + left, box(width: 100%, height: 100%, bookplate-frame(color: palette.mahogany)))
    // Left mahogany panel (matches title)
    place(top + left,
      block(width: 6pt, height: 100%, fill: palette.mahogany))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        brass-flourish(color: palette.brass, width: 80pt),
        text(size: 2.4em, weight: "bold", fill: palette.mahogany, body),
        brass-divider(color: palette.brass, width: 50%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — mahogany-bordered card with warm tan header bar
#let concept-card(title, body, accent: palette.mahogany) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + accent.transparentize(50%),
    radius: 4pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Header bar
      block(width: 100%, fill: accent.transparentize(85%), inset: (x: 1em, y: 0.5em))[
        #text(weight: "bold", fill: accent, size: 0.9em, title)
      ],
      // Body content
      block(width: 100%, inset: (x: 1em, y: 0.7em))[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Insight box — left-bordered highlight with burgundy accent
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.burgundy-light,
    stroke: (left: 4pt + palette.burgundy),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.burgundy, size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Stat card — large brass-colored number with label, brass dot decoration
#let stat-card(label, value, note: none) = {
  let content-gap = 0.8em
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border-warm,
    inset: (x: 1em, y: 0.7em),
    radius: 4pt,
  )[
    #set text(fill: palette.text-body.transparentize(20%), size: 0.75em)
    #stack(
      spacing: content-gap,
      label,
      [
        #stack(
          spacing: content-gap,
          text(fill: palette.brass, size: 1.8em, weight: "bold", value),
          if note != none {
            text(fill: palette.text-body.transparentize(30%), size: 0.7em, weight: "regular", note)
          },
          lazy-v(1fr),
        )
        // Brass dot decoration
        #place(top + right, dx: -8pt, dy: 6pt,
          circle(radius: 3pt, fill: palette.brass.transparentize(60%)))
      ]
    )
  ]
}

/// Executive card — premium card with top brass rule and mahogany text
#let executive-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    radius: 4pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Top brass rule
      block(width: 100%, height: 3pt, fill: palette.brass),
      // Content
      block(width: 100%, inset: (x: 1em, y: 0.8em),
        stroke: (left: 1pt + palette.border-warm, right: 1pt + palette.border-warm, bottom: 1pt + palette.border-warm))[
        #text(weight: "bold", fill: palette.mahogany, size: 0.95em, title)
        #v(4pt)
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Panel box — full-width background panel with inset content (no border, typography-only)
#let panel-box(title, body) = {
  block(width: 100%)[
    #stack(spacing: .8em,
      text(fill: palette.mahogany, size: 0.95em, weight: "bold", title),
      [
      // Brass divider SVG
      #brass-divider(color: palette.brass.transparentize(30%), width: 100%)
      #v(6pt)
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      ],
    )
  ]
}

/// Quote card — leather-bound quote with SVG quotation flourish
#let quote-card(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.mahogany.transparentize(93%),
    stroke: (left: 3pt + palette.mahogany.transparentize(40%)),
    inset: (x: 1.4em, y: 1em),
    radius: (right: 4pt),
  )[
    // Brass flourish above quote
    #place(top + left, dx: -0.3em, dy: -0.4em,
      brass-flourish(color: palette.brass.transparentize(40%), width: 40pt))
    #v(0.4em)
    #set text(fill: palette.text-dark, size: 0.88em, style: "italic")
    #quote
    #if author != none {
      v(0.4em)
      set text(fill: palette.mahogany, size: 0.8em, weight: "bold", style: "normal")
      [— #author]
    }
    #lazy-v(1fr)
  ]
}

/// KPI card — brass-accented metric display with optional trend
#let kpi-card(label, value, trend: none, trend-color: none) = {
  let t-color = if trend-color != none { trend-color } else { palette.text-body }
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.brass.transparentize(50%),
    inset: (x: 1em, y: 0.7em),
    radius: 4pt,
  )[
    #set text(fill: palette.text-body.transparentize(20%), size: 0.72em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: palette.mahogany, size: 1.6em, weight: "bold")
        #value
        #if trend != none {
          h(0.4em)
          text(fill: t-color, size: 0.55em, weight: "bold", trend)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Callout box — warm tan background with mahogany icon-like left element
#let callout-box(title, body, accent: palette.mahogany) = {
  block(
    width: 100%,
    fill: accent.transparentize(92%),
    stroke: 1pt + accent.transparentize(60%),
    inset: (x: 1.2em, y: 0.8em),
    radius: 4pt,
  )[
    // Diamond bullet before title
    #stack(dir: ltr, spacing: 6pt,
      box(
        width: 8pt, height: 8pt,
        place(center + horizon, rotate(45deg, block(width: 6pt, height: 6pt, fill: accent))),
      ),
      text(weight: "bold", fill: accent, size: 0.9em, title),
    )
    #v(4pt)
    #set text(fill: palette.text-body, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Mahogany tag — small inline pill/capsule label
#let mahogany-tag(content, color: palette.burgundy) = {
  box(
    fill: color.transparentize(85%),
    stroke: 1pt + color.transparentize(50%),
    inset: (x: 0.7em, y: 0.25em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(40%), size: 0.72em, weight: "semibold")
    #content
  ]
}


// ═══ 3. Theme Entry Point ═══

#let mahogany-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.mahogany,
      neutral-lightest: palette.cream-light,
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
