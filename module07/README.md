# ANI2012H22

## Module 7 : Transformation

### Exemple 7.1 (TransformFunctions)

Exemples de différentes fonctions utilitaires de transformation offertes par *Processing*. 

La fonction *dist* calcule la distance entre deux positions, la fonction *norm* normalise une valeur entre 0 et 1, la fonction *map* convertit une valeur d'un intervalle vers un autre intervalle et la fonction *lerp* fait l'interpolation linéaire d'une valeur entre deux bornes.

### Exemple 7.2

Un contrôle interactif comme une souris ou une tablette graphique peut être utilisé comme source de transformation géométrique. 

Il suffit d'observer les états courants des boutons et la position du curseur lors de la mise à jour d'un programme. 

Dans ces 3 exemples, la position du curseur de la souris est utilisée pour tracer des traînées lumineuses avec différentes approches :

#### Exemple 7.2.1 (Trail1)

Animation d'une traînée lumineuse en fonction de la position courante du curseur.

#### Exemple 7.2.2 (Trail2)

Animation d'une traînée lumineuse en fonction d'un historique des positions précédentes du curseur.

#### Exemple 7.2.3 (Trail3)

Animation d'une traînée lumineuse en fonction de la position courante et précédente du curseur avec une variation de la taille en fonction de la vitesse de déplacement.

### Exemple 7.3

En programmation, la trigonométrie est un incontournable pour les transformations géométriques basées sur la rotation. À partir d'angles exprimés soit en degrés ou en radians et de fonctions trigonométriques comme le sinus et le cosinus, un programme peut déterminer des coordonnées dans l'espace en suivant le tracé d'un cercle, d'une spirale ou d'une oscillation.

#### Exemple 7.3.1 (Spiral1)

Dessine une spirale du centre vers l'extérieur à partir d'une ellipse répétée à chaque itération d'une boucle avec une position déterminée par un angle et une amplitude qui s'incrémentent à chaque fois que le code est exécuté.

#### Exemple 7.3.2 (Spiral2)

Technique similaire à l'exemple Spiral1 mais avec animation, variation de couleur et réinitialisation après un certain délai.
Puisque l'angle n'est pas réinitialisé à chaque séquence, une légère variation d'orientation se dessine à chaque itération.

#### Exemple 7.3.3 (Spiral3)

Technique similaire à l'exemple Spiral2 mais avec variation aléatoire de la valeur incrémentale de l'angle et de l'amplitude.

### Exemple 7.4

Exemple d'une horloge animée à vitesse accélérée. Les aiguilles de l'horloge sont rendues avec la même fonction de dessin d'une flèche, mais avec une couleur et une transformation différentes au niveau de la rotation.

Les transformations de l'horloge et de ses aiguilles sont isolées localement par une paire de *pushMatrix* et *popMatrix* puis sont correctement localisées par un *translate* et un *rotate*.

#### Exemple 7.4.1 (Clock1)

Animation d'une horloge, version implémentée sans classe.

#### Exemple 7.4.2 (Clock2)

Animation d'une horloge, version implémentée avec une classe.

### Exemple 7.5 (Transform)
 
Les transformations géométriques comme la translation, la rotation et la proportion sont appliquées directement sur le système de coordonnées d'un espace.

Elles sont symbolisées sous forme de matrices de transformation de dimension 4x4 qui peuvent être composées ensemble par multiplication. 

Les opérations de manipulation de matrice de transformation sont souvent encapsulées dans des fonctions (*translate*, *rotate* et *scale*) qui exposent seulement un minimum de paramètres. Par exemple la différentielle en X, Y, Z de la position ou de la proportion, ou un angle de rotation pour chacun des axes.

Chaque appel d'une de ces fonctions va multiplier la matrice de transformation courante du système de coordonnées de l'espace de la scène avec la nouvelle matrice de transformation générée à partir des valeurs passées en paramètre des fonctions de transformation.

Puisque les matrices peuvent être structurées dans une pile, la matrice située au sommet de la pile contient le résultat de la dernière transformation faite sur le système de coordonnées courant et les autres matrices de la pile conservent la transformation des autres niveaux hiérarchiques.

Dans cet exemple, différentes transformations géométriques sont appliquées sur une image (touches numériques 1 à 0).

### Exemple 7.6 (Projectiles)

Dans cet exemple vous est présenté un système de projectiles basé sur le principe du *pooling*, où les projectiles sont préalloués à l'initialisation du programme et sont mis en cache afin de ne pas allouer de mémoire lors des mises à jour de l'affichage.

Une première collection contient tous les projectiles qui ne sont pas actifs et qui sont prêts à l'utilisation, alors que la seconde collection contient les projectiles actifs, qui sont affichés alors qu'ils se déplacent dans la scène jusqu'à ce qu'il sortent de la scène pour finalement retourner dans la première collection.

Les flèches du clavier permettent de déplacer la position d'où les projectiles sont lancés.

### Exemple 7.7 (Vector3D)

Introduction d'une classe de vecteur 3D et test de certaines de ses méthodes. 

La classe à 3 propriétés, soit la position par rapport à l'origine des axes X, Y et Z de la base orthonormale d'un espace 3D. 

Cette classe peut aussi être utilisée dans le contexte d'un espace 2D si on ignore sa composante en Z.

Elle offre des méthodes comme l'addition, la différence, la multiplication, la division, la magnitude, la normalisation, le produit scalaire et le produit croisé.

Dans cet exemple, nous introduisons cette classe utilitaire qui sera parfois utilisée dans les prochains exemples.

Notez que *Processing* offre aussi une classe de vecteur minimaliste qui s'appelle *PVector* avec des fonctionnalités similaires, mais avec un peu moins de méthodes et dont vous ne pouvez pas aisément voir et modifier le code source.

### Exemple 7.8 (MoveTo)

Exemple d'animation du mouvement d'une base orthonormale vers une position sélectionnée au hasard ou en fonction du curseur de la souris lors d'un clic.

L'animation du déplacement se fait en parcourant à chaque mise à jour de l'affichage une fraction de l'espace entre la position courante et la position de destination.

### Exemple 7.9 (Particules)

En guise d'exemple plus complet en lien avec les transformations géométriques dans l'espace, voici une animation basée sur des systèmes de particules avec quatre différentes variantes (*luciole*, *physique*, *neige*, *flame*).

Chaque instance de particule hérite d'une classe de base qui contient les propriétés et méthodes communes à toutes les particules, alors que les classes enfants contiennent le code spécifique à l'animation et au rendu de chaque type.

Le système utilise aussi le principe du *pooling* afin de réutiliser toujours les mêmes particules sans réallouer de mémoire en cours d'exécution.
