// Porcelain Theme -- Chinese Blue-and-White Porcelain (青花瓷)
// Ming dynasty Jingdezhen aesthetic: cobalt blue on white glaze
// Lattice borders, cloud scrolls, peonies, waves, porcelain vessels
// Every slide feels like the surface of a porcelain vessel
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  ming: (
    bg: rgb("#FEFDFB"),
    ink: rgb("#1E4D8C"),
    label: rgb("#3F628F"),
    accent: rgb("#B8860B"),
    secondary: rgb("#2B5EA7"),
    dark: rgb("#0F2A52"),
    dark-deep: rgb("#091B38"),
  ),
  celadon: (
    bg: rgb("#FAFAF5"),
    ink: rgb("#4A7C6F"),
    label: rgb("#315E54"),
    accent: rgb("#8B7536"),
    secondary: rgb("#5A9A8B"),
    dark: rgb("#193D35"),
    dark-deep: rgb("#102A24"),
  ),
  rouge: (
    bg: rgb("#FFFDF8"),
    ink: rgb("#8B2323"),
    label: rgb("#8B3F3F"),
    accent: rgb("#B8860B"),
    secondary: rgb("#A03030"),
    dark: rgb("#511C1C"),
    dark-deep: rgb("#310E0E"),
  ),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let label = p.label
  let accent = p.accent
  let secondary = p.secondary
  let cream = rgb("#F0EBE0")
  (
    bg: bg,
    ink: ink,
    label-color: label,
    accent: accent,
    secondary: secondary,
    // Derived from ink
    ink-dim: ink.transparentize(20%),
    ink-muted: ink.transparentize(45%),
    ink-faint: ink.transparentize(70%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent (gold)
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(75%),
    accent-ghost: accent.transparentize(90%),
    // Derived from secondary
    secondary-dim: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(75%),
    // Surface colors
    glaze: bg,
    glaze-warm: rgb("#FAF8F3"),
    // Dark variant (deep glaze body, preset-aware)
    dark: p.dark,
    dark-deep: p.dark-deep,
    // Backward-compatible aliases
    cobalt: p.dark,
    cobalt-deep: p.dark-deep,
    cream: cream,
    cream-body: cream.transparentize(20%),
    cream-muted: cream.transparentize(42%),
    cream-faint: cream.transparentize(60%),
    // Preset-independent material accents
    jade: rgb("#35685B"),
    jade-surface: rgb("#E8F0EC"),
    seal: rgb("#C92F2F"),
    // Meta
    meta-color: label,
    body-text: rgb("#2D3748"),
  )
}

// Default palette
#let palette = build-palette("ming")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 8pt,
)

// =====================================================================
// SVG Definitions -- INTRICATE (15+ elements each)
// =====================================================================

// 1. Cloud Scroll (祥云) -- Classic 如意云 with filled puff clusters and curling tail
// Bold filled shapes with internal detail at lower opacity for depth
#let _cloud-scroll-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 80\"><path d=\"M25,52 C25,42 33,36 42,36 C40,28 48,20 58,20 C60,12 70,8 80,12 C90,8 102,14 104,24 C112,28 116,38 112,46 C114,54 108,60 98,58 C96,64 88,66 80,62 C74,66 64,64 60,58 C52,62 40,60 35,54 C30,56 25,55 25,52 Z\" fill=\"currentColor\" opacity=\"0.7\"/><path d=\"M30,50 C30,42 37,38 44,38 C43,32 49,25 58,25 C60,18 68,14 76,17 C84,14 94,18 96,26 C102,29 106,36 104,42 C106,48 102,52 96,51 C94,55 88,56 82,54 C78,56 70,55 67,51 C62,54 54,53 50,49 C44,51 36,50 30,50 Z\" fill=\"currentColor\" opacity=\"0.35\"/><path d=\"M42,42 C44,38 50,37 54,40 C52,42 48,43 44,43 Z\" fill=\"currentColor\" opacity=\"0.25\"/><path d=\"M68,28 C72,24 80,24 84,28 C80,30 74,30 68,28 Z\" fill=\"currentColor\" opacity=\"0.25\"/><path d=\"M90,34 C94,32 100,34 100,38 C96,38 92,37 90,34 Z\" fill=\"currentColor\" opacity=\"0.2\"/><path d=\"M20,55 C16,58 12,56 8,60 C6,62 4,61 2,64\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" opacity=\"0.5\"/><path d=\"M14,60 C10,64 7,62 4,66\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" opacity=\"0.3\"/><path d=\"M108,52 C112,55 115,53 118,56\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.8\" stroke-linecap=\"round\" opacity=\"0.4\"/><circle cx=\"60\" cy=\"40\" r=\"2\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"85\" cy=\"38\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.15\"/></svg>"

// 2. Peony Flower (牡丹) -- Top-down view with round overlapping petals
// Wide round petals radiating outward, central stamen, two leaves below
#let _peony-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 140 140\"><ellipse cx=\"70\" cy=\"38\" rx=\"14\" ry=\"20\" fill=\"currentColor\" opacity=\"0.25\"/><ellipse cx=\"46\" cy=\"52\" rx=\"14\" ry=\"18\" transform=\"rotate(-30 46 52)\" fill=\"currentColor\" opacity=\"0.25\"/><ellipse cx=\"94\" cy=\"52\" rx=\"14\" ry=\"18\" transform=\"rotate(30 94 52)\" fill=\"currentColor\" opacity=\"0.25\"/><ellipse cx=\"42\" cy=\"76\" rx=\"13\" ry=\"17\" transform=\"rotate(-60 42 76)\" fill=\"currentColor\" opacity=\"0.25\"/><ellipse cx=\"98\" cy=\"76\" rx=\"13\" ry=\"17\" transform=\"rotate(60 98 76)\" fill=\"currentColor\" opacity=\"0.25\"/><ellipse cx=\"70\" cy=\"48\" rx=\"10\" ry=\"15\" fill=\"currentColor\" opacity=\"0.4\"/><ellipse cx=\"54\" cy=\"58\" rx=\"10\" ry=\"14\" transform=\"rotate(-25 54 58)\" fill=\"currentColor\" opacity=\"0.4\"/><ellipse cx=\"86\" cy=\"58\" rx=\"10\" ry=\"14\" transform=\"rotate(25 86 58)\" fill=\"currentColor\" opacity=\"0.4\"/><ellipse cx=\"52\" cy=\"74\" rx=\"9\" ry=\"13\" transform=\"rotate(-50 52 74)\" fill=\"currentColor\" opacity=\"0.4\"/><ellipse cx=\"88\" cy=\"74\" rx=\"9\" ry=\"13\" transform=\"rotate(50 88 74)\" fill=\"currentColor\" opacity=\"0.4\"/><ellipse cx=\"65\" cy=\"60\" rx=\"8\" ry=\"12\" transform=\"rotate(-10 65 60)\" fill=\"currentColor\" opacity=\"0.55\"/><ellipse cx=\"75\" cy=\"60\" rx=\"8\" ry=\"12\" transform=\"rotate(10 75 60)\" fill=\"currentColor\" opacity=\"0.55\"/><ellipse cx=\"62\" cy=\"72\" rx=\"7\" ry=\"10\" transform=\"rotate(-30 62 72)\" fill=\"currentColor\" opacity=\"0.55\"/><ellipse cx=\"78\" cy=\"72\" rx=\"7\" ry=\"10\" transform=\"rotate(30 78 72)\" fill=\"currentColor\" opacity=\"0.55\"/><circle cx=\"70\" cy=\"65\" r=\"7\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"67\" cy=\"62\" r=\"2.2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"73\" cy=\"62\" r=\"2.2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"70\" cy=\"59\" r=\"1.8\" fill=\"currentColor\" opacity=\"0.45\"/><circle cx=\"66\" cy=\"67\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><circle cx=\"74\" cy=\"67\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.4\"/><path d=\"M48,92 C38,96 34,106 38,114 C42,120 50,118 50,112 C46,110 42,104 46,96 Z\" fill=\"currentColor\" opacity=\"0.35\"/><path d=\"M92,92 C102,96 106,106 102,114 C98,120 90,118 90,112 C94,110 98,104 94,96 Z\" fill=\"currentColor\" opacity=\"0.35\"/><path d=\"M40,108 L38,116\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-linecap=\"round\" opacity=\"0.3\"/><path d=\"M100,108 L102,116\" stroke=\"currentColor\" stroke-width=\"1.2\" stroke-linecap=\"round\" opacity=\"0.3\"/></svg>"

// 3. Wave Border (海水纹) -- Multi-layer filled waves with curling crests and spray
// Classic Chinese wave: steep front, trailing back, filled bodies with foam dots
#let _wave-border-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 60\"><path d=\"M0,58 C5,54 15,46 25,40 C35,34 42,28 52,26 C60,24 64,28 62,32 C55,30 45,36 35,44 C25,52 10,58 0,58 Z M100,58 C105,54 115,46 125,40 C135,34 142,28 152,26 C160,24 164,28 162,32 C155,30 145,36 135,44 C125,52 110,58 100,58 Z M200,58 C205,54 215,46 225,40 C235,34 242,28 252,26 C260,24 264,28 262,32 C255,30 245,36 235,44 C225,52 210,58 200,58 Z M300,58 C305,54 315,46 325,40 C335,34 342,28 352,26 C360,24 364,28 362,32 C355,30 345,36 335,44 C325,52 310,58 300,58 Z M400,58 C405,54 415,46 425,40 C435,34 442,28 452,26 C460,24 464,28 462,32 C455,30 445,36 435,44 C425,52 410,58 400,58 Z M500,58 C505,54 515,46 525,40 C535,34 542,28 552,26 C560,24 564,28 562,32 C555,30 545,36 535,44 C525,52 510,58 500,58 Z M600,58 C605,54 615,46 625,40 C635,34 642,28 652,26 C660,24 664,28 662,32 C655,30 645,36 635,44 C625,52 610,58 600,58 Z M700,58 C705,54 715,46 725,40 C735,34 742,28 752,26 C760,24 764,28 762,32 C755,30 745,36 735,44 C725,52 710,58 700,58 Z\" fill=\"currentColor\" opacity=\"0.7\"/><path d=\"M50,58 C55,54 62,48 70,43 C78,38 84,34 92,32 C98,30 101,33 99,36 C92,35 84,40 76,46 C68,52 58,58 50,58 Z M150,58 C155,54 162,48 170,43 C178,38 184,34 192,32 C198,30 201,33 199,36 C192,35 184,40 176,46 C168,52 158,58 150,58 Z M250,58 C255,54 262,48 270,43 C278,38 284,34 292,32 C298,30 301,33 299,36 C292,35 284,40 276,46 C268,52 258,58 250,58 Z M350,58 C355,54 362,48 370,43 C378,38 384,34 392,32 C398,30 401,33 399,36 C392,35 384,40 376,46 C368,52 358,58 350,58 Z M450,58 C455,54 462,48 470,43 C478,38 484,34 492,32 C498,30 501,33 499,36 C492,35 484,40 476,46 C468,52 458,58 450,58 Z M550,58 C555,54 562,48 570,43 C578,38 584,34 592,32 C598,30 601,33 599,36 C592,35 584,40 576,46 C568,52 558,58 550,58 Z M650,58 C655,54 662,48 670,43 C678,38 684,34 692,32 C698,30 701,33 699,36 C692,35 684,40 676,46 C668,52 658,58 650,58 Z M750,58 C755,54 762,48 770,43 C778,38 784,34 792,32 C798,30 800,33 799,36 C792,35 784,40 776,46 C768,52 758,58 750,58 Z\" fill=\"currentColor\" opacity=\"0.35\"/><circle cx=\"60\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"160\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"260\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"360\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"460\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"560\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"660\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"760\" cy=\"22\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// 4. Geometric Lattice (回纹) -- Filled meander border frame like porcelain plate rim
// Bold frame with continuous meander stroke on top/bottom edges, filled corner squares
#let _lattice-border-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 450\"><rect x=\"10\" y=\"10\" width=\"780\" height=\"430\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"3\" opacity=\"0.65\"/><rect x=\"30\" y=\"30\" width=\"740\" height=\"390\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.3\"/><rect x=\"6\" y=\"6\" width=\"24\" height=\"24\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"770\" y=\"6\" width=\"24\" height=\"24\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"6\" y=\"420\" width=\"24\" height=\"24\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"770\" y=\"420\" width=\"24\" height=\"24\" fill=\"currentColor\" opacity=\"0.8\"/><path d=\"M36,6 L36,18 L48,18 L48,6 L54,6 L54,24 L30,24 L30,6 Z M60,6 L60,18 L72,18 L72,6 L78,6 L78,24 L54,24 L54,6 Z M84,6 L84,18 L96,18 L96,6 L102,6 L102,24 L78,24 L78,6 Z M108,6 L108,18 L120,18 L120,6 L126,6 L126,24 L102,24 L102,6 Z M132,6 L132,18 L144,18 L144,6 L150,6 L150,24 L126,24 L126,6 Z M156,6 L156,18 L168,18 L168,6 L174,6 L174,24 L150,24 L150,6 Z M180,6 L180,18 L192,18 L192,6 L198,6 L198,24 L174,24 L174,6 Z M204,6 L204,18 L216,18 L216,6 L222,6 L222,24 L198,24 L198,6 Z M228,6 L228,18 L240,18 L240,6 L246,6 L246,24 L222,24 L222,6 Z M252,6 L252,18 L264,18 L264,6 L270,6 L270,24 L246,24 L246,6 Z M276,6 L276,18 L288,18 L288,6 L294,6 L294,24 L270,24 L270,6 Z M500,6 L500,18 L512,18 L512,6 L518,6 L518,24 L494,24 L494,6 Z M524,6 L524,18 L536,18 L536,6 L542,6 L542,24 L518,24 L518,6 Z M548,6 L548,18 L560,18 L560,6 L566,6 L566,24 L542,24 L542,6 Z M572,6 L572,18 L584,18 L584,6 L590,6 L590,24 L566,24 L566,6 Z M596,6 L596,18 L608,18 L608,6 L614,6 L614,24 L590,24 L590,6 Z M620,6 L620,18 L632,18 L632,6 L638,6 L638,24 L614,24 L614,6 Z M644,6 L644,18 L656,18 L656,6 L662,6 L662,24 L638,24 L638,6 Z M668,6 L668,18 L680,18 L680,6 L686,6 L686,24 L662,24 L662,6 Z M692,6 L692,18 L704,18 L704,6 L710,6 L710,24 L686,24 L686,6 Z M716,6 L716,18 L728,18 L728,6 L734,6 L734,24 L710,24 L710,6 Z M740,6 L740,18 L752,18 L752,6 L758,6 L758,24 L734,24 L734,6 Z\" fill=\"currentColor\" opacity=\"0.5\"/><path d=\"M36,426 L36,438 L48,438 L48,426 L54,426 L54,444 L30,444 L30,426 Z M60,426 L60,438 L72,438 L72,426 L78,426 L78,444 L54,444 L54,426 Z M84,426 L84,438 L96,438 L96,426 L102,426 L102,444 L78,444 L78,426 Z M108,426 L108,438 L120,438 L120,426 L126,426 L126,444 L102,444 L102,426 Z M692,426 L692,438 L704,438 L704,426 L710,426 L710,444 L686,444 L686,426 Z M716,426 L716,438 L728,438 L728,426 L734,426 L734,444 L710,444 L710,426 Z M740,426 L740,438 L752,438 L752,426 L758,426 L758,444 L734,444 L734,426 Z\" fill=\"currentColor\" opacity=\"0.5\"/><path d=\"M6,36 L18,36 L18,48 L6,48 L6,54 L24,54 L24,30 L6,30 Z M6,60 L18,60 L18,72 L6,72 L6,78 L24,78 L24,54 L6,54 Z M6,84 L18,84 L18,96 L6,96 L6,102 L24,102 L24,78 L6,78 Z\" fill=\"currentColor\" opacity=\"0.5\"/><path d=\"M776,36 L788,36 L788,48 L776,48 L776,54 L794,54 L794,30 L776,30 Z M776,60 L788,60 L788,72 L776,72 L776,78 L794,78 L794,54 L776,54 Z M776,84 L788,84 L788,96 L776,96 L776,102 L794,102 L794,78 L776,78 Z\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// 5. Porcelain Vessel (瓷瓶) -- Classic 梅瓶/玉壶春瓶 silhouette in profile view
// Elegant vase outline with narrow neck, flared lip, pear-shaped body, foot ring, and decorative band
#let _vessel-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 200\"><path d=\"M150,18 C144,18 140,20 138,24 C136,28 137,30 140,31 C143,32 157,32 160,31 C163,30 164,28 162,24 C160,20 156,18 150,18 Z\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" opacity=\"0.7\"/><path d=\"M140,31 C139,34 138,38 138,42 C138,46 139,50 142,54\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2.5\" opacity=\"0.7\"/><path d=\"M160,31 C161,34 162,38 162,42 C162,46 161,50 158,54\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2.5\" opacity=\"0.7\"/><path d=\"M142,54 C134,62 124,74 120,90 C116,106 118,122 122,136 C126,150 132,160 138,166 C142,170 146,172 150,172 C154,172 158,170 162,166 C168,160 174,150 178,136 C182,122 184,106 180,90 C176,74 166,62 158,54\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2.5\" opacity=\"0.7\"/><path d=\"M138,166 C136,168 135,170 136,172 C137,174 142,175 150,175 C158,175 163,174 164,172 C165,170 164,168 162,166\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" opacity=\"0.5\"/><rect x=\"136\" y=\"175\" width=\"28\" height=\"4\" rx=\"1\" fill=\"currentColor\" opacity=\"0.4\"/><ellipse cx=\"150\" cy=\"110\" rx=\"28\" ry=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.35\"/><ellipse cx=\"150\" cy=\"120\" rx=\"28\" ry=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.35\"/><ellipse cx=\"150\" cy=\"115\" rx=\"26\" ry=\"18\" fill=\"currentColor\" opacity=\"0.12\"/><path d=\"M130,112 C134,108 138,110 142,108 C146,106 148,110 150,108 C152,110 154,106 158,108 C162,110 166,108 170,112\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.25\"/><path d=\"M130,118 C134,122 138,120 142,122 C146,124 148,120 150,122 C152,120 154,124 158,122 C162,120 166,122 170,118\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.25\"/><circle cx=\"140\" cy=\"95\" r=\"3\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"160\" cy=\"95\" r=\"3\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"150\" cy=\"88\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.15\"/><path d=\"M143,85 C146,82 150,80 154,82 C157,84 157,88 154,90 C151,88 147,88 143,85 Z\" fill=\"currentColor\" opacity=\"0.2\"/><circle cx=\"142\" cy=\"140\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.15\"/><circle cx=\"158\" cy=\"140\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.15\"/><path d=\"M146,145 C148,143 152,143 154,145 C152,147 148,147 146,145 Z\" fill=\"currentColor\" opacity=\"0.18\"/><path d=\"M139,24 C139,22 141,20 143,20\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/><path d=\"M161,24 C161,22 159,20 157,20\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.6\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let cloud-scroll(color: palette.ink, size-w: 120pt, size-h: 80pt) = {
  let svg = _cloud-scroll-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size-w, height: size-h)
}

#let peony-flower(color: palette.ink, size: 140pt) = {
  let svg = _peony-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let wave-border(color: palette.ink, width: 100%, height: 30pt) = {
  let svg = _wave-border-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let lattice-frame(color: palette.ink, width: 100%, height: 100%) = {
  let svg = _lattice-border-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let vessel-motif(color: palette.accent, width: 300pt, height: 200pt) = {
  let svg = _vessel-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Persistent Background Atmosphere
// Every content slide gets this -- the "painted on porcelain" feeling
// =====================================================================

#let _porcelain-atmosphere(pal) = {
  // 1. Lattice (回纹) border at 12% opacity -- like the rim of a plate
  place(center + horizon,
    box(width: 100%, height: 100%,
      lattice-frame(color: pal.ink.transparentize(88%), width: 100%, height: 100%),
    ),
  )
  // 2. Cloud scroll in top-right corner at 8% opacity
  place(top + right, dx: -8pt, dy: 8pt,
    cloud-scroll(color: pal.ink.transparentize(92%), size-w: 100pt, size-h: 66pt),
  )
  // 3. Cloud scroll in bottom-left corner at 8% opacity
  place(bottom + left, dx: 8pt, dy: -8pt,
    cloud-scroll(color: pal.ink.transparentize(92%), size-w: 80pt, size-h: 53pt),
  )
  // 4. Ghost character 「瓷」 at 3% opacity
  place(center + horizon, dx: 80pt, dy: 20pt,
    text(size: 160pt, weight: "bold", fill: pal.ink.transparentize(97%))[瓷],
  )
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// gold-dot -- Small gold circle accent
#let gold-dot(color: palette.accent, size: 3pt) = {
  circle(radius: size / 2, fill: color)
}

/// rim-accent -- Double line like porcelain rim edge
#let rim-accent(color: palette.ink, width: 60pt) = {
  block(width: width, height: 6pt)[
    #place(top, line(length: 100%, stroke: 0.8pt + color))
    #place(top, dy: 3pt, line(length: 100%, stroke: 0.4pt + color.transparentize(40%)))
  ]
}

// =====================================================================
// Reusable Components (10+ structurally diverse)
// =====================================================================

/// vessel-card -- Double blue line border (like porcelain rim), cloud scroll in corner
#let vessel-card(title, body) = {
  shadow(dy: 2pt, blur: 5pt, fill: rgb(0, 0, 0, 8%), radius: 2pt,
    block(
      width: 100%,
      stroke: (
        left: 1.8pt + palette.ink,
        right: 0.5pt + palette.ink-faint,
        top: 0.5pt + palette.ink-faint,
        bottom: 0.5pt + palette.ink-faint,
      ),
      inset: (x: 1.2em, top: 0.9em, bottom: 0.7em),
      fill: palette.glaze,
      radius: 2pt,
    )[
      // Inner decorative line along top
      #place(top + left, dx: 0pt, dy: 2pt,
        line(length: 100%, stroke: 0.3pt + palette.ink-faint)
      )
      // Cloud scroll decoration in top-right corner
      #place(top + right, dx: 4pt, dy: -6pt,
        cloud-scroll(color: palette.ink.transparentize(82%), size-w: 36pt, size-h: 24pt),
      )
      #stack(spacing: .8em,
        [#text(size: typo.body, weight: "bold", fill: palette.ink, title)],
        [#set text(size: 13pt, fill: palette.body-text)
         #body
         #lazy-v(1fr)],
      )
    ]
  )
}

/// dynasty-stat -- Large number with cloud scroll SVG behind
#let dynasty-stat(label, value, description: none) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em), fill: palette.glaze)[
    #stack(spacing: .8em,
      [#text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.ink-muted,
        upper(label),
      )],
      [#box(width: 100%)[
        // Cloud scroll behind the number
        #place(top + right, dx: -2pt, dy: -4pt,
          cloud-scroll(color: palette.ink.transparentize(85%), size-w: 50pt, size-h: 33pt),
        )
        #text(size: 44pt, weight: "bold", fill: palette.ink, value)
      ]],
      [#stack(spacing: .8em,
        rim-accent(color: palette.accent, width: 35pt),
        if description != none {
          text(
            size: 13pt,
            weight: "regular",
            fill: palette.body-text,
            description,
          )
        },
        lazy-v(1fr),
      )],
    )
  ]
}

/// scholar-quote -- Centered text in Chinese quotation marks with peony accent
#let scholar-quote(body, cite: none) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1em),
    fill: palette.glaze,
  )[
    // Peony accent behind quote
    #place(top + left, dx: -8pt, dy: -8pt,
      peony-flower(color: palette.ink.transparentize(88%), size: 50pt),
    )
    #set std.align(center)
    #text(size: typo.body + 1pt, style: "italic", fill: palette.ink)[
      #text(size: 20pt, fill: palette.ink-muted)[「]#body#text(size: 20pt, fill: palette.ink-muted)[」]
    ]
    #if cite != none {
      v(0.5em)
      text(
        size: typo.tiny,
        style: "normal",
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.meta-color,
        [--- #upper(cite)],
      )
    }
  ]
}

/// kiln-box -- Box with wave-pattern SVG bottom border
/// Uses stack(spacing: 0pt) for header + content body structure
#let kiln-box(title, body) = {
  block(clip: true, width: 100%, radius: 2pt, stroke: 0.5pt + palette.ink-faint)[
    #stack(spacing: 0pt,
      block(fill: palette.ink.transparentize(92%), width: 100%, inset: (x: 1em, y: 0.6em))[
        #text(size: typo.body, weight: "bold", fill: palette.ink, title)
      ],
      block(fill: palette.glaze-warm, width: 100%, inset: (x: 1em, top: 0.6em, bottom: 0.5em))[
        #set text(size: 13pt, fill: palette.body-text)
        #body
        #lazy-v(1fr)
      ],
      // Wave pattern bottom border (instead of a straight line)
      wave-border(color: palette.ink.transparentize(50%), width: 100%, height: 14pt),
    )
  ]
}

/// jade-tag -- Rounded tag with jade-green gradient feel
#let jade-tag(body) = {
  box(
    fill: rgb("#4A7C6F").transparentize(85%),
    stroke: 0.5pt + rgb("#4A7C6F").transparentize(40%),
    inset: (x: 9pt, y: 4pt),
    radius: 10pt,
  )[
    #text(size: typo.small, fill: rgb("#4A7C6F"), weight: "medium", body)
  ]
}

/// lattice-divider -- Full-width 回纹 pattern divider (simplified inline)
#let lattice-divider(total-width: 100%) = {
  block(width: total-width, height: 18pt)[
    // Simplified lattice pattern as a divider line
    #place(left + horizon, line(length: 100%, stroke: 0.4pt + palette.ink-faint))
    // Small 回纹 motifs along the line
    #place(left + horizon, dx: 10%,
      box(width: 14pt, height: 14pt)[
        #place(top + left, curve(
          fill: none, stroke: 0.5pt + palette.ink-muted,
          curve.move((0pt, 0pt)),
          curve.line((14pt, 0pt)),
          curve.line((14pt, 7pt)),
          curve.line((7pt, 7pt)),
          curve.line((7pt, 14pt)),
          curve.line((0pt, 14pt)),
        ))
      ]
    )
    #place(left + horizon, dx: 30%,
      box(width: 14pt, height: 14pt)[
        #place(top + left, curve(
          fill: none, stroke: 0.5pt + palette.ink-muted,
          curve.move((0pt, 0pt)),
          curve.line((14pt, 0pt)),
          curve.line((14pt, 7pt)),
          curve.line((7pt, 7pt)),
          curve.line((7pt, 14pt)),
          curve.line((0pt, 14pt)),
        ))
      ]
    )
    #place(left + horizon, dx: 50%,
      gold-dot(color: palette.accent, size: 4pt)
    )
    #place(left + horizon, dx: 70%,
      box(width: 14pt, height: 14pt)[
        #place(top + left, curve(
          fill: none, stroke: 0.5pt + palette.ink-muted,
          curve.move((0pt, 0pt)),
          curve.line((14pt, 0pt)),
          curve.line((14pt, 7pt)),
          curve.line((7pt, 7pt)),
          curve.line((7pt, 14pt)),
          curve.line((0pt, 14pt)),
        ))
      ]
    )
    #place(left + horizon, dx: 90%,
      box(width: 14pt, height: 14pt)[
        #place(top + left, curve(
          fill: none, stroke: 0.5pt + palette.ink-muted,
          curve.move((0pt, 0pt)),
          curve.line((14pt, 0pt)),
          curve.line((14pt, 7pt)),
          curve.line((7pt, 7pt)),
          curve.line((7pt, 14pt)),
          curve.line((0pt, 14pt)),
        ))
      ]
    )
  ]
}

/// treasure-highlight -- Gold rim frame with blue corner cloud scrolls
#let treasure-highlight(body) = {
  shadow(dy: 3pt, blur: 6pt, fill: rgb(0, 0, 0, 10%), radius: 3pt,
    block(
      width: 100%,
      stroke: 1.2pt + palette.accent,
      inset: (x: 1.5em, y: 1em),
      fill: palette.glaze,
      radius: 3pt,
    )[
      // Four corner cloud scrolls
      #place(top + left, dx: -6pt, dy: -6pt,
        cloud-scroll(color: palette.ink.transparentize(70%), size-w: 28pt, size-h: 18pt))
      #place(top + right, dx: 6pt, dy: -6pt,
        cloud-scroll(color: palette.ink.transparentize(70%), size-w: 28pt, size-h: 18pt))
      #place(bottom + left, dx: -6pt, dy: 6pt,
        cloud-scroll(color: palette.ink.transparentize(70%), size-w: 28pt, size-h: 18pt))
      #place(bottom + right, dx: 6pt, dy: 6pt,
        cloud-scroll(color: palette.ink.transparentize(70%), size-w: 28pt, size-h: 18pt))
      // Gold dot accents at midpoints
      #place(top + left, dx: 48%, dy: -3pt, gold-dot(color: palette.accent, size: 4pt))
      #place(bottom + left, dx: 48%, dy: 3pt, gold-dot(color: palette.accent, size: 4pt))
      #set text(size: typo.body, fill: palette.ink)
      #body
    ]
  )
}

/// scroll-banner -- Full-width band with cloud pattern behind text
#let scroll-banner(body) = {
  block(width: 100%, fill: palette.glaze-warm, inset: (x: 1.5em, y: 0.7em), stroke: 0.4pt + palette.ink-faint)[
    // Cloud pattern at 10% behind
    #place(left + horizon, dx: -6pt,
      cloud-scroll(color: palette.ink.transparentize(90%), size-w: 60pt, size-h: 40pt))
    #place(right + horizon, dx: 6pt,
      cloud-scroll(color: palette.ink.transparentize(90%), size-w: 60pt, size-h: 40pt))
    #set text(size: typo.body, weight: "medium", fill: palette.ink)
    #body
  ]
}

/// seal-mark -- Red seal stamp decorative element (Chinese chop mark)
#let seal-mark(body) = {
  box(
    fill: rgb("#CC3333").transparentize(10%),
    stroke: 1pt + rgb("#CC3333"),
    inset: (x: 5pt, y: 3pt),
    radius: 2pt,
  )[
    #text(size: 11pt, fill: white, weight: "bold", body)
  ]
}

/// pavilion-frame -- Content with Chinese architectural bracket corners (斗拱 style)
#let pavilion-frame(title, body) = {
  block(
    width: 100%,
    inset: (x: 1.4em, top: 1em, bottom: 0.8em),
    stroke: 0.4pt + palette.ink-faint,
    fill: palette.glaze,
  )[
    // Architectural bracket corners (simplified 斗拱)
    #place(top + left, dx: -4pt, dy: -4pt,
      block(width: 20pt, height: 20pt)[
        #place(top + left, line(length: 16pt, stroke: 1.2pt + palette.ink-muted))
        #place(top + left, line(length: 12pt, angle: 90deg, stroke: 1.2pt + palette.ink-muted))
        #place(top + left, dx: 4pt, dy: 4pt, line(length: 8pt, stroke: 0.6pt + palette.ink-faint))
        #place(top + left, dx: 4pt, dy: 4pt, line(length: 6pt, angle: 90deg, stroke: 0.6pt + palette.ink-faint))
      ]
    )
    #place(top + right, dx: 4pt, dy: -4pt,
      block(width: 20pt, height: 20pt)[
        #place(top + right, line(length: 16pt, angle: 180deg, stroke: 1.2pt + palette.ink-muted))
        #place(top + right, line(length: 12pt, angle: 90deg, stroke: 1.2pt + palette.ink-muted))
      ]
    )
    #place(bottom + left, dx: -4pt, dy: 4pt,
      block(width: 20pt, height: 20pt)[
        #place(bottom + left, line(length: 16pt, stroke: 1.2pt + palette.ink-muted))
        #place(bottom + left, line(length: 12pt, angle: -90deg, stroke: 1.2pt + palette.ink-muted))
      ]
    )
    #place(bottom + right, dx: 4pt, dy: 4pt,
      block(width: 20pt, height: 20pt)[
        #place(bottom + right, line(length: 16pt, angle: 180deg, stroke: 1.2pt + palette.ink-muted))
        #place(bottom + right, line(length: 12pt, angle: -90deg, stroke: 1.2pt + palette.ink-muted))
      ]
    )
    // Title
    #stack(spacing: .8em,
      [#text(size: typo.body, weight: "bold", fill: palette.ink, title)],
      [#set text(size: 13pt, fill: palette.body-text)
       #body
       #lazy-v(1fr)],
    )
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    // Double line like porcelain rim
    block(width: 55pt, height: 5pt)[
      #place(top, line(length: 55pt, stroke: 1.2pt + pal.ink))
      #place(top, dy: 3pt, line(length: 35pt, stroke: 0.5pt + pal.ink-muted))
    ],
  )
}

/// _slide-footer -- Standard footer for content slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[PORCELAIN]
    },
    text(fill: pal.accent, size: 7pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark (cobalt) slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: rgb("#F0EBE0").transparentize(50%))
    grid(
      columns: (1fr, 1fr),
      {
        if custom-left != none {
          custom-left
        } else if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        set std.align(right)
        if custom-right != none {
          custom-right
        } else {
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        }
      },
    )
  }
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: rgb("#F0EBE0").transparentize(60%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[PORCELAIN]
    },
    text(fill: palette.accent, size: 7pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- White glaze bg, persistent lattice frame + cloud scrolls atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _slide-header(self)
  let footer(self) = _slide-footer(self)
  let setting(body) = {
    // THE PORCELAIN ATMOSPHERE -- every content slide
    _porcelain-atmosphere(pal)
    show: std.align.with(horizon)
    body
  }
    let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Cobalt blue background (the blue of porcelain itself)
/// Vessel motif dominates, gold/white elements
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(custom-left: header-left, custom-right: header-right)
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Vessel motif SVG dominating background
    place(center + horizon, dx: 40pt, dy: 10pt,
      vessel-motif(color: pal.accent.transparentize(75%), width: 380pt, height: 250pt),
    )
    // Cloud scroll accents
    place(top + left, dx: 10pt, dy: 10pt,
      cloud-scroll(color: rgb("#F0EBE0").transparentize(88%), size-w: 70pt, size-h: 46pt),
    )
    place(bottom + right, dx: -10pt, dy: -10pt,
      cloud-scroll(color: rgb("#F0EBE0").transparentize(88%), size-w: 60pt, size-h: 40pt),
    )
    // Ghost text
    place(top + right, dx: -20pt, dy: 30pt,
      text(size: 140pt, weight: "bold", fill: rgb("#F0EBE0").transparentize(95%))[瓷],
    )
    set text(fill: rgb("#F0EBE0"))
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.cobalt,
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Grand porcelain vessel cover: peony hero, lattice frame, gold rim
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Clean glaze background
    place(top + left, block(width: 100%, height: 100%, fill: pal.glaze))

    // Full-page lattice frame (like porcelain plate rim)
    place(center + horizon,
      box(width: 100%, height: 100%,
        lattice-frame(color: pal.ink.transparentize(78%), width: 100%, height: 100%),
      ),
    )

    // Peony in top-right (hero decoration)
    place(top + right, dx: -20pt, dy: 15pt,
      peony-flower(color: pal.ink.transparentize(30%), size: 160pt),
    )

    // Peony in bottom-left (smaller, mirrored feel)
    place(bottom + left, dx: 15pt, dy: -20pt,
      peony-flower(color: pal.ink.transparentize(50%), size: 110pt),
    )

    // Wave border along bottom
    place(bottom + left, dy: -5pt,
      wave-border(color: pal.ink.transparentize(40%), width: 100%, height: 25pt),
    )

    // Cloud scrolls as transitional elements
    place(top + left, dx: 30pt, dy: 30pt,
      cloud-scroll(color: pal.ink.transparentize(55%), size-w: 80pt, size-h: 53pt),
    )
    place(bottom + right, dx: -40pt, dy: -50pt,
      cloud-scroll(color: pal.ink.transparentize(60%), size-w: 70pt, size-h: 46pt),
    )

    // Gold rim frame (inner border)
    place(center + horizon,
      rect(width: 92%, height: 88%, stroke: 1pt + pal.accent-dim, fill: none)
    )
    place(center + horizon,
      rect(width: 90%, height: 86%, stroke: 0.4pt + pal.accent-faint, fill: none)
    )

    // Gold dot accents at frame corners
    place(top + left, dx: 4.5%, dy: 6.5%, gold-dot(color: pal.accent, size: 5pt))
    place(top + right, dx: -4.5%, dy: 6.5%, gold-dot(color: pal.accent, size: 5pt))
    place(bottom + left, dx: 4.5%, dy: -6.5%, gold-dot(color: pal.accent, size: 5pt))
    place(bottom + right, dx: -4.5%, dy: -6.5%, gold-dot(color: pal.accent, size: 5pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 6em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2pt,
          fill: pal.ink-muted,
          upper(info.institution),
        )
        v(1.2em)
      }
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.6em)
      // Decorative divider with gold dot
      #block(width: 180pt, height: 10pt)[
        #place(left + horizon, line(length: 75pt, stroke: 0.6pt + pal.ink-muted))
        #place(center + horizon, gold-dot(color: pal.accent, size: 5pt))
        #place(right + horizon, line(length: 75pt, stroke: 0.6pt + pal.ink-muted))
      ]
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", style: "italic", fill: pal.ink-dim, info.subtitle)
        v(1em)
      }
      // Author + date
      #{
        set text(size: typo.tiny, fill: pal.meta-color)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.accent, size: 6pt)[#sym.diamond.filled]
          h(1.5em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Peony focal element, lattice accents, dynasty numbering
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.glaze))

    // Lattice frame at edges
    place(center + horizon,
      box(width: 100%, height: 100%,
        lattice-frame(color: pal.ink.transparentize(85%), width: 100%, height: 100%),
      ),
    )

    // Large peony as focal decoration
    place(top + right, dx: -50pt, dy: 20pt,
      peony-flower(color: pal.ink.transparentize(45%), size: 180pt),
    )

    // Cloud scroll accent
    place(bottom + left, dx: 30pt, dy: -30pt,
      cloud-scroll(color: pal.ink.transparentize(65%), size-w: 100pt, size-h: 66pt),
    )

    // Section number in large decorative style
    place(top + left, dx: 4em, dy: 2em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 80pt, height: 80pt)[
          #place(center + horizon,
            text(fill: pal.ink.transparentize(80%), size: 72pt, weight: "bold", num-str))
        ]
      },
    )

    // Top accent line with gold dot
    place(top + left, dx: 4em, dy: 5.5em,
      block(width: 100pt, height: 8pt)[
        #line(length: 80pt, stroke: 1pt + pal.ink)
        #place(top + left, dx: 84pt, dy: -2pt, gold-dot(color: pal.accent, size: 5pt))
      ]
    )

    // Content area -- positioned in lower-third using place for reliability
    place(left + bottom, dx: 4em, dy: -4em,
      block(width: 60%)[
        #text(
          size: typo.tiny,
          weight: "medium",
          tracking: 1.8pt,
          fill: pal.ink-muted,
          )[SECTION #context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          num-str
        }]
        #v(0.6em)
        #{
          set text(fill: pal.ink, size: 2.2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        }
        #v(0.3em)
        #rim-accent(color: pal.ink, width: 50pt)
      ]
    )

    // Wave border at very bottom
    place(bottom + left,
      wave-border(color: pal.ink.transparentize(60%), width: 100%, height: 18pt),
    )

    // Footer mark
    place(bottom + right, dx: -2em, dy: -1.2em,
      text(fill: pal.meta-color, size: 7pt)[PORCELAIN],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Statement slide on warm glaze, cloud scrolls framing text
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.glaze-warm,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Lattice frame persistent
    place(center + horizon,
      box(width: 110%, height: 110%,
        lattice-frame(color: pal.ink.transparentize(90%), width: 100%, height: 100%),
      ),
    )
    // Cloud scrolls framing the content
    place(top + left, dx: -10pt, dy: -5pt,
      cloud-scroll(color: pal.ink.transparentize(75%), size-w: 90pt, size-h: 60pt),
    )
    place(bottom + right, dx: 10pt, dy: 5pt,
      cloud-scroll(color: pal.ink.transparentize(75%), size-w: 90pt, size-h: 60pt),
    )
    place(top + right, dx: 10pt, dy: -5pt,
      cloud-scroll(color: pal.ink.transparentize(85%), size-w: 60pt, size-h: 40pt),
    )
    place(bottom + left, dx: -10pt, dy: 5pt,
      cloud-scroll(color: pal.ink.transparentize(85%), size-w: 60pt, size-h: 40pt),
    )
    // Gold dot accents
    place(top + left, dx: 40pt, dy: 30pt, gold-dot(color: pal.accent, size: 4pt))
    place(bottom + right, dx: -40pt, dy: -30pt, gold-dot(color: pal.accent, size: 4pt))
    // Ghost character
    place(center + horizon, dx: 60pt, dy: 30pt,
      text(size: 180pt, weight: "bold", fill: pal.ink.transparentize(96%))[瓷],
    )

    set text(fill: pal.ink, size: 1.4em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    pad(x: 2em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Bookends with title: peony frame, wave bottom, lattice
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.glaze))

    // Lattice frame (shared with title -- bookending)
    place(center + horizon,
      box(width: 100%, height: 100%,
        lattice-frame(color: pal.ink.transparentize(78%), width: 100%, height: 100%),
      ),
    )

    // Peony flowers (shared with title -- bookending)
    place(top + left, dx: 20pt, dy: 15pt,
      peony-flower(color: pal.ink.transparentize(40%), size: 130pt),
    )
    place(bottom + right, dx: -20pt, dy: -20pt,
      peony-flower(color: pal.ink.transparentize(50%), size: 110pt),
    )

    // Cloud scrolls
    place(top + right, dx: -30pt, dy: 25pt,
      cloud-scroll(color: pal.ink.transparentize(55%), size-w: 80pt, size-h: 53pt),
    )
    place(bottom + left, dx: 25pt, dy: -40pt,
      cloud-scroll(color: pal.ink.transparentize(60%), size-w: 70pt, size-h: 46pt),
    )

    // Ghost text
    place(center + horizon,
      text(size: 130pt, weight: "bold", fill: pal.ink.transparentize(95%))[瓷],
    )

    // Gold rim frame (shared with title -- bookending)
    place(center + horizon,
      rect(width: 92%, height: 88%, stroke: 1pt + pal.accent-dim, fill: none)
    )
    place(center + horizon,
      rect(width: 90%, height: 86%, stroke: 0.4pt + pal.accent-faint, fill: none)
    )

    // Gold dots at corners (shared with title)
    place(top + left, dx: 4.5%, dy: 6.5%, gold-dot(color: pal.accent, size: 5pt))
    place(top + right, dx: -4.5%, dy: 6.5%, gold-dot(color: pal.accent, size: 5pt))
    place(bottom + left, dx: 4.5%, dy: -6.5%, gold-dot(color: pal.accent, size: 5pt))
    place(bottom + right, dx: -4.5%, dy: -6.5%, gold-dot(color: pal.accent, size: 5pt))

    // Wave border bottom (shared with title)
    place(bottom + left, dy: -5pt,
      wave-border(color: pal.ink.transparentize(40%), width: 100%, height: 25pt),
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Seal mark as ornament
      #seal-mark[青花瓷]
      #v(1.2em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.8em)
      // Decorative divider
      #block(width: 160pt, height: 10pt)[
        #place(left + horizon, line(length: 65pt, stroke: 0.6pt + pal.ink-muted))
        #place(center + horizon, gold-dot(color: pal.accent, size: 5pt))
        #place(right + horizon, line(length: 65pt, stroke: 0.6pt + pal.ink-muted))
      ]
      #v(0.8em)
      #text(size: 10pt, fill: pal.meta-color, tracking: 2pt)[PORCELAIN]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point (MUST BE LAST)
// =====================================================================

#let porcelain-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "ming",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.body-text)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.ink,
      neutral-lightest: pal.bg,
      neutral-darkest: pal.ink,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
      palette: pal,
    ),
    ..args,
  )

  body
}
