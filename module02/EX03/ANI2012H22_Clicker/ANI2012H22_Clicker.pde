// ANI2012H22_Clicker.pde
// Exemple d'un bouton sur lequel on peut cliquer avec la souris.
// Le programme compte aussi le nombre de clics.

// couleurs du boutons dans l'état enfoncé et relâché
color colorButtonPressed = color(255, 0, 255);
color colorButtonReleased = color(200, 0, 200);

// variable qui contient l'état
boolean isButtonPressed;

// variable qui contient les positions en X et Y qui délimitent le bouton
float buttonPositionX;
float buttonPositionY;
float buttonWidth;
float buttonHeight;
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
  background(63);
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(32);

  // initialiser les variables
  buttonPositionX = width / 2.0f;
  buttonPositionY = height / 2.0f;
  buttonWidth = width * 0.5f;
  buttonHeight = height * 0.5f;
  buttonMinX = buttonPositionX - (buttonWidth / 2.0f);
  buttonMinY = buttonPositionY - (buttonHeight / 2.0f);
  buttonMaxX = buttonPositionX + (buttonWidth / 2.0f);
  buttonMaxY = buttonPositionY + (buttonHeight / 2.0f);
  isButtonPressed = false;
  count = 0;
}

void draw()
{
  // sélectionner la couleur en fonction de l'état courant du bouton
  if (isButtonPressed)
    fill(colorButtonPressed);
  else
    fill(colorButtonReleased);

  // dessiner le bouton
  rect(buttonPositionX, buttonPositionY, buttonWidth, buttonHeight);

  // afficher le nombre de clics
  fill(#FFFFFF);
  text(count, buttonPositionX, buttonPositionY);
}

// fonction appelée lorsqu'un bouton de la souris est enfoncé
void mousePressed()
{
  // si le bouton gauche ou droit est enfoncé
  // ('==' : équivalence,  '||' OU logique)
  if (mouseButton == LEFT || mouseButton == RIGHT)
  {
    // valider si le clic est dans le bouton sur l'axe X
    // ('>=' : plus grand ou égal, '&&' : ET logique, '<=' : plus petit ou égal)
    if (mouseX >= buttonMinX && mouseX <= buttonMaxX)
    {
      // valider si le clic est dans le bouton sur l'axe Y
      if (mouseY >= buttonMinY && mouseY <= buttonMaxY)
      {
        // le bouton passe à l'état enfoncé
        isButtonPressed = true;

        // incrémenter le counter
        count = count + 1;

        println("button clic count: " + count);
      }
    }
  }
}

// fonction appelée lorsqu'un bouton de la souris est relâché
void mouseReleased()
{
  // le bouton passe à l'état relâché
  isButtonPressed = false;
}
