// Pressed Linen Theme — Textured linen/paper aesthetic with pressed botanical leaf silhouettes
// Subtle cream background with sage green and dusty rose accents
// Inspired by Japanese washi paper and dried flower pressing
// Light, airy, sophisticated. Features: botanical SVGs, linen texture, organic forms
// Perfect for wellness, design, botanical, lifestyle, creative studio presentations
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  cream: rgb("#FDFBF7"),         // Main background — warm cream
  sage: rgb("#7B9E6B"),          // Primary accent — sage green
  rose: rgb("#C4908F"),          // Secondary accent — dusty rose
  brown: rgb("#8B6F5C"),         // Warm brown (tertiary)
  text-dark: rgb("#3D3229"),     // Main text color
  text-body: rgb("#5A4A3F"),     // Body text (softer)
  text-muted: rgb("#9B8B7D"),    // Muted captions
  card: rgb("#FFFFFF"),          // Card backgrounds
  border: rgb("#E8E0D4"),        // Soft borders
  linen: rgb("#F5F0E8"),         // Linen texture tone
)


// ═══ SVG Definitions ═══

// Pressed leaf silhouette — eucalyptus branch (full botanical detail)
#let _eucalyptus-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="280" viewBox="0 0 120 280">
  <path d="M60,10 C60,10 58,40 56,70 C54,100 55,130 56,160 C57,190 58,220 60,250 C60,260 60,270 60,280" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.6"/>
  <ellipse cx="45" cy="45" rx="14" ry="20" fill="currentColor" opacity="0.25" transform="rotate(-15 45 45)"/>
  <ellipse cx="75" cy="60" rx="13" ry="18" fill="currentColor" opacity="0.2" transform="rotate(12 75 60)"/>
  <ellipse cx="42" cy="90" rx="15" ry="21" fill="currentColor" opacity="0.22" transform="rotate(-20 42 90)"/>
  <ellipse cx="78" cy="110" rx="12" ry="17" fill="currentColor" opacity="0.18" transform="rotate(18 78 110)"/>
  <ellipse cx="44" cy="140" rx="14" ry="19" fill="currentColor" opacity="0.2" transform="rotate(-12 44 140)"/>
  <ellipse cx="76" cy="160" rx="11" ry="16" fill="currentColor" opacity="0.16" transform="rotate(15 76 160)"/>
  <ellipse cx="46" cy="190" rx="13" ry="18" fill="currentColor" opacity="0.18" transform="rotate(-18 46 190)"/>
  <ellipse cx="74" cy="210" rx="10" ry="14" fill="currentColor" opacity="0.14" transform="rotate(10 74 210)"/>
  <ellipse cx="48" cy="235" rx="11" ry="15" fill="currentColor" opacity="0.15" transform="rotate(-8 48 235)"/>
  <ellipse cx="70" cy="255" rx="9" ry="12" fill="currentColor" opacity="0.12" transform="rotate(8 70 255)"/>
  <path d="M56,45 L45,45" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <path d="M64,60 L75,60" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <path d="M55,90 L42,90" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <path d="M65,110 L78,110" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <path d="M56,140 L44,140" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.35"/>
  <path d="M64,160 L76,160" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.35"/>
</svg>```.text

// Fern frond — delicate pressed fern leaf
#let _fern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="200" viewBox="0 0 100 200">
  <path d="M50,5 C50,5 49,30 48,55 C47,80 48,110 49,140 C50,170 50,185 50,200" fill="none" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <path d="M48,25 C42,20 35,22 30,28 C35,26 40,24 48,25" fill="currentColor" opacity="0.3"/>
  <path d="M52,35 C58,30 65,32 70,38 C65,36 60,34 52,35" fill="currentColor" opacity="0.25"/>
  <path d="M47,50 C41,45 34,47 28,53 C34,51 40,49 47,50" fill="currentColor" opacity="0.28"/>
  <path d="M53,62 C59,57 66,59 72,65 C66,63 60,61 53,62" fill="currentColor" opacity="0.22"/>
  <path d="M47,78 C41,73 33,75 27,81 C33,79 40,77 47,78" fill="currentColor" opacity="0.25"/>
  <path d="M53,92 C59,87 67,89 73,95 C67,93 60,91 53,92" fill="currentColor" opacity="0.2"/>
  <path d="M47,108 C42,103 35,105 30,111 C35,109 41,107 47,108" fill="currentColor" opacity="0.22"/>
  <path d="M53,122 C58,117 64,119 69,125 C64,123 59,121 53,122" fill="currentColor" opacity="0.18"/>
  <path d="M48,138 C43,133 37,135 33,141 C37,139 43,137 48,138" fill="currentColor" opacity="0.2"/>
  <path d="M52,152 C56,147 62,149 66,155 C62,153 57,151 52,152" fill="currentColor" opacity="0.16"/>
  <path d="M49,168 C45,163 40,165 37,170 C40,168 45,167 49,168" fill="currentColor" opacity="0.15"/>
</svg>```.text

// Linen texture — subtle crosshatch grain pattern (full-page background)
#let _linen-texture-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <line x1="0" y1="30" x2="800" y2="30" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="60" x2="800" y2="60" stroke="currentColor" stroke-width="0.25" opacity="0.05"/>
  <line x1="0" y1="90" x2="800" y2="90" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="120" x2="800" y2="120" stroke="currentColor" stroke-width="0.25" opacity="0.05"/>
  <line x1="0" y1="150" x2="800" y2="150" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="180" x2="800" y2="180" stroke="currentColor" stroke-width="0.25" opacity="0.05"/>
  <line x1="0" y1="210" x2="800" y2="210" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="240" x2="800" y2="240" stroke="currentColor" stroke-width="0.25" opacity="0.05"/>
  <line x1="0" y1="270" x2="800" y2="270" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="300" x2="800" y2="300" stroke="currentColor" stroke-width="0.25" opacity="0.05"/>
  <line x1="0" y1="330" x2="800" y2="330" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="360" x2="800" y2="360" stroke="currentColor" stroke-width="0.25" opacity="0.05"/>
  <line x1="0" y1="390" x2="800" y2="390" stroke="currentColor" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="420" x2="800" y2="420" stroke="currentColor" stroke-width="0.25" opacity="0.05"/>
  <line x1="50" y1="0" x2="50" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.04"/>
  <line x1="110" y1="0" x2="110" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="170" y1="0" x2="170" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.04"/>
  <line x1="230" y1="0" x2="230" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="290" y1="0" x2="290" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.04"/>
  <line x1="350" y1="0" x2="350" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="410" y1="0" x2="410" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.04"/>
  <line x1="470" y1="0" x2="470" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="530" y1="0" x2="530" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.04"/>
  <line x1="590" y1="0" x2="590" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="650" y1="0" x2="650" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.04"/>
  <line x1="710" y1="0" x2="710" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="770" y1="0" x2="770" y2="450" stroke="currentColor" stroke-width="0.2" opacity="0.04"/>
</svg>```.text

// Pressed flower — simple dried flower silhouette with petals
#let _pressed-flower-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="80" viewBox="0 0 60 80">
  <path d="M30,40 C30,40 30,55 30,70 C30,73 30,76 30,80" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <ellipse cx="30" cy="30" rx="8" ry="12" fill="currentColor" opacity="0.2" transform="rotate(0 30 30)"/>
  <ellipse cx="30" cy="30" rx="8" ry="12" fill="currentColor" opacity="0.18" transform="rotate(60 30 30)"/>
  <ellipse cx="30" cy="30" rx="8" ry="12" fill="currentColor" opacity="0.16" transform="rotate(120 30 30)"/>
  <ellipse cx="30" cy="30" rx="8" ry="12" fill="currentColor" opacity="0.2" transform="rotate(180 30 30)"/>
  <ellipse cx="30" cy="30" rx="8" ry="12" fill="currentColor" opacity="0.18" transform="rotate(240 30 30)"/>
  <ellipse cx="30" cy="30" rx="8" ry="12" fill="currentColor" opacity="0.16" transform="rotate(300 30 30)"/>
  <circle cx="30" cy="30" r="4" fill="currentColor" opacity="0.35"/>
</svg>```.text

// Botanical border frame — delicate vine/leaf border corners
#let _botanical-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <rect x="20" y="20" width="760" height="410" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.2" rx="2"/>
  <path d="M30,30 C35,25 40,28 45,30 C42,33 38,35 35,32 C32,35 28,33 30,30" fill="currentColor" opacity="0.15"/>
  <path d="M50,25 C53,22 58,24 55,28 C52,26 50,28 50,25" fill="currentColor" opacity="0.12"/>
  <ellipse cx="65" cy="28" rx="6" ry="4" fill="currentColor" opacity="0.1" transform="rotate(-10 65 28)"/>
  <path d="M770,30 C765,25 760,28 755,30 C758,33 762,35 765,32 C768,35 772,33 770,30" fill="currentColor" opacity="0.15"/>
  <path d="M750,25 C747,22 742,24 745,28 C748,26 750,28 750,25" fill="currentColor" opacity="0.12"/>
  <ellipse cx="735" cy="28" rx="6" ry="4" fill="currentColor" opacity="0.1" transform="rotate(10 735 28)"/>
  <path d="M30,420 C35,425 40,422 45,420 C42,417 38,415 35,418 C32,415 28,417 30,420" fill="currentColor" opacity="0.15"/>
  <path d="M50,425 C53,428 58,426 55,422 C52,424 50,422 50,425" fill="currentColor" opacity="0.12"/>
  <ellipse cx="65" cy="422" rx="6" ry="4" fill="currentColor" opacity="0.1" transform="rotate(10 65 422)"/>
  <path d="M770,420 C765,425 760,422 755,420 C758,417 762,415 765,418 C768,415 772,417 770,420" fill="currentColor" opacity="0.15"/>
  <path d="M750,425 C747,428 742,426 745,422 C748,424 750,422 750,425" fill="currentColor" opacity="0.12"/>
  <ellipse cx="735" cy="422" rx="6" ry="4" fill="currentColor" opacity="0.1" transform="rotate(-10 735 422)"/>
</svg>```.text

// Organic wavy divider — gentle botanical-inspired separator
#let _botanical-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 C10,3 20,9 30,6 C40,3 50,9 60,6 C70,3 80,9 90,6 C100,3 110,9 120,6 C130,3 140,9 150,6 C160,3 170,9 180,6 C190,3 200,9 210,6 C220,3 230,9 240,6 C250,3 260,9 270,6 C280,3 290,9 300,6" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" opacity="0.5"/>
  <circle cx="50" cy="4" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="120" cy="8" r="1.2" fill="currentColor" opacity="0.25"/>
  <circle cx="200" cy="4" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="260" cy="8" r="1.2" fill="currentColor" opacity="0.25"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render eucalyptus branch
#let eucalyptus-branch(color: palette.sage, height: 200pt) = {
  let svg = _eucalyptus-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), height: height))
}

/// Render fern frond
#let fern-frond(color: palette.sage, height: 150pt) = {
  let svg = _fern-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), height: height))
}

/// Render linen texture background
#let linen-texture(color: palette.brown) = {
  let svg = _linen-texture-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render pressed flower
#let pressed-flower(color: palette.rose, size: 50pt) = {
  let svg = _pressed-flower-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size * 1.33))
}

/// Render botanical frame
#let botanical-frame(color: palette.sage) = {
  let svg = _botanical-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render botanical divider
#let botanical-divider(color: palette.sage, width: 60%) = {
  let svg = _botanical-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 8pt)))
}


// ═══ Background Atmosphere ═══

/// Persistent linen texture + small botanical motif on every content slide
#let _bg-atmosphere() = {
  // Linen texture across entire slide
  place(top + left, box(width: 100%, height: 100%, linen-texture(color: palette.brown)))
  // Small pressed flower in bottom-right corner
  place(bottom + right, dx: -1.5em, dy: -0.8em,
    pressed-flower(color: palette.rose.transparentize(40%), size: 28pt))
  // Tiny leaf accent top-left
  place(top + left, dx: 0.8em, dy: 0.5em,
    fern-frond(color: palette.sage.transparentize(70%), height: 40pt))
}


// ═══ 1. Slide Functions ═══

/// Content slide — cream bg, linen texture, sage header accent
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1.2em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Sage green accent line with rounded ends
      block(width: 50pt, height: 2pt, fill: palette.sage, radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: .7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none { utils.call-or-display(self, self.store.footer) },
      {
        // Small botanical dot
        stack(dir: ltr, spacing: 4pt,
          box(circle(radius: 1.5pt, fill: palette.sage.transparentize(40%))),
          box(circle(radius: 2pt, fill: palette.rose.transparentize(40%))),
          box(circle(radius: 1.5pt, fill: palette.sage.transparentize(40%))),
        )
      },
      {
        set std.align(right)
        context { utils.slide-counter.display() + " / " + utils.last-slide-number }
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
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — botanical frame, pressed leaf silhouettes, centered text
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Linen texture background
    place(top + left, box(width: 100%, height: 100%, linen-texture(color: palette.brown)))
    // Botanical frame border
    place(top + left, box(width: 100%, height: 100%, botanical-frame(color: palette.sage)))
    // Eucalyptus branch decoration — right side
    place(right + horizon, dx: -2em, dy: -1em,
      eucalyptus-branch(color: palette.sage.transparentize(20%), height: 240pt))
    // Fern frond — left side, lighter
    place(left + bottom, dx: 2em, dy: -3em,
      fern-frond(color: palette.sage.transparentize(40%), height: 140pt))
    // Pressed flower top-left
    place(top + left, dx: 4em, dy: 3em,
      pressed-flower(color: palette.rose.transparentize(30%), size: 40pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: 0.8em,
        text(size: 2.2em, weight: "bold", fill: palette.text-dark, info.title),
        {
          if info.subtitle != none {
            text(size: 1em, fill: palette.text-muted, info.subtitle)
          }
        },
        botanical-divider(color: palette.sage, width: 40%),
        {
          if info.author != none {
            text(size: 1.05em, weight: "medium", fill: palette.sage, info.author)
          }
        },
        {
          if info.institution != none {
            text(size: 0.82em, fill: palette.text-muted, info.institution)
          }
        },
        {
          if info.date != none {
            text(size: 0.78em, fill: palette.text-muted, utils.display-info-date(self))
          }
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.cream,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// Section slide — sage green left strip with fern motif, elegant typography
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
      fill: palette.cream,
    ),
  )
  let main-body = {
    // Linen texture
    place(top + left, box(width: 100%, height: 100%, linen-texture(color: palette.brown)))
    // Left sage strip
    place(top + left, block(width: 30%, height: 100%, fill: palette.sage.transparentize(88%)))
    // Fern decoration in left strip
    place(left + horizon, dx: 2em,
      fern-frond(color: palette.sage.transparentize(30%), height: 180pt))
    // Thin sage vertical line
    place(left, dx: 29.5%, block(width: 1.5pt, height: 100%, fill: palette.sage.transparentize(50%)))
    // Section number
    place(left + top, dx: 4em, dy: 3em,
      text(size: 3.5em, weight: "bold", fill: palette.sage.transparentize(60%),
        utils.display-current-heading-number(level: 1, numbering: "01")))
    // Section title
    set std.align(left + horizon)
    pad(left: 36%, right: 4em)[
      #stack(
        spacing: 0.8em,
        {
          set text(fill: palette.text-dark, size: 1.8em, weight: "semibold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        block(width: 50pt, height: 2pt, fill: palette.sage, radius: 1pt),
        pressed-flower(color: palette.rose.transparentize(30%), size: 30pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — clean TOC with botanical accent
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      fill: palette.cream,
      margin: (x: 4em, y: 2.5em),
    ),
  )
  let main-body = {
    // Background atmosphere
    place(top + left, box(width: 100%, height: 100%, linen-texture(color: palette.brown)))
    // Decorative fern in corner
    place(top + right, dx: -2em, dy: 1em,
      fern-frond(color: palette.sage.transparentize(50%), height: 100pt))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "semibold", fill: palette.text-dark)
        title
      },
      block(width: 50pt, height: 2pt, fill: palette.sage, radius: 1pt),
      {
        set text(size: 1.1em, fill: palette.text-body)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — sage green background, cream text, centered with botanical frame
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.sage,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle linen texture on dark bg
    place(top + left, box(width: 100%, height: 100%,
      linen-texture(color: palette.cream.transparentize(60%))))
    // Pressed flowers decorating corners
    place(top + left, dx: 1em, dy: 1em,
      pressed-flower(color: palette.cream.transparentize(50%), size: 35pt))
    place(bottom + right, dx: -1em, dy: -1em,
      pressed-flower(color: palette.cream.transparentize(50%), size: 35pt))
    // Frame border
    place(center + horizon,
      rect(width: 90%, height: 80%, stroke: 1pt + palette.cream.transparentize(50%), radius: 2pt, fill: none))
    // Main text
    set text(fill: palette.cream, size: 2em, weight: "semibold")
    set std.align(horizon + center)
    block(width: 80%, inset: (x: 1em))[
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — cream bg, botanical frame (bookend with title), centered farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.cream,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Linen texture
    place(top + left, box(width: 100%, height: 100%, linen-texture(color: palette.brown)))
    // Botanical frame (matching title slide)
    place(top + left, box(width: 100%, height: 100%, botanical-frame(color: palette.sage)))
    // Eucalyptus branch — mirrored from title
    place(left + horizon, dx: 2em, dy: 1em,
      eucalyptus-branch(color: palette.sage.transparentize(20%), height: 200pt))
    // Pressed flower — bottom right
    place(bottom + right, dx: -4em, dy: -3em,
      pressed-flower(color: palette.rose.transparentize(20%), size: 45pt))
    // Center content
    set std.align(center + horizon)
    stack(
      spacing: 0.8em,
      text(size: 2em, weight: "semibold", fill: palette.text-dark, body),
      botanical-divider(color: palette.sage, width: 30%),
      stack(dir: ltr, spacing: 8pt,
        pressed-flower(color: palette.rose.transparentize(30%), size: 20pt),
        pressed-flower(color: palette.sage.transparentize(40%), size: 16pt),
        pressed-flower(color: palette.rose.transparentize(30%), size: 20pt),
      ),
    )
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — soft cream card with colored top border and botanical aesthetic
#let concept-card(title, body, accent: palette.sage) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 2.5pt + accent, rest: 0.75pt + palette.border),
    inset: (x: 1.2em, y: 1em),
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent, size: 0.95em, title),
      {
        set text(fill: palette.text-body, size: 0.8em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Insight box — left-bordered callout with sage/linen fill
#let insight-box(title, body, accent: palette.sage) = {
  block(
    width: 100%,
    fill: accent.lighten(90%),
    stroke: (left: 3pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 5pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "semibold", fill: accent.darken(10%), size: 0.92em, title),
      {
        set text(fill: palette.text-body, size: 0.8em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Stat card — KPI/statistic with large number, botanical dot accent
#let stat-card(value, label, accent: palette.sage) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.75pt + palette.border,
    inset: (x: 1em, y: 0.9em),
    radius: 6pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      // Small decorative dot cluster above number
      stack(dir: ltr, spacing: 3pt,
        box(circle(radius: 1.5pt, fill: accent.transparentize(50%))),
        box(circle(radius: 2pt, fill: accent.transparentize(30%))),
        box(circle(radius: 1.5pt, fill: accent.transparentize(50%))),
      ),
      text(size: 2em, weight: "bold", fill: accent, value),
      text(size: 0.78em, fill: palette.text-muted, label),
      lazy-v(1fr),
    )
  ]
}

/// Quote card — elegant quotation with SVG quote marks and botanical styling
#let quote-card(quote-text, author: none, accent: palette.brown) = {
  block(
    width: 100%,
    fill: palette.linen,
    stroke: (left: 2pt + palette.rose),
    inset: (left: 1.4em, right: 1.2em, y: 1em),
    radius: (right: 5pt),
  )[
    // SVG-style quote mark (inline drawn)
    #place(top + left, dx: -0.8em, dy: -0.3em,
      text(size: 2.5em, fill: accent.transparentize(50%), weight: "bold")[\u{201C}])
    #stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-body, size: 0.88em, style: "italic")
        quote-text
      },
      {
        if author != none {
          text(fill: palette.text-muted, size: 0.78em, weight: "medium")[-- #author]
        }
      },
      lazy-v(1fr),
    )
  ]
}

/// Feature card — icon-less feature highlight with rose accent dot
#let feature-card(title, body, accent: palette.rose) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.75pt + palette.border,
    inset: (x: 1.2em, y: 1em),
    radius: 6pt,
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        box(circle(radius: 4pt, fill: accent)),
        text(weight: "semibold", fill: palette.text-dark, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Timeline entry — a single step in a process with organic connector
#let timeline-entry(step, title, body, accent: palette.sage) = {
  block(width: 100%, inset: (y: 0.3em))[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      align: (center, left),
      // Step circle
      {
        stack(
          spacing: 0pt,
          circle(radius: 14pt, fill: accent.lighten(80%), stroke: 1.5pt + accent)[
            #set text(size: 0.8em, weight: "bold", fill: accent)
            #std.align(center + horizon, step)
          ],
          // Vertical connector line
          block(width: 1.5pt, height: 1.5em, fill: accent.transparentize(60%)),
        )
      },
      // Content
      {
        stack(
          spacing: 0.8em,
          text(weight: "semibold", fill: palette.text-dark, size: 0.92em, title),
          text(fill: palette.text-body, size: 0.8em, body),
        )
      },
    )
  ]
}

/// Comparison table — clean data table with linen aesthetic
#let comparison-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.linen }
      else if calc.odd(row) { palette.card } else { palette.cream },
    stroke: 0.5pt + palette.border,
    inset: (x: 1em, y: 0.6em),
    align: align,
    table.header(..headers.map(h => text(weight: "semibold", fill: palette.text-dark, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.82em, c)),
  )
}

/// Callout box — warm brown toned important note
#let callout-box(title, body, accent: palette.brown) = {
  block(
    width: 100%,
    fill: palette.cream,
    stroke: (bottom: 2pt + accent, rest: 0.75pt + palette.border),
    inset: (x: 1.2em, y: 0.45em),
    radius: 5pt,
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        // Small leaf-inspired chevron
        text(fill: accent, size: 1.1em, weight: "bold")[\u{25C6}],
        text(weight: "semibold", fill: accent, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.78em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Linen tag — minimal rounded tag/pill in botanical colors
#let linen-tag(content, color: palette.sage) = {
  box(
    fill: color.lighten(85%),
    stroke: 0.75pt + color.lighten(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(10%), size: 0.75em, weight: "medium")
    #content
  ]
}

/// Petal divider — decorative botanical separator using SVG
#let petal-divider(width: 60%) = {
  botanical-divider(color: palette.sage, width: width)
}


// ═══ 3. Theme Entry Point ═══

#let pressed-linen-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.cream,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.sage,
      neutral-lightest: palette.cream,
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
