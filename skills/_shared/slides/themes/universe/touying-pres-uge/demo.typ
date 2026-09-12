// ===============================================================
// Touying Pres UGE Theme Demo
// Universe package: @preview/touying-pres-uge:0.1.1
// Touying version: 0.7.3 (owned by the Universe package)
// Université Gustave Eiffel — Institutional Presentation Theme
// ===============================================================

#import "@preview/touying-pres-uge:0.1.1": *
#import "@preview/mitex:0.2.7": *

#set text(font: ("Arial",))

// --- Theme Configuration ---
#show: uge-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Modélisation Multi-échelle des Matériaux Routiers],
    subtitle: [Vers une Infrastructure de Transport Durable],
    authors: (
      (
        name: "Dr. Sophie Lemaire",
        affiliations: (1,),
        email: "sophie.lemaire@univ-eiffel.fr",
      ),
    ),
    institutions: (
      "Université Gustave Eiffel — Laboratoire Navier",
    ),
    date: datetime.today(),
  ),
)

// === Title Slide ===
#title-slide()

// ============================================================
= Introduction
// ============================================================

== Contexte et Enjeux

Les infrastructures routières françaises font face à des défis majeurs
nécessitant de *nouvelles approches de modélisation* :

- 1,1 million de km de routes en France métropolitaine
- Vieillissement accéléré sous l'effet du changement climatique
- Transition vers des matériaux biosourcés et recyclés
- Réduction de l'empreinte carbone de la construction routière

L'Université Gustave Eiffel joue un rôle central dans cette recherche.

== Objectifs de la Recherche

Nos objectifs principaux sont :

+ Développer un modèle multi-échelle pour les enrobés bitumineux
+ Intégrer les effets thermiques et hydriques couplés
+ Valider le modèle par des essais en laboratoire et in situ
+ Proposer des critères de dimensionnement optimisés

// ============================================================
= Cadre Théorique
// ============================================================

== Mécanique des Milieux Continus

Le comportement viscoélastique de l'enrobé est décrit par le modèle
de Huet-Sayegh :

#mitex(`E^*(\omega, T) = E_0 + \frac{E_\infty - E_0}{1 + \delta (j\omega\tau)^{-k} + (j\omega\tau)^{-h}}`)

où #mi(`E_0`) et #mi(`E_\infty`) sont les modules statique et vitreux,
#mi(`\tau = \tau(T)`) est le temps de relaxation, et #mi(`k`), #mi(`h`), #mi(`\delta`)
sont des paramètres du modèle.

== Homogénéisation Multi-échelle

À l'échelle mésoscopique, l'enrobé est un composite granulats-mastic.
Le module effectif est estimé par le schéma auto-cohérent :

#mitex(`E_{\text{eff}} = E_m \cdot \frac{1 + c \cdot A}{1 - c \cdot B}`)

avec les tenseurs de concentration :

#mitex(`A = \frac{E_g - E_m}{E_m + \alpha (E_g - E_m)}, \quad B = \alpha \cdot A`)

où #mi(`c`) est la fraction volumique de granulats et #mi(`\alpha`) dépend de
la morphologie de l'inclusion.

== Couplage Thermo-Hydrique

L'effet de la température sur le temps de relaxation suit la loi WLF :

#mitex(`\log a_T = - \frac{C_1 (T - T_{\text{ref}})}{C_2 + T - T_{\text{ref}}}`)

Le couplage avec l'humidité introduit un facteur de dégradation :

#mitex(`D(w) = 1 - \beta \cdot \left(\frac{w}{w_{\text{sat}}}\right)^\gamma`)

// ============================================================
= Résultats Expérimentaux
// ============================================================

== Protocole Expérimental

#table(
  columns: (2fr, 2fr),
  align: center,
  inset: 0.5em,
  table.header[*Paramètre*][*Valeur*],
  [Matériau], [BBSG 0/10 classe 3],
  [Liant], [Bitume 35/50],
  [Taux de liant], [5,4 %],
  [Température d'essai], [#mi(`-10`) °C à #mi(`+50`) °C],
  [Fréquences], [0,01 Hz à 40 Hz],
  [Nombre d'éprouvettes], [18 (6 par lot)],
)

== Module Complexe

Les résultats dans le plan Cole-Cole montrent un excellent accord
entre le modèle et les mesures :

- Erreur relative moyenne : *2,3 %* sur le module
- Angle de phase : écart #mi(`< 1.5°`) sur toute la gamme
- Le modèle capture la transition vitreuse avec précision
- Reproductibilité inter-éprouvettes : #mi(`\text{CV} < 5\%`)

== Comparaison Modèle-Expérience

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Température*][*#mi(`E^*`) mesuré (MPa)*][*#mi(`E^*`) modèle (MPa)*][*Écart (%)*],
  [#mi(`-10`) °C], [28 500], [28 200], [1,1],
  [#mi(`10`) °C], [14 800], [15 100], [2,0],
  [#mi(`25`) °C], [5 200], [5 350], [2,9],
  [#mi(`40`) °C], [1 100], [1 080], [1,8],
)

// ============================================================
= Application au Dimensionnement
// ============================================================

== Critère de Fatigue

Le critère de fatigue à #mi(`N`) cycles est exprimé par :

#mitex(`\epsilon_6 = \epsilon_6^0 \cdot \left(\frac{N}{10^6}\right)^{1/b} \cdot \left(\frac{E^*}{E_{\text{ref}}^*}\right)^{1/c} \cdot k_\theta \cdot k_r`)

où #mi(`\epsilon_6^0`) est la déformation admissible à #mi(`10^6`) cycles,
#mi(`k_\theta`) et #mi(`k_r`) sont les coefficients de calage.

== Gain de Dimensionnement

L'approche multi-échelle permet d'optimiser la formulation :

- Réduction de *15 %* de l'épaisseur de chaussée
- Économie de *12 %* sur le coût des matériaux
- Diminution de *18 %* des émissions de #mi(`\text{CO}_2`)
- Durée de vie augmentée de 20 à 30 ans

// ============================================================
= Conclusion
// ============================================================

== Synthèse et Perspectives

*Contributions principales :*
- Modèle multi-échelle validé pour les enrobés bitumineux
- Prise en compte du couplage thermo-hydrique
- Critères de dimensionnement optimisés

*Perspectives :*
- Extension aux matériaux recyclés (agrégats d'enrobés)
- Intégration de l'endommagement par fatigue
- Développement d'un outil numérique pour le dimensionnement
- Collaboration avec le réseau scientifique et technique du MTES

== Remerciements

Ce travail a été réalisé au sein du Laboratoire Navier
(UMR 8205 CNRS / ENPC / Université Gustave Eiffel).

Financement : projet ANR-XX-CE22-0001 "DuraBit".

// === Focus Slide ===
#focus-slide[
  Merci de votre attention !
]
