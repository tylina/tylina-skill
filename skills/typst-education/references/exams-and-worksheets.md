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
| Chinese informatics-competition statement | `fuzzy-cnoi-statement` | CNOI scope, problem metadata, input/output and sample fidelity, limits, attachments, and current competition requirements |
| General exam, quiz, or homework | `examy`, `g-exam`, `examit`, `texam` | point accounting, nested questions, cover and evaluation fields, writable answer boxes, references, and student/solution variants |
| Deterministically randomized exam sets | `quizforge` | stable seeds, question and option permutation, answer-key correspondence, grading metadata, and reproducibility |
| Data or computing worksheet and tutoring material | `exm`, `codepoint` | print/screen/answer modes, code blocks, multiple choice, callouts, and automatic totals |
| Assignment or exercise sheet | `sheetstorm`, `minicise`, `ditto` | repeated course metadata, due-date fields, exercise numbering, solutions, and compact printing |
| International Baccalaureate | `examine-ib` | exact programme conventions, paper structure, locale, and current template scope |
| Arabic mathematics exam | `arabic-exam-kit` | right-to-left layout, Arabic fonts, math direction boundaries, and localized fields |
| German teacher workflow | `ttt-exam` | German labels, points, task model, teacher controls, and actual institutional fit |
| Victoria University of Wellington | `tuhi-exam-vuw` | current VUW structure, required fields, paper conventions, and institutional authorization |
| Vietnamese upper-secondary mathematics and science | `sang-math` | BGD 2025 scope, Vietnamese typography, subject-specific macros, answer model, and current policy |
| Other institution- or country-specific exam | `enunciado-facil-fcfm` or a focused locale query | only use when the user's institution, language, and current curriculum actually match |

At the 2026-09 registry review, current discovery included `examy` 0.2.0, `exm` 0.1.0,
`examora` 0.2.0, `g-exam` 0.4.5, `quizforge` 0.1.0, `examine-ib` 0.1.2, and
`fuzzy-cnoi-statement` 0.1.3. These versions are research context, not an offline lock: use the
version returned by the active host and inspect its exact package documentation before authoring.

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

Randomization is not secrecy. Inspect generated student variants and answer keys together, and never
place solutions in a student file, resource, metadata record, or predictable export merely because
the template hides them visually.

If the package's implementation breaks source mapping or Document editing, retain a usable Split
surface and report the limitation; do not add a feature-specific parser or recreate the package's
structure from rendered text.
