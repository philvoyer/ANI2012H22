// ANI2012H22_StructureLogic
// Exemples de structures de contrôle logiques.

// variables

boolean condition = true;
int number = 3;


// 1. branchement conditionnel sans alternative avec 'if'

// 1.1 le bloc d'instruction est exécuté seulement si la condition est vraie.

if (condition == true)
{
  println("ex1.1 : branchement 1");
}

// 1.2 les accolades qui délimitent le bloc d'instructions sont facultatives s'il y a seulement une instruction qui suit le 'if'

if (condition == true)
  println("ex1.2 : branchement 1");

// 1.3 la partie '== true' de la condition est aussi facultative car une expression logique dans 'if' tente toujours de valider si l'expression est équivalente à 'true' (vrai).

if (condition)
  println("ex1.3 : branchement 1");


// 2. branchement conditionnel avec alternative

// 2.1 valider si la condition est vraie
if (condition == true)
  println("ex2.1 : branchement 1");
else
  println("ex2.1 : branchement 2");

// 2.2 valider si la condition est fausse
if (condition == false)
  println("ex2.2 : branchement 1");
else
  println("ex2.2 : branchement 2");

// 2.3 valider si la condition n'est pas vraie (donc fausse)
if (condition != true)
  println("ex2.3 : branchement 1");
else
  println("ex2.3 : branchement 2");

// 2.4 branchement conditionnel avec alternative sous forme compacte avec l'opérataire ternaire '?:'

// l'opérateur ternaire '?:' est la même chose qu'un 'if + else' sous une forme plus compacte
// la condition logique est à gauche du caractère '?'
// le branchement logique 1 (vrai) est à gauche du caractère ':'
// le branchement logique 2 (faux) est à droite du caractère ':'
// dans l'exemple qui suit, la valeur retournée est assignée à une variable

boolean result = (condition == true) ? true : false;

if (result == true)
  println("ex2.4 : branchement 1");
else
  println("ex2.4 : branchement 2");


// 3. séquence de branchements conditionnels avec 'if', 'else if' et 'else'

if (number == 1)
  println("ex3.1 : branchement 1");
else if (number == 2)
  println("ex3.2 : branchement 2");
else if (number == 3)
  println("ex3.3 : branchement 3");
else if (number == 4)
  println("ex3.4 : branchement 4");
else
  println("ex3.5 : branchement 5");


// 4. branchements conditionnels multiples avec 'switch'

switch (number)
{
case 1:
  println("ex4.1 : branchement 1");
  break;

case 2:
  println("ex4.2 : branchement 2");
  break;

case 3:
  println("ex4.3 : branchement 3");
  break;

case 4:
  println("ex4.4 : branchement 4");
  break;

default:
  println("ex4.5 : branchement 5");
  break;
}

// observation : les 2 derniers exemples (3 et 4) sont équivalents d'un point de vue sémantique, même si la syntaxe est différente
