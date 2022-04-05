// ANI2012A20_PushingCube/Player.cs | Programmation C# avec Unity
// Classe de type Player, responsable de gérer la logique de jeu du joueur.

using UnityEngine;

public class Player : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public GameObject gameObjectEngine;

  public Vector3 velocity;

  public float power;
  public float speed;

  public int boxCount;

  // données membres privées
  private Controller controller;

  // fonction d'initialisation
  void Start()
  {
    // aller chercher une référence sur l'instance de la classe principale du projet
    controller = gameObjectEngine.GetComponent(typeof(Controller)) as Controller;

    boxCount = 0;

    power = 10;

    velocity.Set(0, 0, 0);

    print("player init");
  }

  // fonction de mise à jour
  void Update()
  {
    velocity = controller.keyboardInput * speed;

    Move(velocity);
  }

  // fonction de transformation de la position du joueur
  public void Move(Vector3 v)
  {
    transform.Translate(
      v.x, v.y, v.z,
      Space.World);
  }

  // fonction invoquée lorsqu'il y a impact entre le joueur et un autre objet de la scène
  void OnCollisionEnter(Collision collision)
  {
    // print("<collision with " + collision.gameObject.name + ">");
  }
}
