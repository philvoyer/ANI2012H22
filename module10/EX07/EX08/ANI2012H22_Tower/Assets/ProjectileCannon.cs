// ANI2012A20_Tower/ProjectileCannon.cs | Programmation C# avec Unity
// Classe de type ProjectileCannon, responsable de gérer les projectiles de la tour canon.

using UnityEngine;

public class ProjectileCannon : Projectile
{
  // données membres publiques masquées dans l'éditeur
  [HideInInspector]
  public double timeShoot;

  [HideInInspector]
  public double timeLife;

  // données membres privées
  private Rigidbody rigidBody;

  // fonction d'initialisation
  void Start()
  {
    base.Reset();

    Reset();
  }

  // fonction de réinitialisation
  public override void Reset()
  {
    isActive    = false;
    isExpired   = false;
    hasCollided = false;
    hasExploded = false;

    timeShoot = 0;
    timeLife  = 3;

    damage    = 10;

    print("<projectile init cannon>");
  }

  // fonction appelée lorsqu'un projectile est lancé
  public override void Shoot()
  {
    isActive    = true;
    isExpired   = false;
    hasCollided = false;
    hasExploded = false;

    timeShoot = Time.time;

    initialPosition = shooter.transform.position;
    initialOrientation = shooter.transform.rotation;

    transform.position = initialPosition;
    transform.rotation = initialOrientation;
  }

  // fonction appelée lorsqu'il y a une collision entre le projectile et un objet de la scène
  void OnCollisionEnter(Collision collision)
  {
    hasCollided = true;

    print("<cannon collision with: " + collision.gameObject.name + ">");
  }
}
