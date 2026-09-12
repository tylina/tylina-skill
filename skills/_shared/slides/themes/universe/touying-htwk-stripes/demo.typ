// ===============================================================
// HTWK Stripes Theme Demo
// Universe package: @preview/touying-htwk-stripes:1.0.1
// Touying version: 0.7.4 (owned by the Universe package)
// HTWK Leipzig — Institutional Presentation Theme
// ===============================================================

#import "@preview/touying-htwk-stripes:1.0.1": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: htwk-stripes-theme.with(
  aspect-ratio: "4-3",
  title: [Optimierung eingebetteter Systeme],
  subtitle: [Energieeffiziente Algorithmen für IoT-Geräte],
  authors: ("Prof. Dr. Katrin Müller", "M.Sc. Lukas Hoffmann"),
  authors-title-slide: [
    Prof. Dr. Katrin Müller \
    M.Sc. Lukas Hoffmann
  ],
  date: datetime.today(),
  institution: [HTWK Leipzig — Fakultät Informatik und Medien],
  primary-color: rgb("#009ee3"),
  font: "Libertinus Serif",
)

// === Title Slide ===
#htwk-title-slide()

// === Outline ===
#htwk-outline(title: "Inhalt")

// ============================================================
= Einleitung
// ============================================================

== Problemstellung

Eingebettete Systeme in IoT-Anwendungen unterliegen strengen
*Energiebeschränkungen*, die neue algorithmische Ansätze erfordern.

- Batteriebetriebene Sensorknoten mit begrenzter Lebensdauer
- Echtzeitanforderungen bei der Datenverarbeitung
- Begrenzte Rechenkapazität und Speicher

Die zentrale Forschungsfrage: Wie können wir Energieverbrauch
minimieren, ohne die Verarbeitungsqualität zu beeinträchtigen?

== Stand der Forschung

Aktuelle Ansätze in der energieeffizienten Berechnung:

+ *Dynamic Voltage Scaling* (DVS) — Anpassung der Versorgungsspannung
+ *Approximate Computing* — Berechnung mit kontrollierbarer Ungenauigkeit
+ *Task Scheduling* — Intelligente Aufgabenplanung
+ *Neural Architecture Search* — Automatisierte Modellkompression

// ============================================================
= Theoretische Grundlagen
// ============================================================

== Energiemodell

Der Energieverbrauch eines eingebetteten Prozessors wird modelliert als:

#mitex(`E = \underbrace{C \cdot V^2 \cdot f}_{\text{dynamisch}} + \underbrace{I_{\text{leak}} \cdot V \cdot t}_{\text{statisch}}`)

wobei #mi(`C`) die geschaltete Kapazität, #mi(`V`) die Versorgungsspannung,
#mi(`f`) die Taktfrequenz und #mi(`I_{\text{leak}}`) der Leckstrom ist.

== Optimierungsproblem

Das Energieoptimierungsproblem lässt sich formulieren als:

#mitex(`\min_{f_1, \ldots, f_n} \quad \sum_{i=1}^n E_i(f_i) \quad \text{s.t.} \quad \sum_{i=1}^n t_i(f_i) \leq T_{\text{deadline}}, \quad f_{\text{min}} \leq f_i \leq f_{\text{max}} \quad \forall i`)

wobei #mi(`T_{\text{deadline}}`) die Echtzeitbeschränkung darstellt.

== Approximationstheorie

Für die Fehleranalyse bei Approximate Computing gilt:

#mitex(`\| \hat{y} - y \|_2 \leq \varepsilon \cdot \| x \|_2`)

mit der relativen Approximationstoleranz #mi(`\varepsilon \in [0, 1]`).
Der *Energiegewinn* wächst logarithmisch:

#mitex(`\Delta E \approx \kappa \cdot \ln(1 / \varepsilon)`)

// ============================================================
= Methodik
// ============================================================

== Systemarchitektur

Unsere vorgeschlagene Architektur besteht aus drei Schichten:

+ *Sensorschicht* — Datenerfassung und Vorverarbeitung
+ *Verarbeitungsschicht* — Adaptive Berechnung mit DVS
+ *Kommunikationsschicht* — Energieoptimiertes Datenrouting

Jede Schicht verfügt über eigene Energiebudgets und Qualitätsmetriken.

== Evaluationsparameter

#table(
  columns: (2fr, 1fr, 2fr),
  align: center,
  inset: 0.5em,
  table.header[*Parameter*][*Wert*][*Beschreibung*],
  [Sensorknoten], [50], [Mesh-Topologie],
  [Abtastrate], [100 Hz], [Beschleunigungsdaten],
  [Batteriekapazität], [2000 mAh], [LiPo-Akku],
  [Ziellebensdauer], [365 Tage], [Wartungsfrei],
  [Prozessor], [ARM Cortex-M4], [72 MHz max.],
)

// ============================================================
= Ergebnisse
// ============================================================

== Energieeinsparung

Die experimentellen Ergebnisse zeigen signifikante Verbesserungen:

- *42%* Energieeinsparung gegenüber statischem DVS
- *Echtzeit*-Bedingungen in 98,7% aller Szenarien eingehalten
- Approximationsfehler #mi(`\varepsilon < 0.03`) bei allen Messungen
- Lebensdauer der Sensorknoten von 180 auf 310 Tage erhöht

== Vergleich mit bestehenden Ansätzen

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Methode*][*Einsparung*][*Fehler*][*Echtzeit*],
  [Statisches DVS], [18%], [0.00], [99.9%],
  [AdaScale], [31%], [0.02], [97.1%],
  [ApproxIoT], [35%], [0.05], [94.3%],
  [*Unser Ansatz*], [*42%*], [*0.03*], [*98.7%*],
)

// ============================================================
= Zusammenfassung
// ============================================================

== Fazit und Ausblick

*Beiträge dieser Arbeit:*
- Neuartiges adaptives DVS-Verfahren für IoT-Systeme
- Integration von Approximate Computing mit garantierten Fehlerschranken
- Validierung auf realer Sensorhardware

*Zukünftige Arbeiten:*
- Erweiterung auf heterogene Prozessorarchitekturen
- Integration von Reinforcement Learning für online-Optimierung
- Feldtest in einem industriellen Produktionsumfeld

== Danksagung

Dieses Projekt wird gefördert durch das BMBF im Rahmen des
Programms "Forschung an Fachhochschulen" (FKZ: 13FH123AB4).

Wir danken dem Rechenzentrum der HTWK Leipzig für die
Bereitstellung der Simulationsinfrastruktur.

#htwk-sources()[
  - BMBF (2026): Forschung an Fachhochschulen.
]
