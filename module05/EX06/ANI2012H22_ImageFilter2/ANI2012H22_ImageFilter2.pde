// ANI2012H22_ImageFilter2.pde
// Exemple où un filtre de flou est appliqué sur une image avec un niveau animé par oscillation.

// paramètres
String file = "winter.jpg";

float frequency = 3000.0f;

// variables
int value;

PImage img;

void setup()
{
  size(640, 505);
  frameRate(60);

  // chargement de l'image
  img = loadImage(file);
}

void draw()
{
  // animation du niveau de filtrage par oscillation
  value = 5 + int(oscillate( millis(), 5.0f, frequency));

  // afficher l'image
  image(img, 0, 0);

  // appliquer un filtre sur l'image avec la valeur animée par oscillation
  filter(BLUR, value);
}

// fonction d'oscillation
float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
