// ANI2012H22_DrawEllipse.pde
// Dessine une séquence d'ellipses de taille décroissante.

size(512, 512);

// couleur d'arrière-plan noire
background(0);

// épaisseur du trait
strokeWeight(2);

// mode de dessin où la position (0, 0) est au centre de l'ellipse (CORNER est une autre option)
ellipseMode(CENTER);

// variable qui contient le rayon des ellipses à dessiner
float radius = 512.0f;

// variable qui contient la couleur du trait (un ton de gris aléatoire)
int colorStroke = int(random(255.0f));

// variable qui contient la couleur de remplissage (un ton de gris aléatoire)
int colorFill = int(random(255.0f));

// couleur du trait
stroke(colorStroke);

// couleur de remplissage
fill(colorFill);

// boucler tant que le rayon est plus grand que 10
while (radius > 10)
{
  // dessiner une ellipse en fonction de la position x et y de son centre, d'une largeur et d'une hauteur
  ellipse(
    width / 2.0f,
    height / 2.0f,
    radius,
    radius);

  // rendre la couleur du trait plus claire
  colorStroke += 8;

  // s'assurer de ne pas dépasser la valeur de couleur maximale (255)
  colorStroke = colorStroke <= 255 ? colorStroke : 255;

  // rendre la couleur du trait plus foncée
  colorFill -= 8;

  // s'assurer de ne pas dépasser la valeur de couleur minimale (0)
  colorFill = colorFill > 0 ? colorFill : 0;

  // réduire le rayon de 5% à chaque itération
  radius *= 0.95f;
}
