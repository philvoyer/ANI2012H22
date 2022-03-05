// ANI2012H22_Trail3.pde
// Animation d'une traînée lumineuse en fonction de la position courante et précédente du curseur avec une variation de la taille en fonction de la vitesse de déplacement.

// paramètres
int colorBack = 63;
int colorStroke = 255;

float radius = 6.0f;
float easing = 0.1f;

// variables
float positionX;
float positionY;

float previousX;
float previousY;

float targetX;
float targetY;

float weight;

void setup()
{
  size(512, 512);
  frameRate(60);
}

void draw()
{
  fade(1);

  // la position de destination vers laquelle converge la traînée lumineuse est la position courante du curseur
  targetX = mouseX;
  targetY = mouseY;

  // déplacement en fonction d'une fraction de la distance vers la position de destination
  positionX += (targetX - previousX) * easing;
  positionY += (targetY - previousY) * easing;

  // valider si un des boutons de la souris est appuyé
  if (mousePressed == true)
  {
    // mesurer la distance entre la position courante et précédente
    weight = dist(positionX, positionY, previousX, previousY);

    // configurer les paramètres de dessin
    strokeWeight(weight * radius);
    stroke(colorStroke);

    // dessiner une ligne entre la position courante et précédente
    line(positionX, positionY, previousX, previousY);
  }

  // configurer la position précédente de la prochaine mise à jour
  previousY = positionY;
  previousX = positionX;
}

void fade(float decay)
{
  noStroke();
  fill(colorBack, decay);
  rect(0, 0, width, height);
}
