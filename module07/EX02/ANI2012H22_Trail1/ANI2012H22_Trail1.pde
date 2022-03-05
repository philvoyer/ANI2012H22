// ANI2012H22_Trail1.pde
// Animation d'une traînée lumineuse en fonction de la position courante du curseur.

// paramètres
int colorBack = 63;
int colorStroke = 255;

float radius = 127;

void setup()
{
  size(512, 512);
  frameRate(60);
}

void draw()
{
  noStroke();

  fade(1);

  // valider si un des boutons est appuyé
  if (mousePressed == true)
  {
    // configurer les paramètres de dessin
    strokeWeight(radius);
    stroke(colorStroke);

    // dessiner un point à la position courante du curseur
    point(mouseX, mouseY);
  }
}

void fade(float decay)
{
  noStroke();
  fill(colorBack, decay);
  rect(0, 0, width, height);
}
