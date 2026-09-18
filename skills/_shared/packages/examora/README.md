# Examora — Chinese Exam Papers

**Package**: `@preview/examora:0.2.0`  
**Category**: Education and assessment  
**Typst Universe**: <https://typst.app/universe/package/examora>  
**Repository**: <https://github.com/pdcxs/examora>  
**License**: MIT

## Verified Boundary

Examora 0.2.0 provides an examination-paper document class with title and student-information
layout, score tables, major-question headings, choice, fill-in, true/false, and open-response
questions. Its question records keep answers beside prompts in the canonical Typst source and can
render a learner paper, answers in place, or an answer-only edition.

It is a Chinese exam-paper implementation, not a curriculum, grading policy, or proof that an
institution accepts the output. Supply question facts, scores, answer evidence, official wording,
and required fields from the user's material.

## Minimal Usage

```typst
#import "@preview/examora:0.2.0": documentclass

#set text(lang: "zh")

#let show-solutions = sys.inputs.at("solutions", default: "false") == "true"
#let exam = documentclass(
  info: (
    school: "示例学校",
    subject: "数学",
    date: datetime(year: 2026, month: 9, day: 18),
    duration: [45 分钟],
  ),
  type: "A 卷",
  method: "闭卷",
  font: ("New Computer Modern", "Noto Serif CJK SC"),
  title-font: ("New Computer Modern", "Noto Serif CJK SC"),
  random: false,
  double-page: false,
  show-answer: show-solutions,
)

#show: exam.mainmatter
#(exam.title)()
#(exam.at("score-table"))()

#(exam.at("question-header"))([选择题（每题 4 分）])
#(exam.at("choice-question"))((
  ([若 $x + 2 = 5$，则 $x$ 等于], ([1], [2], ([3], true), [4]), (fixed: true)),
))

#(exam.at("question-header"))([解答题（12 分）])
#(exam.question)(
  question: [说明你的推理过程。],
  answer: [由等式两边同时减去 2，得到 $x = 3$。],
  spacing: 3cm,
)
```

In 0.2.0, `documentclass` returns functions in a dictionary. Wrap a dot-accessed function before
calling it, as in `(exam.title)()`, and access hyphenated keys with `(exam.at("..."))(...)`. The
package's published starter uses a camel-case destructuring name for one key, but that spelling
fails with the exact 0.2.0 package on Typst 0.15; do not copy that inconsistency into a new document.

## Variant and Randomization Semantics

- `show-answer: true` reveals answers in the learner layout. `only-show-answer: true` produces a
  compact answer edition. Compile and inspect every requested edition.
- `random: true` shuffles questions and choice order. Keep an explicit `seed` for reproducible
  variants, and compare each paper with its answer edition.
- Add `(fixed: true)` to one choice-question record when its option order is semantically fixed.
  Do not globally disable randomization solely to protect one such item.
- `continue-number: false` resets sub-question numbering at each `question-header`; set it
  deliberately when the required numbering scheme differs.

## Page and Font Boundaries

Examora defaults to `double-page: true`, a page frame, and asymmetric `inside`/`outside` margins.
Those defaults target a particular print workflow. For ordinary single-page A4 output, set
`double-page: false` and verify page size, binding edge, margins, frame, and answer space rather
than assuming the defaults fit.

Set `text.lang` to the document language before applying the returned `mainmatter`; Examora uses
that semantic language to choose Chinese or English title, score-table, and numbering labels.

The package defaults name Times New Roman, KaiTi, JetBrains Mono, and LXGW WenKai Mono GB. The
bundled example instead uses Typst's New Computer Modern plus Tylina's Noto Serif CJK SC family so
it does not rely on a platform's Times or KaiTi installation. Missing fonts can change line breaks
and page count. Inspect the delivery environment; successful compilation alone does not prove the
intended font rendered.

The bundled `demo.typ` uses deterministic order and a `solutions` input so the same questions can
be compiled in learner and answer-visible forms.
