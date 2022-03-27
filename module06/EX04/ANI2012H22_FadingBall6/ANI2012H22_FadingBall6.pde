// ANI2012H22_FadingBall6.pde
// Animation de plusieurs boules lumineuses avec mouvement oscillatoire.
// Chaque instance est stockée dans une liste et est un descendant d'une hiérarchie de classes.
// Les classes sont définies dans des fichiers externes.

// paramètre
int period = 5000;

color colorBack = color(0);

// variables
int index;

float centerX;
float centerY;

ArrayList<FadingBall> list;

void setup()
{
  size(1024, 340);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  noStroke();

  list = new ArrayList<FadingBall>();

  list.add(new FadingBall(centerX - 384, centerY, 8,   color(255 - 8)));
  list.add(new FadingBall(centerX - 256, centerY, 32,  color(255 - 16)));
  list.add(new FadingBall(centerX - 128, centerY, 64,  color(255 - 32)));
  list.add(new FadingBall(centerX,       centerY, 128, color(255,  64)));
  list.add(new FadingBall(centerX + 128, centerY, 64,  color(255 - 32)));
  list.add(new FadingBall(centerX + 256, centerY, 32,  color(255 - 16)));
  list.add(new FadingBall(centerX + 384, centerY, 8,   color(255 - 8)));
}

void draw()
{
  fade(2);

  list.get(0).oscillation = 8   + int(oscillate(millis(), 8,   period));
  list.get(1).oscillation = 32  + int(oscillate(millis(), 32,  period));
  list.get(2).oscillation = 64  + int(oscillate(millis(), 64,  period));
  list.get(3).oscillation = 128 + int(oscillate(millis(), 128, period));
  list.get(4).oscillation = 64  + int(oscillate(millis(), 63,  period));
  list.get(5).oscillation = 32  + int(oscillate(millis(), 32,  period));
  list.get(6).oscillation = 8   + int(oscillate(millis(), 8,   period));

  for (index = 0; index < list.size(); ++index)
  {
    list.get(index).update();
    list.get(index).render();
  }
}

void fade(float intensity)
{
  rectMode(CORNER);
  noStroke();
  fill(colorBack, intensity);
  rect(0, 0, width, height);
}

float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
