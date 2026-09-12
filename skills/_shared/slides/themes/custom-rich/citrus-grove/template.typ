// Citrus Grove Theme — Fresh, energetic citrus palette
// Orange, lemon yellow, and lime green on clean white backgrounds
// Features: citrus slice cross-sections, leaf sprigs, dotted zest spray, branch curves
// Perfect for marketing, product launches, creative presentations, food & beverage
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  white: rgb("#FFFFFE"),
  orange: rgb("#F97316"),
  lemon: rgb("#EAB308"),
  lime: rgb("#65A30D"),
  light-yellow: rgb("#FEF9C3"),
  text-dark: rgb("#1C1917"),
  text-muted: rgb("#78716C"),
  orange-light: rgb("#FFF7ED"),
  lime-light: rgb("#F7FEE7"),
  border: rgb("#E7E5E4"),
  accent-warm: rgb("#FB923C"),
  accent-cool: rgb("#84CC16"),
)


// ═══ SVG Definitions ═══

// Citrus slice cross-section — circular with radial segments (orange)
#let _citrus-slice-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <circle cx="60" cy="60" r="56" fill="none" stroke="#F97316" stroke-width="3" opacity="0.7"/>
  <circle cx="60" cy="60" r="48" fill="#FFF7ED" opacity="0.5"/>
  <circle cx="60" cy="60" r="48" fill="none" stroke="#F97316" stroke-width="1.5" opacity="0.5"/>
  <line x1="60" y1="12" x2="60" y2="108" stroke="#F97316" stroke-width="1" opacity="0.4"/>
  <line x1="12" y1="60" x2="108" y2="60" stroke="#F97316" stroke-width="1" opacity="0.4"/>
  <line x1="26" y1="26" x2="94" y2="94" stroke="#F97316" stroke-width="1" opacity="0.4"/>
  <line x1="94" y1="26" x2="26" y2="94" stroke="#F97316" stroke-width="1" opacity="0.4"/>
  <path d="M60,14 A46,46 0 0,1 106,60 L60,60 Z" fill="#F97316" opacity="0.12"/>
  <path d="M60,14 A46,46 0 0,0 14,60 L60,60 Z" fill="#F97316" opacity="0.08"/>
  <path d="M106,60 A46,46 0 0,1 60,106 L60,60 Z" fill="#F97316" opacity="0.12"/>
  <path d="M14,60 A46,46 0 0,1 60,14 L60,60 Z" fill="#F97316" opacity="0.06"/>
  <circle cx="60" cy="60" r="8" fill="#F97316" opacity="0.25"/>
  <circle cx="60" cy="60" r="4" fill="#F97316" opacity="0.4"/>
</svg>```.text

// Lemon slice cross-section — slightly different style
#let _lemon-slice-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="46" fill="none" stroke="#EAB308" stroke-width="3" opacity="0.6"/>
  <circle cx="50" cy="50" r="38" fill="#FEF9C3" opacity="0.4"/>
  <circle cx="50" cy="50" r="38" fill="none" stroke="#EAB308" stroke-width="1.2" opacity="0.4"/>
  <line x1="50" y1="12" x2="50" y2="88" stroke="#EAB308" stroke-width="0.8" opacity="0.35"/>
  <line x1="12" y1="50" x2="88" y2="50" stroke="#EAB308" stroke-width="0.8" opacity="0.35"/>
  <line x1="22" y1="22" x2="78" y2="78" stroke="#EAB308" stroke-width="0.8" opacity="0.35"/>
  <line x1="78" y1="22" x2="22" y2="78" stroke="#EAB308" stroke-width="0.8" opacity="0.35"/>
  <line x1="50" y1="12" x2="82" y2="34" stroke="#EAB308" stroke-width="0.6" opacity="0.25"/>
  <line x1="50" y1="88" x2="18" y2="66" stroke="#EAB308" stroke-width="0.6" opacity="0.25"/>
  <circle cx="50" cy="50" r="6" fill="#EAB308" opacity="0.3"/>
  <circle cx="50" cy="50" r="3" fill="#EAB308" opacity="0.5"/>
</svg>```.text

// Leaf sprig — small decorative leaf with stem
#let _leaf-sprig-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="80" viewBox="0 0 60 80">
  <path d="M30,75 C30,75 28,55 30,40 C32,25 30,10 30,10" fill="none" stroke="#65A30D" stroke-width="1.8" stroke-linecap="round" opacity="0.7"/>
  <path d="M30,35 C25,30 18,28 15,30 C12,32 14,38 18,40 C22,42 28,38 30,35" fill="#65A30D" opacity="0.5"/>
  <path d="M30,35 C35,30 42,28 45,30 C48,32 46,38 42,40 C38,42 32,38 30,35" fill="#65A30D" opacity="0.4"/>
  <path d="M30,22 C26,18 20,17 18,19 C16,21 18,26 22,27 C26,28 29,24 30,22" fill="#84CC16" opacity="0.45"/>
  <path d="M30,22 C34,18 40,17 42,19 C44,21 42,26 38,27 C34,28 31,24 30,22" fill="#84CC16" opacity="0.35"/>
  <path d="M30,50 C27,47 22,46 20,48 C18,50 20,54 23,55 C26,56 29,52 30,50" fill="#65A30D" opacity="0.35"/>
  <path d="M30,50 C33,47 38,46 40,48 C42,50 40,54 37,55 C34,56 31,52 30,50" fill="#65A30D" opacity="0.3"/>
  <line x1="30" y1="35" x2="18" y2="35" stroke="#65A30D" stroke-width="0.6" opacity="0.4"/>
  <line x1="30" y1="35" x2="42" y2="35" stroke="#65A30D" stroke-width="0.6" opacity="0.4"/>
  <line x1="30" y1="22" x2="20" y2="22" stroke="#84CC16" stroke-width="0.5" opacity="0.3"/>
  <line x1="30" y1="22" x2="40" y2="22" stroke="#84CC16" stroke-width="0.5" opacity="0.3"/>
</svg>```.text

// Dotted zest spray — scattered dots simulating zest spray from citrus peel
#let _zest-spray-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="160" height="80" viewBox="0 0 160 80">
  <circle cx="12" cy="35" r="2.5" fill="#F97316" opacity="0.6"/>
  <circle cx="28" cy="18" r="1.8" fill="#EAB308" opacity="0.5"/>
  <circle cx="42" cy="45" r="2.2" fill="#F97316" opacity="0.45"/>
  <circle cx="55" cy="12" r="1.5" fill="#84CC16" opacity="0.4"/>
  <circle cx="68" cy="55" r="2.8" fill="#EAB308" opacity="0.55"/>
  <circle cx="82" cy="25" r="2" fill="#F97316" opacity="0.5"/>
  <circle cx="95" cy="62" r="1.6" fill="#65A30D" opacity="0.4"/>
  <circle cx="108" cy="30" r="2.4" fill="#EAB308" opacity="0.5"/>
  <circle cx="120" cy="50" r="1.8" fill="#F97316" opacity="0.45"/>
  <circle cx="135" cy="20" r="2" fill="#84CC16" opacity="0.4"/>
  <circle cx="148" cy="42" r="2.6" fill="#F97316" opacity="0.5"/>
  <circle cx="20" cy="60" r="1.4" fill="#65A30D" opacity="0.35"/>
  <circle cx="75" cy="70" r="1.6" fill="#EAB308" opacity="0.3"/>
  <circle cx="140" cy="65" r="1.8" fill="#65A30D" opacity="0.35"/>
  <circle cx="50" cy="68" r="1.2" fill="#F97316" opacity="0.3"/>
  <circle cx="115" cy="10" r="1.5" fill="#84CC16" opacity="0.35"/>
</svg>```.text

// Branch curve — decorative curved branch/vine
#let _branch-curve-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="60" viewBox="0 0 200 60">
  <path d="M5,50 C30,48 50,35 80,30 C110,25 140,28 170,20 C180,18 190,15 195,12" fill="none" stroke="#65A30D" stroke-width="2" stroke-linecap="round" opacity="0.5"/>
  <path d="M40,38 C38,34 35,30 38,28 C41,26 44,29 43,33" fill="#65A30D" opacity="0.4"/>
  <path d="M90,27 C88,23 86,19 89,17 C92,15 95,19 93,23" fill="#84CC16" opacity="0.35"/>
  <path d="M140,24 C138,20 136,16 139,14 C142,12 145,16 143,20" fill="#65A30D" opacity="0.4"/>
  <circle cx="60" cy="34" r="1.5" fill="#F97316" opacity="0.5"/>
  <circle cx="110" cy="25" r="1.2" fill="#EAB308" opacity="0.4"/>
  <circle cx="160" cy="20" r="1.8" fill="#F97316" opacity="0.45"/>
  <circle cx="25" cy="46" r="1" fill="#EAB308" opacity="0.35"/>
  <circle cx="175" cy="17" r="1.3" fill="#84CC16" opacity="0.4"/>
</svg>```.text

// Full-page citrus background pattern — large decorative composition for title/ending
#let _citrus-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Large orange slice top-right -->
  <circle cx="740" cy="80" r="90" fill="none" stroke="#F97316" stroke-width="2.5" opacity="0.2"/>
  <circle cx="740" cy="80" r="75" fill="#FFF7ED" opacity="0.15"/>
  <line x1="740" y1="-10" x2="740" y2="170" stroke="#F97316" stroke-width="1" opacity="0.15"/>
  <line x1="650" y1="80" x2="830" y2="80" stroke="#F97316" stroke-width="1" opacity="0.15"/>
  <line x1="676" y1="16" x2="804" y2="144" stroke="#F97316" stroke-width="1" opacity="0.15"/>
  <line x1="804" y1="16" x2="676" y2="144" stroke="#F97316" stroke-width="1" opacity="0.15"/>
  <circle cx="740" cy="80" r="12" fill="#F97316" opacity="0.1"/>
  <!-- Lemon slice bottom-left -->
  <circle cx="100" cy="400" r="70" fill="none" stroke="#EAB308" stroke-width="2" opacity="0.18"/>
  <circle cx="100" cy="400" r="58" fill="#FEF9C3" opacity="0.12"/>
  <line x1="100" y1="330" x2="100" y2="470" stroke="#EAB308" stroke-width="0.8" opacity="0.12"/>
  <line x1="30" y1="400" x2="170" y2="400" stroke="#EAB308" stroke-width="0.8" opacity="0.12"/>
  <line x1="50" y1="350" x2="150" y2="450" stroke="#EAB308" stroke-width="0.8" opacity="0.12"/>
  <line x1="150" y1="350" x2="50" y2="450" stroke="#EAB308" stroke-width="0.8" opacity="0.12"/>
  <circle cx="100" cy="400" r="9" fill="#EAB308" opacity="0.1"/>
  <!-- Leaf cluster top-left -->
  <path d="M60,40 C55,30 45,25 40,28 C35,31 38,40 45,43 C52,46 58,42 60,40" fill="#65A30D" opacity="0.15"/>
  <path d="M60,40 C65,30 75,25 80,28 C85,31 82,40 75,43 C68,46 62,42 60,40" fill="#84CC16" opacity="0.12"/>
  <path d="M60,60 C56,52 48,49 44,52 C40,55 43,62 49,64 C55,66 58,62 60,60" fill="#65A30D" opacity="0.12"/>
  <!-- Scattered zest dots -->
  <circle cx="200" cy="50" r="3" fill="#F97316" opacity="0.15"/>
  <circle cx="350" cy="30" r="2" fill="#EAB308" opacity="0.12"/>
  <circle cx="500" cy="60" r="2.5" fill="#84CC16" opacity="0.1"/>
  <circle cx="650" cy="440" r="2" fill="#F97316" opacity="0.12"/>
  <circle cx="780" cy="350" r="3" fill="#EAB308" opacity="0.1"/>
  <circle cx="300" cy="440" r="2.5" fill="#65A30D" opacity="0.1"/>
  <circle cx="550" cy="430" r="2" fill="#F97316" opacity="0.12"/>
  <!-- Branch curve bottom-right -->
  <path d="M600,460 C640,455 680,440 720,430 C760,420 790,410 820,395" fill="none" stroke="#65A30D" stroke-width="1.5" stroke-linecap="round" opacity="0.15"/>
  <path d="M660,448 C658,443 655,438 658,436 C661,434 664,438 663,442" fill="#65A30D" opacity="0.12"/>
  <path d="M740,425 C738,420 735,415 738,413 C741,411 744,415 743,419" fill="#84CC16" opacity="0.1"/>
  <!-- Small half-slice mid-right -->
  <path d="M800,250 A35,35 0 0,1 800,320" fill="none" stroke="#F97316" stroke-width="1.5" opacity="0.12"/>
  <line x1="800" y1="255" x2="800" y2="315" stroke="#F97316" stroke-width="0.6" opacity="0.1"/>
</svg>```.text

// Content slide decorative corner — subtle citrus motif for body area
#let _corner-citrus-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
  <circle cx="85" cy="85" r="35" fill="none" stroke="#F97316" stroke-width="1.2" opacity="0.12"/>
  <circle cx="85" cy="85" r="28" fill="#FFF7ED" opacity="0.08"/>
  <line x1="85" y1="50" x2="85" y2="100" stroke="#F97316" stroke-width="0.6" opacity="0.08"/>
  <line x1="50" y1="85" x2="100" y2="85" stroke="#F97316" stroke-width="0.6" opacity="0.08"/>
  <line x1="60" y1="60" x2="100" y2="100" stroke="#F97316" stroke-width="0.5" opacity="0.07"/>
  <line x1="100" y1="60" x2="60" y2="100" stroke="#F97316" stroke-width="0.5" opacity="0.07"/>
  <circle cx="85" cy="85" r="5" fill="#F97316" opacity="0.08"/>
  <path d="M20,90 C18,85 15,82 18,80 C21,78 24,82 22,86" fill="#65A30D" opacity="0.12"/>
  <path d="M30,95 C28,91 26,88 29,86 C32,84 34,88 32,92" fill="#84CC16" opacity="0.1"/>
  <circle cx="40" cy="98" r="1.5" fill="#EAB308" opacity="0.15"/>
  <circle cx="15" cy="95" r="1" fill="#F97316" opacity="0.12"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render citrus slice
#let citrus-slice(size: 80pt) = {
  box(image(bytes(_citrus-slice-svg), width: size, height: size))
}

/// Render lemon slice
#let lemon-slice(size: 70pt) = {
  box(image(bytes(_lemon-slice-svg), width: size, height: size))
}

/// Render leaf sprig
#let leaf-sprig(height: 50pt) = {
  box(image(bytes(_leaf-sprig-svg), height: height))
}

/// Render zest spray
#let zest-spray(width: 100%) = {
  box(width: width, image(bytes(_zest-spray-svg), width: width, height: 16pt))
}

/// Render branch curve
#let branch-curve(width: 100%) = {
  box(width: width, image(bytes(_branch-curve-svg), width: width, height: 20pt))
}

/// Render full citrus background
#let citrus-bg() = {
  image(bytes(_citrus-bg-svg), width: 100%, height: 100%)
}

/// Render corner decoration for content slides
#let corner-citrus() = {
  image(bytes(_corner-citrus-svg), width: 80pt, height: 80pt)
}


// ═══ Helper Functions ═══

/// Orange-lime gradient top bar
#let citrus-bar(height: 5pt) = {
  block(width: 100%, height: height, fill: gradient.linear(palette.orange, palette.lemon, palette.lime))
}

/// Dotted zest decoration inline
#let zest-dots(count: 5) = {
  let colors = (palette.orange, palette.lemon, palette.lime, palette.orange, palette.lemon)
  stack(dir: ltr, spacing: 6pt,
    ..range(count).map(i => {
      circle(radius: 2.5pt, fill: colors.at(calc.rem(i, colors.len())).transparentize(30%))
    })
  )
}

/// Citrus color cycle helper
#let citrus-color(index) = {
  let colors = (palette.orange, palette.lemon, palette.lime)
  colors.at(calc.rem(index, 3))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide with citrus-themed header and corner decoration
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Citrus gradient bar at top
    block(width: 100%, height: 5pt, fill: gradient.linear(palette.orange, palette.lemon, palette.lime))
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.3em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Orange underline accent
      block(width: 60pt, height: 3.5pt, fill: palette.orange, radius: 2pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      zest-dots(count: 5),
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
    )
  }
  let setting(body) = {
    // Keep the content atmosphere while applying the slide alignment.
    place(bottom + right, dx: 0.5em, dy: 0.5em, corner-citrus())
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

/// Title slide — full citrus background, centered title card
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: palette.white))
    // Full citrus background SVG pattern
    place(top + left, box(width: 100%, height: 100%, citrus-bg()))
    // Decorative frame border with rounded corners
    place(center + horizon,
      rect(width: 94%, height: 90%,
        fill: none,
        stroke: (paint: palette.orange.transparentize(70%), thickness: 2pt, dash: "dotted"),
        radius: 16pt))
    // Center content card
    set std.align(center + horizon)
    block(
      width: 58%,
      fill: white.transparentize(5%),
      stroke: 1.5pt + palette.orange.transparentize(60%),
      radius: 16pt,
      inset: (x: 2em, y: 1.8em),
    )[
      #set std.align(center)
      // Title
      #text(size: 2.2em, weight: "bold", fill: palette.text-dark, info.title)
      #v(0.3em)
      // Citrus gradient underline
      #block(width: 180pt, height: 4pt, fill: gradient.linear(palette.orange, palette.lemon, palette.lime), radius: 2pt)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.text-muted, info.subtitle)
        v(0.4em)
      }
      // Zest dots separator
      #zest-dots(count: 5)
      #v(0.4em)
      // Author
      #if info.author != none {
        text(size: 1em, weight: "semibold", fill: palette.text-dark, info.author)
        v(0.15em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.text-muted, info.institution)
        v(0.15em)
      }
      // Date
      #if info.date != none {
        v(0.15em)
        text(size: 0.8em, fill: palette.orange)[#utils.display-info-date(self)]
      }
    ]
    // Bottom branch curve decoration
    place(bottom, dy: -0.8em, align(center, box(width: 50%, branch-curve(width: 100%))))
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

/// New section slide — lime-accented with large section heading
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
    // Light yellow background
    place(top + left, block(width: 100%, height: 100%, fill: palette.light-yellow))
    // Top citrus gradient bar
    place(top, block(width: 100%, height: 6pt, fill: gradient.linear(palette.orange, palette.lemon, palette.lime)))
    // Citrus slice decoration top-right
    place(top + right, dx: -2em, dy: 1.5em, citrus-slice(size: 100pt))
    // Leaf sprig left
    place(left + horizon, dx: 1.5em, dy: -2em, leaf-sprig(height: 80pt))
    // Section content centered
    pad(left: 6em, right: 6em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number
      #context {
        let num = utils.display-current-heading-number(level: 1, numbering: "01")
        text(size: 4em, fill: palette.orange.transparentize(30%), weight: "bold", num)
      }
      #v(0.3em)
      // Section title
      #set text(fill: palette.text-dark, size: 2.2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Orange underline
      #block(width: 120pt, height: 4pt, fill: gradient.linear(palette.orange, palette.lemon), radius: 2pt)
      #v(0.5em)
      // Zest spray
      #zest-spray(width: 160pt)
      #v(1fr)
    ]
    // Bottom dotted border
    place(bottom, dy: -1em, align(center, zest-dots(count: 7)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — bold orange background with white text
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
    // Warm orange gradient background
    place(top + left, block(width: 100%, height: 100%, fill: gradient.linear(palette.orange, rgb("#EA580C"), angle: 135deg)))
    // Scattered zest dots (white)
    place(top + left, dx: 3em, dy: 2em, {
      stack(dir: ltr, spacing: 12pt,
        circle(radius: 3pt, fill: white.transparentize(70%)),
        circle(radius: 2pt, fill: white.transparentize(80%)),
        circle(radius: 4pt, fill: white.transparentize(75%)),
      )
    })
    place(bottom + right, dx: -3em, dy: -2em, {
      stack(dir: ltr, spacing: 10pt,
        circle(radius: 2.5pt, fill: white.transparentize(75%)),
        circle(radius: 3.5pt, fill: white.transparentize(70%)),
        circle(radius: 2pt, fill: white.transparentize(80%)),
      )
    })
    // Lemon slice decoration (faint)
    place(top + right, dx: -4em, dy: 2em, {
      set image(width: 80pt, height: 80pt)
      let svg = _lemon-slice-svg.replace("opacity=\"0.6\"", "opacity=\"0.15\"").replace("opacity=\"0.4\"", "opacity=\"0.1\"").replace("opacity=\"0.35\"", "opacity=\"0.08\"").replace("opacity=\"0.3\"", "opacity=\"0.08\"").replace("opacity=\"0.5\"", "opacity=\"0.12\"").replace("opacity=\"0.25\"", "opacity=\"0.06\"").replace("#EAB308", "#FFFFFF")
      box(image(bytes(svg), width: 80pt, height: 80pt))
    })
    // Dotted frame
    place(center + horizon,
      rect(width: 88%, height: 80%,
        fill: none,
        stroke: (paint: white.transparentize(60%), thickness: 1.5pt, dash: "dotted"),
        radius: 12pt))
    // Centered text
    place(center + horizon,
      block(width: 72%,
        align(center)[
          #set text(fill: white, size: 1.6em, weight: "bold")
          #body
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — white with citrus background pattern, bookend with title
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
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: palette.white))
    // Full citrus background SVG (same as title for bookend effect)
    place(top + left, box(width: 100%, height: 100%, citrus-bg()))
    // Dotted frame border (same as title for bookend)
    place(center + horizon,
      rect(width: 94%, height: 90%,
        fill: none,
        stroke: (paint: palette.orange.transparentize(70%), thickness: 2pt, dash: "dotted"),
        radius: 16pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Leaf sprig above
      #leaf-sprig(height: 50pt)
      #v(0.5em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.text-dark, body)
      #v(0.4em)
      // Citrus gradient underline
      #block(width: 160pt, height: 4pt, fill: gradient.linear(palette.orange, palette.lemon, palette.lime), radius: 2pt)
      #v(0.5em)
      // Branch curve below
      #branch-curve(width: 180pt)
    ]
    // Bottom zest dots
    place(bottom, dy: -1.2em, align(center, zest-dots(count: 7)))
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — orange-bordered card for key concepts
#let concept-card(title, body, accent: palette.orange) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent, rest: 1pt + accent.lighten(70%)),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 10pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent.darken(15%), size: 0.92em, title),
      [
      #set text(fill: palette.text-dark, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Insight box — lime-accented insight/highlight with leaf SVG marker
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.lime-light,
    stroke: (left: 4pt + palette.lime),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 8pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      box(width: 16pt, height: 16pt, {
        let svg = _leaf-sprig-svg.replace("opacity=\"0.7\"", "opacity=\"0.9\"").replace("opacity=\"0.5\"", "opacity=\"0.7\"")
        image(bytes(svg), width: 16pt, height: 16pt)
      }),
      text(weight: "bold", fill: palette.lime.darken(15%), size: 0.92em, title),
    )
    #v(4pt)
    #set text(fill: palette.text-dark, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Stat card — large number with citrus color accent
#let stat-card(label, value, trend: none, accent: palette.orange) = {
  block(
    width: 100%,
    fill: white,
    stroke: (top: 3.5pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (bottom: 8pt),
  )[
    #set text(fill: palette.text-muted, size: 0.78em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: accent, size: 1.8em, weight: "bold")
        #value
        #if trend != none {
          h(0.4em)
          text(fill: palette.lime, size: 0.5em, weight: "bold", trend)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Zest card — playful card with dotted zest spray decoration at top
#let zest-card(title, body, accent: palette.lemon) = {
  block(
    width: 100%,
    fill: accent.lighten(90%),
    stroke: 1pt + accent.lighten(50%),
    inset: (x: 1em, y: 0.8em),
    radius: 10pt,
  )[
    // Zest dots at top
    #box(width: 100%, {
      let svg = _zest-spray-svg
      image(bytes(svg), width: 100%, height: 10pt)
    })
    #v(4pt)
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent.darken(20%), size: 0.92em, title),
      [
      #set text(fill: palette.text-dark, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Grove box — card styled like a grove/garden frame with branch border
#let grove-box(title, body) = {
  block(
    width: 100%,
    fill: palette.lime-light.lighten(40%),
    stroke: (paint: palette.lime, thickness: 1.5pt, dash: "dashed"),
    inset: (x: 1em, y: 0.8em),
    radius: 8pt,
  )[
    // Branch curve decoration at top
    #box(width: 100%, branch-curve(width: 100%))
    #v(2pt)
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.lime.darken(10%), size: 0.92em, title),
      [
      #set text(fill: palette.text-dark, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Quote card — citrus-themed quote with SVG quotation marks
#let quote-card(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.orange-light,
    stroke: (left: 3pt + palette.orange.transparentize(40%)),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 8pt),
  )[
    // Large orange quote mark (text-based for simplicity)
    #text(size: 2em, fill: palette.orange.transparentize(50%), weight: "bold")["]
    #v(-0.8em)
    #set text(fill: palette.text-dark, size: 0.88em, style: "italic")
    #quote
    #if author != none {
      v(0.3em)
      set text(fill: palette.orange, size: 0.8em, weight: "bold", style: "normal")
      [--- #author]
    }
    #lazy-v(1fr)
  ]
}

/// Harvest card — numbered card for steps/phases (like harvesting stages)
#let harvest-card(number, title, body, accent: auto) = {
  let color = if accent == auto { citrus-color(number - 1) } else { accent }
  block(
    width: 100%,
    fill: white,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 10pt,
  )[
    // Number badge
    #stack(dir: ltr, spacing: 8pt,
      box(
        width: 1.8em,
        height: 1.8em,
        fill: color,
        radius: 0.9em,
        inset: 0pt,
      )[
        #set align(center + horizon)
        #set text(fill: white, weight: "bold", size: 0.85em)
        #str(number)
      ],
      text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
    )
    #v(4pt)
    #set text(fill: palette.text-muted, size: 0.8em)
    #body
    #lazy-v(1fr)
  ]
}

/// Callout box — generic accented callout with icon-style marker
#let callout-box(title, body, accent: palette.orange, icon: sym.arrow.r) = {
  block(
    width: 100%,
    fill: accent.lighten(93%),
    stroke: (left: 4pt + accent),
    inset: 14pt,
    radius: (right: 8pt),
  )[
    #stack(dir: ltr, spacing: 6pt,
      text(fill: accent, size: 1em, weight: "bold", icon),
      text(weight: "bold", fill: accent.darken(10%), size: 0.92em, title),
    )
    #v(4pt)
    #set text(fill: palette.text-dark, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Data table with citrus-themed header
#let citrus-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.orange }
      else if calc.odd(row) { white } else { palette.light-yellow.lighten(50%) },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.82em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-dark, size: 0.82em, c)),
  )
}

/// Juice meter — visual progress/rating component
#let juice-meter(label, value, max: 100, color: palette.orange) = {
  let pct = calc.min(value / max * 100, 100)
  block(width: 100%, inset: (y: 2pt))[
    #set text(size: 0.78em, fill: palette.text-dark)
    #stack(dir: ltr, spacing: 0pt,
      box(width: 35%, text(weight: "semibold", label)),
      box(width: 50%,
        block(width: 100%, height: 10pt, fill: palette.border.lighten(40%), radius: 5pt)[
          #place(left, block(width: pct * 1%, height: 100%, fill: color, radius: 5pt))
        ]
      ),
      box(width: 15%, align(right, text(fill: color, weight: "bold", [#value%]))),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let citrus-grove-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.white,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.orange,
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
