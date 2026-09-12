// ===============================================================
// GQE Le Moulon Presentation Theme Demo
// Universe package: @preview/gqe-lemoulon-presentation:0.0.7
// Touying version: 0.6.1 (owned by the external package)
// GQE-Le Moulon — Quantitative Genetics and Evolution Laboratory
// ===============================================================

#import "@preview/gqe-lemoulon-presentation:0.0.7": *
#import themes.gqe: *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#let safe-footer-counter(self) = {
  set align(center + horizon)
  context { utils.slide-counter.display() + " / " + utils.last-slide-number }
}

#show: gqe-lemoulon-presentation-theme.with(
  aspect-ratio: "4-3",
  footer-c: safe-footer-counter,
  config-info(
    title: [Diversité Génétique et Adaptation du Maïs],
    subtitle: [Analyse GWAS Multi-Environnements],
    author: [Dr. Claire Durand],
    equipe: [DyGAP — Dynamique et Génétique de l'Adaptation des Plantes],
  ),
)

// Le package utilise 28pt par défaut ; 24pt préserve une densité lisible en 4:3.
#set text(size: 24pt)

// === Title Slide ===
#title-slide()

// ============================================================
= Introduction
// ============================================================

== Contexte

#slide()[
  Le maïs (_Zea mays_ L.) est un modèle majeur pour l'étude de la
  *diversité génétique* et de l'*adaptation* chez les plantes cultivées.

  - 4e céréale mondiale (1,2 milliard de tonnes/an)
  - Diversité allélique considérable : >60 000 accessions dans les banques de gènes
  - Adaptation à des environnements très variés (tropical à tempéré)
  - Génome séquencé et annoté (référence B73 v5, 2,3 Gb)

  L'enjeu : identifier les bases génétiques de l'adaptation au
  changement climatique pour guider la sélection variétale.
]

== Objectifs de l'Étude

#slide()[
  Cette étude vise à :

  #grid(
    columns: (auto, 1fr),
    column-gutter: .5em,
    row-gutter: .25em,
    [1.], [Caractériser la diversité génétique d'un panel de 300 lignées],
    [2.], [Identifier les QTL d'adaptation par GWAS multi-environnements],
    [3.], [Évaluer les interactions génotype #mi(`\times`) environnement (G#mi(`\times`)E)],
    [4.], [Construire des modèles de prédiction génomique],
  )
]

== Objectifs de l'Étude

#slide()[
  #v(2.2em)
  #pave("Hypothèse")[
    Les QTL impliqués dans la floraison et la tolérance au stress
    hydrique présentent des signatures de sélection différentes
    entre populations tropicales et tempérées.
  ]
]

// ============================================================
= Matériel et Méthodes
// ============================================================

== Panel Génétique

#slide()[
  #tableau(columns: 3,
    [*Groupe*], [*Nb. lignées*], [*Origine*],
    [Tropical], [120], [CIMMYT, IITA],
    [Tempéré corné], [90], [Europe, INRAE],
    [Tempéré denté], [60], [USA, Corn Belt],
    [Intermédiaire], [30], [Croisements mixtes],
  )

  Génotypage par puce Axiom 600K (#mi(`\approx`) 560 000 SNP après filtrage).
]

== Dispositif Expérimental

#slide()[
  Essais multi-environnements sur 3 ans et 4 sites :

  - *Gif-sur-Yvette* (Île-de-France) — conditions tempérées
  - *Mauguio* (Hérault) — conditions méditerranéennes
  - *Saint-Martin-de-Hinx* (Landes) — conditions atlantiques
  - *Clermont-Ferrand* (Puy-de-Dôme) — conditions continentales

  Dispositif en blocs incomplets (alpha-lattice), 2 répétitions/site.

  Caractères mesurés : date de floraison mâle (DTM), hauteur de plante,
  rendement en grain, ASI (_Anthesis-Silking Interval_).
]

== Modèle Statistique

#slide()[
  Le modèle mixte pour la GWAS multi-environnements est :

  #mitex(`y_{ijk} = \mu + G_i + E_j + (GE)_{ij} + \sum_{l=1}^p \beta_{lj} x_{il} + u_i + \epsilon_{ijk}`)

  avec :
  - #mi(`G_i`) : effet génotypique (aléatoire, #mi(`G_i \sim \mathcal{N}(0, \sigma_G^2 \mathbf{K})`))
  - #mi(`E_j`) : effet environnement (fixe)
  - #mi(`(GE)_{ij}`) : interaction G#mi(`\times`)E
]

== Modèle Statistique

#slide()[
  *Paramètres complémentaires :*

  - #mi(`\beta_{lj}`) : effet du SNP #mi(`l`) dans l'environnement #mi(`j`)
  - #mi(`\mathbf{K}`) : matrice de parenté génomique (VanRaden, 2008)
  - #mi(`u_i`) : effet polygénique résiduel

  Correction pour la structure de population par les 10 premiers
  axes de l'ACP génomique.
]

// ============================================================
= Résultats
// ============================================================

== Structure de Population

#slide()[
  L'analyse en composantes principales révèle trois groupes
  génétiques distincts :

  - *Axe 1* (18,3% de variance) : séparation tropical / tempéré
  - *Axe 2* (7,1% de variance) : séparation corné / denté
  - *Axe 3* (3,2% de variance) : sous-structure géographique

  Le #mi(`F_{\text{ST}}`) moyen entre groupes tropical et tempéré est de 0,12,
  confirmant une différenciation modérée mais significative.
]

== QTL Identifiés

#slide()[
  La GWAS a identifié 47 associations significatives
  (#mi(`-\log_{10}(p) > 5.5`), seuil FDR 5%) :

  #tableau(columns: 4,
    [*Caractère*], [*Nb. QTL*], [*R² total*], [*QTL majeur*],
    [Floraison mâle], [18], [42%], [chr. 8 — _Vgt1_],
    [Hauteur plante], [12], [31%], [chr. 3 — _d8_],
    [ASI], [9], [22%], [chr. 1 — _si1_],
    [Rendement], [8], [15%], [chr. 5 — _qGY5.1_],
  )
]

== Interactions G×E

#slide()[
  Les interactions G#mi(`\times`)E sont particulièrement marquées pour :

  - *Rendement* : corrélation génétique entre sites #mi(`r_G = 0.45`) à #mi(`0.78`)
  - *ASI* : forte interaction avec le stress hydrique (#mi(`\sigma^2_{GE} / \sigma^2_G = 0.63`))
  - *Floraison* : stabilité élevée (#mi(`r_G > 0.90`))

  #pave("Résultat clé")[
    Trois QTL de rendement présentent des effets opposés entre
    environnements méditerranéen et atlantique, suggérant une
    adaptation locale différentielle.
  ]
]

== Prédiction Génomique

#slide()[
  Performance de la prédiction génomique (validation croisée 5-fold) :

  #tableau(columns: 3,
    [*Caractère*], [*Précision (GBLUP)*], [*Précision (BayesB)*],
    [Floraison mâle], [0.81], [0.83],
    [Hauteur plante], [0.72], [0.74],
    [ASI], [0.58], [0.61],
    [Rendement], [0.45], [0.48],
  )

  La précision pour le rendement reste modeste, reflétant
  l'architecture polygénique et les interactions G#mi(`\times`)E fortes.
]

// ============================================================
= Discussion et Conclusion
// ============================================================

== Synthèse

#slide()[
  *Contributions principales :*
  - 47 QTL identifiés pour 4 caractères d'intérêt agronomique
  - Mise en évidence de QTL à effets environnement-spécifiques
  - Modèles de prédiction génomique pour la sélection assistée
]

== Synthèse

#slide()[
  *Perspectives :*
  - Validation fonctionnelle des gènes candidats par CRISPR-Cas9
  - Extension du panel à 1000 lignées (projet EuroMaize)
  - Intégration des données transcriptomiques et métabolomiques
  - Modélisation écophysiologique couplée à la génomique
]

== Remerciements

#slide()[
  Ce travail a été réalisé au laboratoire GQE-Le Moulon
  (UMR 8120), avec le soutien de :

  - INRAE — département BAP (Biologie et Amélioration des Plantes)
  - ANR — projet GénétiMaïs (ANR-XX-CE20-0042)
  - Université Paris-Saclay — école doctorale SDSV
  - IDEEV — programme transversal adaptation

  Merci aux plateformes PAPPSO (protéomique) et
  GENTYANE (génotypage haut-débit, INRAE Clermont-Ferrand).
]
