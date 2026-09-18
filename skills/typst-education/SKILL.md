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

1. Learner level, subject, objectives, language, duration, allowed aids, delivery medium, and
   assessment stakes determine which design choices matter. Print details such as paper size,
   duplex, or booklet layout apply only to the requested delivery.
2. Questions and exercises may be authored from supplied objectives and trustworthy subject
   material. Do not invent factual premises, official standards, student data, institutional
   wording, or unsupported answer keys; flag ambiguity and missing answer evidence.
3. Keep question identity, labels, points, rubrics, hints, solutions, and variants semantic and
   source-backed. Produce student and answer versions from shared canonical content.
4. Do not reveal solutions in the student output through hidden text, metadata, filenames, or
   accidental styling. Do not claim cryptographic secrecy from a source package.
5. Verify point totals, question counts, variant controls, answer visibility, writable space,
   page breaks, binding margins, scan areas, and print scale with real compilation.
6. Match language and typography to learners. Check CJK line breaking, right-to-left flow,
   localized numbering, units, and accessibility when applicable.

## Template and Variant Information

- `typst-education/references/exams-and-worksheets.md` distinguishes assessment types, audiences,
  locale needs, and relevant template or package behavior.
- Package-free homework and exam workspaces are indexed at
  `_shared/scenarios/education/index.json`. Use the template tools to materialize the complete
  selected scaffold; use a focused `package.list` query for reusable components.
- For Chinese exam conventions, the pinned `_shared/packages/ezexam/README.md` and
  `_shared/packages/examora/README.md` recipes document different page, answer-visibility, and
  randomization models. Read only the recipe for the selected package; neither one supplies
  curriculum facts or proves institutional acceptance.
- Learner and solution outputs should derive from shared canonical questions, scoring data, and
  answer visibility controls. Validate each requested variant and verify totals, visibility,
  writable space, page breaks, and print scale against that shared source.
- Review findings should distinguish correctness, fairness, ambiguity, scoring, accessibility,
  and layout rather than treating them as one issue.

## Adaptive Workflow

1. Identify the learner, subject, objectives, assessment stakes, language, duration, allowed aids,
   delivery medium, and only the print constraints that actually apply.
2. Read `typst-education/references/exams-and-worksheets.md`, inspect existing template ownership,
   and preserve a working assessment model.
3. For a new scaffold, inspect and materialize one complete reviewed education workspace. For a
   reusable component, use a focused package search and exact versioned evidence. Choose by learner,
   locale, and required behavior rather than popularity, screenshots, or a familiar name.
4. Author a semantic question model whose prompts, points, rubric, hints, solutions, and variants
   remain traceable to objectives and trustworthy subject material.
5. Validate every requested learner and solution variant; verify totals, answer visibility,
   writable space, page breaks, margins, scan areas, and print scale.
6. In review work, report correctness, coverage, fairness, ambiguity, scoring, accessibility, and
   layout as separate findings.

## Progressive Resources

- Audience and template selection: `typst-education/references/exams-and-worksheets.md`.
- Offline homework and exam workspaces: `_shared/scenarios/education/index.json`.
- Reviewed Chinese exam package recipes: `_shared/packages/ezexam/README.md` and
  `_shared/packages/examora/README.md`.
- Existing ordinary assignments: `typst-authoring/references/assignment.md`.
- Package or template application: `typst-authoring/references/templates-and-packages.md`.
