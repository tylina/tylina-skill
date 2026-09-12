# Ukiyo-Wave Theme Design Specification

## Overview

**Theme Name**: ukiyo-wave
**Complexity Level**: Canvas
**Visual Metaphor**: Japanese ukiyo-e woodblock print — specifically the Great Wave style by Hokusai. Bold flowing curves, flat color areas, dramatic wave patterns, strong asymmetry.
**Category**: custom-canvas

## Color Palette

### Primary Preset: Indigo

| Role | Hex | Description |
|------|-----|-------------|
| Background | `#1A2332` | Deep indigo night |
| Ink (text) | `#F5F0E3` | Washi paper cream |
| Accent | `#D4493F` | Vermillion/torii red |
| Accent text | `#F77367` | Contrast-safe vermillion for small text |
| Secondary | `#4A90A4` | Wave blue-grey |
| Secondary text | `#6DB7C8` | Contrast-safe wave blue for small text |
| Surface | `#243447` | Lighter indigo for cards |

### Preset: Sunrise

| Role | Hex | Description |
|------|-----|-------------|
| Background | `#2A1A10` | Warm dark umber |
| Ink | `#FFF8E7` | Warm cream |
| Accent | `#E8682A` | Orange sunrise |
| Accent text | `#FF9159` | Contrast-safe orange for small text |
| Secondary | `#C9A961` | Gold |
| Secondary text | `#C9A961` | Gold already meets text contrast |
| Surface | `#3D2B1A` | Warm dark brown |

### Preset: Storm

| Role | Hex | Description |
|------|-----|-------------|
| Background | `#0F1A24` | Near-black blue |
| Ink | `#E0E8F0` | Cool silver-white |
| Accent | `#8B3A3A` | Dark oxblood red |
| Accent text | `#E27E7E` | Contrast-safe oxblood tint for small text |
| Secondary | `#3A6B7A` | Storm teal |
| Secondary text | `#6FA6B4` | Contrast-safe storm teal for small text |
| Surface | `#1A2A3A` | Dark navy |

## Typography

| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| Display | 42pt | Bold | Cover title |
| H1 | 28pt | Bold | Section headings |
| H2 | 22pt | Semibold | Slide titles |
| Body | 16pt | Regular | Content text |
| Small | 12pt | Regular/Medium | Labels, captions |
| Tiny | 9pt | Medium | Metadata, tags |
| Meta | 7.5pt | Regular | Footer, tracking |

**Demo/project fonts**: IBM Plex Sans / Hiragino Sans GB. The template is font-agnostic; tracked uppercase styling distinguishes labels, tags, and metadata without hard-coding a family.

## SVG Decorations

| Element | Description | Elements | Usage |
|---------|-------------|----------|-------|
| Great Wave | Bold curved crest with foam circles | ~15 paths/circles | Title, focus, dark slides |
| Kumo Cloud | Scalloped Japanese cloud pattern | 2 path elements | Title, dark slide backgrounds |
| Torii Gate | Geometric gate silhouette | 4 rects + 1 path | Section markers, dividers |
| Wave Foam | Scattered dots along curved baseline | 1 path + 11 circles | Slide backgrounds, section slides |
| Mount Fuji | Triangular mountain with snow cap | 2 paths + 1 fill | Ending slide |

## Layout Principles

1. **Flat color blocking** — no gradients, bold solid fills with opacity variation
2. **Strong asymmetry** — wave on one side, content on the other
3. **Dramatic scale contrast** — tiny foam dots (2-4pt) vs. massive wave (300-420pt)
4. **Japanese whitespace (ma)** — generous breathing room in compositions
5. **Title slides feel like woodblock prints** — layered composition with decorative elements

## Component Inventory

| Component | Purpose | Signature Visual |
|-----------|---------|-----------------|
| `wave-card` | General content card | Left accent border, surface fill |
| `edo-stat` | Large metric display | One centered value-label-rule-description stack |
| `torii-divider` | Section divider | Horizontal lines with centered torii icon |
| `ukiyo-tag` | Category/label tag | Pill shape, secondary color |
| `scroll-quote` | Quotation block | Left border, italic text, citation |
| `woodblock-panel` | Titled panel (header+body) | Accent-filled header bar, flat join |
| `ukiyo-data-table` | Data table | Native table, tracked headers, secondary accents |
| `wave-progress` | Progress indicator | Flat bar with foam dot marker |
| `kamon-icon` | Circular crest icon | Double circle border with centered text |
| `hanko-seal` | Stamp/seal mark | Small vermillion square |

## Slide Types

| Type | Background | Decoration | Usage |
|------|-----------|------------|-------|
| `title-slide` | Deep bg | Great wave (right), kumo clouds (left), frame | Opening |
| `new-section-slide` | Deep bg | Torii gate (right), wave foam (bottom), ghost number | Section breaks |
| `slide` | Standard bg | Wave foam (bottom-right), foam dots (top) | Content |
| `dark-slide` | Surface-dark | Rendered title, great wave (bottom-left), kumo cloud (top-right) | Emphasis |
| `focus-slide` | Surface-dark | Wave crest (top-right), corner accents | Key quotes |
| `ending-slide` | Deep bg | Fuji silhouette, wave foam, ghost text | Closing |
| `outline-slide` | Deep bg | Torii (top-right), wave foam (bottom) | Table of contents |
