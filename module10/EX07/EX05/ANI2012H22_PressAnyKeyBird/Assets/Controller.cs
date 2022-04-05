// ANI2012A20_PressAnyKeyBird/Controller.cs | Programmation C# avec Unity
// Animation d'un oiseau qui appuie sur des boutons en fonction de l'interactivité de l'utilisateur ou en mode automatique si aucune action.

using UnityEngine;

public class Controller : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public GameObject bird;

  public GameObject pivotX;
  public GameObject pivotY;
  public GameObject pivotZ;

  public GameObject buttonQ;
  public GameObject buttonW;
  public GameObject buttonE;
  public GameObject buttonD;
  public GameObject buttonC;
  public GameObject buttonX;
  public GameObject buttonZ;
  public GameObject buttonA;

  public Vector3 axis;

  public Vector3 stateMouse;
  public Vector3 stateMousePosition;

  public Quaternion quaternionCurrentX;
  public Quaternion quaternionCurrentY;

  public float playhead;
  public float start;
  public float duration;
  public float speed;
  public float smooth;

  public float angle;

  public bool stateKeyAny;

  public bool animate;
  public bool reverse;

  public bool automatic;

  // données membres privées
  private Vector3 offset;

  private Quaternion quaternionFromX;
  private Quaternion quaternionToX;

  private Quaternion quaternionFromY;
  private Quaternion quaternionToY;

  private Ray ray;
  private RaycastHit hit;

  private double timeLastAction;

  private bool stateMouseButton;

  private bool stateKeySpace;
  private bool stateKeyArrowLeft;
  private bool stateKeyArrowRight;
  private bool stateKeyArrowUp;
  private bool stateKeyArrowDown;
  private bool stateKeyQ;
  private bool stateKeyW;
  private bool stateKeyE;
  private bool stateKeyD;
  private bool stateKeyC;
  private bool stateKeyX;
  private bool stateKeyZ;
  private bool stateKeyA;
  private bool stateKeyS;

  private bool stateButton1;
  private bool stateButton2;
  private bool stateButton3;
  private bool stateButton4;
  private bool stateButton5;
  private bool stateButton6;
  private bool stateButton7;
  private bool stateButton8;

  // fonction d'initialisation
  void Start()
  {
    offset = new Vector3();
    axis = new Vector3();
    stateMouse = new Vector3();
    stateMousePosition = new Vector3();

    quaternionFromX = Quaternion.identity;
    quaternionFromY = Quaternion.identity;
    quaternionToX = Quaternion.identity;
    quaternionToY = Quaternion.identity;

    offset.x = 30;
    offset.y = 45;
    offset.z = 0;

    reverse = false;
    animate = false;

    timeLastAction = Time.time;

    Setup();

    print("<start>");
  }

  // fonction de mise à jour
  void Update()
  {
    UpdateInteractivity();
    UpdateScene();
  }

  // fonction de réinitialisation
  void Setup()
  {
    // réinitialiser les états des contrôles interactifs
    stateKeyAny = stateKeyArrowUp = stateKeyArrowDown = stateKeyArrowLeft = stateKeyArrowRight = stateKeySpace = stateMouseButton = false;
    stateKeyQ = stateKeyW = stateKeyE = stateKeyD = stateKeyC = stateKeyX = stateKeyZ = stateKeyA = stateKeyS = false;
    stateButton1 = stateButton2 = stateButton3 = stateButton4 = stateButton5 = stateButton6 = stateButton7 = stateButton8 = false;

    // réinitialiser les données d'animation
    duration = 0.5f;
    playhead = 0.0f;
    speed = 1.0f;
    smooth = 1.0f;

    automatic = false;

    start = Time.time;
  }

  // fonction de mise à jour de l'interactivité
  void UpdateInteractivity()
  {
    stateKeyAny          = Input.anyKey;
    stateKeySpace        = Input.GetKey("space");
    stateKeyArrowUp      = Input.GetKey("up");
    stateKeyArrowDown    = Input.GetKey("down");
    stateKeyArrowLeft    = Input.GetKey("left");
    stateKeyArrowRight   = Input.GetKey("right");
    stateKeyQ            = Input.GetKey(KeyCode.Q);
    stateKeyW            = Input.GetKey(KeyCode.W);
    stateKeyE            = Input.GetKey(KeyCode.E);
    stateKeyD            = Input.GetKey(KeyCode.D);
    stateKeyC            = Input.GetKey(KeyCode.C);
    stateKeyX            = Input.GetKey(KeyCode.X);
    stateKeyZ            = Input.GetKey(KeyCode.Z);
    stateKeyA            = Input.GetKey(KeyCode.A);
    stateKeyS            = Input.GetKey(KeyCode.S);
    stateMousePosition.x = Input.mousePosition.x;
    stateMousePosition.y = Input.mousePosition.y;
    stateMouseButton     = Input.GetKey(KeyCode.Mouse0);

    // mesurer le temps écoulé depuis la dernière action
    if (Time.time - timeLastAction > 3.0f)
      automatic = true;
  }

  // fonction de mise à jour de la scène
  void UpdateScene()
  {
    // valider si une animation est en cours
    if (!animate)
    {
      // valider si au moins une action a été exécutée par l'utilisateur
      if (stateKeyAny)
      {
        // conserver le temps de la dernière action dans une variable
        timeLastAction = Time.time;

        // désactiver le mode d'animation automatique
        automatic = false;
      }

      // valider si la touche 'space' a été appuyée
      if (stateKeySpace)
      {
        // déterminer un bouton au hasard
        ChooseButton();
      }

      // valider l'animation est en mode automatique
      if (automatic)
      {
        // déterminer le comportement de l'oiseau
        ChooseBehavior();
      }

      // valider si un bouton de la souris est appuyé
      if (stateMouseButton)
      {
        // valider si le clic est sur un bouton
        PickButton();
      }

      // modifier l'état du bouton en fonction de l'état des touches du clavier
      UpdateButtonStates();

      // configurer l'animation de l'oiseau
      BirdAnimationSetup();

      // déterminer si une nouvelle animation peut être déclenchée
      animate = automatic || stateKeySpace || stateMouseButton || stateKeyArrowUp || stateKeyArrowDown || stateKeyArrowLeft || stateKeyArrowRight || stateKeyQ || stateKeyW || stateKeyE || stateKeyD  || stateKeyC || stateKeyX || stateKeyZ || stateKeyA || stateKeyS ? true : false;

      if (animate)
      {
        // réinitialiser les états pour une nouvelle animation
        Setup();
      }
    }

    // valider si une animation est en cours
    if (animate)
    {
      // mise à jour de l'animation
      UpdateAnimation();
    }
  }

  // fonction qui détermine au hasard qu'elle sera le prochain comportement de l'oiseau en mode automatique
  void ChooseBehavior()
  {
    switch (Random.Range(1, 10))
    {
      case 1:
        stateButton1 = true;
        break;
      case 2:
        stateButton2 = true;
        break;
      case 3:
        stateButton3 = true;
        break;
      case 4:
        stateButton4 = true;
        break;
      case 5:
        stateButton5 = true;
        break;
      case 6:
        stateButton6 = true;
        break;
      case 7:
        stateButton7 = true;
        break;
      case 8:
        stateButton8 = true;
        break;
      case 9:
        timeLastAction = Time.time + 1;
        print("<pause>");
        break;
      case 10:
        timeLastAction = Time.time + 2;
        print("<pause>");
        break;
      default:
        break;
    }
  }

  // fonction qui choisit un bouton au hasard
  void ChooseButton()
  {
    switch (Random.Range(1,8))
    {
      case 1:
        stateButton1 = true;
        break;
      case 2:
        stateButton2 = true;
        break;
      case 3:
        stateButton3 = true;
        break;
      case 4:
        stateButton4 = true;
        break;
      case 5:
        stateButton5 = true;
        break;
      case 6:
        stateButton6 = true;
        break;
      case 7:
        stateButton7 = true;
        break;
      case 8:
        stateButton8 = true;
        break;
      default:
        break;
    }
  }

  // fonction qui permet de sélectionner un bouton avec un clic de souris
  void PickButton()
  {
    // lancer un rayon dans l'espace de la scène à partir de la position du clic dans l'espace de l'écran
    ray = Camera.main.ScreenPointToRay(stateMousePosition);

    // valider si le rayon entre en collision avec un objet de la scène
    if (Physics.Raycast(ray, out hit))
    {
      // valider l'objet en collision avec le rayon à un attribut
      if (hit.collider.gameObject.tag == "Pickable")
      {
        // déclencher l'animation du bouton
        hit.collider.gameObject.GetComponent<Animation>().Play("ButtonAnimation");

        // conserver l'état du bouton dans une variable
        switch (hit.collider.gameObject.name)
        {
          case "Q":
            stateButton1 = true;
            break;
          case "W":
            stateButton2 = true;
            break;
          case "E":
            stateButton3 = true;
            break;
          case "D":
            stateButton4 = true;
            break;
          case "C":
            stateButton5 = true;
            break;
          case "X":
            stateButton6 = true;
            break;
          case "Z":
            stateButton7 = true;
            break;
          case "A":
            stateButton8 = true;
            break;

          default:
            break;
        }
      }
    }
  }

  // fonction qui modifie l'état des boutons en fonction de l'état de touches du clavier
  void UpdateButtonStates()
  {
    stateButton1 = stateButton1 || stateKeyQ  ? true : false;
    stateButton2 = stateButton2 || stateKeyW || stateKeyArrowUp ? true : false;
    stateButton3 = stateButton3 || stateKeyE ? true : false;
    stateButton4 = stateButton4 || stateKeyD || stateKeyArrowRight ? true : false;
    stateButton5 = stateButton5 || stateKeyC ? true : false;
    stateButton6 = stateButton6 || stateKeyX || stateKeyArrowDown ? true : false;
    stateButton7 = stateButton7 || stateKeyZ ? true : false;
    stateButton8 = stateButton8 || stateKeyA || stateKeyArrowLeft ? true : false;
  }

  // fonction qui permet de configurer l'animation de l'oiseau vers un des boutons
  void BirdAnimationSetup()
  {
    // animation du changement d'orientation de l'oiseau vers le bouton 1
    if (stateButton1)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(-offset.y, Vector3.up);

      buttonQ.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 1>");
    }

    // animation du changement d'orientation de l'oiseau vers le bouton 2
    if (stateButton2)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(offset.z, Vector3.up);

      buttonW.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 2>");
    }

    // animation du changement d'orientation de l'oiseau vers le bouton 3
    if (stateButton3)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(offset.y, Vector3.up);

      buttonE.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 3>");
    }

    // animation du changement d'orientation de l'oiseau vers le bouton 4
    if (stateButton4)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(offset.y * 2, Vector3.up);

      buttonD.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 4>");
    }

    // animation du changement d'orientation de l'oiseau vers le bouton 5
    if (stateButton5)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(offset.y * 3, Vector3.up);

      buttonC.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 5>");
    }

    // animation du changement d'orientation de l'oiseau vers le bouton 6
    if (stateButton6)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(-offset.y * 4, Vector3.up);

      buttonX.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 6>");
    }

    // animation du changement d'orientation de l'oiseau vers le bouton 7
    if (stateButton7)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(-offset.y * 3, Vector3.up);

      buttonZ.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 7>");
    }

    // animation du changement d'orientation de l'oiseau vers le bouton 8
    if (stateButton8)
    {
      quaternionFromX = quaternionToX;
      quaternionFromY = quaternionToY;
      quaternionToX = Quaternion.AngleAxis(offset.x, Vector3.right);
      quaternionToY = Quaternion.AngleAxis(-offset.y * 2, Vector3.up);

      buttonA.GetComponent<Animation>().Play("ButtonAnimation");

      print("<bird push button 8>");
    }
  }

  // fonction de mise à jour des données d'animation
  void UpdateAnimation()
  {
    // mise à jour de la tête de lecture de l'animation
    playhead = ((Time.time - start) * speed) / duration;

    // borner la position de la tête de lecture dans l'intervalle [0,1]
    playhead = playhead > 1.0f ? 1.0f : playhead < 0.0f ? 0.0f : playhead;

    // mise à jour des quaternions d'orientation par interpolation sphérique linéaire (slerp)
    quaternionCurrentY = Quaternion.Slerp(quaternionFromY, quaternionToY, playhead);
    quaternionCurrentX = Quaternion.Slerp(quaternionFromX, quaternionToX, playhead);

    // extraction de l'orientation du quaternion sous forme d'un axe de rotation et d'un angle
    quaternionCurrentY.ToAngleAxis(out angle, out axis);

    // orienter le point de pivot en Y de l'oiseau
    pivotY.transform.Rotate(axis, angle, Space.Self);

    // réinitialiser l'orientation du point de pivot en X, pour le ramener à l'orientation du parent hiérarchique (point de pivot en Y)
    pivotX.transform.rotation = Quaternion.identity;

    // extraction de l'orientation du quaternion sous forme d'un axe de rotation et d'un angle
    quaternionCurrentY.ToAngleAxis(out angle, out axis);

    // orienter le point de pivot en X de l'oiseau
    pivotX.transform.Rotate(axis, angle, Space.Self);

    // extraction de l'orientation du quaternion sous forme d'un axe de rotation et d'un angle
    quaternionCurrentX.ToAngleAxis(out angle,out axis);

    // orienter le point de pivot en X de l'oiseau
    pivotX.transform.Rotate(axis, angle, Space.Self);

    // valider si l'animaton est complétée
    if (playhead >= 1.0f)
    {
      // valider la direction de l'animation
      if (reverse)
      {
        reverse = false;
        animate = false;

        quaternionFromX = quaternionToX;
        quaternionFromY = quaternionToY;
      }
      else
      {
        // inverser l'animation
        reverse = true;

        quaternionFromX = quaternionToX;
        quaternionFromY = quaternionToY;

        quaternionToX = Quaternion.identity;
        quaternionToY = quaternionFromY;

        // réinitialiser les données d'animation
        Setup();
      }
    }
  }
}
