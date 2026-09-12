# Gov-Red Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `gov-red-theme`
**Style**: Authoritative, dignified government with red-blue dual-color gradient and gold accents
**Primary color**: `#8B0000` (Government Red)
**Best For**: Government briefings, policy interpretation, work summaries, Party/state events
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

An authoritative, dignified government-style presentation theme combining Government Red and Government Blue as primary colors with Gold accent elements. Features a red-blue dual-color gradient bar, red number blocks, gold decorative dots, and framed title cards. Designed for government briefings, policy interpretation, work summaries, and official reports.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: gov-red-theme.with(
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
Light cover with centered card framed by red top border and blue bottom border, gold star decoration, and left red/blue vertical accent bar.

### `#slide(title: auto)`
Content slide with red-blue gradient top bar, bold red title with gold underline, and footer with gold dots and page numbers.

### `#new-section-slide[...]`
Deep blue gradient divider with left gold accent stripe, gold line above title, and gold star decoration (auto-triggered by `= Heading`).

### `#outline-slide(title: [目 录], items)`
Table of contents with red number blocks and blue chapter titles.

### `#focus-slide[...]`
Full-screen solid red background with bold white centered text.

### `#ending-slide[...]`
Light closing slide with red/blue framed card, gold star, gold separator, and decorative corner circles.

## Reusable Components

### `#policy-card(number, title, description)`
Card with red number block, bold blue title, and red left border accent for policy items.

```typst
#policy-card(1, [Policy Title], [Description of the policy or initiative.])
```

### `#achievement-box(title, body)`
Gold-accented box with gold star icon for highlighting achievements and milestones.

```typst
#achievement-box([Achievement Title])[Details about the achievement.]
```

### `#info-box(title, body, accent: palette.blue, icon: none)`
Blue-accented information box for notices, regulations, and supplementary information.

```typst
#info-box([Notice])[Important information here.]
```

### `#data-card(label, value, accent: palette.red)`
Metric/KPI card with large colored number and top accent border.

```typst
#data-card([Revenue], [1.28 Trillion], accent: palette.red)
```

### `#report-table(headers, rows)`
Styled table with red header row and alternating row backgrounds.

```typst
#report-table(
  ([Column A], [Column B], [Column C]),
  (([Row 1A], [Row 1B], [Row 1C]),),
)
```

### `#milestone-item(year, title, content)`
Timeline item with blue year badge and red title for chronological milestones.

```typst
#milestone-item([2024.06], [Milestone Title], [Description of what happened.])
```

### `#stat-row(..items)`
Horizontal row of large statistics with colors cycling through red, blue, gold.

```typst
#stat-row(
  (value: [98.5%], label: [Coverage Rate]),
  (value: [42], label: [New Schools]),
)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Red** | `#8B0000` | `palette.red` | Primary government red, number blocks, accents |
| **Blue** | `#003366` | `palette.blue` | Government blue, dark backgrounds, title text |
| **Gold** | `#DAA520` | `palette.gold` | Gold accents, decorative lines, star elements |
| **Background** | `#FFFFFF` | `palette.bg` | Slide background fill |
| **Background Light** | `#F5F7FA` | `palette.bg-light` | Light tinted backgrounds |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Component card surfaces |
| **Border** | `#D5D8DC` | `palette.border` | Card and table borders |
| **Text Dark** | `#1A1A1A` | `palette.text-dark` | Dark heading/label text |
| **Text Body** | `#4A4A4A` | `palette.text-body` | Body text color |
| **Text Light** | `#888888` | `palette.text-light` | Footer, captions, muted text |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.red,
  neutral-lightest: white,
  neutral-darkest: palette.blue,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
