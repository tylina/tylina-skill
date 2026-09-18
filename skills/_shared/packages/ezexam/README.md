# Ezexam — Chinese Exams and Handouts

**Package**: `@preview/ezexam:0.3.1`  
**Category**: Education and assessment  
**Typst Universe**: <https://typst.app/universe/package/ezexam>  
**Documentation**: <https://ezexam.pages.dev/>  
**Repository**: <https://github.com/gbchu/ezexam>  
**License**: AGPL-3.0-or-later

## Verified Boundary

Ezexam 0.3.1 provides Chinese exam and handout layout, title and subject helpers, candidate sealing
lines, score boxes, question numbering, choice and blank markers, answer blocks, and A4 or imposed
A3 page configurations. It is useful when these Chinese print conventions match the requested
artifact.

The package does not supply a curriculum, factual question bank, marking policy, or institutional
approval. Keep prompts, answers, points, notices, and official fields grounded in the user's
requirements, and inspect the package's AGPL license before redistribution decisions that depend
on licensing.

## Minimal Usage

```typst
#import "@preview/ezexam:0.3.1": *

#let show-solutions = sys.inputs.at("solutions", default: "false") == "true"
#show: setup.with(
  mode: EXAM,
  paper: a4,
  show-answer: show-solutions,
  show-seal-line: false,
  font: ("New Computer Modern", "Noto Serif CJK SC"),
  heading-font: ("New Computer Modern", "Noto Sans CJK SC"),
)

#title[代数小测]
#subject[数学]

= 选择题
#question(points: 4)[
  若 $x + 2 = 5$，则 $x$ 等于 #paren(placeholder: [])[B]
  #choices(1, 3, 5, 7)
]

= 解答题
#question(points: 12, bottom: 4cm)[
  说明你的推理过程。
]

#solution-block[
  #solution(title: "解析")[等式两边同时减去 2，得到 $x = 3$。]
]
```

Install `#show: setup.with(...)` before the document body. `question`, `choices`, `paren`, and
`fillin` are content functions; pass content such as `[text]` or `$math$` where the API accepts
content rather than converting it into strings.

## Modes and Answer Visibility

- `EXAM` configures exam pagination and may add a candidate sealing line. `HANDOUTS` is the
  non-exam reading mode. They are layout modes, not evidence that one source is safe for students.
- `show-answer: true` reveals answer placeholders and enables `solution-block`; false omits that
  rendered material. Compile the learner and solution variants separately from the same source.
- `paren` and `fillin` use `"▲"` as the default hidden-answer placeholder. Pass
  `placeholder: []` when the learner edition should show an empty parenthesis or blank line rather
  than that marker; this does not change the stored answer or solution edition.
- `solution-block` switches to the package's answer presentation internally. Do not pass
  `SOLUTION` to `setup`: 0.3.1 accepts `EXAM` or `HANDOUTS` there.
- `question(points: N)` requires a positive integer. Keep point totals in the authored assessment
  model and verify them independently; the package does not prove the rubric is correct.

## Paper and Font Boundaries

In 0.3.1, `a4` is a single-column portrait configuration. `a3` is a flipped two-column imposition,
not merely a larger portrait page. Choose it only when the print workflow actually needs that
layout, and inspect folds, page order, margins, the sealing line, and printer scaling.

The default Latin/math/CJK stacks include Times New Roman, TeX Gyre Termes, Noto Serif CJK SC,
SimHei, Noto Sans CJK SC, and STKaiti fallbacks. Verify which families are present in Web, Native,
and the delivery system because fallback changes wrapping and blank-line lengths.
The local example passes Typst's New Computer Modern and Tylina's packaged Noto Serif CJK SC and
Noto Sans CJK SC families explicitly so its metrics remain available across Tylina hosts.

The bundled `demo.typ` keeps the sealing line off for a compact single-sheet sample and uses a
`solutions` input to exercise the same-source learner and answer editions.
