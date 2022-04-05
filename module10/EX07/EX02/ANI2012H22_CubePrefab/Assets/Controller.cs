// ANI2012A20_Prefab/Controller.cs | Programmation C# avec Unity
// Exemples d'instanciation d'objets à partir d'un GameObject et à partir d'un prefab.
// Le prefab est un cube, qui fut généré par un script Python dans Maya,
// puis exporté sous forme de fichier .fbx, afin d'être importé dans une scène Unity,
// où il a été configuré puis exporté sous forme de prefab dans le répertoire /Assets du projet.
// Ce script est assigné à l'objet 'Origin' dans la scène 'Scene.unity'.

using System;

using UnityEngine;

public class Controller : MonoBehaviour
{
  // avec Unity, les données membres publiques d'un 'MonoBehaviour' sont exposées automatiquement dans l'éditeur
  // cela permet entre autres de passer des références vers des instances d'objet de la scène
  // attention: la valeur peut ne pas avoir été assignée dans la composante script de l'objet

  public GameObject boxWhite; // référence assignée dans l'éditeur
  public GameObject boxBlack; // référence assignée dans l'éditeur

  public GameObject prefabWhiteBox; // référence assignée dans l'éditeur
  public GameObject prefabBlackBox; // référence trouvée à l'exécution dans le répertoire /Resources

  [HideInInspector] // permet de masquer un attribut public dans l'éditeur
  public GameObject newBox; // référence vers le dernier cube instancié.

  public float offset = 1.5f;

  public int count = 5;

  // données membres privées (invisible dans l'éditeur)

  private GameObject lastBox;
  private Vector3 initialPosition;
  private Quaternion initialRotation;

  void Start()
  {
    // transformation initiale
    initialPosition = new Vector3(0.0f, 0.0f, 0.0f);
    initialRotation = Quaternion.identity;

    // dupliquer le cube blanc
    newBox = Duplicate(boxWhite);
    newBox.transform.position = initialPosition;
    newBox.transform.rotation = initialRotation;
    newBox.transform.Translate(0.0f, 0.0f, -offset);

    // incorrect: causerait une erreur, car le prefab n'est pas dans le répertoire /Assets/Resources
    //prefabWhiteBox = InstanciatePrefab("WhiteBox", initialPosition, initialOrientation);

    // correct: comme le prefab est dans /Assets/Resources, on peut le référencer par nom (sans l'extension)
    prefabBlackBox = InstanciatePrefab("BoxBlack", initialPosition, initialRotation);

    // le premier cube à dupliquer sera le prefab chargé à partir des ressources
    lastBox = prefabBlackBox;

    for (int index = 0; index < count; ++index)
    {
      // dupliquer le cube précédent
      newBox = Duplicate(lastBox);

      // translation du nouveau cube dans l'espace local
      newBox.transform.Translate(0.0f, 0.0f, offset, Space.Self);

      // le nouveau cube devient le cube précédent
      lastBox = newBox;
    }
  }

  // fonction qui permet de dupliquer le GameObject passé en paramètre et de retourner un clone avec la même transformation
  public GameObject Duplicate(GameObject source)
  {
    GameObject clone;

    Vector3 sourcePosition = source.transform.position;
    Quaternion sourceRotation = source.transform.rotation;

    clone = Instantiate(source, sourcePosition, sourceRotation) as GameObject;

    clone.name = source.name;

    print("duplicate: "+ source.name + " at: " + sourcePosition);

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
}
