# ANI2012H22

## Module 6 : Objet

### Exemple 6.1 (PointStructure)

En programmation, une structure est un regroupement de plusieurs variables de différents types sous un seul identifiant. Les structures sont utiles pour représenter des types simples qui contiennent seulement un ensemble de données sans nécessairement avoir des fonctions qui lui sont directement rattachées. Une structure peut être instanciée et chaque instance d'objet a des données indépendantes.

Dans cet exemple, instanciation et affichage de plusieurs points avec des propriétés aléatoires stockées dans une structure.

### Exemple 6.2 (Confetti)

En programmation orientée objet, une classe est une spécification de toutes les propriétés (variables) et méthodes (fonctions) communes aux instances du type qu'elle symbolise. Le terme 'objet' est utilisé pour designer une instance d'une classe, dont les propriétés sont indépendantes des autres instances de la même classe. Lors de son instanciation, une classe est initialisée par une fonction spéciale appelée 'constructeur', qui après son exécution retournera une référence vers l'objet fraîchement alloué en mémoire, référence qui peut être assignée à une variable de type compatible.

Dans cet exemple, instanciation et affichage de plusieurs confettis avec des attributs aléatoires. Chaque confetti est une instance d'une classe avec des valeurs de propriétés différentes.

### Exemple 6.3

En programmation orientée objet, une classe peut hériter d'une autre classe. Par héritage, une classe enfant peut avoir accès à certaines propriétés et méthodes de toutes les classes qui sont un ancêtre dans la même hiérarchie de classes. Cette technique permet entre autres de manipuler à un plus haut niveau d'abstraction les données et fonctions communes à toute une descendance de types et de gérer à un plus bas niveau d'abstraction la spécialisation des types plus bas dans la hiérarchie de classes.

#### Exemple 6.3.1 (Shapes1)

Instanciation et affichage de deux formes (`Rectangle` et `Circle`) qui héritent de la même classe parent (`Shape`).

Dans ce premier exemple, chaque instance a sa propre variable et est affichée directement à partir de celle-ci.

#### Exemple 6.3.2 (Shapes2)

Instanciation et affichage de deux formes (`Rectangle` et `Circle`) qui héritent de la même classe parent (`Shape`).

Dans ce second exemple, plusieurs instances anonymes sont stockées dans un tableau sur lequel on boucle pour les afficher.

C'est grâce au principe du polymorphisme qu'il est possible de dessiner les formes sans avoir à faire un traitement particulier selon leurs types.

Puisque les classes `Rectangle` et `Circle` héritent de `Shape`, alors ils ont une fonction '*render*' et il n'est pas nécessaire de faire la distinction entre les deux.

### Exemple 6.4

En programmation orientée objet, l'utilisation d'une hiérarchie de classes permet de travailler à différent niveau d'abstraction en fonction de quel niveau de spécialisation d'un type on a besoin, tout dépendamment du contexte. 

Par polymorphisme, il est possible de manipuler différentes instances d'objets de différents types avec une même interface, pourvu que chaque type partage un ancêtre commun. 

Ainsi, des fonctions peuvent être appelées avec exactement la même syntaxe pour plusieurs types d'objets différents et la fonction correspondant au bon type sera déterminée automatiquement. Le polymorphisme permet aussi d'organiser différentes instances de différents types ayant un ancêtre commun dans des structures de données de type collection. 

Par exemple, des références du type de l'ancêtre peuvent être conservées dans un tableau, si le nombre d'éléments est connu, ou dans une collection de type liste, si le nombre d'éléments peut varier en cours d'exécution.

#### Exemple 6.4.1 (FadingBall1)

Animation d'une boule lumineuse avec mouvement oscillatoire.

#### Exemple 6.4.2 (FadingBall2)

Animation de plusieurs boules lumineuses avec mouvement oscillatoire.

Chaque instance est gérée individuellement avec sa propre variable.

#### Exemple 6.4.3 (FadingBall3)

Animation de plusieurs boules lumineuses avec mouvement oscillatoire.

Chaque instance est stockée dans un tableau à une dimension.

#### Exemple 6.4.4 (FadingBall4)

Animation de plusieurs boules lumineuses avec mouvement oscillatoire.

Chaque instance est stockée dans une liste.

#### Exemple 6.4.5 (FadingBall5)

Animation de plusieurs boules lumineuses avec mouvement oscillatoire.

Chaque instance est stockée dans une liste et est un descendant d'une hiérarchie de classes.

Les classes sont définies directement dans le fichier où elles sont utilisées.

#### Exemple 6.4.6 (FadingBall6)

Animation de plusieurs boules lumineuses avec mouvement oscillatoire.

Chaque instance est stockée dans une liste et est un descendant d'une hiérarchie de classes.

Les classes sont définies dans des fichiers externes.

### Exemple 6.5

En programmation orientée objet, une classe peut avoir comme propriété des données primitives ainsi que des données complexes, sous forme d'instances d'autres classes. 

La relation d'association qui existe entre deux instances de classe peut prendre la forme d'une composition ou d'une agrégation. 

Avec une relation de composition, une instance d'une classe ne peut pas exister sans la présence d'une instance de l'autre classe. 

Avec une relation d'agrégation, une instance d'une classe peut exister même si l'instance de l'autre classe n'est pas confirmée au moment de la construction de l'objet.

#### Exemple 6.5.1 (Relation1_Composition)

Exemple d'une relation de composition entre 3 composantes et 1 contenant.

#### Exemple 6.5.2 (Relation2_Agregation)

Exemple d'une relation d'agrégation entre 3 composantes et 1 contenant.

### Exemple 6.6 (Typecasting)

En programmation, le '*typecasting*' est une technique qui permet de convertir une variable de type primitif ou complexe vers un autre type. 

Dans le cas des types primitifs comme les données numériques, une opération de 'cast' peut par exemple convertir un nombre entier vers un nombre réel et vice-versa.

Dans le cas des variables de types complexes, à condition que les deux types proviennent de la même hiérarchie de classes, une opération de 'cast' peut convertir une référence d'un type enfant vers un type parent ('*upcasting*') ou convertir une référence d'un type parent vers un type enfant ('*downcasting*').

Dans cet exemple, on démontre des conversions de types primitifs et complexes.

L'exemple de type complexe est une classe de type `Fruit` dont `Orange` est un descendant par héritage.

### Exemple 6.7 (BubbleSort)

En guise d'exemple de programme utilisant la programmation orientée objet, voici un programme où une animation est générée par l'exécution d'un algorithme de tri appliqué sur une séquence d'objets stockés dans une collection.

Une liste d'instances est initialisée avec une valeur numérique, puis chaque itération de l'algorithme est visualisée par l'animation du déplacement de l'élément dans la séquence. 

Lorsque le tri est terminé, les objets sont mélangés au hasard et l'animation recommence.

### Exemple 6.8 (Diaporama)

Exemple d'une animation de type diaporama où des images descendent perpétuellement de haut en bas à différents niveaux de profondeur.

Deux classes sont utilisées, soit une classe `Sprite` et une spécialisation de cette dernière appelée `Slide`. Les images de l'animation sont des instances de type `Slide`, une classe qui hérite de la classe `Sprite`, qui elle est plus générique et non-animée, mais qui a des propriétés et des méthodes utilisées par son descendant.

L'effet de profondeur est une illusion créée en modifiant l'opacité et la vélocité des images en fonction d'une position en Z. Les images sont triées en fonction de leur profondeur en Z pour que l'ordre de rendu soit visuellement correct.

### Exemple 6.9 (CellularAutomaton)

En guise d'exemple de programme utilisant la programmation orientée objet, voici un exemple d'animation inspirée des automates cellulaires. 

Le principe est qu'à chaque mise à jour de l'automate, l'état de chaque cellule est mis à jour en fonction de l'état des cellules voisines. 

Les cellules sont des instances d'une classe d'un certain type et le comportement de l'animation dépend du type de cellule. 

L'exemple présente quatre différentes spécialisations de cellules avec des règles d'évolution différentes.
