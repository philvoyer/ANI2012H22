// ANI2012H22_ImageTint1.pde
// Exemple où une teinte est appliquée sur une image.

// paramètres
String file = "winter.jpg";

int tintRed   = int(random(256));
int tintGreen = int(random(256));
int tintBlue  = int(random(256));
int tintAlpha = 255; // couleur opaque

// variable
PImage img;

void setup()
{
  size(640, 505);
  noLoop();

  // chargement de l'image en mémoire
  img = loadImage(file);
}

void draw()
{
  // appliquer la teinte
  tint(tintRed, tintGreen, tintBlue, tintAlpha);

  // afficher l'image teintée
  image(img, 0, 0);
}

void randomizeColor()
{
  tintRed   = int(random(256));
  tintGreen = int(random(256));
  tintBlue  = int(random(256));

  redraw(); // exécuter à nouveau la fonction draw()
}

void keyReleased()
{
  randomizeColor();
}

void mouseReleased()
{
  randomizeColor();
}
