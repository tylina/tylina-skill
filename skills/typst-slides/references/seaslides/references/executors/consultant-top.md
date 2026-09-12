# Executor Consultant Top — Top-tier Consulting Style (MBB Level)

## Contents

- [Role and references](#role-definition)
- [Complexity level](#complexity-level)
- [MBB template-content separation](#template-content-separation-for-mbb-slides)
- [SCQA framework](#scqa-framework)
- [Data contextualization](#data-contextualization)
- [Pyramid principle](#pyramid-principle)
- [MBB layout patterns](#mbb-level-layout-patterns)
- [Extreme simplicity](#extreme-simplicity)
- [Speaker notes](#speaker-notes-style)
- [Use cases and packages](#common-use-cases)
- [Quality checklist and best practices](#quality-checklist)

## Role Definition
MBB-level (McKinsey/Bain/BCG) top-tier consulting style Typst design executor, specializing in executive briefings, board presentations, and strategic recommendations.

> **Scope**: This file owns board-level, investment, and MBB-style recommendation execution. Use `consultant.md` for broader operational and data-heavy consulting decks; shared workflow and technical rules remain in `base.md` and `shared-standards.md`.

## References
- `base.md` — Common execution guidelines
- `shared-standards.md` — Typst/Touying technical constraints and TCS principles
- `template-designer.md` — Theme design patterns and component architecture

---

## Complexity Level

> See `shared-standards.md` §1c for the full Plain/Rich/Canvas comparison table.

MBB Consulting **defaults to Rich** — SCQA framework with takeaway boxes, KPI dashboards, comparison tables, and chart suites.

| Complexity | When to Use |
|------------|-------------|
| **Rich (default)** | Board presentations, strategy reviews, investment decisions with full visual support |
| **Canvas** | Premium executive deliverables with unique per-page visual composition (e.g., exhibit-style decks) |
| **Plain (override)** | Text-heavy strategy memos, internal discussion papers, quick executive updates |

---

## Template-Content Separation for MBB Slides

> **TCS**: No raw `rgb()`, `block(fill:)` in main.typ — structural layout is fine. See `shared-standards.md` §1.

### MBB Component Library

> **Component implementations**: See `template-designer.md` for full code definitions of all components (callout-box, kpi-card, takeaway-box, etc.).

The template should provide these MBB components:

| Component | Purpose | Usage in main.typ |
|-----------|---------|-------------------|
| `takeaway-box(body)` | Bold conclusion on dark background | `#takeaway-box[Key insight here]` |
| `kpi-card(label, value, change)` | Metric with label/value/change | `#kpi-card[Revenue][\$12.5M][+22%]` |
| `source-footer(source)` | Source attribution at slide bottom | `#source-footer[Source: ...]` |
| `finding-box(title, body, accent)` | Insight callout with left accent | `#finding-box[Title][Body text]` |
| `comparison-table(headers, rows)` | Structured data comparison | `#comparison-table(headers, rows)` |
| `pillar-card(num, title, goal, action)` | Strategic framework element | `#pillar-card[01][Title][Goal][Action]` |

> **Badge/number label rule**: The `num` argument in `pillar-card` is designed for **1-2 character labels** (digits like `01`, `02`). For CJK text or multi-word labels, use a **short abbreviation** (1-2 characters max) or switch to a text-based numbering approach instead of circular badges. Chinese multi-character text WILL overflow the badge's fixed-size circle. Preferred: use sequential digits (`01`, `02`, `03`) for pillars, with the CJK label as the `title` argument.

### Usage Pattern

Each content slide: `== Action-Oriented Title` → body text (1-2 sentences) → 3 bullet points with data → `#takeaway-box[...]` → `#source-footer[...]`. See `base.md` §2 for heading/slide structure.

---

## SCQA Framework

**Situation-Complication-Question-Answer** narrative structure for executive presentations:

| Element | Purpose | Timing | Content |
|---------|---------|--------|---------|
| **S - Situation** | Establish common ground | 20% | Current state, background |
| **C - Complication** | Introduce tension | 30% | Problem, challenge |
| **Q - Question** | Frame the issue | 10% | What should we do? |
| **A - Answer** | Provide solution | 40% | Recommendation, next steps |

### SCQA Implementation

Map each element to slides: S → 1 slide max (brief context), C → 1-2 slides (quantified problem + takeaway-box), Q → 1 slide (clear actionable question in italic), A → remaining slides (conclusion-first + specific recommendations with takeaway-box). Keep Situation brief, Complication quantified, Question actionable, Answer decisive with time-bound actions.

---

## Data Contextualization

Never present raw data without context. Five comparison frameworks:

| Type | Description | Example |
|------|-------------|---------|
| **Time** | Compare to previous periods | "+22% YoY, highest growth in 5 years" |
| **Benchmark** | Compare to industry standards | "18.7% margin exceeds industry avg of 14.2%" |
| **Competitive** | Compare to key competitors | "28.5% share, leading by 8.3 pts" |
| **Target Gap** | Compare to goals | "92.3% satisfaction, 2.7 pts short of 95% target" |
| **Ranking** | Show relative position | "Rank #3 of 12, up from #5 last year" |

---

## Pyramid Principle

**Conclusion-first**: Main conclusion → 3-4 supporting arguments (most important first) → data/evidence for each → connect to action. Every slide starts with its takeaway, not its analysis.

---

## MBB-Level Layout Patterns

| Pattern | Structure | Key Elements |
|---------|-----------|-------------|
| **Content Page** | `== Title` → italic takeaway → 3 bullets → `#takeaway-box[...]` → `#source-footer[...]` | Action-oriented title, time-bound implications |
| **KPI Dashboard** | `== Title` → `#cols` with 3 `#kpi-card[...]` → `#takeaway-box[...]` | Label + value + change per card |
| **Two-Column Analysis** | `== Title` → `#cols[Current State][Projected State]` → `#takeaway-box[...]` | Before/after or current/target comparison |
| **Source Footer** | `#source-footer[Source: ... \| Confidential]` | Defined in template.typ, called in main.typ |

---

## Extreme Simplicity

One core message per slide, max 3 supporting points. Every word earns its place. Generous white space. If content exceeds 3 bullets, split into multiple slides or move detail to appendix.

---

## Speaker Notes Style

**Executive briefing tone**: Concise, direct, action-oriented, confident but measured. Focus on implications, respect for time. Structure: Opening (purpose) → 3 key messages → supporting data → implications → specific recommendation → Q&A.

---

## Common Use Cases

- **Board**: Executive summary → KPI cards → SCQA strategic opportunities → Risk (finding boxes) → Recommendation → Next steps
- **Strategy Review**: Situation (1 slide) → Challenges → Options (3 max) → Recommended approach → Implementation → Resources
- **Investment Decision**: Opportunity → Market analysis → Financial KPIs → Risk → Recommendation → Decision needed (action + deadline)

---

### Ghost Deck Test

Read ONLY slide titles in sequence. They should tell the complete argument:

> "Market Opportunity -> Competitive Landscape -> Our Advantage -> Investment Thesis -> Risk Mitigation -> Recommendation"
>
> NOT: "Introduction -> Overview -> Details -> More Details -> Summary -> Q&A"

If titles don't convey a clear narrative, revise to be **action-oriented**.

---

## Package Reference

> See `base.md` §5 for the full content enhancement package table and `shared-standards.md` §5 for versions.

MBB decks frequently contain: financial formulas (mitex), data charts (lilaq or gribouille when layered statistical mappings help), strategic roadmaps with checklists (cheq), and process flows (merman — Mermaid syntax). Actively consider these packages — they elevate consulting decks beyond bullet-point text.

---

## Quality Checklist

> **Common checks**: See `base.md` §8 for the full shared checklist.

**Consultant-top-specific checks**:
- [ ] CRITICAL: Every content slide has a #speaker-note[...] block
- [ ] All slides created via == Heading (NOT #slide(title: ...))
- [ ] Inline math uses #mi(), block math uses #mitex()
- [ ] NO fake formula text or Unicode lookalikes — use real `#mi`/`#mitex` or verified native `$...$` math
- [ ] All relevant source images from sources/ are used in slides
- [ ] If sources/ contains images, verify at least some are referenced in main.typ
- [ ] SCQA framework applied to narrative
- [ ] All data contextualized (time, benchmark, competitor, target, ranking)
- [ ] Pyramid principle followed (conclusion first)
- [ ] Each slide has one core message, max 3 supporting points
- [ ] Takeaway boxes prominent and clear
- [ ] Speaker notes executive-appropriate
- [ ] Recommendations actionable and time-bound
- [ ] All components (`takeaway-box`, `kpi-card`, `source-footer`) defined in `template.typ`
- [ ] `---` used only for slide breaks (use `--` for en-dashes)
- [ ] All `context` expressions wrapped in `{}` braces

---

## Best Practices

- Start with conclusion, not analysis (Pyramid Principle)
- Contextualize every number (5 comparison types above)
- One message per slide, max 3 points, generous white space
- Recommendations must be specific, actionable, and time-bound
- Use template components — no inline `rgb()` or `block(fill:)` in main.typ
