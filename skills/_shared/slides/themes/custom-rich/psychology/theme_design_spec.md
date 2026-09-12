# Psychology Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | psychology |
| **Best For** | Psychology conferences, behavioral research, mental health presentations |
| **Style Objective** | Academic |
| **Complexity Level** | Plain |

A professional, warm, and trustworthy presentation theme designed for psychology, psychotherapy, and counseling contexts. Features a light background with blue-green gradient accents, warm orange decorative elements, and carefully chosen colors that evoke trust, healing, and intellectual rigor.

## Design Philosophy

- **Professional & Warm**: Clean layouts with soft, healing color tones
- **Trustworthy**: Deep blues convey authority; greens suggest growth and healing
- **Light Theme**: Cloud white backgrounds with high readability
- **Subtle Accents**: Left accent bars, warm orange lines, and concentric circle decorations add visual interest without overwhelming content

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Secure Blue | `#2E5C8E` | Primary — titles, accent bars, main elements |
| Deep Navy | `#1E3A5F` | Dark backgrounds, section slides |
| Warm Orange | `#E07843` | Decorative lines, case studies, emphasis |
| Healing Green | `#3D8B7A` | Quotes, insights, growth-related content |
| Cool Gray-Blue | `#64748B` | Secondary text, neutral tags |
| Trauma Red | `#B54545` | Warnings, clinical cautions, risk indicators |
| Cloud White | `#F8FAFC` | Main background |
| Card White | `#FFFFFF` | Card backgrounds |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: psychology-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Cover slide with a dark blue-to-green gradient background, centered white card, warm orange decorative line, and concentric circle decorations. Displays title, subtitle, author, institution, and date from `config-info`.

### `slide(title: auto, ..args)`
Standard content slide with:
- Blue gradient top bar (6pt)
- Blue left accent bar next to the title
- Warm orange line in the footer
- Slide counter in bottom-right corner

### `new-section-slide(self: none, body)`
Section divider slide (auto-triggered by `= Section Title`). Features a blue-green gradient background, white section title, orange accent bar, and concentric circle decorations.

### `focus-slide(body)`
Full-screen blue gradient background with centered white text. Ideal for impactful quotes, key takeaways, or transitional moments.

### `ending-slide(body)`
Closing slide with a light gradient background, centered white card, orange decorative line, and colored dot accents.

### `outline-slide(title: [Contents])`
Table of contents slide with a light background, section list with warm accents. Auto-generates from heading structure.

```typst
#outline-slide()
```

## Reusable Components

### `quote-card(quote, author: none)`
A quote block with a green left border. Ideal for theoretical quotes and key citations.

```typst
#quote-card(
  [The propensity to make strong emotional bonds...],
  author: [John Bowlby, 1988],
)
```

### `concept-card(title, body, accent: palette.blue)`
A card for presenting concepts, theories, or frameworks. Has a colored top border accent.

```typst
#concept-card([Secure Base], [
  From a position of felt security, the individual can explore...
], accent: palette.green)
```

### `case-box(title, body)`
An orange-accented box for clinical case studies, vignettes, or examples.

```typst
#case-box([Clinical Vignette: Maria, 34], [
  Presents with recurrent depression and relationship difficulties...
])
```

### `tag(content, color: palette.blue)`
A capsule-shaped tag/badge for categorization and labeling.

```typst
#tag([Secure Attachment], color: palette.green)
#tag([Developmental], color: palette.blue)
```

### `insight-box(title, body)`
A green-accented box for research findings, insights, or key discoveries.

```typst
#insight-box([Key Research Finding], [
  The reunion behavior is the critical marker of attachment quality...
])
```

### `warning-box(title, body)`
A red-accented box for clinical cautions, risk factors, or warnings.

```typst
#warning-box([Clinical Caution], [
  Attachment classification is not a diagnosis...
])
```

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.blue)[Secure Blue text]
#text(fill: palette.green)[Healing Green text]
#text(fill: palette.orange)[Warm Orange text]
#text(fill: palette.red)[Warning Red text]
```

- `palette.blue`, `palette.dark`, `palette.orange`, `palette.green`, `palette.gray`, `palette.red`
- `palette.bg`, `palette.card-bg`, `palette.border`
- `palette.text-dark`, `palette.text-body`, `palette.text-light`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.blue` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.dark` | Dark text on light backgrounds |

## Best Use Cases

- Psychotherapy training and workshops
- Attachment theory research presentations
- Clinical psychology lectures
- Counseling and developmental psychology
- Mental health awareness seminars
- Academic conferences in psychology

## Recommended Complexity

**Plain** — This theme is optimized for text-rich, content-focused presentations typical of academic psychology. Use `concept-card` and `quote-card` for structured content rather than heavy visual effects.

## Demo

See `demo.typ` for a complete 14-slide demonstration covering:
1. Title slide
2. Theoretical Foundation (origins, key concepts)
3. Attachment Patterns (Strange Situation, four types, adult patterns)
4. Clinical Applications (psychopathology, therapeutic relationship)
5. Treatment Approaches (EFT, MBT, integrative framework)
6. Focus slide and ending slide

## File Structure

```
psychology/
  template.typ   — Theme definition (colors, slides, components)
  demo.typ       — Full demonstration presentation
  README.md      — This documentation
  output/        — Compiled slide images (PNG)
```
