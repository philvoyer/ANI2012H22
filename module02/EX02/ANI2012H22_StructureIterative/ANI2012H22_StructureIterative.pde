// ANI2012H22_StructureIterative
// Exemples de structures de contrôle itératives.

int index;

// 1. boucle 'for'

println("boucle de 10 itérations avec un 'for'");

for (index = 0; index < 10; ++index)
  println("\tloop " + index);


// 2. boucle 'while'

println("\nboucle de 10 itérations avec un 'while'");

index = 0;

while (index < 10)
{
  println("\tloop " + index);
  ++index;
}
