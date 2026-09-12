# Quantum Dot Theme — Design Specification

## Concept

The Quantum Dot theme draws visual inspiration from quantum computing circuits, orbital mechanics, and physics textbook diagrams. It combines the precision of IBM Quantum's design language with the abstract elegance of Bloch sphere visualizations and quantum circuit notation.

The theme presents a futuristic, scientifically rigorous aesthetic on **light backgrounds** — making it readable and professional while maintaining visual distinctiveness through subtle quantum-inspired decorative elements.

**Theme Name Rationale**: "Quantum Dot" references the semiconductor nanostructure used in quantum computing research, but is abstract enough to not pigeonhole the theme into only quantum computing presentations.

---

## Visual Identity

### Color Philosophy

The palette is built around the contrast between deep navy/indigo text and electric violet/cyan accents — evoking the color language of quantum state diagrams, where different qubit states are traditionally represented in complementary hues.

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Cool white/lavender | `#F8F7FC` | Light, clean, subtly warm-toned to distinguish from pure white |
| Primary text | Deep navy/indigo | `#1E1B4B` | Maximum readability, scientific authority |
| Primary accent | Electric violet | `#7C3AED` | Quantum state |0> color, energetic, modern |
| Secondary accent | Cyan | `#06B6D4` | Quantum state |1> color, complementary to violet |
| Secondary text ink | Deep cyan | `#087C8C` | Contrast-safe companion for cyan text on light surfaces |
| Soft accent | Light purple | `#A78BFA` | Probability clouds, superposition states |
| Strong emphasis | Deep indigo | `#4338CA` | Entanglement connections, depth |
| Light fills | Very light violet | `#EDE9FE` | Card backgrounds, subtle separation |
| Light fills alt | Very light cyan | `#ECFEFF` | Alternative card backgrounds |
| Borders | Violet border | `#C4B5FD` | Consistent with primary palette |

### Typography

- **Theme boundary**: `template.typ` sets size and color only; document authors choose fonts
- **Demo body**: Avenir Next at 18pt — clean, highly readable sans-serif
- **Demo fallback**: Arial Unicode MS for broad script coverage
- **Demo code**: Menlo — installed monospace suited to the technical context
- **Headings**: Bold weight at 1.3em scale
- **Title slides**: 2.4em bold for maximum impact

### Spacing System

- Page margins: top 3.5em, bottom 2em, sides 2.2em
- Card internal padding: 0.8-1.2em horizontal, 0.6-0.9em vertical
- Grid gutters: 0.8-1.2em between columns
- Stack spacing: 4-8pt between elements

---

## SVG Design Elements

### 1. Quantum Circuit Background (Full-page)

**Purpose**: Creates the persistent "laboratory" atmosphere on every content slide.

**Design**: Five horizontal quantum wire lines spanning the full page width at regular vertical intervals (80px spacing). Small gate-box rectangles (20x20px) placed at various positions along the wires. Vertical dashed CNOT connection lines between select wires. Small filled circles mark qubit positions.

**Opacity range**: 0.08-0.20 — subtle enough to not compete with content, visible enough to establish atmosphere.

### 2. Orbital Probability Cloud (Full-page overlay)

**Purpose**: Adds organic, wave-function-inspired texture to corners.

**Design**: Two clusters of concentric ellipses (top-right and bottom-left) with decreasing size and increasing opacity toward center. Represents electron orbital probability distributions. Central dots mark nuclei positions.

**Opacity range**: 0.06-0.25 — peripheral decoration only.

### 3. Bloch Sphere Frame (Bookend element)

**Purpose**: Shared visual frame for title and ending slides, creating thematic bookends.

**Design**: Rectangular border with corner accent marks (L-shaped strokes with endpoint dots). Central Bloch sphere visualization: large circle with equatorial ellipse, meridian ellipse, and axis lines. Four cardinal points marked with filled circles. Top/bottom edge trace accents with nodes.

**Opacity range**: 0.18-0.70 — more visible as a framing element.

### 4. Wire Divider

**Purpose**: Section separator that reinforces the quantum circuit motif.

**Design**: Horizontal line with various quantum gate symbols along its length: filled circles (control qubits), small squares (single-qubit gates), and a circle-with-crosshair (CNOT target). Endpoint nodes are larger filled circles.

**Opacity range**: 0.5-0.8 — functional separator, needs visibility.

### 5. Entanglement Curve

**Purpose**: Decorative connector showing relationship/linkage between concepts.

**Design**: Two endpoint circles (violet and cyan) connected by a dashed bezier curve. Small scattered dots along the curve suggest quantum correlation.

**Opacity range**: 0.3-0.7 — decorative but meaningful.

### 6. Ket Frame

**Purpose**: Decorative bracket inspired by Dirac bra-ket notation.

**Design**: Vertical line with angled bracket (|...>) shape. Endpoint circles in complementary colors.

**Opacity range**: 0.5-0.7 — used as inline decoration.

---

## Component Design Rationale

### qubit-card
- **Visual metaphor**: A qubit register entry — left border represents the quantum wire, dot represents the qubit state
- **Use case**: Primary content container for information blocks
- **Border**: 3pt left accent + 1pt border elsewhere

### gate-box
- **Visual metaphor**: A quantum gate operation — top border represents the gate being applied to a wire
- **Use case**: Key insights, important callouts, highlighted content
- **Border**: 3pt top accent, light cyan fill for emphasis

### state-tag
- **Visual metaphor**: Quantum state label (|0>, |1>, |+>, |->)
- **Use case**: Categorization, tagging, metadata labels
- **Shape**: Capsule (99pt radius) with dot indicator

### orbital-card
- **Visual metaphor**: Electron orbital — gradient background evokes probability distribution
- **Use case**: Feature descriptions, data displays
- **Fill**: Linear gradient from accent-tinted to white

### wire-divider
- **Visual metaphor**: Quantum circuit wire connecting different parts of the computation
- **Use case**: Section separation, visual rhythm
- **Rendering**: Full SVG with gate symbols

### superposition-stat
- **Visual metaphor**: Measurement outcome — the "collapsed" value from a quantum state
- **Use case**: KPIs, metrics, large number displays
- **Sequence**: One centered stack — ket icon, large value, compact label
- **Accent**: The ket icon acts as the measurement indicator; no spacer is inserted between KPI internals

### entangle-card
- **Visual metaphor**: Entangled qubits — connected information that cannot be separated
- **Use case**: Related content, linked insights, cross-references
- **Decoration**: Entanglement curve SVG in header

### register-grid
- **Visual metaphor**: Multi-qubit register — parallel information channels
- **Use case**: Comparisons, before/after, two-panel layouts
- **Structure**: Two panels with central separator (no height: 100% in cells)

### measurement-box
- **Visual metaphor**: Quantum measurement — observing and recording results
- **Use case**: Conclusions, findings, experimental results
- **Border**: Full accent border for strong visual weight

### coherence-note
- **Visual metaphor**: Coherence time window — information that persists but may be fleeting
- **Use case**: Annotations, supplementary notes, timeline info
- **Border**: Dashed to suggest impermanence/supplementary nature

---

## Slide Architecture

### Content Slide Structure

```
+------------------------------------------+
| HEADER: Title + Wire Divider             |
|   [stack(spacing: .8em)]                 |
+------------------------------------------+
|                                          |
| BACKGROUND ATMOSPHERE:                   |
|   - Quantum circuit wires (full-page)    |
|   - Orbital clouds (corners)            |
|   - Corner accent nodes                  |
|                                          |
| CONTENT AREA:                            |
|   [setting(body) applies atmosphere]     |
|   [align: horizon]                       |
|                                          |
+------------------------------------------+
| FOOTER: grid(1fr, auto, 1fr)            |
|   [text | dot | page number]             |
+------------------------------------------+
```

### Title/Ending Bookend Structure

```
+------------------------------------------+
| Bloch Sphere Frame (corners + sphere)    |
|                                          |
|         Quantum Circuit BG               |
|                                          |
|           CENTERED:                      |
|           Title (2.4em bold)             |
|           Wire Divider                   |
|           Subtitle                       |
|           Author                         |
|           Institution                    |
|           Date                           |
|                                          |
+------------------------------------------+
```

### Section Slide Structure

```
+--+---------------------------------------+
|V |                                       |
|I |  Section Number (3.5em, violet)       |
|O |  Entangle Curve                       |
|L |  Section Title (2em, bold)            |
|E |                                       |
|T |  [Corner orbital decorations]         |
|  |                                       |
+--+---------------------------------------+
|======= bottom accent line ==============|
```

---

## Implementation Rules

1. **All SVGs**: No HTML comments (`<!-- -->`), 8+ path/shape elements, opacity range 0.1-0.8
2. **Headers**: Use `stack(spacing:)` between title text and wire divider — never `v()`
3. **Flexible cards**: Height-filling card components end with one `#lazy-v(1fr)` and are used only as the sole component in each `cols(lazy-layout: true)` column
4. **Footer**: Uses `grid(columns: (1fr, auto, 1fr))` — never `h(1fr)`
5. **Background**: Content slides use `setting(body)` function for persistent atmosphere
6. **Frame borders**: Percentage-based dimensions in SVG viewBox coordinates
7. **Adjacent blocks**: `stack(spacing: 0pt)` with `clip: true` where needed
8. **Bookends**: Title and ending slides share the Bloch sphere frame element
9. **No `height: 100%`** in grid/cols cells to avoid layout issues
10. **Slide functions**: All use `touying-slide-wrapper(self => {...})` pattern
11. **Text-safe accents**: Decorative cyan remains `secondary`; cyan text uses `secondary-ink`
12. **KPI internals**: Icon → value → label is one centered `stack(spacing:)` with no `v()`

---

## Accessibility Considerations

- Text contrast ratio on light background exceeds 7:1 (WCAG AAA)
- Primary accent (violet) on white exceeds 4.5:1 (WCAG AA)
- SVG decorations are purely atmospheric — no information conveyed through decoration alone
- All content readable without color (bold/italic provide additional semantic weight)
- Font size minimum 14pt equivalent for body text (18pt actual)
