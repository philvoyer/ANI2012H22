// ANI2012H22_Tentacle.pde
// Dessine et anime un tentacule généré à partir d'une fonction récursive.

// paramètres
int depthCurrent = 5;
int depthMax = 10;

int colorStroke = 255;
int colorFill = 127;
int colorBack = 31;

float period = 50000.0f;
float radius = 16.0f;

float scaleFactor = 0.66f;

// variable
float angle;

void setup()
{
  size(512, 512);
  frameRate(60);
  strokeWeight(6);
  fill(255);
}

void draw()
{
  fade(63);

  stroke(colorStroke);
  fill(colorFill);

  // position initiale
  translate(width / 2.0f, 0);

  // invocation de la fonction récursive
  tentacle(height / 3.0f, 0);

  // oscillation de l'angle de rotation
  angle = oscillate(millis(), PI * 4.0f, period);
}

// fonction récursive qui dessine un tentacule en plusieurs segments
void tentacle(float segment, int level)
{
  // dessiner un segment de tentacule
  line(0, 0, 0, segment);

  // déplacer l'origine au bout du segment
  translate(0, segment);

  // dessiner une ellipse à l'extrémité
  ellipse(0, 0, radius, radius);

  // appliquer le facteur de décroissance de la taille
  segment *= scaleFactor;

  // incrémenter le nombre de niveaux
  ++level;

  // valider la condition d'arrêt
  if (level < depthCurrent)
  {
    // dessiner le segment
    pushMatrix();
    rotate(angle);
    tentacle(segment, level);
    popMatrix();

    // dessiner une ellipse à l'embranchement
    ellipse(0, 0, radius, radius);
  }
}

void keyReleased()
{
  if (keyCode == UP)
    depthCurrent = ++depthCurrent < depthMax ? depthCurrent : depthMax;
  if (keyCode == DOWN)
    depthCurrent = --depthCurrent > 0 ? depthCurrent : 0;

  println("current depth : " + depthCurrent);
}

float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2.0f * PI / period);
}

void fade(float intensity)
{
  rectMode(CORNER);
  noStroke();
  fill(colorBack, intensity);
  rect(0, 0, width, height);
}
