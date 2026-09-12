// Canvas Weave Theme — Woven fabric/canvas texture aesthetic with warm earth tones
// Natural fibers woven into structured patterns: organic warmth meets geometric precision
// Features: crosshatch weave patterns, thread/fiber SVG lines, loom frame decorations, knot motifs
// Light theme with artisanal business feel. Suitable for craft brands, sustainable business,
// consulting, agency presentations.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  canvas-white: rgb("#FBF9F5"),     // Background — natural canvas white
  primary: rgb("#6B5B4E"),          // Primary — warm taupe/brown
  secondary: rgb("#A0784C"),        // Secondary — golden thread
  tertiary: rgb("#5B7B6B"),         // Tertiary — forest weave green
  text-dark: rgb("#2D2922"),        // Main heading text — deep charcoal brown
  text-body: rgb("#4A443B"),        // Body text — warm dark brown
  text-muted: rgb("#726860"),       // Muted/caption text — WCAG AA on light theme surfaces
  card: rgb("#FFFFFF"),             // Card backgrounds
  border: rgb("#DDD5C8"),           // Border — woven edge
  weave: rgb("#F2EDE5"),            // Canvas fill — weave background
)


// ═══ SVG Definitions ═══

// Woven crosshatch pattern — full-page background texture with interlacing threads
#let _crosshatch-weave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <path d="M0,25 C60,23 120,27 180,25 C240,23 300,27 360,25 C420,23 480,27 540,25 C600,23 660,27 720,25 C760,23 800,25 800,25" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.07"/>
  <path d="M0,55 C50,53 100,57 150,55 C200,53 250,57 300,55 C350,53 400,57 450,55 C500,53 550,57 600,55 C650,53 700,57 750,55 C780,53 800,55 800,55" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M0,85 C70,83 140,87 210,85 C280,83 350,87 420,85 C490,83 560,87 630,85 C700,83 770,87 800,85" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.07"/>
  <path d="M0,115 C55,113 110,117 165,115 C220,113 275,117 330,115 C385,113 440,117 495,115 C550,113 605,117 660,115 C715,113 770,117 800,115" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,145 C65,143 130,147 195,145 C260,143 325,147 390,145 C455,143 520,147 585,145 C650,143 715,147 780,145 C790,143 800,145 800,145" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.07"/>
  <path d="M0,175 C45,173 90,177 135,175 C180,173 225,177 270,175 C315,173 360,177 405,175 C450,173 495,177 540,175 C585,173 630,177 675,175 C720,173 765,177 800,175" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M0,205 C60,203 120,207 180,205 C240,203 300,207 360,205 C420,203 480,207 540,205 C600,203 660,207 720,205 C780,203 800,205 800,205" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.07"/>
  <path d="M0,235 C50,233 100,237 150,235 C200,233 250,237 300,235 C350,233 400,237 450,235 C500,233 550,237 600,235 C650,233 700,237 750,235 C790,233 800,235 800,235" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,265 C70,263 140,267 210,265 C280,263 350,267 420,265 C490,263 560,267 630,265 C700,263 770,267 800,265" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.07"/>
  <path d="M0,295 C55,293 110,297 165,295 C220,293 275,297 330,295 C385,293 440,297 495,295 C550,293 605,297 660,295 C715,293 770,297 800,295" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M0,325 C65,323 130,327 195,325 C260,323 325,327 390,325 C455,323 520,327 585,325 C650,323 715,327 780,325 C800,323 800,325 800,325" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.07"/>
  <path d="M0,355 C45,353 90,357 135,355 C180,353 225,357 270,355 C315,353 360,357 405,355 C450,353 495,357 540,355 C585,353 630,357 675,355 C720,353 765,357 800,355" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M0,385 C60,383 120,387 180,385 C240,383 300,387 360,385 C420,383 480,387 540,385 C600,383 660,387 720,385 C780,383 800,385 800,385" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.07"/>
  <path d="M0,415 C50,413 100,417 150,415 C200,413 250,417 300,415 C350,413 400,417 450,415 C500,413 550,417 600,415 C650,413 700,417 750,415 C790,413 800,415 800,415" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M40,0 C38,50 42,100 40,150 C38,200 42,250 40,300 C38,350 42,400 40,450" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M100,0 C102,45 98,90 100,135 C102,180 98,225 100,270 C102,315 98,360 100,405 C102,430 98,450 100,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M160,0 C158,55 162,110 160,165 C158,220 162,275 160,330 C158,385 162,440 160,450" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M220,0 C222,40 218,80 220,120 C222,160 218,200 220,240 C222,280 218,320 220,360 C222,400 218,440 220,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M280,0 C278,60 282,120 280,180 C278,240 282,300 280,360 C278,420 280,450 280,450" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M340,0 C342,50 338,100 340,150 C342,200 338,250 340,300 C342,350 338,400 340,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M400,0 C398,45 402,90 400,135 C398,180 402,225 400,270 C398,315 402,360 400,405 C398,430 400,450 400,450" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M460,0 C462,55 458,110 460,165 C462,220 458,275 460,330 C462,385 458,440 460,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M520,0 C518,40 522,80 520,120 C518,160 522,200 520,240 C518,280 522,320 520,360 C518,400 522,440 520,450" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M580,0 C582,60 578,120 580,180 C582,240 578,300 580,360 C582,420 580,450 580,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M640,0 C638,50 642,100 640,150 C638,200 642,250 640,300 C638,350 642,400 640,450" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M700,0 C702,45 698,90 700,135 C702,180 698,225 700,270 C702,315 698,360 700,405 C702,440 700,450 700,450" fill="none" stroke="currentColor" stroke-width="0.35" opacity="0.04"/>
  <path d="M760,0 C758,55 762,110 760,165 C758,220 762,275 760,330 C758,385 762,440 760,450" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
</svg>```.text

// Thread/fiber corner decoration — flowing thread lines in corners
#let _thread-corner-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <path d="M5,5 C15,8 25,15 30,25 C35,35 32,45 28,55 C24,65 22,75 25,85" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.4"/>
  <path d="M10,2 C18,6 28,12 34,20 C40,28 38,40 35,50 C32,60 30,70 33,80" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.25"/>
  <path d="M2,10 C8,18 14,28 18,38 C22,48 20,58 16,68 C12,78 14,88 18,98" fill="none" stroke="currentColor" stroke-width="0.6" stroke-linecap="round" opacity="0.2"/>
  <circle cx="5" cy="5" r="2" fill="currentColor" opacity="0.3"/>
  <circle cx="30" cy="25" r="1.5" fill="currentColor" opacity="0.2"/>
  <circle cx="25" cy="85" r="1.5" fill="currentColor" opacity="0.15"/>
  <path d="M8,3 C12,5 14,9 12,12" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.3"/>
  <ellipse cx="20" cy="45" rx="2" ry="3" fill="currentColor" opacity="0.1"/>
</svg>```.text

// Loom frame border — decorative rectangular frame with corner joins (for title/ending)
#let _loom-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <rect x="18" y="18" width="764" height="414" fill="none" stroke="currentColor" stroke-width="1.8" opacity="0.35" rx="1"/>
  <rect x="28" y="28" width="744" height="394" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.2" rx="1"/>
  <path d="M18,18 L18,50" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M18,18 L50,18" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <circle cx="18" cy="18" r="4" fill="currentColor" opacity="0.4"/>
  <path d="M22,22 L42,22" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M22,22 L22,42" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M782,18 L782,50" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M782,18 L750,18" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <circle cx="782" cy="18" r="4" fill="currentColor" opacity="0.4"/>
  <path d="M778,22 L758,22" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M778,22 L778,42" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M18,432 L18,400" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M18,432 L50,432" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <circle cx="18" cy="432" r="4" fill="currentColor" opacity="0.4"/>
  <path d="M22,428 L42,428" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M22,428 L22,408" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M782,432 L782,400" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M782,432 L750,432" fill="none" stroke="currentColor" stroke-width="2.5" opacity="0.5" stroke-linecap="round"/>
  <circle cx="782" cy="432" r="4" fill="currentColor" opacity="0.4"/>
  <path d="M778,428 L758,428" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M778,428 L778,408" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25"/>
  <path d="M60,18 C65,14 70,14 75,18 C80,22 85,22 90,18 C95,14 100,14 105,18" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.2"/>
  <path d="M700,18 C705,14 710,14 715,18 C720,22 725,22 730,18 C735,14 740,14 745,18" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.2"/>
  <path d="M60,432 C65,436 70,436 75,432 C80,428 85,428 90,432 C95,436 100,436 105,432" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.2"/>
  <path d="M700,432 C705,436 710,436 715,432 C720,428 725,428 730,432 C735,436 740,436 745,432" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.2"/>
</svg>```.text

// Knot motif — decorative woven knot for accents
#let _knot-motif-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
  <path d="M10,20 C10,12 15,8 20,8 C25,8 30,12 30,20 C30,28 25,32 20,32 C15,32 10,28 10,20" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
  <path d="M14,14 C18,10 22,10 26,14 C30,18 30,22 26,26 C22,30 18,30 14,26 C10,22 10,18 14,14" fill="none" stroke="currentColor" stroke-width="1" opacity="0.35"/>
  <path d="M20,8 C20,8 16,14 16,20 C16,26 20,32 20,32" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <path d="M20,8 C20,8 24,14 24,20 C24,26 20,32 20,32" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <path d="M10,20 C10,20 14,16 20,16 C26,16 30,20 30,20" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <path d="M10,20 C10,20 14,24 20,24 C26,24 30,20 30,20" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <circle cx="20" cy="20" r="2.5" fill="currentColor" opacity="0.4"/>
  <circle cx="20" cy="8" r="1.5" fill="currentColor" opacity="0.25"/>
  <circle cx="20" cy="32" r="1.5" fill="currentColor" opacity="0.25"/>
  <circle cx="10" cy="20" r="1.5" fill="currentColor" opacity="0.25"/>
  <circle cx="30" cy="20" r="1.5" fill="currentColor" opacity="0.25"/>
</svg>```.text

// Loom divider — horizontal woven pattern separator
#let _loom-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <path d="M0,8 C10,4 20,4 30,8 C40,12 50,12 60,8 C70,4 80,4 90,8 C100,12 110,12 120,8 C130,4 140,4 150,8 C160,12 170,12 180,8 C190,4 200,4 210,8 C220,12 230,12 240,8 C250,4 260,4 270,8 C280,12 290,12 300,8" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.5"/>
  <path d="M15,8 C25,11 35,11 45,8 C55,5 65,5 75,8 C85,11 95,11 105,8 C115,5 125,5 135,8 C145,11 155,11 165,8 C175,5 185,5 195,8 C205,11 215,11 225,8 C235,5 245,5 255,8 C265,11 275,11 285,8" fill="none" stroke="currentColor" stroke-width="0.7" stroke-linecap="round" opacity="0.3"/>
  <circle cx="30" cy="8" r="1.5" fill="currentColor" opacity="0.35"/>
  <circle cx="90" cy="8" r="1.5" fill="currentColor" opacity="0.35"/>
  <circle cx="150" cy="8" r="1.5" fill="currentColor" opacity="0.35"/>
  <circle cx="210" cy="8" r="1.5" fill="currentColor" opacity="0.35"/>
  <circle cx="270" cy="8" r="1.5" fill="currentColor" opacity="0.35"/>
  <rect x="58" y="6" width="4" height="4" fill="currentColor" opacity="0.2" rx="1"/>
  <rect x="118" y="6" width="4" height="4" fill="currentColor" opacity="0.2" rx="1"/>
  <rect x="178" y="6" width="4" height="4" fill="currentColor" opacity="0.2" rx="1"/>
  <rect x="238" y="6" width="4" height="4" fill="currentColor" opacity="0.2" rx="1"/>
</svg>```.text

// Thread swatch icon — small fabric swatch motif
#let _swatch-icon-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
  <rect x="2" y="2" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5" rx="2"/>
  <line x1="6" y1="2" x2="6" y2="22" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <line x1="10" y1="2" x2="10" y2="22" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <line x1="14" y1="2" x2="14" y2="22" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <line x1="18" y1="2" x2="18" y2="22" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <line x1="2" y1="7" x2="22" y2="7" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <line x1="2" y1="12" x2="22" y2="12" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <line x1="2" y1="17" x2="22" y2="17" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M2,2 L6,6" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.2"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render crosshatch weave background
#let crosshatch-bg(color: palette.primary) = {
  let svg = _crosshatch-weave-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render thread corner decoration
#let thread-corner(color: palette.secondary, size: 80pt) = {
  let svg = _thread-corner-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render loom frame border
#let loom-frame(color: palette.primary) = {
  let svg = _loom-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render knot motif
#let knot-motif(color: palette.secondary, size: 28pt) = {
  let svg = _knot-motif-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render loom divider
#let loom-divider-img(color: palette.primary, width: 60%) = {
  let svg = _loom-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 10pt)))
}

/// Render swatch icon
#let swatch-icon(color: palette.primary, size: 16pt) = {
  let svg = _swatch-icon-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}


// ═══ Background Atmosphere ═══

/// Persistent weave texture + thread corner decorations on every content slide
#let _bg-atmosphere() = {
  // Full-page crosshatch weave texture
  place(top + left, box(width: 100%, height: 100%, crosshatch-bg(color: palette.primary)))
  // Thread corner — top left
  place(top + left, dx: -0.3em, dy: -0.3em,
    thread-corner(color: palette.secondary.transparentize(40%), size: 60pt))
  // Thread corner — bottom right (rotated via mirroring effect)
  place(bottom + right, dx: 0.3em, dy: 0.3em,
    thread-corner(color: palette.tertiary.transparentize(50%), size: 50pt))
}


// ═══ 1. Slide Functions ═══

/// Content slide — canvas-white bg, weave texture, warm taupe header
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
      // Golden thread accent line
      block(width: 55pt, height: 2.5pt, fill: palette.secondary, radius: 1pt),
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
        // Woven knot dots
        stack(dir: ltr, spacing: 5pt,
          rect(width: 4pt, height: 4pt, fill: palette.secondary.transparentize(40%), radius: 1pt),
          rect(width: 5pt, height: 5pt, fill: palette.primary.transparentize(30%), radius: 1pt),
          rect(width: 4pt, height: 4pt, fill: palette.secondary.transparentize(40%), radius: 1pt),
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

/// Title slide — loom frame border, woven corners, centered artisanal text
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Crosshatch background texture
    place(top + left, box(width: 100%, height: 100%, crosshatch-bg(color: palette.primary)))
    // Loom frame border (bookending element)
    place(top + left, box(width: 100%, height: 100%, loom-frame(color: palette.primary)))
    // Thread corner decorations at all 4 corners
    place(top + left, dx: 1.5em, dy: 1.5em,
      thread-corner(color: palette.secondary.transparentize(20%), size: 90pt))
    place(bottom + right, dx: -1.5em, dy: -1.5em,
      thread-corner(color: palette.secondary.transparentize(20%), size: 90pt))
    // Knot motifs along the sides
    place(left + horizon, dx: 2.5em,
      knot-motif(color: palette.tertiary.transparentize(30%), size: 36pt))
    place(right + horizon, dx: -2.5em,
      knot-motif(color: palette.tertiary.transparentize(30%), size: 36pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 6em)[
      #v(1fr)
      // Title
      #text(size: 2.3em, weight: "bold", fill: palette.text-dark, info.title)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.text-muted, info.subtitle)
        v(0.5em)
      }
      // Loom divider
      #loom-divider-img(color: palette.secondary, width: 35%)
      #v(0.6em)
      // Author
      #if info.author != none {
        text(size: 1.05em, weight: "medium", fill: palette.primary, info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.82em, fill: palette.text-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.15em)
        text(size: 0.78em, fill: palette.text-muted)[#utils.display-info-date(self)]
      }
      #v(1fr)
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.canvas-white,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// Section slide — warm taupe left panel with woven accent, forest green typography
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
      fill: palette.canvas-white,
    ),
  )
  let main-body = {
    // Crosshatch background
    place(top + left, box(width: 100%, height: 100%, crosshatch-bg(color: palette.primary)))
    // Left taupe strip
    place(top + left, block(width: 28%, height: 100%, fill: palette.primary.transparentize(90%)))
    // Vertical golden thread line
    place(left, dx: 27.5%, block(width: 2pt, height: 100%, fill: palette.secondary.transparentize(40%)))
    // Knot motif in left panel
    place(left + horizon, dx: 3.5em,
      knot-motif(color: palette.secondary.transparentize(10%), size: 42pt))
    // Thread corner decoration top-right
    place(top + right, dx: -1em, dy: 1em,
      thread-corner(color: palette.tertiary.transparentize(40%), size: 70pt))
    // Section number
    place(left + top, dx: 3em, dy: 2.5em,
      text(size: 3.5em, weight: "bold", fill: palette.primary.transparentize(60%),
        utils.display-current-heading-number(level: 1, numbering: "01")))
    // Section title
    pad(left: 34%, right: 4em, top: 4em, bottom: 3em)[
      #v(1fr)
      #set text(fill: palette.text-dark, size: 1.8em, weight: "semibold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.4em)
      #block(width: 55pt, height: 2.5pt, fill: palette.secondary, radius: 1pt)
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — structured TOC with woven accent
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      fill: palette.canvas-white,
      margin: (x: 4em, y: 2.5em),
    ),
  )
  let main-body = {
    // Background atmosphere
    place(top + left, box(width: 100%, height: 100%, crosshatch-bg(color: palette.primary)))
    // Knot motif decoration
    place(top + right, dx: -2em, dy: 1em,
      knot-motif(color: palette.secondary.transparentize(30%), size: 34pt))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "semibold", fill: palette.text-dark)
        title
      },
      block(width: 55pt, height: 2.5pt, fill: palette.secondary, radius: 1pt),
      {
        v(0.4em)
        set text(size: 1.1em, fill: palette.text-body)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — primary taupe background, canvas-white text, centered with knot decoration
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
    // Subtle crosshatch on dark bg
    place(top + left, box(width: 100%, height: 100%,
      crosshatch-bg(color: palette.canvas-white.transparentize(50%))))
    // Knot motifs at corners
    place(top + left, dx: 1em, dy: 1em,
      knot-motif(color: palette.secondary.transparentize(30%), size: 30pt))
    place(bottom + right, dx: -1em, dy: -1em,
      knot-motif(color: palette.secondary.transparentize(30%), size: 30pt))
    // Subtle frame line
    place(center + horizon,
      rect(width: 88%, height: 76%, stroke: 1.2pt + palette.canvas-white.transparentize(55%), radius: 2pt, fill: none))
    // Main text
    set text(fill: palette.canvas-white, size: 2em, weight: "semibold")
    set std.align(horizon + center)
    block(width: 78%, inset: (x: 1em))[
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — canvas bg, loom frame (bookend with title), woven corners, farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.canvas-white,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Crosshatch texture
    place(top + left, box(width: 100%, height: 100%, crosshatch-bg(color: palette.primary)))
    // Loom frame (bookending with title slide)
    place(top + left, box(width: 100%, height: 100%, loom-frame(color: palette.primary)))
    // Woven corner threads (bookending element)
    place(top + left, dx: 1.5em, dy: 1.5em,
      thread-corner(color: palette.secondary.transparentize(20%), size: 90pt))
    place(bottom + right, dx: -1.5em, dy: -1.5em,
      thread-corner(color: palette.secondary.transparentize(20%), size: 90pt))
    // Knot motifs
    place(top + right, dx: -3em, dy: 3em,
      knot-motif(color: palette.tertiary.transparentize(20%), size: 32pt))
    place(bottom + left, dx: 3em, dy: -3em,
      knot-motif(color: palette.tertiary.transparentize(20%), size: 32pt))
    // Center content
    set std.align(center + horizon)
    stack(
      spacing: 0.8em,
      text(size: 2.2em, weight: "semibold", fill: palette.text-dark, body),
      loom-divider-img(color: palette.secondary, width: 28%),
      {
        v(0.2em)
        stack(dir: ltr, spacing: 10pt,
          knot-motif(color: palette.secondary.transparentize(20%), size: 22pt),
          knot-motif(color: palette.tertiary.transparentize(30%), size: 18pt),
          knot-motif(color: palette.secondary.transparentize(20%), size: 22pt),
        )
      },
    )
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Woven card — card with crosshatch pattern top border strip
#let woven-card(title, body, accent: palette.primary) = {
  block(width: 100%)[
    // Header with woven pattern fill
    #stack(spacing: 0pt,
      block(
        width: 100%,
        fill: palette.weave,
        stroke: (top: 3pt + accent, left: 0.75pt + palette.border, right: 0.75pt + palette.border),
        inset: (x: 1.2em, y: 0.6em),
        radius: (top: 6pt),
      )[
        #text(weight: "semibold", fill: accent.darken(15%), size: 0.95em, title)
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

/// Thread box — highlighted box with golden thread left accent and warm fill
#let thread-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(88%),
    stroke: (left: 3.5pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 5pt),
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent.darken(15%), size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Loom divider — SVG woven pattern divider component
#let loom-divider(width: 60%) = {
  loom-divider-img(color: palette.primary, width: width)
}

/// Fiber tag — small inline tag with swatch icon and thread styling
#let fiber-tag(label, color: palette.tertiary) = {
  box(
    fill: color.lighten(85%),
    stroke: 0.75pt + color.lighten(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(10%), size: 0.75em, weight: "medium")
    #stack(dir: ltr, spacing: 4pt,
      swatch-icon(color: color, size: 10pt),
      label,
    )
  ]
}

/// Metric card — KPI with woven knot SVG decoration
#let metric-card(value, label, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.75pt + palette.border,
    inset: (x: 1em, y: 0.9em),
    radius: 6pt,
  )[
    #set std.align(center)
    // Knot decoration above value
    #stack(
      spacing: 0.8em,
      knot-motif(color: accent.transparentize(40%), size: 18pt),
      text(size: 2em, weight: "bold", fill: accent, value),
      text(size: 0.78em, fill: palette.text-muted, label),
      lazy-v(1fr),
    )
  ]
}

/// Framework card — strategic framework container with structured header
#let framework-card(title, body, accent: palette.tertiary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 2.5pt + accent, rest: 0.75pt + palette.border),
    inset: (x: 1.2em, y: 1em),
    radius: 6pt,
  )[
    #stack(dir: ltr, spacing: 8pt,
      rect(width: 6pt, height: 6pt, fill: accent, radius: 1pt),
      text(weight: "semibold", fill: palette.text-dark, size: 0.95em, title),
    )
    #v(6pt)
    #set text(fill: palette.text-body, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// Insight box — callout with woven side pattern (double left border)
#let insight-box(title, body, accent: palette.tertiary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent),
    inset: (left: 1.4em, right: 1.2em, y: 0.9em),
    radius: (right: 5pt),
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent.darken(10%), size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Comparison table — business table with woven header accent
#let comparison-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.weave }
      else if calc.odd(row) { palette.card } else { palette.canvas-white },
    stroke: 0.5pt + palette.border,
    inset: (x: 1em, y: 0.6em),
    align: align,
    table.header(..headers.map(h => text(weight: "semibold", fill: palette.text-dark, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.82em, c)),
  )
}

/// Timeline card — timeline entry with thread markers
#let timeline-card(period, body, accent: palette.primary) = {
  block(width: 100%, inset: (y: 0.3em))[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      align: (center, left),
      // Thread marker
      {
        stack(
          spacing: 0pt,
          circle(radius: 14pt, fill: accent.lighten(80%), stroke: 1.8pt + accent)[
            #set text(size: 0.7em, weight: "bold", fill: accent)
            #std.align(center + horizon, period)
          ],
          // Vertical thread connector
          block(width: 1.8pt, height: 1.5em, fill: accent.transparentize(55%)),
        )
      },
      // Content
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
    )
  ]
}

/// Quote weave — quotation with woven SVG marks and fabric styling
#let quote-weave(body, source) = {
  block(
    width: 100%,
    fill: palette.weave,
    stroke: (left: 2.5pt + palette.secondary),
    inset: (left: 1.4em, right: 1.2em, y: 1em),
    radius: (right: 5pt),
  )[
    // Decorative quote mark
    #place(top + left, dx: -0.8em, dy: -0.3em,
      text(size: 2.5em, fill: palette.secondary.transparentize(50%), weight: "bold")[\u{201C}])
    #set text(fill: palette.text-body, size: 0.88em, style: "italic")
    #body
    #v(0.4em)
    #set text(fill: palette.text-muted, size: 0.78em, weight: "medium", style: "normal")
    #source
    #lazy-v(1fr)
  ]
}

/// Swatch note — borderless note with fabric swatch icon
#let swatch-note(body) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.4em))[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      align: (center, left),
      swatch-icon(color: palette.primary, size: 18pt),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let canvas-weave-theme(
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
      fill: palette.canvas-white,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: palette.canvas-white,
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
