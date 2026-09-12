# Psychology Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `psychology-theme`
**Style**: Professional, warm, healing, trustworthy / light theme
**Primary color**: `#2E5C8E` (Secure Blue)
**Best For**: Psychotherapy training, academic lectures, attachment theory, counseling, developmental psychology
**Style Objective**: Academic
**Complexity Level**: Plain

## Description

A professional, warm, and trustworthy presentation theme designed for psychology, psychotherapy, and counseling contexts. Features a light background with blue-green gradient accents, warm orange decorative elements, and concentric circle decorations that evoke trust, healing, and intellectual rigor. Best suited for psychotherapy training, attachment theory, counseling lectures, and mental health seminars.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: psychology-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Dark blue-to-green gradient background with centered white card, warm orange decorative line, and concentric circle decorations.

### `#slide(title: auto)`
Light background content slide with blue gradient top bar, blue left accent bar next to the title, and warm orange footer line.

### `#new-section-slide[...]`
Blue-green gradient background section divider with white title, orange accent bar, and concentric circles.

### `#focus-slide[...]`
Full-screen blue gradient background with centered white bold text for impactful quotes or key takeaways.

### `#ending-slide[...]`
Light gradient background with centered white card, orange decorative line, and colored dot accents.

### `#outline-slide(title: [Contents])`
Table of contents slide with light background, auto-generated section list, and warm accents.

## Reusable Components

### `#quote-card(quote, author: none)`
Green left-border quote block for theoretical quotes and key citations.
```typst
#quote-card([The propensity to make strong emotional bonds...], author: [Bowlby, 1988])
```

### `#concept-card(title, body, accent: palette.blue)`
Theory/concept card with colored top border accent for presenting frameworks.
```typst
#concept-card([Secure Base], [From a position of felt security...], accent: palette.green)
```

### `#case-box(title, body)`
Orange-accented box for clinical case studies, vignettes, or examples.
```typst
#case-box([Clinical Vignette: Maria, 34], [Presents with recurrent depression...])
```

### `#tag(content, color: palette.blue)`
Capsule-shaped tag/badge for categorization and labeling.
```typst
#tag([Secure Attachment], color: palette.green)
```

### `#insight-box(title, body)`
Green-accented box for research findings, insights, or key discoveries.
```typst
#insight-box([Key Finding], [Reunion behavior is the critical marker...])
```

### `#warning-box(title, body)`
Red-accented box for clinical cautions, risk factors, or warnings.
```typst
#warning-box([Clinical Caution], [Attachment classification is not a diagnosis...])
```

### `#callout-box(title, body, accent: palette.blue, icon: none, title-color: auto)`
Generic accented callout box; base component used by `case-box`, `insight-box`, and `warning-box`.
```typst
#callout-box([Note], [Important information here.], accent: palette.blue)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Blue** | `#2E5C8E` | `palette.blue` | Primary secure blue, accents, title bars |
| **Dark** | `#1E3A5F` | `palette.dark` | Deep blue, gradient backgrounds, title text |
| **Orange** | `#E07843` | `palette.orange` | Warm decorative lines, case box accent |
| **Green** | `#3D8B7A` | `palette.green` | Quote cards, insight boxes, gradient accents |
| **Gray** | `#64748B` | `palette.gray` | Neutral gray for muted elements |
| **Red** | `#B54545` | `palette.red` | Warning/risk box accent |
| **Background** | `#F8FAFC` | `palette.bg` | Slide background fill |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Component card surfaces |
| **Border** | `#E2E8F0` | `palette.border` | Card and component borders |
| **Text Dark** | `#1E293B` | `palette.text-dark` | Dark heading/label text |
| **Text Body** | `#475569` | `palette.text-body` | Body text color |
| **Text Light** | `#94A3B8` | `palette.text-light` | Footer, captions, muted text |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.blue,
  neutral-lightest: white,
  neutral-darkest: palette.dark,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
