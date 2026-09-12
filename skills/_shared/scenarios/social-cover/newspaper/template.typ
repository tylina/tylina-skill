// Newspaper social cover
// A 900x383 WeChat header with a brutalist press field and native Typst copy.

#let newspaper-social-palette = (
  paper: rgb("#f4f1e9"),
  ink: rgb("#111211"),
  ink-soft: rgb("#5e5b55"),
  signal: rgb("#cf1734"),
  white: rgb("#f4f1e9"),
)

#let _press-field-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 383">
  <defs>
    <pattern id="paper-grain" width="19" height="23" patternUnits="userSpaceOnUse">
      <path d="M-2 6C6 4 13 9 21 5" fill="none" stroke="#111211" stroke-width="0.45" opacity="0.045"/>
      <circle cx="5" cy="17" r="0.7" fill="#111211" opacity="0.035"/>
    </pattern>
    <pattern id="half" width="9" height="9" patternUnits="userSpaceOnUse">
      <circle cx="2.2" cy="2.2" r="1.45" fill="#f4f1e9" opacity="0.18"/>
    </pattern>
  </defs>
  <rect width="900" height="383" fill="#f4f1e9"/>
  <rect width="900" height="383" fill="url(#paper-grain)"/>
  <rect width="154" height="383" fill="#111211"/>
  <g opacity="0.9">
    <rect x="0" width="17" height="383" fill="#050505"/>
    <rect x="24" width="10" height="383" fill="#777" opacity="0.55"/>
    <rect x="42" width="23" height="383" fill="#2b2b2b"/>
    <rect x="73" width="8" height="383" fill="#cfcfcf" opacity="0.38"/>
    <rect x="89" width="31" height="383" fill="#070707"/>
    <rect x="129" width="12" height="383" fill="#8b8b8b" opacity="0.48"/>
  </g>
  <rect x="690" width="210" height="383" fill="#111211"/>
  <rect x="690" width="210" height="383" fill="url(#half)"/>
  <rect y="0" width="900" height="5" fill="#cf1734"/>
  <rect y="378" width="900" height="5" fill="#cf1734"/>
  <path d="M154 33H690M154 350H690" stroke="#111211" stroke-width="1.2" opacity="0.58"/>
  <path d="M690 33H866M690 350H866" stroke="#f4f1e9" stroke-width="1.2" opacity="0.42"/>
  <path d="M174 94H666M174 313H666" stroke="#111211" stroke-width="0.8" opacity="0.18"/>
  <rect x="154" y="33" width="34" height="5" fill="#cf1734"/>
  <circle cx="854" cy="324" r="10" fill="#cf1734"/>
</svg>
```.text

#let _press-meta(left, right, dark: false) = {
  let color = if dark { newspaper-social-palette.white.transparentize(18%) } else { newspaper-social-palette.ink-soft }
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 8.5pt,
    weight: 700,
    tracking: 1.6pt,
    fill: color,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _question-line(index, title) = {
  block(
    width: 100%,
    stroke: (bottom: 0.7pt + newspaper-social-palette.white.transparentize(68%)),
    inset: (bottom: 9pt),
  )[
    #grid(
      columns: (27pt, 1fr),
      column-gutter: 8pt,
      align: horizon,
      text(
        font: ("IBM Plex Mono",),
        size: 9.5pt,
        weight: 700,
        fill: newspaper-social-palette.signal,
        index,
      ),
      text(
        font: ("Noto Sans SC", "PingFang SC"),
        size: 13.5pt,
        weight: 650,
        fill: newspaper-social-palette.white,
        title,
      ),
    )
  ]
}

#let newspaper-wechat-cover(
  issue: [VOL. 03 · WEEKLY NOTES],
  date: [2026 · ONE QUESTION AT A TIME],
  kicker: [THE WEEKLY REVIEW],
  title: [这一周，#linebreak()只复盘一件事],
  deck: [不是罗列完成项，而是找出一个值得带进下周的判断。],
  questions: ([发生了什么], [为什么重要], [下次怎么做]),
  footer-left: [THE WORKING PAPER],
  footer-right: [ASK · TRACE · KEEP],
) = page(
  width: 900pt,
  height: 383pt,
  margin: 0pt,
  fill: newspaper-social-palette.paper,
)[
  #set text(font: ("Noto Serif SC", "Songti SC"), fill: newspaper-social-palette.ink)
  #set par(leading: 0.98em)

  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_press-field-svg), width: 100%, height: 100%, fit: "stretch"))

    #pad(x: 34pt, top: 20pt, bottom: 18pt)[
      #grid(
        columns: (100pt, 514pt, 176pt),
        rows: (16pt, 1fr, 22pt),
        column-gutter: 20pt,
        row-gutter: 14pt,
        {
          set text(
            font: ("IBM Plex Mono",),
            size: 7pt,
            weight: 700,
            tracking: 1.4pt,
            fill: newspaper-social-palette.white.transparentize(24%),
          )
          upper(issue)
        },
        _press-meta(date, [WECHAT HEADER]),
        _press-meta([FIELD DESK], [03 QUESTIONS], dark: true),
        {
          align(center + horizon)[
            #rotate(-90deg, text(
              font: ("IBM Plex Mono",),
              size: 12pt,
              weight: 700,
              tracking: 3pt,
              fill: newspaper-social-palette.white.transparentize(14%),
              [WEEKLY / 03],
            ))
          ]
        },
        {
          block(width: 100%, inset: (left: 14pt, right: 8pt))[
            #stack(
              spacing: 10pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 10pt,
                weight: 700,
                tracking: 2pt,
                fill: newspaper-social-palette.signal,
                upper(kicker),
              ),
              {
                set par(leading: 0.87em)
                text(
                  font: ("Noto Serif SC", "Songti SC"),
                  size: 48pt,
                  weight: 700,
                  tracking: 0.4pt,
                  fill: newspaper-social-palette.ink,
                  title,
                )
              },
              text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 16pt,
                fill: newspaper-social-palette.ink-soft,
                deck,
              ),
            )
          ]
        },
        {
          stack(
            spacing: 13pt,
            text(
              font: ("IBM Plex Mono",),
              size: 10pt,
              weight: 700,
              tracking: 1.8pt,
              fill: newspaper-social-palette.signal,
              [03 QUESTIONS],
            ),
            _question-line([01], questions.at(0)),
            _question-line([02], questions.at(1)),
            _question-line([03], questions.at(2)),
          )
        },
        {
          set text(
            font: ("IBM Plex Mono",),
            size: 7pt,
            weight: 700,
            tracking: 1.2pt,
            fill: newspaper-social-palette.white.transparentize(30%),
          )
          [ISSUE 03]
        },
        _press-meta(footer-left, [READ · REFLECT · RETURN]),
        _press-meta([SOCIAL], footer-right, dark: true),
      )
    ]
  ]
]
