// ANI2012A20_Tower/WeaponGun.cs | Programmation C# avec Unity
// Classe de type WeaponGun, responsable de gérer l'arme qui lance des balles de fusil.

using UnityEngine;
using System.Collections.Generic;

public class WeaponGun : Weapon
{
  // données membres publiques exposées dans l'éditeur
  public List<GameObject> projectilePoolReady;
  public List<GameObject> projectilePoolActive;

  // données membres privées
  private Ray        raycastRay;
  private RaycastHit raycastHit;

  private Vector3    impactPoint;
  private Vector3    impactNormal;
  private float      impactIncidence;

  private Transform  previousTransform;
  private Vector3    previousTransformOffset;

  private Quaternion reflectionQuaternion;
  private Vector3    reflectionDirection;
  private Vector3    reflectionVector;

  private ProjectileGun bullet;

  // fonction d'initialisation
  void Start()
  {
    print("<gun start>");

    type = Weapon.WeaponType.WEAPON_GUN;

    raycastRay = new Ray();

    speed = 200;

    gimbal = new Vector3(speed, speed, 0);

    previousTransformOffset = new Vector3(0, 0, -0.25f);

    frequency = 0.1f;
  }

  // fonction de réinitialisation
  public override void Reset()
  {
    print("<gun init>");

    poolSize = 20;

    projectilePoolReady  = new List<GameObject>();
    projectilePoolActive = new List<GameObject>();

    for(int i = 0; i < poolSize; ++i)
    {
      go = factory.CreateProjectile(Projectile.ProjectileType.PROJECTILE_GUN);

      go.transform.Translate(0, 0, i * -3.5f, Space.Self);

      go.transform.parent = pool.transform;

      projectilePoolReady.Add(go);
    }
  }

  // fonction de mise à jour
  public void FixedUpdate()
  {
    for(int i = 0; i < projectilePoolActive.Count; ++i)
    {
      go = (GameObject)projectilePoolActive[i];

      bullet = go.GetComponent(typeof(ProjectileGun)) as ProjectileGun;

      if(bullet.isActive)
      {
        if(bullet.isExpired)
        {
          bullet.isActive = false;

          go.SetActive(false);

          projectilePoolActive.RemoveAt(i);
          projectilePoolReady.Add(go);
        }
        else if(bullet.hasCollided)
        {
          previousTransform = bullet.transform;
          previousTransform.Translate(previousTransformOffset, Space.Self);

          raycastRay.origin =    previousTransform.position;
          raycastRay.direction = bullet.direction;

          if(Physics.Raycast(raycastRay, out raycastHit) && !bullet.hasBounced)
          {
            bullet.hasBounced = true;

            impactPoint  = raycastHit.point;
            impactNormal = raycastHit.normal;

            impactIncidence = Vector3.Angle(raycastRay.direction, impactNormal);

            reflectionQuaternion =
              Quaternion.LookRotation(
              Vector3.Reflect(
                raycastRay.direction,
                raycastHit.normal
              )
            );

            bullet.transform.position = impactPoint;
            bullet.transform.rotation = reflectionQuaternion;

            print("<gun impact:" + impactPoint + " incidence:" + impactIncidence + ">");
            Debug.DrawRay(raycastRay.origin, raycastRay.direction, Color.grey, 1, true);
          }
        }
      }
    }
  }

  // fonction appelée lorsque la tour qui possède cette arme est sélectionnée
  public override void Select()
  {
    print("<gun select>");
  }

  // fonction appelée lorsque la tour qui possède cette arme est désélectionnée
  public override void Unselect()
  {
    print("<gun unselect>");
  }

  // fonction appelée lorsque l'arme de la tour est activée
  public override void Shoot()
  {
    if(Time.time - timeLastShoot > frequency)
    {
      isShooting = true;

      timeLastShoot = Time.time;

      if(projectilePoolReady.Count > 0)
      {
        go = (GameObject) projectilePoolReady[0];
        go.SetActive(true);

        bullet = go.GetComponent(typeof(ProjectileGun)) as ProjectileGun;
        bullet.isExpired = false;
        bullet.shooter = shootFromTransform;
        bullet.target = null;

        bullet.Shoot();

        projectilePoolReady.RemoveAt(0);
        projectilePoolActive.Add(go);
      }
    }
    else
    {
      isShooting = false;
    }
  }
}
