# Medical Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `medical-theme`
**Style**: Professional, trustworthy medical with blue headers, green accents, and clinical data components
**Primary color**: `#0066B3` (Medical Blue)
**Best For**: Medical academic reports, case discussions, research presentations, hospital reports
**Style Objective**: Academic
**Complexity Level**: Plain

## Description

A professional, trustworthy presentation theme designed for the medical field. Features medical blue headers, green health-affirming accents, orange warning elements, and distinctive medical decorations (cross symbols, ECG line patterns). Ideal for academic reports, clinical case discussions, research presentations, and hospital reports.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: medical-theme.with(
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
Light blue-green gradient cover with centered card (blue top border), cross decoration, green accent line, and bottom ECG line pattern.

### `#slide(title: auto)`
Content slide with medical blue top bar (4pt), bold title with green underline, and footer with cross decoration and page numbers.

### `#new-section-slide[...]`
Medical blue gradient divider with orange left vertical accent bar, white title, green underline, and ECG bottom decoration (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Full-bleed blue gradient slide with bold white centered text for key messages.

### `#ending-slide[...]`
Light gradient closing slide with centered card (blue top border), green underline, and ECG bottom decoration.

## Reusable Components

### `#case-card(title, body, accent: palette.blue)`
Clinical case display card with colored top border for patient profiles and case summaries.

```typst
#case-card([Patient Profile], [
  - *Age/Sex:* 58F, never-smoker
  - *Diagnosis:* Stage IV NSCLC
], accent: palette.blue)
```

### `#finding-box(title, body, accent: palette.green)`
Green-accented box for key findings, positive results, and important discoveries.

```typst
#finding-box([Key Result])[Overall response rate improved by 14.2% year-over-year.]
```

### `#warning-box(title, body)`
Orange-accented box for warnings, limitations, adverse events, and cautions.

```typst
#warning-box([Adverse Event Alert])[Grade 3+ irAEs occurred in 23.4% of patients.]
```

### `#clinical-table(headers, rows)`
Styled data table with deep blue header and alternating row backgrounds for clinical data and trial results.

```typst
#clinical-table(
  ([Biomarker], [Cancer Type], [ORR], [p-value]),
  (([EGFR L858R], [NSCLC], [78.4%], [< 0.001]),),
)
```

### `#stat-card(label, value, unit: none, accent: palette.blue)`
Medical metric card with large prominent number, optional unit text, and colored left accent.

```typst
#stat-card([Active Trials], [47], unit: [studies], accent: palette.blue)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Blue** | `#0066B3` | `palette.blue` | Primary medical blue, top bars, accents |
| **Deep** | `#004080` | `palette.deep` | Deep blue, section backgrounds, title text |
| **Green** | `#00A86B` | `palette.green` | Health-affirming accent, underlines, findings |
| **Orange** | `#FF6B35` | `palette.orange` | Warning accent, section accent bars |
| **Background** | `#FFFFFF` | `palette.bg` | Slide background fill |
| **Background Blue** | `#E6F3FA` | `palette.bg-blue` | Light blue tinted backgrounds |
| **Background Green** | `#E8F5EE` | `palette.bg-green` | Light green tinted backgrounds |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Component card surfaces |
| **Text Dark** | `#1A365D` | `palette.text-dark` | Dark heading/label text |
| **Text Body** | `#4A5568` | `palette.text-body` | Body text color |
| **Text Light** | `#718096` | `palette.text-light` | Footer, captions, muted text |
| **Border** | `#CBD5E0` | `palette.border` | Card and table borders |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.blue,
  neutral-lightest: white,
  neutral-darkest: palette.deep,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
