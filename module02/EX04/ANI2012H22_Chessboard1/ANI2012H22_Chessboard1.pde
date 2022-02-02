// ANI2012H22_Chessboard1.pde
// Génération procédurale de la texture d'un échiquier.
// La translation dans l'espace pour dessiner les cases est faite à partir de deux boucles imbriquées.

size(512, 512);

// paramètres du programme
int tileCount = 8; // nombre de colonnes et de rangées

int colorBlack = 0;   // couleur des cases noires
int colorWhite = 255; // couleur des cases blanches

// affecter la résolution courante dans une variable
int resolution = width; // (ou 'height', puisqu'un échiquier est carré)

// calculer le diamètre des cases en fonction de la résolution
int tileSize = resolution / tileCount;

// pas de ligne contour pour les cases
noStroke();

// itération sur les rangées (y)
for (int indexY = 0; indexY < tileCount; ++indexY)
{
  // itération sur les colonnes (x)
  for (int indexX = 0; indexX < tileCount; ++indexX)
  {
    // sélection de la couleur de la case selon l'index des colonnes (x) et des rangées (y)
    if (indexY % 2 == 0) // le reste de la division entière (modulo %) sera zéro une fois sur deux
    {
      if (indexX % 2 == 0)
        fill(colorBlack);
      else
        fill(colorWhite);
    }
    else
    {
      if (indexX % 2 == 0)
        fill(colorWhite);
      else
        fill(colorBlack);
    }

    // dessiner la case selon le diamètre et les index courants des colonnes (x) et des rangées (y)
    rect(
      tileSize * indexX,
      tileSize * indexY,
      tileSize,
      tileSize);
  }
}
