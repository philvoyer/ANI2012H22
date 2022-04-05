// ANI2012H22_Logic_CSharp.cs | Programmation C# avec Unity
// Exemples de structures de contrôle logiques.

using System;
using UnityEngine;

public class ANI2012H22_Logic_CSharp : MonoBehaviour
{
  void Start()
  {
    // variables

    bool condition = true;
    int number = 0;

    // 1. branchement conditionnel sans alternative

    // le bloc d'instruction est exécuté seulement si la condition est vraie.

    if (condition)
    {
      print("branchement 1.1");
    }

    // les accolades sont facultatives si seulement une instruction

    if (condition)
      print("branchement 1.2");


    // 2. branchement conditionnel avec alternative

    if (condition)
      print("branchement 2.1");
    else
      print("branchement 2.2");


    // 3. branchement conditionnel avec alternative sous forme compacte

    condition = condition == true ? false : true;

    if (condition)
      print("branchement 3.1");
    else
      print("branchement 3.2");


    // 4. séquence de branchements conditionnels

    if (condition)
      print("branchement 4.1");
    else if (number == 0)
      print("branchement 4.2");
    else
      print("branchement 4.3");


    // 5. branchements conditionnels multiples

    switch (number)
    {
      case 1:
        print("branchement 5.1");
        break;

      case 2:
        print("branchement 5.2");
        break;

      case 3:
        print("branchement 5.3");
        break;

      default:
        print("branchement 5.4");
        break;
    }
  }
}
