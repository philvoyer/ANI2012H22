// ANI2012H22_SierpinskyCarpet.pde
// Génération d'un système fractal de type tapis de Sierpinski.
// Touches haut et bas pour changer le niveau de profondeur et 1 et 2 pour le type de primitive vectorielle.

// paramètres
boolean useRectOrEllipse = true;

int thresholdIndex = 2;
int thresholdCount = 5;
int[] thresholdList  = {2, 3, 7, 19, 57};

float resolution = 512;

color colorBack = color(31, 31, 31);
color colorFill = color(223, 223, 223);

void setup()
{
  size(512, 512);
  noLoop();
  noStroke();
  fill(colorFill);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()
{
  background(colorBack);

  // ramener l'origine au centre de la scène
  translate(width / 2.0f, height / 2.0f);

  // invocation de la fonction récursive qui sous-divise l'espace
  sierpinskyCarpet(resolution);
}

// fonction qui sous-divise récursivement un rectangle selon le principe de la forme fractale du tapis de Sierpinsky
void sierpinskyCarpet(float segment)
{
  // sous-division de l'espace
  segment = segment / 3.0f;

  // valider si le segment est plus grand ou égal au seuil minimal
  if (segment >= thresholdList[thresholdIndex])
  {
    // (1, 1) dessiner le carré en haut à gauche
    pushMatrix();
    drawShape(segment);
    translate(-segment, -segment);
    sierpinskyCarpet(segment);
    popMatrix();

    // (2, 1) dessiner le carré en haut au centre
    pushMatrix();
    drawShape(segment);
    translate(0, -segment);
    sierpinskyCarpet(segment);
    popMatrix();

    // (3, 1) dessiner le carré en haut à droite
    pushMatrix();
    drawShape(segment);
    translate(segment, -segment);
    sierpinskyCarpet(segment);
    popMatrix();

    // (2, 1) dessiner le carré centre gauche
    pushMatrix();
    drawShape(segment);
    translate(-segment, 0);
    sierpinskyCarpet(segment);
    popMatrix();

    // (2, 2) carré vide

    // (2, 3) dessiner le carré centre droit
    pushMatrix();
    drawShape(segment);
    translate(segment, 0);
    sierpinskyCarpet(segment);
    popMatrix();

    // (1, 3) dessiner le carré en bas à gauche
    pushMatrix();
    drawShape(segment);
    translate(-segment, segment);
    sierpinskyCarpet(segment);
    popMatrix();

    // (2, 3) dessiner le carré en bas au centre
    pushMatrix();
    drawShape(segment);
    translate(0, segment);
    sierpinskyCarpet(segment);
    popMatrix();

    // (3, 3) dessiner le carré en bas à droit
    pushMatrix();
    drawShape(segment);
    translate(segment, segment);
    sierpinskyCarpet(segment);
    popMatrix();
  }
}

// fonction pour dessiner une instance d'une forme vectorielle
void drawShape(float segment)
{
  if (useRectOrEllipse)
    rect(0, 0, segment, segment);
  else
    ellipse(0, 0, segment, segment);
}

void keyReleased()
{
  if (keyCode == UP)
    thresholdIndex = --thresholdIndex > 0 ? thresholdIndex : 0;
  if (keyCode == DOWN)
    thresholdIndex = ++thresholdIndex < thresholdCount - 1 ? thresholdIndex : thresholdCount - 1;

  if (keyCode == '1')
    useRectOrEllipse = true;
  if (keyCode == '2')
    useRectOrEllipse = false;

  println("threshold at index " + thresholdIndex + " is : " + thresholdList[thresholdIndex]);

  // redessiner la scène
  redraw();
}
