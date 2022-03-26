// ANI2012H22_SierpinskyTriangle.pde
// Génération d'un système fractal de type triangle de Sierpinski.
// Touches haut et bas pour changer le niveau de profondeur.

// paramètres
int depthCurrent = 5;
int depthMax = 8;

float resolution = 512.0f;

float offset = 200.0f;

color colorBack = color(31, 31, 31);
color colorFill = color(223, 223, 223);

// variables
PVector v1;
PVector v2;
PVector v3;

void setup()
{
  size(512, 512);
  noLoop();

  // instancier et initialiser les positions des sommets du triangle
  v1 = new PVector(offset, 0.0f, 0.0f);
  v2 = new PVector(-offset, 0.0f, 0.0f);
  v3 = new PVector(0.0f, offset * sqrt(3.0f), 0.0f);
}

void draw()
{
  background(colorBack);

  // ajustement de la caméra
  scale(1.0f, -1.0f);
  translate(0.0f, -height);
  translate(width / 2.0f, 0.0f);
  translate(0.0f, height/ 5.0f);

  stroke(127, 0, 63);
  strokeWeight(6);
  noFill();

  // dessiner le triangle d'origine
  triangle(
    v1.x, v1.y,
    v2.x, v2.y,
    v3.x, v3.y);

  noStroke();
  fill(colorFill);

  println("current depth : " + depthCurrent);

  // invocation de la fonction récursive qui sous-divise le triangle
  sierpinskyTriangle(v1, v2, v3, (depthMax - depthCurrent));
}

// fonction qui sous-divise récursivement un triangle selon le principe de la forme fractale du triangle de Sierpinsky
void sierpinskyTriangle(PVector positionLowerLeft, PVector positionLowerRight, PVector positionTopCenter, int depth)
{
  if (depth < depthMax)
  {
    // incrémenter le niveau
    ++depth;

    // point au milieu du côté gauche du triangle
    PVector positionMiddleLeft = new PVector(
      positionLowerLeft.x + (positionTopCenter.x - positionLowerLeft.x) / 2.0f,
      positionLowerLeft.y + (positionTopCenter.y - positionLowerLeft.y) / 2.0f, 0.0f);

    // point au milieu du côté droit du triangle
    PVector positionMiddleRight = new PVector(
      positionLowerRight.x + (positionTopCenter.x - positionLowerRight.x) / 2.0f,
      positionLowerRight.y + (positionTopCenter.y - positionLowerRight.y) / 2.0f, 0.0f);

    // point au milieu du bas du du triangle
    PVector positionBottomCenter = new PVector(
      positionLowerLeft.x + (positionLowerRight.x - positionLowerLeft.x) / 2.0f,
      positionLowerLeft.y, 0.0f);

    // un appel récursif pour chacun des trois nouveaux triangles
    sierpinskyTriangle(positionMiddleLeft, positionMiddleRight, positionTopCenter, depth); // triangle du haut
    sierpinskyTriangle(positionLowerLeft, positionBottomCenter, positionMiddleLeft, depth); // triangle de gauche
    sierpinskyTriangle(positionBottomCenter, positionLowerRight, positionMiddleRight, depth); // triangle de droite
  }
  else
  {
    // dessiner un triangle
    triangle(
      positionLowerLeft.x, positionLowerLeft.y,
      positionLowerRight.x, positionLowerRight.y,
      positionTopCenter.x, positionTopCenter.y);
  }
}

void keyReleased()
{
  if (keyCode == UP)
    depthCurrent = ++depthCurrent < depthMax ? depthCurrent : depthMax;
  if (keyCode == DOWN)
    depthCurrent = --depthCurrent > 0 ? depthCurrent : 0;

  // redessiner la scène
  redraw();
}
