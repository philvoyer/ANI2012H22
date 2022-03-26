// ANI2012H22_Mandelbrot.pde
// Génération d'un système fractal de type Mandelbrot.

// paramètres
int depthCurrent = 16;
int depthMax = 32;

float minimumX = -3.0f;
float minimumY = -1.25f;

float sizeX = 5.0f;
float sizeY = 2.5f;

float scaleX = 0.1f;
float scaleY = 0.1f;

float colorVariation = 0.1f;

float infinity = 10.0f;

color colorBack = color(31, 31, 31);

// variables
int depth;

float x;
float y;

float a;
float b;

float ab2;

float squaredA;
float squaredB;

float maximumX;
float maximumY;

float deltaX;
float deltaY;

float ratioX;
float ratioY;

color colorRandom;

void setup()
{
  size(960, 540);
  noLoop();
}

void draw()
{
  println("current depth : " + depthCurrent);

  // invocation de la fonction récursive qui calcule la forme fractale de Mandelbrot
  mandelbrot();
}

// fonction qui calcule la forme fractale de Mandelbrot
void mandelbrot()
{
  maximumX = minimumX + sizeX;
  maximumY = minimumY + sizeY;

  deltaX = (maximumX - minimumX) / width;
  deltaY = (maximumY - minimumY) / height;

  ratioX = width / (float) height;
  ratioY = height / (float) width;

  colorRandom = color(
    int(random(255)),
    int(random(255)),
    int(random(255)));

  // lire tous les pixels de la fenêtre d'affichage
  loadPixels();

  y = minimumY;

  // boucler sur les rangées de pixels
  for (int j = 0; j < height; ++j)
  {
    x = minimumX;

    // boucler sur les colonnes de pixels
    for (int i = 0;  i < width; ++i)
    {
      a = x;
      b = y;

      depth = 0;

      // itération jusqu'à une convergence vers l'infinie (un seuil fixe) ou un nombre maximal d'itérations
      while (depth < depthCurrent)
      {
        squaredA = a * a;
        squaredB = b * b;

        ab2 = a * b * 2.0f;

        a = squaredA - squaredB + x;
        b = ab2 + y;

        if (squaredA + squaredB > infinity)
          break;

        ++depth;
      }

      // déterminer la couleur du pixel
      if (depth == depthCurrent)
      {
        pixels[j * width + i] = colorBack;
      }
      else
      {
        pixels[j * width + i] = color(
          depth *   red(colorRandom) * colorVariation % 255,
          depth * green(colorRandom) * colorVariation % 255,
          depth *  blue(colorRandom) * colorVariation % 255);
      }
      x += deltaX;
    }
    y += deltaY;
  }

  // écrire tous les pixels de la fenêtre d'affichage
  updatePixels();
}

void keyReleased()
{
  if (keyCode == UP)
    depthCurrent = ++depthCurrent < depthMax ? depthCurrent : depthMax;
  if (keyCode == DOWN)
    depthCurrent = --depthCurrent > 0 ? depthCurrent : 0;

  redraw();
}
