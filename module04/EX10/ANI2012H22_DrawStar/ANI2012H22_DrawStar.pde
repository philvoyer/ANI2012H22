// ANI2012H22_DrawStar.pde
// Dessine des polygones en forme d'étoile.

int side = 5;
float angle;
float offset;
float radius;
float centerX;
float centerY;
float positionX;
float positionY;

void setup()
{
  size(512, 512);

  strokeWeight(6);
  strokeCap(ROUND);

  radius = width * 0.4f;

  centerX = width / 2.0f;
  centerY = height / 2.0f;
}

void draw()
{
  background(191);

  // aligner le premier sommet sur l'axe Y
  angle = radians(-90.0f);

  // angle entre chaque sommet
  offset = radians(360.0f / side);

  // débuter une nouvelle forme vectorielle
  beginShape();

  // boucle avec une itération pour chaque côté du polygone
  for (int index = 0; index < side; ++index)
  {
    // calculer la position du prochain sommet
    positionX = centerX + cos(angle) * radius;
    positionY = centerY + sin(angle) * radius;

    // ajouter le sommet au polygone
    vertex(positionX, positionY);

    // décalage de 2 fois l'angle entre 2 sommets
    angle += offset * 2;
  }

  // terminer et rendre la forme vectorielle
  endShape(CLOSE);
}

void keyReleased()
{
  if (key == '1')
    side = 3;
  if (key == '2')
    side = 5;
  if (key == '3')
    side = 7;
  if (key == '4')
    side = 9;
  if (key == '5')
    side = 11;
  if (key == '6')
    side = 13;
  if (key == '7')
    side = 15;
  if (key == '8')
    side = 17;
  if (key == '9')
    side = 19;
  if (key == '0')
    side = 21;
}
