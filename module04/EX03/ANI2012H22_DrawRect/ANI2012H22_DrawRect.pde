// ANI2012H22_DrawRect.pde
// Dessine une séquence de rectangles de taille décroissante.

size(512, 512);

// couleur d'arrière-plan noire
background(0);

// mode de dessin où la position (0, 0) est au centre du rectangle (CORNER est une autre option)
rectMode(CENTER);

// variable qui contient le diamètre des rectangles à dessiner
float diameter = 512;

// épaisseur du trait
strokeWeight(2);

// variable qui contient la couleur du trait (un ton de gris aléatoire)
int colorStroke = int(random(255.0f));

// variable qui contient la couleur de remplissage (un ton de gris aléatoire)
int colorFill = int(random(255.0f));

// couleur du trait
stroke(colorStroke);

// couleur de remplissage
fill(colorFill);

// boucler tant que le diamètre est plus grand que 10
while (diameter > 10)
{
  // dessiner un rectangle en fonction de la position x et y de son centre, d'une largeur et d'une hauteur
  rect(
    width / 2.0f,
    height / 2.0f,
    diameter,
    diameter);

  // rendre la couleur du trait plus claire
  colorStroke += 8;

  // s'assurer de ne pas dépasser la valeur de couleur maximale (255)
  colorStroke = colorStroke < 255 ? colorStroke : 255;

  // rendre la couleur du trait plus foncée
  colorFill -= 8;

  // s'assurer de ne pas dépasser la valeur de couleur minimale (0)
  colorFill = colorFill > 0 ? colorFill : 0;

  // réduire le diamètre de 5% à chaque itération
  diameter *= 0.95f;
}
