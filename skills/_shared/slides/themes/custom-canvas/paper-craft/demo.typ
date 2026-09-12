#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: paper-craft-theme.with(
  aspect-ratio: "16-9",
  preset: "origami",
  footer: [Paper Craft Studio],
  config-info(
    title: [The Art of Paper Craft],
    subtitle: [Kirigami, Collage, and the Beauty of Layered Paper],
    author: [Studio Origami],
    date: datetime.today(),
    institution: [International Paper Arts Institute],
  ),
  config-common(breakable: false),
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

// ======= Title Slide =======

#title-slide()

// ======= Section 1 =======

= Foundations

== The Language of Paper

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 20pt,
  paper-card([Paper as Medium], [
    Paper is not merely a surface -- it is a sculptural material with memory. Every fold creates a permanent crease. Every cut reveals what lies beneath. The interplay of light and shadow across layered surfaces creates depth impossible to achieve digitally.
  ]),
  paper-card([Dimensionality], [
    The key principle: paper has *thickness*. When layers stack, shadows form naturally. When edges tear, fiber textures emerge. The craft celebrates these physical properties rather than hiding them.
  ], accent: palette.secondary),
)

== Core Techniques

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 16pt,
  cutout-stat([FOLD], [64], description: [distinct fold types in origami], accent: palette.accent),
  cutout-stat([CUT], [12], description: [primary cutting techniques], accent: palette.secondary),
  cutout-stat([LAYER], [5+], description: [depth levels recommended], accent: palette.tertiary),
)

#v(8pt)

#scissors-divider()

#v(4pt)

#note-quote([
  The paper remembers every touch. A master folder works with the material, not against it -- reading the grain, respecting the fiber direction, and letting the sheet guide the form.
], cite: [Akira Yoshizawa, 1911--2005])

// ======= Section 2 =======

= Techniques & Materials

== Paper Selection Guide

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 18pt,
  folder-box([Weight Classes], [
    - *Tissue (15-30 gsm)* -- Translucent layers, lanterns
    - *Kami (40-60 gsm)* -- Traditional origami
    - *Text weight (80-120 gsm)* -- Kirigami, pop-ups
    - *Card stock (200-300 gsm)* -- Structural, shadow boxes
    - *Board (350+ gsm)* -- Architectural models
  ], accent: palette.secondary),
  folder-box([Grain Direction], [
    - Machine-made paper has directional grain
    - Folds *with* the grain are cleaner
    - Tears *across* grain produce fiber texture
    - Test by tearing: smoother edge = grain direction
    - Handmade papers (washi) have random grain
  ], accent: palette.tertiary),
)

== The Shadow Box Method

#cols(columns: (2fr, 1fr), gutter: 18pt)[
  #collage-highlight([
    *Step 1:* Design your scene in 4-6 separate layers, front to back.

    *Step 2:* Cut each layer from progressively lighter paper -- darkest in front, lightest at rear.

    *Step 3:* Separate layers with 3mm foam spacers. The gap is what creates natural shadow.

    *Step 4:* Light from the side. The deeper layers recede into shadow; front layers catch highlights.

    The magic is in the spacing -- not the cutting.
  ])
][
  #envelope-card([Materials], [
      - 4-6 sheets card stock
      - Craft knife + cutting mat
      - 3mm foam adhesive dots
      - Side-lighting (LED strip)
      - Frame (shadow box depth)
  ], accent: palette.accent)
  #v(10pt)
  #origami-label([Advanced technique], color: palette.accent)
]

== Kirigami Architecture

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 14pt,
  paper-card([V-Fold], [
    The foundation of all pop-up engineering. A single diagonal cut and fold creates an element that rises perpendicular to the page when opened.
    #v(4pt)
    #stamp-tag([Foundation], color: palette.accent)
  ]),
  paper-card([Parallel Fold], [
    Creates platforms that rise parallel to the base. Perfect for buildings, bridges, and architectural elements that need flat tops.
    #v(4pt)
    #stamp-tag([Intermediate], color: palette.secondary)
  ], accent: palette.secondary),
  paper-card([Pull Tab], [
    Moving elements activated by pulling. Adds interactivity and kinetic surprise. Requires careful engineering of pivot points and clearances.
    #v(4pt)
    #stamp-tag([Advanced], color: palette.tertiary)
  ], accent: palette.tertiary),
)

// ======= Section 3 =======

= Creative Projects

== Layered Landscape

#cols[
  #collage-highlight([
    *Project: Moonlit Mountain Scene*

    Create a 5-layer paper landscape that transforms with changing light:

    - Layer 1 (rear): Full moon circle, cut from white
    - Layer 2: Distant mountain silhouette, navy
    - Layer 3: Pine tree line, dark green
    - Layer 4: Foreground hills, charcoal
    - Layer 5 (front): Grass detail, black

    Illuminated from behind, the moon glows through all layers.
  ])
][
  #tape-strip([
    *Time required:* 3-4 hours

    *Difficulty:* Intermediate

    *Papers needed:* 5 different weights and colors

    *Tools:* Precision knife, self-healing mat, steel ruler, bone folder
  ], color: palette.tertiary)
  #v(12pt)
  #note-quote([
    Let the light do the work. Your job is creating the gaps through which it speaks.
  ])
]

== Workshop Statistics

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt,
  cutout-stat([STUDENTS], [847], description: [trained this year]),
  cutout-stat([HOURS], [120], description: [of curriculum], accent: palette.secondary),
  cutout-stat([PROJECTS], [36], description: [in portfolio], accent: palette.tertiary),
  cutout-stat([EXHIBITS], [8], description: [gallery shows], accent: palette.accent),
)

#v(6pt)

#scissors-divider()

== Gallery Highlights

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 18pt,
  envelope-card([Recent Exhibitions], [
      - *Paper Forest* -- Tokyo Design Week 2025
      - *Folded Light* -- Berlin Craft Biennale
      - *Cut Stories* -- London V\&A Museum
      - *Layer by Layer* -- New York MoMA PS1
      - *Shadow Theatre* -- Kyoto International
  ], accent: palette.secondary),
  paper-card([Recognition], [
      Our alumni have received the International Paper Arts Prize (2024), the Yoshizawa Memorial Award, and three national craft council grants. Student work ranges from intimate handmade books to monumental architectural installations spanning 20 meters.
  ], accent: palette.tertiary),
)

// ======= Dark Slide =======

#dark-slide(title: [The Night Studio])[
  #cols(columns: (1fr, 1fr), gutter: 20pt)[
    #text(size: 14pt, fill: palette.dark-ink)[
        When the studio lights dim and the desk lamp creates a focused pool of light, paper craft becomes meditation. The precision of a midnight cutting session. The satisfaction of a perfect crease.

        #v(8pt)
        In the quiet hours, the paper speaks. You learn to read its grain by touch, to feel where it wants to fold, where it resists.
    ]
  ][
    #block(fill: palette.accent.transparentize(85%), inset: 14pt, radius: 3pt,
      stroke: 0.5pt + palette.accent.transparentize(60%))[
      #text(size: 12pt, fill: palette.dark-ink, weight: "bold")[Studio Essentials]
      #v(6pt)
      #text(size: 11pt, fill: palette.dark-ink.transparentize(20%))[
        - Warm-tone desk lamp (3000K)
        - Fresh blade every session
        - Bone folder within reach
        - Reference images pinned above
        - Tea, always tea
      ]
    ]
  ]
]

// ======= Section 4 =======

= Philosophy & Practice

== Design Principles

#cols(columns: (1fr, 1fr), gutter: 18pt)[
    #paper-card([Less is More], [
      The most powerful paper art uses restraint. A single clean fold speaks louder than a hundred cuts. Let negative space do the work -- what you remove matters as much as what remains.
    ])
    #v(12pt)
    #tape-strip([
      *Principle:* Every cut must serve the story. Every fold must earn its place. If an element could be removed without loss, remove it.
    ], color: palette.accent)
][
    #paper-card([Embrace Imperfection], [
      Hand-torn edges have a warmth that precision cutting cannot replicate. The slight wobble of a hand fold, the fiber texture of a ripped edge -- these are features, not flaws. They declare: a human made this.
    ], accent: palette.secondary)
    #v(12pt)
    #origami-label([Wabi-sabi approach], color: palette.secondary)
]

== The Practice Cycle

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 14pt,
  folder-box([Study], [
    - Observe paper in nature
    - Study master works
    - Sketch before cutting
    - Analyze shadow patterns
    - Learn material science
  ], accent: palette.accent),
  folder-box([Create], [
    - Start with simple forms
    - Build complexity slowly
    - Document each step
    - Iterate on failures
    - Push one boundary at a time
  ], accent: palette.secondary),
  folder-box([Share], [
    - Exhibit your work
    - Teach others
    - Accept critique
    - Collaborate widely
    - Build community
  ], accent: palette.tertiary),
)

// ======= Dark Slide 2 =======

#dark-slide(title: [Key Insights])[
  #cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
    #block(fill: palette.accent.transparentize(85%), inset: 14pt, radius: 3pt,
      stroke: 0.5pt + palette.accent.transparentize(60%))[
      #text(size: 13pt, fill: palette.dark-ink, weight: "bold")[Material First]
      #v(6pt)
      #text(size: 11pt, fill: palette.dark-ink.transparentize(20%))[
        Let the paper's properties guide your design. Weight, grain, color, and texture all inform what is possible.
      ]
    ]
  ][
    #block(fill: palette.secondary.transparentize(85%), inset: 14pt, radius: 3pt,
      stroke: 0.5pt + palette.secondary.transparentize(60%))[
      #text(size: 13pt, fill: palette.dark-ink, weight: "bold")[Shadow Thinking]
      #v(6pt)
      #text(size: 11pt, fill: palette.dark-ink.transparentize(20%))[
        Design for the shadows, not just the surfaces. Depth comes from what you cannot directly see -- the gaps between layers.
      ]
    ]
  ][
    #block(fill: palette.tertiary.transparentize(85%), inset: 14pt, radius: 3pt,
      stroke: 0.5pt + palette.tertiary.transparentize(60%))[
      #text(size: 13pt, fill: palette.dark-ink, weight: "bold")[Patient Practice]
      #v(6pt)
      #text(size: 11pt, fill: palette.dark-ink.transparentize(20%))[
        Mastery comes from repetition. Fold the same crane 1000 times -- each one teaches something the last did not.
      ]
    ]
  ]
]

// ======= Focus & Ending =======

#focus-slide[
  Every masterpiece begins with a single sheet and the courage to make the first cut.
]

#ending-slide[Thank You]
