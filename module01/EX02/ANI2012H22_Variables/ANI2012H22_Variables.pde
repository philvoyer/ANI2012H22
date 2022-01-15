// ANI2012H22_Variables.pde
// Exemples de déclaration et d'initialisation de variables de différents types.

// 1. déclaration et initialisation de variables de types primitifs :

// type | nom de la variable | valeur initiale |  poids en mémoire | description
boolean   logic                = true;            // 8  bits         variable de type booléen (vrai ou faux)
char      letter               = 'z';             // 16 bits         variable de type caractère (une lettre ou un chiffre)
byte      smallnumber          = 127;             // 8  bits         variable numérique entière (petit nombre entre -128 et 127)
int       integer              = 1024;            // 32 bits         variable numérique entière (plus grand nombre, de valeur positive ou négative)
float     realnumber           = 1.618f;          // 32 bits         variable numérique réelle (qui peut être non entière)
double    hugenumber           = 1.618;           // 64 bits         variable numérique réelle (double précision)

// 2. déclaration et initialisation de variables de types complexes :

// Les types complexes sont représentés par une 'classe'.
// Une classe permet de spécifier toutes les caractéristiques d'un type (propriétés et méthodes).
// La variable qui référence une donnée de type complexe devient une instance de la classe (un objet).

// 'String' est une classe du langage de programmation Java pour représenter des chaînes de caractères.
// 'PVector' est une classe de Processing pour représenter un vecteur 2D ou 3D (ex. position d'un élément dans l'espace).

// une instance d'objet de type chaîne de caractères
String textmessage = "abcdefghij";

// une instance d'objet de type vecteur qui contient la valeur des coordonnées sur l'axe X et Y dans un espace 2D
PVector vector2D = new PVector(1, 2);

// une instance d'objet de type vecteur qui contient la valeur des coordonnées sur l'axe X, Y et Z dans un espace 3D
PVector vector3D = new PVector(1, 2, 3);

// 3. afficher la valeur de ces variables dans la console

println("value of variable 'logic'       : " + logic);
println("value of variable 'smallnumber' : " + smallnumber);
println("value of variable 'letter'      : " + letter);
println("value of variable 'integer'     : " + integer);
println("value of variable 'realnumber'  : " + realnumber);
println("value of variable 'hugenumber'  : " + hugenumber);
println("value of variable 'textmessage' : " + textmessage);
println("value of variable 'vector2D'    : " + vector2D);
println("value of variable 'vector3D'    : " + vector3D);
