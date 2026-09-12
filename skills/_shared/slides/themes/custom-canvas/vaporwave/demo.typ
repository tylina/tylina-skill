#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Avenir Next", "Arial Unicode MS"), size: 20pt)

#let pal = build-palette("sunset")

#let _hero-art-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1600 900">
  <defs>
    <linearGradient id="sky" x1="0" y1="1" x2="1" y2="0">
      <stop offset="0" stop-color="#160625"/>
      <stop offset="0.45" stop-color="#64206F"/>
      <stop offset="0.72" stop-color="#D64B87"/>
      <stop offset="1" stop-color="#FF9A63"/>
    </linearGradient>
    <linearGradient id="road" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0" stop-color="#160625" stop-opacity="0.2"/>
      <stop offset="1" stop-color="#090212" stop-opacity="0.95"/>
    </linearGradient>
  </defs>
  <rect width="1600" height="900" fill="url(#sky)"/>
  <circle cx="1190" cy="315" r="180" fill="#FFB1C8" opacity="0.72"/>
  <rect x="1010" y="270" width="360" height="12" fill="#D64B87" opacity="0.65"/>
  <rect x="1010" y="318" width="360" height="16" fill="#D64B87" opacity="0.7"/>
  <rect x="1010" y="370" width="360" height="22" fill="#D64B87" opacity="0.76"/>
  <path d="M0 595 L145 525 L250 565 L365 485 L470 555 L605 500 L730 565 L865 515 L1010 560 L1120 485 L1260 555 L1390 505 L1600 580 L1600 900 L0 900 Z" fill="#120520" opacity="0.84"/>
  <path d="M0 900 L800 550 L1600 900 Z" fill="url(#road)"/>
  <path d="M800 548 L735 900 M800 548 L575 900 M800 548 L400 900 M800 548 L225 900 M800 548 L65 900" fill="none" stroke="#FF6B9D" stroke-width="4" opacity="0.34"/>
  <path d="M800 548 L865 900 M800 548 L1025 900 M800 548 L1200 900 M800 548 L1375 900 M800 548 L1535 900" fill="none" stroke="#06B6D4" stroke-width="4" opacity="0.28"/>
  <path d="M300 900 C320 760 335 620 350 470" fill="none" stroke="#10031D" stroke-width="24"/>
  <path d="M350 482 C285 440 230 438 180 465 C238 462 292 477 335 520 Z" fill="#10031D"/>
  <path d="M350 482 C408 418 472 398 530 416 C467 428 412 458 365 520 Z" fill="#10031D"/>
  <path d="M350 482 C318 408 315 345 345 290 C349 355 358 414 370 478 Z" fill="#10031D"/>
  <path d="M350 482 C260 394 205 360 140 368 C218 393 282 438 350 510 Z" fill="#10031D"/>
  <path d="M350 482 C438 360 505 332 575 348 C492 379 422 429 355 510 Z" fill="#10031D"/>
  <line x1="0" y1="670" x2="1600" y2="670" stroke="#FF6B9D" stroke-width="3" opacity="0.28"/>
  <line x1="0" y1="735" x2="1600" y2="735" stroke="#C084FC" stroke-width="3" opacity="0.25"/>
  <line x1="0" y1="810" x2="1600" y2="810" stroke="#06B6D4" stroke-width="3" opacity="0.2"/>
</svg>```.text

#let hero-art = bytes(_hero-art-svg)

#show: vaporwave-theme.with(
  aspect-ratio: "16-9",
  preset: "sunset",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Internet Aesthetic],
    subtitle: [How Vaporwave Shaped Digital Culture],
    author: [Neon Dreams Studio],
    date: datetime.today(),
    institution: [VAPOR LABS],
  ),
)

// ===== Cover =====

#title-slide()

#speaker-note[
  Welcome to our exploration of how vaporwave aesthetics reshaped internet culture. From early net art to modern social media design, the retro-digital dreamscape pervades our visual language.
]

// ============================================================
// Slide 1 -- Dark slide: Opening statement with stats
// ============================================================

#dark-slide(
  title: none,
  ghost: [01],
  ghost-dy: -20pt,
  ghost-dx: -10pt,
  ghost-size: 220pt,
  header-left: [DIGITAL ARCHAEOLOGY],
  header-right: [VAPOR 2026],
)[
  #stack(
    spacing: .8em,
    glitch-text([The web remembers everything.], size: 36pt, pal: pal),
    text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.pink)[A E S T H E T I C S \/\/ DIGITAL NOSTALGIA \/\/ POST-INTERNET],
    grid(columns: (1fr, 1fr, 1fr), column-gutter: 20pt,
      block(width: 100%)[
        #stack(
          spacing: .8em,
          glitch-stat([2011], [YEAR BORN], pal: pal),
          text(size: 10pt, fill: pal.paper-muted)[
            Floral Shoppe dropped. Macintosh Plus became the sound of a generation lost in digital haze.
          ],
        )
      ],
      block(width: 100%)[
        #stack(
          spacing: .8em,
          glitch-stat([420M], [TUMBLR POSTS], pal: pal),
          text(size: 10pt, fill: pal.paper-muted)[
            Tagged with vaporwave aesthetics. The visual language spread through reblog culture like a digital virus.
          ],
        )
      ],
      block(width: 100%)[
        #stack(
          spacing: .8em,
          glitch-stat([89%], [GEN Z RECOGNITION], pal: pal),
          text(size: 10pt, fill: pal.paper-muted)[
            Of Gen Z recognizes vaporwave imagery. The aesthetic outlived its musical origins entirely.
          ],
        )
      ],
    ),
    sunset-divider(pal: pal),
  )
]

#speaker-note[
  Opening data slide with three glitch-effect statistics establishing the cultural scale of vaporwave. The glitch shadow effect on numbers creates visual tension that mirrors the aesthetic's digital distortion ethos.
]

// ============================================================
// Slide 2 -- Light slide: Origins with retro-cards
// ============================================================

== Origins of the Wave

#text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.pink-text)[CULTURAL ARCHAEOLOGY \/\/ 2010-2014]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 14pt, lazy-layout: true)[
  #retro-card([Early Net Art], [
    GeoCities pages. Under construction GIFs. The first web was handmade, chaotic, and personal. Vaporwave mourned its loss.
  ], pal: pal)
][
  #retro-card([Mall Culture], [
    Empty shopping malls. Muzak playing to nobody. The ambient soundtrack of American consumer decline became source material.
  ], accent: pal.purple, pal: pal)
][
  #retro-card([Japanese Influence], [
    City pop samples. Kanji as decoration. The Western fascination with an imagined Tokyo of neon and chrome and rain.
  ], accent: pal.cyan, pal: pal)
]

#v(0.3em)

#vapor-quote(
  [The internet does not forget. It simply renders the past in lower resolution.],
  attribution: [-- DIGITAL ARCHAEOLOGIST, 2015],
  pal: pal,
)

#speaker-note[
  Three retro-cards present the cultural origins of vaporwave: net art nostalgia, mall culture decay, and Japanese aesthetic appropriation. The vapor-quote component adds philosophical weight with cyan attribution styling.
]

// ============================================================
// Slide 3 -- Grid slide: The Visual Language
// ============================================================

#grid-slide(
  title: [The Visual Language],
  header-left: [DESIGN SYSTEM],
  header-right: [GRID ANALYSIS],
)[
  #text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.pink)[ELEMENTS \/\/ COMPOSITION \/\/ PALETTE]

  #v(0.4em)

  #cols(columns: (1fr, 1fr), gutter: 24pt)[
    #block(width: 100%)[
      #wave-box([Color Theory], [
        Pink-purple gradients dominate. Cyan as accent. Orange sunsets as emotional anchor. Colors borrowed from a sunset that never happened.
      ], pal: pal)
      #v(0.4em)
      #wave-box([Typography], [
        Japanese characters as decoration. All-caps English in wide tracking. The text is not meant to be read -- it is meant to be felt.
      ], pal: pal)
    ]
  ][
    #block(width: 100%)[
      #wave-box([Grid Lines], [
        Perspective grids receding to infinity. The Tron aesthetic repurposed. Every surface is a runway into the digital horizon.
      ], pal: pal)
      #v(0.4em)
      #wave-box([Glitch Effects], [
        Chromatic aberration. Scanlines. VHS tracking errors. The beautiful decay of analog media in a digital world.
      ], pal: pal)
    ]
  ]

  #v(0.3em)

  #grid(columns: (auto, auto, auto, auto, auto), column-gutter: 8pt,
    pixel-tag([GRADIENT], pal: pal),
    pixel-tag([GRID], color: pal.purple, pal: pal),
    pixel-tag([GLITCH], color: pal.cyan, pal: pal),
    pixel-tag([NEON], color: pal.orange, pal: pal),
    pixel-tag([RETRO], color: pal.pink, pal: pal),
  )
]

#speaker-note[
  Grid slide with prominent perspective grid in background. Content uses wave-box components for the four design elements of vaporwave visual language. Pixel-tags at the bottom provide a scannable summary of key terms.
]

// ============================================================
// Slide 4 -- Section divider
// ============================================================

= Cultural Impact

#speaker-note[
  Section transition into cultural impact analysis. The ghost text and grid decoration in the section divider reinforce the vaporwave aesthetic even in structural slides.
]

// ============================================================
// Slide 5 -- Dark slide: Platform Adoption
// ============================================================

#dark-slide(
  title: none,
  ghost: [NET],
  ghost-dy: -20pt,
  ghost-dx: -30pt,
  ghost-size: 200pt,
  header-left: [PLATFORM DATA],
  header-right: [ADOPTION METRICS],
)[
  #text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.cyan)[SOCIAL PLATFORM PENETRATION \/\/ 2014-2026]

  #v(0.3em)

  #text(size: 28pt, weight: "black")[Every platform got vaporwaved.]

  #v(0.4em)

  #cols(columns: (1fr, 1fr), gutter: 24pt)[
    #stack(
      spacing: .8em,
      vapor-meter([Tumblr], 0.95, [Ground zero. 95% saturation by 2015.], pal: pal),
      vapor-meter([Instagram], 0.78, [Filter packs. Story templates. 78% aesthetic overlap.], pal: pal),
      vapor-meter([TikTok], 0.65, [Video transitions. Retro edits. 65% of aesthetic content.], pal: pal),
    )
  ][
    #stack(
      spacing: .8em,
      vapor-meter([Twitter/X], 0.42, [Profile aesthetics. Header art. 42% creative accounts.], pal: pal),
      vapor-meter([YouTube], 0.88, [Thumbnails. Lo-fi streams. 88% music visual overlap.], pal: pal),
      vapor-meter([Pinterest], 0.71, [Mood boards. Room design. 71% aesthetic boards.], pal: pal),
    )
  ]

  #v(0.8em)

  #sunset-divider(pal: pal)
]

#speaker-note[
  Platform penetration data showing how vaporwave aesthetics spread across every major social platform. Progress bars with gradient fills visualize adoption rates. The data tells the story of a subculture becoming mainstream visual language.
]

// ============================================================
// Slide 6 -- Light slide: Evolution Timeline
// ============================================================

== Evolution Timeline

#text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.pink-text)[2010 \/\/ 2014 \/\/ 2018 \/\/ 2022 \/\/ 2026]

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
  block(width: 100%)[
    #block(
      width: 100%,
      fill: pal.pink.transparentize(90%),
      stroke: (top: 3pt + pal.pink),
      inset: (x: 10pt, y: 8pt),
    )[
      #text(size: 9pt, weight: "bold", fill: pal.pink-text, tracking: 1pt)[2010-2012]
      #v(4pt)
      #text(size: 12pt, weight: "bold", fill: pal.ink)[Proto-wave]
      #v(4pt)
      #text(size: 10pt, fill: pal.ink-muted)[
        Chuck Person's Eccojams. The sample as commentary. Bandcamp releases in the thousands.
      ]
    ]
  ],
  block(width: 100%)[
    #block(
      width: 100%,
      fill: pal.purple.transparentize(90%),
      stroke: (top: 3pt + pal.purple),
      inset: (x: 10pt, y: 8pt),
    )[
      #text(size: 9pt, weight: "bold", fill: pal.purple-text, tracking: 1pt)[2013-2016]
      #v(4pt)
      #text(size: 12pt, weight: "bold", fill: pal.ink)[Peak Wave]
      #v(4pt)
      #text(size: 10pt, fill: pal.ink-muted)[
        Tumblr explosion. Roman busts everywhere. The aesthetic crystallized into recognizable form.
      ]
    ]
  ],
  block(width: 100%)[
    #block(
      width: 100%,
      fill: pal.cyan.transparentize(90%),
      stroke: (top: 3pt + pal.cyan),
      inset: (x: 10pt, y: 8pt),
    )[
      #text(size: 9pt, weight: "bold", fill: pal.cyan-text, tracking: 1pt)[2017-2021]
      #v(4pt)
      #text(size: 12pt, weight: "bold", fill: pal.ink)[Post-wave]
      #v(4pt)
      #text(size: 10pt, fill: pal.ink-muted)[
        Mainstream absorption. Brands adopted the look. Irony collapsed into sincerity.
      ]
    ]
  ],
  block(width: 100%)[
    #block(
      width: 100%,
      fill: pal.orange.transparentize(90%),
      stroke: (top: 3pt + pal.orange),
      inset: (x: 10pt, y: 8pt),
    )[
      #text(size: 9pt, weight: "bold", fill: pal.orange-text, tracking: 1pt)[2022-NOW]
      #v(4pt)
      #text(size: 12pt, weight: "bold", fill: pal.ink)[Neo-wave]
      #v(4pt)
      #text(size: 10pt, fill: pal.ink-muted)[
        AI-generated aesthetics. Nostalgia for nostalgia. The ouroboros of digital culture.
      ]
    ]
  ],
)

#v(0.3em)

#grid(columns: (1fr, auto), column-gutter: 12pt,
  text(size: 10pt, fill: pal.ink-muted)[
    Timeline based on cultural analytics data. Peak engagement measured across Tumblr, Reddit, and Twitter.
  ],
  neon-badge([SOURCE: DIGITAL CULTURE INDEX], pal: pal),
)

#speaker-note[
  Four-era timeline of vaporwave evolution using color-coded cards with accent top borders. Each era card uses a different accent color from the palette to visually distinguish phases. Neon badge provides source attribution.
]

// ============================================================
// Slide 7 -- Grid slide: Technical Architecture
// ============================================================

#grid-slide(
  title: [The Aesthetic Stack],
  header-left: [TECH BREAKDOWN],
  header-right: [ARCHITECTURE],
)[
  #cols(columns: (1fr, 1fr), gutter: 24pt)[
    #block(width: 100%)[
      #text(size: 14pt, weight: "bold", fill: pal.paper)[Visual Layer]
      #v(0.3em)

      #retro-card([Color Processing], [
        RGB channel splitting. Hue rotation +180deg. Saturation at 140%. The pink does not exist in nature.
      ], pal: pal)

      #v(0.3em)

      #retro-card([Grid Generation], [
        Perspective transform. Vanishing point at center. Line density increases with distance. Infinite regression.
      ], accent: pal.cyan, pal: pal)
    ]
  ][
    #block(width: 100%)[
      #text(size: 14pt, weight: "bold", fill: pal.paper)[Audio Layer]
      #v(0.3em)

      #retro-card([Sample Processing], [
        Pitch shift -25%. Reverb tail 4.2s. Chorus depth at maximum. The original is irrelevant.
      ], accent: pal.purple, pal: pal)

      #v(0.3em)

      #retro-card([Output Format], [
        Cassette saturation emulation. Dolby B noise reduction artifacts preserved intentionally.
      ], accent: pal.orange, pal: pal)
    ]
  ]

  #v(0.3em)

  #grid(columns: (auto, auto, auto, auto), column-gutter: 8pt,
    pixel-tag([RGB SPLIT], pal: pal),
    pixel-tag([REVERB], color: pal.purple, pal: pal),
    pixel-tag([PITCH], color: pal.cyan, pal: pal),
    pixel-tag([ANALOG], color: pal.orange, pal: pal),
  )
]

#speaker-note[
  Grid slide showcasing the technical processes behind vaporwave creation. Retro-cards with different accent colors describe both visual and audio processing chains. The grid background reinforces the digital-infrastructure metaphor.
]

// ============================================================
// Slide 8 -- Hero image with Canvas overlays
// ============================================================

#hero-slide(background-image: hero-art)[
  #grid-pattern(rows: 6, opacity: 92%, pal: pal)
  #place(bottom + left, dx: 4em, dy: -3em)[
    #block(width: 55%)[
      #stack(
        spacing: .8em,
        neon-badge([FIELD NOTE 08], color: pal.cyan, pal: pal),
        glitch-text([Neon City After Dark], size: 34pt, pal: pal),
        text(size: 12pt, fill: pal.paper)[
          Vaporwave moved from browser windows into streets, storefronts, and the imagined skylines of a digital past.
        ],
      )
    ]
  ]
]

#speaker-note[
  The hero slide demonstrates full-bleed image treatment, a dark scrim, placed text, the public grid-pattern helper, a neon badge, and glitch typography without sacrificing readability.
]

// ============================================================
// Slide 9 -- Section divider
// ============================================================

= Legacy and Future

#speaker-note[
  Final section transition examining what vaporwave left behind and where digital aesthetics go from here.
]

// ============================================================
// Slide 10 -- Dark slide: Legacy metrics
// ============================================================

#dark-slide(
  title: none,
  ghost: [FIN],
  ghost-dy: -30pt,
  ghost-dx: -20pt,
  ghost-size: 200pt,
  header-left: [LEGACY],
  header-right: [IMPACT ASSESSMENT],
)[
  #text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.pink)[CULTURAL LEGACY \/\/ MEASURED IMPACT]

  #v(0.3em)

  #text(size: 28pt, weight: "black")[What the wave left behind.]

  #v(0.5em)

  #cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 14pt, lazy-layout: true)[
    #glitch-stat([47], [SUBGENRES SPAWNED], pal: pal)
  ][
    #glitch-stat([12K], [ALBUMS RELEASED], pal: pal)
  ][
    #glitch-stat([3.2B], [STREAMS TOTAL], pal: pal)
  ][
    #glitch-stat([156], [BRANDS ADOPTED], pal: pal)
  ]

  #v(0.5em)

  #cols(columns: (1fr, 1fr), gutter: 24pt, lazy-layout: true)[
    #wave-box([Musical Legacy], [
      Future funk. Mallsoft. Broken transmission. Signalwave. Each subgenre took one element and pushed it to its logical extreme.
    ], pal: pal)
  ][
    #wave-box([Visual Legacy], [
      Every gradient on every app. Every neon sign in every coffee shop. The aesthetic escaped the internet and colonized physical space.
    ], pal: pal)
  ]
]

#speaker-note[
  Legacy metrics with four glitch-stat numbers showing cultural scale. Wave-boxes below provide qualitative context for both musical and visual legacies. The ghost text FIN signals we are approaching the end.
]

// ============================================================
// Slide 11 -- Light slide: Influence map
// ============================================================

== Downstream Influence

#text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.pink-text)[WHERE THE AESTHETIC WENT \/\/ 2016-2026]

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 14pt,
  block(width: 100%)[
    #block(
      width: 100%,
      fill: pal.pink.transparentize(92%),
      stroke: (left: 3pt + pal.pink),
      inset: (x: 12pt, y: 10pt),
    )[
      #text(size: 12pt, weight: "bold", fill: pal.ink)[Brand Design]
      #v(6pt)
      #text(size: 10pt, fill: pal.ink-muted)[
        - Gradient logos everywhere
        - Neon sign photography
        - Retrowave product launches
        - Synthwave in commercials
      ]
      #v(6pt)
      #pixel-tag([MAINSTREAM], pal: pal)
    ]
  ],
  block(width: 100%)[
    #block(
      width: 100%,
      fill: pal.purple.transparentize(92%),
      stroke: (left: 3pt + pal.purple),
      inset: (x: 12pt, y: 10pt),
    )[
      #text(size: 12pt, weight: "bold", fill: pal.ink)[Game Design]
      #v(6pt)
      #text(size: 10pt, fill: pal.ink-muted)[
        - Neon-lit cityscapes
        - Retro UI overlays
        - Outrun-style racing games
        - Pixel art renaissance
      ]
      #v(6pt)
      #pixel-tag([GAMING], color: pal.purple, pal: pal)
    ]
  ],
  block(width: 100%)[
    #block(
      width: 100%,
      fill: pal.cyan.transparentize(92%),
      stroke: (left: 3pt + pal.cyan),
      inset: (x: 12pt, y: 10pt),
    )[
      #text(size: 12pt, weight: "bold", fill: pal.ink)[Interior Design]
      #v(6pt)
      #text(size: 10pt, fill: pal.ink-muted)[
        - LED strip lighting
        - Pastel furniture
        - Grid-pattern wallpaper
        - Neon sign decor
      ]
      #v(6pt)
      #pixel-tag([PHYSICAL], color: pal.cyan, pal: pal)
    ]
  ],
)

#v(0.3em)

#vapor-quote(
  [We live inside the aesthetic now. There is no outside.],
  attribution: [-- POST-INTERNET CRITIC, 2024],
  pal: pal,
)

#speaker-note[
  Downstream influence mapped across three domains: brand design, game design, and interior design. Each column uses a different accent color with matching left border. The vapor-quote provides a critical perspective on aesthetic saturation.
]

// ============================================================
// Slide 12 -- Focus slide
// ============================================================

#focus-slide[
  The future is already nostalgic. #linebreak()
  We are living in someone else's retro.
]

#speaker-note[
  Focus slide with glow effect delivering the core thesis. The gradient background and text shadow create depth that embodies the layered nature of post-internet nostalgia.
]

// ===== Ending =====

#ending-slide[Thank You]

#speaker-note[
  Closing slide with sunset gradient. The aesthetic journey ends as it began -- in gradients fading to infinity. A E S T H E T I C.
]
