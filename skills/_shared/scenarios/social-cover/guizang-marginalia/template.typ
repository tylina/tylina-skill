// Guizang Marginalia social card
// A light 3:4 essay card with a long-form column and a functional marginal schedule.

#let marginalia-palette = (
  paper: rgb("#f5f2ea"),
  paper-2: rgb("#ebe5d9"),
  ink: rgb("#26221d"),
  ink-soft: rgb("#69635b"),
  rust: rgb("#a85b3d"),
  rule: rgb("#c9c2b7"),
)

#let _marginalia-paper-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1242 1660">
  <defs>
    <pattern id="grain" width="27" height="33" patternUnits="userSpaceOnUse">
      <path d="M-3 8C7 4 18 13 31 7" fill="none" stroke="#26221d" stroke-width="0.6" opacity="0.035"/>
      <circle cx="9" cy="25" r="0.7" fill="#a85b3d" opacity="0.035"/>
    </pattern>
  </defs>
  <rect width="1242" height="1660" fill="#f5f2ea"/>
  <rect width="1242" height="1660" fill="url(#grain)"/>
  <path d="M82 68H1160M82 1598H1160" stroke="#26221d" stroke-width="1.2" opacity="0.42"/>
  <path d="M82 392H1160M82 1390H1160" stroke="#26221d" stroke-width="1" opacity="0.14"/>
  <path d="M805 420V1372" stroke="#26221d" stroke-width="1.2" opacity="0.24"/>
  <rect x="82" y="68" width="42" height="5" fill="#a85b3d"/>
</svg>
```.text

#let _marginalia-meta(left, right) = {
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 11pt,
    weight: 600,
    tracking: 2.2pt,
    fill: marginalia-palette.ink-soft,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _essay-paragraph(number, body) = {
  grid(
    columns: (44pt, 1fr),
    column-gutter: 18pt,
    align: top,
    text(
      font: ("IBM Plex Mono",),
      size: 11.5pt,
      weight: 700,
      tracking: 1.6pt,
      fill: marginalia-palette.rust,
      number,
    ),
    {
      set text(
        font: ("Noto Serif SC", "Songti SC"),
        size: 21.5pt,
        fill: marginalia-palette.ink,
      )
      set par(justify: true, leading: 0.78em)
      body
    },
  )
}

#let _schedule-row(time, action) = {
  block(
    width: 100%,
    stroke: (bottom: 1pt + marginalia-palette.rule),
    inset: (bottom: 15pt),
  )[
    #stack(
      spacing: 7pt,
      text(
        font: ("IBM Plex Mono",),
        size: 11.5pt,
        weight: 700,
        tracking: 1.7pt,
        fill: marginalia-palette.rust,
        time,
      ),
      text(
        font: ("Noto Serif SC", "Songti SC"),
        size: 16.5pt,
        fill: marginalia-palette.ink-soft,
        action,
      ),
    )
  ]
}

#let guizang-marginalia-card(
  issue: [M11 · MARGINALIA ESSAY · KRAFT PAPER],
  date: [NO. 05 · 2026 · WORKING RHYTHM],
  kicker: [ROUTINE / 写作留白],
  title-top: [什么也没做的],
  title-prefix: [那段时间，],
  title-accent: [matters most.],
  lead: [留白不是效率的反面。#linebreak()它让注意力重新获得方向。],
  paragraphs: (
    ([01], [上午九点，我先删掉日程表里最不确定的一项。#linebreak()空出的半小时没有接新任务，而是让刚结束的工作慢慢沉淀。]),
    ([02], [十一点，我合上电脑去洗杯子。没有播客，也没有消息提醒。#linebreak()那段停顿把“还没写完”从焦虑变成一个可以继续追问的问题。]),
    ([03], [下午重新坐下时，真正重要的句子已经更清楚。#linebreak()休息没有替我完成工作，却帮我看见哪些工作其实不必完成。]),
    ([04], [回看这一天，真正改变节奏的并不是完成了多少，#linebreak()而是注意力终于不再被每一次提醒牵走。]),
  ),
  schedule: (
    ([09:00], [删掉一项不确定任务，留下完整空档。]),
    ([11:00], [离开屏幕，洗杯子，不带耳机。]),
    ([13:30], [只读，不改；标出仍然有张力的句子。]),
    ([16:00], [回到正文，先写一个更准确的问题。]),
    ([21:00], [停止输入，让未完成保持未完成。]),
  ),
  pull-label: [MARGINAL NOTE / 04],
  pull-quote: [真正有效的空白，不是逃离工作，#linebreak()而是把注意力从自动反应里取回来。],
  closing: [恢复并不总是做了什么，#linebreak()也可能是终于没有继续做。],
  footer-left: [ESSAY · WORKDAY · RECOVERY],
  footer-right: [READ SLOWLY · RETURN CLEARLY],
) = page(
  width: 1242pt,
  height: 1660pt,
  margin: 0pt,
  fill: marginalia-palette.paper,
)[
  #set text(font: ("Noto Serif SC", "Songti SC"), fill: marginalia-palette.ink)
  #set par(leading: 1.04em)

  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_marginalia-paper-svg), width: 100%, height: 100%, fit: "stretch"))

    #pad(x: 82pt, top: 60pt, bottom: 48pt)[
      #grid(
        columns: (1fr,),
        rows: (30pt, 284pt, 1fr, 148pt, 30pt),
        row-gutter: 26pt,
        _marginalia-meta(issue, date),
        grid(
          columns: (1fr, auto),
          column-gutter: 36pt,
          {
            stack(
              spacing: 10pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 12pt,
                weight: 600,
                tracking: 2.5pt,
                fill: marginalia-palette.rust,
                upper(kicker),
              ),
              text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 66pt,
                weight: 500,
                tracking: 2.8pt,
                fill: marginalia-palette.ink,
                title-top,
              ),
              grid(
                columns: (auto, auto),
                column-gutter: 18pt,
                align: bottom,
                text(
                  font: ("Noto Serif SC", "Songti SC"),
                  size: 58pt,
                  weight: 500,
                  tracking: 2.4pt,
                  fill: marginalia-palette.ink,
                  title-prefix,
                ),
                text(
                  font: ("Libertinus Serif",),
                  size: 46pt,
                  style: "italic",
                  weight: 400,
                  fill: marginalia-palette.ink,
                  title-accent,
                ),
              ),
            )
          },
          align(bottom + right)[
            #block(
              width: 250pt,
              stroke: (left: 2.5pt + marginalia-palette.rust),
              inset: (left: 16pt),
            )[
              #text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 17pt,
                fill: marginalia-palette.ink-soft,
                lead,
              )
            ]
          ],
        ),
        grid(
          columns: (66%, 34%),
          column-gutter: 48pt,
          {
            grid(
              columns: (1fr,),
              rows: (auto, 1fr, auto),
              row-gutter: 34pt,
              stack(
                spacing: 42pt,
                ..paragraphs.map(item => _essay-paragraph(item.at(0), item.at(1))),
              ),
              [],
              block(
                width: 100%,
                stroke: (top: 1.2pt + marginalia-palette.rust),
                inset: (top: 22pt, right: 18pt),
              )[
                #stack(
                  spacing: 14pt,
                  text(
                    font: ("IBM Plex Mono", "Noto Sans SC"),
                    size: 11pt,
                    weight: 700,
                    tracking: 1.8pt,
                    fill: marginalia-palette.rust,
                    upper(pull-label),
                  ),
                  {
                    set par(leading: 0.94em)
                    text(
                      font: ("Noto Serif SC", "Songti SC"),
                      size: 29pt,
                      weight: 500,
                      fill: marginalia-palette.ink,
                      pull-quote,
                    )
                  },
                )
              ],
            )
          },
          block(
            width: 100%,
            height: 100%,
            stroke: (left: 1.2pt + marginalia-palette.rule),
            inset: (left: 26pt),
          )[
            #grid(
              rows: (auto, 1fr),
              row-gutter: 22pt,
              text(
                font: ("IBM Plex Mono",),
                size: 11.5pt,
                weight: 700,
                tracking: 2pt,
                fill: marginalia-palette.ink-soft,
                [A DAY WITH INTENTIONAL GAPS],
              ),
              grid(
                rows: schedule.map(_ => 1fr),
                row-gutter: 18pt,
                ..schedule.map(item => _schedule-row(item.at(0), item.at(1))),
              ),
            )
          ],
        ),
        block(
          width: 100%,
          height: 100%,
          fill: marginalia-palette.paper-2,
          stroke: (left: 4pt + marginalia-palette.rust),
          inset: (x: 24pt, y: 20pt),
        )[
          #grid(
            columns: (1fr, auto),
            column-gutter: 36pt,
            align: horizon,
            {
              set par(leading: 0.98em)
              text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 24.5pt,
                weight: 500,
                fill: marginalia-palette.ink,
                closing,
              )
            },
            text(
              font: ("Libertinus Serif",),
              size: 35pt,
              style: "italic",
              fill: marginalia-palette.rust,
              [pause.],
            ),
          )
        ],
        _marginalia-meta(footer-left, footer-right),
      )
    ]
  ]
]
