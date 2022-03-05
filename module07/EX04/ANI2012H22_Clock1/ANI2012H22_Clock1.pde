// ANI2012H22_Clock1.pde
// Animation d'une horloge, version implémentée sans classe.

// paramètres
int fps = 60;

int colorBack = 31;

float speed = 60.0f; // vitesse accélérée (utiliser 1.0f pour vitesse normale)

float arrowWidth = 200.0f;
float arrowHeight = 20.0f;

// variables
float timeSlice;
float timeScale;

float radius;
float angle;
float offset;

float positionX;
float positionY;

float centerX;
float centerY;

float randomX;
float randomY;

float angleSecond;
float angleMinute;
float angleHour;

// constantes
float deltaSecond = 360.0f / 60.0f;
float deltaMinute = 360.0f / 60.0f;
float deltaHour   = 360.0f / 12.0f;

void setup()
{
  size(512, 512);
  frameRate(fps);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  timeSlice = 1.0f / fps;
  timeScale = timeSlice * speed;

  angleSecond = angleMinute = angleHour = 0.0f;
}

void draw()
{
  fade(2);

  update();

  drawClock();
}

// fonction de mise à jour de l'horloge
void update()
{
  angleSecond += deltaSecond * timeScale;

  if (angleSecond > 360)
  {
    angleSecond -= 360;
    angleMinute += deltaMinute;

    if (angleMinute > 360)
    {
      angleMinute -= 360;
      angleHour += deltaHour;

      if (angleHour > 360)
      {
        angleHour -= 360;
      }
    }
  }
}

// fonction d'affichage de l'horloge
void drawClock()
{
  pushMatrix();

  translate(centerX, centerY);
  rotate(radians(-90.0f));

  noStroke();

  fill(0, 0, 255);
  drawArrow(0, 0, arrowWidth, arrowHeight, radians(angleSecond));

  fill(255, 0, 0);
  drawArrow(0, 0, arrowWidth, arrowHeight, radians(angleMinute));

  fill(0, 255, 0);
  drawArrow(0, 0, arrowWidth, arrowHeight, radians(angleHour));

  stroke(127);
  strokeWeight(arrowHeight * 1.5f);

  point(0, 0);

  popMatrix();
}

// fonction qui dessine une flèche
void drawArrow(float x, float y, float w, float h, float angle)
{
  noStroke();

  pushMatrix();

  translate(x,y);
  rotate(angle);

  beginShape();
  vertex(0, h / 2.0f);
  vertex(w, h / 2.0f);
  vertex(w, h / 2.0f + h / 2.0f);
  vertex(w + h * 1.618f, 0);
  vertex(w, -(h / 2.0f + h / 2.0f));
  vertex(w, -h / 2.0f);
  vertex(0, -h / 2.0f);
  endShape(CLOSE);

  popMatrix();
}

void fade(float decay)
{
  noStroke();
  fill(colorBack, decay);
  rect(0, 0, width, height);
}
