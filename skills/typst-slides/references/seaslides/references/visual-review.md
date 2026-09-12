# Visual Review Rubric

## Contents

- [Purpose](#purpose)
- [Hard rules](#hard-rules-must-fix)
- [Soft rules](#soft-rules-should-improve)
- [Don't-touch rules](#dont-touch-rules)
- [Quantified thresholds](#quantified-thresholds)
- [Review workflow](#review-workflow)
- [Iteration protocol](#iteration-protocol)

## Purpose

This document is a systematic post-compilation quality gate for Typst/Touying presentations. After the compiler produces PDF and PNG output (Step 7.1-7.2), the reviewing agent reads the rendered slide images and applies this rubric to detect visual defects that compilation alone cannot catch — overflow, collision, readability, and rhythm issues that only become apparent in the final rendered output. The rubric provides quantified thresholds so that pass/fail decisions are objective and repeatable.

Use [`artifact-ownership.md`](./artifact-ownership.md) to route each confirmed defect to content, theme, source, checker, or export ownership before applying a correction.

## Hard Rules (Must Fix)

These are critical issues that ALWAYS need correction. Any Hard rule violation on any slide blocks delivery until fixed.

| # | Category | Trigger | What to Look For |
|---|----------|---------|------------------|
| H1 | Out-of-Bounds | Any element visually exceeds the page boundary | Content clipped at edges, elements partially hidden beyond the slide frame |
| H2 | Text Overflow | Text clipped or hidden by its container | Truncated words, text running past card/block boundaries, `...` artifacts from Typst overflow |
| H3 | Text Overlap | Two text elements overlap each other | Overlapping headings/body text, labels colliding with other text, unreadable stacked characters |
| H4 | Readability | Contrast ratio below threshold | Light text on light backgrounds, dark text on dark backgrounds, text on busy images without scrim |
| H5 | Element Collision | Unintended overlaps between layout elements | Cards overlapping, images covering text, decorative elements blocking content |
| H6 | Missing Elements | Element required by the design spec or source/narrative is absent | Missing title, absent chart, placeholder text still present, slide appears emptier than intended |
| H7 | Broken Images | Placeholder boxes, missing images, or corrupted renders | Gray boxes, broken-image indicators, severely distorted or stretched images |
| H8 | Chart Accuracy | Data visualizations do not match source data | Wrong values, missing labels, incorrect scale, truncated data series |
| H9 | Mechanical Quality Gate | Incomplete checker run or any `blocker` diagnostic | Compile/output failure, missing resource, content overflow, layout non-convergence, expected-page mismatch |

**Detection order** (check sequentially per slide):

```
H9 (compiler output)  → H1 → H2 → H7 (structure)
H3 → H5              (collisions)
H4                    (readability)
H6 → H8              (content completeness)
```

### Hard Rule Details

**H1 — Out-of-Bounds**: No rendered element should appear outside the visible slide area. Check all four edges. Common causes: negative margins, `place()` with excessive `dx`/`dy`, oversized images without `clip: true`.

**H2 — Text Overflow**: All text must be fully visible within its container. Typst's overflow
behavior clips content silently in PDF/PNG output. Look for abruptly ending sentences, partial
characters at container edges, or corroborating supplemental quality-checker warnings.

**H3 — Text Overlap**: No text should overlap other text or obscure other text's readability. Exception: intentional ghost text (decorative background text at very low opacity) is permitted by design.

**H4 — Readability**: Minimum contrast ratio 4.5:1 for body text (below 24pt), 3:1 for large text (24pt and above). Verify by comparing foreground text color hex against background color hex. Text placed over images requires a scrim overlay.

**H5 — Element Collision**: Layout elements (cards, blocks, images, rules) must not overlap unless the overlap is a deliberate design choice (e.g., scrim over image). Accidental collisions typically come from incorrect `place()` coordinates or `grid`/`stack` sizing errors.

**H6 — Missing Elements**: Cross-reference the rendered slide against `content_design_spec.md`
when present. In Quick Mode, use the readable source, the concise narrative embodied in
`main.typ`, and the selected theme contract. Every required title, point, chart, image, or other
content element must be visually present.

**H7 — Broken Images**: Every `image()` call must render a visible image. Look for: empty rectangles, file-not-found placeholders, images that are entirely black/white, severe aspect ratio distortion (faces stretched, text in images unreadable).

**H8 — Chart Accuracy**: For slides with data visualizations, verify that displayed values,
labels, and proportions match the readable source data or design spec. Bars/segments should be
proportional to their values.

**H9 — Mechanical Quality Gate**: `document.validate` must succeed, and render summary,
overview, and requested pages must come from the same live Tylina workspace. When the packaged
quality checker is used as a supplemental audit, it must complete with zero `blocker` diagnostics.
Compilation/output failure, missing resources, content overflow, layout non-convergence, and an
explicit expected-page mismatch are Hard failures.

`review` diagnostics are evidence requiring a source/render disposition, not
automatic Hard failures. Font fallback can alter wrapping and hierarchy, so fix
it when locally owned or document an external-package boundary and inspect the
affected render. An unclassified warning also requires review. Touying's
`EMPTY_SLIDE` signal is advisory because it measures flow height and is often a
false positive for a fully populated `place()`-only page; inspect that PNG and do
not add invisible flow content merely to silence it. A genuinely blank rendered
page is still a Hard failure. Other advisories such as raw-text future syntax do
not imply a rendered defect by themselves.

## Soft Rules (Should Improve)

These improve quality but are not blocking failures individually. Fix when 3 or more cluster on a single page.

| # | Category | Trigger | Fix Direction |
|---|----------|---------|---------------|
| S1 | Vertical Rhythm | Inconsistent spacing between consecutive elements (more than +/-2pt from baseline) | Normalize spacing to established rhythm |
| S2 | Visual Centroid | Content appears off-center in its container when centering is expected | Adjust vertical positioning toward container center |
| S3 | Alignment Consistency | Elements that should be aligned drift more than 1pt from their axis | Snap to common alignment grid |
| S4 | Color Consistency | Palette colors used incorrectly or inconsistently vs theme definition | Correct to proper palette token |
| S5 | Typography Hierarchy | Unclear visual distinction between heading levels | Increase size/weight differentiation |
| S6 | Whitespace Balance | Page more than 80% full (cramped) or less than 20% full (barren) | Redistribute content or adjust sizing |
| S7 | Image-Text Relationship | Images positioned illogically relative to their descriptions | Move image adjacent to relevant text |
| S8 | Density Adherence | Page density mismatches its rhythm designation (anchor/dense/breathing) | Adjust content volume to match page role |
| S9 | Accent Restraint | More than 2 accent color uses on a single content slide | Reduce to 1 primary + 1 secondary accent |
| S10 | CJK Spacing | Improper spacing between CJK and Latin characters | Add or remove spacing per typographic convention |
| S11 | Layout Monotony | Repeated layouts feel mechanical or obscure narrative progression | Confirm repetition is intentional; redesign only when another structure communicates better |
| S12 | Typography Weight | All headings use `weight: "bold"` with no variation across the deck | Introduce weight hierarchy: lighter for larger text, heavier for smaller labels |
| S13 | Header Bar Check | Full-width solid-color rectangle as title container on content slides | Replace with thin accent line (≤4pt), asymmetric accent bar, or title directly on background |
| S14 | Dark/Light Rhythm | Mode changes feel arbitrary, or sustained sameness weakens hierarchy | Choose mode changes at meaningful transitions; retain sameness when continuity benefits |
| S15 | Card Design | Rounded corners + shadows on cards in Swiss/editorial themes | Use sharp rectangles with hairline borders (0.5pt) or whitespace separation only |

### Soft Rule Details

**S1 — Vertical Rhythm**: Within a single slide, the vertical gaps between elements of the same type (e.g., consecutive bullet points, consecutive cards) should be uniform. Tolerance: +/-2pt from the established baseline gap on that slide.

**S2 — Visual Centroid**: When a slide's content is meant to be centered (focus slides, statement slides, title slides), the visual center of mass should align with the geometric center of the content area. Off-center tolerance varies by slide type: title/focus slides allow less drift than content slides.

**S3 — Alignment Consistency**: Elements in the same column should share a left edge (within 1pt). Elements in the same row should share a baseline (within 1pt). Check card groups, stat blocks, and multi-column layouts.

**S6 — Whitespace Balance**: Exception: section divider slides and breathing/focus slides are permitted to be sparse (below 20% fill) by design. This rule applies primarily to content and data slides.

**S8 — Density Adherence**: If the design spec marks a page as "breathing," it should not be packed with content. If marked "dense," it should not appear mostly empty.

**S10 — CJK Spacing**: When CJK characters appear adjacent to Latin characters or numbers, proper spacing (approximately 1/4 em) should be present. Typst handles this automatically in most cases, but manual `h()` or letter-spacing overrides can break it.

**S11 — Layout Monotony**: Review repeated layout DNA in narrative context. Keep a stable structure when it supports comparison, sequence, or continuity. Redesign only when repetition feels mechanical, weakens emphasis, or makes distinct content harder to understand.

**S12 — Typography Weight**: Review the template.typ heading weights. If ALL text levels (slide title, section title, focus slide, card titles) use `weight: "bold"`, recommend introducing weight variation. For Swiss/Canvas themes this is a hard requirement (inverse weight hierarchy). For Rich themes it's a strong recommendation.

**S13 — Header Bar Check**: The full-width solid-color rectangle spanning slide width as title container is the #1 "AI slop" signal. Acceptable alternatives: (a) thin accent underline below title (30-60pt wide, 2-3pt tall), (b) very thin top bar (≤ 4pt height), (c) title directly on slide background with generous top margin.

**S14 — Contrast Rhythm**: Check whether major narrative transitions have enough
visual contrast. A dark/inverted page can support a key statistic, statement,
section divider, or closing slide when the theme provides that mode, but no deck
must add one merely to satisfy a quota. Preserve a consistent mode when that
better supports comparison or the selected theme.

**S15 — Card Design**: In Swiss and editorial themes, cards should have zero `radius:` (sharp corners) and zero shadows. Content separation should use hairline rules (0.5pt), whitespace gaps, or subtle fill differences. Rounded corners are only acceptable in creative/warm/corporate themes.

## Don't-Touch Rules

The reviewer must NOT change these aspects, even if they seem suboptimal:

- **Theme design decisions** — colors, fonts, component styles defined in `template.typ` unless they cause a Hard rule violation
- **Content text** — approved wording and messaging from the Strategist phase, or source-faithful
  Quick Mode copy
- **Layout architecture** — column counts, grid structure, and slide type choices already
  established by the design spec or Quick Mode draft
- **Slide count or ordering** — adding, removing, or reordering slides is out of scope
- **Image content** — what the images depict (only their technical rendering quality is in scope)
- **Speaker notes** — narration text is not a visual review concern
- **Template file** — `template.typ` edits are out of scope for visual review; only `main.typ` fixes are permitted

If a violation can only be fixed by changing a Don't-Touch element, mark it as `needs_human` with a suggested fix description.

## Quantified Thresholds

| Rule | Threshold | How to Verify |
|------|-----------|---------------|
| H1 | 0px outside page bounds | Visual inspection of all four edges in rendered PNG |
| H2 | 0 characters clipped | Check text blocks near container edges; verify sentence completeness |
| H3 | 0 unintended text overlaps | Scan for any region where two text elements share pixels |
| H4 | WCAG AA: 4.5:1 body text, 3:1 large text (>=24pt) | Compare foreground/background hex values from theme palette |
| H5 | 0 unintended element overlaps | Check all block/card/image boundaries for intersection |
| H9 | Valid live document and 0 supplemental blockers | Tylina validation succeeds; any optional audit exits 0 with `--fail-on blocker` and every review finding has a disposition |
| S1 | +/-2pt from established baseline | Compare consecutive element gaps within same slide |
| S3 | <=1pt drift from alignment axis | Check leftmost pixels of elements in same column |
| S6 | 20-80% content fill per content page | Visual estimation of content area vs total slide area |
| S9 | <=2 accent color uses per content slide | Count distinctly colored emphasis elements (not including theme chrome) |

## Review Workflow

### Step 1: Validate and Resolve Physical Pages

Run `document.validate`, then `render.summary`. Do not infer logical slides or
animation ownership from the physical page count.

### Step 2: Run Quality Checker

Use the packaged checker only when a supplemental audit materially helps. Follow
`${SKILL_DIR}/scripts/TYLINA.md`, use the runtime returned by `runtime.prepare`, and pass the
live workspace-relative `--entry`. Fix blocker diagnostics before proceeding. Disposition every
review finding with source context and the relevant live render; do not equate every warning with
a visual failure.

### Step 3: Overview Scan

Call `render.overview` and scan for obvious issues:
- Any slide that looks broken, empty, or drastically different from expected
- Obvious overflow or clipping
- Glaring color/contrast issues
- Missing images (gray boxes)

### Step 4: Scoped Inspection

Inspect every rendered slide in Full scope. In Targeted scope, inspect only pages flagged by the
overview or mechanical checker. For each selected page:
1. Call `render.page` at a readable PPI for the selected page
2. Check all Hard Rules (H1-H9) — any failure means fix immediately
3. Check Soft Rules (S1-S15) — note issues

### Step 5: Fix Protocol

- **Always fix** Hard rule violations — zero tolerance
- **Fix Soft rule violations** if 3 or more issues cluster on one page
- **When fixing**: make minimal changes to `main.typ`, preserve design intent
- **After fixing**: recompile (`--all`) and verify the fix did not introduce new issues
- **Maximum 3 fix-recompile iterations** — if issues persist after 3 rounds, report to user

### Step 6: Sign-off

- Full scope: all Hard rules pass across all slides -> proceed with `scope=full`
- Targeted scope: all inspected pages pass -> proceed with `scope=targeted`; do not claim full pass
- Remaining Soft issues (fewer than 3 per page) -> acceptable, note in review
- If a Hard rule cannot be fixed without violating Don't-Touch rules -> flag to user with explanation and suggested approach

## Iteration Protocol

```
Iteration 1: Compile → Quality check → Overview scan → Fix Hard violations → Recompile
Iteration 2: Re-scan → Fix remaining Hard + clustered Soft → Recompile
Iteration 3: Final verification only — if issues remain, report to user
```

**Termination conditions**:
- **Clean exit**: Zero Hard violations in the selected scope, fewer than 3 Soft issues per inspected page -> result = pass
- **Fixed exit**: Had violations, all resolved within 3 iterations -> result = fixed
- **Escalation**: Cannot resolve within 3 iterations or fix requires Don't-Touch changes -> result = needs_human

Always report scope (`full` or `targeted`) separately from result. A skipped review is
`scope=none`, `result=not_reviewed`.

**Rollback discipline**: If a fix introduces a new Hard violation that did not exist before, revert the change immediately and try an alternative approach. If no alternative exists, mark as `needs_human`.
