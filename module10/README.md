# ANI2012H22

## Module 10 : Aller plus loin

### Exemple 10.1 (Variable)

Cet exemple présente une comparaison des points en commun au niveau sémantique et des différences mineures au niveau syntaxique entre trois différents langages de programmation (**Java** + **Processing**, **C#** + **Unity** et **Python** + **Maya**) par rapport à l'utilisation de variables et des types de données primitifs.

### Exemple 10.2 (Logic)

Cet exemple présente une comparaison des points en commun au niveau sémantique et des différences mineures au niveau syntaxique entre trois différents langages de programmation (**Java** + **Processing**, **C#** + **Unity** et **Python** + **Maya**) par rapport à l'utilisation de structures de contrôle logiques.

### Exemple 10.3 (Iteration)

Cet exemple présente une comparaison des points en commun au niveau sémantique et des différences mineures au niveau syntaxique entre trois différents langages de programmation (**Java** + **Processing**, **C#** + **Unity** et **Python** + **Maya**) par rapport à l'utilisation de structures de contrôle itératives.

### Exemple 10.4 (Array)

Cet exemple présente une comparaison des points en commun au niveau sémantique et des différences mineures au niveau syntaxique entre trois différents langages de programmation (**Java** + **Processing**, **C#** + **Unity** et **Python** + **Maya**) par rapport à l'utilisation de tableau d’une, deux ou trois dimensions (*array*).

### Exemple 10.5 (Type)

Cet exemple présente une comparaison des points en commun au niveau sémantique et des différences mineures au niveau syntaxique entre trois différents langages de programmation (**Java** + **Processing**, **C#** + **Unity** et **Python** + **Maya**) par rapport à l'utilisation de classes pour créer des nouveaux types de données.

### Exemple 10.6 (Python + Maya)

#### Exemple 10.6.1 ()
#### Exemple 10.6.2 ()
#### Exemple 10.6.3 ()
#### Exemple 10.6.4 ()
#### Exemple 10.6.5 ()
#### Exemple 10.6.6 ()
#### Exemple 10.6.7 ()
#### Exemple 10.6.8 ()
#### Exemple 10.6.9 ()

### Exemple 10.7 (C# + Unity)

#### Exemple 10.7.1 (RotatingCube)

Un script **C#** peut permettre de faire de la programmation avec la technologie **Unity**.

Exemple d'une scène minimaliste dans **Unity**, avec une caméra qui regarde en direction d'un cube qui tourne et dont l'animation est contrôlée par un script **C#**.

#### Exemple 10.7.2 (CubePrefab)

Dans cet exemple, nous faisons la démonstration de l'utilisation du concept de '*prefab*', c'est-à-dire un fichier de contenu externe au projet **Unity** qui peut être chargé dans une scène puis instancié par programmation.

Le *prefab* est tout simplement un cube dont la géométrie a été générée dans **Maya** à partir d'un des scripts **Python** de l'exemple précédent.

La géométrie du cube a ensuite été exportée dans un fichier avec l'extension *.fbx*, soit le format de fichier le plus approprié pour échanger du contenu entre **Maya** et **Unity**.

#### Exemple 10.7.3 (Chessboard)

Cet exemple présente une scène **Unity** où un échiquier est généré par programmation à partir de deux *prefabs* et d'un script **C#**.

La scène peut être animée par oscillation et différentes interactivités au clavier permettent de déplacer la case active, changer le point de vue et la distance de la caméra ainsi que de régénérer des grilles de différentes résolutions.

#### Exemple 10.7.4 (Timeline)

Démonstration d'une animation construite à partir de l'éditeur de ligne de temps de *Unity*.

L'exemple vise à démontrer comment l'éditeur de ligne de temps permet de structurer une animation en plusieurs couches, avec des activations, des désactivations et des séquences de poses clés sur différents éléments de la scène.

La scène contient une sphère, un cube, un cylindre et un système de particules.

Un script *C#* permet d'atteindre directement les différentes sections de l'animation avec les touches numériques du clavier (1 à 7).

#### Exemple 10.7.5 (PressAnyKeyBird)

Animation d'un oiseau qui appuie sur des boutons en fonction de l'interactivité de l'utilisateur ou en mode automatique si aucune action.

L'oiseau est construit avec une structure hiérarchique composée de primitives géométriques (sphères et cylindres).

Il peut être commandé à partir du clavier (boutons Q, W, E, D, C, X, Z, A et SPACE) ou par un clic de souris directement sur un bouton.

Lorsqu'aucune action n'est faite pendant un laps de temps, l'oiseau tombe en mode automatique et son comportement est déterminé au hasard.

Les boutons sont animés directement partir de l'éditeur d'animation de *Unity* avec des poses clés sur la proportion.

#### Exemple 10.7.6 (Crane)

Animation d'une grue avec un aimant magnétique qui permet d'interagir avec des boîtes.

La grue est construite avec une structure hiérarchique composée de primitives géométriques (sphères, cylindres et cubes).

Différentes actions au clavier permettent d'animer la grue : rotation (A, D, gauche, droit), avancer et reculer (W, S, haut, bas), monter et descendre (Q, E).

L'exemple vise à démontrer comment des interpolations de position et de rotation peuvent être utilisées pour animer de manière interactive des structures hiérarchiques.

Le champ magnétique de l'aimant est activé lorsque la touche SPACE est enfoncée.

Les boîtes sont animées par le simulateur de physique de *Unity*.

#### Exemple 10.7.7 (PushingCube)

Exemple de projet Unity d'un petit jeu où le joueur doit pousser les boîtes en bas du plancher avant que l’adversaire ne lui enlève tous ses points de vie.

On y trouve entre autres : un avatar contrôlé au clavier par le joueur, un avatar contrôlé par une intelligence artificielle pour l'adversaire, des objets de scène avec un comportement physique, de la détection de collision, un système de points de vie et un système de pointage.

#### Exemple 10.7.8 (Tower)

Animation de 4 tours avec des armes différentes (balles, canon, laser et flammes).

La première tour lance des balles de fusil, la seconde des boulets de canon, la troisième des lasers et la quatrième des flammes sous forme de systèmes de particules.

Chaque tour peut être animée individuellement (haut, bas, gauche, droit) et les projectiles sont lancés avec la touche SPACE ou un clic de souris.

#### Exemple 10.7.9 (TVBoxMan)

Animation d'un bipède à partir d'une séquence de capture de mouvement.

Le bipède est modélisé dans *Maya* à partir d'un maillage géométrique et d'un squelette d'animation avec une relation de skinning souple.

La séquence de capture de mouvement est sous-divisée en plusieurs animations qui sont séquencées à partir d'une machine à états.
