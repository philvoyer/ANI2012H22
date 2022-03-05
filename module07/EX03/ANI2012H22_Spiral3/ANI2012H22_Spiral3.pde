// ANI2012H22_Spiral3.pde
// Technique similaire à l'exemple Spiral2 mais avec variation aléatoire de la valeur incrémentale de l'angle et de l'amplitude.

// paramètres
int duration = 500;

float radius = 32.0f;
float offsetAngle = 0.5f;
float offsetAmplitude = 0.5f;

boolean randomOffset = true;

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

  if (randomOffset)
  {
    offsetAngle = random(0.1f, 5.0f);
    offsetAmplitude = random(0.25f, 2.0f);
  }
}

void draw()
{
  positionX = centerX + cos(angle) * amplitude;
  positionY = centerY + sin(angle) * amplitude;

  ellipse(positionX, positionY, radius, radius);

  angle += offsetAngle;
  amplitude += offsetAmplitude;

  if (++frame >= duration)
    setup();
}
