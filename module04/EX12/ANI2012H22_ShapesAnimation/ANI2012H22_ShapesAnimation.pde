// ANI2012H22_ShapesAnimation.pde
// Animation où différentes primitives vectorielles sont dessinées avec des attributs aléatoires.

// paramètres
int colorBack = 32;
int colorFill = 255;
int colorStroke = 192;

float decay = 2.0f;
float diameter = 256.0f;
float threshold = 0.6f;

// variables
float timeElapsed;
float timeDelay;
float timeFrame;

boolean isActivePoint = true;
boolean isActiveLine = false;
boolean isActiveTriangle = false;
boolean isActiveRect = false;
boolean isActiveQuad = false;
boolean isActiveEllipse = false;
boolean isActiveArc = false;
boolean isActivePolygon = false;
boolean isActiveCurve = false;

void setup()
{
  size(960, 540);
  frameRate(60);

  timeElapsed = 0.0f;
  timeDelay = 0.0f;
  timeFrame = 0.0f;

  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()
{
  // mise à jour des variables en lien avec le temps
  timeElapsed = (millis() - timeFrame) / 1000.0f;
  timeDelay += timeElapsed;
  timeFrame = millis();

  // estompement de ce qui est déjà dessiné dans la fenêtre
  fade(decay);

  // dessiner de nouvelles formes seulement après un certain délai
  if (timeDelay > threshold)
  {
    timeDelay -= threshold;

    if (isActivePoint)
      drawPoint();
    if (isActiveLine)
      drawLine();
    if (isActiveTriangle)
      drawTriangle();
    if (isActiveRect)
      drawRectangle();
    if (isActiveQuad)
      drawQuad();
    if (isActiveEllipse)
      drawEllipse();
    if (isActiveArc)
      drawArc();
    if (isActivePolygon)
      drawPolygon();
    if (isActiveCurve)
      drawCurve();
  }
}

void drawPoint()
{
  // un point est dessiné comme une ligne de contour sans zone de remplissage
  stroke(colorStroke);

  // calculer une taille aléatoire pour le prochain point
  strokeWeight(random(1.0f, diameter));

  // dessiner un point en fonction de sa position x et y
  point(random(0.0f, 1.0f) * width, random(0.0f, 1.0f) * height);
}

void drawLine()
{
  // une ligne est dessinée comme une ligne de contour sans zone de remplissage
  stroke(colorStroke);

  // calculer une taille aléatoire pour la prochaine ligne
  strokeWeight(random(1.0f, 32.0f));

  // dessiner une ligne en fonction de la position x et y de ses deux sommets.
  line(
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, width),
    random(0.0f, height));
}

void drawTriangle()
{
  noStroke();
  fill(colorFill);

  // dessiner un triangle en fonction de la position x et y de ses trois sommets
  triangle(
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, width),
    random(0.0f, height));
}

void drawRectangle()
{
  noStroke();
  fill(colorFill);

  // dessiner un rectangle en fonction de la position x et y de son centre, d'une largeur et d'une hauteur
  rect(
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, 1.0f) * diameter,
    random(0.0f, 1.0f) * diameter);
}

void drawQuad()
{
  noStroke();
  fill(colorFill);

  // dessiner un quadrilatère en fonction de la position x et y de ses quatre sommets
  quad(
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, width),
    random(0.0f, height));
}

void drawEllipse()
{
  noStroke();
  fill(colorFill);

  // dessiner une ellipse en fonction de la position x et y de son centre, d'une largeur et d'une hauteur
  ellipse(
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, 1.0f) * diameter,
    random(0.0f, 1.0f) * diameter);
}

void drawArc()
{
  noStroke();
  fill(colorFill);

  // dessiner un arc d'ellipse en fonction de la position x et y de son centre, d'une largeur, d'une hauteur et d'un angle de début et de fin.
  arc(
    random(0.0f, width),
    random(0.0f, height),
    random(0.0f, 1.0f) * diameter,
    random(0.0f, 1.0f) * diameter,
    radians(random(32.0f, 360.0f)),
    radians(random(32.0f, 360.0f)));
}

void drawPolygon()
{
  int sideMin = 3;
  int sideMax = 12;
  int side = sideMin + int(random(0.0f, 1.0f) * (sideMax - sideMin + 1));

  float angle = 0.0f;
  float radius = 128.0f;

  float positionX;
  float positionY;

  float randomX = random(0.0f, width);
  float randomY = random(0.0f, height);

  float offset = radians(360.0f / side);

  fill(colorFill);

  beginShape();

  for (int index = 0; index < side; ++index)
  {
    positionX = randomX + cos(angle) * radius;
    positionY = randomY + sin(angle) * radius;

    vertex(positionX, positionY);

    angle += offset;
  }

  endShape(CLOSE);
}

void drawCurve()
{
  stroke(colorStroke);
  strokeWeight(3.0f);
  fill(colorFill, 64);

  // dessiner une courbe de Bézier cubique en fonction de la position x et y de ses quatre points de contrôle
  bezier(
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height,
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height,
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height,
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height);
}

void fade(float decay)
{
  rectMode(CORNER);
  noStroke();
  fill(colorBack, decay);
  rect(0, 0, width, height);
}

void keyReleased()
{
  if (key == '1')
    isActivePoint = !isActivePoint;
  if (key == '2')
    isActiveLine = !isActiveLine;
  if (key == '3')
    isActiveTriangle = !isActiveTriangle;
  if (key == '4')
    isActiveRect = !isActiveRect;
  if (key == '5')
    isActiveQuad = !isActiveQuad;
  if (key == '6')
    isActiveEllipse = !isActiveEllipse;
  if (key == '7')
    isActiveArc = !isActiveArc;
  if (key == '8')
    isActivePolygon = !isActivePolygon;
  if (key == '9')
    isActiveCurve = !isActiveCurve;
  if (key == '0')
    isActivePoint = isActiveLine = isActiveTriangle = isActiveRect = isActiveQuad = isActiveEllipse = isActiveArc = isActivePolygon = isActiveCurve = false;
  if (key == ' ')
    saveFrame("render.png");
}
