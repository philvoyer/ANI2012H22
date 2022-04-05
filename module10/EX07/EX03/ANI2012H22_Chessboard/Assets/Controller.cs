// ANI2012A20_Grid/Controller.cs | Programmation C# avec Unity
// Exemples de génération procédurale d'une grille avec un pattern d'échiquier,
// avec animation (par oscillation, touche espace) et quelques sources d'interactivité au clavier (touches : ↑ ↓ ← →).
// La scène peut être observée du point de vue de 2 caméras (touches : w et s).
// La caméra active peut avancer et reculer (touches : a et d).
// Ce script est assigné à l'objet 'Origin' dans la scène (Scene.unity).

using System;
using System.Collections.Generic;

using UnityEngine;
using UnityEngine.UI;

public class Controller : MonoBehaviour
{
  public GameObject boxWhite;
  public GameObject boxBlack;

  public Transform spotlight;

  public Camera cameraPerspective;
  public Camera cameraTop;
  public Camera cameraActive;

  public Text textboxFPS;
  public Text textboxInfo;

  public GUIStyle style;

  public Vector3 stateMouse;
  public Vector3 stateMousePosition;

  public int sizeX;
  public int sizeY;

  public int positionX;
  public int positionY;

  public int skip;

  public bool action;

  private List<GameObject> grid;

  private GameObject gridRootTransform;

  private Transform transformation;

  private Quaternion orientation;

  private Vector3 position = new Vector3(-1.5f, 5.0f, 0.0f);

  private Vector3 scaleSelected = new Vector3(1.33f, 1.33f, 1.33f);
  private Vector3 scaleNormal = new Vector3(1.0f, 1.0f, 1.0f);

  private Ray ray;
  private RaycastHit hit;

  private float fps;
  private float time;

  private int selected;

  private int boxCount;

  private int frame;

  private bool animate;

  // fonction d'initialisation
  void Start()
  {
    fps = time = frame = 0;

    positionX = positionY = selected = 1;

    sizeX = sizeY = 8;

    skip = 5;

    animate = action = false;

    orientation = Quaternion.identity;

    cameraActive = cameraPerspective;

    gridRootTransform = new GameObject();
    gridRootTransform.name = "Grid";

    boxWhite = InstanciatePrefab("BoxWhite", position, orientation);
    boxBlack = InstanciatePrefab("BoxBlack", position, orientation);

    grid = new List<GameObject>();

    GenerateGrid(sizeX, sizeY);
  }

  // fonction de mise à jour
  void Update()
  {
    UpdateKeyboard();
    UpdateMouse();
    UpdateScene();
  }

  // interactivité au clavier
  void UpdateKeyboard()
  {
    if (Input.GetKey("up"))
      Move(0, 1);
    if (Input.GetKey("down"))
      Move(0, -1);
    if (Input.GetKey("left"))
      Move(-1, 0);
    if (Input.GetKey("right"))
      Move(1, 0);

    if (Input.GetKeyUp("space"))
      animate = !animate;

    if (Input.GetKey("a"))
      Dolly(5);
    if (Input.GetKey("d"))
      Dolly(-5);

    if (Input.GetKey("w"))
      SetActiveCamera(cameraTop);
    if (Input.GetKey("s"))
      SetActiveCamera(cameraPerspective);

    if (Input.GetKeyUp("1"))
      GenerateGrid(2, 2);
    if (Input.GetKeyUp("2"))
      GenerateGrid(4, 4);
    if (Input.GetKeyUp("3"))
      GenerateGrid(8, 8);
    if (Input.GetKeyUp("4"))
      GenerateGrid(10, 10);
    if (Input.GetKeyUp("5"))
      GenerateGrid(12, 12);
    if (Input.GetKeyUp("6"))
      GenerateGrid(16, 16);
    if (Input.GetKeyUp("7"))
      GenerateGrid(20, 20);
    if (Input.GetKeyUp("8"))
      GenerateGrid(32, 32);
    if (Input.GetKeyUp("9"))
      GenerateGrid(64, 64);
    if (Input.GetKeyUp("0"))
      GenerateGrid(128, 128);
  }

  // interactivité à la souris
  void UpdateMouse()
  {
    // valider si un bouton de la souris est relâché
    if (Input.GetKeyUp(KeyCode.Mouse0))
    {
      stateMousePosition.x = Input.mousePosition.x;
      stateMousePosition.y = Input.mousePosition.y;

      // lancer un rayon dans l'espace de la scène à partir de la position du clic dans l'espace de la fenêtre d'affichage
      ray = cameraActive.ScreenPointToRay(stateMousePosition);

      // valider si le rayon entre en collision avec un objet de la scène
      if (Physics.Raycast(ray, out hit))
      {
        String goName = hit.collider.gameObject.name;

        print("pick: " + goName);
      }
    }
  }

  // fonction de mise à jour de la scène
  void UpdateScene()
  {
    if (grid.Count > 0)
    {
      for (int index = 0 ; index < sizeX * sizeY ; ++index)
      {
        transformation = grid[index].transform;

        if (animate)
        {
          position = transformation.position;
          position.y = (float) Oscillate(Time.time - index, 1.0f, 5.0f);

          transformation.position = position;
        }

        if (index == selected)
          transformation.localScale = scaleSelected;
        else
          transformation.localScale = scaleNormal;
      }

      spotlight.position = grid[selected].transform.position;
      spotlight.Translate(0.0f, 0.0f, -5.0f, Space.Self);
    }
  }

  // fonction de mise à jour de l'interface
  void UpdateInterface()
  {
    time += Time.deltaTime;

    frame++;

    if (time >= 1.0f)
    {
      fps = frame;

      frame = 0;

      time -= 1.0f;
    }

    if (fps < 30)
      textboxFPS.color = Color.red;
    else if (fps < 50)
      textboxFPS.color = Color.yellow;
    else
      textboxFPS.color = Color.green;

    textboxFPS.text = "fps " + fps;
    textboxInfo.text = "box " + boxCount;
  }

  // fonction qui génère procéduralement une grille de x par y cubes, qui s'alternent comme un échiquier
  public void GenerateGrid(int x, int y)
  {
    GameObject clone;

    boxWhite.SetActive(true);
    boxBlack.SetActive(true);

    if (grid.Count > 0)
    {
      GameObject go;

      for (int index = 0 ; index < sizeX * sizeY ; ++index)
      {
        go = (GameObject)grid[index];

        Destroy(go);
      }

      grid.Clear();
    }

    sizeX = x;
    sizeY = y;

    boxCount = sizeX * sizeY;

    for (int indexY = 0; indexY < sizeY; ++indexY)
    {
      for (int indexX = 0; indexX < sizeX; ++indexX)
      {
        if (indexX % 2 == indexY % 2)
          clone = Duplicate(boxBlack);
        else
          clone = Duplicate(boxWhite);

        position.x = indexX - sizeX / 2.0f + 0.5f;
        position.y = -0.5f;
        position.z = indexY - sizeY / 2.0f + 0.5f;

        clone.name = "Grid("+ indexX + "," + indexY + ")";

        clone.transform.parent = gridRootTransform.transform;

        clone.transform.position = position;

        grid.Add(clone);
      }
    }

    // position initiale au centre
    positionX = sizeX / 2;
    positionY = sizeY / 2;

    selected = (positionY - 1) * sizeY + (positionX - 1);

    boxWhite.SetActive(false);
    boxBlack.SetActive(false);

    print("generate grid(" + sizeX + "x" + sizeY + ")");
  }

  // fonction qui permet de déplacer la case sélectionnée dans la grille
  void Move(int deltaX, int deltaY)
  {
    // sauter quelques frames pour ralentir la vitesse de déplacement
    if (Time.frameCount % skip == 0)
    {
      positionX += deltaX;
      positionY += deltaY;
    }

    if (positionX <= 0)
      positionX = sizeX;
    if (positionX > sizeX)
      positionX -= sizeX;
    if (positionY <= 0)
      positionY = sizeY;
    if (positionY > sizeY )
      positionY -= sizeY;

    selected = (positionY - 1) * sizeY + (positionX - 1);

    print("move (" + deltaX + "," + deltaY + ") to grid position (" + positionX + "," + positionY + ") at index " + selected);
  }

  // fonction qui permet de désactiver la caméra présentement active et d'activer la caméra passée en paramètre
  void SetActiveCamera(Camera c)
  {
    cameraActive.enabled = false;
    cameraActive = c;
    cameraActive.enabled = true;
  }

  // fonction qui permet d'avancer et de reculer la caméra sur son axe Z local
  void Dolly(float delta)
  {
    cameraActive.transform.Translate(0.0f, 0.0f, delta * Time.deltaTime, Space.Self);
  }

  // fonction d'oscillation
  double Oscillate(double timeElapsed, double amplitude, double period)
  {
    return amplitude * Math.Sin(timeElapsed * 2 * Math.PI / period);
  }

  // fonction qui permet de dupliquer le GameObject passé en paramètre et de retourner un clone avec la même transformation
  public GameObject Duplicate(GameObject source)
  {
    GameObject clone;

    Vector3 sourcePosition = source.transform.position;
    Quaternion sourceRotation = source.transform.rotation;

    clone = Instantiate(source, sourcePosition, sourceRotation) as GameObject;

    clone.name = source.name;

    print("duplicate: " + source.name + " at: " + sourcePosition);

    return clone;
  }

  // fonction qui permet d'instancier le prefab passé en paramètre et de retourner un clone avec une transformation initiale
  public GameObject InstanciatePrefab(string prefabName, Vector3 initialPosition, Quaternion initialRotation)
  {
    GameObject clone;

    clone = Instantiate(Resources.Load<GameObject>(prefabName), initialPosition, initialRotation) as GameObject;

    clone.name = prefabName;

    print("instanciate prefab: " + prefabName);

    return clone;
  }

  void OnGUI()
  {
    UpdateInterface();
  }
}
