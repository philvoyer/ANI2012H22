// ANI2012H22_Henon.pde
// Animation d'un système chaotique de type attracteur de Henon

// paramètres
int count = 100;

int strokeSize = 4;

float frequency = 100.0f;

float timeThreshold = 3.0f;

// variables
float centerX;
float centerY;

int index;

float angle;
float cosinus;
float sinus;

float offset;

float timeNow;
float timeLast;
float timeElapsed;
float timeDelay;

Henon[] list;

void setup()
{
  size(512, 512);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  strokeWeight(strokeSize);

  reset();
}

// fonction d'initialisation du système chaotique
void reset()
{
  angle = random(TWO_PI);

  cosinus = cos(angle);
  sinus = sin(angle);

  offset = 1.0f / count;

  // création d'une liste des éléments de l'attracteur
  list = new Henon[count];

  // initialisation
  for (index = 0; index < count; ++index)
    list[index] = new Henon(index * offset, noise(index * 0.05f));

  // couleur aléatoire
  stroke(
    (int) random(256.0f),
    (int) random(256.0f),
    (int) random(256.0f),
    191);

  strokeWeight(strokeSize);

  background(31);
}

void draw()
{
  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f;
  timeLast = timeNow;
  timeDelay += timeElapsed;

  // réinitialiser le système après un certain temps
  if (timeDelay >= timeThreshold)
  {
    timeDelay -= timeThreshold;
    reset();
  }

  // mise à jour de la position des éléments de l'attracteur
  for (index = 0; index < count; ++index)
    list[index].update();

  // dessiner les éléments de l'attracteur
  for (index = 0; index < count; ++index)
    list[index].render();
}

void keyReleased()
{
  if (keyCode == UP)
    strokeSize += 1;
  if (keyCode == DOWN)
    strokeSize = --strokeSize > 1 ? strokeSize : 1;

  strokeSize = int(random(1.0f, 8.0f));

  println("stroke size : " + strokeSize);

  reset();
}

void mouseReleased()
{
  strokeSize = int(random(1.0f, 8.0f));
  reset();
}
