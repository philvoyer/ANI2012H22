// ANI2012H22_Color2_RGB1.pde
// Programme qui génère une image RGB avec un dégradé de la composante rouge et verte.

// paramètre
int colorMaxValue = 256;

// variables
int indexX;
int indexY;

size(256, 256);

// configurer le mode de couleur
colorMode(RGB);

for (indexX = 0; indexX < colorMaxValue; ++indexX)
{
  for (indexY = 0; indexY < colorMaxValue; ++indexY)
  {
    // sélection de la couleur selon les indices des boucles
    stroke(indexX, indexY, 0);

    // afficher un point avec cette couleur
    point(indexX, indexY);
  }
}
