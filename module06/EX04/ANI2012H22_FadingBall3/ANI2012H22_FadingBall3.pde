// ANI2012H22_FadingBall3.pde
// Animation de plusieurs boules lumineuses avec mouvement oscillatoire.
// Chaque instance est stockée dans un tableau à une dimension.

// classe de type Ball
class Ball
{
  float positionX;
  float positionY;

  float radius;

  float oscillation;

  color colorFill;

  Ball(float x, float y, float r, color c)
  {
    positionX = x;
    positionY = y;

    radius = r;

    colorFill = c;
  }

  void update()
  {
    radius = oscillation;
  }

  void render()
  {
    fill(colorFill);
    ellipse(positionX, positionY, radius, radius);
  }
}

// paramètre
int period = 5000;

color colorBack = color(0);

// variables
Ball[] balls;

float centerX;
float centerY;

void setup()
{
  size(1024, 340);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  noStroke();

  balls = new Ball[7];

  balls[0] = new Ball(centerX - 384, centerY, 8,   color(255 - 8));
  balls[1] = new Ball(centerX - 256, centerY, 32,  color(255 - 16));
  balls[2] = new Ball(centerX - 128, centerY, 64,  color(255 - 32));
  balls[3] = new Ball(centerX,       centerY, 128, color(255,  64));
  balls[4] = new Ball(centerX + 128, centerY, 64,  color(255 - 32));
  balls[5] = new Ball(centerX + 256, centerY, 32,  color(255 - 16));
  balls[6] = new Ball(centerX + 384, centerY, 8,   color(255 - 8));
}

void draw()
{
  fade(2);

  balls[0].oscillation = 8   + int(oscillate(millis(), 8,   period));
  balls[1].oscillation = 32  + int(oscillate(millis(), 32,  period));
  balls[2].oscillation = 64  + int(oscillate(millis(), 64,  period));
  balls[3].oscillation = 128 + int(oscillate(millis(), 128, period));
  balls[4].oscillation = 64  + int(oscillate(millis(), 63,  period));
  balls[5].oscillation = 32  + int(oscillate(millis(), 32,  period));
  balls[6].oscillation = 8   + int(oscillate(millis(), 8,   period));

  balls[0].update();
  balls[1].update();
  balls[2].update();
  balls[3].update();
  balls[4].update();
  balls[5].update();
  balls[6].update();

  balls[0].render();
  balls[1].render();
  balls[2].render();
  balls[3].render();
  balls[4].render();
  balls[5].render();
  balls[6].render();
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
