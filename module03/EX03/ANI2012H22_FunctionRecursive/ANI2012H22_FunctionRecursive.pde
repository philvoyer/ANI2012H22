// ANI2012H22_FunctionRecursive.pde
// Exemples de fonctions récursives.
// Une fonction récursive est une fonction qui s'appelle elle-même.

// Une fonction peut s'invoquer elle-même, mais seulement si elle a une condition d'arrêt qui dépend de la valeur de ses paramètres, à défaut de quoi l'exécution pourrait tomber dans une boucle infinie.

// Voici 3 exemples de fonctions récursives :

// 1. exemple d'une fonction récursive qui retourne la factorielle d'un nombre entier.
// la factorielle est le produit (multiplication) entre tous les nombres entiers positifs inférieurs ou égaux à n
int factorial(int n)
{
  if (n <= 1)
    return 1;
  else
    return n * factorial(n - 1);
}

// 2. exemple d'une fonction récursive qui retourne le n-ième terme de la suite de Fibonacci
// un terme de la suite de Fibonacci est la somme des deux termes précédents de la suite pour tout nombre entier plus grand que 1
int fibonacci(int n)
{
  if (n == 0)
    return 0;
  else if (n == 1)
    return 1;
  else
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// 3. exemple d'une fonction récursive qui génère une boucle infinie, car elle n'a pas de condition de sortie
int infinitely_increment(int n)
{
  print(n + ", ");
  return infinitely_increment(n + 1);
}

void setup()
{
  // 1. afficher dans la console la factorielle des nombres entiers de 0 à 20
  for (int n = 0; n <= 20; ++n)
    println("!" + n + " = "+ factorial(n));

  // observation :
  // entre la factorielle de !13 = 1 932 053 504 et de !14 = 1 278 945 280,
  // la valeur devient plus petite que le terme précédent alors que la factorielle devrait logiquement être plus grande
  // ce phénomène est dû à un dépassement de la limite de précision d'un entier 32 bits signé qui est 2 147 483 647

  // il est possible de valider les bornes des types primitifs grâce à 2 constantes statiques de la classe Integer
  println("integer minimal value: " + Integer.MIN_VALUE);
  println("integer maximal value: " + Integer.MAX_VALUE);

  // 2. afficher dans la console les 20 premiers termes de la suite de Fibonacci
  for (int n = 0; n <= 20; ++n)
    println("fibonacci(" + n + ") = "+ fibonacci(n));

  // 3. fonction récursive avec boucle infinie

  // attention : décommenter l'instruction suivante fera geler et puis planter le programme
  // infinitely_increment(0); // <- invocation d'une fonction qui cause une boucle infinie

  // observation :
  // après un certain nombre d'appels récursifs, la console affiche 'StackOverflowError' en rouge
  // ce phénomène est dû au fait que chaque invocation d'une fonction récursive
  // va allouer des variables temporaires dans une zone mémoire appelée la 'stack' et dont l'espace est limité
  // comme cette fonction récursive n'a pas de condition de sortie, alors la boucle infinie fait exploser la stack
}
