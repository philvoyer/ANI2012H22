// ANI2012A20_Tower/ProjectileGun.cs | Programmation C# avec Unity
// Classe de type ProjectileGun, responsable de gérer les projectiles de la tour fusil.

using UnityEngine;

public class ProjectileGun : Projectile
{
  // fonction d'initialisation
  void Start()
  {
    base.Reset();

    Reset();
  }

  // fonction de mise à jour
  void FixedUpdate()
  {
    if (isActive && !isExpired)
    {
      transform.Translate(velocity * Time.deltaTime);

      position = transform.position;

      distance = (position - initialPosition).magnitude;

      if (distance > distanceMax)
      {
        isExpired = true;
      }
    }
  }

  // fonction de réinitialisation
  public override void Reset()
  {
    isActive = false;
    isExpired = false;
    hasCollided = false;

    damage = 10;
    speed = 50;
    distance = 0;
    distanceMax = 75;

    print("<projectile init gun>");
  }

  // fonction appelée lorsqu'un projectile est lancé
  public override void Shoot()
  {
    isActive    = true;
    hasCollided = false;
    hasBounced  = false;

    distance    = 0;
    damage      = 1;

    velocity = new Vector3(0, 0, speed);

    initialPosition = shooter.transform.position;
    initialOrientation = shooter.transform.rotation;

    transform.position = initialPosition;
    transform.rotation = initialOrientation;

    direction = initialOrientation * Vector3.forward;
  }

  // fonction appelée lorsqu'il y a une collision entre le projectile et un objet de la scène
  void OnTriggerEnter(Collider collider)
  {
    if (isActive && !isExpired && !hasCollided)
    {
      hasCollided = true;

      print("<gun collision with: " + collider.gameObject.name + ">");
    }
  }
}
