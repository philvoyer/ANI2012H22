// ANI2012A20_Tower/WeaponFlame.cs | Programmation C# avec Unity
// Classe de type WeaponFlame, responsable de gérer l'arme qui lance des projectiles de flammes.

using UnityEngine;

public class WeaponFlame : Weapon
{
  // données membres publiques exposées dans l'éditeur
  public ParticleSystem particleActive;
  public ParticleSystem particlePassive;

  // références pour activer et désactiver l'émission de particules
  ParticleSystem.EmissionModule emissionActive;
  ParticleSystem.EmissionModule emissionPassive;

  // fonction d'initialisation
  void Start()
  {
    type = Weapon.WeaponType.WEAPON_FLAME;

    print("<laser start>");
  }

  // fonction de réinitialisation
  public override void Reset()
  {
    speed = 150;

    gimbal = new Vector3(speed, speed, 0);

    go = factory.CreateProjectile(Projectile.ProjectileType.PROJECTILE_FLAME);

    go.transform.position = shootFromTransform.transform.position;
    go.transform.rotation = shootFromTransform.transform.rotation;
    go.transform.parent   = pool.transform;

    particleActive = go.GetComponent(typeof(ParticleSystem)) as ParticleSystem;

    emissionActive = particleActive.emission;
    emissionPassive = particlePassive.emission;

    emissionActive.enabled  = false;
    emissionPassive.enabled = false;

    particleActive.gameObject.SetActive(false);
    particlePassive.gameObject.SetActive(false);

    isStarted = true;

    print("<flame init>");
  }

  // fonction de mise à jour
  public void FixedUpdate()
  {
    if (isStarted)
    {
      if (isActive)
      {
        go.transform.position = shootFromTransform.transform.position;
        go.transform.rotation = shootFromTransform.transform.rotation;

        if (!emissionActive.enabled)
        {
          emissionActive.enabled = true;
        }
        if (emissionPassive.enabled)
        {
          emissionPassive.enabled = false;
        }
        isActive = false;
      }
      else
      {
        emissionActive.enabled  = false;
        emissionPassive.enabled = true;
      }
    }
  }

  // fonction appelée lorsque la tour qui possède cette arme est sélectionnée
  public override void Select()
  {
    print("<flame select>");

    go.transform.position = shootFromTransform.transform.position;
    go.transform.rotation = shootFromTransform.transform.rotation;

    particleActive.gameObject.SetActive(true);
    particlePassive.gameObject.SetActive(true);

    particlePassive.Play();
  }

  // fonction appelée lorsque la tour qui possède cette arme est désélectionnée
  public override void Unselect()
  {
    print("<flame unselect>");

    particleActive.gameObject.SetActive(false);
    particlePassive.gameObject.SetActive(false);
    particlePassive.Stop();
  }

  // fonction appelée lorsque l'arme de la tour est activée
  public override void Shoot()
  {
    isActive = true;
  }
}
