// ANI2012H22_MoveTo.pde
// Animation du déplacement d'une base orthonormale vers une position en parcourant une fraction de la distance à chaque mise à jour.

// paramètres
float easing = 0.05f;

float arrowWidth = 150.0f;
float arrowHeight = 15.0f;

float crossRadius  = 10.0f;

float probability = 0.005f;

int colorBack = 0;

// variables
Vector3D position;
Vector3D target;
Vector3D velocity;

void setup()
{
  size(512, 512);
  rectMode(CORNER);

  position = new Vector3D();
  target = new Vector3D();
  velocity = new Vector3D();

  target.x = width / 2.0f;
  target.y = height / 2.0f;

  drawCross(target.x, target.y, crossRadius);
}

void draw()
{
  fade(32);

  // déterminer la vélocité avec une technique d'interpolation par convergence
  velocity.x = (target.x - position.x) * easing;
  velocity.y = (target.y - position.y) * easing;

  // appliquer la vélocité à la position courante
  position.x += velocity.x;
  position.y += velocity.y;

  // dessiner la base orthonormale
  drawBasis(position.x, position.y, arrowWidth, arrowHeight);

  // lorsqu'un bouton de la souris est enfoncé
  if (mousePressed == true)
  {
    // la nouvelle position de destination est la position de la souris
    target.x = mouseX;
    target.y = mouseY;

    // dessiner le repère visuel de la position de destination
    drawCross(target.x, target.y, crossRadius);
  }
  else
  {
    // tester la probalilité de changer la position de destination
    if (random(0.0f, 1.0f) < probability)
    {
      // choisir une position de destination au hasard
      target.x = random(width);
      target.y = random(height);

      // dessiner le repère visuel de la position de destination
      drawCross(target.x, target.y, crossRadius);
    }
  }
}

// fonction qui dessine une base orthonormale (origine et flèches pour axes X et Y)
void drawBasis(float x, float y, float w, float h)
{
  // dessiner l'axe X
  fill(255, 0, 0);
  drawArrow(x, y, w, h, 0);

  // dessiner l'axe Y
  fill(0, 255, 0);
  drawArrow(x, y, w, h, -PI / 2.0f);

  // dessiner l'origine
  drawOrigin(x, y, h*2);
}

// fonction qui dessine l'origine d'une base orthonormale
void drawOrigin(float x, float y, float radius)
{
  stroke(255, 255, 255);
  strokeWeight(radius);

  point(x, y);
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
  vertex(w, - (h / 2.0f + h / 2.0f));
  vertex(w, - h / 2.0f);
  vertex(0, - h / 2.0f);
  endShape(CLOSE);

  popMatrix();
}

// fonction qui dessine une croix
void drawCross(float x, float y, float radius)
{
  stroke(191, 0, 191);
  strokeWeight(radius);

  line(x - radius, y - radius, x + radius, y + radius);
  line(x + radius, y - radius, x - radius, y + radius);
}

void fade(float decay)
{
  noStroke();
  fill(colorBack, decay);
  rect(0, 0, width, height);
}
