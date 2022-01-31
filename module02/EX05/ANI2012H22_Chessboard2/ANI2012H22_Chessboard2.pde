// ANI2012H22_Chessboard2.pde
// Génération d'un échiquier avec animation de la case sélectionnée.

// paramètres
int dimension = 16;

int colorBlack = 0;
int colorWhite = 255;

color colorSelected = color(191, 0, 191);

// variables
int resolution;
int diameter;

int tileCount;

int position;

boolean isKeyPressedUp = false;
boolean isKeyPressedDown = false;
boolean isKeyPressedLeft = false;
boolean isKeyPressedRight = false;

boolean isKeyPressedW = false;
boolean isKeyPressedS = false;
boolean isKeyPressedA = false;
boolean isKeyPressedD = false;

void setup()
{
  size(512, 512);
  frameRate(30);

  noStroke();

  // calculer le diamètre des cases en fonction de la résolution de la fenêtre
  resolution = min(width, height);
  diameter = resolution / dimension;

  // calculer le nombre de cases dans l'échiquier
  tileCount = dimension * dimension;

  // choisir la position sélectionnée au hasard
  position = int(random(dimension * dimension));
}

void draw()
{
  for (int indexY = 0; indexY < dimension; ++indexY)
  {
    for (int indexX = 0; indexX < dimension; ++indexX)
    {
      // même principe que l'algorithme de l'exemple précédent, mais en plus compact
      if (indexX % 2 == indexY % 2)
        fill(colorBlack);
      else
        fill(colorWhite);

      rect(
        diameter * indexX,
        diameter * indexY,
        diameter,
        diameter);
    }
  }

  // couleur de la case sélectionnée
  fill(colorSelected);

  // dessiner la case sélectionnée plus large que les autres
  rect(
    diameter * (position % dimension) - diameter * 0.1f,
    height - diameter * (position / dimension) - diameter - diameter * 0.1f,
    diameter * 1.2f,
    diameter * 1.2f);

  // mise à jour de la case sélectionnée
  updatePosition();
}

// fonction de mise à jour de la case sélectionnée selon l'interactivité au clavier
void updatePosition()
{
  if (isKeyPressedUp    || isKeyPressedW)
    position += dimension;
  if (isKeyPressedDown  || isKeyPressedS)
    position -= dimension;
  if (isKeyPressedLeft  || isKeyPressedA)
    position -= 1;
  if (isKeyPressedRight || isKeyPressedD)
    position += 1;

  if (position >= tileCount)
    position -= tileCount;
  else if (position < 0)
    position += tileCount;
}

void keyPressed()
{
  updateKeyboard(true);
}

void keyReleased()
{
  updateKeyboard(false);
}

void updateKeyboard(boolean state)
{
  if (keyCode == UP)
    isKeyPressedUp    = state;
  if (keyCode == DOWN)
    isKeyPressedDown  = state;
  if (keyCode == LEFT)
    isKeyPressedLeft  = state;
  if (keyCode == RIGHT)
    isKeyPressedRight = state;
  if (key == 'w' || key == 'W')
    isKeyPressedW     = state;
  if (key == 's' || key == 'S')
    isKeyPressedS     = state;
  if (key == 'a' || key == 'A')
    isKeyPressedA     = state;
  if (key == 'd' || key == 'D')
    isKeyPressedD     = state;
}
