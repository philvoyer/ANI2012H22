// ANI2012H22_StructureIterative
// Exemples de structures de contrôle itératives.

// variable (index de chaque itération)
int index;

// 1. exemples de structures itératives avec 'for'

// 1.1

println("1.1 boucle de 1 à 10 avec un 'for'");

for (index = 1; index <= 10; index++)
{
  println("\tloop " + index);
}

// 1.2

println("1.2 boucle de 10 à 1 avec un 'for'");

for (index = 10; index >= 1; index--)
{
  println("\tloop " + index);
}

// 1.3

println("1.3 afficher tous les nombres pairs entre 0 et 20 avec un 'for'");

for (index = 0; index <= 20; index += 2)
{
  println("\tloop " + index);
}

// 2. exemple d'une structure itérative avec 'while'

println("2.1 boucle de 1 à 10 avec un 'while'");

index = 1;

while (index <= 10)
{
  println("\tloop " + index);
  index++;
}

println("2.2 boucle de 10 à 1 avec un 'while'");

index = 10;

while (index >= 1)
{
  println("\tloop " + index);
  index--;
}

println("2.3 afficher tous les nombres pairs entre 0 et 20 avec un 'while'");

index = 0;

while (index <= 20)
{
  println("\tloop " + index);
  index += 2;
}
