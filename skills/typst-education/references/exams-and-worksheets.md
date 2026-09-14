# Exams, Worksheets, and Handouts

Select the artifact before selecting a package. A formal invigilated exam, take-home assignment,
practice worksheet, tutoring handout, reference sheet, and answer key have different pagination,
identity, scoring, and disclosure requirements.

## Candidate Routing

Always call `package.list` or `template.list` and inspect the exact returned version. The names
below are search seeds backed by their published project descriptions, not stable API promises.

| Audience or need | Useful search seeds | What to verify |
|---|---|---|
| Chinese school or university exam and handout | `ezexam`, `examora`, `shuxuejuan` | Chinese labels and fonts, sealing line, A3/A4 or duplex imposition, answer modes, randomization, and institutional fields |
| General university exam, quiz, or homework | `examy`, `g-exam`, `examit` | point accounting, nested questions, writable answer boxes, smart references, and student/solution variants |
| Data or computing worksheet and tutoring material | `exm`, `codepoint` | print/screen/answer modes, code blocks, multiple choice, callouts, and automatic totals |
| Assignment or exercise sheet | `sheetstorm`, `minicise`, `ditto` | repeated course metadata, due-date fields, exercise numbering, solutions, and compact printing |
| International Baccalaureate | `examine-ib` | exact programme conventions, paper structure, locale, and current template scope |
| Arabic mathematics exam | `arabic-exam-kit` | right-to-left layout, Arabic fonts, math direction boundaries, and localized fields |
| Institution- or country-specific exam | `enunciado-facil-fcfm`, `ttt-exam`, `tuhi-exam-vuw`, `sang-math` | only use when the user's institution, language, or curriculum actually matches |

`examy` is designed around exams, quizzes, and homework with numbered questions, answer boxes,
point totals, cross-references, and switchable solutions. `exm` targets Data 8-style discussion and
tutoring worksheets, notes, reference sheets, and exams. `examora` exposes Chinese examination
paper controls such as student information, closed/open book labels, sealing lines, randomization,
duplex layout, and answer variants. These descriptions guide shortlisting only; read the exact
package documentation before authoring.

## Assessment Design Gate

- Map every question to a supplied objective and expected evidence of learning.
- State assumptions, units, rounding, allowed methods, and acceptable equivalent answers.
- Avoid accidental clues across questions and avoid cultural or language load unrelated to the
  intended construct.
- Give response space proportional to the expected work, including diagrams and scratch work.
- Keep points and difficulty intentional; do not infer either from answer length alone.
- Preserve accessibility: legible minimum type, sufficient contrast, descriptive figures,
  predictable navigation, and non-color-only distinctions.

## Variant and Print Gate

Compile every delivered variant from the same verified source. Check that solution switches affect
only intended content, random seeds are reproducible, totals stay invariant when required, and
variant identifiers are visible to staff. Inspect first/last questions, page boundaries, tables,
large equations, scan/bubble areas, inside/outside margins, booklet order, and blank backs.

If the package's implementation breaks source mapping or Document editing, retain a usable Split
surface and report the limitation; do not add a feature-specific parser or recreate the package's
structure from rendered text.

