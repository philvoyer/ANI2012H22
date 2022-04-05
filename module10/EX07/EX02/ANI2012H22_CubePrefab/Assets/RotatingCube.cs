// ANI2012A20_CubePrefab/RotatingCube.cs | Programmation C# avec Unity
// Exemple d'une scène minimaliste dans Unity, avec une caméra qui regarde en direction d'un cube qui tourne et dont l'animation est contrôlée par un script C#.
// Le programme est assigné sur le cube sous forme d'une composante de type script.

using UnityEngine;

public class RotatingCube : MonoBehaviour
{
  // angle de rotation
  public float angle = 100.0f;

  // variation de la vitesse de rotation
  public float delta = 10.0f;

  // direction positive ou négative de l'angle
  public float direction = 1.0f;

  // état de l'animation
  public bool animate = true;

  // fonction d'initialisation
  void Start ()
  {
    print("start");
  }

  // fonction de mise à jour
  void Update ()
  {
    UpdateKeyboard();

    if (animate)
    {
      // rotation sur l'axe Y du cube en fonction du temps
      transform.Rotate(0.0f, angle * direction * Time.deltaTime, 0.0f);
    }
  }

  // interactivité au clavier
  void UpdateKeyboard()
  {
    if (Input.GetKey("up"))
      angle += delta;
    if (Input.GetKey("down"))
      angle -= delta;
    if (Input.GetKey("left"))
      direction = -1.0f;
    if (Input.GetKey("right"))
      direction = 1.0f;

    if (Input.GetKeyUp("space"))
      animate = !animate;
  }
}
