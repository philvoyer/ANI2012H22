// ANI2012H22_Trail2.pde
// Animation d'une traînée lumineuse en fonction d'un historique des positions précédentes du curseur.

// paramètres
int count = 100;

int offscreenPosition = -666;

int colorBack = 63;
int colorStroke = 255;

float scaleFactor = 0.75f;

// variables
int[] positionX;
int[] positionY;

int index;

void setup()
{
  size(512, 512);
  frameRate(60);

  // instancier un tableau pour stocker l'historique des coordonnées du pointeur (positions sur l'axe X et Y)
  positionX = new int[count];
  positionY = new int[count];

  // initialiser l'historique avec des positions situées à l'extérieur de la fenêtre d'affichage (volontairement invisible)
  for (index = positionX.length-1; index >= 0; --index)
  {
    positionX[index] = offscreenPosition;
    positionY[index] = offscreenPosition;
  }
}

void draw()
{
  fade(1);

  // boucler sur l'historique pour décaler d'une unité l'indice de chaque position stockée dans le tableau
  for (index = positionX.length-1; index > 0; --index)
  {
    positionX[index] = positionX[index - 1];
    positionY[index] = positionY[index - 1];
  }

  // valider si un des boutons est appuyé
  if (mousePressed == true)
  {
    // ajouter la position courante du pointeur dans les deux tableaux de l'historique
    positionX[0] = mouseX;
    positionY[0] = mouseY;
  }
  else
  {
    // ajouter à l'historique une position située à l'extérieur de la fenêtre d'affichage
    positionX[0] = offscreenPosition;
    positionY[0] = offscreenPosition;
  }

  // dessiner des points pour chaque position de l'historique
  for (index = 0; index < positionX.length; ++index)
  {
    // configurer la taille du point en fonction de son indice dans l'historique
    strokeWeight(index * scaleFactor);

    // configurer la couleur du point
    stroke(colorStroke);

    // dessiner un point à la position de l'indice courant dans l'historique
    point(positionX[index], positionY[index]);
  }
}

void fade(float intensity)
{
  rectMode(CORNER);
  noStroke();
  fill(colorBack, intensity);
  rect(0, 0, width, height);
}
