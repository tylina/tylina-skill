// Brutalist-Web Theme Demo
// Content: "The Anti-Design Movement in Digital Culture"

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "IBM Plex Sans", size: 20pt)

#show: brutalist-web-theme.with(
  aspect-ratio: "16-9",
  preset: "classic",
  config-info(
    title: [The Anti-Design Movement],
    subtitle: [Brutalism in Digital Culture],
    author: [Digital Punk Collective],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

// =====================================================================
= Brutalist Web Design
// =====================================================================

== What Is Web Brutalism?

#grid(columns: (1fr, 1fr), column-gutter: 20pt,
  {
    brutalist-card(title: [DEFINITION])[
      #text(size: 14pt)[
        Web brutalism is a design aesthetic that embraces #highlight-box[rawness], rejects polish, and celebrates the fundamental nature of the web as a medium.
      ]
      #v(8pt)
      #text(size: 12pt, fill: rgb("#000000"))[
        - Visible structure over hidden complexity
        - Function dictates form absolutely
        - No decorative elements without purpose
        - System fonts. Default colors. Raw HTML energy.
      ]
    ]
  },
  {
    browser-frame(url: "http://brutalistwebsites.com")[
      #text(size: 13pt)[
        #mono-label[Notable Examples:]
        #v(8pt)
        #link-text[Bloomberg.com] (2015 redesign)\
        #link-text[Craigslist.org] (since 1995)\
        #link-text[Yale School of Art] (chaotic wiki)\
        #link-text[Gumroad.com] (neo-brutalist)\
        #link-text[hacker news] (orange on white)
      ]
    ]
  },
)

== The Manifesto

#cols(columns: (2fr, 1fr))[
  #text(size: 16pt, weight: "bold")[
    "In its ruggedness and lack of concern to look comfortable or easy, Brutalism can be seen as a reaction by a younger generation to the lightness, optimism, and frivolity of today's web design."
  ]
  #v(12pt)
  #text(size: 11pt, fill: rgb("#000000"))[ -- Pascal Deville, brutalistwebsites.com, 2014]
  #v(16pt)
  #brutalist-divider()
  #v(12pt)
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
    raw-stat([97%], [of the web looks the same], highlight: true),
    raw-stat([3%], [dares to be different], highlight: false),
    raw-stat([0], [rounded corners allowed], highlight: true),
  )
][
  #stack-card[
    #mono-label[Core Principles]
    #v(8pt)
    #text(size: 13pt)[
      1. Borders over shadows\
      2. System fonts over custom\
      3. Black over grey\
      4. Clashing over harmonious\
      5. Raw over polished
    ]
  ]
]

// =====================================================================
= Anti-UX Philosophy
// =====================================================================

== Against Smoothness

#dark-slide(title: [The Case Against UX])[
  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    {
      text(size: 15pt, fill: rgb("#FFFFFF"))[
        Modern UX design optimizes for frictionless experience. Every interaction is smoothed, every edge rounded, every decision pre-made.
      ]
      v(12pt)
      text(size: 15pt, fill: rgb("#FFFFFF"))[
        But #box(fill: rgb("#FFDE00"), inset: (x: 4pt, y: 2pt))[#text(fill: rgb("#000000"), weight: "bold")[friction creates meaning]]. The struggle to navigate is the navigation.
      ]
      v(16pt)
      block(stroke: 3pt + rgb("#FFFFFF"), inset: (x: 12pt, y: 8pt), radius: 0pt)[
        #text(size: 12pt, fill: rgb("#FFFFFF"), font: _mono-font)[
          \<div style="border: 3px solid black"\>\
          \ \ \<p\>This is the entire design.\</p\>\
          \</div\>
        ]
      ]
    },
    {
      v(8pt)
      text(size: 14pt, fill: rgb("#FFDE00"), weight: "bold")[WHAT WE REJECT:]
      v(8pt)
      text(size: 14pt, fill: rgb("#FFFFFF"))[
        - Hamburger menus hiding content
        - Infinite scroll numbing attention
        - Cookie banners covering everything
        - "Delightful" micro-interactions
        - Rounded corners on everything
        - Drop shadows pretending depth
      ]
      v(12pt)
      text(size: 14pt, fill: rgb("#FFDE00"), weight: "bold")[WHAT WE EMBRACE:]
      v(8pt)
      text(size: 14pt, fill: rgb("#FFFFFF"))[
        - Visible page structure
        - Hyperlinks that look like hyperlinks
        - Content-first, always
        - Honest materiality
      ]
    },
  )
]

== Digital Punk Aesthetics

#cols(columns: (1fr, 1fr, 1fr), column-gutter: 16pt, lazy-layout: true,
  brutalist-card(title: [PUNK 1977])[
    #text(size: 13pt)[
      DIY zines. Photocopied. Ransom-note typography. #highlight-box[Anyone can do it.]
    ]
    #v(8pt)
    #text(size: 11pt, fill: rgb("#000000"))[
      No training needed. No permission asked. Just raw expression through available means.
    ]
  ],
  brutalist-card(title: [WEB 1.0], header-fill: rgb("#0000FF"))[
    #text(size: 13pt)[
      GeoCities. Under construction GIFs. Visitor counters. #highlight-box[The web was weird.]
    ]
    #v(8pt)
    #text(size: 11pt, fill: rgb("#000000"))[
      Before templates homogenized everything. Before "best practices" killed personality.
    ]
  ],
  brutalist-card(title: [NOW])[
    #text(size: 13pt)[
      Neo-brutalism reclaims that energy. Thick borders. Bold colors. #highlight-box[Intentional ugliness.]
    ]
    #v(8pt)
    #text(size: 11pt, fill: rgb("#000000"))[
      A deliberate rejection of the startup aesthetic. Design as resistance.
    ]
  ],
)

// =====================================================================
= Case Studies
// =====================================================================

== Bloomberg Businessweek

#cols(columns: (3fr, 2fr))[
  #brutalist-card(title: [THE REDESIGN])[
    #text(size: 13pt)[
      In 2015, Bloomberg.com launched a redesign that shocked the design world. Clashing colors, dense information, overlapping elements.
    ]
    #v(8pt)
    #text(size: 11pt)[
      The site used:
      - Hot pink headlines on cyan backgrounds
      - Multiple competing visual hierarchies
      - Intentionally overwhelming density
      - No whitespace "breathing room"
    ]
    #v(8pt)
    #text(size: 10pt, style: "italic")[
      "It was designed to be a little uncomfortable." -- Tracy Ma, Creative Director
    ]
  ]
][
  #frame-block(fill: rgb("#FFDE00"), inset: (x: 1em, y: .35em))[
    #text(size: 48pt, weight: "black", fill: rgb("#000000"))[DATA]
    #v(-8pt)
    #text(size: 48pt, weight: "black", fill: rgb("#0000FF"))[IS]
    #v(-8pt)
    #text(size: 48pt, weight: "black", fill: rgb("#000000"))[UGLY]
    #v(12pt)
    #text(size: 11pt, font: _mono-font)[
      And that is the point.\
      Information should not be\
      comfortable. It should\
      demand attention.
    ]
  ]
]

== Craigslist: Intentional Rawness

#grid(columns: (1fr, 1fr), column-gutter: 20pt,
  {
    browser-frame(url: "https://craigslist.org")[
      #text(size: 13pt)[
        #text(weight: "bold")[25+ years. Same design. No reason to change.]
        #v(8pt)
        Craigslist proves that utility is beauty. The site handles billions in transactions with:
        #v(6pt)
        - No images on listings pages
        - Blue hyperlinks on white (that is it)
        - No JavaScript frameworks
        - No A/B testing the button color
        - #highlight-box[Pure function]
      ]
    ]
  },
  {
    grid(rows: (auto, auto), row-gutter: 12pt,
      raw-stat([50B+], [page views per month]),
      brutalist-card(title: [WHY IT WORKS])[
        #text(size: 13pt)[
          People come for listings, not experiences. The design does not perform; it #link-text[serves].
          #v(6pt)
          Craigslist is brutalist not by aesthetic choice but by philosophical commitment to function.
        ]
      ],
    )
  },
)

== The Yale School of Art Website

#hero-slide(fill: rgb("#FFFFFF"))[
  #place(top + left, dx: 3em, dy: 3em)[
    #block(width: 60%)[
      #text(size: 28pt, weight: "black", fill: rgb("#000000"))[
        art.yale.edu
      ]
      #v(8pt)
      #block(width: 100pt, height: 3pt, fill: rgb("#000000"))
      #v(12pt)
      #text(size: 14pt, fill: rgb("#000000"))[
        A wiki-style website where students and faculty can edit any page. The result is chaotic, ever-changing, and alive.
      ]
      #v(12pt)
      #grid(columns: (1fr, 1fr), column-gutter: 12pt,
        brutalist-card(title: [CHAOS])[
          #text(size: 11pt)[Animated GIFs. Tiled backgrounds. Clashing fonts. No consistency.]
        ],
        brutalist-card(title: [PURPOSE], header-fill: rgb("#0000FF"))[
          #text(size: 11pt)[Art school website IS the art. The medium IS the message.]
        ],
      )
    ]
  ]
  #place(right + top, dx: -4em, dy: 2em)[
    #block(width: 140pt, height: 140pt, fill: rgb("#FFDE00"), stroke: 3pt + rgb("#000000"), radius: 0pt)[
      #std.align(center + horizon)[
        #text(size: 60pt, weight: "black", fill: rgb("#000000"))[Y]
      ]
    ]
  ]
]

// =====================================================================
= Neo-Brutalism Today
// =====================================================================

== The Gumroad Effect

#grid(columns: (1fr, 1fr), column-gutter: 20pt,
  {
    text(size: 15pt, weight: "bold", fill: rgb("#000000"))[
      In 2021, Gumroad redesigned with neo-brutalist principles:
    ]
    v(12pt)
    grid(columns: (1fr, 1fr), column-gutter: 12pt, row-gutter: 12pt,
      raw-stat([3px], [border on everything]),
      raw-stat([0px], [border-radius]),
      raw-stat([#sym.infinity], [confidence]),
      raw-stat([1], [shadow direction]),
    )
  },
  {
    stack-card[
      #mono-label[Neo-Brutalist Recipe]
      #v(10pt)
      #text(size: 13pt)[
        1. Pick 2-3 bold, clashing colors
        2. Add thick black borders (3px+) to everything
        3. Use hard drop shadows (no blur)
        4. Zero border-radius (fight the urge)
        5. System fonts or bold sans-serif
        6. Make buttons look like buttons
        7. Make links look like links
        8. Let the grid be visible
      ]
      #v(8pt)
      #highlight-box[That is it. That is the whole framework.]
    ]
  },
)

== Who Does It Well

#dark-slide(title: [The Brutalist Hall of Fame])[
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    {
      block(stroke: 3pt + rgb("#FFFFFF"), inset: (x: 12pt, y: 10pt), radius: 0pt, width: 100%)[
        #text(size: 14pt, fill: rgb("#FFDE00"), weight: "bold")[GUMROAD]
        #v(6pt)
        #text(size: 12pt, fill: rgb("#FFFFFF"))[
          Thick borders, bold colors, playful but functional. Made brutalism mainstream for SaaS.
        ]
      ]
    },
    {
      block(stroke: 3pt + rgb("#FFFFFF"), inset: (x: 12pt, y: 10pt), radius: 0pt, width: 100%)[
        #text(size: 14pt, fill: rgb("#FFDE00"), weight: "bold")[FIGMA]
        #v(6pt)
        #text(size: 12pt, fill: rgb("#FFFFFF"))[
          Config conference branding uses neo-brutalist energy. Proves it scales to enterprise.
        ]
      ]
    },
    {
      block(stroke: 3pt + rgb("#FFFFFF"), inset: (x: 12pt, y: 10pt), radius: 0pt, width: 100%)[
        #text(size: 14pt, fill: rgb("#FFDE00"), weight: "bold")[NOTION]
        #v(6pt)
        #text(size: 12pt, fill: rgb("#FFFFFF"))[
          Minimal, honest interface. No decoration without function. Quiet brutalism.
        ]
      ]
    },
  )
  #v(16pt)
  #std.align(center)[
    #text(size: 12pt, fill: rgb("#FFFFFF"), font: _mono-font, tracking: 2pt)[
      ANTI-DESIGN IS THE NEW DESIGN
    ]
  ]
]

// =====================================================================
= Why It Matters
// =====================================================================

== Design as Resistance

#cols(columns: (1fr, 1fr))[
  #text(size: 15pt)[
    In an era where every website looks the same -- the same Tailwind utilities, the same hero sections, the same testimonial carousels -- brutalism is an act of resistance.
  ]
  #v(12pt)
  #brutalist-card(title: [THE SAMENESS PROBLEM])[
    #text(size: 12pt)[
      95% of websites follow identical patterns:
      - Gradient hero with centered text
      - Three feature cards with icons
      - Social proof section
      - CTA button (rounded, of course)
      #v(4pt)
      #highlight-box[Brutalism says: NO.]
    ]
  ]
][
  #frame-block(fill: rgb("#FFFFFF"), border-color: rgb("#000000"))[
    #mono-label[The Alternative]
    #v(10pt)
    #text(size: 14pt)[
      Brutalist design forces the viewer to #link-text[engage actively]. It refuses to be background noise. It demands attention through:
    ]
    #v(8pt)
    #text(size: 13pt, weight: "bold")[
      - Visual tension (clashing elements)
      - Cognitive friction (unusual layouts)
      - Honest materiality (showing the grid)
      - Aggressive typography (huge, bold, present)
    ]
    #v(10pt)
    #text(size: 11pt, style: "italic")[
      "Comfortable design is forgettable design."
    ]
  ]
]

#focus-slide[
  MAKE IT UGLY.\
  MAKE IT HONEST.\
  MAKE IT UNFORGETTABLE.
]

#ending-slide[THE WEB WAS NEVER MEANT TO BE PRETTY]
