// ANI2012H22_ImageTint3.pde
// Animation de la composante alpha d'une teinte appliquée sur une image par oscillation.

// paramètres
String file = "winter.jpg";

// variables
int tintRed   = 63;
int tintGreen = 255;
int tintBlue  = 192;
int tintAlpha = 255;

PImage img;

void setup()
{
  size(640, 505);
  frameRate(60);

  // chargement de l'image en mémoire
  img = loadImage(file);
}

void draw()
{
  background(0);

  // oscillation de la composante alpha de la couleur de teinte
  tintAlpha = 128 + int(oscillate(millis(), 128.0f, 5000.0f));

  // appliquer la teinte
  tint(tintRed, tintGreen, tintBlue, tintAlpha);

  // afficher l'image teintée
  image(img, 0, 0);
}

void randomizeColor()
{
  tintRed   = int(random(256.0f));
  tintGreen = int(random(256.0f));
  tintBlue  = int(random(256.0f));
}

void keyReleased()
{
  randomizeColor();
}

void mouseReleased()
{
  randomizeColor();
}

// fonction qui permet de générer une oscillation
float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
