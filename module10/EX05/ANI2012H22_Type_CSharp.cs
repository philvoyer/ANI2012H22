// ANI2012H22_Type_CSharp.cs | Programmation C# avec Unity
// Exemple d'instanciation de deux objets à partir de deux classes dont une hérite de l'autre.

using System;
using UnityEngine;

public class ANI2012H22_Type_CSharp : MonoBehaviour
{
  public Entity obj1;
  public SubEntity obj2;

  void Start()
  {
    obj1 = new Entity("objet 1");
    obj2 = new SubEntity("objet 2", 3, 4);

    print("une instance de la classe Entity avec le nom: " + obj1.name);
    print("une instance de la classe SubEntity avec le nom: " + obj2.name + " et la position: (" + obj2.positionX + ", "+  obj2.positionY + ")");
  }

  void Update()
  {
    obj1.update();
    obj2.update();
  }
}

// classe parent
public class Entity
{
  public String name;

  public Entity(String n)
  {
    name = n;
  }

  public virtual void update()
  {
    //...
  }
}

// classe enfant
public class SubEntity : Entity
{
  public float positionX;
  public float positionY;

  public SubEntity(String n, float x, float y) : base(n)
  {
    positionX = x;
    positionY = y;
  }

  public override void update()
  {
    //...
  }
}
