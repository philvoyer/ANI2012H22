// ANI2012A20_Tower/FX.cs | Programmation C# avec Unity
// Classe de type FX, responsable de gérer les états de différents types d'effets visuels.

using UnityEngine;

public class FX : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public float timeShoot;
  public float timeLife;

  public bool isActive;
  public bool isExpired;
  public bool hasCollided;
  public bool hasExploded;

  // donnée membre publique masquée dans l'éditeur
  [HideInInspector]
  public GameObject go;

  // fonction de mise à jour
  void Start()
  {
    print("<fx start>");
  }

  // fonction de réinitialisation
  public void Reset()
  {
    timeShoot = 0;
    timeLife  = 3;

    isActive = false;
    isExpired = false;
    hasCollided = false;
    hasExploded = false;

    print("<fx init>");
  }

  // fonction de mise à jour
  public void Trigger()
  {
    timeShoot = Time.time;
    isActive = true;
    isExpired = false;
    hasCollided = false;
    hasExploded = false;
  }
}
