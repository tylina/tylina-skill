# Golden Script Theme API Reference

**Tier**: custom-rich
**Touying Version**: 0.7.4
**Entry Function**: `golden-script-theme`
**Fonts**: Caller-selected; the demo uses Helvetica Neue/Arial with DejaVu Sans Mono for raw code (18pt base).

---

## Theme Entry

```typst
#show: golden-script-theme.with(
  aspect-ratio: "16-9",      // "16-9" or "4-3"
  footer: [Course Name],     // Footer text (left side)
  config-info(
    title: [...],
    subtitle: [...],
    author: [...],
    institution: [...],
    date: datetime(...),
  ),
)
```

**Parameters:**
- `aspect-ratio` (string): Slide aspect ratio. Default `"16-9"`.
- `footer` (content | none): Persistent footer text. Default `none`.
- `..args`: Additional Touying config arguments.
- `body` (content): Slide content.

---

## Slide Functions

### `title-slide(..args)`

Full-page title slide with golden frame bookend, spiral background, and centered presentation info. Uses info from `config-info`.

```typst
#title-slide()
```

### `slide(title: auto, ..args)`

Standard content slide with warm white background, golden spiral atmosphere, gold underline header, and QED tombstone footer.

```typst
== Slide Title

Content here...
```

Or with explicit title:
```typst
#slide(title: [Custom Title])[
  Content...
]
```

Supports multi-column layout with `[][]` body syntax.

### `new-section-slide(self: none, body)`

Auto-generated section transition slide. Triggered by `= Section Name` headings. Features Fibonacci grid background, gold accent bar, and axes decoration.

### `focus-slide(body)`

Centered emphasis slide for key quotes or statements. Gold frame border with QED divider.

```typst
#focus-slide[
  Key statement or quote here.
]
```

### `ending-slide(body)`

Final slide with golden frame bookend (shared with title), QED divider, and tombstone.

```typst
#ending-slide[Q.E.D.]
```

---

## Reusable Components

### `theorem-box(title, body, number: none)`

Formal theorem statement with gold left border on light gold background.

```typst
#theorem-box([Pythagorean Theorem], [
  For a right triangle: $a^2 + b^2 = c^2$.
], number: "1.1")
```

**Parameters:**
- `title` (content): Theorem name.
- `body` (content): Statement content.
- `number` (string | none): Optional theorem number.

### `proof-block(body)`

Indented proof with gray left border and automatic Q.E.D. tombstone at end.

```typst
#proof-block[
  By contradiction, assume... Therefore we reach a contradiction.
]
```

**Parameters:**
- `body` (content): Proof text.

### `lemma-card(title, body, number: none)`

Subsidiary result card with indigo/blue left border on light indigo background.

```typst
#lemma-card([Triangle Inequality], [
  $|a + b| <= |a| + |b|$ for all $a, b in RR$.
], number: "2.1")
```

### `corollary-note(title, body)`

Derived result annotation with gold-tinted left border.

```typst
#corollary-note([Bounded implies convergent subsequence], [
  Every bounded sequence in $RR$ has a convergent subsequence.
])
```

### `definition-box(term, body)`

Formal definition with dark indigo left border on warm background.

```typst
#definition-box([Compact Set], [
  A set $K$ is compact if every open cover has a finite subcover.
])
```

### `axiom-tag(content, number: none)`

Small capsule tag for assumptions, axioms, or properties.

```typst
#axiom-tag([Completeness], number: "3")
```

### `qed-divider(width: 80%)`

Decorative horizontal divider with centered QED tombstone symbol.

```typst
#qed-divider(width: 60%)
```

### `proposition-card(title, body, number: none)`

General mathematical claim card with gold left border.

```typst
#proposition-card([Uniqueness of Limits], [
  If $a_n -> L$ and $a_n -> M$, then $L = M$.
], number: "2.3")
```

### `example-box(title, body)`

Worked example with gray left border for solutions and demonstrations.

```typst
#example-box([Convergent Sequence], [
  Show $1/n -> 0$. Given $epsilon > 0$, choose $N > 1/epsilon$...
])
```

### `remark-note(body)`

Side observation or annotation in muted styling.

```typst
#remark-note[
  This result generalizes to metric spaces with minor modifications.
]
```

### `conjecture-card(title, body)`

Open question or hypothesis card with red-orange left border for unproven claims.

```typst
#conjecture-card([Goldbach's Conjecture], [
  Every even integer greater than 2 is the sum of two primes.
])
```

---

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| `bg` | `#FDFCFA` | Page background |
| `bg-warm` | `#F9F7F4` | Warm sections, definitions |
| `text` | `#1B1464` | Primary text (deep indigo) |
| `text-muted` | `#5C5A8A` | Secondary text, remarks |
| `accent-blue` | `#2B4ACB` | Royal blue accents, lemmas |
| `accent-gold` | `#C8910D` | Gold highlights, theorems |
| `gold-light` | `#FDF6E3` | Theorem box background |
| `gold-border` | `#E8C547` | Theorem box border |
| `indigo-light` | `#EDE9FF` | Lemma card background |
| `card-bg` | `#FFFFFF` | General card background |
| `border` | `#E5E3DF` | Subtle borders |
| `proof-gray` | `#6B6B7B` | Proof text, example borders |
| `qed-fill` | `#1B1464` | QED tombstone fill |

---

## SVG Decorations

- **Golden Spiral**: Full-page background with logarithmic spiral at golden ratio proportions
- **Fibonacci Grid**: Proportional rectangles following Fibonacci sequence ratios
- **Golden Frame**: Bookend frame shared between title and ending slides
- **Coordinate Axes**: Decorative mathematical axes for section slides
- **Integral Border**: Vertical integral-curve decoration
- **QED Divider**: Horizontal rule with centered tombstone symbol

---

## Layout Conventions

- Golden-ratio proportional positioning (61.8% / 38.2% splits)
- All components end with `#lazy-v(1fr)` for height equalization
- Content slides have persistent background atmosphere (spiral + markers)
- Footer uses `grid(columns: (1fr, auto, 1fr))` for balanced layout
- Header uses `stack(spacing:)` for title + underline
- Title and ending slides share the golden frame bookend element
