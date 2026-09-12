# Shuimu Touying

**Type**: Universe (Typst package)
**Package**: `@preview/shuimu-touying:0.4.1`
**Touying version**: 0.7.4 (owned by the Universe package)
**Minimum Typst version**: 0.12.0
**Entry function**: `shuimu-touying-theme`
**Style**: Academic, institutional, Beamer-style
**Primary colors**: Tsinghua University purple palette (`#660874` primary, `#320439` dark)
**Author**: Mason Chen (JSB-Unscarred)
**License**: MIT
**Repository**: https://github.com/JSB-Unscarred/shuimu-touying
**Best For**: Tsinghua University
**Style Objective**: Academic
**Complexity Level**: Plain

## Description

Shuimu Touying is a clean, Beamer-style presentation theme designed for Tsinghua University (清华大学). Built as a secondary development on Touying's Stargazer theme, it draws visual inspiration from the thubeamer LaTeX template. The theme features a distinctive Tsinghua purple color scheme (derived from the university's official Visual Identity System), a mini-frames navigation bar with section dots at the top of every slide, a slide title bar below the navigation, a four-segment footer (reporter, author, title, page counter), themed content blocks (`titled-block`) with gradient dividers, numbered outline slides with circled section indices, and Chinese-first metadata fields including `reporter` (报告人) and `supervisor` (导师) on the title page.

The name "Shuimu" (水木) references "水木清华" (Shuimu Tsinghua), a classical phrase associated with the university.

## Quick Start

```typst
#import "@preview/shuimu-touying:0.4.1": *

#show: shuimu-touying-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [报告主标题],
    subtitle: [报告副标题],
    reporter: [*报告人姓名*],
    author: [*Author Name*],
    supervisor: [*导师姓名*],
    date: datetime.today(),
    institution: [清华大学社科学院经济学研究所],
  ),
)

#title-slide()

#outline-slide()

= First Section

== First Slide

Your content here.
```

## Theme Parameters (`shuimu-touying-theme`)

The entry function `shuimu-touying-theme` accepts the following top-level parameters:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (e.g. `"16-9"`, `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for slide content |
| `display-section-slides` | bool | `false` | Whether to auto-generate a section title slide when a new `= Section` heading is encountered |
| `header-title` | function or content | *(current heading)* | Slide title content shown in the title bar; defaults to `utils.display-current-heading(depth: self.slide-level)` |
| `footer-reporter` | function or content | reporter, then author | Left-most footer cell content (15% width) |
| `footer-author` | function or content | `self => self.info.author` | Second footer cell content (15% width) |
| `footer-deck-title` | function or content | title or short title | Third footer cell content (fills remaining space) |
| `footer-slide-counter` | function or content | `"N / M"` | Right-most footer cell (5em width) |

### `config-info` Fields

Metadata passed to `config-info(...)`:

| Field | Type | Default | Description |
|---|---|---|---|
| `title` | content | `none` | Presentation title (报告主标题) |
| `subtitle` | content | `none` | Presentation subtitle (报告副标题) |
| `author` | content or array | `none` | Author name(s) (作者); shown in `footer-author` and on the title slide with prefix "作者：" |
| `reporter` | content or array | `none` | Reporter/presenter name(s) (报告人); shown in `footer-reporter` and on the title slide with prefix "报告人：" |
| `supervisor` | content or array | `none` | Supervisor/advisor name(s) (导师); shown on title slide with prefix "导师：" |
| `date` | content or datetime | `none` | Date; displayed on title slide |
| `institution` | content | `none` | Institution name (机构); displayed on title slide below person list |
| `short-title` | content or auto | `auto` | Short title for the footer; when `auto`, uses the full `title` |

Note: `author`, `reporter`, and `supervisor` each accept either a single content value or an array of up to 3 names, which are rendered in a horizontal grid on the title slide.

### Page Layout

The theme uses the following fixed page layout:

| Setting | Value |
|---|---|
| Paper | `"presentation-{aspect-ratio}"` |
| Top margin | `4.5em` (accommodates navigation bar + title bar) |
| Bottom margin | `2.5em` (accommodates footer) |
| Horizontal margin | `2.5em` |
| Header ascent | `0em` |
| Footer descent | `0em` |

## Available Slide Types

### Title Slide — `#title-slide()`

Creates the presentation cover page with a centered purple title block, person list (reporter, author, supervisor with Chinese prefixes), institution, and date.

```typst
#title-slide()

// Override metadata from config-info
#title-slide(
  title: [Custom Title],
  subtitle: [Custom Subtitle],
  reporter: [*陈海翔*],
  author: [*CHEN MASON*],
  supervisor: [*蔡继明*],
  institution: [清华大学],
  date: datetime.today(),
)
```

The title slide renders:
1. A rounded purple (`primary`) block with the title and subtitle in white bold text
2. Person entries below the block, each row showing a Chinese prefix and names in a grid (up to 3 per row)
3. Institution in smaller text
4. Formatted date in smaller text

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `title` | content | *(from config-info)* | Title text; overrides config-info title |
| `subtitle` | content | *(from config-info)* | Subtitle text; overrides config-info subtitle |
| `author` | content or array | *(from config-info)* | Author name(s) |
| `reporter` | content or array | *(from config-info)* | Reporter/presenter name(s) |
| `supervisor` | content or array | *(from config-info)* | Supervisor/advisor name(s) |
| `institution` | content | *(from config-info)* | Institution name |
| `date` | content or datetime | *(from config-info)* | Date |

### Content Slide — `== Heading` or `#slide[...]`

Standard content slides are created with level-2 headings. Level-1 headings (`=`) define sections for the navigation bar. Each content slide shows:
- The mini-frames navigation bar at the top with section titles and dot indicators
- A purple title bar with the slide title in white bold text
- The slide body content below

```typst
= Section Title

== Slide Title

Content with *bold* and _emphasis_.

- Bullet points use themed knob markers in the primary color
- Sub-items are supported
```

For explicit multi-column layouts, use `#slide[...][...]`:

```typst
#slide[
  Left column content.
][
  Right column content.
]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | auto or content | `auto` | Slide title; defaults to current heading |
| `header` | auto or content | `auto` | Custom header; overrides the default title bar |
| `footer` | auto or content | `auto` | Custom footer; overrides the default footer |
| `align` | auto or alignment | `auto` | Content alignment; overrides the global `align` |
| `config` | dictionary | `(:)` | Configuration overrides |
| `repeat` | auto | `auto` | Repeat behavior for animations |
| `setting` | function | `body => body` | Wrapper function applied to slide body |
| `composer` | auto | `auto` | Column layout specification (e.g. `(1fr, 2fr)`) |

### Outline Slide — `#outline-slide()`

Displays a styled table of contents with numbered circles for each section. Sections are rendered as a vertical stack with a primary-colored circle containing the section number, followed by the section title as a clickable link.

```typst
#outline-slide()

// With custom title
#outline-slide(title: [Table of Contents])
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `title` | content | *(i18n "Outline")* | Slide title; defaults to localized outline title (e.g. "目录" in Chinese) |

### New Section Slide — `#new-section-slide()`

A full-screen section divider slide showing the section title in large primary-colored bold text, centered both horizontally and vertically. This slide is auto-generated when `display-section-slides: true` is set in the theme parameters.

```typst
// Manual usage
#new-section-slide(title: [Research Methods])

// Or enable auto-generation for all sections:
#show: shuimu-touying-theme.with(
  display-section-slides: true,
  // ...
)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `title` | auto or content | `auto` | Section title; defaults to current level-1 heading |

When `title` is `auto`, the slide displays `utils.display-current-heading(level: 1)`. The text is rendered at `2.5em` size in the primary color with black weight.

### Focus Slide — `#focus-slide[...]`

Full-screen emphasis slide with a solid primary-colored background and large white bold text. The slide counter is frozen (does not increment) and the slide is excluded from the navigation bar dots.

```typst
#focus-slide[
  Thank you!
]

// With custom alignment
#focus-slide(align: top + left)[
  Key Takeaway
]
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `config` | dictionary | `(:)` | Configuration overrides |
| `align` | alignment | `horizon + center` | Content alignment within the slide |

The focus slide:
- Fills the entire page with the `primary` color (`#660874`)
- Removes header and footer
- Sets text to `neutral-lightest` (white), bold, `1.5em`
- Freezes the slide counter
- Injects a `<touying-skip-dot>` label to exclude itself from the mini-frames navigation dots
- Uses `2em` margin on all sides

## Reusable Components

### Themed Block — `#titled-block()`

A styled content block with a primary-colored title bar, a gradient divider line, and a light-tinted content area. Useful for theorems, definitions, formulas, and callouts.

```typst
#titled-block(
  title: [Euler's Identity],
  [$ e^(pi i) + 1 = 0 $]
)

#titled-block(
  title: [Definition],
  [A *group* is a set $G$ with a binary operation satisfying closure, associativity, identity, and invertibility.]
)
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `title` | content | `none` | Block title displayed in the colored header bar |

The block renders three stacked elements:
1. **Title bar**: Primary color background, white bold text, rounded top corners (6pt radius)
2. **Gradient divider**: 4pt-tall horizontal gradient from `primary` to `primary.lighten(90%)` (left to right)
3. **Content area**: `primary.lighten(90%)` background, rounded bottom corners (6pt radius)

### Mini-Frames Navigation Bar

The navigation bar is automatically rendered at the top of every content slide. It displays all level-1 sections with their titles and dot indicators for each physical page within that section.

Features:
- Section titles are rendered as clickable links
- Each page within a section is represented by a small circle (2.5pt radius)
- The current page's dot is filled; other dots are outlined only
- The active section (containing the current page) is displayed in full white; inactive sections are shown at 40% opacity
- Focus slides are automatically excluded from the dot count via the `<touying-skip-dot>` label
- Background color: `primary-dark` (`#320439`)
- Text size: `0.7em`

### Footer

The footer is a four-column grid at the bottom of every content slide:

| Cell | Width | Default Content | Description |
|---|---|---|---|
| `footer-reporter` | 15% | Reporter name | Left-most cell |
| `footer-author` | 15% | Author name | Second cell |
| `footer-deck-title` | `1fr` (fill) | Title or short-title | Title cell |
| `footer-slide-counter` | `5em` | `"N / M"` | Slide counter |

All cells have a `primary` color background with white text at `0.5em` size and `1.5em` height. Cells with `none` content collapse to `0pt` width.

### Alert Text

The theme provides `utils.alert-with-primary-color` as the alert method:

```typst
#alert[Important text highlighted in the primary color]
```

### List Markers

Bullet lists use `components.knob-marker(primary: self.colors.primary)` — a themed circular marker in the primary purple color.

## Color Scheme

The theme uses a minimal, institutional color palette derived from Tsinghua University's official Visual Identity System (清华大学视觉形象识别系统):

| Color Token | Hex Value | Usage |
|---|---|---|
| `primary` | `#660874` | Title bars, navigation bar, footer, focus slide background, titled-block headers, list markers, link color, heading color |
| `primary-dark` | `#320439` | Navigation bar background |
| `neutral-lightest` | `#ffffff` | Text on colored backgrounds (nav bar, title bar, footer, focus slides, titled-block titles) |
| `neutral-darkest` | `#000000` | Default body text |

The `primary` color `#660874` is specifically calculated from the Tsinghua University visual identity parameters published at https://vi.tsinghua.edu.cn/gk/xxbz/scgf.htm.

### Derived Colors (used internally)

| Color | Derivation | Usage |
|---|---|---|
| `primary.lighten(90%)` | Very light purple tint | titled-block content area background, gradient divider endpoint |
| `section-color.transparentize(60%)` | Semi-transparent white | Inactive section titles and dots in navigation bar |

## Font Configuration

Default font stack: `("Linux Libertine", "Palatino", "Noto Serif CJK SC", "Songti SC")`

- **Linux Libertine**: Primary English serif font
- **Palatino**: English fallback
- **Noto Serif CJK SC**: Primary Chinese font (Simplified Chinese)
- **Songti SC**: Chinese fallback (macOS Song Ti)

Both English and Chinese fonts must be installed locally for proper rendering. Default text size is `20pt`.

### Text Styling

| Element | Style |
|---|---|
| Body text | `20pt`, font stack above |
| Headings | Primary color, black weight |
| Figure captions | `0.6em` |
| Footnote entries | `0.6em` |
| Links (URL) | Primary color |
| Superscripts | Non-typographic (prevents font conflicts) |
| Table captions | Positioned at top for `table` kind figures |

## Tips and Patterns

- Use `#pause` for incremental reveal within slides
- Use `#titled-block(title: [...])` for theorems, definitions, and highlighted content blocks
- Set `display-section-slides: true` to auto-generate section dividers when using `= Section` headings
- The `reporter` field is unique to this theme — use it to distinguish the presenter from the author(s)
- The `supervisor` field is designed for academic contexts (thesis defense, research presentations)
- Use `#set math.equation(numbering: "(1)")` to enable equation numbering; use `#math.equation(block: true, numbering: none)[...]` to selectively disable numbering for individual equations
- Use `#set align(top)` before bibliography sections for proper top-aligned rendering
- Footer cells with `none` content collapse automatically — set `footer-reporter: self => none` to hide the reporter cell
- Focus slides do not increment the slide counter and are excluded from navigation dots
- The outline slide uses `_get-sections()` internally, which introspects all level-1 headings and excludes pages marked with `<touying-skip-dot>`

## Universe Link

[shuimu-touying on Typst Universe](https://typst.app/universe/package/shuimu-touying)
[Source on GitHub](https://github.com/JSB-Unscarred/shuimu-touying)
