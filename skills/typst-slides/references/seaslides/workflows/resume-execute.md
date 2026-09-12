# Resume-Execute Split Workflow

## Contents

- [Purpose](#purpose)
- [When to Use](#when-to-use)
- [Planning Session](#phase-a-planning-session)
- [Execution Session](#phase-b-execution-session)
- [Handoff File Structure](#file-structure-at-handoff)
- [Resumption Protocol](#resumption-protocol)
- [Context Optimization](#context-optimization)
- [When to Trigger](#when-to-trigger)
- [Hand-back](#hand-back)

## Purpose

Allows splitting presentation generation across two chat sessions when:
- The deck is very long (30+ slides)
- Context window limits are approaching
- The user wants to review the plan before execution

## When to Use

- Deck >= 25 slides with Rich/Canvas complexity
- User explicitly requests "plan first, generate later"
- Context usage exceeds 70% after Strategist phase

## Phase A: Planning Session

### Deliverables
1. Complete `content_design_spec.md` (all sections filled)
2. `template.typ` (theme fully configured)
3. Image manifest (`assets/image_prompts.json`) if images needed
4. Summary of decisions made

### Exit Criteria
- All 9 Strategist confirmations complete
- Design spec has full slide-by-slide outline
- Template compiles without errors
- User approves the plan

### Handoff Artifact
Save all files to the project directory. The project directory itself IS the handoff artifact.

## Phase B: Execution Session

### Entry
User provides the project directory path (or it's the same session continuing after approval).

### Process
1. Read `content_design_spec.md` — this is the single source of truth
2. Read `template.typ` — understand available components
3. Read `theme.md` — understand slide types and API
4. Generate `main.typ` following the design spec exactly
5. Generate/acquire images if specified in manifest
6. Compile and run visual review
7. Deliver output

### Rules
- Do NOT deviate from the design spec without user approval
- Do NOT re-ask confirmations that were decided in Phase A
- If something is ambiguous in the spec, make a reasonable choice and note it

## File Structure at Handoff

```
project/
├── content_design_spec.md   <- Source of truth (from Phase A)
├── template.typ             <- Theme (from Phase A)
├── theme.md                 <- Theme API reference
├── main.typ                 <- To be generated (Phase B)
├── assets/
│   ├── image_prompts.json   <- If images needed (from Phase A)
│   └── *.png/jpg            <- Generated in Phase B
└── output/                  <- Generated in Phase B
```

## Resumption Protocol

When starting Phase B:
1. Identify project directory
2. Read `content_design_spec.md` completely
3. Read `template.typ` to understand theme API
4. Confirm understanding: "I'm resuming execution for [project]. The design spec calls for [N] slides with [complexity] complexity using [theme]. Shall I proceed?"
5. Begin writing `main.typ`

## Context Optimization

Phase B should be efficient with context:
- Don't re-read strategist.md or design-guide.md (decisions already baked into spec)
- Load only: design spec + template + theme.md + relevant executor reference
- This leaves maximum context for the actual code generation

## When to Trigger

The user opens a new chat (or continues an existing one) and signals resumption. Recognize any of:

| Pattern | Example |
|---------|---------|
| "resume execution projects/<name>" | "resume execution projects/quarterly_report_20250521" |
| Project path + continuation semantic | "continue generating projects/quarterly_report_20250521" |
| Chinese variants | "继续生成 projects/quarterly_report_20250521" |

### Sanity Check

Before executing, verify Phase A artifacts exist:

| File | Required | Reason |
|------|----------|--------|
| `content_design_spec.md` | Always | Slide outline and design decisions |
| `template.typ` | Always | Theme implementation |
| `theme.md` | Always | Theme API reference |
| `assets/image_prompts.json` | Only if images planned | Image generation manifest |

If any required artifact is missing, report which one(s) and stop. Do NOT fall back into Phase A automatically.

## Hand-back

When compilation succeeds and `output/slides.pdf` is produced, the workflow ends. Report the export path and a summary of what was generated.
