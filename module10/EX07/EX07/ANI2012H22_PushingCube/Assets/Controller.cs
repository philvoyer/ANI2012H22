// ANI2012A20_PushingCube/Controller.cs | Programmation C# avec Unity
// Classe de type Engine, responsable de gérer la logique de jeu globale et de faire le lien entre les différentes classes du projet.

using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Controller : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public GameObject gameObjectPlayer;
  public GameObject gameObjectOpponent;

  public Player player;
  public Opponent opponent;

  public GameObject crates;

  public Vector3 keyboardInput;

  public Text textboxScorePlayer;
  public Text textboxScoreOpponent;

  // données membres statiques (pour éviter d'être réinitialisées lors du rechargement de la scène en fin de partie)
  static public int scorePlayer;
  static public int scoreOpponent;

  // données membres privées
  private GameObject crate;
  private int index;

  int boxCountTotal;

  // fonction d'initialisation
  void Start()
  {
    player = gameObjectPlayer.GetComponent(typeof(Player)) as Player;
    opponent = gameObjectOpponent.GetComponent(typeof(Opponent)) as Opponent;

    boxCountTotal = crates.transform.childCount;

    print("start");
  }

  // fonction de mise à jour
  void Update()
  {
    // gestion de l'interactivité au clavier
    keyboardInput.x = Input.GetAxis("Horizontal") * Time.deltaTime;
    keyboardInput.z = Input.GetAxis("Vertical") * Time.deltaTime;

    // valider si les boîtes sont tombées du plancher
    for (index = 0; index < boxCountTotal; ++index)
    {
      crate = crates.transform.GetChild(index).gameObject;

      if (crate.activeSelf)
      {
        if (crate.transform.position.y < -5)
        {
          crate.SetActive(false);
          player.boxCount++;
        }
      }
    }

    // validation de la condition de défaite
    if (player.boxCount >= boxCountTotal)
      Win();

    // validation de la condition de victoire
    if (player.power <= 0)
      Lose();

    // mise à jour de l'interface graphique
    textboxScorePlayer.text = "Score player " + scorePlayer;
    textboxScoreOpponent.text = "Score AI " + scoreOpponent;
  }

  // fonction invoquée quand le joueur gagne la partie (toutes les boîtes sont tombées)
  public void Win()
  {
    scorePlayer++;

    print("Win");

    // relancer la scène
    SceneManager.LoadScene("Scene");
  }

  // fonction invoquée quand le joueur perd la partie (plus aucun point de vie)
  public void Lose()
  {
    scoreOpponent++;

    print("Gameover");

    // relancer la scène
    SceneManager.LoadScene("Scene");
  }
}
