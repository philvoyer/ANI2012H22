// ANI2012A20_Tower/Factory.cs | Programmation C# avec Unity
// Classe de type Factory, responsable de gérer la création d'instances d'objets des différentes classes du projet.

using UnityEngine;
using System.Collections.Generic;

public class Factory : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public GameObject originalWeaponGun;
  public GameObject originalWeaponCannon;
  public GameObject originalWeaponLaser;
  public GameObject originalWeaponFlame;

  public GameObject originalProjectileGun;
  public GameObject originalProjectileCannon;
  public GameObject originalProjectileLaser;
  public GameObject originalProjectileFlame;

  public GameObject originalImpactGun;
  public GameObject originalImpactCannon;
  public GameObject originalImpactLaser;
  public GameObject originalImpactFlame;

  public GameObject originalTower;

  // données membres privées
  private Vector3 v;
  private Quaternion q;

  private Tower tower;
  private Weapon weapon;

  private ProjectileGun projectileGun;
  private ProjectileCannon projectileCannon;

  private GameObject go;
  private GameObject goWeapon;
  private GameObject goProjectile;
  private GameObject goFX;
  private GameObject goTower;
  private GameObject goTowerTop;
  private GameObject goClone;

  private List<GameObject> listAssetsInMemory;

  // fonction d'initialisation
  void Start()
  {
    listAssetsInMemory = new List<GameObject>();

    print("<factory start>");
  }

  // fonction qui permet de dupliquer un objet
  public GameObject Duplicate(GameObject original)
  {
    v = new Vector3(0, 0, 0);
    q = Quaternion.identity;

    goClone = Instantiate(original, v, q) as GameObject;

    return goClone;
  }

  // fonction qui permet d'instancier une tour selon le type passé en paramètre
  public Tower CreateTower(Weapon.WeaponType type)
  {
    goTower = Duplicate(originalTower);

    tower = (Tower) goTower.GetComponent(typeof(Tower));

    goTowerTop = tower.towerTop;

    switch (type)
    {
      case Weapon.WeaponType.WEAPON_GUN:

        goTower.name = "TowerGun";
        goWeapon = Duplicate(originalWeaponGun);
        goWeapon.name = "WeaponGun";
        weapon = (Weapon) goWeapon.GetComponent(typeof(WeaponGun));

        print("<factory create tower: gun>");

        break;

      case Weapon.WeaponType.WEAPON_CANNON:

        goTower.name = "TowerCannon";
        goWeapon = Duplicate(originalWeaponCannon);
        goWeapon.name = "WeaponCannon";
        weapon = (Weapon) goWeapon.GetComponent(typeof(WeaponCannon));

        print("<factory create tower: cannon>");

        break;

      case Weapon.WeaponType.WEAPON_LASER:

        goTower.name = "TowerLaser";
        goWeapon = Duplicate(originalWeaponLaser);
        goWeapon.name = "WeaponLaser";
        weapon = (Weapon) goWeapon.GetComponent(typeof(WeaponLaser));

        print("<factory create tower: laser>");

        break;

      case Weapon.WeaponType.WEAPON_FLAME:

        goTower.name = "TowerFlame";
        goWeapon = Duplicate(originalWeaponFlame);
        goWeapon.name = "WeaponFlame";
        weapon = (Weapon) goWeapon.GetComponent(typeof(WeaponFlame));

        print("<factory create tower: flame>");

        break;
    }

    goWeapon.transform.position = goTowerTop.transform.position;
    goWeapon.transform.rotation = goTowerTop.transform.rotation;

    goWeapon.transform.parent = goTower.transform;

    tower.Bind(weapon);

    weapon.factory = this;
    weapon.Reset();

    return tower;
  }

  // fonction qui permet d'instancier un projectile selon le type passé en paramètre
  public GameObject CreateProjectile(Projectile.ProjectileType type)
  {
    switch (type)
    {
      case Projectile.ProjectileType.PROJECTILE_GUN:

        goProjectile = Duplicate(originalProjectileGun);
        goProjectile.transform.position = originalProjectileGun.transform.position;

        print("<factory create projectile: gun>");

        break;

      case Projectile.ProjectileType.PROJECTILE_CANNON:

        goProjectile = Duplicate(originalProjectileCannon);
        goProjectile.transform.position = originalProjectileCannon.transform.position;

        print("<factory create projectile: cannon>");

        break;

      case Projectile.ProjectileType.PROJECTILE_LASER:

        goProjectile = Duplicate(originalProjectileLaser);
        goProjectile.transform.position = originalProjectileLaser.transform.position;

        print("<factory create projectile: laser>");

        break;

      case Projectile.ProjectileType.PROJECTILE_FLAME:

        goProjectile = Duplicate(originalProjectileFlame);
        goProjectile.transform.position = originalProjectileFlame.transform.position;

        print("<factory create projectile: flame>");

        break;
    }

    return goProjectile;
  }

  // fonction qui permet d'instancier un effet visuel selon le type passé en paramètre
  public GameObject CreateFX(Projectile.ProjectileType type)
  {
    switch (type)
    {
      case Projectile.ProjectileType.PROJECTILE_GUN:

        goFX = Duplicate(originalImpactGun);
        goFX.transform.position = originalImpactGun.transform.position;

        print("<factory create fx: gun>");

        break;

      case Projectile.ProjectileType.PROJECTILE_CANNON:

        goFX = Duplicate(originalImpactCannon);
        goFX.transform.position = originalImpactCannon.transform.position;

        print("<factory create fx: cannon>");

        break;

      case Projectile.ProjectileType.PROJECTILE_LASER:

        goFX = Duplicate(originalImpactLaser);
        goFX.transform.position = originalImpactLaser.transform.position;

        print("<factory create fx: laser>");

        break;

      case Projectile.ProjectileType.PROJECTILE_FLAME:

        goFX = Duplicate(originalImpactFlame);
        goFX.transform.position = originalImpactFlame.transform.position;

        print("<factory create fx: flame>");

        break;
    }

    return goFX;
  }

  // fonction qui affiche dans la console la liste des objets instanciés en mémoire par cette instance de classe
  public void Dump()
  {
    print("<factory dump>");

    for (int index = 0; index < listAssetsInMemory.Count; ++index)
    {
      go = (GameObject) listAssetsInMemory[index];

      print("object: " + go);
    }

    print("<factory dump>");
  }
}
