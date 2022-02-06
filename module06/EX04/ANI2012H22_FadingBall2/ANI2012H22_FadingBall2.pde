// ANI2012H22_FadingBall2.pde
// Animation de plusieurs boules lumineuses avec mouvement oscillatoire.
// Chaque instance est gérée individuellement avec sa propre variable.

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

// variables
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;

float centerX;
float centerY;

void setup()
{
  size(1024, 340);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  noStroke();

  ball1 = new Ball(centerX - 384, centerY, 8,   color(255 - 8));
  ball2 = new Ball(centerX - 256, centerY, 32,  color(255 - 16));
  ball3 = new Ball(centerX - 128, centerY, 64,  color(255 - 32));
  ball4 = new Ball(centerX,       centerY, 128, color(255,  64));
  ball5 = new Ball(centerX + 128, centerY, 64,  color(255 - 32));
  ball6 = new Ball(centerX + 256, centerY, 32,  color(255 - 16));
  ball7 = new Ball(centerX + 384, centerY, 8,   color(255 - 8));
}

void draw()
{
  fade(2);

  ball1.oscillation = 8   + int(oscillate(millis(), 8,   period));
  ball2.oscillation = 32  + int(oscillate(millis(), 32,  period));
  ball3.oscillation = 64  + int(oscillate(millis(), 64,  period));
  ball4.oscillation = 128 + int(oscillate(millis(), 128, period));
  ball5.oscillation = 64  + int(oscillate(millis(), 63,  period));
  ball6.oscillation = 32  + int(oscillate(millis(), 32,  period));
  ball7.oscillation = 8   + int(oscillate(millis(), 8,   period));

  ball1.update();
  ball2.update();
  ball3.update();
  ball4.update();
  ball5.update();
  ball6.update();
  ball7.update();

  ball1.render();
  ball7.render();
  ball2.render();
  ball6.render();
  ball3.render();
  ball5.render();
  ball4.render();
}

void fade(float decay)
{
  fill(0, decay);
  rect(0, 0, width, height);
}

float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
