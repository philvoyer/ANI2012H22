// ANI2012H22_ImageFilter3.pde
// Exemple où différents filtres animés par oscillation sont appliqués sur une image (touches 1-6).

// paramètres
String file = "winter.jpg";

float frequency = 3000.0f;

boolean isAnimated = true;

// variables

int activeFilterMode;

float filterLevel;

PImage img;

void setup()
{
  size(640, 505);
  frameRate(60);

  // chargement de l'image
  img = loadImage(file);

  // choisir un filtre au hasard
  setFilterMode(int(random(1.0f, 7.0f)));
}

void draw()
{
  // afficher l'image
  image(img, 0, 0, width, height);

  switch (activeFilterMode)
  {
    case 1:
      filter(INVERT);
      break;
    case 2:
      filter(GRAY);
      break;
    case 3:
      filter(ERODE);
      break;
    case 4:
      filter(DILATE);
      break;
    case 5:
      if (isAnimated)
        filterLevel = max(2.0f, 16.0f + int(oscillate(millis(), 16.0f, frequency * 4.0f)));
      else
        filterLevel = 4.0f;
      filter(POSTERIZE, filterLevel);
      break;
    case 6:
      if (isAnimated)
        filterLevel = 4.0f + int(oscillate(millis(), 4.0f, frequency));
      else
        filterLevel = 2.0f;
      filter(BLUR, filterLevel);
      break;
  }

  if (isAnimated)
    println("<filter level: " + filterLevel + ">");
}

void setFilterMode(int filterMode)
{
  activeFilterMode = filterMode < 0 ? 0 : filterMode > 6 ? 6: filterMode;

  switch (activeFilterMode)
  {
    case 1:
      println("blend mode: INVERT");
      break;
    case 2:
      println("blend mode: GRAY");
      break;
    case 3:
      println("blend mode: ERODE");
      break;
    case 4:
      println("blend mode: DILATE");
      break;
    case 5:
      println("blend mode: POSTERIZE");
      break;
    case 6:
      println("blend mode: BLUR");
      break;
  }
}

// fonction d'interactivité au clavier
void keyReleased()
{
  if (key == '1')
    setFilterMode(1);
  if (key == '2')
    setFilterMode(2);
  if (key == '3')
    setFilterMode(3);
  if (key == '4')
    setFilterMode(4);
  if (key == '5')
    setFilterMode(5);
  if (key == '6')
    setFilterMode(6);
  if (key == ' ')
    isAnimated = !isAnimated;
}

void mouseReleased()
{
  // choisir un filtre au hasard
  setFilterMode(int(random(1.0f, 7.0f)));
}

// fonction d'oscillation
float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
