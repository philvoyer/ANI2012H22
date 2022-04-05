// ANI2012A20_Crane/Controller.cs | Programmation C# avec Unity
// Animation d'une grue avec un aimant magnétique qui permet d'interagir avec des boîtes.

using UnityEngine;

public class Controller : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public GameObject actorMove;
  public GameObject actorRotate;
  public GameObject actorLift;
  public GameObject actorHead;
  public GameObject actorRope;
  public GameObject actorMagnetic;

  public Vector3 speed;
  public Vector3 position;

  public LineRenderer lineRenderer;

  public float rangeLiftMin;
  public float rangeLiftMax;
  public float rangeMoveMin;
  public float rangeMoveMax;
  public float rangeRotateMin;
  public float rangeRotateMax;

  public float liftCurrentY;

  public float liftMinY;
  public float liftMaxY;

  public float moveCurrentZ;
  public float moveMinZ;
  public float moveMaxZ;

  public float rotateCurrentY;
  public float rotateMinY;
  public float rotateMaxY;

  public float tresholdMagnetMin;
  public float tresholdMagnetMax;

  public bool stateKeyAny;
  public bool magnetic;

  // données membres privées
  private GameObject[] crates;

  private Vector3 delta;

  private double timeLastAction;

  private float distance;

  private bool stateKeySpace;
  private bool stateKeyArrowLeft;
  private bool stateKeyArrowRight;
  private bool stateKeyArrowUp;
  private bool stateKeyArrowDown;
  private bool stateKeyQ;
  private bool stateKeyW;
  private bool stateKeyE;
  private bool stateKeyA;
  private bool stateKeyS;
  private bool stateKeyD;

  private bool actionLiftDown;
  private bool actionLiftUp;
  private bool actionMoveForward;
  private bool actionMoveBackward;
  private bool actionRotateLeft;
  private bool actionRotateRight;

  // fonction d'initialisation
  void Start()
  {
    speed.x = 5;
    speed.y = 45;
    speed.z = 5;

    rangeLiftMin = -6.5f;
    rangeLiftMax = 0;
    rangeMoveMin = -10;
    rangeMoveMax = 10;
    rangeRotateMin = 0;
    rangeRotateMax = 360;

    tresholdMagnetMin = 5;
    tresholdMagnetMax = 15;

    crates = GameObject.FindGameObjectsWithTag("Crate");

    actorMagnetic.GetComponent<Renderer>().enabled = false;

    lineRenderer = actorRope.GetComponent(typeof(LineRenderer)) as LineRenderer;
    lineRenderer.SetPosition(0, actorHead.transform.position);
    lineRenderer.SetPosition(1, actorLift.transform.position);

    Reset();

    Debug.Log("<start>");
  }

  // fonction de mise à jour
  void Update()
  {
    UpdateInteractivity();
    UpdateScene();
  }

  // fonction de réinitialisation
  void Reset()
  {
    stateKeyAny = stateKeyArrowUp = stateKeyArrowDown = stateKeyArrowLeft = stateKeyArrowRight = stateKeySpace = false;
    stateKeyQ = stateKeyW = stateKeyE = stateKeyA = stateKeyS = stateKeyD = false;
    actionLiftDown = actionLiftUp = actionMoveForward = actionMoveBackward = actionRotateLeft = actionRotateRight = false;
  }

  // fonction de mise à jour de l'interactivité
  void UpdateInteractivity()
  {
    stateKeyAny        = Input.anyKey;
    stateKeySpace      = Input.GetKey("space");
    stateKeyArrowUp    = Input.GetKey("up");
    stateKeyArrowDown  = Input.GetKey("down");
    stateKeyArrowLeft  = Input.GetKey("left");
    stateKeyArrowRight = Input.GetKey("right");
    stateKeyQ          = Input.GetKey(KeyCode.Q);
    stateKeyW          = Input.GetKey(KeyCode.W);
    stateKeyE          = Input.GetKey(KeyCode.E);
    stateKeyA          = Input.GetKey(KeyCode.A);
    stateKeyS          = Input.GetKey(KeyCode.S);
    stateKeyD          = Input.GetKey(KeyCode.D);
  }

  // fonction de mise à jour de la scène
  void UpdateScene()
  {
    if (stateKeyAny)
    {
      lineRenderer.SetPosition(0, actorHead.transform.position);
      lineRenderer.SetPosition(1, actorLift.transform.position);
    }

    if (stateKeySpace)
      magnetic = true;
    else
      magnetic = false;

    if (magnetic)
      actorMagnetic.GetComponent<Renderer>().enabled = true;
    else
      actorMagnetic.GetComponent<Renderer>().enabled = false;

    actionLiftDown = actionLiftDown || stateKeyQ ? true : false;
    actionLiftUp   = actionLiftUp   || stateKeyE ? true : false;

    actionMoveForward  = actionMoveForward  || stateKeyW || stateKeyArrowUp    ? true : false;
    actionMoveBackward = actionMoveBackward || stateKeyS || stateKeyArrowDown  ? true : false;

    actionRotateLeft   = actionRotateLeft   || stateKeyA || stateKeyArrowLeft  ? true : false;
    actionRotateRight  = actionRotateRight  || stateKeyD || stateKeyArrowRight ? true : false;

    if (actionLiftDown)
    {
      actorLift.transform.Translate(0, -speed.x * Time.deltaTime,  0, Space.Self);
      position.Set(
        actorLift.transform.localPosition.x,
        Mathf.Clamp(actorLift.transform.localPosition.y, rangeLiftMin, rangeLiftMax),
        actorLift.transform.localPosition.z);
      actorLift.transform.localPosition = position;
    }

    if (actionLiftUp)
    {
      actorLift.transform.Translate(0, speed.x * Time.deltaTime, 0, Space.Self);
      position.Set(
        actorLift.transform.localPosition.x,
        Mathf.Clamp(actorLift.transform.localPosition.y, rangeLiftMin, rangeLiftMax),
        actorLift.transform.localPosition.z);
      actorLift.transform.localPosition = position;
    }

    if (actionMoveForward)
    {
      actorMove.transform.Translate(0, 0, speed.z * Time.deltaTime, Space.Self);
      position.Set(
        actorMove.transform.localPosition.x,
        actorMove.transform.localPosition.y,
        Mathf.Clamp(actorMove.transform.localPosition.z, rangeMoveMin, rangeMoveMax));
      actorMove.transform.localPosition = position;
    }

    if (actionMoveBackward)
    {
      actorMove.transform.Translate(0, 0, -speed.z * Time.deltaTime, Space.Self);
      position.Set(
        actorMove.transform.localPosition.x,
        actorMove.transform.localPosition.y,
        Mathf.Clamp(actorMove.transform.localPosition.z, rangeMoveMin, rangeMoveMax));
      actorMove.transform.localPosition = position;
    }

    if (actionRotateLeft)
    {
      actorRotate.transform.Rotate(0, -speed.y * Time.deltaTime, 0);
    }

    if (actionRotateRight)
    {
      actorRotate.transform.Rotate(0, speed.y * Time.deltaTime, 0);
    }

    foreach (GameObject crate in crates)
    {
      if (magnetic)
      {
        position = crate.transform.position;
        delta    = crate.transform.position - actorLift.transform.position;
        distance = delta.sqrMagnitude;

        if (distance < tresholdMagnetMax)
        {
          crate.GetComponent<Collider>().GetComponent<Rigidbody>().isKinematic = true;

          position = position + (-delta * 0.2f);

          if (distance > tresholdMagnetMin)
            crate.transform.position = position;
        }
        else
        {
          crate.GetComponent<Collider>().GetComponent<Rigidbody>().isKinematic = false;
          crate.GetComponent<Collider>().GetComponent<Rigidbody>().WakeUp();
        }
      }
      else
      {
        if (crate.GetComponent<Collider>().GetComponent<Rigidbody>().isKinematic)
        {
          crate.GetComponent<Collider>().GetComponent<Rigidbody>().isKinematic = false;
          crate.GetComponent<Collider>().GetComponent<Rigidbody>().WakeUp();
        }
      }
    }
    Reset();
  }
}
