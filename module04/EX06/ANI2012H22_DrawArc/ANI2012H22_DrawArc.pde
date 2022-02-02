// ANI2012H22_DrawArc.pde
// Dessine une séquence d'arcs d'ellipse avec un angle croissant.

size(1280, 128);

// couleur du trait
stroke(31);

// épaisseur du trait
strokeWeight(4);

// mode de dessin où la position (0, 0) est au centre de l'ellipse (CORNER est une autre option)
ellipseMode(CENTER);

// valeur de décalage pour chaque itération de la boucle
float offset = width / 12.0f;

// boucler pendant 12 itérations
for (int index = 1; index <= 12; ++index)
{
  // dessiner un arc d'ellipse en fonction de la position x et y de son centre, d'une largeur, d'une hauteur et d'un angle de début et de fin
  arc(
    index * offset - offset / 2.0f,
    height / 2.0f,
    height * 0.6f,
    height * 0.6f,
    0.0f,
    index * radians(360.0f / 12.0f));
}
