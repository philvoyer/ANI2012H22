// ANI2012H22_Cantor.pde
// Génération d'un système fractal de type Cantor.

// paramètres
float offsetX = 10.0f;
float offsetY = 10.0f;

float minimum = 1.0f;

boolean directionUpOrDown;

void setup()
{
  size(1200, 320);
  noLoop();
  strokeWeight(4);
  strokeCap(SQUARE);
  noSmooth();

  // dessiner une instance de la forme fractale (1/4)
  directionUpOrDown = false;
  cantor(offsetX, offsetY, width - (offsetX * 2.0f), directionUpOrDown);

  // dessiner une instance de la forme fractale (2/4)
  directionUpOrDown = true;
  cantor(offsetX, (height / 2.0f) - offsetY, width - (offsetX * 2.0f), directionUpOrDown);

  // dessiner une instance de la forme fractale (3/4)
  directionUpOrDown = false;
  cantor(offsetX, (height / 2.0f) + offsetY, width - (offsetX * 2.0f), directionUpOrDown);

  // dessiner une instance de la forme fractale (4/4)
  directionUpOrDown = true;
  cantor(offsetX, height - offsetY, width - (offsetX * 2.0f), directionUpOrDown);
}

// fonction récursive qui sous-divise une ligne au tiers et au deux tiers
void cantor(float x, float y, float length, boolean directionUpOrDown)
{
  // condition d'arrêt de la fonction récursive
  if (length > minimum)
  {
    // dessiner une ligne
    line(x, y, x + length, y);

    // incrémenter la position en hauteur (selon la direction)
    if (directionUpOrDown)
      y -= offsetY;
    else
      y += offsetY;

    // appel récursif de la sous-division de gauche
    cantor(x, y, length / 3.0f, directionUpOrDown);

    // appel récursif de la sous-division de droite
    cantor(x + length * 2.0f / 3.0f, y, length / 3.0f, directionUpOrDown);
  }
}
