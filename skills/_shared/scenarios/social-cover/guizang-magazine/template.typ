// Guizang Magazine social cover
// Fixed 3:4 canvas, editorial typography, and an inline-SVG atmosphere layer.

#let magazine-palette = (
  paper: rgb("#f1eee5"),
  paper-2: rgb("#e5dfd1"),
  ink: rgb("#141816"),
  ink-soft: rgb("#4e514c"),
  mist: rgb("#a9afa5"),
  signal: rgb("#b94b37"),
)

#let _field-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1242 1660">
  <defs>
    <linearGradient id="paper-wash" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#f6f3ec"/>
      <stop offset="0.52" stop-color="#f1eee5"/>
      <stop offset="1" stop-color="#e4ded1"/>
    </linearGradient>
    <linearGradient id="ink-wash" x1="0" y1="0" x2="0.9" y2="1">
      <stop offset="0" stop-color="#202622"/>
      <stop offset="0.55" stop-color="#121614"/>
      <stop offset="1" stop-color="#090b0a"/>
    </linearGradient>
    <pattern id="fiber" width="31" height="37" patternUnits="userSpaceOnUse">
      <path d="M-4 9 C7 5 20 14 35 8" fill="none" stroke="#444a44" stroke-width="0.8" opacity="0.08"/>
      <path d="M3 29 C14 24 22 35 34 28" fill="none" stroke="#ffffff" stroke-width="0.6" opacity="0.08"/>
    </pattern>
    <clipPath id="field-clip">
      <path d="M668 0H1242V1660H594C648 1424 627 1199 655 981C682 773 631 554 681 341C701 251 693 119 668 0Z"/>
    </clipPath>
  </defs>

  <rect width="1242" height="1660" fill="url(#paper-wash)"/>
  <rect width="1242" height="1660" fill="url(#fiber)"/>

  <g opacity="0.34" fill="none" stroke="#7f887f" stroke-width="1.2">
    <path d="M-90 236C112 98 304 112 491 238C596 309 648 405 675 506"/>
    <path d="M-112 276C103 132 309 148 506 278C611 347 660 446 685 551"/>
    <path d="M-122 318C98 174 318 189 518 323C623 393 674 493 696 596"/>
    <path d="M-130 362C90 219 322 232 532 369C636 438 687 538 706 641"/>
  </g>

  <g clip-path="url(#field-clip)">
    <rect x="572" width="670" height="1660" fill="url(#ink-wash)"/>
    <rect x="572" width="670" height="1660" fill="url(#fiber)" opacity="0.7"/>

    <g fill="none" stroke="#d8d4c9" stroke-width="1.4" opacity="0.24">
      <path d="M481 1412C585 1275 709 1213 876 1225C1046 1237 1134 1358 1297 1338"/>
      <path d="M465 1370C577 1222 706 1153 883 1166C1060 1178 1149 1302 1310 1283"/>
      <path d="M457 1321C567 1162 705 1092 891 1104C1072 1116 1166 1245 1321 1226"/>
      <path d="M449 1267C560 1107 701 1030 898 1041C1085 1052 1178 1185 1331 1166"/>
      <path d="M456 1199C570 1048 711 969 904 979C1097 988 1190 1122 1338 1102"/>
      <path d="M472 1125C590 985 724 910 912 918C1104 925 1198 1055 1342 1037"/>
      <path d="M489 1049C608 920 740 847 925 855C1110 863 1205 990 1348 972"/>
      <path d="M510 971C628 852 759 783 937 791C1119 799 1217 922 1350 907"/>
      <path d="M531 890C650 786 777 720 950 728C1128 735 1222 854 1353 842"/>
    </g>

    <g fill="none" stroke="#66716a" stroke-width="1" opacity="0.35">
      <path d="M690 72V1580M786 0V1660M905 0V1660M1039 0V1660M1164 0V1660"/>
      <path d="M588 198H1242M588 390H1242M588 646H1242M588 894H1242M588 1126H1242M588 1480H1242"/>
    </g>

    <g fill="#efeadd" opacity="0.14">
      <rect x="712" y="238" width="148" height="84"/>
      <rect x="888" y="236" width="86" height="134"/>
      <rect x="1010" y="250" width="168" height="92"/>
      <rect x="729" y="431" width="206" height="112"/>
      <rect x="972" y="421" width="118" height="177"/>
      <rect x="1114" y="442" width="92" height="118"/>
      <rect x="704" y="681" width="121" height="164"/>
      <rect x="855" y="682" width="194" height="94"/>
      <rect x="1084" y="674" width="137" height="188"/>
    </g>

    <path d="M684 1464C765 1340 827 1250 823 1122C819 1002 742 940 770 823C806 673 1019 650 1017 498C1015 390 952 332 1004 210"
      fill="none" stroke="#b94b37" stroke-width="12" stroke-linecap="square"/>
    <path d="M684 1464C765 1340 827 1250 823 1122C819 1002 742 940 770 823C806 673 1019 650 1017 498C1015 390 952 332 1004 210"
      fill="none" stroke="#f1eee5" stroke-width="2" stroke-dasharray="4 19" opacity="0.9"/>

    <g fill="#f1eee5" stroke="#b94b37" stroke-width="7">
      <circle cx="684" cy="1464" r="15"/>
      <circle cx="770" cy="823" r="15"/>
      <circle cx="1017" cy="498" r="15"/>
      <circle cx="1004" cy="210" r="15"/>
    </g>

    <path d="M628 1547H1184" stroke="#eee8db" stroke-width="1.2" opacity="0.42"/>
    <path d="M1174 1537V1557M638 1537V1557" stroke="#eee8db" stroke-width="1.2" opacity="0.42"/>
  </g>

  <path d="M62 64H1180V1596H62Z" fill="none" stroke="#141816" stroke-width="1.4" opacity="0.42"/>
  <path d="M62 1514H1180" fill="none" stroke="#141816" stroke-width="1.4" opacity="0.55"/>
  <rect x="62" y="64" width="38" height="5" fill="#b94b37"/>
</svg>
```.text

#let _issue-row(left, right) = {
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 17pt,
    weight: 500,
    tracking: 2.8pt,
    fill: magazine-palette.ink-soft,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _route-note(number, title, note) = {
  grid(
    columns: (52pt, 1fr),
    column-gutter: 14pt,
    text(
      font: ("Libertinus Serif", "Noto Serif SC", "Songti SC"),
      size: 35pt,
      style: "italic",
      weight: 400,
      fill: magazine-palette.signal,
      number,
    ),
    stack(
      spacing: 6pt,
      text(
        font: ("Noto Serif SC", "Songti SC"),
        size: 24pt,
        weight: 500,
        fill: magazine-palette.ink,
        title,
      ),
      text(
        font: ("Noto Serif SC", "Songti SC"),
        size: 18pt,
        fill: magazine-palette.ink-soft,
        note,
      ),
    ),
  )
}

#let magazine-cover(
  issue: [FIELD NOTES · 01],
  date: [2026 · SUMMER],
  kicker: [城市步行观察],
  title: [把城市#linebreak()走慢一点],
  subtitle: [一份从树荫与街角出发，#linebreak()走进夜间灯光的步行笔记],
  route-label: [OBSERVATION ROUTE · A],
  route-note: [从午后到入夜，沿着可停留的地方行走。],
  notes: (),
  footer-left: [GUIZANG FIELD JOURNAL],
  footer-right: [WALK · NOTICE · RETURN],
) = page(
  width: 1242pt,
  height: 1660pt,
  margin: 0pt,
  fill: magazine-palette.paper,
)[
  #set text(font: ("Noto Serif SC", "Songti SC"), fill: magazine-palette.ink)
  #set par(leading: 1.12em)

  #block(width: 100%, height: 100%)[
    #place(
      top + left,
      image(bytes(_field-svg), width: 100%, height: 100%, fit: "stretch"),
    )

    #pad(x: 86pt, top: 84pt, bottom: 72pt)[
      #grid(
        columns: (1fr,),
        rows: (36pt, 1206pt, 194pt),
        row-gutter: 34pt,
        _issue-row(issue, date),
        grid(
          columns: (56%, 44%),
          column-gutter: 38pt,
          {
            set align(left)
            stack(
              spacing: 28pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 19pt,
                weight: 500,
                tracking: 4pt,
                fill: magazine-palette.signal,
                upper(kicker),
              ),
              {
                set par(leading: 0.88em)
                text(
                  font: ("Noto Serif SC", "Songti SC"),
                  size: 105pt,
                  weight: 500,
                  tracking: 3.4pt,
                  fill: magazine-palette.ink,
                  title,
                )
              },
              block(width: 86pt, height: 5pt, fill: magazine-palette.ink),
              text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 29pt,
                weight: 400,
                fill: magazine-palette.ink-soft,
                subtitle,
              ),
            )
          },
          {
            set text(fill: magazine-palette.paper)
            block(width: 100%, height: 100%)[
              #grid(
                columns: (1fr,),
                rows: (30pt, 1000pt, 176pt),
                text(
                  font: ("IBM Plex Mono", "Noto Sans SC"),
                  size: 15pt,
                  tracking: 2.6pt,
                  fill: magazine-palette.paper.transparentize(26%),
                  upper(route-label),
                ),
                [],
                block(
                  width: 100%,
                  stroke: (top: 1pt + magazine-palette.paper.transparentize(58%)),
                  inset: (top: 20pt),
                )[
                  #text(
                    font: ("Noto Serif SC", "Songti SC"),
                    size: 18pt,
                    fill: magazine-palette.paper.transparentize(18%),
                    route-note,
                  )
                ],
              )
            ]
          },
        ),
        block(
          width: 100%,
          fill: magazine-palette.paper.transparentize(4%),
          stroke: (top: 1.2pt + magazine-palette.ink.transparentize(45%)),
          inset: (top: 24pt),
        )[
          #stack(
            spacing: 24pt,
            if notes.len() > 0 {
              grid(
                columns: notes.len(),
                column-gutter: 28pt,
                ..notes.enumerate().map(((i, item)) => _route-note(
                  ("01", "02", "03", "04", "05", "06").at(i),
                  item.at(0),
                  item.at(1),
                )),
              )
            },
            grid(
              columns: (1fr, auto),
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 14pt,
                tracking: 2.5pt,
                fill: magazine-palette.ink-soft,
                upper(footer-left),
              ),
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 14pt,
                tracking: 2.5pt,
                fill: magazine-palette.ink-soft,
                upper(footer-right),
              ),
            ),
          )
        ],
      )
    ]
  ]
]
