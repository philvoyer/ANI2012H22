// ANI2012H22_Type_Java.java | Programmation Java avec Processing
// Exemple d'instanciation de deux objets à partir de deux classes dont une hérite de l'autre.

Entity obj1;
SubEntity obj2;

void setup()
{
  noLoop();

  obj1 = new Entity("objet 1");
  obj2 = new SubEntity("objet 2", 3, 4);

  println("une instance de la classe Entity avec le nom: " + obj1.name);
  println("une instance de la classe SubEntity avec le nom: " + obj2.name + " et la position: (" + obj2.positionX + ", "+  obj2.positionY + ")");
}

void draw()
{
  obj1.update();
  obj2.update();
}

// classe parent
class Entity
{
  String name;

  Entity(String n)
  {
    name = n;
  }

  void update()
  {
    //...
  }
}

// classe enfant
class SubEntity extends Entity
{
  float positionX;
  float positionY;

  SubEntity(String n, float x, float y)
  {
    super(n);

    positionX = x;
    positionY = y;
  }

  void update()
  {
    //...
  }
}
