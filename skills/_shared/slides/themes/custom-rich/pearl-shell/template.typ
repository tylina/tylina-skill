// Pearl Shell Theme — Mother-of-pearl iridescence on pearl white
// Soft opalescent colors: lavender, rose, and aqua on luminous white
// Shell spiral SVGs, iridescent wave curves, pearl cluster dots, organic contours
// Elegant modern business: beauty, wellness, fashion, creative agencies, luxury hospitality
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  bg: rgb("#FDFCFE"),             // Pearl white with faint lavender
  primary: rgb("#6B5B8A"),         // Soft violet/amethyst
  secondary: rgb("#B07A8A"),       // Pearl rose
  tertiary: rgb("#5A8B8B"),        // Opal aqua/teal
  text-dark: rgb("#2D2640"),       // Deep violet-charcoal
  text-body: rgb("#4A4260"),       // Soft dark purple
  card-bg: rgb("#FFFFFF"),         // Card white
  border: rgb("#E0D8EC"),          // Lavender border
  nacre: rgb("#F5F0F8"),           // Mother-of-pearl fill
  primary-light: rgb("#6B5B8A").transparentize(85%),
  secondary-light: rgb("#B07A8A").transparentize(85%),
  tertiary-light: rgb("#5A8B8B").transparentize(85%),
  text-muted: rgb("#4A4260").transparentize(40%),
)


// === SVG Definitions ===

// Shell spiral / nautilus pattern — golden ratio spiral with chamber lines
#let _shell-spiral-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" viewBox="0 0 140 140">
  <!-- Outer nautilus spiral -->
  <path d="M 70 70 C 70 45, 90 30, 105 40 C 120 50, 125 70, 115 85 C 105 100, 85 105, 70 100 C 55 95, 48 80, 52 68 C 56 56, 65 50, 73 52 C 81 54, 86 62, 84 70 C 82 78, 76 82, 70 80 C 64 78, 62 73, 64 70" fill="none" stroke="currentColor" stroke-width="1.8" opacity="0.6" stroke-linecap="round"/>
  <!-- Chamber dividing lines -->
  <path d="M 70 70 L 105 40" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M 70 70 L 115 85" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.22"/>
  <path d="M 70 70 L 70 100" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.20"/>
  <path d="M 70 70 L 52 68" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.18"/>
  <path d="M 70 70 L 73 52" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.15"/>
  <!-- Growth rings -->
  <path d="M 95 35 C 110 42, 118 58, 118 72" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.15"/>
  <path d="M 120 75 C 118 90, 105 100, 88 102" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.13"/>
  <!-- Pearl dots at chamber intersections -->
  <circle cx="105" cy="40" r="2" fill="currentColor" opacity="0.3"/>
  <circle cx="115" cy="85" r="1.8" fill="currentColor" opacity="0.25"/>
  <circle cx="70" cy="100" r="1.5" fill="currentColor" opacity="0.2"/>
  <circle cx="52" cy="68" r="1.2" fill="currentColor" opacity="0.18"/>
</svg>```.text

// Iridescent wave curves — full-page flowing nacre pattern
#let _nacre-wave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Primary iridescent curves flowing across -->
  <path d="M 0 380 C 80 365, 160 370, 240 385 C 320 400, 400 410, 480 395 C 560 380, 640 370, 720 380 C 780 388, 820 392, 840 390" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.10"/>
  <path d="M 0 395 C 90 378, 180 382, 270 398 C 360 414, 440 420, 520 408 C 600 396, 680 386, 760 394 C 800 398, 830 402, 840 400" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.08"/>
  <path d="M 0 410 C 100 395, 200 398, 300 412 C 400 426, 480 430, 560 420 C 640 410, 720 402, 800 408 C 825 410, 838 412, 840 412" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.06"/>
  <!-- Upper shimmer lines -->
  <path d="M 0 45 C 120 35, 240 40, 360 50 C 480 60, 600 55, 720 42 C 780 38, 820 40, 840 42" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.06"/>
  <path d="M 0 58 C 140 48, 280 52, 420 62 C 560 72, 680 65, 800 54 C 825 52, 838 53, 840 54" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.04"/>
  <!-- Mid-page nacre layers -->
  <path d="M -20 220 C 100 210, 220 215, 340 225 C 460 235, 580 230, 700 218 C 770 212, 840 215, 860 218" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.04"/>
  <path d="M -20 240 C 120 230, 240 234, 380 244 C 520 254, 640 248, 760 238 C 810 234, 840 236, 860 237" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.03"/>
  <!-- Pearl dots scattered -->
  <circle cx="120" cy="380" r="1.5" fill="currentColor" opacity="0.06"/>
  <circle cx="350" cy="400" r="2" fill="currentColor" opacity="0.05"/>
  <circle cx="580" cy="388" r="1.2" fill="currentColor" opacity="0.05"/>
  <circle cx="750" cy="382" r="1.8" fill="currentColor" opacity="0.04"/>
  <circle cx="680" cy="42" r="1" fill="currentColor" opacity="0.05"/>
  <circle cx="200" cy="48" r="1.3" fill="currentColor" opacity="0.04"/>
</svg>```.text

// Pearl cluster dots — groupings of pearl-like circles
#let _pearl-cluster-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80">
  <!-- Central pearl -->
  <circle cx="40" cy="40" r="8" fill="currentColor" opacity="0.25"/>
  <circle cx="40" cy="40" r="8" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <!-- Surrounding pearls -->
  <circle cx="28" cy="28" r="5" fill="currentColor" opacity="0.18"/>
  <circle cx="28" cy="28" r="5" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.3"/>
  <circle cx="54" cy="30" r="6" fill="currentColor" opacity="0.20"/>
  <circle cx="54" cy="30" r="6" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.32"/>
  <circle cx="52" cy="54" r="4.5" fill="currentColor" opacity="0.16"/>
  <circle cx="52" cy="54" r="4.5" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.28"/>
  <circle cx="30" cy="56" r="5.5" fill="currentColor" opacity="0.17"/>
  <circle cx="30" cy="56" r="5.5" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.29"/>
  <!-- Tiny accent pearls -->
  <circle cx="18" cy="42" r="2.5" fill="currentColor" opacity="0.12"/>
  <circle cx="62" cy="42" r="2" fill="currentColor" opacity="0.10"/>
  <circle cx="40" cy="18" r="2.5" fill="currentColor" opacity="0.11"/>
  <circle cx="40" cy="62" r="3" fill="currentColor" opacity="0.13"/>
  <!-- Luster highlights -->
  <circle cx="37" cy="37" r="2" fill="currentColor" opacity="0.08"/>
  <circle cx="52" cy="27" r="1.5" fill="currentColor" opacity="0.07"/>
</svg>```.text

// Organic shell contour shapes — flowing shell edge forms for backgrounds
#let _shell-contour-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Large organic shell edge form (bottom-left) -->
  <path d="M 0 474 C 20 460, 40 440, 50 420 C 60 400, 55 380, 45 365 C 35 350, 30 340, 35 325 C 40 310, 50 300, 65 295 C 80 290, 90 295, 95 310" fill="none" stroke="currentColor" stroke-width="1.0" opacity="0.08"/>
  <path d="M 0 474 C 30 455, 55 435, 68 412 C 81 389, 75 370, 62 358 C 49 346, 45 335, 52 320" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.05"/>
  <!-- Shell lip curve (top-right) -->
  <path d="M 840 0 C 820 15, 800 30, 790 50 C 780 70, 785 85, 795 95 C 805 105, 810 115, 805 130 C 800 145, 790 152, 775 150" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.07"/>
  <path d="M 840 0 C 815 20, 792 42, 780 65 C 768 88, 774 100, 786 108" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.04"/>
  <!-- Nacre layer striations -->
  <path d="M 0 450 C 60 445, 120 448, 180 452 C 240 456, 300 455, 360 450 C 420 445, 480 447, 540 452 C 600 457, 660 455, 720 450 C 780 445, 820 447, 840 450" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
  <path d="M 0 460 C 70 456, 140 458, 210 462 C 280 466, 350 464, 420 460 C 490 456, 560 458, 630 462 C 700 466, 770 464, 840 460" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.04"/>
  <!-- Scattered iridescent specks -->
  <circle cx="700" cy="60" r="1.5" fill="currentColor" opacity="0.05"/>
  <circle cx="730" cy="80" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="760" cy="45" r="1.2" fill="currentColor" opacity="0.04"/>
  <circle cx="80" cy="420" r="1.5" fill="currentColor" opacity="0.05"/>
  <circle cx="110" cy="400" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="50" cy="390" r="1.8" fill="currentColor" opacity="0.03"/>
</svg>```.text

// Shell frame border SVG — decorative border for title/ending (bookending)
#let _shell-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Outer frame rectangle with soft corners -->
  <rect x="28" y="20" width="784" height="434" fill="none" stroke="currentColor" stroke-width="1.8" opacity="0.35" rx="4"/>
  <rect x="34" y="26" width="772" height="422" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.18" rx="3"/>
  <!-- Corner pearl clusters (top-left) -->
  <circle cx="38" cy="30" r="4" fill="currentColor" opacity="0.2"/>
  <circle cx="48" cy="24" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="32" cy="40" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="44" cy="36" r="1.5" fill="currentColor" opacity="0.10"/>
  <!-- Corner pearl clusters (top-right) -->
  <circle cx="802" cy="30" r="4" fill="currentColor" opacity="0.2"/>
  <circle cx="792" cy="24" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="808" cy="40" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="796" cy="36" r="1.5" fill="currentColor" opacity="0.10"/>
  <!-- Corner pearl clusters (bottom-left) -->
  <circle cx="38" cy="444" r="4" fill="currentColor" opacity="0.2"/>
  <circle cx="48" cy="450" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="32" cy="434" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="44" cy="440" r="1.5" fill="currentColor" opacity="0.10"/>
  <!-- Corner pearl clusters (bottom-right) -->
  <circle cx="802" cy="444" r="4" fill="currentColor" opacity="0.2"/>
  <circle cx="792" cy="450" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="808" cy="434" r="2.5" fill="currentColor" opacity="0.15"/>
  <circle cx="796" cy="440" r="1.5" fill="currentColor" opacity="0.10"/>
</svg>```.text

// Nacre shimmer line — decorative divider with iridescent wave
#let _nacre-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="12" viewBox="0 0 200 12">
  <path d="M 0 6 C 15 3, 30 4, 45 6 C 60 8, 75 9, 90 6 C 105 3, 120 4, 135 6 C 150 8, 165 9, 180 6 C 190 4, 195 5, 200 6" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" opacity="0.6"/>
  <path d="M 0 8 C 18 5, 36 6, 54 8 C 72 10, 90 10, 108 8 C 126 6, 144 6, 162 8 C 180 10, 192 9, 200 8" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.3"/>
  <circle cx="45" cy="6" r="1.2" fill="currentColor" opacity="0.4"/>
  <circle cx="135" cy="6" r="1.2" fill="currentColor" opacity="0.4"/>
  <circle cx="90" cy="6" r="1.5" fill="currentColor" opacity="0.5"/>
</svg>```.text

// Small pearl dot for inline use
#let _pearl-dot-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
  <circle cx="8" cy="8" r="5" fill="currentColor" opacity="0.3"/>
  <circle cx="8" cy="8" r="5" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.5"/>
  <circle cx="6.5" cy="6.5" r="1.5" fill="currentColor" opacity="0.15"/>
</svg>```.text

// Radial glow effect — concentric soft circles
#let _radial-glow-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="48" fill="currentColor" opacity="0.03"/>
  <circle cx="50" cy="50" r="38" fill="currentColor" opacity="0.04"/>
  <circle cx="50" cy="50" r="28" fill="currentColor" opacity="0.05"/>
  <circle cx="50" cy="50" r="18" fill="currentColor" opacity="0.06"/>
  <circle cx="50" cy="50" r="10" fill="currentColor" opacity="0.07"/>
  <circle cx="50" cy="50" r="4" fill="currentColor" opacity="0.10"/>
  <circle cx="45" cy="45" r="2" fill="currentColor" opacity="0.06"/>
  <circle cx="55" cy="48" r="1.5" fill="currentColor" opacity="0.05"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render nacre wave background atmosphere
#let _nacre-wave-bg(color: palette.primary) = {
  let svg = _nacre-wave-svg.replace("currentColor", color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%))
}

/// Render shell contour background
#let _shell-contour-bg(color: palette.primary) = {
  let svg = _shell-contour-svg.replace("currentColor", color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%))
}

/// Persistent background atmosphere for content slides
#let _bg-atmosphere = {
  let svg1 = _nacre-wave-svg.replace("currentColor", palette.primary.to-hex())
  place(top + left, image(bytes(svg1), width: 100%, height: 100%))
  let svg2 = _shell-contour-svg.replace("currentColor", palette.secondary.transparentize(30%).to-hex())
  place(top + left, image(bytes(svg2), width: 100%, height: 100%))
}

/// Render shell frame (for bookend slides)
#let _shell-frame(color: palette.primary) = {
  let svg = _shell-frame-svg.replace("currentColor", color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%))
}

/// Render pearl cluster decoration
#let _pearl-cluster(color: palette.primary, size: 60pt) = {
  let svg = _pearl-cluster-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render shell spiral decoration
#let _shell-spiral(color: palette.primary, size: 80pt) = {
  let svg = _shell-spiral-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render nacre divider
#let _nacre-divider-render(color: palette.primary, w: 160pt) = {
  let svg = _nacre-divider-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: w, height: w * 0.06))
}

/// Render radial glow
#let _radial-glow(color: palette.primary, size: 100pt) = {
  let svg = _radial-glow-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}


// === 1. Slide Functions ===

/// Standard content slide — pearl white bg, nacre atmosphere, violet header
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.7em, bottom: 0.1em))
    set std.align(top + left)
    block(width: 100%)[
      #std.align(left)[
      #stack(
        spacing: .8em,
        {
          set text(fill: palette.text-dark, size: 1em, weight: "bold")
          if self.store.title != none {
            utils.call-or-display(self, self.store.title)
          } else {
            utils.display-current-heading(level: 2)
          }
        },
        // Nacre shimmer underline
        box(width: 130pt, {
          let svg = _nacre-divider-svg.replace("currentColor", palette.primary.to-hex())
          image(bytes(svg), width: 100%, height: 8pt)
        }),
      )
      ]
    ]
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      // Pearl trio separator
      {
        set std.align(center)
        stack(dir: ltr, spacing: 3pt,
          box(circle(radius: 1.5pt, fill: palette.secondary.transparentize(30%))),
          box(circle(radius: 2.5pt, fill: palette.primary)),
          box(circle(radius: 1.5pt, fill: palette.tertiary.transparentize(30%))),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // Persistent nacre atmosphere on content slides
    _bg-atmosphere
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

/// Title slide — pearl white with shell frame border and pearl cluster corners (bookend)
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Pearl white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Nacre wave atmosphere
    _nacre-wave-bg(color: palette.primary)
    _shell-contour-bg(color: palette.secondary.transparentize(20%))
    // Shell frame border (bookend element)
    _shell-frame(color: palette.primary)
    // Pearl cluster corners (bookend element)
    place(top + left, dx: 12pt, dy: 8pt, _pearl-cluster(color: palette.primary.transparentize(20%), size: 50pt))
    place(top + right, dx: -12pt, dy: 8pt, _pearl-cluster(color: palette.secondary.transparentize(30%), size: 42pt))
    place(bottom + left, dx: 12pt, dy: -8pt, _pearl-cluster(color: palette.tertiary.transparentize(30%), size: 42pt))
    place(bottom + right, dx: -12pt, dy: -8pt, _pearl-cluster(color: palette.primary.transparentize(20%), size: 50pt))
    // Shell spiral accent (top right)
    place(top + right, dx: -60pt, dy: 40pt, _shell-spiral(color: palette.primary.transparentize(50%), size: 90pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.text-dark, info.title)
      #v(0.4em)
      // Nacre divider
      #_nacre-divider-render(color: palette.primary, w: 200pt)
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.primary, info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1.1em, fill: palette.text-body, weight: "medium", info.author)
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

/// New section slide — deep violet background with opalescent accents
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
    // Deep violet background
    place(top + left, block(width: 100%, height: 100%, fill: palette.text-dark))
    // Wave overlay in opal tones
    {
      let svg = _nacre-wave-svg.replace("currentColor", palette.tertiary.to-hex())
      place(top + left, image(bytes(svg), width: 100%, height: 100%))
    }
    // Shell spiral decoration (bottom-right)
    place(bottom + right, dx: -40pt, dy: -30pt, _shell-spiral(color: palette.primary.transparentize(40%), size: 100pt))
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in rose
      #text(size: 2.6em, fill: palette.secondary, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Section title in white
      #set text(fill: white, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.4em)
      // Nacre divider accent
      #_nacre-divider-render(color: palette.tertiary, w: 160pt)
      #v(1fr)
    ]
    // Bottom shimmer line
    place(bottom + left, dy: -16pt, dx: 40pt,
      line(length: 85%, stroke: 0.5pt + palette.primary.transparentize(40%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — opal aqua/teal background, white text, shell spiral accents
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
    // Opal teal gradient background
    place(top + left, block(width: 100%, height: 100%, fill: palette.tertiary.darken(10%)))
    // Wave overlay
    {
      let svg = _nacre-wave-svg.replace("currentColor", rgb("#FFFFFF").to-hex())
      place(top + left, image(bytes(svg), width: 100%, height: 100%))
    }
    // Shell spirals in corners
    place(top + left, dx: 30pt, dy: 20pt, _shell-spiral(color: white.transparentize(70%), size: 60pt))
    place(bottom + right, dx: -30pt, dy: -20pt, _shell-spiral(color: white.transparentize(70%), size: 60pt))
    // Inner frame
    place(center + horizon,
      rect(width: 84%, height: 76%,
        fill: none,
        stroke: 1pt + white.transparentize(50%),
        radius: 3pt))
    // Center content
    place(center + horizon,
      block(width: 70%, height: auto,
        align(center)[
          #set text(fill: white, size: 1.4em, weight: "bold")
          #body
          #v(0.6em)
          #_nacre-divider-render(color: palette.secondary, w: 140pt)
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — table of contents with pearl shell decorations
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
    // Background atmosphere
    _bg-atmosphere
    // Shell spiral in corner
    place(top + right, dx: -1.5em, dy: 0.8em,
      _shell-spiral(color: palette.primary.transparentize(60%), size: 70pt))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "bold", fill: palette.text-dark)
        title
      },
      box(width: 80pt, {
        let svg = _nacre-divider-svg.replace("currentColor", palette.primary.to-hex())
        image(bytes(svg), width: 100%, height: 6pt)
      }),
      {
        v(0.4em)
        set text(size: 1.05em, fill: palette.text-body)
        columns(2, gutter: 2em, outline(title: none, depth: 1))
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — pearl white with shell frame and pearl clusters (bookends with title)
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
    // Pearl white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Nacre wave atmosphere (same as title for bookend)
    _nacre-wave-bg(color: palette.primary)
    _shell-contour-bg(color: palette.secondary.transparentize(20%))
    // Shell frame border (bookend element — same as title)
    _shell-frame(color: palette.primary)
    // Pearl cluster corners (bookend element — same as title)
    place(top + left, dx: 12pt, dy: 8pt, _pearl-cluster(color: palette.primary.transparentize(20%), size: 50pt))
    place(top + right, dx: -12pt, dy: 8pt, _pearl-cluster(color: palette.secondary.transparentize(30%), size: 42pt))
    place(bottom + left, dx: 12pt, dy: -8pt, _pearl-cluster(color: palette.tertiary.transparentize(30%), size: 42pt))
    place(bottom + right, dx: -12pt, dy: -8pt, _pearl-cluster(color: palette.primary.transparentize(20%), size: 50pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Shell spiral above text
      #_shell-spiral(color: palette.primary, size: 80pt)
      #v(0.8em)
      // Main text
      #text(size: 2.2em, weight: "bold", fill: palette.text-dark, body)
      #v(0.5em)
      // Nacre divider
      #_nacre-divider-render(color: palette.primary, w: 180pt)
      #v(0.4em)
      // Pearl trio ornament (violet/rose/teal)
      #stack(dir: ltr, spacing: 10pt,
        box(circle(radius: 3pt, fill: palette.primary)),
        box(circle(radius: 3pt, fill: palette.secondary)),
        box(circle(radius: 3pt, fill: palette.tertiary)),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Nacre card — iridescent shimmer top border card
#let nacre-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 0.7pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      _nacre-divider-render(color: accent.transparentize(40%), w: 50pt),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Pearl box — highlighted box with pearl cluster SVG accent
#let pearl-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.transparentize(92%),
    stroke: (left: 4pt + accent, rest: 0.5pt + palette.border),
    inset: 0pt,
    radius: (right: 4pt),
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Header with pearl cluster icon
      block(width: 100%, fill: accent.transparentize(85%), inset: (x: 1em, y: 0.5em))[
        #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
          text(weight: "bold", fill: accent.darken(15%), size: 0.88em, title),
          {
            let svg = _pearl-dot-svg.replace("currentColor", accent.to-hex())
            box(image(bytes(svg), width: 12pt, height: 12pt))
          },
        )
      ],
      // Body content
      block(width: 100%, inset: (x: 1em, y: 0.6em))[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Shell divider — SVG shell spiral decorative divider
#let shell-divider(color: palette.primary, width: 80%) = {
  std.align(center,
    box(width: width)[
      #set std.align(horizon + center)
      #grid(
        columns: (1fr, auto, 1fr),
        align: horizon,
        line(length: 100%, stroke: 0.5pt + color.transparentize(50%)),
        pad(x: 8pt, {
          let svg = _shell-spiral-svg.replace("currentColor", color.to-hex())
          box(image(bytes(svg), width: 24pt, height: 24pt))
        }),
        line(length: 100%, stroke: 0.5pt + color.transparentize(50%)),
      )
    ]
  )
}

/// Pearl tag — small inline tag with pearl dot
#let pearl-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(10%), size: 0.75em, weight: "semibold")
    #stack(dir: ltr, spacing: 4pt,
      {
        let svg = _pearl-dot-svg.replace("currentColor", color.to-hex())
        box(baseline: 1.5pt, image(bytes(svg), width: 8pt, height: 8pt))
      },
      content,
    )
  ]
}

/// Luster card — metric display with shell curve decoration
#let luster-card(value, label, color: palette.primary) = {
  block(
    width: 100%,
    fill: color.transparentize(92%),
    stroke: (bottom: 3pt + color),
    inset: (x: 0.8em, y: 0.6em),
    radius: (top: 4pt),
  )[
    #stack(
      spacing: .8em,
      text(fill: color, size: 1.8em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Campaign card — strategy container with opal accent stripe
#let campaign-card(title, body, accent: palette.tertiary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.8pt + palette.border,
    inset: 0pt,
    radius: 4pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Colored accent header
      block(width: 100%, fill: accent.transparentize(82%), inset: (x: 1em, y: 0.6em))[
        #text(weight: "bold", fill: accent.darken(20%), size: 0.92em, title)
      ],
      // Body
      block(width: 100%, inset: (x: 1em, y: 0.7em))[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Insight box — callout with mother-of-pearl side accent
#let insight-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.nacre,
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Comparison table — elegant table with pearl-tone header
#let comparison-table(align: center + horizon, headers, ..rows) = {
  set text(size: 0.8em)
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary.transparentize(85%) }
      else if calc.odd(row) { palette.card-bg } else { palette.nacre },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.text-dark, size: 0.8em, h))),
    ..rows.pos().flatten(),
  )
}

/// Wave note — borderless note with nacre wave icon
#let wave-note(body) = {
  block(
    width: 100%,
    fill: none,
    inset: (x: 0.8em, y: 0.5em),
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 0.8em,
      align: (horizon, horizon),
      {
        let svg = _nacre-divider-svg.replace("currentColor", palette.tertiary.to-hex())
        box(baseline: 2pt, image(bytes(svg), width: 28pt, height: 5pt))
      },
      {
        set text(fill: palette.text-body, size: 0.82em, style: "italic")
        body
      },
    )
  ]
}

/// Spotlight card — featured content with radial glow effect
#let spotlight-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 1em),
    radius: 6pt,
  )[
    // Radial glow in background
    #place(top + right, dx: 0.5em, dy: -0.3em, _radial-glow(color: accent.transparentize(30%), size: 60pt))
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent, size: 1em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Collection grid — multi-item display with pearl dot separators
#let collection-grid(..items) = {
  let item-list = items.pos()
  let count = item-list.len()
  block(
    width: 100%,
    fill: palette.nacre,
    stroke: 0.7pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #set text(fill: palette.text-body, size: 0.82em)
    #grid(
      columns: (1fr,) * calc.min(count, 3),
      gutter: 0.8em,
      ..item-list.map(item => {
        block(width: 100%, inset: (x: 0.3em))[
          #set std.align(center)
          #stack(
            spacing: .8em,
            {
              let svg = _pearl-dot-svg.replace("currentColor", palette.primary.to-hex())
              box(image(bytes(svg), width: 10pt, height: 10pt))
            },
            item,
          )
        ]
      })
    )
  ]
}


// === 3. Theme Entry Point ===

#let pearl-shell-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text-body)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 75%,
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
      neutral-lightest: palette.bg,
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
