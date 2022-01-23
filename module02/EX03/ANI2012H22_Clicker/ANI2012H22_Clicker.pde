// ANI2012H22_Clicker.pde
// Exemple d'un bouton sur lequel on peut cliquer avec la souris.
// Le programme compte aussi le nombre de clics.

// couleurs du boutons dans l'état enfoncé et relâché
color colorButtonNormal = color(222, 0, 222);
color colorButtonInside = color(255, 0, 255);
color colorButtonPressed = color(200, 0, 200);

// variable qui contient l'état
boolean isButtonPressed;
boolean isMouseInsideButton;

// variable qui contient les positions en X et Y qui délimitent le bouton
float buttonPositionX;
float buttonPositionY;
float buttonWidth;
float buttonHeight;
float buttonScaleUp;
float buttonScaleDown;
float buttonMinX;
float buttonMinY;
float buttonMaxX;
float buttonMaxY;

// variable qui contient le nombre de clics sur le bouton
int count;

void setup()
{
  // initialiser les états de Processing
  size(512, 512);
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(32);

  // initialiser les variables
  buttonPositionX = width / 2.0f;
  buttonPositionY = height / 2.0f;
  buttonWidth = width * 0.5f;
  buttonHeight = height * 0.5f;
  buttonScaleUp = 1.05f;
  buttonScaleDown = 0.95f;
  buttonMinX = buttonPositionX - (buttonWidth / 2.0f);
  buttonMinY = buttonPositionY - (buttonHeight / 2.0f);
  buttonMaxX = buttonPositionX + (buttonWidth / 2.0f);
  buttonMaxY = buttonPositionY + (buttonHeight / 2.0f);
  isButtonPressed = false;
  isMouseInsideButton = false;
  count = 0;
}

void draw()
{
  // effacer la fenêtre d'affichage
  background(63);

  // valider si le curseur est à l'intérieur des limites du bouton sur l'axe X
  // ('>=' : plus grand ou égal, '&&' : ET logique, '<=' : plus petit ou égal)
  if (mouseX >= buttonMinX && mouseX <= buttonMaxX)
  {
    // valider si le curseur est à l'intérieur des limites du bouton sur l'axe Y
    if (mouseY >= buttonMinY && mouseY <= buttonMaxY)
    {
      // le curseur est à l'intérieur du bouton
      isMouseInsideButton = true;
    }
    else
      isMouseInsideButton = false;
  }
  else
    isMouseInsideButton = false;

  // valider si le bouton est enfoncé
  if (isButtonPressed == true)
  {
    // dessiner le bouton en mode enfoncé
    fill(colorButtonPressed);
    rect(buttonPositionX, buttonPositionY, buttonWidth * buttonScaleDown, buttonHeight * buttonScaleDown);

  }
  else if (isMouseInsideButton == true) // le bouton n'est pas enfoncé, mais le curseur est-il à l'intérieur ?
  {
    // dessiner le bouton en mode relâché avec curseur à l'intérieur
    fill(colorButtonInside);
    rect(buttonPositionX, buttonPositionY, buttonWidth * buttonScaleUp, buttonHeight * buttonScaleUp);
  }
  else // le bouton n'est pas enfoncé et le curseur est à l'extérieur
  {
    // dessiner le bouton en mode relâché avec curseur à l'extérieur
    fill(colorButtonNormal);
    rect(buttonPositionX, buttonPositionY, buttonWidth, buttonHeight);
  }

  // afficher le nombre de clics au centre du bouton
  fill(#FFFFFF);
  text(count, buttonPositionX, buttonPositionY);
}

// fonction appelée lorsqu'un bouton de la souris est enfoncé
void mousePressed()
{
  if (isMouseInsideButton == true)
  {
    // si le bouton gauche ou droit est enfoncé
    // ('==' : équivalence,  '||' OU logique)
    if (mouseButton == LEFT || mouseButton == RIGHT)
    {
      // le bouton passe à l'état enfoncé
      isButtonPressed = true;
   }
  }
}

// fonction appelée lorsqu'un bouton de la souris est relâché
void mouseReleased()
{
  if (isMouseInsideButton == true)
  {
    // incrémenter le counter
    count = count + 1;

    println("button clic count: " + count);
  }

  // le bouton passe à l'état relâché
  isButtonPressed = false;
}
