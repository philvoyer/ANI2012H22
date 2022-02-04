# ANI2012H22

## Module 2 : Structure

### Exemple 2.1 (StructureLogic)

Dans ce programme, nous avons plusieurs exemples où le flot d'exécution est contrôlé par des structures logiques (**if**, **else**, **else if**, **?:** et **switch**).

### Exemple 2.2 (StructureIterative)

Dans ce programme, nous avons plusieurs exemples où le flot d'exécution est contrôlé par des structures itératives (**for** et **while**).

### Exemple 2.3 (Clicker)

Dans cet exemple, nous avons un programme qui génère un bouton cliquable dans le milieu de la fenêtre d'affichage.

Différentes variables sont utilisées pour stocker les états du bouton, tels que sa position, sa largeur, sa hauteur, les coordonnées en X et Y de ses limites, 3 états (survolé, enfoncés ou relâché) avec des couleurs différentes et finalement un compteur de clics.

Le programme utilise des structures logiques de type **if**, **else if** et **else** pour valider les états courant avec des conditions sous forme d'expressions logiques construites avec les opérateurs **==**, **>=**, **<=**, **||** et **&&**.

L'interactivité se fait avec la souris et on utilise la position du curseur (**mouseX** et **mouseY**) pour valider si on est à l'intérieur des limites du bouton.

Le bouton devient plus grand et plus clair lorsque l'on passe par-dessus et plus petit et plus foncé lorsqu'il est enfoncé.

### Exemple 2.4 (Chessboard1)

Exemple d'un programme qui fait la génération procédurale d'un échiquier.

La translation dans l'espace pour dessiner les cases est faite à partir de deux boucles **for** imbriquées.

L'alternance entre les cases blanches et noires est fait en validant si l'index en X et Y sont tous les deux sont pairs ou impairs.

Si un index est pair, alors l'opérateur de modulo **%**, qui retourne le reste de la division, va retourner 0 lorsque divisé par 2.

### Exemple 2.5 (Chessboard2)

Exemples de génération procédurale d'un échiquier avec la même approche que dans l'exemple précédent, mais avec une grille plus grande et animation de la case sélectionnée lors d'un déplacement avec les touches du clavier (flèches ou WASD).
