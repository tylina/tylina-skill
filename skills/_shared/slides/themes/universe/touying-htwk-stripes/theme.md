# HTWK Stripes

**Type**: Institutional Theme
**Package**: `@preview/touying-htwk-stripes:1.0.1`
**Touying version**: 0.7.4 (owned by the Universe package)
**Minimum Typst version**: 0.14.0
**Entry function**: `htwk-stripes-theme`
**Style**: Institutional, German, Academic
**Primary color**: HTWK Blue (`#009ee3`)
**Institution**: Hochschule für Technik, Wirtschaft und Kultur Leipzig (HTWK Leipzig)
**Best For**: HTWK Leipzig
**Style Objective**: Academic
**Complexity Level**: Plain

> For full documentation, see the [package README](https://typst.app/universe/package/touying-htwk-stripes).

## Description

An unofficial presentation theme inspired by the official presentation template of **HTWK Leipzig** (Leipzig University of Applied Sciences), a German university of applied sciences. The theme features a distinctive striped visual motif in HTWK's corporate blue, a header navigation bar showing section progress, dual logo slots for institution and faculty branding, and German-default formatting for dates and navigation labels. While designed for HTWK affiliates, it is suitable for any German-language academic or technical presentation.

## Quick Start

```typst
#import "@preview/touying-htwk-stripes:1.0.1": *

#show: htwk-stripes-theme.with(
  aspect-ratio: "4-3",
  title: [Maschinelles Lernen in der Praxis],
  subtitle: [Anwendungen und Herausforderungen],
  authors: ("Prof. Dr. Maria Weber", "Dr. Thomas Richter"),
  authors-title-slide: [Prof. Dr. Maria Weber \ Dr. Thomas Richter],
  date: datetime.today(),
  institution: [HTWK Leipzig],
)

#htwk-title-slide()

#htwk-outline(title: "Inhalt")

= Einleitung

== Motivation

Maschinelles Lernen verändert die Ingenieurwissenschaften grundlegend.

- Automatisierte Qualitätskontrolle
- Prädiktive Wartung
- Optimierung von Fertigungsprozessen

#htwk-sources()[
  #bibliography(title: none, "sources.bib")
]
```

## Theme Parameters

### `htwk-stripes-theme` Function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `string/content` | `""` | Presentation title; shown on title slide and in footer |
| `subtitle` | `string/content` | `""` | Subtitle; footer shows `title - subtitle` if set |
| `authors` | `array` | `()` | List of author names; joined with `,` in non-title slide footers |
| `authors-title-slide` | `content` | `[]` | Author content displayed on the title slide (allows custom formatting) |
| `custom-date` | `bool` | `false` | If `false`, date is formatted as German datetime; if `true`, treated as raw content |
| `date` | `datetime/content` | `datetime.today()` | Date shown on title slide and footer; uses German month names by default |
| `institution` | `string/content` | `""` | Institution name displayed on the title slide |
| `aspect-ratio` | `string` | `"4-3"` | Slide aspect ratio (`"4-3"` or `"16-9"`) |
| `font` | `string` | `"Libertinus Serif"` | Font for all slide content, titles, and navigation |
| `primary-color` | `color` | `rgb("#009ee3")` | Colour for stripes, bullet points, bold text, and level-3 headings |
| `text-color-dark` | `color` | `rgb("#000000")` | Colour for titles, authors, institution, and body text |
| `logo-institution` | `content` | `none` | Institution logo: upper-left on title slide, lower-right on content slides |
| `logo-faculty` | `content` | `none` | Faculty logo: upper-right corner of the title slide only |
| `sources-title` | `string` | `"Quellen"` | Title for bibliography slide; slides with this title are excluded from navigation |

## Available Slide Types

### `#htwk-title-slide()`

The title/cover slide displaying the presentation title, subtitle, author(s), date, institution, and both logo slots (institution and faculty). Takes no parameters — all content is drawn from the theme configuration.

### `= Section Title` (Section Heading)

Level-1 headings (`=`) create **sections** that appear in the header navigation bar. The navigation bar highlights the current section, providing visual progress tracking throughout the presentation.

### `== Slide Title` (Content Slide)

Level-2 headings (`==`) create standard **content slides** within a section. Features include:
- Header navigation bar with section indicators
- Striped decorative motif using the primary colour
- Bullet points rendered in the primary colour
- Bold text highlighted in the primary colour
- Footer showing title (with subtitle) and comma-separated authors

### `#htwk-outline(title: "Inhalt")`

A table-of-contents slide showing an outline of the presentation. This slide is **excluded from the header navigation bar** automatically.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `string` | `"Inhalt"` | Title of the outline slide |

### `#htwk-sources(title: "Quellen")[body]`

A bibliography slide for listing references. This slide is **excluded from the header navigation bar** based on the `sources-title` parameter.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `string` | `"Quellen"` | Title of the bibliography slide |

The body content typically contains a `#bibliography(title: none, "sources.bib")` call.

## Color Scheme

| Role | Color | Hex |
|------|-------|-----|
| Primary (stripes, bullets, bold, headings) | HTWK Blue | `#009ee3` |
| Text (titles, authors, body) | Black | `#000000` |

The primary colour can be customised to match different faculties or departments within HTWK.

## Branding Features

- **Dual logo system**: `logo-institution` (institution-level) and `logo-faculty` (faculty-level) appear on the title slide; the institution logo also appears on content slides
- **Striped visual motif**: Distinctive striped decoration inspired by the official HTWK Leipzig template
- **Header navigation bar**: Section-aware progress indicator; bibliography and outline slides are automatically excluded
- **Footer**: Shows the title (with optional subtitle) and comma-separated author list
- **German defaults**: Date formatting uses German month names (e.g., "15. März 2025"), outline defaults to "Inhalt", bibliography to "Quellen"

## German Localisation

The theme defaults to German conventions throughout:

| Element | German Default | English Alternative |
|---------|----------------|---------------------|
| Outline title | `"Inhalt"` | `"Outline"` or `"Contents"` |
| Bibliography title | `"Quellen"` | `"References"` or `"Bibliography"` |
| Date format | `dd. Monat yyyy` | Set `custom-date: true` for custom format |

To use in English, set `custom-date: true` and override the title strings:

```typst
#htwk-outline(title: "Outline")
#htwk-sources(title: "References")[...]
```

## Tips

- The `authors` array is used for the footer, while `authors-title-slide` allows richer formatting (line breaks, affiliations) on the title slide
- Split dense content explicitly; the package owns its Touying configuration and
  does not expose `config-common` to callers.
- Set `logo-institution` and `logo-faculty` to `image("path.png")` for institutional branding
- The `sources-title` parameter in the theme function controls which slide title is matched for navigation exclusion — ensure it matches your `#htwk-sources(title: ...)` value

## Universe Link

[touying-htwk-stripes on Typst Universe](https://typst.app/universe/package/touying-htwk-stripes)
