// ANI2012A22_Variable_CSharp.cs | Programmation C# avec Unity
// Exemples de déclarations et d'initialisations de variables de types primitifs.

using System;
using UnityEngine;

public class ANI2012H22_Variable_CSharp : MonoBehaviour
{
  void Start()
  {
    // 1. variable de type booléen

    bool logic = true;

    print("valeur de la variable 'logic' = " + logic);

    // 2. variable de type nombre entier (petit nombre)

    byte smallnumber = 127;

    print("valeur de la variable 'smallnumber' = " + smallnumber);


    // 3. variable de type nombre entier

    int integer = 1024;

    print("valeur de la variable 'integer' = " + integer);


    // 4. variable de type nombre réel

    float realnumber = 1.618f;

    print("valeur de la variable 'realnumber' = " + realnumber);


    // 5. variable de type nombre réel (double précision)

    double hugenumber = 1.618;

    print("valeur de la variable 'hugenumber' = " + hugenumber);


    // 6. variable de type caractère

    char letter = 'z';

    print("valeur de la variable 'letter' = " + letter);


    // 7. variable de type chaîne de caractères

    String textmessage = "abcdefghij";

    print("valeur de la variable 'textmessage' = " + textmessage);
  }
}
