---
name: typst-education
description: Create or review Typst exams, quizzes, worksheets, handouts, and answer keys for a specific learner, locale, assessment model, and print workflow.
---

# Typst Education

Compose this Skill with Typst Authoring.

## Entry Modes

- `create`: create or revise an exam, quiz, worksheet, handout, answer key, or rubric from supplied
  learning objectives and assessment requirements.
- `review`: inspect an existing educational artifact for correctness, coverage, scoring,
  accessibility, answer leakage, and physical usability. Do not edit unless requested.

## Contract

1. Establish learner level, subject, objectives, language, locale, duration, allowed aids,
   delivery medium, paper size, duplex or booklet needs, and whether the artifact is formative or
   high-stakes.
2. Never invent factual questions, official standards, student data, answers, scoring policy, or
   institutional wording. Flag missing answer evidence and ambiguous questions.
3. Keep question identity, labels, points, rubrics, hints, solutions, and variants semantic and
   source-backed. Produce student and answer versions from shared canonical content.
4. Do not reveal solutions in the student output through hidden text, metadata, filenames, or
   accidental styling. Do not claim cryptographic secrecy from a source package.
5. Verify point totals, question counts, variant controls, answer visibility, writable space,
   page breaks, binding margins, scan areas, and print scale with real compilation.
6. Match language and typography to learners. Check CJK line breaking, right-to-left flow,
   localized numbering, units, and accessibility when applicable.

## Workflow

1. Read `references/exams-and-worksheets.md` before selecting a package or template.
2. Inspect existing source and template ownership. For a new scaffold, use `template.list`; for
   reusable components, use `package.list` with `discipline: "education"` or a focused query.
3. The package-free homework and exam workspaces are indexed at
   `_shared/scenarios/education/index.json`. Inspect and materialize an exact scaffold through
   `template.create`; never copy only the learner-facing entrypoint.
4. Inspect every shortlisted exact version. Choose by audience and required behavior, not by
   popularity, screenshots, or a familiar name.
5. Author the smallest coherent question model. Keep prompts and answers traceable to supplied
   material and make scoring criteria observable.
6. Validate both student and solution variants. Inspect representative and boundary pages at the
   intended physical size; manually verify totals against the source model.
7. In `review` mode, report correctness, fairness, ambiguity, scoring, accessibility, and layout
   separately.

## Progressive Resources

- Audience and template selection: `typst-education/references/exams-and-worksheets.md`.
- Offline homework and exam workspaces: `_shared/scenarios/education/index.json`.
- Existing ordinary assignments: `typst-authoring/references/assignment.md`.
- Package or template application: `typst-authoring/references/templates-and-packages.md`.
