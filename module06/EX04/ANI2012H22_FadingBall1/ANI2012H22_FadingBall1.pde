// ANI2012H22_FadingBall1.pde
// Animation d'une boule lumineuse avec mouvement oscillatoire.

// paramètres
float amplitude = 256.0f;
float period = 5000.0f;

color colorBack = color(0);

// variables
Ball ball;

float centerX;
float centerY;

void setup()
{
  size(512, 512);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  noStroke();

  ball = new Ball(centerX, centerY, 256, color(224));
}

void draw()
{
  fade(8);

  ball.oscillation = 256 + int(oscillate(millis(), amplitude, period));

  ball.update();
  ball.render();
}

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
