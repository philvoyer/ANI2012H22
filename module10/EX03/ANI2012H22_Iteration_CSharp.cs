// ANI2012A22_Iteration_CSharp.cs | Programmation C# avec Unity
// Exemples de structures de contrôle itératives.

using System;
using UnityEngine;

public class ANI2012H22_Iteration_CSharp : MonoBehaviour
{
  void Start()
  {
    int index;

    // 1. boucle 'for'

    print("boucle de 10 itérations avec un 'for'");

    for (index = 0; index < 10; ++index)
      print("\tloop " + index);


    // 2. boucle 'while'

    print("\nboucle de 10 itérations avec un 'while'");

    index = 0;

    while (index < 10)
    {
      print("\tloop " + index);
      ++index;
    }
  }
}
