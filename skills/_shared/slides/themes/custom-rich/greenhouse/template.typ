// Greenhouse Theme — Victorian Botanical Greenhouse with Iron-Frame Glass Architecture
// You are INSIDE the Palm House at Kew Gardens on a sunny morning.
// Iron arches overhead. Glass panes catch the light. Verdant ferns unfurl.
// Everything is structured (iron engineering) yet organic (living plants).
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#2D6A4F"),       // deep fern
  dark: rgb("#1B3A2E"),          // forest dark
  accent: rgb("#E07A3A"),        // terracotta pot
  bg: rgb("#F8FAF7"),            // greenhouse light (green-tinted white)
  card: rgb("#EFF5ED"),          // leaf-tinted
  text-dark: rgb("#1B3A2E"),     // dark text
  text-body: rgb("#3A5A4A"),     // body text
  text-light: rgb("#7A9A8A"),    // muted text
  border: rgb("#C8DCC4"),        // soft green border
  iron: rgb("#4A5C56"),          // iron frame grey-green
  glass: rgb("#E8F2E8"),         // glass pane tint
  bloom: rgb("#D4577A"),         // flower bloom
)

// ═══ SVG Definitions (ARCHITECTURAL + ORGANIC) ═══

// 1. IRON FRAME ARCH — The curved structural arch of a greenhouse roof
//    Main arch + inner arch + 8 radial panes + 2 horizontal ribs + connecting spars
//    20+ elements creating the iconic Victorian greenhouse silhouette
#let _iron-arch-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 140">
  <!-- Main outer arch -->
  <path d="M10,135 Q10,15 200,8 Q390,15 390,135" fill="none" stroke="currentColor" stroke-width="3.5" stroke-linecap="round"/>
  <!-- Inner structural arch -->
  <path d="M30,135 Q30,30 200,22 Q370,30 370,135" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
  <!-- Center vertical rib -->
  <line x1="200" y1="8" x2="200" y2="135" stroke="currentColor" stroke-width="1.5" opacity="0.7"/>
  <!-- Radial pane ribs (left side) -->
  <line x1="70" y1="135" x2="95" y2="28" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <line x1="110" y1="135" x2="130" y2="24" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <line x1="150" y1="135" x2="165" y2="18" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <!-- Radial pane ribs (right side) -->
  <line x1="330" y1="135" x2="305" y2="28" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <line x1="290" y1="135" x2="270" y2="24" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <line x1="250" y1="135" x2="235" y2="18" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <!-- Horizontal cross-brace 1 (upper) -->
  <path d="M55,55 Q130,42 200,40 Q270,42 345,55" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5"/>
  <!-- Horizontal cross-brace 2 (lower) -->
  <path d="M40,85 Q120,72 200,70 Q280,72 360,85" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5"/>
  <!-- Horizontal cross-brace 3 (near base) -->
  <path d="M25,110 Q110,100 200,98 Q290,100 375,110" fill="none" stroke="currentColor" stroke-width="1" opacity="0.4"/>
  <!-- Decorative keystone at apex -->
  <circle cx="200" cy="12" r="4" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
  <circle cx="200" cy="12" r="1.5" fill="currentColor" opacity="0.4"/>
  <!-- Small pane detail nodes at intersections -->
  <circle cx="95" cy="28" r="1.8" fill="currentColor" opacity="0.3"/>
  <circle cx="130" cy="24" r="1.8" fill="currentColor" opacity="0.3"/>
  <circle cx="165" cy="18" r="1.8" fill="currentColor" opacity="0.3"/>
  <circle cx="235" cy="18" r="1.8" fill="currentColor" opacity="0.3"/>
  <circle cx="270" cy="24" r="1.8" fill="currentColor" opacity="0.3"/>
  <circle cx="305" cy="28" r="1.8" fill="currentColor" opacity="0.3"/>
  <!-- Base columns -->
  <rect x="8" y="130" width="6" height="8" fill="currentColor" opacity="0.5" rx="1"/>
  <rect x="386" y="130" width="6" height="8" fill="currentColor" opacity="0.5" rx="1"/>
</svg>```.text

// 2. LEAF VEIN NETWORK — Delicate branching pattern (fractal-like)
//    Full-page background at very low opacity. 18 path segments creating
//    a naturalistic venation pattern like a magnified leaf surface.
#let _leaf-vein-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 450">
  <!-- Primary midrib -->
  <path d="M50,400 Q150,320 280,260 Q400,200 550,150 Q680,100 750,50" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" opacity="0.8"/>
  <!-- Secondary veins (left side of midrib) -->
  <path d="M120,370 Q180,330 280,260" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.6"/>
  <path d="M80,300 Q160,280 280,260" fill="none" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <path d="M200,340 Q240,300 320,240" fill="none" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <path d="M300,320 Q340,280 400,220" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <!-- Secondary veins (right side of midrib) -->
  <path d="M350,230 Q420,190 500,170" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.6"/>
  <path d="M420,250 Q480,210 560,160" fill="none" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <path d="M500,200 Q560,170 640,120" fill="none" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <path d="M580,170 Q630,130 700,80" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <!-- Tertiary veinlets (fine detail) -->
  <path d="M150,350 Q170,340 190,350" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M220,310 Q240,295 260,305" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M340,270 Q360,255 380,265" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M450,220 Q470,205 490,215" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M550,180 Q570,165 590,175" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M630,140 Q650,125 670,135" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <!-- Additional branching from lower left -->
  <path d="M60,420 Q100,390 160,370" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <path d="M30,350 Q70,330 120,320" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.35"/>
  <!-- Upper right fine network -->
  <path d="M680,100 Q720,80 760,60" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.35"/>
</svg>```.text

// 3. BOTANICAL CORNER — Fern frond and small leaves as L-shaped corner piece
//    Used in card corners and slide corners. Complex organic curves.
#let _botanical-corner-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <!-- Main fern rachis (stem) -->
  <path d="M5,95 Q8,60 15,40 Q22,20 40,8 Q60,2 95,2" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <!-- Fern pinnae (leaflets) along the curve -->
  <path d="M10,80 Q18,72 12,65" fill="none" stroke="currentColor" stroke-width="1" opacity="0.7"/>
  <path d="M12,70 Q22,62 15,55" fill="none" stroke="currentColor" stroke-width="1" opacity="0.7"/>
  <path d="M15,58 Q26,50 20,42" fill="none" stroke="currentColor" stroke-width="1" opacity="0.65"/>
  <path d="M20,45 Q32,38 26,30" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.6"/>
  <path d="M28,33 Q40,26 34,18" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.6"/>
  <path d="M38,20 Q50,14 45,8" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.55"/>
  <!-- Small leaves on outer side -->
  <ellipse cx="16" cy="75" rx="4" ry="7" fill="currentColor" opacity="0.15" transform="rotate(-20,16,75)"/>
  <ellipse cx="22" cy="55" rx="3.5" ry="6" fill="currentColor" opacity="0.12" transform="rotate(-35,22,55)"/>
  <ellipse cx="30" cy="38" rx="3" ry="5.5" fill="currentColor" opacity="0.12" transform="rotate(-50,30,38)"/>
  <ellipse cx="42" cy="22" rx="3" ry="5" fill="currentColor" opacity="0.10" transform="rotate(-65,42,22)"/>
  <!-- Tiny unfurling frond tips -->
  <circle cx="8" cy="88" r="2" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.4"/>
  <path d="M8,88 Q6,85 8,83" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.4"/>
  <!-- Decorative dots (spores) -->
  <circle cx="18" cy="62" r="1" fill="currentColor" opacity="0.25"/>
  <circle cx="25" cy="45" r="1" fill="currentColor" opacity="0.2"/>
  <circle cx="35" cy="28" r="0.8" fill="currentColor" opacity="0.2"/>
  <circle cx="55" cy="10" r="0.8" fill="currentColor" opacity="0.15"/>
</svg>```.text

// 4. IRON LATTICE STRIP — Cross-hatched diamond trellis pattern for dividers
#let _iron-lattice-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 16">
  <!-- Top rail -->
  <line x1="0" y1="1" x2="300" y2="1" stroke="currentColor" stroke-width="1.5" opacity="0.8"/>
  <!-- Bottom rail -->
  <line x1="0" y1="15" x2="300" y2="15" stroke="currentColor" stroke-width="1.5" opacity="0.8"/>
  <!-- Diamond cross-hatch pattern -->
  <path d="M0,8 L15,1 L30,8 L45,1 L60,8 L75,1 L90,8 L105,1 L120,8 L135,1 L150,8 L165,1 L180,8 L195,1 L210,8 L225,1 L240,8 L255,1 L270,8 L285,1 L300,8" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.6"/>
  <path d="M0,8 L15,15 L30,8 L45,15 L60,8 L75,15 L90,8 L105,15 L120,8 L135,15 L150,8 L165,15 L180,8 L195,15 L210,8 L225,15 L240,8 L255,15 L270,8 L285,15 L300,8" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.6"/>
  <!-- Small node dots at diamond vertices -->
  <circle cx="0" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="30" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="60" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="90" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="120" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="150" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="180" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="210" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="240" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="270" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
  <circle cx="300" cy="8" r="1.2" fill="currentColor" opacity="0.5"/>
</svg>```.text

// 5. DEWDROP DOTS — Small circles at varying sizes suggesting dewdrops on glass
#let _dewdrop-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 120">
  <circle cx="25" cy="20" r="4" fill="currentColor" opacity="0.25"/>
  <circle cx="28" cy="22" r="1.5" fill="white" opacity="0.6"/>
  <circle cx="70" cy="45" r="3" fill="currentColor" opacity="0.2"/>
  <circle cx="72" cy="46" r="1" fill="white" opacity="0.5"/>
  <circle cx="120" cy="15" r="5" fill="currentColor" opacity="0.2"/>
  <circle cx="123" cy="17" r="2" fill="white" opacity="0.5"/>
  <circle cx="155" cy="60" r="2.5" fill="currentColor" opacity="0.2"/>
  <circle cx="156" cy="61" r="0.8" fill="white" opacity="0.5"/>
  <circle cx="40" cy="80" r="3.5" fill="currentColor" opacity="0.18"/>
  <circle cx="42" cy="81" r="1.2" fill="white" opacity="0.5"/>
  <circle cx="180" cy="30" r="2" fill="currentColor" opacity="0.15"/>
  <circle cx="90" cy="95" r="4.5" fill="currentColor" opacity="0.15"/>
  <circle cx="93" cy="97" r="1.8" fill="white" opacity="0.4"/>
  <circle cx="145" cy="100" r="2" fill="currentColor" opacity="0.12"/>
  <circle cx="10" cy="50" r="1.5" fill="currentColor" opacity="0.18"/>
  <circle cx="175" cy="85" r="3" fill="currentColor" opacity="0.15"/>
  <circle cx="177" cy="86" r="1" fill="white" opacity="0.4"/>
</svg>```.text

// 6. VINE TENDRIL — Small ascending growth line for stats
#let _vine-tendril-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 40">
  <path d="M10,38 Q10,28 12,22 Q14,16 11,10 Q8,5 10,2" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <path d="M12,22 Q16,20 18,16" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.6"/>
  <path d="M11,12 Q7,10 5,7" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.6"/>
  <circle cx="10" cy="2" r="1.5" fill="currentColor" opacity="0.5"/>
  <circle cx="18" cy="15" r="1" fill="currentColor" opacity="0.4"/>
  <circle cx="5" cy="6" r="1" fill="currentColor" opacity="0.4"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render iron arch at a given size and color
#let iron-arch(size: 200pt, color: palette.iron) = {
  image(bytes(_iron-arch-svg.replace("currentColor", color.to-hex())), width: size)
}

/// Render leaf vein network (full page background)
#let leaf-vein-bg(color: palette.primary) = {
  image(bytes(_leaf-vein-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%)
}

/// Render botanical corner piece
#let botanical-corner(size: 50pt, color: palette.primary) = {
  image(bytes(_botanical-corner-svg.replace("currentColor", color.to-hex())), width: size)
}

/// Render iron lattice divider strip
#let iron-lattice(width: 100%, color: palette.iron) = {
  box(width: width, image(bytes(_iron-lattice-svg.replace("currentColor", color.to-hex())), width: width, height: 10pt))
}

/// Render dewdrop scatter
#let dewdrops(size: 160pt, color: palette.primary) = {
  image(bytes(_dewdrop-svg.replace("currentColor", color.to-hex())), width: size)
}

/// Render vine tendril (small, for stats)
#let vine-tendril(height: 28pt, color: palette.primary) = {
  image(bytes(_vine-tendril-svg.replace("currentColor", color.to-hex())), height: height)
}


// ═══ Background Atmosphere ═══
// Every content slide lives INSIDE the greenhouse. You look up and see iron arches.
// The leaf vein pattern is the living structure behind everything.

#let _greenhouse-atmosphere() = {
  // Layer 1: Leaf vein network covering entire background at very low opacity
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_leaf-vein-svg.replace("currentColor", palette.primary.transparentize(30%).to-hex())), width: 100%, height: 100%, fit: "cover")))
  // Layer 2: Iron arch at top — looking up through the greenhouse roof
  place(top + center, dy: -20pt,
    box(width: 85%,
      image(bytes(_iron-arch-svg.replace("currentColor", palette.iron.transparentize(88%).to-hex())), width: 100%)))
  // Layer 3: Subtle botanical corner in bottom-right
  place(bottom + right, dx: -8pt, dy: -4pt,
    botanical-corner(size: 38pt, color: palette.primary.transparentize(88%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — greenhouse atmosphere, iron bar header, botanical footer
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Thin iron bar at very top (the iron frame rail)
    block(width: 100%, height: 2.5pt, fill: palette.iron.transparentize(20%))
    // Title area
    show: components.cell.with(inset: (x: 2em, top: 0.5em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.dark, size: 1.35em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Organic green accent — like a small vine
      block(width: 55pt, height: 2.5pt, fill: palette.primary, radius: 1.25pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none { utils.call-or-display(self, self.store.footer) },
      {
        // Small leaf-dot separator (like a tiny seed)
        box(width: 8pt, height: 8pt)[
          #place(center + horizon, circle(radius: 3pt, fill: palette.primary.transparentize(50%)))
          #place(center + horizon, circle(radius: 1.2pt, fill: palette.primary.transparentize(20%)))
        ]
      },
      {
        set std.align(right)
        context text(size: 0.85em, fill: palette.text-light)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // THE WORLD: greenhouse atmosphere on every content slide
    _greenhouse-atmosphere()
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

/// Title slide — full greenhouse entrance: iron arch frame, glass panes, botanical corners, dewdrops
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm greenhouse light gradient
    place(top + left, block(
      width: 100%, height: 100%,
      fill: gradient.linear(palette.bg, palette.glass, palette.bg, angle: 150deg),
    ))
    // Full-page leaf vein at very subtle opacity (the living structure)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_leaf-vein-svg.replace("currentColor", palette.primary.transparentize(50%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Grand iron arch — the entrance to the greenhouse
    place(top + center, dy: 5pt,
      iron-arch(size: 320pt, color: palette.iron.transparentize(60%)))
    // Botanical corners (top-left and bottom-right) — fern fronds
    place(top + left, dx: 15pt, dy: 15pt,
      botanical-corner(size: 60pt, color: palette.primary.transparentize(45%)))
    place(bottom + right, dx: -15pt, dy: -15pt,
      rotate(180deg, botanical-corner(size: 60pt, color: palette.primary.transparentize(45%))))
    // Dewdrops on glass — scattered across top area
    place(top + right, dx: -30pt, dy: 25pt,
      dewdrops(size: 140pt, color: palette.primary.transparentize(20%)))
    // Glass pane vertical lines (like the iron mullions of the greenhouse)
    place(left, dx: 40pt, block(width: 0.8pt, height: 100%, fill: palette.iron.transparentize(85%)))
    place(right, dx: -40pt, block(width: 0.8pt, height: 100%, fill: palette.iron.transparentize(85%)))
    // Iron lattice strip at bottom
    place(bottom, dy: -50pt,
      box(width: 60%, iron-lattice(color: palette.iron.transparentize(70%))))
    // Center content card — like a botanical specimen label on a stand
    set std.align(center + horizon)
    block(
      width: 62%,
      fill: white.transparentize(5%),
      stroke: (
        top: 3.5pt + palette.primary,
        rest: 0.6pt + palette.border,
      ),
      radius: (bottom: 5pt),
      inset: (x: 2.5em, y: 2em),
    )[
      #set std.align(center)
      // Title
      #text(size: 2.2em, weight: "bold", fill: palette.dark, info.title)
      #v(0.3em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 0.9em, fill: palette.text-body, info.subtitle)
        v(0.4em)
      }
      // Iron lattice mini divider
      #std.align(center, iron-lattice(width: 120pt, color: palette.iron.transparentize(40%)))
      #v(0.4em)
      // Author
      #if info.author != none {
        text(size: 1em, weight: "bold", fill: palette.dark, info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.text-body, info.institution)
        v(0.15em)
      }
      // Date
      #if info.date != none {
        v(0.15em)
        text(size: 0.75em, fill: palette.text-light)[#utils.display-info-date(self)]
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

/// Section slide — deep forest green, ghosted iron arch, terracotta accent bar
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
    // Deep forest green gradient background
    place(top + left, block(
      width: 100%, height: 100%,
      fill: gradient.linear(palette.dark, palette.primary.darken(15%), angle: 140deg),
    ))
    // Ghosted iron arch (top right) — structural reminder
    place(top + right, dx: -20pt, dy: 10pt,
      iron-arch(size: 200pt, color: white.transparentize(92%)))
    // Leaf vein pattern ghosted across
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_leaf-vein-svg.replace("currentColor", rgb("#ffffff").transparentize(94%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Terracotta accent bar on left
    place(left, dx: 40pt, dy: 0pt,
      block(width: 4pt, height: 40%, fill: palette.accent, radius: 2pt))
    // Botanical corner bottom-left
    place(bottom + left, dx: 30pt, dy: -20pt,
      botanical-corner(size: 50pt, color: white.transparentize(88%)))
    // Section content — vertically centered via place+horizon
    place(left + horizon, dx: 5.5em,
      block(width: 60%)[
        #set text(fill: white, size: 2.2em, weight: "bold")
        #utils.display-current-heading(level: 1)
        #v(0.3em)
        // Terracotta accent bar below
        #block(width: 65pt, height: 3pt, fill: palette.accent, radius: 1.5pt)
      ]
    )
    // Iron lattice strip at bottom
    place(bottom, dy: -15pt,
      box(width: 50%, iron-lattice(color: white.transparentize(85%))))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — dramatic dark green, large ghosted arch, centered message
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.dark,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Ghosted iron arch — large, centered
    place(center + horizon,
      iron-arch(size: 340pt, color: white.transparentize(92%)))
    // Dewdrops scattered (like condensation on the glass in early morning)
    place(top + left, dx: 20pt, dy: 20pt,
      dewdrops(size: 120pt, color: white.transparentize(70%)))
    place(bottom + right, dx: -30pt, dy: -15pt,
      dewdrops(size: 100pt, color: white.transparentize(75%)))
    // Botanical corners
    place(top + right, dx: -15pt, dy: 15pt,
      rotate(90deg, botanical-corner(size: 35pt, color: white.transparentize(85%))))
    place(bottom + left, dx: 15pt, dy: -15pt,
      rotate(-90deg, botanical-corner(size: 35pt, color: white.transparentize(85%))))
    // Main content
    set text(fill: white, size: 1.8em, weight: "bold")
    set std.align(horizon + center)
    block(width: 80%, inset: (x: 1em))[
      #body
      #v(0.4em)
      #std.align(center, block(width: 80pt, height: 2.5pt, fill: palette.accent, radius: 1.25pt))
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — bookends with title: greenhouse light, iron arch, botanical corners, dewdrops
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
    // Same warm gradient as title (bookending)
    place(top + left, block(
      width: 100%, height: 100%,
      fill: gradient.linear(palette.bg, palette.glass, palette.bg, angle: 150deg),
    ))
    // Leaf vein background (matching title)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_leaf-vein-svg.replace("currentColor", palette.primary.transparentize(50%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Iron arch above (matching title — bookend element)
    place(top + center, dy: 10pt,
      iron-arch(size: 280pt, color: palette.iron.transparentize(65%)))
    // Botanical corners (matching title — bookend element)
    place(top + left, dx: 15pt, dy: 15pt,
      botanical-corner(size: 55pt, color: palette.primary.transparentize(50%)))
    place(bottom + right, dx: -15pt, dy: -15pt,
      rotate(180deg, botanical-corner(size: 55pt, color: palette.primary.transparentize(50%))))
    // Dewdrops on glass (matching title)
    place(top + right, dx: -25pt, dy: 20pt,
      dewdrops(size: 130pt, color: palette.primary.transparentize(25%)))
    // Iron lattice at bottom (matching title)
    place(bottom, dy: -45pt,
      box(width: 55%, iron-lattice(color: palette.iron.transparentize(65%))))
    // Center farewell
    set std.align(center + horizon)
    block(
      width: 52%,
      fill: white.transparentize(5%),
      stroke: (
        top: 3.5pt + palette.primary,
        rest: 0.6pt + palette.border,
      ),
      radius: (bottom: 5pt),
      inset: (x: 2em, y: 1.8em),
    )[
      #set std.align(center)
      #text(size: 2.2em, weight: "bold", fill: palette.dark, body)
      #v(0.3em)
      #std.align(center, iron-lattice(width: 100pt, color: palette.iron.transparentize(40%)))
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Pane card — Glass pane style with thin iron-grey border and botanical corner SVG in top-right
#let pane-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: white,
    stroke: (top: 2pt + accent, left: 0.5pt + palette.iron.transparentize(60%), right: 0.5pt + palette.iron.transparentize(60%), bottom: 0.5pt + palette.iron.transparentize(60%)),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 3pt),
  )[
    // Tiny botanical corner in top-right
    #place(top + right, dx: 2pt, dy: -2pt,
      botanical-corner(size: 22pt, color: accent.transparentize(70%)))
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Growth stat — Number with vine tendril SVG growing up from it
#let growth-stat(label, value, trend: none, accent: palette.primary, compact: false) = {
  block(
    width: 100%,
    fill: white,
    stroke: (left: 3pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1em, y: if compact { 0.5em } else { 0.7em }),
    radius: (right: 3pt),
  )[
    #stack(
      spacing: .8em,
      text(fill: palette.text-light, size: 0.75em, label),
      stack(dir: ltr, spacing: 4pt,
        {
          set text(fill: accent, size: 1.8em, weight: "bold")
          value
        },
        place(bottom, vine-tendril(height: 22pt, color: accent.transparentize(40%))),
      ),
      if trend != none { text(fill: palette.text-light, size: 0.7em, trend) },
      lazy-v(1fr),
    )
  ]
}

/// Specimen quote — Styled like a botanical specimen label: small caps title, italic text, iron border below
#let specimen-quote(body, attribution: none) = {
  block(width: 100%,
    stack(spacing: 0pt,
      // Top line (like specimen label border)
      block(width: 100%, height: 0.8pt, fill: palette.iron.transparentize(50%)),
      v(2pt),
      // Content area with opaque fill for readability
      block(
        width: 100%,
        fill: white,
        inset: (x: 1.5em, y: 1em),
      )[
        #set text(fill: palette.text-dark, size: 0.9em, style: "italic")
        #body
        #if attribution != none {
          v(6pt)
          set text(size: 0.78em, style: "normal", fill: palette.accent, weight: "bold")
          text(tracking: 0.5pt, upper(attribution))
        }
      ],
      // Bottom border (iron rule)
      block(width: 100%, height: 0.8pt, fill: palette.iron.transparentize(50%)),
    )
  )
}

/// Propagation box — Segmented top like a seed tray (multiple thin sections)
#let propagation-box(title, body, accent: palette.primary, compact: false) = {
  block(
    width: 100%,
    fill: white,
    stroke: (rest: 0.5pt + accent.lighten(50%)),
    inset: 0pt,
    radius: 3pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Segmented top strip (seed tray dividers)
      grid(columns: (1fr,) * 7, column-gutter: 2pt,
        ..range(7).map(_ => block(height: 3.5pt, fill: accent.transparentize(30%), width: 100%))
      ),
      // Content area with opaque background
      block(width: 100%, fill: accent.lighten(93%), inset: (x: 1em, y: if compact { 0.55em } else { 0.8em }))[
        #stack(
          spacing: .8em,
          text(weight: "bold", fill: accent.darken(10%), size: 0.92em, title),
          {
            set text(fill: palette.text-body, size: 0.82em)
            body
          },
          lazy-v(1fr),
        )
      ],
    )
  ]
}

/// Seed tag — Small circular tag on a "stick" like a plant marker
#let seed-tag(label, accent: palette.primary) = {
  box(
    fill: accent.lighten(88%),
    stroke: 0.8pt + accent.lighten(30%),
    inset: (x: 8pt, y: 4pt),
    radius: 10pt,
  )[
    #set text(fill: accent.darken(10%), size: 0.75em, weight: "bold")
    #label
  ]
}

/// Trellis divider — Iron lattice SVG diamond pattern (NOT a straight line)
#let trellis-divider(color: palette.iron) = {
  v(0.5em)
  std.align(center, iron-lattice(width: 80%, color: color.transparentize(30%)))
  v(0.5em)
}

/// Conservatory highlight — Content framed by iron arch SVG OVER the content
#let conservatory-highlight(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: white,
    stroke: 0.5pt + palette.border,
    inset: (x: 1.2em, top: 1.8em, bottom: 1em),
    radius: (top: 10pt, bottom: 3pt),
  )[
    // Iron arch placed OVER the content as a frame
    #place(top + center, dy: -1.2em,
      iron-arch(size: 100%, color: accent.transparentize(80%)))
    // Title with accent
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Fern card — Card with botanical corner SVG and subtle glass-green background
#let fern-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: rgb("#F4F9F3"),
    stroke: (left: 2.5pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 3pt),
  )[
    // Botanical corner in background
    #place(bottom + right, dx: 4pt, dy: 4pt,
      rotate(180deg, botanical-corner(size: 35pt, color: accent.transparentize(80%))))
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent.darken(5%), size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Botanical table — Data table with deep fern header and alternating glass-tinted rows
#let botanical-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.dark }
      else if calc.odd(row) { white } else { palette.glass },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.45em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, size: 0.82em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.82em, c)),
  )
}

/// Bloom box (alias) — propagation-box in bloom/pink accent
#let bloom-box(title, body) = propagation-box(title, body, accent: palette.bloom)

/// Terracotta box (alias) — propagation-box in terracotta accent
#let terracotta-box(title, body) = propagation-box(title, body, accent: palette.accent)


// ═══ 3. Theme Entry Point ═══

#let greenhouse-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 19pt, fill: palette.text-body)

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
      primary: palette.primary,
      neutral-lightest: white,
      neutral-darkest: palette.dark,
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
