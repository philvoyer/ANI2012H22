// ANI2012H22_Typecasting.pde
// Exemples de conversions de types primitifs et complexes.
// L'exemple de type complexe est une classe de type 'Fruit' dont 'Orange' est un descendant par héritage.

// classe de type Fruit
class Fruit
{
  void identify()
  {
    println("\t\t" + "I am a fruit");
  }
}

// classe de type Orange qui est un descendant de Fruit par héritage
class Orange extends Fruit
{
  void identify()
  {
    println("\t\t" + "I am a fruit of type orange");
  }
}

// paramètres
int numberAsInt = 1;
float numberAsFloat = 1.618f;

// variables
int zeroAsInt = 0;

int resultAsInt;
float resultAsFloat;
boolean resultAsBool;

Fruit  fruit;
Orange orange;

Fruit referenceAncestor;
Orange referenceDescendant;

void setup()
{
  size(512, 512);
  noLoop();

  textSize(24);
  textAlign(CENTER, CENTER);

  fruit = new Fruit();
  orange = new Orange();

  referenceAncestor = fruit;
  referenceDescendant = orange;

  // dans les exemples qui suivent, '\t' est un caractère d'échappement
  // il permet d'insérer des tabulations dans la chaîne de caractères (ie: l'équivalent de la touche TAB sur un clavier)
  // c'est simplement pour avoir un meilleur alignement du texte affiché dans la console

  // 1. conversion d'un nombre entier (int) en nombre réel (float)
  resultAsFloat = float(numberAsInt);

  println("ex1. \t cast \t" + "int" + "\t -> \t" + "float");
  println("\t\t" + numberAsInt +  "\t -> \t" + resultAsFloat + "\n");


  // 2. conversion d'un nombre réel (float) en nombre entier (int)
  resultAsInt = int(numberAsFloat);

  println("ex2. \t cast \t" + "float" + "\t -> \t" + "int");
  println("\t\t" + numberAsFloat +  "\t -> \t" + resultAsInt + "\n");


  // 3. conversion d'un nombre entier (int) en valeur booléenne (boolean)
  resultAsBool = boolean(numberAsInt);

  println("ex3. \t cast \t" + "int" + "\t -> \t" + "bool");
  println("\t\t" + numberAsInt +  "\t -> \t" + resultAsBool);

  resultAsBool = boolean(zeroAsInt);

  println("\t\t" + zeroAsInt +  "\t -> \t" + resultAsBool + "\n");


  // 4. conversion de rérérence d'un type enfant vers un type parent (upcasting)

  println("ex4. \t cast \t" + "Orange" + "\t -> \t" + "Fruit (upcasting)");

  referenceAncestor = fruit;
  referenceDescendant = orange;

  referenceAncestor.identify();

  if (referenceAncestor instanceof Fruit)
    println("\t\t" + "reference is an instance of Fruit");
  else
    println("\t\t" + "reference is not an instance of Fruit");

  if (referenceAncestor instanceof Orange)
    println("\t\t" + "reference is an instance of Orange");
  else
    println("\t\t" + "reference is not an instance of Orange");

  println("\t\t" + "(upcasting orange > fruit)");
  referenceAncestor = orange; // <- upcasting

  referenceAncestor.identify();

  if (referenceAncestor instanceof Fruit)
    println("\t\t" + "reference is an instance of Fruit");
  else
    println("\t\t" + "reference is not an instance of Fruit");

  if (referenceAncestor instanceof Orange)
    println("\t\t" + "reference is an instance of Orange\n");
  else
    println("\t\t" + "reference is not an instance of Orange\n");


  // 5. conversion de rérérence d'un type parent vers un type enfant (downcasting)

  println("ex5. \t cast \t" + "Fruit" + "\t -> \t" + "Orange (downcasting)");

  referenceAncestor = fruit;
  referenceDescendant = orange;

  referenceAncestor.identify();

  if (referenceAncestor instanceof Fruit)
    println("\t\t" + "reference is an instance of Fruit");
  else
    println("\t\t" + "reference is not an instance of Fruit");

  if (referenceAncestor instanceof Orange)
    println("\t\t" + "reference is an instance of Orange");
  else
    println("\t\t" + "reference is not an instance of Orange");

  // downcasting (fruit > orange)
  // referenceDescendant = (Orange) referenceAncestor; // <- ERREUR si décommenté !!!
  // opération illégale qui déclenche une 'ClassCastException’, car le fruit pourrait ne pas être une orange

  referenceAncestor = orange; // <- upcasting (orange > fruit)

  println("\t\t" + "(downcasting fruit > orange)");

  // downcasting (fruit > orange)
  referenceDescendant = (Orange) referenceAncestor;    // OK car référence sur une orange

  referenceDescendant.identify();

  if (referenceDescendant instanceof Fruit)
    println("\t\t" + "reference is an instance of Fruit");
  else
    println("\t\t" + "reference is not an instance of Fruit");

  if (referenceDescendant instanceof Orange)
    println("\t\t" + "reference is an instance of Orange\n");
  else
    println("\t\t" + "reference is not an instance of Orange\n");
}

void draw()
{
  text("Conversion de types\n(typecasting)\n\nVoir résultats dans console", width/ 2.0f, height/ 2.0f);
}
