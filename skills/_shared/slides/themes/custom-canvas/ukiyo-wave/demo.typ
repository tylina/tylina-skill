// Ukiyo-Wave Theme Demo
// Japanese ukiyo-e woodblock print aesthetic -- Hokusai's Great Wave
// Showcases all slide types and components with themed content

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Hiragino Sans GB"), size: 20pt)

#show: ukiyo-wave-theme.with(
  aspect-ratio: "16-9",
  footer: [UKIYO-WAVE],
  preset: "indigo",
  config-info(
    title: [The Art of the Floating World],
    subtitle: [Ukiyo-e Woodblock Printing in Edo Japan],
    author: [Katsushika Hokusai Studio],
    date: datetime.today(),
    institution: [Edo Art Collective],
  ),
  config-common(breakable: false),
)

// =====================================================================
// Title Slide
// =====================================================================

#title-slide()

#speaker-note[Open with the visual language of Hokusai's waves and introduce the floating-world theme.]

// =====================================================================
// Outline
// =====================================================================

#outline-slide()

#speaker-note[Preview the five-part journey from ukiyo-e's origins through its living global legacy.]

// =====================================================================
// Section 1: Origins
// =====================================================================

= The Floating World

#speaker-note[Frame the floating world as both a historical idea and a visual culture rooted in Edo life.]

== Ukiyo-e: Pictures of the Floating World

#cols[
  Ukiyo-e emerged in 17th century Japan as a democratic art form, accessible to merchants and commoners of the rising urban culture.

  #v(0.8em)
  #cols(columns: (1fr, 1fr), gutter: 16pt)[
    #wave-card([Origins], [
      Born in Edo (Tokyo) during the Tokugawa shogunate, ukiyo-e captured the pleasures of city life -- theaters, tea houses, and natural beauty.
    ])
  ][
    #wave-card([Technique], [
      A collaborative process: the artist designed, a carver cut woodblocks, and a printer applied pigments. Each print required perfect alignment of multiple blocks.
    ])
  ]
][
  #v(0.4em)
  #scroll-quote([
    The floating world -- ukiyo -- originally a Buddhist term for the sorrows of earthly existence, was recast as a celebration of fleeting pleasures.
  ], cite: [Nara Yoshitomo])
]

#speaker-note[Introduce ukiyo-e as Japan's most influential art movement, emphasizing its accessibility to common people.]

// =====================================================================
// Section 2: Masters
// =====================================================================

= Masters of the Print

#speaker-note[Introduce the artists whose distinct genres shaped ukiyo-e's golden age.]

== The Great Masters of Ukiyo-e

#cols[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 14pt,
    edo-stat([HOKUSAI], [36], description: [Views of Mount Fuji]),
    edo-stat([HIROSHIGE], [53], description: [Stations of the Tokaido]),
    edo-stat([UTAMARO], [100+], description: [Portraits of beauties]),
  )
  #v(0.5em)
  #torii-divider()
  #v(0.3em)
  These three masters defined the golden age of ukiyo-e, each bringing a unique vision to the woodblock medium.
][
  #woodblock-panel([Timeline], [
    - *1760s* -- Harunobu: full-color printing (nishiki-e)
    - *1790s* -- Utamaro: the beauty portrait (bijin-ga)
    - *1830s* -- Hokusai: Thirty-Six Views of Mt. Fuji
    - *1833* -- Hiroshige: Fifty-Three Stations
  ])
]

#speaker-note[Cover the three greatest masters and how each defined a distinct genre within ukiyo-e.]

== Hokusai: The Old Man Mad About Painting

#dark-slide(title: [Hokusai: The Old Man Mad About Painting], header-left: [MASTERS], header-right: [1760--1849])[
  #grid(columns: (2fr, 1fr), column-gutter: 24pt,
    {
      set text(fill: palette.ink)
      text(size: 13pt, fill: palette.ink-dim)[
        Katsushika Hokusai changed his name over 30 times and moved house 93 times. His restless creativity produced over 30,000 works across 70 years.
      ]
      v(1em)
      text(size: 1.1em, weight: "semibold", fill: palette.ink)[
        "From the age of six I had a mania for drawing. At seventy-three I understood the true form of animals, plants, trees, birds, fishes, and insects."
      ]
      v(1em)
      grid(columns: (1fr, 1fr), column-gutter: 12pt,
        {
          ukiyo-tag[LANDSCAPE]
          h(6pt)
          ukiyo-tag[NATURE]
        },
        {
          ukiyo-tag[MANGA]
          h(6pt)
          ukiyo-tag[WAVE]
        },
      )
    },
    {
      set text(fill: palette.ink)
      v(0.5em)
      kamon-icon([北], size: 48pt, color: palette.accent)
      v(1em)
      text(size: typo.small, fill: palette.ink-muted)[
        Hokusai's personal seal combined his artistic philosophy with bold graphic design.
      ]
    },
  )
]

#speaker-note[Deep dive into Hokusai's extraordinary life and artistic philosophy, emphasizing his lifelong pursuit of perfection.]

// =====================================================================
// Section 3: Technique
// =====================================================================

= The Woodblock Process

#speaker-note[Introduce the four-person production chain behind every finished woodblock print.]

== From Design to Print: A Collaborative Art

#cols[
  #stack(
    spacing: .8em,
    [The creation of a single ukiyo-e print required four specialists working in concert:],
    cols(columns: (1fr, 1fr), gutter: 14pt)[
      #woodblock-panel([Step 1: Design], [
        The artist (eshi) draws the original composition in ink on thin paper.
      ])
    ][
      #woodblock-panel([Step 2: Carving], [
        The carver (horishi) cuts the design into cherry woodblocks.
      ])
    ],
    cols(columns: (1fr, 1fr), gutter: 14pt)[
      #woodblock-panel([Step 3: Printing], [
        The printer (surishi) applies pigments and presses paper by hand.
      ])
    ][
      #woodblock-panel([Step 4: Publishing], [
        The publisher (hanmoto) finances and distributes editions.
      ])
    ],
  )
][
  #wave-card([Materials], [
    - *Cherry wood* -- fine grain holds detail
    - *Washi paper* -- absorbent kozo fiber
    - *Pigments* -- mineral and plant-based
    - *Baren* -- bamboo-leaf pressing disk
  ])
  #v(0.4em)
  #text(size: typo.small, fill: palette.ink-muted)[
    A single print required 10-15 separate woodblocks, one for each color layer.
  ]
]

#speaker-note[Explain the collaborative nature of ukiyo-e production and the specialized roles involved.]

== Color and Pigment Mastery

#cols[
  #figure[
    #ukiyo-data-table(
      ([Pigment], [Source], [Color], [Usage]),
      ([Beni], [Safflower], [Vermillion], [Kimonos, accents]),
      ([Ai], [Indigo plant], [Prussian Blue], [Skies, water]),
      ([Kuchinashi], [Gardenia], [Yellow], [Backgrounds]),
      ([Sumi], [Pine soot], [Black], [Outlines, key block]),
    )
  ]
  #v(0.6em)
  #scroll-quote([
    The colors of ukiyo-e are distillations of nature's essence -- each pigment carries centuries of aesthetic refinement.
  ], cite: [Matthi Forrer])
][
  #stack(
    spacing: .8em,
    wave-card([The Bokashi Technique], [
      Gradation printing (bokashi) creates smooth transitions by wiping pigment from the block before pressing. This produces luminous skies and waters.
    ]),
    wave-progress(8, 12, label: [Registered color blocks]),
    grid(columns: (1fr, 1fr), column-gutter: 10pt,
      edo-stat([BLOCKS], [12], description: [Blocks per full-color print]),
      edo-stat([COPIES], [200], description: [Prints per edition]),
    ),
  )
]

#speaker-note[Detail the traditional pigments and printing techniques that gave ukiyo-e its distinctive color palette.]

// =====================================================================
// Section 4: Impact
// =====================================================================

= Waves Across the World

#speaker-note[Shift from Edo Japan to the international encounter that transformed modern Western art.]

== Japonisme: The Western Encounter

#cols(columns: (3fr, 2fr), align: top)[
  When Japan opened to trade in 1853, ukiyo-e prints flooded into Europe -- sometimes used merely as packing material for ceramics. Western artists were stunned.

  #v(0.8em)
  #woodblock-panel([Influenced Artists], [
    - *Claude Monet* -- collected 231 Japanese prints
    - *Vincent van Gogh* -- copied Hiroshige's bridge scenes
    - *Edgar Degas* -- adopted asymmetric compositions
    - *Mary Cassatt* -- embraced flat color and outline
    - *Gustav Klimt* -- incorporated Japanese gold patterns
  ])

  #v(0.5em)
  #ukiyo-tag[IMPRESSIONISM]
  #h(6pt)
  #ukiyo-tag[ART NOUVEAU]
  #h(6pt)
  #ukiyo-tag[POST-IMPRESSIONISM]
][
  #scroll-quote([
    Japanese art is as important as European art. We study it with emotion and we cannot look at it without becoming dreamers and philosophers.
  ], cite: [Vincent van Gogh])
  #v(0.8em)
  #wave-card([Key Principles Adopted], [
    - Flat areas of bold color
    - Strong diagonal compositions
    - Cropped, asymmetric framing
    - Nature as emotional subject
    - Integration of text and image
  ])
]

#speaker-note[Explain how ukiyo-e revolutionized Western art through Japonisme, transforming Impressionism and Art Nouveau.]

== The Great Wave: Icon of Global Art

#dark-slide(title: [The Great Wave: Icon of Global Art], header-left: [IMPACT], header-right: [c. 1831])[
  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    {
      set text(fill: palette.ink)
      text(size: 1.1em, weight: "semibold", fill: palette.ink)[
        Under the Wave off Kanagawa
      ]
      v(0.6em)
      text(size: 13pt, fill: palette.ink-dim)[
        Hokusai's masterpiece -- a towering wave about to crash over fishing boats with Mount Fuji serene in the distance -- is now the world's most reproduced artwork.
      ]
      v(0.8em)
      grid(columns: (1fr, 1fr), column-gutter: 12pt, row-gutter: 8pt,
        edo-stat([HEIGHT], [12m], description: [Estimated wave height]),
        edo-stat([SIZE], [25cm], description: [Print width in oban format]),
      )
    },
    {
      set text(fill: palette.ink)
      wave-card([Composition Secrets], [
        - *Golden ratio* in wave-to-sky division
        - *Fibonacci spiral* in the wave crest curl
        - *Contrast* of motion vs. stillness (Fuji)
        - *Scale inversion* -- nature dwarfs humanity
        - *Prussian Blue* (bero-ai) -- imported pigment
      ])
      v(0.5em)
      text(size: typo.small, fill: palette.secondary)[
        The print sold for approximately 20 mon -- the price of a bowl of noodles.
      ]
    },
  )
]

#speaker-note[Analyze the composition of the Great Wave and its journey from cheap commercial print to global cultural icon.]

// =====================================================================
// Focus Slide
// =====================================================================

#focus-slide[
  *"If heaven had granted me five more years, I could have become a real painter."*

  #v(0.5em)
  #text(size: 0.6em, weight: "regular", fill: palette.ink-muted)[
    -- Katsushika Hokusai, on his deathbed at age 88
  ]
]

#speaker-note[A powerful quote from Hokusai that encapsulates the endless pursuit of artistic mastery.]

// =====================================================================
// Section 5: Legacy
// =====================================================================

= Living Legacy

#speaker-note[Connect historical printmaking to contemporary design, fashion, and digital culture.]

== Ukiyo-e in the Modern World

#cols[
  #cols(columns: (1fr, 1fr, 1fr), gutter: 14pt)[
    #wave-card([Design], [
      Manga and anime trace their visual DNA to ukiyo-e's bold outlines and flat color.
    ])
  ][
    #wave-card([Fashion], [
      Issey Miyake and streetwear brands reference woodblock aesthetics in textiles.
    ])
  ][
    #wave-card([Digital], [
      The Great Wave emoji and generative art draw from Hokusai's compositions.
    ])
  ]
  #v(0.4em)
  #torii-divider()
  #v(0.3em)
  #text(size: typo.small, fill: palette.ink-muted)[
    From the \$1000 banknote to surfboard graphics, ukiyo-e remains a commercially vital art tradition.
  ]
][
  #woodblock-panel([Contemporary Practitioners], [
    - *Yoshitoshi* (1839-1892) -- last traditional master
    - *Hasui Kawase* (1883-1957) -- shin-hanga revival
    - *Dave Bull* (1951-) -- Western carver in Kamakura
  ])
  #v(0.4em)
  #grid(columns: (1fr, 1fr), column-gutter: 10pt,
    edo-stat([ACTIVE], [200+], description: [Printmakers in Japan]),
    edo-stat([MARKET], [\$2.1B], description: [Art market value]),
  )
]

#speaker-note[Connect ukiyo-e to modern visual culture, showing its continuing influence across design, fashion, and digital media.]

// =====================================================================
// Ending Slide
// =====================================================================

#ending-slide[Thank You]

#speaker-note[Close with gratitude and an invitation to explore ukiyo-e further.]
