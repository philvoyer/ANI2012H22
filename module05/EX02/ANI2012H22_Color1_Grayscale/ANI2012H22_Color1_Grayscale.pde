// ANI2012H22_Color1_Grayscale.pde
// Programme qui génère une image en niveaux de gris avec un dégradé entre le blanc et le noir.

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
    stroke(indexX, indexX, indexX); // <- même valeur dans chaque composante de la couleur RGB

    // afficher un point avec cette couleur
    point(indexX, indexY);
  }
}
