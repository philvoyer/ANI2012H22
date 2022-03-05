// ANI2012H22_Spiral2.pde
// Technique similaire à l'exemple 'Spiral1' mais avec animation, variation de couleur et réinitialisation après un certain délai.
// Puisque l'angle n'est pas réinitialisé à chaque séquence, une légère variation d'orientation se dessine à chaque itération.

// paramètres
int duration = 480;

float radius = 32.0f;

float offset = 0.5f;

// variables
float angle;
float amplitude;

float positionX;
float positionY;

float centerX;
float centerY;

int frame;

void setup()
{
  size(512, 512);
  ellipseMode(CENTER);
  stroke(random(0.0f, 256.0f));
  fill(random(0.0f, 256.0f));

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  frame = 0;
  amplitude = 0;
}

void draw()
{
  positionX = centerX + cos(angle) * amplitude;
  positionY = centerY + sin(angle) * amplitude;

  ellipse(positionX, positionY, radius, radius);

  angle += offset;
  amplitude += offset;

  if (++frame >= duration)
    setup();
}
