// ANI2012A20_Character/Character.cs | Programmation C# avec Unity
// Classe de type Character, responsable de gérer les propriétés et méthodes du personnage.

using UnityEngine;

// composantes du personnage
[RequireComponent(typeof(Animator))]
[RequireComponent(typeof(CapsuleCollider))]
[RequireComponent(typeof(Rigidbody))]
[RequireComponent(typeof(Renderer))]

public class Character : MonoBehaviour
{
  public enum EmotionType
  {
    EMOTION_NONE,
    EMOTION_HAPPY,
    EMOTION_SAD,
    EMOTION_ANGRY,
    EMOTION_FLABBERGAST,
  };

  // données membres publiques exposées dans l'éditeur
  public EmotionType     characterEmotion;
  public Animator        characterAnimator;
  public CapsuleCollider characterCollider;
  public Rigidbody       characterRigidbody;
  public GameObject      characterFace;
  public Renderer        characterFaceRenderer;

  // fonction d'initialisation
  void Start()
  {
    characterAnimator = GetComponent<Animator>();

    print("character animator: " + characterAnimator);

    characterCollider = GetComponent<CapsuleCollider>();

    print("character collider: " + characterCollider);

    characterRigidbody = GetComponent<Rigidbody>();

    print("character rigidbody: " + characterRigidbody);

    characterFace = GameObject.Find("CharacterFace");

    characterFaceRenderer = characterFace.GetComponent<Renderer>();

    ChangeEmotion(EmotionType.EMOTION_ANGRY);
  }

  // fonction de mise à jour
  void Update(){}

  // fonction qui permet de changer l'émotion du personnage
  public void ChangeEmotion(EmotionType emotion)
  {
    characterEmotion = emotion;

    switch (emotion)
    {
      case EmotionType.EMOTION_HAPPY:
        characterFaceRenderer.material.mainTextureOffset = new Vector2(0.0f, 0.5f);
        print("<character emotion is now HAPPY>");
        break;

      case EmotionType.EMOTION_SAD:
        characterFaceRenderer.material.mainTextureOffset = new Vector2(0.5f, 0.5f);
        print("<character emotion is now SAD>");
        break;

      case EmotionType.EMOTION_ANGRY:
        characterFaceRenderer.material.mainTextureOffset = new Vector2(0.0f, 0.0f);
        print("<character emotion is now ANGRY>");
        break;

      case EmotionType.EMOTION_FLABBERGAST:
        characterFaceRenderer.material.mainTextureOffset = new Vector2(0.5f, 0.0f);
        print("<character emotion is now FLABBERGAST>");
        break;
    }
  }
}
