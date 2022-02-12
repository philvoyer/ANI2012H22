// ANI2012H22_DrawCurve.pde
// Affichage d'une courbe de Bézier cubique et de ses quatre points de contrôle.

// paramètre
float curveRadius = 220;

// positions des quatre points de contrôle de la courbe de Bézier
PVector p1 = new PVector(-curveRadius, 0);
PVector p2 = new PVector(-curveRadius / 2.0f, curveRadius);
PVector p3 = new PVector(curveRadius / 2.0f, curveRadius);
PVector p4 = new PVector(curveRadius, 0);

void setup()
{
  size(512, 512);
  noLoop();

  fill(192);

  println("courbe de Bézier cubique: P1=" + p1 + " P2=" + p2 + " P3=" + p3 + " P4=" + p4);
}

void draw()
{
  // repositionner l'origine de la scène par rapport à la camera
  scale(1.0f, -1.0f);
  translate(0,-height);
  translate(width / 2.0f, 0);
  translate(0, height / 3.0f);

  // dessiner les lignes à gauche et à droite de la courbe
  stroke(255, 102, 0);
  strokeWeight(2);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p3.x, p3.y, p4.x, p4.y);

  // dessiner les lignes en haut et en bas de la courbe
  strokeWeight(1);
  stroke(192, 192, 192);
  line(p2.x, p2.y, p3.x, p3.y);
  line(p4.x, p4.y, p1.x, p1.y);

  // dessiner une courbe de Bézier cubique en fonction de la position x et y de ses quatre points de contrôle
  stroke(0, 0, 0);
  strokeWeight(6);
  bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);

  // dessiner les quatre points de contrôle de la courbe
  strokeWeight(16);
  stroke(192, 0, 0);
  point(p1.x, p1.y);
  stroke(0, 192, 0);
  point(p2.x, p2.y);
  stroke(0, 0, 192);
  point(p3.x, p3.y);
  stroke(192, 0, 192);
  point(p4.x, p4.y);
  stroke(255, 255, 0);

  // dessiner l'origine de la scène (0, 0)
  strokeWeight(4);

  // dessiner l'axe X
  stroke(255, 0, 0);
  line(0.0f, 0.0f, width / 16.0f, 0.0f);

  // dessiner l'axe Y
  stroke(0, 255, 0);
  line(0.0f, 0.0f, 0.0f, height / 16.0f);

  // dessiner un point à l'origine
  strokeWeight(16);
  stroke(255, 255, 255);
  point(0.0f, 0.0f);
}
