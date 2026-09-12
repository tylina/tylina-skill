#import "@preview/touying:0.7.4": *
#import "template.typ": *

// Font configuration
#set text(font: ("Arial", "Heiti SC"), size: 18pt)

// Build palette for inline use
#let pal = build-palette("ming")

#show: porcelain-theme.with(
  aspect-ratio: "16-9",
  preset: "ming",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Art of Blue-and-White Porcelain],
    subtitle: [From Jingdezhen Kilns to World Heritage],
    author: [Dr. Chen Weilin],
    date: datetime.today(),
    institution: [National Palace Museum],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Origins
// ============================================================

= Origins & History

== The Birth of Blue-and-White

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink-muted)[TANG DYNASTY ORIGINS]

#v(0.1em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: typo.body, fill: pal.body-text)[
      Blue-and-white fragments from the 8th-century Tang dynasty were found at Baihe
      kiln in Gongxian. These early wares used local cobalt under transparent glaze,
      but the technique remained rudimentary.
    ]
    #v(0.5em)
    #text(size: typo.body, fill: pal.body-text)[
      In the Yuan dynasty (1271--1368), Jingdezhen achieved technical maturity.
      Persian "Sumali Qing" cobalt produced the rich, saturated blues of the
      classic aesthetic.
    ]
  ],
  block(width: 100%)[
    #dynasty-stat([JINGDEZHEN KILNS], [1004], description: [Song imperial-kiln founding year])
    #v(0.5em)
    #dynasty-stat([PEAK OUTPUT], [100K+], description: [Ming Xuande annual pieces])
  ],
)


// ============================================================
// Slide: Dark -- Key Fact
// ============================================================

#dark-slide(
  title: none,
  header-left: [HISTORICAL CONTEXT],
  header-right: [YUAN DYNASTY INNOVATION],
)[
  #text(size: 36pt, weight: "bold")[The Yuan Dynasty Transformed Porcelain Forever.]

  #v(0.2em)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: rgb("#F0EBE0").transparentize(50%))[MONGOL EMPIRE TRADE NETWORKS]

  #v(0.6em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#F0EBE0").transparentize(50%))[COBALT SOURCE]
      #v(0.15em)
      #text(size: 38pt, weight: "bold")[Persia]
      #v(0.15em)
      #text(size: 11pt, fill: rgb("#F0EBE0").transparentize(25%))[
        "Sumali Qing" cobalt imported via Silk Road maritime routes. High iron, low manganese
        content produced distinctive deep blue with black "heaping and piling" effect.
      ]
    ],
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#F0EBE0").transparentize(50%))[KILN TEMPERATURE]
      #v(0.15em)
      #text(size: 38pt, weight: "bold")[1300°C]
      #v(0.15em)
      #text(size: 11pt, fill: rgb("#F0EBE0").transparentize(25%))[
        Reduction firing at extreme temperatures fused cobalt permanently into the glaze,
        creating the characteristic translucent blue-under-white effect.
      ]
    ],
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#F0EBE0").transparentize(50%))[EXPORT MARKET]
      #v(0.15em)
      #text(size: 38pt, weight: "bold")[50+]
      #v(0.15em)
      #text(size: 11pt, fill: rgb("#F0EBE0").transparentize(25%))[
        Countries receiving Chinese blue-and-white exports. Fragments found from Japan to
        East Africa, from Indonesia to the Ottoman Empire.
      ]
    ],
  )

  #v(0.2em)

  #block(
    width: 100%,
    stroke: (left: 1.5pt + rgb("#F0EBE0").transparentize(60%)),
    inset: (left: 1.2em, y: 0.4em),
  )[
    #text(size: 12pt, style: "italic", fill: rgb("#F0EBE0").transparentize(15%))[
      "Blue-and-white porcelain was China's first truly global commodity -- traded more widely than silk."
    ]
  ]
]


// ============================================================
// Slide: Cards -- Motif Types
// ============================================================

== Classical Motif Categories

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink-muted)[DECORATIVE VOCABULARY]

#v(0.4em)

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
  vessel-card([Flora -- Peony & Lotus], [
    The peony (牡丹) symbolizes wealth and honor; the lotus represents purity.
    Ming potters developed the "outline-and-wash" technique (勾填) for precise petal rendering.
  ]),
  vessel-card([Fauna -- Dragon & Phoenix], [
    Five-clawed dragons reserved for imperial use. Phoenix (鳳凰) motifs paired
    with dragons represent the emperor and empress. Fish symbolize abundance.
  ]),
  vessel-card([Geometric -- Lattice & Wave], [
    The 回纹 (key-fret) border derives from Shang bronze vessels. Wave patterns (海水纹)
    represent the cosmic ocean. Both serve as framing devices for central motifs.
  ]),
)


// ============================================================
// Section 2: Techniques
// ============================================================

= Kiln Techniques

== Painting & Firing Process

#grid(columns: (2fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #kiln-box([The Six Steps of Production], [
      1. *Body preparation* -- Kaolin clay mixed with petuntse (porcelain stone) \
      2. *Forming* -- Wheel-thrown or mold-pressed into shape \
      3. *Bisque firing* -- Initial low-temperature firing to harden body \
      4. *Cobalt painting* -- Brush-applied decoration on unfired glaze \
      5. *Glazing* -- Dipping in transparent feldspar glaze \
      6. *High firing* -- 1280--1320°C reduction atmosphere, 12--20 hours
    ])
  ],
  block(width: 100%)[
    #jade-tag([Kaolin])
    #v(0.3em)
    #jade-tag([Petuntse])
    #v(0.3em)
    #jade-tag([Cobalt Ore])
    #v(0.3em)
    #jade-tag([Feldspar])
    #v(0.5em)
    #block(
      width: 100%,
      fill: pal.ink.transparentize(95%),
      inset: 10pt,
      stroke: 0.4pt + pal.ink-faint,
    )[
      #text(size: 11pt, fill: pal.body-text)[
        Key ratio: 50% kaolin to 50% porcelain stone for optimal translucency.
      ]
    ]
  ],
)


// ============================================================
// Slide: Scholar Quote
// ============================================================

== The Painter's Art

#scholar-quote([
  The brush must be held upright and moved with the wrist, not the fingers.
  Each stroke is irreversible once the cobalt meets the raw glaze -- there is
  no erasing, no correction. The painter must visualize the entire composition
  before the first mark touches clay.
], cite: "Tao Shuo (陶说), Zhu Yan, 1774")

#v(0.5em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #pavilion-frame([Master Painters], [
      Imperial kiln painters trained for 10+ years. Specializations included:
      dragon masters (画龙), flower painters (画花), border workers (画边).
      A single large vase might require three specialists working sequentially.
    ])
  ],
  block(width: 100%)[
    #pavilion-frame([Brush Types], [
      - *Gouding* (勾顶) -- fine line brush for outlines
      - *Fenbi* (分笔) -- flat wash brush for fills
      - *Dianbi* (点笔) -- dot brush for stamens and textures
      - *Qinghua* (青花) -- loaded brush for bold strokes
    ])
  ],
)


// ============================================================
// Slide: Focus -- Quote
// ============================================================

#focus-slide[
  "White as jade, bright as a mirror, thin as paper, resonant as a bell."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink-muted)[
    -- Traditional description of ideal porcelain, Song dynasty
  ]
]


// ============================================================
// Section 3: Dynastic Evolution
// ============================================================

= Dynastic Styles

== Ming Dynasty Reign Marks

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink-muted)[IMPERIAL PERIODS]

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
  dynasty-stat([YONGLE], [1403], description: [Refined "sweet white" body; Persian motifs]),
  dynasty-stat([XUANDE], [1426], description: [Peak quality; "heaping and piling" effect]),
  dynasty-stat([CHENGHUA], [1465], description: [Delicate doucai palette; fine brushwork]),
  dynasty-stat([WANLI], [1573], description: [Mass export production; Kraak ware]),
)

#v(0.4em)
#lattice-divider(total-width: 100%)
#v(0.4em)

#text(size: 13pt, fill: pal.body-text)[
  The six-character reign mark (大明某某年制) on the base identifies the emperor's era.
  Xuande period wares command the highest prices at auction: a Xuande bowl sold for
  HK\$281 million (2017), while Yongle flask reached HK\$168 million (2020).
]


// ============================================================
// Slide: Treasure Highlight
// ============================================================

== Museum Masterpieces

#treasure-highlight[
  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    block(width: 100%)[
      #text(size: 14pt, weight: "bold", fill: pal.ink)[National Palace Museum, Taipei]
      #v(0.3em)
      #text(size: 13pt, fill: pal.body-text)[
        Houses 25,000+ ceramic pieces from the imperial collection.
        The Yuan "Guiguzi Descending the Mountain" jar pattern exists in only
        8 known examples worldwide.
      ]
    ],
    block(width: 100%)[
      #text(size: 14pt, weight: "bold", fill: pal.ink)[British Museum, London]
      #v(0.3em)
      #text(size: 13pt, fill: pal.body-text)[
        The David Vases (1351 CE) are the earliest precisely dated blue-and-white
        porcelain, inscribed with a dedication to a Daoist temple, providing
        the cornerstone for all Yuan porcelain dating.
      ]
    ],
  )
]

#v(0.4em)

#scroll-banner[
  The Topkapi Palace in Istanbul holds the world's largest collection of Chinese celadon
  and blue-and-white porcelain outside China -- over 10,000 pieces collected by Ottoman sultans.
]


// ============================================================
// Dark slide -- Comparative
// ============================================================

#dark-slide(
  title: none,
  header-left: [COMPARATIVE ANALYSIS],
  header-right: [COBALT CHEMISTRY],
)[
  #text(size: 28pt, weight: "bold")[Imported vs. Domestic Cobalt: A Chemical Signature]
  #v(0.15em)
  #block(width: 50pt, height: 1.5pt, fill: pal.accent)
  #v(0.5em)

  #grid(columns: (1fr, 1fr), column-gutter: 28pt,
    block(width: 100%, stroke: (left: 1.5pt + pal.accent), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#F0EBE0").transparentize(50%))[SUMALI QING (IMPORTED)]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: rgb("#F0EBE0"))[High Fe, Low Mn]
      #v(0.3em)
      #text(size: 12pt, fill: rgb("#F0EBE0").transparentize(25%))[
        Persian cobalt: deep saturated blue with characteristic black spots
        ("iron spots") from heaping. Used Yuan through early Ming (Yongle/Xuande).
        Creates the most prized visual effect.
      ]
    ],
    block(width: 100%, stroke: (left: 1.5pt + rgb("#F0EBE0").transparentize(60%)), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#F0EBE0").transparentize(50%))[ZHUMING LIAO (DOMESTIC)]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: rgb("#F0EBE0"))[High Mn, Low Fe]
      #v(0.3em)
      #text(size: 12pt, fill: rgb("#F0EBE0").transparentize(25%))[
        Jiangxi/Yunnan cobalt: lighter, more violet-blue tone without black spotting.
        Used mid-Ming (Chenghua onward) when trade routes disrupted.
        Enables finer, more delicate brushwork.
      ]
    ],
  )

  #v(0.6em)
  #text(size: 11pt, fill: rgb("#F0EBE0").transparentize(20%))[
    XRF analysis of Fe/Mn ratios is now the standard method for authenticating blue-and-white
    porcelain and determining its period of production without destructive sampling.
  ]
]


// ============================================================
// Section 4: Global Impact
// ============================================================

= Global Influence

== The Porcelain Trade Routes

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink-muted)[MARITIME SILK ROAD]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 12pt,
  vessel-card([Kraak Porcelain], [
    Named from Portuguese "carrack" ships. Mass-produced for European markets from
    the Wanli period (1573--1619). Paneled designs with compartmentalized motifs
    optimized for large-scale export. Captured by Dutch VOC from Portuguese carracks.
  ]),
  vessel-card([Japanese Imari], [
    When Ming-Qing transition disrupted Chinese exports (1644--1683), Japanese kilns
    at Arita filled the vacuum. Their polychrome "Imari" style directly copied and
    adapted Chinese blue-and-white forms for the European market.
  ]),
  vessel-card([Delftware (Netherlands)], [
    Dutch potters at Delft created tin-glazed earthenware imitating Chinese porcelain
    from 1620s onward. Though technically inferior (earthenware, not porcelain),
    Delftware became a major decorative tradition in its own right.
  ]),
  vessel-card([Iznik Ceramics (Ottoman)], [
    Ottoman potters at Iznik synthesized Chinese blue-and-white with Islamic
    arabesque patterns. The tulip, carnation, and saz leaf motifs combined Chinese
    technique with distinctly Ottoman visual vocabulary.
  ]),
)


// ============================================================
// Slide: Dark section transition
// ============================================================

#dark-slide(
  title: none,
  header-left: [SECTION 05],
  header-right: [PORCELAIN 2025],
)[
  #v(1fr)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: rgb("#F0EBE0").transparentize(50%))[CONTEMPORARY LEGACY]
  #v(0.6em)

  #text(size: 34pt, weight: "bold")[
    From Imperial Kilns#linebreak()to Living Heritage.
  ]
  #v(0.4em)
  #block(width: 60pt, height: 1.5pt, fill: pal.accent)

  #v(2fr)
]


// ============================================================
// Slide: Contemporary significance
// ============================================================

== Jingdezhen Today

#grid(columns: (2fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #pavilion-frame([Living Tradition], [
      Jingdezhen remains China's "Porcelain Capital" (瓷都). Over 3,000 ceramic
      studios operate today, from traditional workshops reproducing Ming forms
      to contemporary artists pushing boundaries with conceptual ceramic art.

      #v(0.4em)
      The city was designated a UNESCO Creative City of Crafts and Folk Art in 2014,
      recognizing its continuous 1,700-year ceramic production history.
    ])
  ],
  block(width: 100%)[
    #dynasty-stat([STUDIOS], [3,000+], description: [Active ceramic workshops in Jingdezhen today])
    #v(0.5em)
    #jade-tag([UNESCO 2014])
    #v(0.3em)
    #jade-tag([Intangible Heritage])
    #v(0.3em)
    #jade-tag([Living Museum])
  ],
)


// ============================================================
// Slide: Auction Records
// ============================================================

== Auction Records & Authentication

#scroll-banner[
  Chinese blue-and-white porcelain consistently achieves record prices at international auction,
  driven by demand from mainland Chinese collectors repatriating cultural heritage.
]

#v(0.4em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Record Sales]
    #v(0.3em)
    #text(size: 13pt, fill: pal.body-text)[
      - *HK\$281M* -- Xuande blue-and-white bowl (Sotheby's 2017)
      - *GBP 14M* -- Yuan "Guiguzi" jar (Christie's 2005)
      - *HK\$168M* -- Yongle moonflask (Christie's 2020)
      - *HK\$98M* -- Chenghua "chicken cup" doucai (Sotheby's 2014)
    ]
  ],
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Scientific Analysis]
    #v(0.3em)
    #text(size: 13pt, fill: pal.body-text)[
      - *XRF* -- Non-destructive elemental analysis of cobalt
      - *TL Dating* -- Thermoluminescence confirms firing date
      - *Raman Spectroscopy* -- Identifies glaze composition
      - *CT Scanning* -- Reveals construction technique
    ]
  ],
)


// ============================================================
// Focus: Key insight
// ============================================================

#focus-slide[
  "Porcelain was to the pre-modern world what silicon is to ours -- a transformative
  material whose mastery defined civilizational achievement."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink-muted)[
    -- Robert Finlay, The Pilgrim Art, 2010
  ]
]


// ============================================================
// Ending
// ============================================================

#ending-slide[Thank You]
