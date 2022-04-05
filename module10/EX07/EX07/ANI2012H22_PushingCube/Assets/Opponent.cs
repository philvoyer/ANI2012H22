// ANI2012A20_PushingCube/Opponent.cs | Programmation C# avec Unity
// Classe de type Opponent, responsable de gérer la logique de jeu de l'adversaire du joueur (AI).

using UnityEngine;

public class Opponent : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public GameObject gameObjectEngine;
  public GameObject gameObjectTarget;

  public Vector3 velocity;

  public float speed;
  public float damage;

  // données membres privées
  private Player player;
  private Controller controller;

  private Vector3 deltaPosition;

  // fonction d'initialisation
  void Start()
  {
    // aller chercher une référence sur l'instance de la classe principale du projet
    controller = gameObjectEngine.GetComponent(typeof(Controller)) as Controller;

    player = controller.player;

    velocity.Set(0, 0, speed);

    print("opponent init");
  }

  // fonction de mise à jour
  void Update()
  {
    // transformation de la position de l'adversaire
    Move(velocity);

    // transformation de l'orientation de l'adversaire
    Orientation(gameObjectTarget);

    // calculer la distance entre le joueur et l'adversaire
    deltaPosition = gameObjectTarget.transform.position - transform.position;

    // faire perdre des points de vie au joueur s'il est suffisamment proche de l'adversaire
    if (deltaPosition.magnitude <= 1)
    {
      player.power -= damage * Time.deltaTime;
    }
  }

  // fonction de transformation de la position de l'adversaire
  public void Move(Vector3 v)
  {
    transform.Translate(
      v.x, v.y, v.z,
      Space.Self);
  }

  // fonction de transformation de l'orientation de l'adversaire
  public void Orientation(GameObject target)
  {
    // orientation en direction du joueur
    transform.LookAt(target.transform.position);
  }
}
