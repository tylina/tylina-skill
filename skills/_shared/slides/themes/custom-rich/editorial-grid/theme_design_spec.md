# Editorial Grid - Theme Design Specification

> **Purpose**: Visual and structural design spec for the editorial-grid Touying theme. Channels the visual language of high-end editorial magazines like Bloomberg Businessweek, Monocle, and The Economist.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | editorial-grid |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Data journalism, research presentations, media briefings, quarterly reports, thought leadership |
| **Style Objective** | General Versatile (editorial) |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

### Complexity Guide

This is a **Rich** theme: design-driven with grid layouts, stat cards, and visual completeness on most slides. 10-20 custom components. 20-100 lines/slide.

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 5.5em, bottom: 1.5em, x: 2em |

## III. Visual Theme

### Design Philosophy

Beauty comes from CONSTRAINT. This theme uses a strict typographic grid, font-role separation (serif display / sans body / mono metadata), and a single accent color system. NO gradients, NO shadows, NO rounded corners. Just precision typography and surgical whitespace. A visible dot-grid pattern sits behind content at 4% opacity, making the mathematical precision of the layout visible.

### Color Scheme

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Ink** | Near-black | `#1A1A1A` | `palette.ink` | Primary text, dark backgrounds |
| **Paper** | Warm off-white | `#FAFAF8` | `palette.paper` | Page background (never pure white) |
| **Accent** | Editorial Red | `#E63946` | `palette.accent` | Single accent color, used sparingly |
| **Gray** | Metadata gray | `#8C8C8C` | `palette.gray` | Metadata, bylines, captions |
| **Rule** | Hairline color | `#D4D4D2` | `palette.rule` | Thin separating lines |
| **Ink Light** | Derived | 40% transparent ink | `palette.ink-light` | Secondary text |
| **Ink Faint** | Derived | 75% transparent ink | `palette.ink-faint` | Borders, subtle rules |
| **Ink Ghost** | Derived | 94% transparent ink | `palette.ink-ghost` | Background ghost elements |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Alert text, focus-slide accents |
| `neutral-lightest` | `palette.paper` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.ink` | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Usage |
| ---- | ---------- | ----- |
| **Primary** | IBM Plex Sans, Noto Sans SC, Arial | Body text, headings |
| **Mono** | IBM Plex Mono, Menlo, DejaVu Sans Mono | Metadata, page numbers, kickers, labels |

### Typography Constants

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 44pt | Cover titles |
| `typo.h1` | 28pt | Main slide titles |
| `typo.h2` | 22pt | Card/section headings |
| `typo.lead` | 16pt | Lead/intro text |
| `typo.body` | 14pt | Body text |
| `typo.small` | 11pt | Captions |
| `typo.kicker-size` | 9pt | Tracked uppercase labels |
| `typo.meta-size` | 8pt | Chrome metadata |

### Inverse Weight Hierarchy

| Size Range | Weight | Usage |
|---|---|---|
| >= 36pt | Light (300) / ExtraLight (200) | Display, hero, section numbers |
| 24-35pt | Light (300) | Slide titles |
| 16-23pt | Light-Regular (300-400) | Subtitles, quotes |
| 12-15pt | Regular-Medium (400-500) | Body |
| 8-11pt | Medium-Semibold (500-600) | Kickers, metadata |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Pure paper with dot-grid at 4% opacity
- **Layout**: Left-aligned title in HUGE (44pt) LIGHT weight
- **Decorative elements**: Small 8x8pt red square (top-left), 60pt red underline, bottom hairline
- **Metadata**: Author in monospace uppercase tracking, date in monospace

### Section Slide (`new-section-slide`)

- **Background**: Paper with dot-grid
- **Layout**: Section NUMBER in enormous light-weight text (140pt, weight extralight) top-right, section TITLE in bold 14pt monospace uppercase
- **Decorative elements**: One thin red horizontal rule across center, bottom hairline
- **Numbering**: `utils.display-current-heading-number(level: 1, numbering: "01")`

### Content Slide (`slide`)

- **Background**: Paper
- **Header**: Title in large LIGHT weight (1.5em), red accent underline (60pt), monospace page number top-right, hairline rule at top
- **Footer**: Three-column grid: footer text | red square (4pt) | page counter (monospace)
- **Content area**: Open with body text

### Focus Slide (`focus-slide`)

- **Background**: Ink (dark, #1A1A1A)
- **Text**: Paper-colored, large, light weight, left-aligned
- **Decorative**: Red accent line at top-left corner

### Ending Slide (`ending-slide`)

- **Background**: Paper with dot-grid
- **Layout**: Centered large light-weight farewell text
- **Decorative**: Red square mark (8x8pt), thin rule below, top/bottom hairlines

### Outline Slide (`outline-slide`)

- **Background**: Paper
- **Layout**: Clean TOC with monospace numbering, light-weight title, red underline

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `hairline` | `hairline(color: palette.rule)` | Separator | Thin 0.3pt line across full width |
| `byline` | `byline(body)` | Attribution | Monospace uppercase tracked text in gray |
| `metric-block` | `metric-block(value, label, accent: palette.ink)` | KPI display | Huge light-weight number + monospace label below |
| `data-card` | `data-card(label, value, description: none)` | Data display | Hairline border, monospace label top, bold number, description |
| `red-callout` | `red-callout(body)` | Emphasis | Left red border 3pt, no fill, just border + text |
| `pull-quote` | `pull-quote(body, cite: none)` | Quotation | Large italic light text + thin left rule + monospace cite |
| `dot-grid-bg` | `dot-grid-bg(color:, dot-opacity:)` | Background pattern | Visible dot-grid at 4% opacity |

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Restraint over spectacle | Every element must earn its place. One accent color only. |
| 2 | Inverse weight hierarchy | Bigger text = lighter weight for editorial elegance |
| 3 | Zero rounded corners | Swiss precision; all rectangles are sharp |
| 4 | Monospace metadata everywhere | Editorial chrome feel from Bloomberg/Monocle |
| 5 | Red used sparingly | Thin lines, small squares -- NEVER large fills |
| 6 | Visible grid | Dot pattern makes mathematical precision tangible |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| Bloomberg Businessweek | Bold data visualization, inverse weight, monospace chrome |
| Monocle Magazine | Precision grid, warm paper tones, tracked uppercase labels |
| The Economist | Single accent red, data-driven, restrained color palette |
| Guizang Magazine theme | Two-tone approach, editorial components |
