// ANI2012A22_Logic_Java.java | Programmation Java avec Processing
// Exemples de structures de contrôle logiques.

// variables

boolean condition = true;
int number = 0;

// 1. branchement conditionnel sans alternative

// le bloc d'instruction est exécuté seulement si la condition est vraie.

if (condition)
{
  println("branchement 1.1");
}

// les accolades sont facultatives si seulement une instruction

if (condition)
  println("branchement 1.2");


// 2. branchement conditionnel avec alternative

if (condition)
  println("branchement 2.1");
else
  println("branchement 2.2");


// 3. branchement conditionnel avec alternative sous forme compacte

condition = condition == true ? false : true;

if (condition)
  println("branchement 3.1");
else
  println("branchement 3.2");


// 4. séquence de branchements conditionnels

if (condition)
  println("branchement 4.1");
else if (number == 0)
  println("branchement 4.2");
else
  println("branchement 4.3");


// 5. branchements conditionnels multiples

switch (number)
{
  case 1:
    println("branchement 5.1");
    break;

  case 2:
    println("branchement 5.2");
    break;

  case 3:
    println("branchement 5.3");
    break;

  default:
    println("branchement 5.4");
    break;
}
