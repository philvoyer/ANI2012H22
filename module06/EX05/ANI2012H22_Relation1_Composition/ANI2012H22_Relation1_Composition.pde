// ANI2012H22_Relation1_Composition.pde
// Exemple d'une relation de composition entre 3 composantes et 1 contenant.

// classe de type Container
class Container
{
  float positionX;
  float positionY;

  // composantes directement déclarées en données membres de la classe
  Component component1;
  Component component2;
  Component component3;

  // constructeur
  Container(float x, float y)
  {
    positionX = x;
    positionY = y;

    // instanciation des composantes
    component1 = new Component(this, 1);
    component2 = new Component(this, 2);
    component3 = new Component(this, 3);
  }

  // fonction d'affichage
  void render()
  {
    stroke(colorStroke);
    fill(colorFill);
    rect(positionX, positionY, 120, 180);

    component1.render();
    component2.render();
    component3.render();

    fill(colorText);
    textSize(18);
    text("Container", positionX, positionY - 80);
  }
}

// classe de type Component
class Component
{
  Container container; // référence vers le contenant dont la composante fait partie

  int order; // ordre d'affichage par rapport à au contenant

  int offset = 50;

  // constructeur
  Component(Container c, int o)
  {
    container = c;
    order = o;
  }

  // fonction d'affichage
  void render()
  {
    stroke(colorStroke);
    fill(colorFill);

    rect(container.positionX, container.positionY - offset * 2 + offset * order, 100, 25);

    fill(colorText);
    textSize(12);
    text("Component " + order, container.positionX, container.positionY - offset * 2 + offset * order);
  }
}

// paramètres
color colorStroke = color(63);
color colorFill = color(191);
color colorText = color(255);

// variable
Container container;

void setup()
{
  size(512, 512);
  noLoop();

  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  strokeWeight(2);

  // instanciation d'un nouveau contenant
  container = new Container(width / 2.0f, height / 2.0f);
}

void draw()
{
  fill(colorText);
  textSize(16);
  text("Relation de composition entre 3 composantes et 1 contenant", width / 2.0f, height - 50);

  // dessiner le contenant et ses composantes
  container.render();
}
