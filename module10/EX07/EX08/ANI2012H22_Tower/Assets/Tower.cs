// ANI2012A20_Tower/Tower.cs | Programmation C# avec Unity
// Classe de type Tower, responsable de gérer les propriétés et méthodes communes à toutes les tours.

using UnityEngine;

public class Tower : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public Weapon weapon;

  public GameObject towerBase;
  public GameObject towerTop;

  // fonction d'initialisation
  void Start()
  {
    Debug.Log("<tower start>");
  }

  // fonction de mise à jour
  void Update(){}

  // fonction qui permet d'assigner une arme à la tour
  public void Bind(Weapon w)
  {
    weapon = w;
    print("<bind tower: " + this + " with weapon: " + weapon + ">");
  }
}
