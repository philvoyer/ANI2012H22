// ANI2012H22_BlendColor.pde
// Démonstration du comportement de différents modes de composition de couleurs.
// Barre d'espacement pour passer d'un ensemble de couleurs à l'autre.
// Touches du clavier de 1 à 0 pour changer de mode.

// paramètres
int activeBlendMode = 1;

float radius = 256;

boolean useFirstColorSet = true;

// variables
float angle;
float angleOffset;

float amplitude;
float amplitudeOffset;

float positionX;
float positionY;

float centerX;
float centerY;

color color11;
color color12;
color color13;

color color21;
color color22;
color color23;

void setup()
{
  size(512, 512);
  frameRate(60);

  noStroke();

  activeBlendMode = 1;

  // premier ensemble de couleurs
  color11 = color(255, 0,   0,   127);
  color12 = color(0,   255, 0,   127);
  color13 = color(0,   0,   255, 127);

  // second ensemble de couleurs
  color21 = color(255, 127, 64,  127);
  color22 = color(64,  255, 127, 127);
  color23 = color(127, 64,  255, 127);

  angleOffset = radians(360.0f / 3);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  amplitude = 0;
}

void draw()
{
  background(127);

  // dessiner le premier cercle
  angle = 0;

  positionX = centerX + cos(angle) * amplitude;
  positionY = centerY + sin(angle) * amplitude;

  drawCircle(positionX, positionY, radius, (useFirstColorSet ? color11 : color21));

  // dessiner le second cercle
  angle += angleOffset;

  positionX = centerX + cos(angle) * amplitude;
  positionY = centerY + sin(angle) * amplitude;

  drawCircle(positionX, positionY, radius, (useFirstColorSet ? color12 : color22));

  // dessiner le troisième cercle
  angle += angleOffset;

  positionX = centerX + cos(angle) * amplitude;
  positionY = centerY + sin(angle) * amplitude;

  drawCircle(positionX, positionY, radius, (useFirstColorSet ? color13 : color23));

  // mise à jour de l'oscillation
  amplitude = oscillate(millis(), 127.0f, 5000.0f);
}

// fonction qui permet de dessiner un cercle
void drawCircle(float x, float y, float r, color c)
{
  fill(c);
  ellipse(x, y, r, r);
}

// fonction pour configurer le mode de composition
void setBlendMode(int blendMode)
{
  activeBlendMode = blendMode < 0 ? 0 : blendMode > 9 ? 9: blendMode;

  switch (activeBlendMode)
  {
    case 1:
      blendMode(BLEND);
      println("blend mode: BLEND");
      break;
    case 2:
      blendMode(ADD);
      println("blend mode: ADD");
      break;
    case 3:
      blendMode(SUBTRACT);
      println("blend mode: SUBTRACT");
      break;
    case 4:
      blendMode(DARKEST);
      println("blend mode: DARKEST");
      break;
    case 5:
      blendMode(LIGHTEST);
      println("blend mode: LIGHTEST");
      break;
    case 6:
      blendMode(DIFFERENCE);
      println("blend mode: DIFFERENCE");
      break;
    case 7:
      blendMode(EXCLUSION);
      println("blend mode: EXCLUSION");
      break;
    case 8:
      blendMode(MULTIPLY);
      println("blend mode: MULTIPLY");
      break;
    case 9:
      blendMode(SCREEN);
      println("blend mode: SCREEN");
      break;
    case 0:
      blendMode(REPLACE);
      println("blend mode: REPLACE");
      break;
  }
}

// fonction d'interactivité au clavier
void keyReleased()
{
  if (key == '1')
    setBlendMode(1);
  if (key == '2')
    setBlendMode(2);
  if (key == '3')
    setBlendMode(3);
  if (key == '4')
    setBlendMode(4);
  if (key == '5')
    setBlendMode(5);
  if (key == '6')
    setBlendMode(6);
  if (key == '7')
    setBlendMode(7);
  if (key == '8')
    setBlendMode(8);
  if (key == '9')
    setBlendMode(9);
  if (key == '0')
    setBlendMode(0);

  if (key == ' ')
  {
    useFirstColorSet = !useFirstColorSet;
    println("color set: " + (useFirstColorSet ? 1 : 2));
  }
}

// fonction d'oscillation
float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
