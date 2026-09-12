// Herbarium Press Theme — Botanical Specimen Preservation Aesthetic
// Visual world: pressed flowers, natural history museums, Victorian-era botanical illustration
// Delicate, scientific, beautiful — like opening a centuries-old herbarium cabinet
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FAF7F0"),             // warm cream/aged paper
  primary: rgb("#2D5016"),        // deep forest green
  secondary: rgb("#8B9F6F"),      // dried sage
  accent: rgb("#9B6B7D"),         // pressed rose/mauve
  text: rgb("#3D3226"),           // sepia text
  text-light: rgb("#6B5D52"),     // lighter sepia
  text-muted: rgb("#7A6D63"),     // accessible muted warm grey
  card: rgb("#F5F1E8"),           // slightly darker cream for cards
  border: rgb("#D4C9B8"),         // warm border
  label-bg: rgb("#FFFDF8"),       // specimen label white
  vein: rgb("#C4D4A8"),           // leaf vein green (very soft)
)

// ═══ SVG Definitions ═══

// 1. SPECIMEN SHEET BACKGROUND — Full-page with faint leaf vein patterns,
//    paper fiber texture dots, and mounting tape corner marks.
//    30+ path/shape elements creating the herbarium sheet texture.
#let _specimen-sheet-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 600">
  <circle cx="45" cy="32" r="0.8" fill="currentColor" opacity="0.15"/>
  <circle cx="120" cy="78" r="0.6" fill="currentColor" opacity="0.12"/>
  <circle cx="230" cy="45" r="0.7" fill="currentColor" opacity="0.1"/>
  <circle cx="340" cy="112" r="0.5" fill="currentColor" opacity="0.14"/>
  <circle cx="480" cy="67" r="0.9" fill="currentColor" opacity="0.08"/>
  <circle cx="590" cy="134" r="0.6" fill="currentColor" opacity="0.12"/>
  <circle cx="710" cy="89" r="0.7" fill="currentColor" opacity="0.1"/>
  <circle cx="155" cy="210" r="0.5" fill="currentColor" opacity="0.13"/>
  <circle cx="620" cy="245" r="0.8" fill="currentColor" opacity="0.09"/>
  <circle cx="380" cy="320" r="0.6" fill="currentColor" opacity="0.11"/>
  <circle cx="90" cy="410" r="0.7" fill="currentColor" opacity="0.1"/>
  <circle cx="520" cy="480" r="0.5" fill="currentColor" opacity="0.12"/>
  <circle cx="700" cy="520" r="0.6" fill="currentColor" opacity="0.08"/>
  <circle cx="260" cy="560" r="0.8" fill="currentColor" opacity="0.1"/>
  <path d="M80,520 Q200,440 350,380 Q500,320 650,240 Q720,200 760,160" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.12" stroke-linecap="round"/>
  <path d="M150,480 Q220,440 300,400" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.09"/>
  <path d="M250,440 Q320,400 400,360" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.08"/>
  <path d="M380,380 Q440,340 520,300" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.08"/>
  <path d="M500,320 Q560,280 630,250" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.07"/>
  <path d="M600,270 Q650,240 700,210" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.07"/>
  <path d="M180,460 Q195,450 210,460" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M310,410 Q325,398 340,408" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M440,350 Q458,338 470,348" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M570,290 Q585,278 600,288" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <path d="M660,230 Q678,218 690,228" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.05"/>
  <path d="M20,20 L20,55" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <path d="M20,20 L55,20" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <path d="M780,20 L780,55" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <path d="M780,20 L745,20" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <path d="M20,580 L20,545" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <path d="M20,580 L55,580" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <path d="M780,580 L780,545" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <path d="M780,580 L745,580" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.18" stroke-linecap="round"/>
  <circle cx="410" cy="150" r="0.4" fill="currentColor" opacity="0.1"/>
  <circle cx="185" cy="340" r="0.5" fill="currentColor" opacity="0.09"/>
  <circle cx="640" cy="400" r="0.6" fill="currentColor" opacity="0.08"/>
  <circle cx="300" cy="180" r="0.4" fill="currentColor" opacity="0.11"/>
  <circle cx="550" cy="550" r="0.5" fill="currentColor" opacity="0.09"/>
</svg>```.text

// 2. BOTANICAL FRAME — Ornamental border with pressed leaf silhouettes in corners,
//    delicate vine runners along edges. Used as bookend frame on title/ending.
//    25+ elements.
#let _botanical-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 600">
  <path d="M60,30 L740,30" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.4"/>
  <path d="M60,570 L740,570" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.4"/>
  <path d="M30,60 L30,540" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.4"/>
  <path d="M770,60 L770,540" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.4"/>
  <path d="M30,30 Q45,30 60,30" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M30,30 Q30,45 30,60" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M35,35 Q55,40 70,55" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <ellipse cx="52" cy="48" rx="12" ry="6" fill="currentColor" opacity="0.08" transform="rotate(-40,52,48)"/>
  <path d="M52,48 Q52,42 52,36" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
  <path d="M770,30 Q755,30 740,30" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M770,30 Q770,45 770,60" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M765,35 Q745,40 730,55" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <ellipse cx="748" cy="48" rx="12" ry="6" fill="currentColor" opacity="0.08" transform="rotate(40,748,48)"/>
  <path d="M748,48 Q748,42 748,36" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
  <path d="M30,570 Q45,570 60,570" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M30,570 Q30,555 30,540" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M35,565 Q55,560 70,545" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <ellipse cx="52" cy="552" rx="12" ry="6" fill="currentColor" opacity="0.08" transform="rotate(40,52,552)"/>
  <path d="M770,570 Q755,570 740,570" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M770,570 Q770,555 770,540" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M765,565 Q745,560 730,545" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <ellipse cx="748" cy="552" rx="12" ry="6" fill="currentColor" opacity="0.08" transform="rotate(-40,748,552)"/>
  <path d="M120,28 Q160,22 200,28 Q240,34 280,28 Q320,22 360,28 Q400,34 440,28 Q480,22 520,28 Q560,34 600,28 Q640,22 680,28" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.2"/>
  <ellipse cx="200" cy="24" rx="5" ry="3" fill="currentColor" opacity="0.06" transform="rotate(-15,200,24)"/>
  <ellipse cx="360" cy="24" rx="5" ry="3" fill="currentColor" opacity="0.06" transform="rotate(15,360,24)"/>
  <ellipse cx="520" cy="24" rx="5" ry="3" fill="currentColor" opacity="0.06" transform="rotate(-15,520,24)"/>
  <path d="M120,572 Q160,578 200,572 Q240,566 280,572 Q320,578 360,572 Q400,566 440,572 Q480,578 520,572 Q560,566 600,572 Q640,578 680,572" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.2"/>
  <ellipse cx="240" cy="576" rx="5" ry="3" fill="currentColor" opacity="0.06" transform="rotate(15,240,576)"/>
  <ellipse cx="440" cy="576" rx="5" ry="3" fill="currentColor" opacity="0.06" transform="rotate(-15,440,576)"/>
  <ellipse cx="600" cy="576" rx="5" ry="3" fill="currentColor" opacity="0.06" transform="rotate(15,600,576)"/>
</svg>```.text

// 3. LEAF DIVIDER — Horizontal line decorated with small pressed leaf/stem elements
//    10+ elements.
#let _leaf-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 24">
  <line x1="0" y1="12" x2="300" y2="12" stroke="currentColor" stroke-width="0.6" opacity="0.4"/>
  <ellipse cx="150" cy="12" rx="10" ry="4.5" fill="currentColor" opacity="0.2" transform="rotate(-5,150,12)"/>
  <path d="M140,12 L160,12" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.35"/>
  <path d="M145,12 Q147,9 150,12" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.25"/>
  <path d="M155,12 Q153,15 150,12" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.25"/>
  <ellipse cx="75" cy="11" rx="7" ry="3" fill="currentColor" opacity="0.15" transform="rotate(-12,75,11)"/>
  <path d="M68,11 L82,11" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.3"/>
  <path d="M75,14 L75,18" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.2"/>
  <ellipse cx="225" cy="13" rx="7" ry="3" fill="currentColor" opacity="0.15" transform="rotate(12,225,13)"/>
  <path d="M218,13 L232,13" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.3"/>
  <path d="M225,10 L225,6" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.2"/>
  <circle cx="40" cy="12" r="1.2" fill="currentColor" opacity="0.2"/>
  <circle cx="110" cy="12" r="1" fill="currentColor" opacity="0.18"/>
  <circle cx="190" cy="12" r="1" fill="currentColor" opacity="0.18"/>
  <circle cx="260" cy="12" r="1.2" fill="currentColor" opacity="0.2"/>
</svg>```.text

// 4. SPECIMEN LABEL — Small rectangular frame like an actual herbarium specimen label
//    12+ elements.
#let _specimen-label-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 80">
  <rect x="4" y="4" width="192" height="72" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5" rx="2"/>
  <rect x="8" y="8" width="184" height="64" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.3" rx="1"/>
  <line x1="15" y1="25" x2="185" y2="25" stroke="currentColor" stroke-width="0.4" opacity="0.2"/>
  <line x1="15" y1="40" x2="185" y2="40" stroke="currentColor" stroke-width="0.4" opacity="0.2"/>
  <line x1="15" y1="55" x2="185" y2="55" stroke="currentColor" stroke-width="0.4" opacity="0.2"/>
  <path d="M12,12 L12,18 M12,12 L18,12" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.35"/>
  <path d="M188,12 L188,18 M188,12 L182,12" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.35"/>
  <path d="M12,68 L12,62 M12,68 L18,68" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.35"/>
  <path d="M188,68 L188,62 M188,68 L182,68" fill="none" stroke="currentColor" stroke-width="0.7" opacity="0.35"/>
  <ellipse cx="100" cy="15" rx="6" ry="2.5" fill="currentColor" opacity="0.12"/>
  <path d="M94,15 L106,15" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.2"/>
  <path d="M80,65 Q100,62 120,65" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render specimen sheet background (full page)
#let _specimen-sheet-bg(color: palette.primary) = {
  image(bytes(_specimen-sheet-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%)
}

/// Render botanical frame (full page bookend)
#let _botanical-frame(color: palette.primary) = {
  image(bytes(_botanical-frame-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%)
}

/// Render leaf divider strip
#let _leaf-divider-graphic(width: 100%, color: palette.primary) = {
  box(width: width, image(bytes(_leaf-divider-svg.replace("currentColor", color.to-hex())), width: width, height: 14pt))
}

/// Render specimen label frame
#let _specimen-label-graphic(width: 140pt, color: palette.text) = {
  image(bytes(_specimen-label-svg.replace("currentColor", color.to-hex())), width: width)
}


// ═══ Components ═══

// 1. Specimen Card — Card with mounting-corner bracket decoration
#let specimen-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.label-bg,
    stroke: 0.6pt + palette.border,
    inset: (x: 1.2em, y: 0.9em),
    radius: 1pt,
  )[
    // Mounting corner brackets
    #place(top + left, dx: -3pt, dy: -3pt,
      box(width: 10pt, height: 10pt)[
        #place(top + left, line(length: 8pt, angle: 0deg, stroke: 1pt + accent.transparentize(40%)))
        #place(top + left, line(length: 8pt, angle: 90deg, stroke: 1pt + accent.transparentize(40%)))
      ])
    #place(top + right, dx: 3pt, dy: -3pt,
      box(width: 10pt, height: 10pt)[
        #place(top + right, line(length: 8pt, angle: 180deg, stroke: 1pt + accent.transparentize(40%)))
        #place(top + right, line(length: 8pt, angle: 90deg, stroke: 1pt + accent.transparentize(40%)))
      ])
    #place(bottom + left, dx: -3pt, dy: 3pt,
      box(width: 10pt, height: 10pt)[
        #place(bottom + left, line(length: 8pt, angle: 0deg, stroke: 1pt + accent.transparentize(40%)))
        #place(bottom + left, line(length: 8pt, angle: -90deg, stroke: 1pt + accent.transparentize(40%)))
      ])
    #place(bottom + right, dx: 3pt, dy: 3pt,
      box(width: 10pt, height: 10pt)[
        #place(bottom + right, line(length: 8pt, angle: 180deg, stroke: 1pt + accent.transparentize(40%)))
        #place(bottom + right, line(length: 8pt, angle: -90deg, stroke: 1pt + accent.transparentize(40%)))
      ])
    // Title
    #stack(
      spacing: .8em,
      text(weight: "semibold", fill: accent.darken(25%), size: 0.9em, title),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}


// 2. Botanical Box — Insight/highlight box with leaf-vein left border pattern
#let botanical-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: white,
    stroke: (left: 3pt + accent, rest: 0.5pt + palette.border.transparentize(30%)),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 2pt),
  )[
    // Faint leaf vein decoration in background
    #place(top + right, dx: -4pt, dy: 2pt,
      box(width: 30pt, height: 20pt,
        image(bytes(_leaf-divider-svg.replace("currentColor", accent.transparentize(80%).to-hex())), width: 30pt)))
    #stack(
      spacing: .8em,
      text(weight: "semibold", fill: accent.darken(25%), size: 0.9em, title),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}


// 3. Collection Stat — Metric display with specimen-label framing
#let collection-stat(label, value, note: none, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.label-bg,
    stroke: (
      top: 1.5pt + accent,
      bottom: 1.5pt + accent,
      left: 0.5pt + palette.border,
      right: 0.5pt + palette.border,
    ),
    inset: (x: 1em, y: 0.7em),
    radius: 1pt,
  )[
    #stack(
      spacing: 0.8em,
      text(fill: palette.text-muted, size: 0.72em, upper(label)),
      text(fill: accent.darken(25%), size: 1.65em, weight: "semibold", value),
      if note != none {
        text(fill: palette.text-light, size: 0.7em, weight: "regular", note)
      },
      lazy-v(1fr),
    )
  ]
}


// 4. Pressed Quote — Quote with botanical illustration accent
#let pressed-quote(body, attribution: none) = {
  block(width: 100%)[
    #stack(
      spacing: 0.8em,
      block(width: 100%, height: 0.8pt, fill: palette.secondary.transparentize(30%)),
      block(
        width: 100%,
        fill: palette.label-bg,
        inset: (x: 1.8em, y: 0.5em),
      )[
        #place(top + left, dx: -1em, dy: 0pt,
          text(fill: palette.secondary.darken(25%), size: 1.5em)[,, ])
        #stack(
          spacing: 0.8em,
          {
            set text(fill: palette.text, size: 0.88em, style: "italic")
            body
          },
          if attribution != none {
            text(
              size: 0.76em,
              style: "normal",
              fill: palette.accent.darken(15%),
              weight: "semibold",
              tracking: 0.5pt,
              upper(attribution),
            )
          },
        )
      ],
      block(width: 100%, height: 0.8pt, fill: palette.secondary.transparentize(30%)),
    )
  ]
}


// 5. Genus Tag — Taxonomic-style italic label tag
#let genus-tag(label, accent: palette.primary) = {
  box(
    fill: accent.lighten(90%),
    stroke: 0.6pt + accent.lighten(40%),
    inset: (x: 8pt, y: 4pt),
    radius: 2pt,
  )[
    #set text(fill: accent.darken(25%), size: 0.75em, style: "italic", weight: "medium")
    #label
  ]
}


// 6. Vine Divider — Delicate botanical separator using the leaf divider SVG
#let vine-divider(color: palette.secondary) = {
  pad(y: 0.15em, std.align(center, _leaf-divider-graphic(width: 75%, color: color.transparentize(10%))))
}


// 7. Field Note — Observation box styled like a naturalist's field note
#let field-note(title, body, accent: palette.text-light) = {
  block(
    width: 100%,
    fill: rgb("#FFFEF9"),
    stroke: (
      left: 2pt + palette.accent,
      rest: 0.5pt + palette.border.transparentize(20%),
    ),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 2pt),
  )[
    // Faint horizontal lines like a notebook
    #place(top + left, dx: 0pt, dy: 24pt,
      block(width: 100%, height: 0.4pt, fill: palette.border.transparentize(60%)))
    #place(top + left, dx: 0pt, dy: 42pt,
      block(width: 100%, height: 0.4pt, fill: palette.border.transparentize(60%)))
    #place(top + left, dx: 0pt, dy: 60pt,
      block(width: 100%, height: 0.4pt, fill: palette.border.transparentize(60%)))
    // Title styled like field observation header
    #stack(
      spacing: 0.8em,
      text(weight: "semibold", fill: palette.accent.darken(15%), size: 0.88em)[#sym.diamond.filled #title],
      [
        #set text(fill: palette.text, size: 0.8em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}


// 8. Classification Table — Taxonomy-style data display
#let classification-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary.lighten(85%) }
      else if calc.odd(row) { palette.label-bg } else { white },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "semibold", fill: palette.primary, size: 0.8em, h))),
    ..rows.flatten().map(c => text(fill: palette.text, size: 0.8em, c)),
  )
}


// 9. Petal Card — Soft card with pressed-flower-inspired gradient
#let petal-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: gradient.linear(accent.lighten(92%), palette.label-bg, angle: 135deg),
    stroke: (top: 2pt + accent, rest: 0.5pt + accent.lighten(60%)),
    inset: (x: 1.2em, y: 0.6em),
    radius: (bottom: 3pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "semibold", fill: accent.darken(15%), size: 0.9em, title),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}


// ═══ Slide Functions ═══

// Background Atmosphere — Every content slide sits on aged paper with faint botanical impressions
#let _herbarium-atmosphere() = {
  // Layer 1: Specimen sheet background (full page, very subtle leaf veins + fiber dots)
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_specimen-sheet-svg.replace("currentColor", palette.primary.transparentize(20%).to-hex())), width: 100%, height: 100%, fit: "cover")))
  // Layer 2: Faint mounting corner brackets in slide corners
  place(top + left, dx: 12pt, dy: 12pt,
    box(width: 14pt, height: 14pt)[
      #place(top + left, line(length: 10pt, angle: 0deg, stroke: 0.8pt + palette.border.transparentize(40%)))
      #place(top + left, line(length: 10pt, angle: 90deg, stroke: 0.8pt + palette.border.transparentize(40%)))
    ])
  place(top + right, dx: -12pt, dy: 12pt,
    box(width: 14pt, height: 14pt)[
      #place(top + right, line(length: 10pt, angle: 180deg, stroke: 0.8pt + palette.border.transparentize(40%)))
      #place(top + right, line(length: 10pt, angle: 90deg, stroke: 0.8pt + palette.border.transparentize(40%)))
    ])
  place(bottom + left, dx: 12pt, dy: -12pt,
    box(width: 14pt, height: 14pt)[
      #place(bottom + left, line(length: 10pt, angle: 0deg, stroke: 0.8pt + palette.border.transparentize(40%)))
      #place(bottom + left, line(length: 10pt, angle: -90deg, stroke: 0.8pt + palette.border.transparentize(40%)))
    ])
  place(bottom + right, dx: -12pt, dy: -12pt,
    box(width: 14pt, height: 14pt)[
      #place(bottom + right, line(length: 10pt, angle: 180deg, stroke: 0.8pt + palette.border.transparentize(40%)))
      #place(bottom + right, line(length: 10pt, angle: -90deg, stroke: 0.8pt + palette.border.transparentize(40%)))
    ])
}


// Standard Content Slide
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Thin sepia rule at very top (like the edge of a specimen sheet)
    block(width: 100%, height: 1.5pt, fill: palette.border.transparentize(30%))
    // Title area
    show: components.cell.with(inset: (x: 2em, top: 0.5em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.primary, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Leaf-vein accent line beneath title
      block(width: 50pt, height: 2pt, fill: palette.secondary, radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none { utils.call-or-display(self, self.store.footer) },
      {
        // Small leaf dot separator
        box(width: 6pt, height: 6pt)[
          #place(center + horizon, circle(radius: 2.5pt, fill: palette.secondary.transparentize(40%)))
        ]
      },
      {
        set std.align(right)
        context text(size: 0.85em, fill: palette.text-muted)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // Herbarium atmosphere on every content slide
    _herbarium-atmosphere()
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


// Title Slide — Full botanical frame bookend
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Aged paper base
    place(top + left, block(
      width: 100%, height: 100%,
      fill: gradient.linear(palette.bg, rgb("#F7F3EA"), palette.bg, angle: 135deg),
    ))
    // Full-page specimen sheet background (leaf veins, fiber dots, corner marks)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_specimen-sheet-svg.replace("currentColor", palette.primary.transparentize(30%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Botanical frame — the bookend ornamental border
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_botanical-frame-svg.replace("currentColor", palette.primary.transparentize(30%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Leaf divider above content area
    place(top + center, dy: 80pt,
      box(width: 45%, _leaf-divider-graphic(color: palette.secondary.transparentize(20%))))
    // Leaf divider below content area
    place(bottom + center, dy: -75pt,
      box(width: 45%, _leaf-divider-graphic(color: palette.secondary.transparentize(20%))))
    // Center content — specimen label style card
    set std.align(center + horizon)
    block(
      width: 58%,
      fill: palette.label-bg,
      stroke: (
        top: 2.5pt + palette.primary,
        rest: 0.6pt + palette.border,
      ),
      radius: 2pt,
      inset: (x: 2.5em, y: 2em),
    )[
      #set std.align(center)
      // Title
      #text(size: 2em, weight: "bold", fill: palette.primary, info.title)
      #v(0.3em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 0.85em, fill: palette.text-light, info.subtitle)
        v(0.4em)
      }
      // Small leaf divider
      #std.align(center, _leaf-divider-graphic(width: 100pt, color: palette.secondary.transparentize(10%)))
      #v(0.4em)
      // Author
      #if info.author != none {
        text(size: 1em, weight: "semibold", fill: palette.text, info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.78em, fill: palette.text-light, info.institution)
        v(0.15em)
      }
      // Date
      #if info.date != none {
        v(0.15em)
        text(size: 0.72em, fill: palette.text-muted)[#utils.display-info-date(self)]
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


// Section Slide — Deep forest green, ghosted leaf veins, specimen label styling
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
    // Deep forest green gradient
    place(top + left, block(
      width: 100%, height: 100%,
      fill: gradient.linear(palette.primary, palette.primary.darken(20%), angle: 150deg),
    ))
    // Ghosted leaf veins on green
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_specimen-sheet-svg.replace("currentColor", rgb("#ffffff").transparentize(92%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Accent bar on left (pressed rose)
    place(left, dx: 45pt,
      block(width: 3pt, height: 35%, fill: palette.accent, radius: 1.5pt))
    // Specimen label frame ghosted (top-right)
    place(top + right, dx: -40pt, dy: 30pt,
      box(width: 120pt,
        image(bytes(_specimen-label-svg.replace("currentColor", rgb("#ffffff").transparentize(85%).to-hex())), width: 120pt)))
    // In-flow section content keeps Touying's empty-slide detector accurate.
    std.align(left + horizon,
      pad(left: 5.5em, right: 30%)[
        #stack(
          spacing: 0.8em,
          text(fill: white, size: 2em, weight: "semibold", utils.display-current-heading(level: 1)),
          block(width: 55pt, height: 2.5pt, fill: palette.accent, radius: 1.25pt),
        )
      ]
    )
    // Leaf divider at bottom
    place(bottom + center, dy: -20pt,
      box(width: 40%, _leaf-divider-graphic(color: white.transparentize(80%))))
  }
  touying-slide(self: self, main-body)
})


// Focus Slide — Dramatic dark background with botanical accents
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.text,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Ghosted specimen sheet
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_specimen-sheet-svg.replace("currentColor", rgb("#ffffff").transparentize(92%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Accent leaf divider at top
    place(top + center, dy: 25pt,
      box(width: 35%, _leaf-divider-graphic(color: palette.accent.transparentize(50%))))
    // Accent leaf divider at bottom
    place(bottom + center, dy: -25pt,
      box(width: 35%, _leaf-divider-graphic(color: palette.accent.transparentize(50%))))
    // Main content
    set text(fill: white, size: 1.7em, weight: "semibold")
    set std.align(horizon + center)
    block(width: 75%, inset: (x: 1em))[
      #body
      #v(0.3em)
      #std.align(center, block(width: 65pt, height: 2pt, fill: palette.accent, radius: 1pt))
    ]
  }
  touying-slide(self: self, main-body)
})


// Ending Slide — Bookend with title: same botanical frame, specimen sheet, leaf dividers
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
    // Same aged paper gradient as title (bookend)
    place(top + left, block(
      width: 100%, height: 100%,
      fill: gradient.linear(palette.bg, rgb("#F7F3EA"), palette.bg, angle: 135deg),
    ))
    // Full-page specimen sheet background (matching title)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_specimen-sheet-svg.replace("currentColor", palette.primary.transparentize(30%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Botanical frame — bookend matching title slide
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_botanical-frame-svg.replace("currentColor", palette.primary.transparentize(30%).to-hex())), width: 100%, height: 100%, fit: "cover")))
    // Leaf dividers (matching title)
    place(top + center, dy: 85pt,
      box(width: 40%, _leaf-divider-graphic(color: palette.secondary.transparentize(20%))))
    place(bottom + center, dy: -80pt,
      box(width: 40%, _leaf-divider-graphic(color: palette.secondary.transparentize(20%))))
    // Center farewell content
    set std.align(center + horizon)
    block(
      width: 50%,
      fill: palette.label-bg,
      stroke: (
        top: 2.5pt + palette.primary,
        rest: 0.6pt + palette.border,
      ),
      radius: 2pt,
      inset: (x: 2em, y: 1.8em),
    )[
      #set std.align(center)
      #text(size: 2em, weight: "bold", fill: palette.primary, body)
      #v(0.3em)
      #std.align(center, _leaf-divider-graphic(width: 90pt, color: palette.secondary))
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ Theme Entry Point ═══

#let herbarium-press-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text)

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
      neutral-darkest: palette.text,
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
