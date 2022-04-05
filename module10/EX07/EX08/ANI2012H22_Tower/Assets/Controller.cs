// ANI2012A20_Tower/Controller.cs | Programmation C# avec Unity
// Classe de type Engine, la classe principale du projet.

using UnityEngine;
using System.Collections;

public class Controller : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public Tower gun;
  public Tower cannon;
  public Tower laser;
  public Tower flame;

  public Vector3 inputForce;

  // données membres publiques masquées dans l'éditeur
  [HideInInspector]
  public Factory factory;

  [HideInInspector]
  public Tower tower;

  [HideInInspector]
  public Weapon weapon;

  [HideInInspector]
  public GameObject goTower;

  [HideInInspector]
  public GameObject goWeapon;

  // données membres privées
  private Vector3 stateMousePosition;

  private Ray ray;
  private RaycastHit hit;

  private bool stateKeyAny;
  private bool stateKeySpace;
  private bool stateKeyArrowLeft;
  private bool stateKeyArrowRight;
  private bool stateKeyArrowUp;
  private bool stateKeyArrowDown;
  private bool stateKeyW;
  private bool stateKeyA;
  private bool stateKeyS;
  private bool stateKeyD;
  private bool stateKey1;
  private bool stateKey2;
  private bool stateKey3;
  private bool stateKey4;
  private bool stateMouseLeft;

  private bool isStarted;

  // fonction d'initialisation
  void Start ()
  {
    factory = (Factory) GetComponent(typeof(Factory));

    inputForce = new Vector3(1.0f, 1.0f, 0.0f);

    isStarted = false;

    Debug.Log("<engine start>");

    StartCoroutine(LateStartup(0.5f));
  }

  // fonction qui permet d'attendre un certain délai avant d'exécuter une autre fonction
  IEnumerator LateStartup(float delay)
  {
    yield return new WaitForSeconds(delay);
    Ignite();
  }

  // fonction de démarrage du moteur
  void Ignite()
  {
    if (!isStarted)
    {
      Debug.Log("<controller ignite>");

      isStarted = true;

      // instancier les tours
      gun    = factory.CreateTower(Weapon.WeaponType.WEAPON_GUN);
      cannon = factory.CreateTower(Weapon.WeaponType.WEAPON_CANNON);
      laser  = factory.CreateTower(Weapon.WeaponType.WEAPON_LASER);
      flame  = factory.CreateTower(Weapon.WeaponType.WEAPON_FLAME);

      // transformer les tours dans la scène
      gun.transform.position    = new Vector3(-15, 0, -5);
      cannon.transform.position = new Vector3( -5, 0, -5);
      laser.transform.position  = new Vector3(  5, 0, -5);
      flame.transform.position  = new Vector3( 15, 0, -5);

      // tour sélectionnée au lancement de la scène
      Select(Weapon.WeaponType.WEAPON_GUN);

      // énumération du contenu de la scène dans la console
      factory.Dump();
    }
  }

  // fonction de mise à jour de l'interactivité
  void UpdateInteractivity()
  {
    stateKeyAny          = Input.anyKey;
    stateKeyArrowUp      = Input.GetKey("up");
    stateKeyArrowDown    = Input.GetKey("down");
    stateKeyArrowLeft    = Input.GetKey("left");
    stateKeyArrowRight   = Input.GetKey("right");
    stateKeySpace        = Input.GetKey("space");
    stateKeyW            = Input.GetKeyUp(KeyCode.W);
    stateKeyA            = Input.GetKeyUp(KeyCode.A);
    stateKeyS            = Input.GetKeyUp(KeyCode.S);
    stateKeyD            = Input.GetKeyUp(KeyCode.D);
    stateKey1            = Input.GetKeyUp(KeyCode.Alpha1);
    stateKey2            = Input.GetKeyUp(KeyCode.Alpha2);
    stateKey3            = Input.GetKeyUp(KeyCode.Alpha3);
    stateKey4            = Input.GetKeyUp(KeyCode.Alpha4);
    stateMouseLeft       = Input.GetMouseButton(0);
    stateMousePosition.x = Input.mousePosition.x;
    stateMousePosition.y = Input.mousePosition.y;
  }

  // fonction de mise à jour
  void FixedUpdate ()
  {
    UpdateInteractivity();

    if (tower != null)
    {
      if (stateKeySpace || stateMouseLeft)
      {
        tower.weapon.Shoot();
      }
      if (stateKeyArrowUp || stateKeyW)
      {
        tower.weapon.Pitch(-inputForce.x);
      }
      if (stateKeyArrowDown || stateKeyS)
      {
        tower.weapon.Pitch(inputForce.x);
      }
      if (stateKeyArrowLeft || stateKeyA)
      {
        tower.weapon.Yaw(-inputForce.y);
      }
      if (stateKeyArrowRight || stateKeyD)
      {
        tower.weapon.Yaw(inputForce.y);
      }
    }

    if (stateKey1)
    {
      Select(Weapon.WeaponType.WEAPON_GUN);
    }

    if (stateKey2)
    {
      Select(Weapon.WeaponType.WEAPON_CANNON);
    }

    if (stateKey3)
    {
      Select(Weapon.WeaponType.WEAPON_LASER);
    }

    if (stateKey4)
    {
      Select(Weapon.WeaponType.WEAPON_FLAME);
    }

    if (stateKeyAny) {/*...*/}
  }

  // fonction qui permet de sélectionner une tour
  public void Select(Weapon.WeaponType type)
  {
    // désélection de la tour présentement sélectionnée
    if (tower != null)
      tower.weapon.Unselect();

    // sélectionner la nouvelle tour
    switch (type)
    {
      case Weapon.WeaponType.WEAPON_GUN:
        tower = gun;
        break;

      case Weapon.WeaponType.WEAPON_CANNON:
        tower = cannon;
        break;

      case Weapon.WeaponType.WEAPON_LASER:
        tower = laser;
        break;

      case Weapon.WeaponType.WEAPON_FLAME:
        tower = flame;
        break;
    }

    // configuration de la tour sélectionnée
    if (tower != null)
      tower.weapon.Select();
  }
}
