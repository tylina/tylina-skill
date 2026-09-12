# Aqua Desktop Theme — Visual Design Specification

## Theme Identity

| Property | Value |
|----------|-------|
| **Theme Name** | aqua-desktop |
| **Style Objective** | Clean Tech / macOS Desktop |
| **Complexity Level** | Rich |
| **Best For** | Tech presentations, developer tools, software product launches, SaaS demos, programming talks |
| **Inspiration** | macOS Sonoma desktop environment, Aqua UI language, San Francisco typography |

## Design Philosophy

The Aqua Desktop theme recreates the familiar macOS desktop experience within a presentation context. Every element draws from Apple's design language:

- **Window chrome** with traffic light buttons (close/minimize/fullscreen) creates immediate recognition
- **Frosted glass panels** provide depth without visual heaviness
- **Toolbar aesthetics** organize information hierarchically
- **Dock reflections** anchor slides with subtle bottom weight
- **Dot-grid backgrounds** add texture without distraction

The result is a theme that feels native to the tech ecosystem, making it ideal for developer conferences, product demos, and engineering presentations.

## Color Palette

### Primary Colors

| Color | Hex | RGB | Role | Usage Context |
|-------|-----|-----|------|---------------|
| Window BG | `#F5F5F7` | 245, 245, 247 | Main background | Slide backgrounds, page fill |
| Toolbar | `#E8E8ED` | 232, 232, 237 | Toolbar/header fill | Card headers, toolbar bars |
| Active Blue | `#007AFF` | 0, 122, 255 | Primary accent | Links, primary buttons, highlights |
| Purple | `#AF52DE` | 175, 82, 222 | Secondary accent | Alternate highlights, badges |

### Text Colors

| Color | Hex | RGB | Role | Usage Context |
|-------|-----|-----|------|---------------|
| Dark Text | `#1D1D1F` | 29, 29, 31 | Heading text | All headings, titles |
| Body Text | `#424245` | 66, 66, 69 | Body copy | Paragraphs, descriptions |

### Surface Colors

| Color | Hex | RGB | Role | Usage Context |
|-------|-----|-----|------|---------------|
| Card BG | `#FFFFFF` | 255, 255, 255 | Card/window background | Content areas within windows |
| Border | `#D2D2D7` | 210, 210, 215 | Window/card borders | All strokes, separators |
| Sidebar | `#F0F0F5` | 240, 240, 245 | Sidebar panel fill | Sidebar items, metric panels |

### Semantic Colors (Traffic Lights)

| Color | Hex | RGB | Role | Usage Context |
|-------|-----|-----|------|---------------|
| Traffic Red | `#FF5F57` | 255, 95, 87 | Close button | Window chrome, error states |
| Traffic Yellow | `#FFBD2E` | 255, 189, 46 | Minimize button | Window chrome, warning states |
| Traffic Green | `#28C840` | 40, 200, 64 | Fullscreen button | Window chrome, success states |

## Typography

### Type Scale

| Level | Size | Weight | Color | Usage |
|-------|------|--------|-------|-------|
| Display | 2.4em | Semibold | text-dark | Title slide heading |
| H1 | 2.0em | Semibold | text-dark | Section titles |
| H2 | 1.3em | Semibold | text-dark | Slide titles |
| Body | 1.0em (20pt) | Regular | body-text | Main content |
| Small | 0.82em | Regular | body-text | Card content |
| Caption | 0.72em | Medium | body-text | Labels, tags |
| Micro | 0.6em | Regular | body-text | Footer text |

### Font Stack

- Primary: Helvetica Neue (macOS system font)
- Fallback 1: Arial (widely installed sans-serif)
- Fallback 2: Arial Unicode MS (broad script coverage)
- Monospace: System default (for code windows)

## SVG Decorations

### 1. Dot Grid Pattern (Background Atmosphere)

- **Purpose**: Persistent subtle background texture on all content slides
- **Appearance**: Evenly spaced dots in a grid pattern
- **Properties**: 24px spacing, 0.8px radius dots, border color at 50% opacity
- **Edge treatment**: Gradient fade at all four edges for soft boundary

### 2. Frosted Glass Panel

- **Purpose**: Large translucent panel for title/ending slides
- **Appearance**: White semi-transparent rectangle with subtle horizontal lines
- **Properties**: 92% to 85% opacity gradient, rounded corners (10px), shadow layer
- **Details**: Refraction light streaks, inner highlight stroke

### 3. Dock Reflection Bar

- **Purpose**: Bottom anchoring element mimicking macOS Dock
- **Appearance**: Subtle gradient bar with shine highlight and app icon hints
- **Properties**: 3px main bar, centered shine, divider marks
- **Details**: Small rounded-rect app icon placeholders in muted colors

### 4. Toolbar Texture

- **Purpose**: Header element for toolbar-style presentation
- **Appearance**: Gradient toolbar with subtle horizontal striping
- **Properties**: Top-to-bottom gradient from sidebar to toolbar color
- **Details**: Segmented control outlines, traffic light buttons, bottom border

### 5. Window Chrome Frame

- **Purpose**: macOS window decoration for bookend slides
- **Appearance**: Full window with title bar, traffic lights, and content area
- **Properties**: 10px border radius, title bar gradient, drop shadow
- **Details**: Traffic light buttons with subtle stroke, center title placeholder

## Slide Type Specifications

### Title Slide

- **Background**: Apple gray (`#F5F5F7`) with dot grid overlay
- **Central element**: Window chrome frame (88% width/height)
- **Content**: Title (2.4em bold), blue accent bar, subtitle, author, institution, date
- **Bottom**: Dock reflection bar
- **Bookend**: Shares window chrome + dock with ending slide

### Content Slide (slide)

- **Background**: Apple gray with dot grid atmosphere
- **Header**: Traffic lights (red/yellow/green dots) + title text + border underline
- **Footer**: Footer text | blue dot | page counter
- **Bottom decoration**: Dock reflection (via atmosphere)
- **Margins**: Top 4em, bottom 2em, sides 2em

### New Section Slide

- **Left sidebar**: 25% width, sidebar fill color, right border
- **Sidebar content**: Large section number (4em, blue, transparent)
- **Main area**: Traffic lights, section title (2em bold), blue accent bar
- **Bottom**: Dock reflection bar

### Outline Slide

- **Header**: Traffic lights + "Contents" title
- **Separator**: Full-width border line
- **Content**: Auto-generated outline (depth: 1)
- **Background**: Dot grid atmosphere

### Focus Slide

- **Background**: System Blue (`#007AFF`) full bleed
- **Top accent**: Three white semi-transparent dots (traffic light reference)
- **Content**: White bold text (1.6em), centered
- **Bottom accent**: White semi-transparent bar
- **Overflow protection**: Content wrapped in `block(width: 100%, inset: (x: 1em))`

### Ending Slide

- **Background**: Apple gray with dot grid (matches title slide)
- **Central element**: Window chrome frame (matches title slide)
- **Content**: Blue accent bar, title text (2.4em bold), purple accent bar
- **Bottom**: Dock reflection bar (matches title slide)

## Component Design Details

### Window Card

- **Border radius**: 8pt
- **Title bar**: Toolbar fill, traffic lights (5pt radius), title text
- **Content area**: White fill, 14pt inset
- **Stroke**: 0.5pt border color
- **Clip**: true (for rounded corners)

### Toolbar Box

- **Border radius**: 8pt
- **Header**: Toolbar fill with pill-shaped title badge
- **Pill**: Accent-tinted background, accent stroke, semibold text
- **Content area**: White fill, 14pt horizontal / 12pt vertical inset

### Notification Card

- **Border radius**: 10pt
- **Left accent**: 3pt accent-colored border
- **Icon**: 24pt rounded square with first letter
- **Layout**: Horizontal stack (icon + text block)

### Metric Panel

- **Background**: Sidebar fill
- **Bottom accent**: 2pt accent-colored border
- **Value**: 1.8em bold in accent color
- **Label**: 0.72em medium uppercase

### Code Window

- **Title bar**: Dark (`#2D2D2D`) with traffic lights
- **Content area**: Dark (`#1E1E1E`) with light text
- **Text**: 0.75em monospace-style content

### Tag Pill

- **Shape**: Capsule (10pt radius)
- **Content**: Colored dot (3pt) + text
- **Background**: Accent at 88% lightened
- **Inline use**: Designed for inline/horizontal layouts

### Sidebar Item

- **Background**: Sidebar fill
- **Indicator**: 4pt colored dot
- **Body**: Indented 16pt from left
- **Border radius**: 6pt

### Dropdown Card

- **Header**: Chevron symbol + bold title
- **Separator**: 0.5pt border line
- **Background**: Card white
- **Border radius**: 6pt

### Progress Bar

- **Track**: 6pt tall, toolbar fill, 3pt radius
- **Fill**: Accent-colored, caller-supplied percentage matching the displayed value
- **Label**: Left-aligned label + right-aligned value

### Dock Divider

- **Structure**: Horizontal line — vertical bar — horizontal line
- **Bar**: 2pt wide, 16pt tall, border color
- **Lines**: 0.5pt, border color
- **Purpose**: Section separator within slides

## Layout Grid

- **Page**: 16:9 aspect ratio (default)
- **Margins**: Top 4em, Bottom 2em, Sides 2em
- **Column gutter**: 1.2em (standard), 0.8em (tight/metrics)
- **Card spacing**: 0.5-0.6em vertical gap between components
- **Maximum content width**: ~96% of available width

## Interaction Between Elements

### Visual Hierarchy (top to bottom)

1. Traffic light dots (immediate recognition anchor)
2. Title text (primary information)
3. Accent bars/lines (visual separator)
4. Card components (content containers)
5. Dock reflection (bottom anchor/ground)

### Depth Layers

1. **Background**: Apple gray + dot grid (furthest back)
2. **Panels/Sidebar**: Sidebar fill surfaces
3. **Cards**: White card surfaces with border
4. **Chrome**: Toolbar fills, title bars
5. **Content**: Text and interactive elements (frontmost)

## Accessibility Notes

- All text colors maintain WCAG AA contrast ratio against their backgrounds
- Traffic lights are decorative only (not relied upon for information)
- Card backgrounds are fully opaque for readability
- Focus slide uses white on blue with sufficient contrast
- Border colors provide clear spatial boundaries
