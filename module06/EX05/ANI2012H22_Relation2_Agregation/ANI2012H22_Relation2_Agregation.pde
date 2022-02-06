// ANI2012H22_Relation2_Agregation.pde
// Exemple d'une relation d'agrégation entre 3 composantes et 1 contenant.

// classe de type Container
class Container
{
  float positionX;
  float positionY;

  // composantes référencées dans une liste qui est une donnée membre de la classe
  ArrayList<Component> list;

  // constructeur
  Container(float x, float y)
  {
    positionX = x;
    positionY = y;

    // instanciation de la liste qui stocke les références
    list = new ArrayList<Component>();
  }

  // fonction d'affichage
  void render()
  {
    stroke(colorStroke);
    fill(colorFill);
    rect(positionX, positionY, 120, 180);

    for (int index = 0; index < list.size(); ++index)
      list.get(index).render();

    fill(colorText);
    textSize(18);
    text("Container", positionX, positionY - 80);
  }
}

// classe de type Component
class Component
{
  Container container; // référence vers le contenant dont la composante fait partie

  int order; // ordre d'affichage par rapport au contenant

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

// variables
int count = 3;
int index;

Container container;

Component component;

void setup()
{
  size(512, 512);
  noLoop();

  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  strokeWeight(2);

  // instanciation d'un nouveau contenant
  container = new Container(width / 2.0f, height / 2.0f);

  for (index = 1; index <= count; ++index)
  {
    component = new Component(container, index);

    container.list.add(component);
  }
}

void draw()
{
  fill(colorText);
  textSize(16);
  text("Relation d'agrégation entre 3 composantes et 1 contenant", width / 2.0f, height - 50);

  // dessiner le contenant et ses composantes
  container.render();
}
