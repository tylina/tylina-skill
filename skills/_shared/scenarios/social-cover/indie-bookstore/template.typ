// Indie Bookstore social-cover pair
// Riso-zine visual system for a separately composed WeChat header and share square.

#let zine-palette = (
  paper: rgb("#f5efe0"),
  paper-2: rgb("#e9dfc7"),
  blue: rgb("#1e4dbc"),
  pink: rgb("#ff5c8a"),
  mustard: rgb("#e8a02e"),
  ink: rgb("#191919"),
  grey: rgb("#686159"),
)

#let _wide-art-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 383">
  <defs>
    <pattern id="blue-dots" width="10" height="10" patternUnits="userSpaceOnUse">
      <circle cx="2" cy="2" r="1.7" fill="#1e4dbc" opacity="0.45"/>
    </pattern>
    <pattern id="pink-lines" width="12" height="12" patternUnits="userSpaceOnUse" patternTransform="rotate(18)">
      <path d="M0 0V12" stroke="#ff5c8a" stroke-width="3" opacity="0.52"/>
    </pattern>
    <clipPath id="art-well"><path d="M515 0H900V383H482L535 302L503 210L539 116Z"/></clipPath>
  </defs>

  <rect width="900" height="383" fill="#f5efe0"/>
  <g clip-path="url(#art-well)">
    <rect x="478" width="422" height="383" fill="#e9dfc7"/>
    <rect x="478" width="422" height="383" fill="url(#blue-dots)"/>
    <path d="M519 30H878V352H519Z" fill="#1e4dbc" opacity="0.10"/>

    <g transform="translate(590 50)">
      <path d="M22 28L208 0L278 74L89 103Z" fill="#ff5c8a" opacity="0.72" transform="translate(9 9)"/>
      <path d="M22 28L208 0L278 74L89 103Z" fill="#f5efe0" stroke="#1e4dbc" stroke-width="5"/>
      <path d="M89 103L278 74L255 247L66 282Z" fill="#1e4dbc"/>
      <path d="M22 28L89 103L66 282L0 190Z" fill="#f5efe0" stroke="#1e4dbc" stroke-width="5"/>
      <path d="M89 103L178 152L278 74" fill="none" stroke="#ff5c8a" stroke-width="9"/>
      <path d="M178 152L255 247L66 282Z" fill="#f5efe0" opacity="0.95"/>
      <path d="M95 126L243 103M89 151L237 128M84 176L231 153" stroke="#f5efe0" stroke-width="3" opacity="0.55"/>
      <rect x="116" y="190" width="112" height="50" fill="url(#pink-lines)"/>
      <circle cx="116" cy="66" r="22" fill="#ff5c8a"/>
    </g>

    <path d="M534 338H866M534 326V350M644 326V350M756 326V350M866 326V350" stroke="#191919" stroke-width="2"/>
    <path d="M534 362H866" stroke="#1e4dbc" stroke-width="7"/>
  </g>
  <path d="M40 34H860" stroke="#191919" stroke-width="1.4" opacity="0.5"/>
  <path d="M40 349H860" stroke="#191919" stroke-width="1.4" opacity="0.7"/>
  <rect x="40" y="34" width="34" height="5" fill="#ff5c8a"/>
</svg>
```.text

#let _square-art-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080">
  <defs>
    <pattern id="dots" width="14" height="14" patternUnits="userSpaceOnUse">
      <circle cx="3" cy="3" r="2.2" fill="#1e4dbc" opacity="0.36"/>
    </pattern>
    <pattern id="hatch" width="13" height="13" patternUnits="userSpaceOnUse" patternTransform="rotate(22)">
      <path d="M0 0V13" stroke="#ff5c8a" stroke-width="4" opacity="0.56"/>
    </pattern>
  </defs>

  <rect width="1080" height="1080" fill="#f5efe0"/>
  <rect x="706" width="374" height="1080" fill="#e9dfc7"/>
  <rect x="706" width="374" height="1080" fill="url(#dots)"/>
  <rect x="760" y="90" width="252" height="900" fill="#1e4dbc" opacity="0.11"/>

  <g transform="translate(648 206) scale(1.22)">
    <path d="M45 78L236 20L330 102L132 164Z" fill="#ff5c8a" opacity="0.74" transform="translate(12 12)"/>
    <path d="M45 78L236 20L330 102L132 164Z" fill="#f5efe0" stroke="#1e4dbc" stroke-width="7"/>
    <path d="M132 164L330 102L302 378L105 442Z" fill="#1e4dbc"/>
    <path d="M45 78L132 164L105 442L18 322Z" fill="#f5efe0" stroke="#1e4dbc" stroke-width="7"/>
    <path d="M132 164L226 235L330 102" fill="none" stroke="#ff5c8a" stroke-width="12"/>
    <path d="M226 235L302 378L105 442Z" fill="#f5efe0"/>
    <path d="M138 193L291 147M133 227L285 181M128 261L279 215" stroke="#f5efe0" stroke-width="4" opacity="0.62"/>
    <rect x="160" y="296" width="118" height="66" fill="url(#hatch)"/>
    <circle cx="144" cy="115" r="32" fill="#ff5c8a"/>
  </g>

  <path d="M66 72H1014M66 1008H1014" stroke="#191919" stroke-width="1.6" opacity="0.5"/>
  <rect x="66" y="72" width="42" height="7" fill="#ff5c8a"/>
</svg>
```.text

#let _zine-meta(left, right) = {
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 11pt,
    weight: 600,
    tracking: 2pt,
    fill: zine-palette.grey,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _zine-footer(left, right) = {
  grid(
    columns: (1fr, auto),
    text(
      font: ("IBM Plex Mono", "Noto Sans SC"),
      size: 10pt,
      weight: 600,
      tracking: 1.8pt,
      fill: zine-palette.grey,
      upper(left),
    ),
    text(
      font: ("IBM Plex Mono", "Noto Sans SC"),
      size: 10pt,
      weight: 600,
      tracking: 1.8pt,
      fill: zine-palette.grey,
      upper(right),
    ),
  )
}

#let zine-wechat-header(
  issue: [ISSUE 01 · RISO NOTES],
  date: [2026 · WEEKEND PRESS],
  kicker: [PAPER TO PUBLICATION],
  title: [一张纸，#linebreak()做成一本 ZINE],
  subtitle: [折叠、裁切、套色、装订：从空白纸张到独立出版物。],
  art-label: [ONE SHEET · ONE SMALL PRESS],
  footer-left: [INDIE BOOKSTORE FIELD GUIDE],
  footer-right: [FOLD · PRINT · SHARE],
) = page(
  width: 900pt,
  height: 383pt,
  margin: 0pt,
  fill: zine-palette.paper,
)[
  #set text(font: ("Noto Sans SC", "PingFang SC"), fill: zine-palette.ink)
  #set par(leading: 1.02em)
  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_wide-art-svg), width: 100%, height: 100%, fit: "stretch"))
    #pad(x: 40pt, top: 30pt, bottom: 26pt)[
      #grid(
        columns: (1fr,),
        rows: (18pt, 249pt, 30pt),
        row-gutter: 15pt,
        _zine-meta(issue, date),
        grid(
          columns: (57%, 43%),
          column-gutter: 24pt,
          {
            stack(
              spacing: 10pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 11pt,
                weight: 700,
                tracking: 2.2pt,
                fill: zine-palette.pink,
                upper(kicker),
              ),
              {
                set par(leading: 0.91em)
                block(width: 100%)[
                  #place(dx: 2.5pt, dy: 2.5pt, text(
                    size: 50pt,
                    weight: 800,
                    tracking: -0.6pt,
                    fill: zine-palette.pink.transparentize(42%),
                    title,
                  ))
                  #text(
                    size: 50pt,
                    weight: 800,
                    tracking: -0.6pt,
                    fill: zine-palette.blue,
                    title,
                  )
                ]
              },
              text(size: 15.5pt, weight: 500, fill: zine-palette.grey, subtitle),
            )
          },
          {
            set align(right)
            text(
              font: ("IBM Plex Mono", "Noto Sans SC"),
              size: 10pt,
              weight: 600,
              tracking: 1.8pt,
              fill: zine-palette.ink,
              upper(art-label),
            )
          },
        ),
        _zine-footer(footer-left, footer-right),
      )
    ]
  ]
]

#let _step-box(index, label, color) = {
  block(width: 100%, height: 92pt, fill: color, inset: (x: 18pt, y: 14pt))[
    #stack(
      spacing: 7pt,
      text(
        font: ("IBM Plex Mono",),
        size: 14pt,
        weight: 700,
        tracking: 1.8pt,
        fill: if color == zine-palette.paper-2 { zine-palette.ink } else { zine-palette.paper },
        index,
      ),
      text(
        font: ("IBM Plex Mono", "Noto Sans SC"),
        size: 17pt,
        weight: 700,
        tracking: 1.2pt,
        fill: if color == zine-palette.paper-2 { zine-palette.ink } else { zine-palette.paper },
        upper(label),
      ),
    )
  ]
}

#let zine-wechat-square(
  issue: [ISSUE 01 · SHARE COVER],
  date: [2026 · RISO NOTES],
  kicker: [MAKE A SMALL PUBLICATION],
  title: [一本 ZINE#linebreak()从一张纸开始],
  subtitle: [不是先找软件，而是先决定这张纸要说什么。],
  steps: ([FOLD], [CUT], [PRINT], [SHARE]),
  footer-left: [INDIE BOOKSTORE FIELD GUIDE],
  footer-right: [ONE SHEET · FOUR MOVES],
) = page(
  width: 1080pt,
  height: 1080pt,
  margin: 0pt,
  fill: zine-palette.paper,
)[
  #set text(font: ("Noto Sans SC", "PingFang SC"), fill: zine-palette.ink)
  #set par(leading: 1.02em)
  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_square-art-svg), width: 100%, height: 100%, fit: "stretch"))
    #pad(x: 66pt, top: 62pt, bottom: 56pt)[
      #grid(
        columns: (1fr,),
        rows: (24pt, 728pt, 152pt),
        row-gutter: 29pt,
        _zine-meta(issue, date),
        grid(
          columns: (57%, 43%),
          column-gutter: 32pt,
          {
            stack(
              spacing: 26pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 17pt,
                weight: 700,
                tracking: 3pt,
                fill: zine-palette.pink,
                upper(kicker),
              ),
              {
                set par(leading: 0.9em)
                block(width: 100%)[
                  #place(dx: 5pt, dy: 5pt, text(
                    size: 86pt,
                    weight: 800,
                    tracking: -1.4pt,
                    fill: zine-palette.pink.transparentize(38%),
                    title,
                  ))
                  #text(
                    size: 86pt,
                    weight: 800,
                    tracking: -1.4pt,
                    fill: zine-palette.blue,
                    title,
                  )
                ]
              },
              block(width: 72pt, height: 9pt, fill: zine-palette.mustard),
              text(size: 23pt, weight: 500, fill: zine-palette.grey, subtitle),
            )
          },
          [],
        ),
        stack(
          spacing: 18pt,
          grid(
            columns: (1fr, 1fr, 1fr, 1fr),
            column-gutter: 10pt,
            _step-box([01], steps.at(0), zine-palette.blue),
            _step-box([02], steps.at(1), zine-palette.pink),
            _step-box([03], steps.at(2), zine-palette.mustard),
            _step-box([04], steps.at(3), zine-palette.ink),
          ),
          _zine-footer(footer-left, footer-right),
        ),
      )
    ]
  ]
]
