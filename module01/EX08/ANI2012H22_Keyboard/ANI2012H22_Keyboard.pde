// ANI2012H22_Keyboard.pde
// Exemple d'utilisation de l'interactivité au clavier.

// paramètre
float offset = 180;

// variables booléennes pour stocker l'état des touches du clavier
boolean isKeyPressedSpace = false;
boolean isKeyPressedEnter = false;

boolean isKeyPressedUp = false;
boolean isKeyPressedDown = false;
boolean isKeyPressedLeft = false;
boolean isKeyPressedRight = false;

boolean isKeyPressedW = false;
boolean isKeyPressedS = false;
boolean isKeyPressedA = false;
boolean isKeyPressedD = false;

// autres variables nécessaires à l'exécution du programme
float centerX;
float centerY;

PFont typo;

// le '\n' dans l'instruction suivante est une séquence d'échappement qui permet d'insérer un saut de ligne dans une chaîne de caractères
String textInfo = "appuyer sur des touches du clavier\n(flèches, WSAD, espace)";

String textKeySpace = "ESPACE";

String textKeyUp = "HAUT";
String textKeyDown = "BAS";
String textKeyLeft = "GAUCHE";
String textKeyRight = "DROITE";

String textDisplay;

char textKeyW = 'W';
char textKeyS = 'S';
char textKeyA = 'A';
char textKeyD = 'D';

// fonction d'initialisation
void setup()
{
  size(960, 540);

  frameRate(60);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  typo = loadFont("Monospaced-64.vlw");

  textFont(typo);
  textAlign(CENTER, CENTER);
}

// fonction de mise à jour de l'affichage
void draw()
{
  background(63);

  // afficher le texte qui est toujours présent
  textSize(24);
  text(textInfo, centerX, height - (height / 16.0f));

  textSize(48);

  // afficher conditionnellement les autres zones de texte selon les états des variables booléennes
  if (isKeyPressedSpace)
    text(textKeySpace, width / 2.0f, height / 2.0f);
  if (isKeyPressedUp)
    text(textKeyUp, centerX, centerY - offset);
  if (isKeyPressedDown)
    text(textKeyDown, centerX, centerY + offset);
  if (isKeyPressedLeft)
    text(textKeyLeft, centerX - offset, centerY);
  if (isKeyPressedRight)
    text(textKeyRight, centerX + offset, centerY);
  if (isKeyPressedW)
    text(textKeyW, centerX / 2.0f, centerY - offset);
  if (isKeyPressedS)
    text(textKeyS, centerX / 2.0f, centerY);
  if (isKeyPressedA)
    text(textKeyA, centerX / 2.0f - offset, centerY);
  if (isKeyPressedD)
    text(textKeyD, centerX / 2.0f + offset, centerY);
}

// fonction appelée lorsqu'un bouton du clavier est enfoncé
void keyPressed()
{
  updateKeyboard(true);
}

// fonction appelée lorsqu'un bouton du clavier est relâché
void keyReleased()
{
  updateKeyboard(false);
}

// fonction de mise à jour l'état des touches du clavier
void updateKeyboard(boolean state)
{
  // la variable globale 'key' permet de valider si une des touches alphanumériques est enfoncée
  // la variable globale 'keyCode' est pour les autres touches

  // le 'if' permet d'exécuter l'instruction suivante seulement si l'expression entre parenthèses retourne vrai ('true')

  // dans les instructions qui suivent, portez votre attention sur la différence entre les opérateurs '=' et '=='
  // '=' est un opérateur d'affection, il permet d'assigner la valeur située à droite dans la variable située à gauche
  // '==' est un opérateur de comparaison, il permet de retourner vrai ('true') si les éléments situés à gauche et à droite sont équivalents

  if (keyCode == UP)
    isKeyPressedUp = state;
  if (keyCode == DOWN)
    isKeyPressedDown = state;
  if (keyCode == LEFT)
    isKeyPressedLeft = state;
  if (keyCode == RIGHT)
    isKeyPressedRight = state;
  if (key == ' ')
    isKeyPressedSpace = state;
  if (key == 'w' || key == 'W')
    isKeyPressedW = state;
  if (key == 's' || key == 'S')
    isKeyPressedS = state;
  if (key == 'a' || key == 'A')
    isKeyPressedA = state;
  if (key == 'd' || key == 'D')
    isKeyPressedD = state;

  // l'opérateur '||' est un 'ou' logique, il permet de retourner vrai ('true') si la partie de gauche ou de droite de l'expression sont vraie
  // dans le bloc de code précédent, cela permet d'avoir le même comportement si les touches 'WASD' sont en minuscules ou en majuscules
}
