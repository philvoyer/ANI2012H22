// ANI2012H22_PointStructure.pde
// Instanciation et affichage de plusieurs points avec des propriétés aléatoires stockées dans une structure.

// structure de type Point (classe sans fonction)
class Point
{
  float positionX; // position en X du point
  float positionY; // position en Y du point
  float radius;    // taille du point
}

// paramètres
int count = 500;

float sizeMin = 5.0f;
float sizeMax = 35.0f;

// variables
int index;

// tableau de points
Point[] table;

// référence vers un point
Point newPoint;

void setup()
{
  size(512, 512);
  stroke(63);

  // instanciation d'un tableau qui peut contenir tous les points
  table = new Point[count];

  // boucler sur chacun des points à créer
  for (index = 0; index < count; ++index)
  {
    // instanciation d'un nouveau point
    newPoint = new Point();

    // assigner le nouveau point dans la position du tableau qui correspond à l'indice de la boucle
    table[index] = newPoint;
  }

  init();
}

void init()
{
  // boucler sur chacun des points
  for (index = 0; index < count; ++index)
  {
    // déterminer une valeur aléatoire pour chaque attribut du point
    table[index].positionX = random(0.0f, width);
    table[index].positionY = random(0.0f, height);
    table[index].radius = random(sizeMin, sizeMax);
  }
}

void draw()
{
  background(191);

  // boucler sur chacun des points
  for (index = 0; index < count; ++index)
  {
    // configurer la taille du point
    strokeWeight(table[index].radius);

    // dessiner le point
    point(table[index].positionX, table[index].positionY);
  }
}

// réinitialiser les attributs des points quand une touche du clavier est relâchée
void keyReleased()
{
  init();
}

// réinitialiser les attributs des points lors d'un clic
void mouseReleased()
{
  init();
}
