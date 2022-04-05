// ANI2012A20_Tower/WeaponLaser.cs | Programmation C# avec Unity
// Classe de type WeaponLaser, responsable de gérer l'arme qui lance des lasers.

using UnityEngine;

public class WeaponLaser : Weapon
{
  // données membres publiques exposées dans l'éditeur
  public GameObject beamFrom;
  public GameObject beamToward;

  public ParticleSystem particleImpact;

  // données membres privées
  private GameObject beam;

  private LineRenderer beamLineStrip;

  private Vector3 positionFrom;
  private Vector3 positionTo;

  private Vector3 direction;

  private Vector3 delta;

  private Ray raycastRay;
  private RaycastHit raycastHit;

  private Vector3 impactPoint;
  private Quaternion impactNormal;

  private float threshold;
  private float distance;

  // fonction d'initialisation
  void Start()
  {
    type = Weapon.WeaponType.WEAPON_LASER;

    raycastRay = new Ray();

    print("<laser start>");
  }

  // fonction de réinitialisation
  public override void Reset()
  {
    speed = 50;

    gimbal = new Vector3(speed, speed, 0);

    threshold = 50.0f;

    beam = factory.CreateProjectile(Projectile.ProjectileType.PROJECTILE_LASER);

    beamLineStrip = beam.GetComponent(typeof(LineRenderer)) as LineRenderer;

    beam.transform.position = pool.transform.position;
    beam.transform.rotation = pool.transform.rotation;
    beam.transform.parent   = pool.transform;

    isActive = false;
    isStarted = true;

    print("<laser init>");
  }

  // fonction de mise à jour
  public void FixedUpdate()
  {
    if (isStarted)
    {
      if (isActive)
      {
        beamLineStrip.gameObject.SetActive(true);

        positionFrom = beamFrom.transform.position;
        positionTo   = beamToward.transform.position;

        delta = positionTo - positionFrom;
        direction.Set(delta.x, delta.y, delta.z);
        direction.Normalize();

        positionTo = positionFrom + (direction * threshold);

        raycastRay.origin = positionFrom;
        raycastRay.direction = direction;

        if (Physics.Raycast(raycastRay, out raycastHit))
        {
          impactPoint = raycastHit.point;
          impactNormal = Quaternion.LookRotation(
            Vector3.Reflect(
              raycastRay.direction,
              raycastHit.normal
            )
          );

          distance = raycastHit.distance;

          if (distance < threshold)
          {
            beamLineStrip.SetPosition(0, positionFrom);
            beamLineStrip.SetPosition(1, impactPoint);

            beamLineStrip.transform.position = impactPoint;
            particleImpact.transform.position = impactPoint;
            particleImpact.transform.rotation = impactNormal;
            particleImpact.gameObject.SetActive(true);
          }
        }
        else
        {
          beamLineStrip.SetPosition(0, positionFrom);
          beamLineStrip.SetPosition(1, positionTo);
          beamLineStrip.transform.position = positionTo;
          particleImpact.gameObject.SetActive(false);
        }

        isActive = false;
      }
      else
      {
        beamLineStrip.SetPosition(0, positionFrom);
        beamLineStrip.SetPosition(1, positionFrom);
        beamLineStrip.gameObject.SetActive(false);
        particleImpact.gameObject.SetActive(false);
      }
    }
  }

  // fonction appelée lorsque la tour qui possède cette arme est sélectionnée
  public override void Select()
  {
    print("<laser select>");
  }

  // fonction appelée lorsque la tour qui possède cette arme est désélectionnée
  public override void Unselect()
  {
    print("<laser unselect>");
  }

  // fonction appelée lorsque l'arme de la tour est activée
  public override void Shoot()
  {
    isActive = true;
  }
}
