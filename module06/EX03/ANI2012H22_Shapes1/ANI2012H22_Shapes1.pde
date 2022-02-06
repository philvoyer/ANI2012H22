// ANI2012H22_Shapes1.pde
// Instanciation et affichage de deux formes ('Rectangle' et 'Circle') qui héritent de la même classe parent ('Shape').
// Dans ce premier exemple, chaque instance a sa propre variable et est affichée directement à partir de celle-ci.

// classe de type Shape (classe parent)
class Shape
{
  float positionX;   // position en X de la forme
  float positionY;   // position en Y de la forme

  color colorStroke; // couleur de la ligne contour
  color colorFill;   // couleur de remplissage

  // constructeur
  Shape(float x, float y, color s, color f)
  {
    positionX = x;
    positionY = y;
    colorStroke = s;
    colorFill = f;
  }

  // fonction abstraite d'affichage
  void render(){}
}

// classe de type Rectangle (classe enfant)
class Rectangle extends Shape
{
  float sizeX; // largeur du rectangle
  float sizeY; // hauteur du rectangle

  // constructeur
  Rectangle(float x, float y, color s, color f, float w, float h)
  {
    // invoquer le constructeur de la classe parent
    super(x, y, s, f);

    // initialisation des attributs propres au rectangle
    sizeX = w;
    sizeY = h;
  }

  // fonction d'affichage du rectangle
  void render()
  {
    stroke(colorStroke);
    fill(colorFill);

    rect(positionX, positionY, sizeX, sizeY);
  }
}

// classe de type Ellipse (classe enfant)
class Circle extends Shape
{
  float radius; // rayon du cercle

  // constructeur
  Circle(float x, float y, color s, color f, float r)
  {
    // invoquer le constructeur de la classe parent
    super(x, y, s, f);

    // initialisation des attributs propres au cercle
    radius = r;
  }

  // fonction d'affichage du cercle
  void render()
  {
    stroke(colorStroke);
    fill(colorFill);
    ellipse(positionX, positionY, radius, radius);
  }
}

// paramètre
float strokeSize = 3.0f;

// variables

// référence sur une instance de la classe Rectangle
Rectangle rectangle;

// référence sur une instance de la classe Circle
Circle circle;

void setup()
{
  size(512, 512);
  noLoop();
  rectMode(CENTER);
  ellipseMode(CENTER);
  strokeWeight(strokeSize);

  // créer une instance de la classe Rectangle
  rectangle = new Rectangle(width / 4.0f, height / 2.0f, color(31), color(0, 127, 0), width / 4.0f, height / 8.0f);

  // créer une instance de la classe Cercle
  circle = new Circle(width - width / 4.0f, height / 2.0f, color(31), color(0, 0, 127), height / 4.0f);
}

void draw()
{
  // afficher l'instance de rectangle
  rectangle.render();

  // afficher l'instance de cercle
  circle.render();
}
