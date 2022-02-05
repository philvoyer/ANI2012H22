// ANI2012H22_Color3_RGB2.pde
// Programme qui génère une image RGB avec trois variations de dégradé (touches 1, 2, 3).

// paramètre
int colorMaxValue = 512;

// variables
boolean regenerate;

int indexX;
int indexY;

int mode;

void setup()
{
  size(512, 512);

  regenerate = true;

  // choisir le mode 1, 2 ou 3 au hasard
  mode = int(random(1.0f, 4.0f));

  // configurer le mode de couleur
  colorMode(RGB);
}

void draw()
{
  if (regenerate == true)
  {
    generateGradient();
    regenerate = false;
  }
}

void generateGradient()
{
  for (indexX = 0; indexX < colorMaxValue; ++indexX)
  {
    for (indexY = 0; indexY < colorMaxValue; ++indexY)
    {
      // sélectionner la couleur selon les indices des boucles et le mode courant
      // mapping de l'intervalle de couleur (256) sur la résolution de la fenêtre d'affichage (512)
      switch (mode)
      {
        case 1: // génération d'un dégradé de rouge et vert
          stroke(
            map(indexX, 0, colorMaxValue, 0, 255),  // rouge
            map(indexY, 0, colorMaxValue, 0, 255),  // vert
            0);                                     // bleu
          break;

        case 2: // génération d'un dégradé de rouge et bleu
          stroke(
            map(indexX, 0, colorMaxValue, 0, 255),  // rouge
            0,                                      // vert
            map(indexY, 0, colorMaxValue, 0, 255)); // bleu
          break;

        case 3: // génération d'un dégradé de vert et bleu
          stroke(
            0,                                      // rouge
            map(indexX, 0, colorMaxValue, 0, 255),  // vert
            map(indexY, 0, colorMaxValue, 0, 255)); // bleu
          break;
      }

      // afficher un point avec cette couleur
      point(indexX, indexY);
    }
  }
}

void keyReleased()
{
  if (key == '1')
  {
    mode = 1;
    regenerate = true;
    println("ex1: dégradé de 2 composantes de couleur (rouge et vert)");
  }

  if (key == '2')
  {
    mode = 2;
    regenerate = true;
    println("ex2: dégradé de 2 composantes de couleur (rouge et bleu)");
  }

  if (key == '3')
  {
    mode = 3;
    regenerate = true;
    println("ex3: dégradé de 2 composantes de couleur (vert et bleu)");
  }
}
