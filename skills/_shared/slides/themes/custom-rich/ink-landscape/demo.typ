// Ink Landscape Theme Demo — Classical Chinese Poetry and Landscape Painting
// A scholarly presentation on the intersection of verse and visual art
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"))
#show raw: set text(font: ("Menlo", "Noto Sans SC"))

#show: ink-landscape-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Classical Chinese Landscape Aesthetics],
  config-info(
    title: [Mountains and Waters],
    subtitle: [Poetry, Painting, and the Chinese Landscape Tradition],
    author: [Prof. Chen Weiming],
    institution: [Institute of Classical Arts, Nanjing University],
    date: datetime(year: 2026, month: 5, day: 23),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Foundations of Shanshui
// ══════════════════════════════════════
= The Shanshui Tradition

== Origins of Landscape Painting

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  scroll-card([Historical Origins], [
    Chinese landscape painting (山水画) emerged during the *Six Dynasties* period (220--589 CE) as artists sought to capture the spiritual essence of nature.

    - Earliest surviving works date to 5th century
    - Gu Kaizhi's theoretical writings established foundations
    - "Spirit resonance" (气韵生动) as primary aesthetic goal
  ], accent: palette.primary),
  scroll-card([Philosophical Roots], [
    Three philosophical streams converge in shanshui painting:

    - *Daoist naturalism* -- harmony with the flow of nature
    - *Buddhist impermanence* -- the mist that veils and reveals
    - *Confucian self-cultivation* -- painting as moral practice
  ], accent: palette.bamboo-green),
)

#v(0.4em)

#verse-quote(
  [Mountains and waters are things that have physical form but approach the spiritual.],
  author: [Zong Bing, Introduction to Painting Landscape (5th century)]
)

== The Six Principles

#cols[
  #stack(
    spacing: 0.8em,
    landscape-section([Xie He's Six Principles of Painting (六法)], [
      1. *Spirit Resonance* (气韵生动) -- vitality and life breath
      2. *Bone Method* (骨法用笔) -- structural use of the brush
      3. *Correspondence to Objects* (应物象形) -- depicting form
      4. *Suitability to Type* (随类赋彩) -- applying color
      5. *Division and Planning* (经营位置) -- composition
      6. *Transmission by Copying* (传移模写) -- learning from masters
    ]),
    ink-divider(color: palette.text-light, width: 60%),
    stack(dir: ltr, spacing: 0.6em,
      stamp-tag([Six Dynasties], color: palette.accent),
      stamp-tag([Aesthetic Canon], color: palette.primary),
      stamp-tag([Still Relevant], color: palette.bamboo-green),
    ),
  )
][
  #stack(
    spacing: 0.8em,
    ink-box([The Primacy of Spirit], [
      Xie He placed "spirit resonance" first deliberately. Technical skill without spiritual vitality produces dead paintings.

      The master Wang Wei wrote: _"Painting is not about depicting the outward appearance but about capturing the inner spirit."_

      This principle distinguishes Chinese painting from Western naturalism -- truth lies not in optical accuracy but in felt experience.
    ], accent: palette.primary),
    mist-card([Modern Interpretation], [
      Contemporary scholars see the Six Principles as an early theory of artistic semiotics -- form serves meaning, technique serves vision.
    ]),
  )
]

// ══════════════════════════════════════
// Section 2: Masters and Techniques
// ══════════════════════════════════════
= Masters and Methods

== The Northern and Southern Schools

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  ink-box([Northern School (北宗)], [
    *Bold, structural, monumental.*

    - Li Cheng, Fan Kuan, Guo Xi
    - Powerful brushwork with clear outlines
    - Towering peaks, dramatic waterfalls
    - "Axe-cut" texture strokes (斧劈皴)
    - Professional court painters
  ], accent: palette.primary),
  ink-box([Southern School (南宗)], [
    *Subtle, atmospheric, poetic.*

    - Wang Wei, Mi Fu, Ni Zan
    - Soft washes and dissolved forms
    - Misty valleys, gentle hills
    - "Hemp-fiber" texture strokes (披麻皴)
    - Scholar-amateur painters (文人画)
  ], accent: palette.bamboo-green),
)

#v(0.4em)

#pavilion-highlight([Dong Qichang's Theory], [
  In the Ming dynasty, Dong Qichang (1555--1636) systematized this division, arguing the Southern School represented true painting because it prioritized personal expression over technical display. This theory shaped Chinese art criticism for centuries.
])

== Brush Techniques

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  seal-stat([Texture Strokes], [26+], color: palette.primary),
  seal-stat([Ink Gradations], [5 tones], color: palette.accent),
  seal-stat([Brush Angles], [360 deg], color: palette.bamboo-green),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  scroll-card([The Five Ink Tones (墨分五色)], [
    - *Burnt* (焦) -- thickest, nearly dry
    - *Dense* (浓) -- full rich black
    - *Heavy* (重) -- medium dark
    - *Light* (淡) -- dilute gray
    - *Clear* (清) -- barely tinted water
  ], accent: palette.primary),
  scroll-card([Key Texture Strokes (皴法)], [
    - *Axe-cut* (斧劈皴) -- angular, bold
    - *Hemp-fiber* (披麻皴) -- flowing, soft
    - *Raindrop* (雨点皴) -- dotted, textural
    - *Cloud-head* (云头皴) -- rounded, swirling
    - *Lotus-vein* (荷叶皴) -- radiating lines
  ], accent: palette.text-body),
)

== Composition Principles

#cols[
  #stack(
    spacing: 0.8em,
    landscape-section([The Three Distances (三远法)], [
      Guo Xi's three spatial methods in landscape painting:
    ]),
    cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      mist-card([High Distance (高远)], [
        Looking up from base to peaks. Creates grandeur and awe.
      ]),
      mist-card([Deep Distance (深远)], [
        Looking from front through to rear mountains. Creates layered depth.
      ]),
      mist-card([Level Distance (平远)], [
        Looking across to distant mountains. Creates expansiveness.
      ]),
    ),
  )
][
  #stack(
    spacing: 0.8em,
    ink-box([The Moving Perspective], [
      Unlike Western single-point perspective, Chinese landscape uses *shifting viewpoints*. The viewer travels through the painting as if walking through the landscape -- ascending, descending, stopping at pavilions.

      This is why Chinese scrolls are read horizontally over time, not perceived as a single frozen moment.
    ], accent: palette.accent),
    verse-quote(
      [A mountain seen from nearby has one appearance; from a distance of several miles, another; from a distance of tens of miles, yet another.],
      author: [Guo Xi, Linquan Gaozhi (1080)]
    ),
  )
]

// ══════════════════════════════════════
// Section 3: Poetry and Painting
// ══════════════════════════════════════
= Poetry in Painting

== Wang Wei and the Unity of Arts

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  pavilion-highlight([Wang Wei (701--761)], [
    Tang dynasty poet-painter who established the ideal of *shi zhong you hua, hua zhong you shi* (诗中有画, 画中有诗) -- "in poetry there is painting, in painting there is poetry."

    His snow landscapes and river scenes embodied Buddhist emptiness through vast unpainted spaces.
  ]),
  block(width: 100%)[
    #verse-quote(
      [Empty mountain, no one to be seen / Only hearing the echo of voices. / Returning light enters the deep forest / Again shining on the green moss.],
      author: [Wang Wei, Deer Enclosure]
    )
    #v(0.4em)
    #stack(dir: ltr, spacing: 0.5em,
      stamp-tag([Tang Dynasty], color: palette.accent),
      stamp-tag([Chan Buddhism], color: palette.bamboo-green),
      stamp-tag([Wenren Painting], color: palette.primary),
    )
  ],
)

== Inscriptions and Colophons

#cols[
  #scroll-card([The Four Treasures of the Study], [
    The tools of the scholar-painter create a unified aesthetic world:

    - *Brush* (笔) -- wolf hair or goat hair, soft or stiff
    - *Ink* (墨) -- pine soot or tung oil soot, ground with water
    - *Paper* (纸) -- Xuan paper from Anhui, absorbent rice fiber
    - *Inkstone* (砚) -- carved stone for grinding ink
  ], accent: palette.primary)

  #v(0.3em)

][
  #ink-box([The Role of Seals (印章)], [
    Red seal impressions serve multiple functions:

    - *Authentication* -- artist's personal seal
    - *Ownership* -- collector's seal marks provenance
    - *Composition* -- red punctuation in monochrome field
    - *Historical record* -- traces the painting's journey through time
  ], accent: palette.accent)

  #v(0.4em)

  #mist-card([Colophon Tradition], [
    Later viewers add poetic responses to paintings, creating a dialogue across centuries. A single scroll may accumulate colophons from dozens of scholars spanning 800 years.
  ])
]

// ══════════════════════════════════════
// Section 4: Materials and Process
// ══════════════════════════════════════
= The Material World

== Xuan Paper and Silk

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  scroll-card([Xuan Paper (宣纸)], [
    Made in Jing County, Anhui since the Tang dynasty. The unique absorbency of bark fiber paper allows ink to bleed and feather naturally.

    *Types:*
    - Raw (生宣) -- maximum absorbency, spontaneous effects
    - Processed (熟宣) -- sized with alum, precise control
    - Semi-raw (半生熟) -- balanced properties
  ], accent: palette.primary),
  scroll-card([Silk Painting (绢本)], [
    Before paper, silk was the primary support. Its smooth surface produces different brushwork character.

    *Properties:*
    - Smooth, non-absorbent surface
    - Allows fine detail and layering
    - Translucent -- can be painted on both sides
    - More durable but less expressive than paper
  ], accent: palette.text-body),
)

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em,
  seal-stat([Paper Age], [1500+ yr], color: palette.accent),
  seal-stat([Fiber Layers], [100+], color: palette.primary),
  seal-stat([Drying Time], [30 sec], color: palette.bamboo-green),
  seal-stat([Absorption], [0.3 mm], color: palette.text-body),
)

== Ink Preparation

#cols[
  #landscape-section([The Ritual of Grinding Ink], [
    Grinding ink on an inkstone is not merely preparation -- it is meditation. The circular motion calms the mind, the scent of pine soot focuses attention, and the gradual darkening of water mirrors the emergence of creative vision.
  ])

  #v(0.4em)

  #cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
    mist-card([Pine Soot Ink (松烟墨)], [
      Cool blue-black tone. Preferred for calligraphy and landscapes. The soot from burning pine branches produces fine particles with a matte quality.
    ]),
    mist-card([Oil Soot Ink (油烟墨)], [
      Warm brown-black tone with subtle sheen. From tung oil or sesame oil combustion. Favored for figure painting and detailed work.
    ]),
  )
][
  #ink-box([Ink Properties], [
    *Concentration affects everything:*
    - Thick ink (浓墨) -- structural elements, foreground
    - Medium ink -- middle ground, transitions
    - Light ink (淡墨) -- atmosphere, distance
    - "Broken ink" (破墨) -- wet-into-wet, spontaneous effects
    - "Splashed ink" (泼墨) -- expressive abstraction
  ], accent: palette.primary)

  #v(0.4em)

  #verse-quote(
    [The inkstone knows my thoughts before the brush touches paper.],
    author: [Su Shi, Notes on Painting]
  )
]

// ══════════════════════════════════════
// Section 5: Legacy and Modern Practice
// ══════════════════════════════════════
= Living Tradition

== Song Dynasty Masterworks

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  pavilion-highlight([Fan Kuan -- Travelers Among Mountains], [
    The supreme achievement of Northern Song monumental landscape. A massive cliff face fills the upper two-thirds, dwarfing tiny travelers below. The waterfall thread connects heaven and earth.

    *Dimensions:* 206.3 x 103.3 cm \
    *Date:* c. 1000 CE \
    *Location:* National Palace Museum, Taipei
  ]),
  pavilion-highlight([Guo Xi -- Early Spring], [
    The definitive expression of "high distance" composition. Twisted pines and crab-claw branches create organic rhythm. Mist dissolves boundaries between rock and air.

    *Dimensions:* 158.3 x 108.1 cm \
    *Date:* 1072 CE \
    *Location:* National Palace Museum, Taipei
  ]),
)

#stack(
  spacing: 0.8em,
  ink-divider(color: palette.primary, width: 50%),
  stack(dir: ltr, spacing: 0.5em,
    stamp-tag([Northern Song], color: palette.accent),
    stamp-tag([Monumental Style], color: palette.primary),
    stamp-tag([National Treasures], color: palette.bamboo-green),
  ),
)

== The Yuan Dynasty Transformation

#cols[
  #scroll-card([Scholar Painting Revolution], [
    After the Mongol conquest, Chinese scholars withdrew from public life. Painting became intensely personal -- an expression of character rather than description of nature.

    *Key innovations:*
    - Deliberate "awkwardness" as authenticity
    - Calligraphic abstraction of natural forms
    - Empty space as philosophical statement
    - Painting as self-portrait of inner life
  ], accent: palette.primary)

  #v(0.4em)

  #cols(columns: (1fr, 1fr), gutter: 0.8em,
    seal-stat([Yuan Masters], [4 key], color: palette.accent),
    seal-stat([Influence], [700+ yr], color: palette.bamboo-green),
  )
][
  #ink-box([Ni Zan's Aesthetic of Emptiness], [
    Ni Zan (1301--1374) painted landscapes of radical simplicity:
    - Foreground trees (sparse, skeletal)
    - Empty middle ground (no bridge, no boat, no figure)
    - Distant hills (barely visible)

    He called his works "just to express the feelings in my breast." This anti-decorative stance became the highest ideal of literati painting.
  ], accent: palette.primary)

  #v(0.3em)

  #verse-quote(
    [I paint bamboo simply to express the untrammeled spirit in my breast. Why should I care whether the leaves are correct or not?],
    author: [Ni Zan]
  )
]

== Modern Continuity

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  scroll-card([20th Century Masters], [
    - *Qi Baishi* -- folk vitality meets literati tradition
    - *Huang Binhong* -- dense layered ink landscapes
    - *Zhang Daqian* -- splashed-ink abstraction
    - *Li Keran* -- ink landscape with modern vision
  ], accent: palette.primary),
  scroll-card([Contemporary Practice], [
    - New materials (acrylic ink, mixed media)
    - Installation and digital extensions
    - Cross-cultural dialogue with Western abstraction
    - Environmental themes in landscape idiom
  ], accent: palette.bamboo-green),
  scroll-card([Academic Study], [
    - Conservation science for ancient works
    - Digital analysis of brushwork
    - Provenance research using AI
    - Cultural heritage documentation projects
  ], accent: palette.accent),
)

#v(0.4em)

#verse-quote(
  [The old methods cannot be discarded, yet the new cannot simply imitate. Between tradition and innovation lies the narrow path of genuine art.],
  author: [Huang Binhong, Talks on Art]
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"In painting landscapes, the idea should precede the brush."_

  #text(size: 0.6em, weight: "regular", fill: palette.text-body)[-- Wang Wei, Secrets of Landscape Painting]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
