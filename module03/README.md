# ANI2012H22

## Module 3 : Fonction

### Exemple 3.1

Exemples de déclarations et d'invocations de fonctions simples qui encapsulent des calculs mathématiques.

La plupart des fonctions reçoivent des nombres entiers en argument et retournent un nombre entier comme résultat.

### Exemple 3.2

Démonstration de différentes techniques pour générer des nombres aléatoires entiers ou réels.

Les nombres aléatoires permettent d'initialiser et de modifier les attributs d'une animation pour la rendre moins prévisible.

### Exemple 3.3

Une fonction récursive est une fonction qui s'appelle elle-même.

Une fonction peut s'invoquer elle-même, mais seulement si elle a une condition d'arrêt qui dépend de la valeur de ses paramètres, à défaut de quoi l'exécution pourrait tomber dans une boucle infinie.

Voici 3 exemples de fonctions récursives :

- Exemple d'une fonction récursive qui retourne la factorielle d'un nombre entier. La factorielle est le produit (multiplication) entre tous les nombres entiers positifs inférieurs ou égaux au nombre passé en paramètre.

- Exemple d'une fonction récursive qui retourne le n-ième terme de la suite de Fibonacci. Un terme de la suite de Fibonacci est la somme des deux termes précédents de la suite pour tout nombre entier plus grand que 1

- Exemple d'une fonction récursive qui génère une boucle infinie, car elle n'a pas de condition de sortie.

### Exemple 3.4

Exemple d'utilisation d'une fonction pour générer l'animation d'un estompement progressif en pleine fenêtre.

L’estompement progressif est une animation où tout ce qui est dessiné dans la fenêtre disparait progressivement à chaque mise à jour de l’affichage pour finalement converger vers la couleur d’arrière-plan de la scène.

Cet effet visuel est plutôt facile à réaliser et fait en sorte que le contenu de la fenêtre d'affichage change ou disparait progressivement au fil du temps.

L'astuce est de ne pas effacer le contenu de la fenêtre d'affichage à chaque frame au début de la fonction *draw* et de plutôt dessiner un rectangle semi-transparent par-dessus tout le contenu de la fenêtre comme dernière étape de la fonction.

Cet effet peut être ajouté assez facilement par-dessus n'importequel type de contenu visuel.

Cette technique sera entre autres utilisée dans certains des exemples du cours pour créer un effet de persistance visuelle des éléments rendus dans la fenêtre d'affichage.

### Exemple 3.5

Dans cet exemple, animation des résultats de différents exemples de boucles et utilisation de fonctions mathématiques de base.

Le résultat de chaque boucle est encodé dans un dégradé de couleur, puis il est conservé dans un tableau à deux dimensions.

Le tableau est animé avec un décalage des cases sur l'axe des colonnes qui vont boucler de manière perpétuelle.

### Exemple 3.6

Les chaînes de caractères sont un bon exemple d'application des tableaux.

Chaque chaîne de caractères est une instance de **String**, une classe qui offre plusieurs fonctions pour construire et manipuler des données sous forme textuelle. 

Une chaîne de caractères est aussi une structure de données où les caractères sont stockés dans une séquence ordonnée accessible à partir d'un indice dans un tableau à une dimension.

Dans cet exemple, démonstration de différentes techniques pour créerr et manipuler des chaînes de caractères.

### Exemple 3.7

Génération d'une grille avec animation de la case sélectionnée et possibilité de changer le contenu des cases avec le clavier et la souris.
