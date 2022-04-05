// ANI2012A20_Tower/WeaponCannon.cs | Programmation C# avec Unity
// Classe de type WeaponCannon, responsable de gérer l'arme qui lance des boulets de canon explosifs.

using UnityEngine;
using System.Collections.Generic;

public class WeaponCannon : Weapon
{
  // données membres publiques exposées dans l'éditeur
  public List<GameObject> projectilePoolReady;
  public List<GameObject> projectilePoolActive;

  public List<GameObject> fxPoolReady;
  public List<GameObject> fxPoolActive;

  // données membres privées
  private Vector3 explosionPosition;

  private ProjectileCannon bullet;

  private FX fx;

  private ParticleSystem ps;

  private Vector3 nowhere;

  private float force;

  // fonction d'initialisation
  void Start()
  {
    type = Weapon.WeaponType.WEAPON_CANNON;

    speed = 75;

    gimbal = new Vector3(speed, speed, 0);

    nowhere = new Vector3(0, -10, 0);

    print("<canon start>");
  }

  // fonction de réinitialisation
  public override void Reset()
  {
    print("<canon init>");

    poolSize = 10;

    frequency = 0.35f;

    force = 10.0f;

    projectilePoolReady  = new List<GameObject>();
    projectilePoolActive = new List<GameObject>();

    for (int i = 0; i < poolSize; ++i)
    {
      go = factory.CreateProjectile(Projectile.ProjectileType.PROJECTILE_CANNON);
      goRigidBody = go.GetComponent(typeof(Rigidbody)) as Rigidbody;

      go.transform.parent = pool.transform;

      go.transform.Translate(0, 0, i * -3.5f, Space.Self);

      goRigidBody.isKinematic = true;

      projectilePoolReady.Add(go);
    }

    fxPoolReady  = new List<GameObject>();
    fxPoolActive = new List<GameObject>();

    for (int i = 0; i < poolSize / 2; ++i)
    {
      go = factory.CreateFX(Projectile.ProjectileType.PROJECTILE_CANNON);

      go.transform.parent = pool.transform;

      go.transform.Translate(0, 0, i * -3.5f, Space.Self);

      go.SetActive(false);

      fx = go.GetComponent(typeof(FX)) as FX;
      fx.Reset();

      fxPoolReady.Add(go);
    }
  }

  // fonction de mise à jour
  public void FixedUpdate()
  {
    for (int i = 0; i < projectilePoolActive.Count; ++i)
    {
      go = (GameObject) projectilePoolActive[i];
      goRigidBody = go.GetComponent(typeof(Rigidbody)) as Rigidbody;

      bullet = go.GetComponent(typeof(ProjectileCannon)) as ProjectileCannon;

      if (bullet.isActive)
      {
        if (Time.time - bullet.timeShoot > bullet.timeLife)
        {
          bullet.isExpired = true;
        }

        if (bullet.isExpired)
        {
          bullet.isActive = false;

          explosionPosition = go.transform.position;

          goRigidBody.isKinematic = true;
          go.transform.transform.position = nowhere;

          projectilePoolActive.RemoveAt(i);
          projectilePoolReady.Add(go);

          Explode(explosionPosition);
        }

        if (bullet.hasCollided){/*...*/}
        if (bullet.hasExploded){/*...*/}
      }
    }

    for (int i = 0; i < fxPoolActive.Count; ++i)
    {
      go = (GameObject) fxPoolActive[i];

      fx = go.GetComponent(typeof(FX)) as FX;

      if (fx.isActive)
      {
        if (Time.time - fx.timeShoot > fx.timeLife)
        {
          fx.isExpired = true;
        }

        if (fx.isExpired)
                {
          fx.isActive = false;

          explosionPosition = nowhere;

          go.transform.transform.position = explosionPosition;

          ps = go.GetComponent(typeof(ParticleSystem)) as ParticleSystem;
          ps.Stop();

          go.SetActive(false);

          fxPoolActive.RemoveAt(i);
          fxPoolReady.Add(go);
        }
      }
    }
  }

  // fonction appelée lorsque la tour qui possède cette arme est sélectionnée
  public override void Select()
  {
    print("<cannon select>");
  }

  // fonction appelée lorsque la tour qui possède cette arme est désélectionnée
  public override void Unselect()
  {
    print("<cannon unselect>");
  }

  // fonction appelée lorsque l'arme de la tour est activée
  public override void Shoot()
  {
    if (Time.time - timeLastShoot > frequency)
    {
      isShooting = true;

      timeLastShoot = Time.time;

      if (projectilePoolReady.Count > 0)
      {
        go = (GameObject) projectilePoolReady[0];
        go.SetActive(true);

        goRigidBody = go.GetComponent(typeof(Rigidbody)) as Rigidbody;
        goRigidBody.isKinematic = false;
        goRigidBody.AddForce(shootFromTransform.transform.forward * force, ForceMode.Impulse);

        bullet = go.GetComponent(typeof(ProjectileCannon)) as ProjectileCannon;

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

  // fonction appelée lorsqu'un boulet de canon explose
  public void Explode(Vector3 position)
  {
    Vector3 dist;

    for (int i = 0; i < projectilePoolActive.Count; ++i)
    {
      go = (GameObject) projectilePoolActive[i];

      dist = go.transform.position - position;

      if (dist.magnitude < 999){/*...*/}
    }

    if (fxPoolReady.Count > 0)
    {
      go = (GameObject) fxPoolReady[0];
      go.transform.position = position;
      go.SetActive(true);

      fx = go.GetComponent(typeof(FX)) as FX;
      fx.Trigger();

      ps = go.GetComponent(typeof(ParticleSystem)) as ParticleSystem;
      ps.Play();

      fxPoolReady.RemoveAt(0);
      fxPoolActive.Add(go);
    }
    print("<explode>");
  }
}
