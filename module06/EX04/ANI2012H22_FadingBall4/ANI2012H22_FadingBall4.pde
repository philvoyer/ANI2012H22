// ANI2012H22_FadingBall4.pde
// Animation de plusieurs boules lumineuses avec mouvement oscillatoire.
// Chaque instance est stockée dans une liste.

// paramètre
int period = 5000;

// variables
ArrayList<Ball> list;

float centerX;
float centerY;

int index;

void setup()
{
  size(1024, 340);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  noStroke();

  list = new ArrayList<Ball>();

  list.add(new Ball(centerX - 384, centerY, 8,   color(255 - 8)));
  list.add(new Ball(centerX - 256, centerY, 32,  color(255 - 16)));
  list.add(new Ball(centerX - 128, centerY, 64,  color(255 - 32)));
  list.add(new Ball(centerX,       centerY, 128, color(255,  64)));
  list.add(new Ball(centerX + 128, centerY, 64,  color(255 - 32)));
  list.add(new Ball(centerX + 256, centerY, 32,  color(255 - 16)));
  list.add(new Ball(centerX + 384, centerY, 8,   color(255 - 8)));
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

  for (index = 0; index < list.size() ; ++index)
  {
    list.get(index).update();
    list.get(index).render();
  }
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

void fade(float decay)
{
  fill(0, decay);
  rect(0, 0, width, height);
}

float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
