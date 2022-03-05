// ANI2012H22_Clock2/Clock.pde
// Classe de type Clock

class Clock
{
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

  float deltaSecond = 360.0f / 60.0f;
  float deltaMinute = 360.0f / 60.0f;
  float deltaHour   = 360.0f / 12.0f;

  // constructeur
  Clock(float x, float y, float fps, float speed)
  {
    centerX = x;
    centerY = y;

    timeSlice = 1.0f / fps;
    timeScale = timeSlice * speed;

    angleSecond = angleMinute = angleHour = 0.0f;
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
  void render()
  {
    pushMatrix();

    translate(centerX, centerY);

    rotate(radians(-90.0f));

    noStroke();

    fill(255, 0, 127);
    drawArrow(0, 0, arrowWidth, arrowHeight, radians(angleSecond));

    fill(127, 255, 0);
    drawArrow(0, 0, arrowWidth, arrowHeight, radians(angleMinute));

    fill(0, 127, 255);
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

    translate(x, y);
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
}
