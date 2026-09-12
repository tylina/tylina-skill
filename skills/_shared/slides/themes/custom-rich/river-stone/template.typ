// River Stone Theme — Smooth river stones, zen rock gardens, natural mineral textures
// Warm cream/stone background with earth-tone palette conveying stability and groundedness.
// Features: organic pebble shapes, water ripple patterns, raked zen-sand lines, moss accents.
// Best for: Executive presentations, strategy consulting, sustainable business, architecture.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Earth & Stone) ═══

#let palette = (
  stone-bg: rgb("#F8F6F3"),      // Main background (warm stone)
  slate: rgb("#5B6770"),          // Primary accent (river slate)
  moss: rgb("#7A8B6F"),           // Secondary accent (moss green)
  clay: rgb("#B8856C"),           // Tertiary accent (terracotta clay)
  dark-text: rgb("#2C3338"),      // Heading text
  body-text: rgb("#4A5259"),      // Body copy
  pebble: rgb("#E8E4DF"),         // Card/pebble fill
  sand: rgb("#EDE9E3"),           // Subtle fills
  border: rgb("#D4CFC8"),         // Borders
  water: rgb("#8FAAB4"),          // Water/highlight accent
)


// ═══ SVG Definitions ═══

// Pebble cluster — Group of 5-7 smooth overlapping oval/ellipse shapes (river stones)
// Used on title-slide and ending-slide as bookending motif
#let _pebble-cluster-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="260" height="200" viewBox="0 0 260 200">
  <!-- Large base stone -->
  <ellipse cx="130" cy="120" rx="55" ry="38" fill="currentColor" opacity="0.12" transform="rotate(-8 130 120)"/>
  <!-- Medium stone top-left -->
  <ellipse cx="85" cy="90" rx="42" ry="30" fill="currentColor" opacity="0.10" transform="rotate(12 85 90)"/>
  <!-- Small stone top-right -->
  <ellipse cx="175" cy="85" rx="32" ry="24" fill="currentColor" opacity="0.09" transform="rotate(-5 175 85)"/>
  <!-- Tiny pebble far left -->
  <ellipse cx="50" cy="135" rx="22" ry="16" fill="currentColor" opacity="0.08" transform="rotate(18 50 135)"/>
  <!-- Medium-small stone bottom-right -->
  <ellipse cx="190" cy="140" rx="35" ry="25" fill="currentColor" opacity="0.11" transform="rotate(-12 190 140)"/>
  <!-- Small pebble top-center -->
  <ellipse cx="140" cy="65" rx="20" ry="15" fill="currentColor" opacity="0.07" transform="rotate(6 140 65)"/>
  <!-- Tiny pebble bottom-center -->
  <ellipse cx="115" cy="160" rx="18" ry="13" fill="currentColor" opacity="0.08" transform="rotate(-3 115 160)"/>
  <!-- Shadow/depth on large stone -->
  <ellipse cx="135" cy="128" rx="48" ry="30" fill="currentColor" opacity="0.04" transform="rotate(-8 135 128)"/>
  <!-- Highlight on medium stone -->
  <ellipse cx="82" cy="84" rx="28" ry="18" fill="currentColor" opacity="0.03" transform="rotate(12 82 84)"/>
  <!-- Tiny accent pebble -->
  <ellipse cx="210" cy="110" rx="14" ry="10" fill="currentColor" opacity="0.06" transform="rotate(25 210 110)"/>
</svg>```.text

// Water ripple — Concentric oval ripple rings emanating from center
// Used on focus-slide corners and ripple-box component
#let _water-ripple-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="180" height="140" viewBox="0 0 180 140">
  <!-- Outermost ripple -->
  <ellipse cx="90" cy="70" rx="85" ry="60" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.06"/>
  <!-- Second ripple -->
  <ellipse cx="90" cy="70" rx="70" ry="50" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.08"/>
  <!-- Third ripple -->
  <ellipse cx="90" cy="70" rx="55" ry="40" fill="none" stroke="currentColor" stroke-width="1.0" opacity="0.10"/>
  <!-- Fourth ripple -->
  <ellipse cx="90" cy="70" rx="40" ry="29" fill="none" stroke="currentColor" stroke-width="1.1" opacity="0.12"/>
  <!-- Fifth ripple -->
  <ellipse cx="90" cy="70" rx="26" ry="19" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.14"/>
  <!-- Inner ripple -->
  <ellipse cx="90" cy="70" rx="14" ry="10" fill="none" stroke="currentColor" stroke-width="1.3" opacity="0.16"/>
  <!-- Center drop point -->
  <circle cx="90" cy="70" r="3" fill="currentColor" opacity="0.20"/>
  <!-- Slight distortion arcs for organic feel -->
  <path d="M40,70 Q65,58 90,55" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
  <path d="M140,70 Q115,82 90,85" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
</svg>```.text

// Stone texture — Full-page subtle grain pattern with scattered mineral specks
// Persistent background atmosphere on every content slide
#let _stone-texture-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Scattered mineral specks (grain texture) -->
  <circle cx="45" cy="32" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="120" cy="78" r="0.8" fill="currentColor" opacity="0.03"/>
  <circle cx="210" cy="45" r="1.2" fill="currentColor" opacity="0.035"/>
  <circle cx="315" cy="92" r="0.9" fill="currentColor" opacity="0.04"/>
  <circle cx="420" cy="28" r="1.1" fill="currentColor" opacity="0.03"/>
  <circle cx="530" cy="65" r="0.7" fill="currentColor" opacity="0.04"/>
  <circle cx="640" cy="42" r="1" fill="currentColor" opacity="0.035"/>
  <circle cx="740" cy="88" r="0.9" fill="currentColor" opacity="0.03"/>
  <circle cx="78" cy="145" r="1.1" fill="currentColor" opacity="0.035"/>
  <circle cx="185" cy="168" r="0.8" fill="currentColor" opacity="0.04"/>
  <circle cx="290" cy="190" r="1" fill="currentColor" opacity="0.03"/>
  <circle cx="395" cy="155" r="1.2" fill="currentColor" opacity="0.035"/>
  <circle cx="510" cy="178" r="0.9" fill="currentColor" opacity="0.04"/>
  <circle cx="615" cy="142" r="1" fill="currentColor" opacity="0.03"/>
  <circle cx="720" cy="195" r="0.8" fill="currentColor" opacity="0.035"/>
  <circle cx="55" cy="260" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="160" cy="285" r="1.1" fill="currentColor" opacity="0.03"/>
  <circle cx="265" cy="310" r="0.9" fill="currentColor" opacity="0.035"/>
  <circle cx="370" cy="275" r="1.2" fill="currentColor" opacity="0.04"/>
  <circle cx="475" cy="295" r="0.8" fill="currentColor" opacity="0.03"/>
  <circle cx="580" cy="265" r="1" fill="currentColor" opacity="0.035"/>
  <circle cx="685" cy="302" r="0.9" fill="currentColor" opacity="0.04"/>
  <circle cx="790" cy="270" r="1.1" fill="currentColor" opacity="0.03"/>
  <circle cx="90" cy="370" r="0.8" fill="currentColor" opacity="0.035"/>
  <circle cx="195" cy="395" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="300" cy="420" r="1.2" fill="currentColor" opacity="0.03"/>
  <circle cx="405" cy="380" r="0.9" fill="currentColor" opacity="0.035"/>
  <circle cx="520" cy="410" r="1" fill="currentColor" opacity="0.04"/>
  <circle cx="625" cy="385" r="0.8" fill="currentColor" opacity="0.03"/>
  <circle cx="730" cy="425" r="1.1" fill="currentColor" opacity="0.035"/>
  <circle cx="800" cy="390" r="0.9" fill="currentColor" opacity="0.04"/>
  <!-- Subtle horizontal grain lines -->
  <line x1="0" y1="120" x2="840" y2="121" stroke="currentColor" stroke-width="0.3" opacity="0.025"/>
  <line x1="0" y1="240" x2="840" y2="239" stroke="currentColor" stroke-width="0.3" opacity="0.02"/>
  <line x1="0" y1="355" x2="840" y2="356" stroke="currentColor" stroke-width="0.3" opacity="0.025"/>
</svg>```.text

// Zen raked-sand lines — Parallel curved lines like Japanese rock garden
// Used on title-slide and ending-slide as bookending element
#let _zen-lines-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Raked sand curves flowing around invisible stones -->
  <path d="M0,400 Q120,385 240,390 Q360,395 480,388 Q600,381 720,386 Q780,389 840,392" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.08"/>
  <path d="M0,415 Q100,400 200,407 Q320,414 440,406 Q560,398 680,404 Q760,408 840,410" fill="none" stroke="currentColor" stroke-width="1.0" opacity="0.07"/>
  <path d="M0,430 Q140,418 280,423 Q400,428 520,420 Q640,412 760,418 Q800,420 840,425" fill="none" stroke="currentColor" stroke-width="1.1" opacity="0.06"/>
  <path d="M0,445 Q110,435 220,440 Q350,445 470,438 Q590,431 710,436 Q780,439 840,442" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.05"/>
  <path d="M0,458 Q130,450 260,454 Q380,458 500,452 Q620,446 740,450 Q790,452 840,455" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.04"/>
  <!-- Top-area subtle rake marks -->
  <path d="M0,50 Q180,42 360,48 Q540,54 720,46 Q780,43 840,45" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.04"/>
  <path d="M0,62 Q160,56 320,60 Q500,64 680,58 Q760,55 840,57" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.035"/>
  <path d="M0,74 Q200,68 400,72 Q580,76 760,70 Q800,68 840,69" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.03"/>
</svg>```.text

// Corner pebble motif — small group of 3 stones for content slide corners
#let _corner-pebble-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="60" viewBox="0 0 80 60">
  <ellipse cx="35" cy="35" rx="22" ry="16" fill="currentColor" opacity="0.06" transform="rotate(-10 35 35)"/>
  <ellipse cx="55" cy="28" rx="16" ry="12" fill="currentColor" opacity="0.05" transform="rotate(8 55 28)"/>
  <ellipse cx="28" cy="20" rx="12" ry="9" fill="currentColor" opacity="0.04" transform="rotate(15 28 20)"/>
  <!-- Shadow depth -->
  <ellipse cx="37" cy="38" rx="18" ry="12" fill="currentColor" opacity="0.025" transform="rotate(-10 37 38)"/>
  <!-- Highlight on top stone -->
  <ellipse cx="26" cy="17" rx="7" ry="5" fill="currentColor" opacity="0.02" transform="rotate(15 26 17)"/>
</svg>```.text

// Moss accent — Small organic blob shapes clustered together
#let _moss-accent-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="40" viewBox="0 0 60 40">
  <circle cx="15" cy="22" r="6" fill="currentColor" opacity="0.35"/>
  <circle cx="28" cy="18" r="8" fill="currentColor" opacity="0.30"/>
  <circle cx="22" cy="30" r="5" fill="currentColor" opacity="0.25"/>
  <circle cx="38" cy="25" r="7" fill="currentColor" opacity="0.28"/>
  <circle cx="45" cy="18" r="5" fill="currentColor" opacity="0.22"/>
  <circle cx="35" cy="12" r="4" fill="currentColor" opacity="0.20"/>
  <circle cx="50" cy="28" r="4.5" fill="currentColor" opacity="0.18"/>
  <circle cx="10" cy="14" r="3.5" fill="currentColor" opacity="0.15"/>
</svg>```.text

// Large pebble silhouette for new-section-slide
#let _large-pebble-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="300" viewBox="0 0 200 300">
  <ellipse cx="100" cy="150" rx="80" ry="120" fill="currentColor" opacity="0.07" transform="rotate(-5 100 150)"/>
  <ellipse cx="95" cy="145" rx="70" ry="105" fill="currentColor" opacity="0.04" transform="rotate(-5 95 145)"/>
  <!-- Surface texture lines -->
  <path d="M55,100 Q100,90 145,100" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.04"/>
  <path d="M50,140 Q100,130 150,140" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.035"/>
  <path d="M55,180 Q100,170 145,180" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.03"/>
  <path d="M60,220 Q100,212 140,220" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.025"/>
  <!-- Mineral vein -->
  <path d="M70,80 Q90,120 85,180 Q82,220 90,260" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.035"/>
  <!-- Highlight reflection -->
  <ellipse cx="85" cy="110" rx="25" ry="35" fill="currentColor" opacity="0.02" transform="rotate(-10 85 110)"/>
</svg>```.text

// Sediment layers — horizontal layered stone lines for divider
#let _sediment-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="12" viewBox="0 0 400 12">
  <path d="M0,2 Q50,1 100,2.5 Q150,4 200,2 Q250,0.5 300,2 Q350,3.5 400,2" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.3"/>
  <path d="M0,6 Q60,5 120,6.5 Q180,8 240,6 Q300,4.5 360,6 Q380,7 400,6" fill="none" stroke="currentColor" stroke-width="1.0" opacity="0.22"/>
  <path d="M0,10 Q70,9 140,10.5 Q210,12 280,10 Q350,8.5 400,10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <!-- Tiny mineral dots along layers -->
  <circle cx="80" cy="2" r="1" fill="currentColor" opacity="0.2"/>
  <circle cx="200" cy="6" r="0.8" fill="currentColor" opacity="0.18"/>
  <circle cx="320" cy="10" r="1" fill="currentColor" opacity="0.15"/>
  <circle cx="150" cy="6" r="0.6" fill="currentColor" opacity="0.12"/>
  <circle cx="350" cy="2" r="0.7" fill="currentColor" opacity="0.14"/>
</svg>```.text

// Cairn icon — stacked stones for cairn-card
#let _cairn-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="60" viewBox="0 0 40 60">
  <!-- Bottom stone (largest) -->
  <ellipse cx="20" cy="50" rx="16" ry="8" fill="currentColor" opacity="0.5"/>
  <!-- Middle stone -->
  <ellipse cx="20" cy="38" rx="12" ry="7" fill="currentColor" opacity="0.45"/>
  <!-- Top stone (smallest) -->
  <ellipse cx="20" cy="27" rx="8" ry="5.5" fill="currentColor" opacity="0.4"/>
  <!-- Peak pebble -->
  <ellipse cx="20" cy="18" rx="5" ry="4" fill="currentColor" opacity="0.35"/>
  <!-- Shadow beneath bottom -->
  <ellipse cx="20" cy="55" rx="14" ry="3" fill="currentColor" opacity="0.12"/>
  <!-- Subtle highlights -->
  <ellipse cx="17" cy="36" rx="6" ry="3" fill="currentColor" opacity="0.08"/>
  <ellipse cx="18" cy="25" rx="4" ry="2.5" fill="currentColor" opacity="0.06"/>
</svg>```.text

// Zen raked lines (small version for zen-card bottom decoration)
#let _zen-rake-small-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="20" viewBox="0 0 300 20">
  <path d="M0,5 Q40,3 80,5 Q120,7 160,5 Q200,3 240,5 Q280,7 300,5" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.25"/>
  <path d="M0,10 Q50,8 100,10 Q150,12 200,10 Q250,8 300,10" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.20"/>
  <path d="M0,15 Q45,13 90,15 Q135,17 180,15 Q225,13 270,15 Q285,16 300,15" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.15"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render pebble cluster (bookending decoration)
#let _pebble-cluster(color: palette.slate) = {
  let svg = _pebble-cluster-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 200pt, height: 154pt)
}

/// Render water ripple
#let _water-ripple(color: palette.water, width: 140pt) = {
  let svg = _water-ripple-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}

/// Render stone texture background
#let _stone-texture(color: palette.slate) = {
  let svg = _stone-texture-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%, fit: "cover")
}

/// Render zen raked-sand lines (bookending)
#let _zen-lines(color: palette.slate) = {
  let svg = _zen-lines-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%, fit: "cover")
}

/// Render corner pebble motif
#let _corner-pebble(color: palette.slate) = {
  let svg = _corner-pebble-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 60pt, height: 45pt)
}

/// Render moss accent
#let _moss-accent(color: palette.moss, width: 40pt) = {
  let svg = _moss-accent-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}

/// Render large pebble silhouette
#let _large-pebble(color: palette.slate) = {
  let svg = _large-pebble-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), height: 100%)
}

/// Render sediment divider
#let sediment-divider(width: 80%, color: palette.slate) = {
  let svg = _sediment-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 8pt)))
}

/// Render cairn icon
#let _cairn-icon(color: palette.slate, height: 40pt) = {
  let svg = _cairn-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), height: height)
}

/// Render zen rake small (card decoration)
#let _zen-rake-small(color: palette.slate, width: 100%) = {
  let svg = _zen-rake-small-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: 12pt)
}


// ═══ Background Atmosphere (MANDATORY on every content slide) ═══

/// Persistent stone texture + corner pebble motifs on every content slide
#let _slide-atmosphere() = {
  // Stone texture grain across entire slide
  place(top + left, box(width: 100%, height: 100%, _stone-texture(color: palette.slate)))
  // Corner pebble motifs (subtle)
  place(bottom + right, dx: -0.5em, dy: -0.3em,
    box(_corner-pebble(color: palette.slate)))
  place(top + left, dx: 0.5em, dy: 0.3em,
    box(_corner-pebble(color: palette.moss.transparentize(40%))))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — stone BG, slate header accent, corner pebble motifs, stone texture
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.dark-text, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Slate accent bar with rounded pebble ends
      stack(dir: ltr, spacing: 0pt,
        box(circle(radius: 3pt, fill: palette.slate.transparentize(30%))),
        box(width: 60pt, height: 2.5pt, fill: gradient.linear(palette.slate, palette.moss, angle: 0deg)),
        box(circle(radius: 2.5pt, fill: palette.moss.transparentize(40%))),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set text(fill: palette.body-text.transparentize(30%), size: 0.65em)
    block(width: 100%, height: 100%)[
      #place(left + horizon, {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      })
      // Small pebbles as the footer center
      #place(center + horizon,
        stack(dir: ltr, spacing: 3pt,
          box(circle(radius: 1.5pt, fill: palette.slate.transparentize(50%))),
          box(circle(radius: 2pt, fill: palette.moss.transparentize(40%))),
          box(circle(radius: 1.5pt, fill: palette.clay.transparentize(50%))),
        ))
      #place(right + horizon,
        context text(fill: palette.body-text.transparentize(30%), size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number])
    ]
  }
  let setting(body) = {
    // PERSISTENT ATMOSPHERE on every content slide
    _slide-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — Zen garden composition: pebble cluster center, raked sand lines, water ripple corner
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm stone background
    place(top + left, block(width: 100%, height: 100%, fill: palette.stone-bg))
    // Zen raked-sand lines (bookending element)
    place(top + left, box(width: 100%, height: 100%, _zen-lines(color: palette.slate)))
    // Pebble cluster center-left (bookending element)
    place(left + horizon, dx: 3em, dy: 1em,
      box(_pebble-cluster(color: palette.slate)))
    // Water ripple top-right corner
    place(top + right, dx: -2em, dy: 2em,
      box(_water-ripple(color: palette.water, width: 120pt)))
    // Small moss accent bottom-left
    place(bottom + left, dx: 5em, dy: -5em,
      box(_moss-accent(color: palette.moss, width: 35pt)))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #v(1fr)
      // Title
      #text(size: 2.3em, weight: "bold", fill: palette.dark-text, info.title)
      #v(0.4em)
      // Slate gradient line
      #std.align(center, box(width: 180pt, height: 2.5pt,
        fill: gradient.linear(palette.slate, palette.moss, palette.water, angle: 0deg)))
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.body-text, info.subtitle)
        v(0.4em)
      }
      // Author
      #if info.author != none {
        text(size: 0.95em, fill: palette.slate, weight: "medium", info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.body-text.transparentize(20%), info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.15em)
        text(size: 0.75em, fill: palette.body-text.transparentize(30%))[#utils.display-info-date(self)]
      }
      #v(1fr)
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.stone-bg,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// New section slide — Left panel with large pebble silhouette, section title right with zen lines
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
      fill: palette.stone-bg,
    ),
  )
  let main-body = {
    // Stone texture background
    place(top + left, box(width: 100%, height: 100%, _stone-texture(color: palette.slate)))
    // Left panel — large pebble silhouette
    place(left + horizon, dx: 2em,
      box(height: 80%, _large-pebble(color: palette.slate)))
    // Thin vertical separator
    place(left + top, dx: 32%,
      block(width: 1.5pt, height: 100%, fill: palette.border))
    // Zen rake lines subtle in right area
    place(bottom + right, dx: -1em, dy: -2em,
      box(width: 250pt, _zen-rake-small(color: palette.slate, width: 250pt)))
    // Section title area
    pad(left: 38%, right: 4em, top: 4em, bottom: 3em)[
      #v(1fr)
      // Section number faded
      #text(size: 3.5em, weight: "bold", fill: palette.slate.transparentize(70%))[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Section title
      #set text(fill: palette.dark-text, size: 1.8em, weight: "semibold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.5em)
      // Slate accent bar
      #box(width: 50pt, height: 2.5pt, fill: palette.slate, radius: 1pt)
      #v(0.4em)
      // Small moss accent
      #box(_moss-accent(color: palette.moss, width: 30pt))
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — Clean TOC with moss accent dots
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      fill: palette.stone-bg,
      margin: (x: 4em, y: 2.5em),
    ),
  )
  let main-body = {
    // Background atmosphere
    place(top + left, box(width: 100%, height: 100%, _stone-texture(color: palette.slate)))
    // Moss accent top-right
    place(top + right, dx: -2em, dy: 1.5em,
      box(_moss-accent(color: palette.moss, width: 45pt)))
    // Corner pebble bottom-left
    place(bottom + left, dx: 1em, dy: -1em,
      box(_corner-pebble(color: palette.slate)))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "semibold", fill: palette.dark-text)
        title
      },
      box(width: 50pt, height: 2.5pt, fill: palette.slate, radius: 1pt),
      {
        v(0.4em)
        set text(size: 1.1em, fill: palette.body-text)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — Slate background, cream text, water ripple corners
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.slate,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle stone texture on dark
    place(top + left, box(width: 100%, height: 100%,
      _stone-texture(color: palette.stone-bg)))
    // Water ripple corners
    place(top + left, dx: -1em, dy: -0.5em,
      box(_water-ripple(color: palette.water.transparentize(30%), width: 100pt)))
    place(bottom + right, dx: 1em, dy: 0.5em,
      box(_water-ripple(color: palette.water.transparentize(30%), width: 100pt)))
    // Main text
    set text(fill: palette.stone-bg, size: 1.8em, weight: "semibold")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — Bookend with title: pebble cluster, raked zen lines
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.stone-bg,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Warm stone background
    place(top + left, block(width: 100%, height: 100%, fill: palette.stone-bg))
    // Zen raked-sand lines (bookending with title)
    place(top + left, box(width: 100%, height: 100%, _zen-lines(color: palette.slate)))
    // Pebble cluster (bookending with title)
    place(right + horizon, dx: -3em, dy: 1em,
      box(_pebble-cluster(color: palette.slate)))
    // Water ripple bottom-left
    place(bottom + left, dx: 2em, dy: -2em,
      box(_water-ripple(color: palette.water, width: 100pt)))
    // Center content
    set std.align(center + horizon)
    stack(
      spacing: 0.8em,
      text(size: 2.2em, weight: "bold", fill: palette.dark-text, body),
      std.align(center, box(width: 160pt, height: 2.5pt,
        fill: gradient.linear(palette.slate, palette.moss, angle: 0deg))),
      {
        v(0.3em)
        text(size: 0.8em, fill: palette.body-text.transparentize(20%))[Grounded in clarity]
      },
    )
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Stone card — Rounded card with pebble-shaped top border (organic curve)
#let stone-card(title, body, accent: palette.slate) = {
  block(width: 100%, fill: palette.pebble, stroke: 0.5pt + palette.border, radius: 12pt, inset: 14pt, clip: true)[
    // Organic top accent (mimics smooth stone edge)
    #place(top + left, dy: -14pt,
      block(width: 100%, height: 4pt, fill: accent, radius: (top: 12pt)))
    #v(2pt)
    #text(weight: "semibold", size: 0.95em, fill: palette.dark-text, title)
    #v(6pt)
    #text(fill: palette.body-text, size: 0.82em, body)
    #lazy-v(1fr)
  ]
}

/// Ripple box — Callout with concentric ripple accent in corner
#let ripple-box(title, body, accent: palette.water) = {
  block(width: 100%, fill: palette.sand, stroke: (left: 3pt + accent, rest: 0.5pt + palette.border), inset: (x: 1.2em, y: 0.75em), radius: (right: 8pt, left: 2pt))[
    // Ripple accent in top-right corner
    #place(top + right, dx: 0.5em, dy: -0.5em,
      box(_water-ripple(color: accent.transparentize(50%), width: 50pt)))
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent.darken(20%), size: 0.92em, title),
      [
      #set text(fill: palette.body-text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Mineral stat — KPI card with small stone icon above
#let mineral-stat(value, label, accent: palette.slate) = {
  block(width: 100%, fill: palette.pebble, stroke: 0.5pt + palette.border, inset: (x: 1em, y: 0.9em), radius: 10pt)[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      box(height: 28pt, _cairn-icon(color: accent, height: 28pt)),
      text(size: 2em, weight: "bold", fill: accent, value),
      text(size: 0.78em, fill: palette.body-text, label),
      lazy-v(1fr),
    )
    // Small cairn icon above
  ]
}

/// Moss quote — Quote with moss-colored left bar and organic shape
#let moss-quote(quote-text, author: none, accent: palette.moss) = {
  block(width: 100%, fill: palette.sand, stroke: (left: 3.5pt + accent), inset: (left: 1.4em, right: 1.2em, y: 0.7em), radius: (right: 6pt))[
    // Organic moss shape accent
    #place(top + left, dx: -1em, dy: -0.3em,
      box(_moss-accent(color: accent.transparentize(40%), width: 25pt)))
    #set text(fill: palette.body-text, size: 0.88em, style: "italic")
    #quote-text
    #if author != none {
      v(0.4em)
      set text(fill: palette.slate, size: 0.78em, weight: "medium", style: "normal")
      [--- #author]
    }
    #lazy-v(1fr)
  ]
}

/// Zen card — Minimal card with raked-line bottom decoration
#let zen-card(title, body, accent: palette.slate) = {
  block(width: 100%, fill: palette.pebble, stroke: 0.5pt + palette.border, inset: (x: 1.2em, top: 0.75em, bottom: 0.45em), radius: 8pt)[
    #text(weight: "semibold", fill: accent, size: 0.95em, title)
    #v(6pt)
    #set text(fill: palette.body-text, size: 0.82em)
    #body
    #lazy-v(1fr)
    #v(6pt)
    // Raked zen-sand lines at bottom
    #box(width: 100%, _zen-rake-small(color: accent.transparentize(30%), width: 100%))
  ]
}

/// Pebble tag — Rounded pill tag in earth tones
#let pebble-tag(content, color: palette.slate) = {
  box(
    fill: color.transparentize(85%),
    stroke: 0.75pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.25em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(10%), size: 0.75em, weight: "medium")
    #content
  ]
}

/// Stream entry — Timeline step with water-flow connector
#let stream-entry(step, title, body, accent: palette.water) = {
  block(width: 100%, inset: (y: 0.3em))[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      align: (center, left),
      // Step circle (pebble-shaped)
      {
        stack(
          spacing: 0pt,
          box(circle(radius: 14pt, fill: accent.transparentize(80%), stroke: 1.5pt + accent)[
            #set text(size: 0.8em, weight: "bold", fill: accent.darken(20%))
            #std.align(center + horizon, step)
          ]),
          // Water-flow vertical connector
          block(width: 2pt, height: 1.5em, fill: gradient.linear(accent, accent.transparentize(80%), angle: 180deg)),
        )
      },
      // Content
      {
        stack(
          spacing: 0.8em,
          text(weight: "semibold", fill: palette.dark-text, size: 0.92em, title),
          text(fill: palette.body-text, size: 0.8em, body),
        )
      },
    )
  ]
}

/// Bedrock table — Clean table with sand/stone alternating rows
#let bedrock-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.slate.transparentize(85%) }
      else if calc.odd(row) { palette.pebble } else { palette.sand },
    stroke: 0.5pt + palette.border,
    inset: (x: 1em, y: 0.3em),
    align: align,
    table.header(..headers.map(h => text(weight: "semibold", fill: palette.dark-text, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.body-text, size: 0.82em, c)),
  )
}

/// Cairn card — Stacked stone (cairn) icon + content card
#let cairn-card(title, body, accent: palette.slate) = {
  block(width: 100%, fill: palette.pebble, stroke: 0.5pt + palette.border, inset: (x: 1.2em, y: 0.7em), radius: 10pt)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      align: (center + horizon, left),
      // Cairn icon
      box(height: 36pt, _cairn-icon(color: accent, height: 36pt)),
      // Content
      {
        text(weight: "semibold", fill: accent, size: 0.95em, title)
        v(5pt)
        set text(fill: palette.body-text, size: 0.82em)
        body
      },
    )
    #lazy-v(1fr)
  ]
}


// ═══ 3. Theme Entry Point ═══

#let river-stone-theme(
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
      fill: palette.stone-bg,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.slate,
      neutral-lightest: palette.stone-bg,
      neutral-darkest: palette.dark-text,
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
