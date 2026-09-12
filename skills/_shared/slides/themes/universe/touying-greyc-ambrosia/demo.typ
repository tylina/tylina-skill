// ===============================================================
// GREYC Ambrosia Theme Demo
// Universe package: @preview/touying-greyc-ambrosia:0.1.0
// Touying version: 0.6.2
// GREYC Laboratory — Université de Caen Normandie / CNRS
// ===============================================================

#import "@preview/touying:0.6.2": *
#import "@preview/touying-greyc-ambrosia:0.1.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
// Note: import touying FIRST, then greyc-ambrosia for overrides to work
#show: greyc-theme.with(
  flavor: "legacy",
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Traitement d'Images par Réseaux de Neurones Graphiques],
    subtitle: [Applications à la Segmentation Sémantique],
    author: [Dr. Marie-Claire Fontaine],
    date: datetime.today(),
    institution: [GREYC — UMR 6072 CNRS / Université de Caen Normandie],
  ),
)

// The package leaves typography to the document. Arial is installed in the
// review environment and keeps this institutional demo consistently sans-serif.
#set text(font: "Arial")

// === Title Slide ===
#title-slide()

// ============================================================
= Introduction
// ============================================================

== Contexte Scientifique

Le traitement d'images est un domaine central de recherche au
*GREYC* (Groupe de Recherche en Informatique, Image et
Instrumentation de Caen).

- Analyse et reconnaissance de formes
- Segmentation et classification d'images
- Reconstruction 3D à partir de séquences vidéo
- Imagerie médicale et télédétection

Les méthodes classiques sont progressivement enrichies par
les approches d'*apprentissage profond*.

== État de l'Art

Les architectures de segmentation sémantique ont évolué
rapidement ces dernières années :

+ *FCN* — Fully Convolutional Networks (2015)
+ *U-Net* — Architecture encodeur-décodeur (2015)
+ *DeepLab v3+* — Convolutions dilatées et ASPP (2018)
+ *SegFormer* — Transformers hiérarchiques (2021)
+ *GNN-Seg* — Réseaux de neurones graphiques (2023)

// ============================================================
= Fondements Théoriques
// ============================================================

== Réseaux de Neurones Graphiques

Un graphe #mi(`G = (V, E)`) est défini par un ensemble de nœuds #mi(`V`)
et d'arêtes #mi(`E`). La convolution graphique opère comme suit :

#mitex(`\mathbf{h}_v^{(l+1)} = \sigma \left( \sum_{u \in \mathcal{N}(v)} \frac{\mathbf{W}^{(l)} \mathbf{h}_u^{(l)}}{\sqrt{d_v \cdot d_u}} + \mathbf{b}^{(l)} \right)`)

où #mi(`\mathbf{h}_v^{(l)}`) est le vecteur de caractéristiques du nœud
#mi(`v`) à la couche #mi(`l`), #mi(`\mathcal{N}(v)`) est le voisinage de #mi(`v`), et
#mi(`d_v`) est le degré du nœud.

== Construction du Graphe d'Image

Chaque pixel (ou superpixel) est un nœud du graphe.
Les arêtes sont définies par :

#mitex(`w_{ij} = \exp\left(- \frac{\| \mathbf{f}_i - \mathbf{f}_j \|^2}{2\sigma^2}\right) \cdot \mathbb{1}_{\| \mathbf{p}_i - \mathbf{p}_j \| < r}`)

avec :
- #mi(`\mathbf{f}_i`) : vecteur de caractéristiques du pixel #mi(`i`)
- #mi(`\mathbf{p}_i`) : position spatiale du pixel #mi(`i`)
- #mi(`\sigma`) : paramètre d'échelle
- #mi(`r`) : rayon de voisinage spatial

== Fonction de Perte

La perte totale combine la cross-entropie pondérée et un terme
de régularisation de lissage graphique :

#mitex(`\mathcal{L} = \underbrace{- \sum_v \sum_c w_c \cdot y_{v,c} \log \hat{y}_{v,c}}_{\text{cross-entropie pondérée}} + \lambda \underbrace{\sum_{(u,v) \in E} \| \hat{\mathbf{y}}_u - \hat{\mathbf{y}}_v \|^2 \cdot w_{uv}}_{\text{lissage graphique}}`)

// ============================================================
= Protocole Expérimental
// ============================================================

== Jeux de Données

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Dataset*][*Images*][*Classes*][*Résolution*],
  [Cityscapes], [5 000], [19], [#mi(`2048 \times 1024`)],
  [PASCAL VOC], [11 530], [21], [#mi(`500 \times 375`)],
  [ADE20K], [25 210], [150], [Variable],
  [COCO-Stuff], [164 000], [171], [Variable],
)

== Configuration d'Entraînement

Paramètres d'entraînement du modèle proposé :

- *Optimiseur* : AdamW (#mi(`\beta_1 = 0.9`), #mi(`\beta_2 = 0.999`))
- *Taux d'apprentissage* : #mi(`3 \times 10^{-4}`) avec scheduler polynomial
- *Taille de lot* : 16 (4 GPU × 4 images)
- *Nombre d'époques* : 160 (Cityscapes), 200 (ADE20K)
- *Augmentation* : rotation, retournement, recadrage aléatoire
- *Régularisation* : #mi(`\lambda = 0.01`), dropout #mi(`= 0.1`)

// ============================================================
= Résultats
// ============================================================

== Performance de Segmentation

Résultats sur le benchmark Cityscapes (validation) :

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Méthode*][*mIoU (%)*][*Params (M)*][*FPS*],
  [DeepLab v3+], [80.2], [62.7], [14],
  [SegFormer-B3], [81.7], [47.3], [18],
  [Mask2Former], [83.3], [63.0], [8],
  [*GNN-Seg (nôtre)*], [*84.1*], [*38.5*], [*22*],
)

Notre approche atteint un *mIoU de 84,1 %* avec un modèle
significativement plus compact et rapide.

== Analyse Qualitative

Les résultats qualitatifs montrent les avantages suivants :

- *Contours précis* : la structure de graphe capture les frontières
  entre objets avec une meilleure fidélité
- *Cohérence spatiale* : le lissage graphique réduit le bruit
  de segmentation dans les régions homogènes
- *Objets fins* : poteaux, piétons et vélos sont mieux segmentés
  grâce à la modélisation explicite des relations de voisinage

== Étude d'Ablation

Impact de chaque composant sur les performances (Cityscapes) :

+ Modèle de base (CNN seul) : 78,3 % mIoU
+ Ajout du module GNN : +3,8 points (#mi(`\to`) 82,1 %)
+ Ajout du lissage graphique : +1,2 points (#mi(`\to`) 83,3 %)
+ Graphe multi-échelle : +0,8 points (#mi(`\to`) 84,1 %)

// ============================================================
= Conclusion et Perspectives
// ============================================================

== Synthèse

*Contributions principales :*
- Architecture hybride CNN-GNN pour la segmentation sémantique
- Mécanisme de lissage graphique pour la cohérence spatiale
- Résultats état de l'art sur Cityscapes et ADE20K

*Perspectives :*
- Extension à la segmentation panoptique
- Application à l'imagerie médicale (IRM cérébrale)
- Intégration de mécanismes d'attention graphique
- Collaboration avec les équipes d'imagerie du GREYC

== Remerciements

Ce travail a été réalisé au laboratoire GREYC (UMR 6072),
avec le soutien de :
- CNRS — Programme 80|Prime
- Région Normandie — RIN Recherche
- Université de Caen Normandie

Calculs effectués sur le mésocentre régional CRIANN.
