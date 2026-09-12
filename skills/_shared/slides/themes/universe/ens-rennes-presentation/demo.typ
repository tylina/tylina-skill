// ===============================================================
// ENS Rennes Presentation Theme Demo
// Universe package: @preview/ens-rennes-presentation:0.1.0
// Touying version: 0.6.1
// École Normale Supérieure de Rennes — Institutional Theme
// ===============================================================

// Note: this package re-exports Touying, no separate import needed
#import "@preview/ens-rennes-presentation:0.1.0": *
#import "@preview/theorion:0.6.0": *
#import "@preview/mitex:0.2.7": *
#import cosmos.rainbow: *
#show: show-theorion
#show text: set text(font: "Arial")

// Package 0.1.0 can lose metadata-backed header/footer cells on alternating
// pages. Keep its slide body and foreground, but replace repeated chrome with
// bounded, stable rows for this demo.
#let compatible-slide(section, title, body) = {
  let stable-chrome = config-page(
    header: self => stack(
      spacing: 0pt,
      block(
        width: 100%,
        height: 2.5em,
        fill: self.colors.primary,
        inset: (x: 2em, y: 0.55em),
      )[
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(size: 0.85em, weight: "semibold", fill: white, section),
          text(size: 0.65em, fill: white)[ENS Rennes · Mathématiques],
        )
      ],
      block(
        width: 100%,
        height: 2.5em,
        fill: self.colors.primary.lighten(18%),
        inset: (x: 2em, y: 0.55em),
      )[
        #text(size: 1.05em, fill: white, title)
      ],
    ),
    footer: self => context {
      set text(size: 0.8em, fill: white)
      block(width: 100%, fill: self.colors.primary, inset: (x: 1em, y: 0.35em))[
        #grid(
          columns: (1fr, 1fr, auto),
          align: (left + horizon, center + horizon, right + horizon),
          [Le Gall],
          [Algèbre Homotopique],
          [#utils.slide-counter.display() / #utils.last-slide-number],
        )
      ]
    },
    margin: (top: 6em, bottom: 1.5em, x: 2em),
  )

  slide(title: title, config: stable-chrome, body)
}

// --- Theme Configuration ---
#show: ens-rennes-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Algèbre Homotopique et Topologie Algébrique],
    subtitle: [Des Catégories Modèles aux #mi(`\infty`)-Catégories],
    mini-title: [Algèbre Homotopique],
    authors: [Dr. Morgane Le Gall — ENS Rennes],
    mini-authors: [Le Gall],
    date: datetime.today(),
  ),
  department: "maths",
  display-dpt: false,
  section-style: "named subsection",
)

// === Title Slide ===
#title-slide()

// ============================================================
= Introduction
// ============================================================

== Motivation

#compatible-slide([Introduction], [Pourquoi l'Algèbre Homotopique ?])[
  L'algèbre homotopique fournit un cadre pour *identifier des objets
  à équivalence près*, ce qui est fondamental en :

  - Topologie algébrique (espaces homotopiquement équivalents)
  - Algèbre homologique (résolutions projectives/injectives)
  - Géométrie algébrique dérivée (schémas dérivés)
  - Théorie des types homotopiques (HoTT)

  Ce séminaire présente les fondements catégoriques de cette théorie.
]

== Cadre Historique

#compatible-slide([Introduction], [De Quillen aux #mi(`\infty`)-Catégories])[
  + *1967* — Quillen introduit les catégories modèles
  + *1983* — Grothendieck propose les « Pursuing Stacks »
  + *1999* — Hovey formalise les catégories modèles modernes
  + *2009* — Lurie publie « Higher Topos Theory »
  + *2019* — Cisinski donne une approche axiomatique des #mi(`\infty`)-catégories

  Nous suivrons l'approche de Quillen enrichie par les résultats récents.
]

// ============================================================
= Catégories Modèles
// ============================================================

== Définition

#compatible-slide([Catégories Modèles], [Axiomes de Quillen])[
  #stack(
    spacing: 0.8em,
    definition(title: [Catégorie modèle])[
      Une *catégorie modèle* est une catégorie #mi(`\mathcal{C}`) munie de trois
      classes de morphismes distinguées :
      - *Fibrations* (#mi(`\twoheadrightarrow`))
      - *Cofibrations* (#mi(`\hookrightarrow`))
      - *Équivalences faibles* (#mi(`\xrightarrow{\sim}`))

      satisfaisant les axiomes MC1–MC5 de Quillen.
    ],
    [Les équivalences faibles sont les morphismes que l'on souhaite
    « inverser » ; fibrations et cofibrations contrôlent les
    relèvements et extensions.],
  )
]

== Exemples Fondamentaux

#compatible-slide([Catégories Modèles], [Catégories Modèles Classiques])[
  #stack(
    spacing: 1em,
    example(title: [Espaces topologiques])[
      La catégorie #mi(`\mathbf{Top}`) des espaces topologiques admet une
      structure de Quillen où les équivalences faibles sont les
      équivalences d'homotopie faibles.
    ],
    example(title: [Complexes de chaînes])[
      La catégorie #mi(`\mathbf{Ch}(R)`) des complexes de chaînes sur un
      anneau #mi(`R`) admet une structure de Quillen où les équivalences
      faibles sont les quasi-isomorphismes.
    ],
  )
]

== Catégorie Homotopique

#compatible-slide([Catégories Modèles], [Localisation])[
  #stack(
    spacing: 1em,
    definition(title: [Catégorie homotopique])[
      La *catégorie homotopique* #mi(`\text{Ho}(\mathcal{C})`) est la localisation
      de #mi(`\mathcal{C}`) par rapport aux équivalences faibles :

      #mitex(`\text{Ho}(\mathcal{C}) = \mathcal{C}[\mathcal{W}^{-1}]`)
    ],
    theorem(title: [Théorème fondamental])[
      Si #mi(`\mathcal{C}`) est une catégorie modèle, alors #mi(`\text{Ho}(\mathcal{C})`)
      est équivalente à la catégorie dont les objets sont les objets
      fibrants-cofibrants et les morphismes sont les classes
      d'homotopie.
    ],
  )
]

// ============================================================
= Foncteurs Dérivés
// ============================================================

== Adjonctions de Quillen

#compatible-slide([Foncteurs Dérivés], [Foncteurs Adjoints et Structure Modèle])[
  #stack(
    spacing: 1em,
    definition(title: [Adjonction de Quillen])[
      Une paire d'adjoints #mi(`L : \mathcal{C} \rightleftarrows \mathcal{D} : R`) est une
      *adjonction de Quillen* si #mi(`L`) préserve les cofibrations et les
      cofibrations triviales (ou de manière équivalente, #mi(`R`) préserve
      les fibrations et les fibrations triviales).
    ],
    proposition(title: [Foncteurs dérivés])[
      Une adjonction de Quillen #mi(`(L, R)`) induit une adjonction dérivée :

      #mitex(`\mathbb{L} L : \text{Ho}(\mathcal{C}) \rightleftarrows \text{Ho}(\mathcal{D}) : \mathbb{R} R`)
    ],
  )
]

== Exemple : Homologie Singulière

#compatible-slide([Foncteurs Dérivés], [Application en Topologie Algébrique])[
  Le foncteur des chaînes singulières #mi(`C_\bullet : \mathbf{Top} \to \mathbf{Ch}(\mathbb{Z})`)
  fait partie d'une adjonction de Quillen.

  Son foncteur dérivé donne l'*homologie singulière* :

  #mitex(`H_n(X) = H_n(C_\bullet(X))`)

  #remark(title: [Invariance homotopique])[
    Par construction, #mi(`H_n`) est un invariant homotopique :
    si #mi(`f : X \to Y`) est une équivalence faible, alors
    #mi(`H_n(f) : H_n(X) \xrightarrow{\sim} H_n(Y)`) est un isomorphisme.
  ]
]

// ============================================================
= Vers les Infinity-Catégories
// ============================================================

== Limites des Catégories Modèles

#compatible-slide([Vers les Infinity-Catégories], [Au-delà de Quillen])[
  Les catégories modèles présentent certaines limitations :

  - La catégorie homotopique #mi(`\text{Ho}(\mathcal{C})`) *perd de l'information*
    (elle ne retient que #mi(`\pi_0`) de l'espace des morphismes)
  - Les *limites homotopiques* ne sont pas toujours calculables
    dans #mi(`\text{Ho}(\mathcal{C})`) seule
  - Le passage aux *diagrammes* (foncteurs) nécessite des
    structures modèles induites, parfois difficiles à construire

  Les #mi(`\infty`)-catégories résolvent ces problèmes en retenant
  *toute l'information homotopique*.
]

== Quasi-Catégories

#compatible-slide([Vers les Infinity-Catégories], [Le Modèle de Joyal-Lurie])[
  #stack(
    spacing: 1em,
    definition(title: [Quasi-catégorie])[
      Une *quasi-catégorie* est un ensemble simplicial
      #mi(`\mathcal{C} : \Delta^{\text{op}} \to \mathbf{Set}`) satisfaisant la condition
      de Kan intérieure : tout « corne intérieure » #mi(`\Lambda^n_k \to \mathcal{C}`)
      (#mi(`0 < k < n`)) admet un remplissage #mi(`\Delta^n \to \mathcal{C}`).
    ],
    lemma(title: [Nerf d'une catégorie])[
      Le nerf #mi(`N(\mathcal{C})`) d'une catégorie ordinaire est une
      quasi-catégorie. Réciproquement, une quasi-catégorie dont
      tout remplissage est unique est le nerf d'une catégorie.
    ],
  )
]

// ============================================================
= Conclusion
// ============================================================

== Résumé et Perspectives

#compatible-slide([Conclusion], [Synthèse])[
  *Ce que nous avons vu :*
  - Les catégories modèles de Quillen et leurs axiomes
  - La construction de la catégorie homotopique
  - Les foncteurs dérivés via les adjonctions de Quillen
  - L'introduction aux quasi-catégories

  *Directions de recherche :*
  - #mi(`\infty`)-catégories stables et K-théorie algébrique
  - Théorie des types homotopiques et fondements des mathématiques
  - Applications en physique mathématique (TQFTs)
  - Algèbre dérivée et géométrie non-commutative
]

== Références

#compatible-slide([Conclusion], [Bibliographie Sélective])[
  - D. Quillen, _Homotopical Algebra_, LNM 43 (1967)
  - M. Hovey, _Model Categories_, AMS (1999)
  - J. Lurie, _Higher Topos Theory_, Princeton (2009)
  - D.-C. Cisinski, _Higher Categories and Homotopical Algebra_,
    Cambridge (2019)
  - E. Riehl & D. Verity, _Elements of #mi(`\infty`)-Category Theory_,
    Cambridge (2022)
]
