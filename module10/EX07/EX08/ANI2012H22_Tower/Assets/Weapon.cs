// ANI2012A20_Tower/Weapon.cs | Programmation C# avec Unity
// Classe de type Weapon, responsable de gérer les propriétés et méthodes communes à tous les types d'armes qui héritent de cette classe.

using UnityEngine;

public class Weapon : MonoBehaviour
{
  public enum WeaponType
  {
    WEAPON_NONE,
    WEAPON_GUN,
    WEAPON_CANNON,
    WEAPON_LASER,
    WEAPON_FLAME
  };

  // données membres publiques exposées dans l'éditeur
  public WeaponType type;

  public GameObject pivotX;
  public GameObject pivotY;

  public GameObject shootFromTransform;
  public GameObject pool;

  public Vector3 gimbal;

  public double frequency;

  public double timeLastShoot;

  public float speed;

  public bool isShooting;

  public bool isStarted;
  public bool isActive;

  // donnée membre publique masquée dans l'éditeur
  [HideInInspector]
  public Factory factory;

  // données membres protégées (publiques seulement pour les héritiers de la classe)
  protected GameObject go;

  protected Rigidbody  goRigidBody;

  protected int poolSize;

  // fonction qui permet d'ajuster l'orientation du pivot en X de l'arme dans l'espace local
  public void Pitch(float angle)
  {
    pivotX.transform.Rotate(angle * gimbal.x * Time.deltaTime, 0, 0, Space.Self);
  }

  // fonction qui permet d'ajuster l'orientation du pivot en Y de l'arme dans l'espace du monde
  public void Yaw(float angle)
  {
    pivotY.transform.Rotate(0, angle * gimbal.y * Time.deltaTime, 0, Space.World);
  }

  // fonctions virtuelles, qui seront implémentées dans les classes qui héritent de cette classe
  public virtual void Reset() {}
  public virtual void Select() {}
  public virtual void Unselect() {}
  public virtual void Shoot() {}
}
