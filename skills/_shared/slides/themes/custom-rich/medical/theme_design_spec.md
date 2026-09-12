# Medical Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | medical |
| **Best For** | Medical conferences, healthcare presentations, clinical research |
| **Style Objective** | Academic |
| **Complexity Level** | Plain |

A professional, trustworthy presentation theme designed for medical academic reports, clinical case discussions, research presentations, and hospital reports.

## Design Philosophy

- **Professional & Rigorous**: Clean layouts with structured clinical data presentation
- **Life-Affirming**: Green accents symbolize health, recovery, and vitality
- **Tech-Forward**: Modern typography and geometric decorations (cross, ECG patterns)
- **Trustworthy**: Medical blue as primary color conveys authority and reliability
- **Light Theme**: White/light backgrounds for readability in clinical and conference settings

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| Medical Blue | `#0066B3` | Primary color, headers, key UI elements |
| Deep Medical Blue | `#004080` | Title text, table headers, dark accents |
| Accent Green | `#00A86B` | Health/life elements, findings, positive indicators |
| Emphasis Orange | `#FF6B35` | Warnings, section accent bars, emphasis |
| Light Blue BG | `#E6F3FA` | Alternate row backgrounds, subtle fills |
| Light Green BG | `#E8F5EE` | Finding box backgrounds |
| Text Dark | `#1A365D` | Primary heading text |
| Text Body | `#4A5568` | Body text |
| Text Light | `#718096` | Secondary/footer text |
| Border | `#CBD5E0` | Card and table borders |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.blue` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.deep` | Dark text on light backgrounds |

## Slide Functions

### `title-slide(..args)`
Full-page title slide with centered card, blue top border accent, cross decoration, and ECG bottom line. Uses `config-info` fields: `title`, `subtitle`, `author`, `institution`, `date`.

### `slide(title: auto, ..args)`
Standard content slide with medical blue top bar, bold title with green underline, and footer with page numbers and cross decoration.

### `new-section-slide(self: none, body)`
Section divider with medical blue gradient background, orange left vertical bar (6px), white title text, and green underline accent. Auto-generated when using `= Section Title`.

### `focus-slide(body)`
Full-bleed blue gradient slide for key messages and takeaways. White bold text, centered.

### `ending-slide(body)`
Thank-you / closing slide with light gradient background, centered card with blue top border, and ECG decoration.

## Reusable Components

### `case-card(title, body, accent: palette.blue)`
Clinical case display card with colored top border. Ideal for patient profiles, case summaries, and categorized information blocks.

```typ
#case-card([Patient Profile], [
  - *Age/Sex:* 58F, never-smoker
  - *Diagnosis:* Stage IV NSCLC
  - *Treatment:* Entrectinib 600 mg daily
], accent: palette.blue)
```

### `finding-box(title, body)`
Green-accented box for key findings, positive results, and important discoveries.

```typ
#finding-box([Key Result], [
  Overall response rate improved by 14.2% year-over-year.
])
```

### `warning-box(title, body)`
Orange-accented box for warnings, limitations, adverse events, and cautions.

```typ
#warning-box([Adverse Event Alert], [
  Grade 3+ irAEs occurred in 23.4% of ICI-treated patients.
])
```

### `clinical-table(headers, rows)`
Styled data table with deep blue header and alternating row backgrounds. Designed for clinical data, trial results, and biomarker summaries.

```typ
#clinical-table(
  ([Biomarker], [Cancer Type], [ORR], [p-value]),
  (
    ([EGFR L858R], [NSCLC], [78.4%], [< 0.001]),
    ([HER2 amp.], [Breast], [61.3%], [< 0.001]),
  ),
)
```

### `stat-card(label, value, unit: none, accent: palette.blue)`
Medical metric card with large prominent number, optional unit text, and colored left accent. Great for KPIs and statistics.

```typ
#stat-card([Active Trials], [47], unit: [studies], accent: palette.blue)
```

## Helper Functions

### `blue-bar(height: 4pt)`
Simple medical blue horizontal bar. Used internally in slide headers.

### `orange-accent(height)`
Left orange vertical bar (6px wide). Used in section slides.

### `med-cross(size: 16pt, color: palette.blue, thickness: 3pt)`
Medical cross (+) geometric decoration. Used in title slides, footers, and ending slides.

### `ecg-line(width: 200pt, color: palette.green)`
ECG/heartbeat-style line decoration. Used as bottom decoration on title, section, and ending slides.

## Quick Start

```typ
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: medical-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Institution Name],
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle or Conference Name],
    author: [Dr. Your Name, MD],
    institution: [Department, Hospital/University],
    date: datetime.today(),
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content here.

#ending-slide()[Thank You]
```

## Theme Entry Point

```typ
#let medical-theme(
  aspect-ratio: "16-9",  // "16-9" or "4-3"
  align: horizon,         // vertical alignment
  footer: none,           // footer text content
  ..args,
  body,
)
```

## Best Practices

1. **Use `stat-card` in grids of 3-4** for KPI dashboards
2. **Pair `finding-box` with `warning-box`** for balanced reporting
3. **Use `case-card` with different accents** to distinguish clinical categories
4. **Keep `clinical-table` to 4-6 columns** for readability at presentation scale
5. **Use `focus-slide`** sparingly for 1-2 key takeaway messages
6. **Recommended complexity**: `plain` (no animations needed)

## Fonts

Fonts are **not** set in `template.typ`. Set your preferred fonts in `main.typ` (or `demo.typ`) via `#set text(font: ...)` before the `#show: medical-theme.with(...)` call.

## File Structure

```
medical/
  template.typ    — Theme definition (colors, slides, components)
  demo.typ        — Full demonstration (14 slides)
  README.md       — This documentation
  output/         — Compiled slide images (PNG)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Compatible with current stable release
- **Aspect Ratios**: 16:9 (default), 4:3
