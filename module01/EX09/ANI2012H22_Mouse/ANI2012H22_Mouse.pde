// ANI2012H22_Mouse.pde
// Exemple d'utilisation de l'interactivité à la souris.

// paramètre
float speedMax = 100;

// variables
int mousePositionX;
int mousePositionY;

float mouseVelocityX;
float mouseVelocityY;

float centerX;
float centerY;

float speed;

float offset;

boolean isMousePressedLeft;
boolean isMousePressedRight;

boolean isMouseMoving;

PFont typo;

String textInfo = "bouger & cliquer";

String textMouseClickLeft = "clic gauche";
String textMouseClickRight = "clic droit";

String textDisplay;

// fonction d'initialisation
void setup()
{
  size(960, 640);

  frameRate(60);

  centerX = width / 2.0f;
  centerY = height / 2.0f;

  offset = centerX / 2.0f;

  isMousePressedLeft = false;
  isMousePressedRight = false;
  isMouseMoving = false;

  typo = loadFont("Monospaced-64.vlw");

  textFont(typo);

  rectMode(CORNER);
}

// fonction de mise à jour de l'affichage
void draw()
{
  // Processing offre deux variables globales qui permettent d'avoir accès à la position courante du curseur : 'mouseX' et 'mouseY'
  // Processing offre aussi deux variables globales pour la position précédente du curseur : 'pmouseX' et 'pmouseY', mais elles ne sont pas utilisées dans cet exemple

  // calculer la vélocité du curseur (le mouvement du curseur par rapport à sa position précédente)
  mouseVelocityX = mouseX - mousePositionX;
  mouseVelocityY = mouseY - mousePositionY;

  // garder une copie de la position courante (elle sera la position précédente lors de la prochaine mise à jour)
  mousePositionX = mouseX;
  mousePositionY = mouseY;

  // calculer la vitesse du curseur en fonction de sa vélocité
  speed = sqrt(mouseVelocityX * mouseVelocityX + mouseVelocityY * mouseVelocityY);
  // la fonction 'sqrt' calcule la racine carrée de la valeur passée en paramètre

  // ne pas dépasser une vitesse maximale
  if (speed > speedMax)
    speed = speedMax;

  // changer le couleur d'arrière-plan en fonction de la vitesse du curseur
  // la fonction 'map' permet de convertir une variable numérique d'un intervalle à un autre
  background(int(map(speed, 0, speedMax, 0, 255)));

  // taille du texte
  textSize(48);

  if (isMousePressedLeft)
  {
    fill(192, 192);
    rect(0, 0, centerX, height);

    fill(255);
    text(textMouseClickLeft, centerX - offset, centerY);
  }

  if (isMousePressedRight)
  {
    fill(192, 192);
    rect(centerX, 0, centerX, height);

    fill(255);
    text(textMouseClickRight, centerX + offset, centerY);
  }

  fill(255);
  textSize(18);
  textAlign(LEFT);
  text("position: (" + mousePositionX + ", " + mousePositionY + ")", width / 32.0f, height / 16.0f);
  text("vélocité: (" + mouseVelocityX + ", " + mouseVelocityY + ")", width - width / 3.0f, height / 16.0f);
  text("vitesse: " + int(speed) + " pixels/frame", width - width / 3.0f, height / 16.0f + 32.0f);

  textSize(24);
  textAlign(CENTER);
  text(textInfo, centerX, height - (height / 16.0f));
}

// fonction appelée lorsqu'un bouton de la souris est enfoncé
void mousePressed()
{
  // la variable globale 'mouseButton' permet de valider l'état des boutons de la souris
  if (mouseButton == LEFT)
    isMousePressedLeft = true;
  if (mouseButton == RIGHT)
    isMousePressedRight = true;
}

// fonction appelée lorsqu'un bouton de la souris est relâché
void mouseReleased()
{
  if (mouseButton == LEFT)
    isMousePressedLeft = false;
  if (mouseButton == RIGHT)
    isMousePressedRight = false;
}
