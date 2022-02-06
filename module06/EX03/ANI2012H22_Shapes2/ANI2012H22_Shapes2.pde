// ANI2012H22_Shapes2.pde
// Instanciation et affichage de deux formes ('Rectangle' et 'Circle') qui héritent de la même classe parent ('Shape').
// Dans ce second exemple, plusieurs instances anonymes sont stockées dans un tableau sur lequel on boucle pour les afficher.
// C'est grâce au principe du polymorphisme qu'il est possible de dessiner les formes sans avoir à faire un traitement particulier selon leurs types.
// Puisque les classes 'Rectangle' et 'Circle' héritent de 'Shape', alors elles ont tous les deux une fonction 'render' et il n'est pas nécessaire de faire la distinction entre les deux lors de l'appel de la fonction, la bonne version sera appelée grâce au principe du polymorphisme.

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

// paramètres
int count = 1000;

float sizeMin = 10.0f;
float sizeMax = 100.0f;

float radiusMin = 5.0f;
float radiusMax = 50.0f;

float strokeSize = 3.0f;

// variables
int index;

float randomPositionX;
float randomPositionY;
float randomSizeX;
float randomSizeY;

float randomRadius;

color randomColorStroke;
color randomColorFill;

// tableau de formes
Shape[] table;

// référence vers une forme
Shape shape;

void setup()
{
  size(512, 512);
  noLoop();
  rectMode(CENTER);
  ellipseMode(CENTER);
  strokeWeight(strokeSize);

  // instanciation d'un tableau pouvant contenir toutes les instances de formes
  table = new Shape[count];

  // boucler sur chacune des formes à créer
  for (index = 0; index < count; ++index)
  {
    // déterminer des valeurs aléatoires pour chaque attribut de la forme
    randomPositionX = random(0.0f, width);
    randomPositionY = random(0.0f, height);
    randomColorStroke = color(random(0.0f, 256.0f), random(0.0f, 256.0f), random(0.0f, 256.0f));
    randomColorFill = color(random(0.0f, 256.0f), random(0.0f, 256.0f), random(0.0f, 256.0f));

    // changer de forme une fois sur deux
    if (index % 2 == 0)
    {
      randomSizeX = random(sizeMin, sizeMax);
      randomSizeY = random(sizeMin, sizeMax);

      // instanciation d'un nouveau rectangle
      shape = new Rectangle(randomPositionX, randomPositionY, randomColorStroke, randomColorFill, randomSizeX, randomSizeY);
    }
    else
    {
      randomRadius = random(radiusMin, radiusMax);

      // instanciation d'un nouveau cercle
      shape = new Circle(randomPositionX, randomPositionY, randomColorStroke, randomColorFill, randomRadius);
    }

    // assigner la nouvelle forme dans la position du tableau qui correspond à l'indice de la boucle
    table[index] = shape;
  }
}

void draw()
{
  // boucler sur chacune des formes
  for (index = 0; index < count; ++index)
  {
    // afficher la forme située à cet index du tableau
    table[index].render(); // <- polymorphisme de la fonction render, la bonne version sera appelée automatiquement
  }
}
