// ANI2012H22_ImageFilter1.pde
// Exemple où un filtre différent est appliqué en alternance selon le signe d'une variable numérique animée par oscillation.

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
  value = int(oscillate(millis(), 16.0f, frequency));

  // afficher l'image
  image(img, 0, 0);

  // appliquer un filtre sur l'image affichée selon le signe de la valeur animée par oscillation
  if (value < 0)
    filter(INVERT);
  else
    filter(GRAY);
}

// fonction d'oscillation
float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
