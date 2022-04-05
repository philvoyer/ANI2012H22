// ANI2012A20_Timeline/Timeline.cs | Programmation C# avec Unity
// Exemple de script pour manipuler une animation faite sur une ligne de temps avec l'outil 'Timeline' de Unity.

using UnityEngine;
using UnityEngine.Playables;

[RequireComponent(typeof(PlayableDirector))]
public class Controller : MonoBehaviour
{
  private PlayableDirector director;

  void Start ()
  {
    director = GetComponent<PlayableDirector>();

    print("timeline duration:" + director.duration);
  }

  void Update ()
  {
    if (Input.GetKeyUp("1"))
    {
      print("timeline section 1");
      director.time = 1.0f;
    }
    if (Input.GetKeyUp("2"))
    {
      print("timeline section 2");
      director.time = 2.0f;
    }
    if (Input.GetKeyUp("3"))
    {
      print("timeline section 3");
      director.time = 3.0f;
    }
    if (Input.GetKeyUp("4"))
    {
      print("timeline section 4");
      director.time = 5.0f;
    }
    if (Input.GetKeyUp("5"))
    {
      print("timeline section 5");
      director.time = 9.0f;
    }
    if (Input.GetKeyUp("6"))
    {
      print("timeline section 6");
      director.time = 13.0f;
    }
    if (Input.GetKeyUp("7"))
    {
      print("timeline section 7");
      director.time = 18.0f;
    }
    if (Input.GetKeyUp("0"))
    {
      print("timeline section 0");
      director.time = 0.0f;
    }

    if (Input.GetKeyUp("space"))
    {
      if (director.state == PlayState.Playing)
      {
        director.Pause();
        print("timeline pause");
      }
      else
      {
        director.Play();
        print("timeline start");
      }
    }
  }
}
