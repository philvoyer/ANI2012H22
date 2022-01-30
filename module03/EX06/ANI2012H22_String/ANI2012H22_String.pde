// ANI2012H22_String.pde
// Exemples de manipulation de chaînes de caractères (string).

// paramètre
String text = "lorem ipsum dolor sit amet";

// variables
String str; // 'String' est une classe pour contenir et manipuler une chaînes de caractères

String s1;
String s2;

char c; // 'char' est un type primitif qui permet de contenir un seul caractère

void setup()
{
  size(512, 512);
  noLoop();

  // configurer la taille du texte
  textSize(24);

  // configurer l'alignement du texte
  textAlign(CENTER, CENTER);

  // 1. création d'une chaîne de caractères vide
  str = new String(); // notez que ce n'est pas vraiment utile, car une String est immuable
  println("ex1  : an empty string with " + str.length() + " characters");


  // 2. création d'une chaîne de caractères avec une valeur initiale
  str = new String("hello");
  println("ex2  : " + str);


  // 3. création d'une chaîne de caractères avec le résultat de la concaténation de deux chaînes de caractères
  s1 = new String("hello");
  s2 = new String("world");
  str = s1 + s2;
  println("ex3  : " + str);


  // 4. création d'une chaîne de caractères avec le résultat de la concaténation de deux chaînes de caractères et d'un littéral (un espace)
  s1 = new String("hello");
  s2 = new String("world");
  str = s1 + " " +  s2;
  println("ex4  : " + str);


  // 5. extraire un caractère de la chaîne de caractères
  print("ex5  : ");
  for (int index = 0; index < str.length(); ++index)
  {
    c = str.charAt(index);
    print("'" + c + "' ");
  }
  print("\n");


  // 6. convertir tous les caractères de la chaîne en lettres minuscules
  str = text.toLowerCase();
  println("ex6  : lower case = \"" + str + "\"");


  // 7. convertir tous les caractères de la chaîne en lettres majuscules
  str = text.toUpperCase();
  println("ex7  : upper case = \"" + str + "\"");


  // 8. valider le préfixe (début) de la chaîne de caractères
  if (text.startsWith("lorem"))
    println("ex8  : starts with \"lorem\"");


  // 9. valider le suffixe (fin) de la chaîne de caractères
  if (text.endsWith("amet"))
    println("ex9  : ends with \"amet\"");


  // 10. trouver la première instance d'une sous-chaîne de caractères
  println("ex10 : search \"dolor\" and find first instance at index " + text.indexOf("dolor"));


  // 11. extraction d'une sous-chaîne de caractères
  int fromCharacterIndex = 18;
  int nbOfCharacters = 3 ;
  str = text.substring(fromCharacterIndex, fromCharacterIndex + nbOfCharacters);
  println("ex11 : substring = \"" + str + "\"");


  // 12. valider l'équivalence entre deux chaînes de caractères
  if (s1.equals(s2))
    println("ex12 : " + s1 + " equals " + s2);
  else if (s1.equals("hello"))
    println("ex12 : " + s1 + " equals " + "\"hello\"");
  else
    println("s1 not equals hello");


  // 13. remplacer la première instance d'une sous-chaîne de caractères par une autre
  str = text.replace("dolor", s1);
  println("ex13 : replace \"dolor\" with \"" + s1 + "\" = " + str);


  // 14. séparer une chaîne de caractères en plusieurs sous-chaînes de caractères selon un délimiteur (un espace " ")
  String[] wordArray = text.split(" ");
  print("ex14 : split into ");
  for (String word : wordArray)
    print("\"" + word + "\" ");
  print("\n");


  // 15. initialiser un tableau de chaînes de caractères à partir d'un fichier texte externe
  String fileName = "lorem_ipsum.txt";
  String[] textFileContent = loadStrings(fileName);
  println("ex15 : load text file \"" + fileName + "\" with " + textFileContent.length + " lines :");
  for (int index = 0 ; index < textFileContent.length; ++index)
    println(textFileContent[index]);
}

void draw()
{
  text("Manipulation de chaînes de caractères\n(String)\n\nVoir résultats dans la console", width/2, height/2);
}
