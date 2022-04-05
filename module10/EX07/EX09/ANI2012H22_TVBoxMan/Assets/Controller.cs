// ANI2012A20_Character/Controller.cs | Programmation C# avec Unity
// Classe de type Engine, la classe principale du projet.

using UnityEngine;

public class Controller : MonoBehaviour
{
  // données membres publiques exposées dans l'éditeur
  public Character character;

  // fonction d'initialisation
  void Start(){}

  // fonction de mise à jour
  void Update()
  {
    UpdateInteractivity();
  }

  // fonction de mise à jour de l'interactivité
  void UpdateInteractivity()
  {
    if (Input.GetKeyUp("1"))
      character.ChangeEmotion(Character.EmotionType.EMOTION_HAPPY);
    if (Input.GetKeyUp("2"))
      character.ChangeEmotion(Character.EmotionType.EMOTION_SAD);
    if (Input.GetKeyUp("3"))
      character.ChangeEmotion(Character.EmotionType.EMOTION_ANGRY);
    if (Input.GetKeyUp("4"))
      character.ChangeEmotion(Character.EmotionType.EMOTION_FLABBERGAST);
  }
}
