// ANI2012H22_Console.pde
// Exemples d'affichage de texte dans la console de l'éditeur de Processing.

// En programmation, le texte est encodé sous forme d'une chaîne de caractères.
// Une chaîne de caractères peut être utilisée directement sous forme littérale,
// c'est-à-dire en délimitant les caractères par une paire de guillemets (ex. "abc").

// Pour afficher du texte dans la console, il y a 2 fonctions : 'print' et println'.
// 'print' affiche du texte dans la console sans changement de ligne.
// 'println' affiche du texte dans la console avec un changement de ligne à la fin du texte.

// 1. afficher un message dans la console à partir d'un texte littéral :
println("ex1. hello world!");

// 2. afficher un message dans la console à partir d'une variable qui contient un texte littéral :

// 'String' est un type pour les chaînes de caractères et 'message' est le nom de la variable.
// La variable 'message' de type chaîne de caractères ('String') est donc initialisée avec le littéral "Hello world!"
String message = "ex2. hello world!";

// La variable permet de conserver la chaîne de caractères en mémoire et de référencer son contenu
// lorsqu'elle est passée en argument de la fonction 'println'.
println(message);

// 3. afficher un message dans la console à partir de variables concaténées :
String message1 = "ex3. ";
String message2 = "hello";
String message3 = "world!";

// L'opérateur de concaténation '+' permet de fusionner les chaînes de caractères référencées par chaque variable.
println(message1 + message2 + message3);

// 4. afficher un message dans la console à partir d'un mélange de variables et de textes sous forme littérale par concaténation :
println("ex4: " + message2 + " " + message3);
