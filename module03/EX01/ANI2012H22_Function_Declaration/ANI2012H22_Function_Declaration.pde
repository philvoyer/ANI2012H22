// ANI2012H22_Fonction_Declaration.pde
// Exemples déclarations et d'invocations de fonctions simples qui encapsulent des calculs mathématiques.
// La plupart des fonctions reçoivent des nombres entiers en argument et retournent un nombre entier comme résultat.

// 1. fonction vide sans entrée ni sortie qui ne fait strictement rien
void doNothing(){}


// 2. fonction qui retourne la valeur du nombre entier reçu en paramètre
int identity(int n)
{
  return n;
}


// 3. fonction qui retourne la valeur inverse du nombre entier reçu en paramètre
int inverse(int n)
{
  return -n;
}


// 4. fonction qui retourne la valeur incrémentée du nombre entier reçu en paramètre
int incrementation(int n)
{
  return n + 1;
}


// 5. fonction qui retourne la valeur décrémentée du nombre entier reçu en paramètre
int decrementation(int n)
{
  return n - 1;
}


// 6. fonction qui retourne la somme de deux nombres entiers reçus en paramètre
int addition(int n1, int n2)
{
  return n1 + n2;
}


// 7. fonction qui retourne la valeur au carré du nombre entier reçu en paramètre
int square(int n)
{
  return n * n;
}


// 8. fonction qui retourne le plus grand entre deux nombres entiers reçus en paramètre ou 0 si équivalents
int maximum(int n1, int n2)
{
  if (n1 > n2)
    return n1;
  else if (n2 > n1)
    return n2;
  else
    return 0;
}


// 9. fonction qui permet de borner un nombre entier entre une valeur minimale et maximale
int clamp(int value, int min, int max)
{
  if (value < min)
    return min;
  else if (value > max)
    return max;
  else
    return value;
}


// 10. tester les différentes fonctions avec un affichage dans la console
void setup()
{
  println("identity  of 0     = " + identity(0));
  println("inverse   of 1     = " + inverse(1));
  println("inverse   of -1    = " + inverse(-1));
  println("increment of 1     = " + incrementation(1));
  println("decrement of 1     = " + decrementation(1));
  println("addition  of 2 + 3 = " + addition(2, 3));
  println("square    of 2     = " + square(2));
  println("maximum   of 3 & 4 = " + maximum(3, 4));
  println("maximum   of 5 & 5 = " + maximum(5, 5));
  println("clamp (4, 3, 5)    = " + clamp(4, 3, 5));
  println("clamp (2, 3, 5)    = " + clamp(2, 3, 5));
  println("clamp (6, 3, 5)    = " + clamp(6, 3, 5));

  println("then do nothing..");

  doNothing();
}
