// ANI2012H22_Function_Random.pde
// Démonstration de différentes techniques pour générer des nombres aléatoires entiers ou réels.
// Les nombres aléatoires permettent d'initialiser et de modifier les attributs d'une animation pour la rendre moins prévisible.

// variables
int intMin;
int intMax;

int intRandomNumber;

float floatMin;
float floatMax;

float floatRandomNumber;

void setup()
{
  // mise à jour une fois par seconde
  frameRate(1);

  // Le pur hasard n'existe pas en informatique, puisque qu'on est incapable de le reproduire parfaitement avec un algorithme.
  // Par contre on peut le simuler avec un générateur de nombres pseudo-aléatoires.
  // Un générateur de nombres pseudo-aléatoires retourne toujours la même séquence de nombres en fonction de son germe (seed).
  // Cette propriété est intéressante pour pouvoir reproduire de manière identique une animation qui semble être aléatoire en utilisant toujours le même germe.
  // Afin d'avoir une animation aléatoire qui est différente d'une exécution à l'autre, il faut modifier la valeur du germe.
  // Une pratique courante est d'utiliser le temps courant comme valeur de germe.


  // valeur initiale du germe (seed) de l'algorithme de génération de nombres pseudo-aléatoires
  randomSeed(millis());

  // valeur initiale du germe (seed) de l'algorithme de bruit de Perlin
  noiseSeed(millis());

  // la fonction millis() retourne le nombre de millisecondes écoulées depuis le lancement du programme
  // puisque sa valeur est différente à chaque mise à jour du programme,
  // cela en fait un bon germe pour la génération de nombres pseudo-aléatoires
}

// Les nombres aléatoires sont générés dans un intervalle de valeurs.
// En notation mathématique, un intervalle peut être représenté sous cette forme : [borneInférieure, borneSupérieure].
// Les caractères '[' ']' permettent d'indiquer si la borne est incluse dans l'intervalle ou pas.
// Par exemple :
//   [borneInférieure, borneSupérieure] les 2 bornes sont incluses dans l'intervalle.
//   ]borneInférieure, borneSupérieure[ les 2 bornes ne sont pas incluses dans l'intervalle.
//   [borneInférieure, borneSupérieure[ la borne inférieure est incluse mais la borne supérieure est excluse de l'intervalle.

void draw()
{
  println("\nrandom number generation:");

  // 1. génération d’un nombre aléatoire réel (float) dans l'intervalle [0, 1[
  floatRandomNumber = randomFloatIntervalZeroOne();

  println("1. random number (float) inverval [0.0, 1.0[  :  " + floatRandomNumber);


  // 2. génération d’un nombre aléatoire réel (float) dans l'intervalle [min, max[
  floatMin = 3.0f;
  floatMax = 6.0f;

  floatRandomNumber = randomFloatIntervalMinMax(floatMin, floatMax);

  println("2. random number (float) interval [" + floatMin + ", " + floatMax + "[  :  " + floatRandomNumber);


  // 3. génération d’un nombre aléatoire entier (int) dans l'intervalle [min, max]
  intMin = 3;
  intMax = 6;

  intRandomNumber = randomIntegerIntervalMinMax(intMin, intMax);

  println("3. random number (int)   interval [" + intMin + "  , " + intMax + "  ]  :  " + intRandomNumber);


  // 4. génération d’un nombre aléatoire réel (float) dans l'intervalle [0, 1[ avec l'algorithme de bruit de Perlin.
  floatRandomNumber = randomFloatPerlinNoise(millis());

  println("4. perlin noise  (float) interval [0.0, 1.0[  :  " + floatRandomNumber);
}

// fonction qui retourne un nombre aléatoire réel (float) dans l'intervalle [0, 1[
float randomFloatIntervalZeroOne()
{
  return random(0.0f, 1.0f);
}

// fonction qui retourne nombre aléatoire réel (float) dans l'intervalle [min, max[
float randomFloatIntervalMinMax(float intervalMin, float intervalMax)
{
  return intervalMin + random(intervalMax - intervalMin);
}

// fonction qui retourne nombre aléatoire entier (int) dans l'intervalle [min, max[
int randomIntegerIntervalMinMax(int intervalMin, int intervalMax)
{
  return intervalMin + int(random(intervalMax - intervalMin + 1));
}

// fonction qui retourne un nombre aléatoire réel (float) dans l'intervalle [0, 1[ avec l'algorithme de bruit de Perlin
float randomFloatPerlinNoise(float value)
{
  return noise(value);
}
