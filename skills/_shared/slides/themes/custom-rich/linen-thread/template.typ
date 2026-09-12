// Linen Thread Theme — Handwoven textile/fabric aesthetic with natural fiber warmth
// Crosshatch woven patterns, thread-line borders, stitch marks, weaving shuttle motifs
// Light theme with indigo/terracotta/sage palette on natural cream background
// Best for: Humanities, social science, textile/material research, cultural studies, education
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  cream: rgb("#FDFBF7"),           // Background — natural off-white/cream
  primary: rgb("#2C4F7C"),         // Primary — indigo blue
  secondary: rgb("#B85C3C"),       // Secondary — terracotta/rust
  accent: rgb("#6B8E6B"),          // Accent — sage green
  text-dark: rgb("#2E2B26"),       // Main heading text — warm charcoal
  text-body: rgb("#4A4540"),       // Body text — warm dark grey
  text-muted: rgb("#706960"),      // Muted/caption text — AA on cream, card, and linen
  card: rgb("#FFFFFF"),            // Card backgrounds
  border: rgb("#E2DAD0"),          // Warm border color
  linen: rgb("#F4EFE7"),           // Linen fill — slightly darker cream for layering
)


// === SVG Definitions ===

// Woven texture SVG — full-page crosshatch pattern with alternating thread-like lines
// Horizontal and vertical interlocking with varying opacity for depth
#let _woven-texture-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <!-- Horizontal warp threads — organic waviness -->
  <path d="M0,20 C40,18 80,22 120,20 C160,18 200,22 240,20 C280,18 320,22 360,20 C400,18 440,22 480,20 C520,18 560,22 600,20 C640,18 680,22 720,20 C760,18 800,20 800,20" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,45 C50,43 100,47 150,45 C200,43 250,47 300,45 C350,43 400,47 450,45 C500,43 550,47 600,45 C650,43 700,47 750,45 C800,43 800,45 800,45" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,70 C45,68 90,72 135,70 C180,68 225,72 270,70 C315,68 360,72 405,70 C450,68 495,72 540,70 C585,68 630,72 675,70 C720,68 765,72 800,70" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,95 C55,93 110,97 165,95 C220,93 275,97 330,95 C385,93 440,97 495,95 C550,93 605,97 660,95 C715,93 770,97 800,95" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,120 C60,118 120,122 180,120 C240,118 300,122 360,120 C420,118 480,122 540,120 C600,118 660,122 720,120 C780,118 800,120 800,120" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,145 C42,143 84,147 126,145 C168,143 210,147 252,145 C294,143 336,147 378,145 C420,143 462,147 504,145 C546,143 588,147 630,145 C672,143 714,147 756,145 C798,143 800,145 800,145" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,170 C48,168 96,172 144,170 C192,168 240,172 288,170 C336,168 384,172 432,170 C480,168 528,172 576,170 C624,168 672,172 720,170 C768,168 800,170 800,170" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,195 C52,193 104,197 156,195 C208,193 260,197 312,195 C364,193 416,197 468,195 C520,193 572,197 624,195 C676,193 728,197 780,195 C800,193 800,195 800,195" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,220 C44,218 88,222 132,220 C176,218 220,222 264,220 C308,218 352,222 396,220 C440,218 484,222 528,220 C572,218 616,222 660,220 C704,218 748,222 792,220 L800,220" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,245 C58,243 116,247 174,245 C232,243 290,247 348,245 C406,243 464,247 522,245 C580,243 638,247 696,245 C754,243 800,245 800,245" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,270 C46,268 92,272 138,270 C184,268 230,272 276,270 C322,268 368,272 414,270 C460,268 506,272 552,270 C598,268 644,272 690,270 C736,268 782,272 800,270" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,295 C53,293 106,297 159,295 C212,293 265,297 318,295 C371,293 424,297 477,295 C530,293 583,297 636,295 C689,293 742,297 795,295 L800,295" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,320 C41,318 82,322 123,320 C164,318 205,322 246,320 C287,318 328,322 369,320 C410,318 451,322 492,320 C533,318 574,322 615,320 C656,318 697,322 738,320 C779,318 800,320 800,320" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,345 C57,343 114,347 171,345 C228,343 285,347 342,345 C399,343 456,347 513,345 C570,343 627,347 684,345 C741,343 798,347 800,345" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,370 C43,368 86,372 129,370 C172,368 215,372 258,370 C301,368 344,372 387,370 C430,368 473,372 516,370 C559,368 602,372 645,370 C688,368 731,372 774,370 L800,370" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <path d="M0,395 C54,393 108,397 162,395 C216,393 270,397 324,395 C378,393 432,397 486,395 C540,393 594,397 648,395 C702,393 756,397 800,395" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,420 C47,418 94,422 141,420 C188,418 235,422 282,420 C329,418 376,422 423,420 C470,418 517,422 564,420 C611,418 658,422 705,420 C752,418 800,420 800,420" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.06"/>
  <!-- Vertical weft threads -->
  <path d="M35,0 C33,40 37,80 35,120 C33,160 37,200 35,240 C33,280 37,320 35,360 C33,400 37,440 35,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M85,0 C87,45 83,90 85,135 C87,180 83,225 85,270 C87,315 83,360 85,405 C87,440 85,450 85,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <path d="M135,0 C133,50 137,100 135,150 C133,200 137,250 135,300 C133,350 137,400 135,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M185,0 C187,42 183,84 185,126 C187,168 183,210 185,252 C187,294 183,336 185,378 C187,420 185,450 185,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <path d="M235,0 C233,48 237,96 235,144 C233,192 237,240 235,288 C233,336 237,384 235,432 C233,450 235,450 235,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M285,0 C287,44 283,88 285,132 C287,176 283,220 285,264 C287,308 283,352 285,396 C287,440 285,450 285,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <path d="M335,0 C333,46 337,92 335,138 C333,184 337,230 335,276 C333,322 337,368 335,414 C333,450 335,450 335,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M385,0 C387,50 383,100 385,150 C387,200 383,250 385,300 C387,350 383,400 385,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <path d="M435,0 C433,43 437,86 435,129 C433,172 437,215 435,258 C433,301 437,344 435,387 C433,430 435,450 435,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M485,0 C487,47 483,94 485,141 C487,188 483,235 485,282 C487,329 483,376 485,423 C487,450 485,450 485,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <path d="M535,0 C533,52 537,104 535,156 C533,208 537,260 535,312 C533,364 537,416 535,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M585,0 C587,41 583,82 585,123 C587,164 583,205 585,246 C587,287 583,328 585,369 C587,410 585,450 585,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <path d="M635,0 C633,49 637,98 635,147 C633,196 637,245 635,294 C633,343 637,392 635,441 L635,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M685,0 C687,46 683,92 685,138 C687,184 683,230 685,276 C687,322 683,368 685,414 C687,450 685,450 685,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
  <path d="M735,0 C733,44 737,88 735,132 C733,176 737,220 735,264 C733,308 737,352 735,396 C733,440 735,450 735,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M785,0 C787,50 783,100 785,150 C787,200 783,250 785,300 C787,350 783,400 785,450" fill="none" stroke="currentColor" stroke-width="0.3" opacity="0.035"/>
</svg>```.text

// Embroidery border SVG — ornamental frame with cross-stitch corner patterns (bookend element)
#let _embroidery-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <!-- Outer frame line -->
  <rect x="20" y="20" width="760" height="410" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.3" rx="1"/>
  <!-- Inner frame line -->
  <rect x="30" y="30" width="740" height="390" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.15" rx="1"/>
  <!-- Cross-stitch corner — top left -->
  <path d="M24,24 L36,36" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M36,24 L24,36" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M40,24 L52,36" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M52,24 L40,36" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M24,40 L36,52" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M36,40 L24,52" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <circle cx="30" cy="30" r="2" fill="currentColor" opacity="0.3"/>
  <circle cx="46" cy="30" r="1.5" fill="currentColor" opacity="0.2"/>
  <circle cx="30" cy="46" r="1.5" fill="currentColor" opacity="0.2"/>
  <!-- Cross-stitch corner — top right -->
  <path d="M764,24 L776,36" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M776,24 L764,36" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M748,24 L760,36" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M760,24 L748,36" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M764,40 L776,52" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M776,40 L764,52" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <circle cx="770" cy="30" r="2" fill="currentColor" opacity="0.3"/>
  <circle cx="754" cy="30" r="1.5" fill="currentColor" opacity="0.2"/>
  <circle cx="770" cy="46" r="1.5" fill="currentColor" opacity="0.2"/>
  <!-- Cross-stitch corner — bottom left -->
  <path d="M24,414 L36,426" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M36,414 L24,426" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M40,414 L52,426" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M52,414 L40,426" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M24,398 L36,410" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M36,398 L24,410" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <circle cx="30" cy="420" r="2" fill="currentColor" opacity="0.3"/>
  <circle cx="46" cy="420" r="1.5" fill="currentColor" opacity="0.2"/>
  <circle cx="30" cy="404" r="1.5" fill="currentColor" opacity="0.2"/>
  <!-- Cross-stitch corner — bottom right -->
  <path d="M764,414 L776,426" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M776,414 L764,426" stroke="currentColor" stroke-width="1.8" opacity="0.45" stroke-linecap="round"/>
  <path d="M748,414 L760,426" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M760,414 L748,426" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M764,398 L776,410" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <path d="M776,398 L764,410" stroke="currentColor" stroke-width="1.4" opacity="0.35" stroke-linecap="round"/>
  <circle cx="770" cy="420" r="2" fill="currentColor" opacity="0.3"/>
  <circle cx="754" cy="420" r="1.5" fill="currentColor" opacity="0.2"/>
  <circle cx="770" cy="404" r="1.5" fill="currentColor" opacity="0.2"/>
  <!-- Running stitch along top edge -->
  <path d="M70,20 L80,20 M90,20 L100,20 M110,20 L120,20 M130,20 L140,20" stroke="currentColor" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <path d="M660,20 L670,20 M680,20 L690,20 M700,20 L710,20 M720,20 L730,20" stroke="currentColor" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <!-- Running stitch along bottom edge -->
  <path d="M70,430 L80,430 M90,430 L100,430 M110,430 L120,430 M130,430 L140,430" stroke="currentColor" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
  <path d="M660,430 L670,430 M680,430 L690,430 M700,430 L710,430 M720,430 L730,430" stroke="currentColor" stroke-width="1" opacity="0.2" stroke-linecap="round"/>
</svg>```.text

// Thread divider SVG — horizontal line that looks like a pulled thread with fraying ends
#let _thread-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <!-- Main pulled thread -->
  <path d="M20,8 C40,7 60,9 80,8 C100,7 120,9 140,8 C160,7 180,9 200,8 C220,7 240,9 260,8 C270,7 280,8 280,8" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.5"/>
  <!-- Secondary thinner thread -->
  <path d="M30,8 C50,9.5 70,6.5 90,8 C110,9.5 130,6.5 150,8 C170,9.5 190,6.5 210,8 C230,9.5 250,6.5 270,8" fill="none" stroke="currentColor" stroke-width="0.6" stroke-linecap="round" opacity="0.3"/>
  <!-- Left fraying ends -->
  <path d="M20,8 C15,5 8,4 2,3" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.35"/>
  <path d="M20,8 C14,8 8,9 3,10" fill="none" stroke="currentColor" stroke-width="0.6" stroke-linecap="round" opacity="0.25"/>
  <path d="M20,8 C16,11 10,13 5,14" fill="none" stroke="currentColor" stroke-width="0.5" stroke-linecap="round" opacity="0.2"/>
  <!-- Right fraying ends -->
  <path d="M280,8 C285,5 292,4 298,3" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.35"/>
  <path d="M280,8 C286,8 292,9 297,10" fill="none" stroke="currentColor" stroke-width="0.6" stroke-linecap="round" opacity="0.25"/>
  <path d="M280,8 C284,11 290,13 295,14" fill="none" stroke="currentColor" stroke-width="0.5" stroke-linecap="round" opacity="0.2"/>
  <!-- Stitch marks along thread -->
  <circle cx="60" cy="8" r="1.2" fill="currentColor" opacity="0.3"/>
  <circle cx="120" cy="8" r="1.2" fill="currentColor" opacity="0.3"/>
  <circle cx="180" cy="8" r="1.2" fill="currentColor" opacity="0.3"/>
  <circle cx="240" cy="8" r="1.2" fill="currentColor" opacity="0.3"/>
</svg>```.text

// Stitch accent SVG — small running-stitch decoration for headers
#let _stitch-accent-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="12" viewBox="0 0 80 12">
  <path d="M2,6 L10,6 M14,6 L22,6 M26,6 L34,6 M38,6 L46,6 M50,6 L58,6 M62,6 L70,6 M74,6 L80,6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" opacity="0.6"/>
  <circle cx="12" cy="6" r="1" fill="currentColor" opacity="0.4"/>
  <circle cx="24" cy="6" r="1" fill="currentColor" opacity="0.4"/>
  <circle cx="36" cy="6" r="1" fill="currentColor" opacity="0.4"/>
  <circle cx="48" cy="6" r="1" fill="currentColor" opacity="0.4"/>
  <circle cx="60" cy="6" r="1" fill="currentColor" opacity="0.4"/>
  <circle cx="72" cy="6" r="1" fill="currentColor" opacity="0.4"/>
  <path d="M0,2 L4,6 L0,10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3" stroke-linecap="round"/>
  <path d="M80,2 L76,6 L80,10" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3" stroke-linecap="round"/>
</svg>```.text

// Weaving shuttle motif — small decorative shuttle/bobbin icon
#let _shuttle-motif-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="20" viewBox="0 0 40 20">
  <ellipse cx="20" cy="10" rx="16" ry="6" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5"/>
  <ellipse cx="20" cy="10" rx="10" ry="3.5" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.35"/>
  <line x1="4" y1="10" x2="0" y2="10" stroke="currentColor" stroke-width="0.8" opacity="0.4" stroke-linecap="round"/>
  <line x1="36" y1="10" x2="40" y2="10" stroke="currentColor" stroke-width="0.8" opacity="0.4" stroke-linecap="round"/>
  <circle cx="20" cy="10" r="2" fill="currentColor" opacity="0.4"/>
  <path d="M12,10 C14,8 16,8 18,10 C16,12 14,12 12,10" fill="currentColor" opacity="0.2"/>
  <path d="M22,10 C24,8 26,8 28,10 C26,12 24,12 22,10" fill="currentColor" opacity="0.2"/>
  <line x1="8" y1="7" x2="8" y2="13" stroke="currentColor" stroke-width="0.5" opacity="0.25"/>
  <line x1="32" y1="7" x2="32" y2="13" stroke="currentColor" stroke-width="0.5" opacity="0.25"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render woven texture background (full-page)
#let woven-texture-bg(color: palette.primary) = {
  let svg = _woven-texture-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render embroidery frame border
#let embroidery-frame(color: palette.primary) = {
  let svg = _embroidery-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render thread divider
#let thread-divider-img(color: palette.primary, width: 60%) = {
  let svg = _thread-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 10pt)))
}

/// Render stitch accent
#let stitch-accent-img(color: palette.secondary, size: 60pt) = {
  let svg = _stitch-accent-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: 9pt))
}

/// Render shuttle motif
#let shuttle-motif(color: palette.primary, size: 30pt) = {
  let svg = _shuttle-motif-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size * 0.5))
}


// === Background Atmosphere ===

/// Persistent woven texture + stitch accents on every content slide
#let _bg-atmosphere() = {
  // Full-page woven texture
  place(top + left, box(width: 100%, height: 100%, woven-texture-bg(color: palette.primary)))
  // Subtle stitch accent — top right corner
  place(top + right, dx: -2em, dy: 0.8em,
    stitch-accent-img(color: palette.secondary.transparentize(40%), size: 50pt))
  // Small shuttle motif — bottom left
  place(bottom + left, dx: 1.5em, dy: -0.8em,
    shuttle-motif(color: palette.primary.transparentize(50%), size: 24pt))
}


// === 1. Slide Functions ===

/// Content slide — cream bg, woven texture, indigo header with stitch underline
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
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Terracotta stitch accent underline
      stitch-accent-img(color: palette.secondary, size: 55pt),
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
        // Shuttle motif as center decoration
        shuttle-motif(color: palette.primary.transparentize(30%), size: 22pt)
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

/// Title slide — embroidery frame, woven texture, cross-stitch corners (bookend element)
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Woven texture background
    place(top + left, box(width: 100%, height: 100%, woven-texture-bg(color: palette.primary)))
    // Embroidery frame border (bookend element)
    place(top + left, box(width: 100%, height: 100%, embroidery-frame(color: palette.primary)))
    // Shuttle motifs flanking center
    place(left + horizon, dx: 3em,
      shuttle-motif(color: palette.secondary.transparentize(20%), size: 36pt))
    place(right + horizon, dx: -3em,
      shuttle-motif(color: palette.secondary.transparentize(20%), size: 36pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 6em)[
      #stack(
        spacing: .8em,
        // Title
        text(size: 2.3em, weight: "bold", fill: palette.text-dark, info.title),
        // Subtitle
        if info.subtitle != none {
          text(size: 1em, fill: palette.text-muted, info.subtitle)
        },
        // Thread divider
        thread-divider-img(color: palette.secondary, width: 35%),
        // Presentation metadata
        stack(
          spacing: .8em,
          if info.author != none {
            text(size: 1.05em, weight: "medium", fill: palette.primary, info.author)
          },
          if info.institution != none {
            text(size: 0.82em, fill: palette.text-muted, info.institution)
          },
          if info.date != none {
            text(size: 0.78em, fill: palette.text-muted, utils.display-info-date(self))
          },
        ),
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

/// Section slide — indigo left panel with shuttle motif, terracotta accent
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
    // Woven texture background
    place(top + left, box(width: 100%, height: 100%, woven-texture-bg(color: palette.primary)))
    // Left indigo strip
    place(top + left, block(width: 28%, height: 100%, fill: palette.primary.transparentize(92%)))
    // Vertical terracotta thread line
    place(left, dx: 27.5%, block(width: 2pt, height: 100%, fill: palette.secondary.transparentize(40%)))
    // Shuttle motif in left panel
    place(left + horizon, dx: 3.5em,
      shuttle-motif(color: palette.secondary.transparentize(10%), size: 38pt))
    // Stitch accent top-right
    place(top + right, dx: -2.5em, dy: 2.5em,
      stitch-accent-img(color: palette.accent.transparentize(30%), size: 55pt))
    // Section number
    place(left + top, dx: 3em, dy: 2.5em,
      text(size: 3.5em, weight: "bold", fill: palette.primary.transparentize(60%),
        utils.display-current-heading-number(level: 1, numbering: "01")))
    // Section title
    pad(left: 34%, right: 4em, top: 4em, bottom: 3em)[
      #align(left + horizon)[
        #stack(
          spacing: .8em,
          {
            set text(fill: palette.text-dark, size: 1.8em, weight: "semibold")
            utils.display-current-heading(level: 1, numbered: false)
          },
          stitch-accent-img(color: palette.secondary, size: 55pt),
        )
      ]
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — structured TOC with stitch decoration
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
    place(top + left, box(width: 100%, height: 100%, woven-texture-bg(color: palette.primary)))
    // Shuttle motif decoration
    place(top + right, dx: -2em, dy: 1em,
      shuttle-motif(color: palette.secondary.transparentize(30%), size: 32pt))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "semibold", fill: palette.text-dark)
        title
      },
      stitch-accent-img(color: palette.secondary, size: 55pt),
      {
        set text(size: 1.1em, fill: palette.text-body)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — indigo background, cream text, centered with embroidery accents
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle woven texture on dark bg
    place(top + left, box(width: 100%, height: 100%,
      woven-texture-bg(color: palette.cream.transparentize(50%))))
    // Stitch accents at corners
    place(top + left, dx: 1em, dy: 1em,
      stitch-accent-img(color: palette.secondary.transparentize(20%), size: 50pt))
    place(bottom + right, dx: -1em, dy: -1em,
      stitch-accent-img(color: palette.secondary.transparentize(20%), size: 50pt))
    // Shuttle motifs flanking
    place(left + horizon, dx: 1.5em,
      shuttle-motif(color: palette.cream.transparentize(40%), size: 28pt))
    place(right + horizon, dx: -1.5em,
      shuttle-motif(color: palette.cream.transparentize(40%), size: 28pt))
    // Frame border
    place(center + horizon,
      rect(width: 88%, height: 76%, stroke: 1.2pt + palette.cream.transparentize(55%), radius: 2pt, fill: none))
    // Main text
    set text(fill: palette.cream, size: 2em, weight: "semibold")
    set std.align(horizon + center)
    block(width: 78%, inset: (x: 1em))[
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — embroidery frame (bookend with title), woven texture, farewell
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
    // Woven texture
    place(top + left, box(width: 100%, height: 100%, woven-texture-bg(color: palette.primary)))
    // Embroidery frame (bookend with title slide)
    place(top + left, box(width: 100%, height: 100%, embroidery-frame(color: palette.primary)))
    // Shuttle motifs
    place(top + right, dx: -3.5em, dy: 3.5em,
      shuttle-motif(color: palette.secondary.transparentize(20%), size: 32pt))
    place(bottom + left, dx: 3.5em, dy: -3.5em,
      shuttle-motif(color: palette.secondary.transparentize(20%), size: 32pt))
    // Center content
    set std.align(center + horizon)
    stack(
      spacing: 0.8em,
      text(size: 2.2em, weight: "semibold", fill: palette.text-dark, body),
      thread-divider-img(color: palette.secondary, width: 28%),
      stack(dir: ltr, spacing: 10pt,
        shuttle-motif(color: palette.secondary.transparentize(20%), size: 24pt),
        shuttle-motif(color: palette.accent.transparentize(30%), size: 20pt),
        shuttle-motif(color: palette.secondary.transparentize(20%), size: 24pt),
      ),
    )
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// weave-card — card with crosshatch border pattern (colored header strip + white body)
#let weave-card(title, body, accent: palette.primary) = {
  block(width: 100%, fill: palette.card, radius: 6pt, clip: true)[
    #stack(spacing: 0pt,
      block(
        width: 100%,
        fill: palette.linen,
        stroke: (top: 3pt + accent, left: 0.75pt + palette.border, right: 0.75pt + palette.border),
        inset: (x: 1.2em, y: 0.6em),
        radius: (top: 6pt),
      )[
        #text(weight: "semibold", fill: accent, size: 0.95em, title)
      ],
      block(
        width: 100%,
        fill: palette.card,
        stroke: (bottom: 0.75pt + palette.border, left: 0.75pt + palette.border, right: 0.75pt + palette.border),
        inset: (x: 1.2em, y: 0.9em),
        radius: (bottom: 6pt),
      )[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// thread-box — insight/highlight box with thread-pull left border
#let thread-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(90%),
    stroke: (left: 3.5pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 5pt),
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent.darken(15%), size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      ],
      lazy-v(1fr),
    )
  ]
}

/// sampler-stat — metric display with embroidery-frame accent
#let sampler-stat(value, label, accent: palette.secondary) = {
  block(
    width: 100%,
    height: 136pt,
    fill: palette.card,
    stroke: 0.75pt + palette.border,
    inset: (x: 1em, y: 0.9em),
    radius: 6pt,
  )[
    #align(center + horizon)[
      #stack(
        spacing: .8em,
        // Stitch decoration above value
        stitch-accent-img(color: accent.transparentize(40%), size: 40pt),
        text(size: 2em, weight: "bold", fill: accent, value),
        text(size: 0.78em, fill: palette.text-muted, label),
      )
    ]
  ]
}

/// loom-quote — quote with woven texture background
#let loom-quote(body, source) = {
  block(
    width: 100%,
    fill: palette.linen,
    stroke: (left: 2.5pt + palette.primary),
    inset: (left: 1.4em, right: 1.2em, y: 1em),
    radius: (right: 5pt),
  )[
    // Decorative quote mark
    #place(top + left, dx: -0.8em, dy: -0.3em,
      text(size: 2.5em, fill: palette.primary.transparentize(50%), weight: "bold")[\u{201C}])
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text-body, size: 0.88em, style: "italic")
        body
      },
      {
        set text(fill: palette.text-muted, size: 0.78em, weight: "medium", style: "normal")
        source
      },
      lazy-v(1fr),
    )
  ]
}

/// stitch-tag — small tag with cross-stitch border
#let stitch-tag(label, color: palette.accent) = {
  box(
    fill: color.lighten(85%),
    stroke: 0.75pt + color.lighten(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(10%), size: 0.75em, weight: "medium")
    #label
  ]
}

/// fiber-divider — thread-based decorative separator
#let fiber-divider(width: 60%) = {
  thread-divider-img(color: palette.primary, width: width)
}

/// tapestry-box — large feature box with all-around woven border
#let tapestry-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 3pt + accent, bottom: 3pt + accent, left: 1.5pt + palette.border, right: 1.5pt + palette.border),
    inset: (x: 1.4em, y: 1.1em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        shuttle-motif(color: accent.transparentize(30%), size: 20pt),
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

/// bobbin-list — scoped native enum styling with bobbin/spool indicators
#let bobbin-list(body, accent: palette.primary) = {
  block(width: 100%, inset: (y: 0.3em))[
    #set text(fill: palette.text-body, size: 0.82em)
    #set enum(
      numbering: n => box(
        baseline: 0.55em,
        circle(
          radius: 12pt,
          fill: accent.lighten(82%),
          stroke: 1.5pt + accent,
          std.align(center + horizon,
            text(size: 0.75em, weight: "bold", fill: accent, str(n))),
        ),
      ),
      indent: 0pt,
      body-indent: 0.8em,
      spacing: 0.45em,
      number-align: center + horizon,
    )
    #body
    #lazy-v(1fr)
  ]
}

/// pattern-card — card with repeating weave motif header
#let pattern-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 2.5pt + accent, rest: 0.75pt + palette.border),
    inset: (x: 1.2em, y: 1em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        rect(width: 6pt, height: 6pt, fill: accent, radius: 1pt),
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


// === 3. Theme Entry Point ===

#let linen-thread-theme(
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
      primary: palette.primary,
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
