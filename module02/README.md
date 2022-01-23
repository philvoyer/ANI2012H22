# ANI2012H22

## Module 2 : Structure

### Exemple 2.3

Dans cet exemple, nous avons un programme qui génère un bouton cliquable dans le milieu de la fenêtre d'affichage.

Différentes variables sont utilisées pour stocker les états du bouton, tels que sa position, sa largeur, sa hauteur, les coordonnées en X et Y de ses limites, son état enfoncé ou relâché avec 2 couleurs différentes et finalement un compteur de clics.

Le programme utilise des structures logiques de type **if**, **else if** et **else** pour valider les états courant avec des conditions sous forme d'expressions logiques construite avec les opérateurs **==**, **>=**, **<=**, **||** et **&&**.

L'interactivité se fait avec la souris et on utilise la position du curseur (**mouseX** et **mouseY**) pour valider si on est à l'intérieur des limites du bouton.

Le taille du bouton devient plus grande lorsque l'on passe par-dessus et plus petit lorsqu'il est enfoncé.
