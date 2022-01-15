# ANI2012H22

## Module 1 : Primitive

### Exemple 1.1

Un programme peut afficher des données dans une console sous forme textuelle.

La console est un outil pour aider les programmeurs à observer ce qui se passe lors de l'exécution d'un programme grâce à des traces sous forme de texte.

Ces traces sont laissées par des fonctions comme **print** et **println** qui sont placées à des endroits stratégiques du flot d'exécution d'un programme.

La console est aussi un endroit où de l'information peut être affichée en cas d'erreurs ou de plantage d'un programme lors de son exécution.

Le texte à afficher dans la console peut avoir pour source une combinaison de chaînes de caractères sous forme littérale et de valeurs de variables converties en chaîne de caractères.

Dans cet exemple, le message *hello world* est affiché dans la console de l'éditeur de *Processing* de 4 manières différentes.

### Exemple 1.2

Un programme symbolise les données avec lesquelles il travaille sous forme de variables.

Une variable fait l'association entre un identifiant et une valeur d'un certain type.

Un type de données peut être primitif, par exemple une valeur numérique, ou encore être un type complexe, c'est-à-dire un type défini par une classe.

Des exemples de types primitifs sont les variables booléennes (**boolean**), les caractères (**char**), les nombres entiers (**int**), les nombres réels à simple précision (**float**) et les nombres réels à double précision (**double**).

Des exemples de types complexes sont les classes offertes par *Processing*, par exemple **PVector**, **PImage** et **PFont**.

Dans cet exemple, différentes variables primitives et complexes sont déclarées et initialisées, puis leurs valeurs sont affichées dans la console.

### Exemple 1.3

Un programme peut manipuler des valeurs numériques de différents types (**int**, **float**, **double**) avec des opérateurs mathématiques tels que l'addition (**+**), la soustraction (**-**) la multiplication (**\***) et la division (**/** pour la partie entière et **%** pour le reste de la division).

Dans cet exemple, différentes variables numériques sont déclarées et initialisées avec des valeurs entières (**int**), réelles à simple précision (**float**) et réelles à double précision (**double**).

Ensuite, différentes opérations mathématiques sont effectuées à partir de ces variables et le résultat est affiché dans la console.

À travers 20 exemples, l'objectif est de démontrer le fonctionnement des opérateurs de calcul de base (**+**, **-**, **\***, **/**, **%**) et de comprendre le comportement de ces opérations en fonction du type des variables numériques et de la préséance des opérateurs (d'abord le contenu entre parenthèses, puis les multiplications et les divisions, ensuite les additions et les soustractions).

Cet exemple démontre aussi comment créer une constante avec le mot clé **final**, c'est-à-dire une variable immuable, dont la valeur ne peut plus être changée après initialisation.

### Exemple 1.4

Un programme peut dessiner des primitives vectorielles telles que des lignes, des rectangles et des ellipses.

Le dessin est effectué par des fonctions qui reçoivent en paramètre des données telles que des positions et des dimensions.

Chaque appel de ces fonctions va dessiner une nouvelle instance de la primitive vectorielle.

Dans cet exemple, une image est générée à partir de quelques appels de différentes fonctions de dessin de primitives vectorielles et le contenu de la fenêtre d'affichage est ensuite sauvegardé dans un fichier image de type *.png*.

### Exemple 1.5

Un programme peut rendre une animation en temps réel s'il possède au moins une fonction d'initialisation et une fonction de mise à jour de l'affichage qui est appelée périodiquement.

Une animation peut être considérée comme étant en temps réel lorsque le temps écoulé entre chaque image (*frame*) est suffisamment rapide pour que l'oeil humain ne voie presque plus que ce n'est qu'une séquence d'images.

Au minimum, il faut au moins 12-15 images par seconde pour qu'une animation commence à sembler être en temps réel.

Au cinéma, on a généralement du 24 ou 48 images secondes, cependant ce n'est pas vraiment considéré comme de l'animation temps réel puisque les images sont prédéfinies et rendues d'avance.

Dans les véritables animations temps réel interactives, par exemple les jeux vidéo, la cadence de rafraichissement de l'animation est généralement au moins de 30 et de préférence à 60 images par secondes.

Dans cet exemple, nous avons un programme minimaliste avec une fonction d'initialisation et une fonction de mise à jour qui contrôle la boucle de rendu.

Le programme incrémente une variable à chaque itération de cette fonction et affiche sa valeur au centre de la fenêtre d'affichage.

Par défaut, le programme s’exécute à 60 images par seconde, mais la cadence de rafraichissement peut être modifiée selon la valeur du paramètre de la fonction **frameRate**.

### Exemple 1.6

Un programme peut importer une image en mémoire à partir d'un fichier externe pour ensuite la dessiner dans la fenêtre d'affichage.

Dans cet exemple, le programme fait l'importation et l'affichage d'une image bien cadrée sur la résolution de la fenêtre d'affichage.

Le fichier image doit se trouver dans un répertoire appelé *data* situé au même endroit que le fichier source (*.pde*).

Les données du fichier image sont importées en mémoire dans une instance de **PImage**, une classe de *Processing* pour la gestion d'images.

Une classe est une spécification des propriétés (variables) et des méthodes (fonctions) qui caractérisent un type de donnée. Une classe permet donc de créer des instances indépendantes d'objets d'un certain type, comme dans ce cas, une image.

### Exemple 1.7

Un programme peut importer une police de caractères présente sur l'ordinateur où il est exécuté pour ensuite l'utiliser afin d'afficher du texte à l'écran.

Afin de garantir que la police de caractères s'affiche correctement sur un ordinateur où elle n'est pas présente, un sous-ensemble de ses caractères peut être encodé dans un fichier conservé dans les ressources du programme (fichier *.vlw* avec *Processing*).

Dans cet exemple, la police de caractères *HelveticaNeue* est chargée en mémoire dans une instance de la classe **PFont** et elle est ensuite utilisée pour afficher le nom de la police de caractères au centre de la fenêtre d'affichage.

### Exemple 1.8

Un programme peut utiliser les événements du clavier comme source d'interactivité.

Dans cet exemple, les événements du clavier sont utilisés pour afficher interactivement du texte dans la fenêtre d'affichage selon que l'état des touches observées soit enfoncé ou relâché.

Les touches observées sont les flèches du clavier (haut, bas, gauche, droite), les touches WASD en minuscule et en majuscule ainsi que la barre d'espacement.

### Exemple 1.9

Un programme peut utiliser les événements de la souris comme source d'interactivité.

Dans cet exemple, les événements de la souris sont utilisés pour afficher interactivement du texte dans la fenêtre d'affichage en fonction de la position et du mouvement du curseur et selon l'état enfoncé ou relâché de ses boutons.

### Exemple 1.10

Un programme peut animer le mouvement d'un élément visuel en fonction d'événements interactifs.

Dans cet exemple, les événements du clavier et de la souris sont utilisés pour déplacer la position d'une image dans la fenêtre d'affichage.

Le clavier permet de déplacer l'image dans en direction des flèches, avec une vélocité constante à chaque mise à jour.

La souris permet de déplacer l'image à la position du curseur lorsqu'un de ses boutons est enfoncé.
