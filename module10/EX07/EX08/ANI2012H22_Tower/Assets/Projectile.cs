// ANI2012A20_Tower/Projectile.cs | Programmation C# avec Unity
// Classe de type Projectile, responsable de gérer les propriétés et méthodes communes à tous les types de projectiles qui héritent de cette classe.

using UnityEngine;

public class Projectile : MonoBehaviour
{
  public enum ProjectileType
  {
    PROJECTILE_NONE,
    PROJECTILE_GUN,
    PROJECTILE_CANNON,
    PROJECTILE_LASER,
    PROJECTILE_FLAME
  };

  // données membres publiques exposées dans l'éditeur
  public Quaternion initialOrientation;

  public Vector3 initialPosition;

  public Vector3 position;
  public Vector3 velocity;
  public Vector3 direction;

  public Vector3 impactPoint;
  public Vector3 impactPosition;

  public GameObject impactObject;

  public GameObject shooter;
  public GameObject target;

  public float distance;
  public float distanceMax;

  public float speed;

  public int  damage;

  public bool isActive;
  public bool isExpired;

  public bool hasCollided;
  public bool hasExploded;
  public bool hasBounced;

  public bool kinematic;
  public bool gravity;

  // fontion virtuelle de réinitialisation
  public virtual void Reset()
  {
    isActive = false;
    isExpired = false;

    hasCollided = false;
    hasExploded = false;
    hasBounced = false;

    initialPosition = Vector3.zero;
    initialOrientation = Quaternion.identity;

    velocity = Vector3.zero;

    print("<projectile init>");
  }

  // fonction virtuelle qui sera implémentée dans les classes qui héritent de cette classe
  public virtual void Shoot() {}
}
