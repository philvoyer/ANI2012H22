// ANI2012H22_Chessboard2.pde
// Génération d'un échiquier avec animation de la case sélectionnée.

// paramètres
int tileCountX = 16;
int tileCountY = 16;

int colorBlack = 0;
int colorWhite = 255;

color colorSelected = color(191, 0, 191);

// variables
int tileSizeX;
int tileSizeY;

float tilePositionX;
float tilePositionY;

int tileCountTotal;

int selectedTileIndex;

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
  tileSizeX = width / tileCountX;
  tileSizeY = height / tileCountY;

  // calculer le nombre de cases
  tileCountTotal = tileCountX * tileCountY;

  // choisir la position sélectionnée au hasard
  selectedTileIndex = int(random(tileCountTotal));
}

void draw()
{
  for (int indexY = 0; indexY < tileCountY; ++indexY)
  {
    for (int indexX = 0; indexX < tileCountX; ++indexX)
    {
      // même principe que l'algorithme de l'exemple précédent, mais en plus compact
      if (indexX % 2 == indexY % 2)
        fill(colorBlack);
      else
        fill(colorWhite);

      tilePositionX = tileSizeX * indexX;
      tilePositionY = tileSizeY * indexY;

      rect(
        tilePositionX,
        tilePositionY,
        tileSizeX,
        tileSizeY);
    }
  }

  // couleur de la case sélectionnée
  fill(colorSelected);

  // dessiner la case sélectionnée plus large que les autres
  rect(
    tileSizeX * (selectedTileIndex % tileCountX) - tileSizeX * 0.1f,
    tileSizeY * (selectedTileIndex / tileCountX) - tileSizeY * 0.1f,
    tileSizeX * 1.2f,
    tileSizeY * 1.2f);

  // mise à jour de la case sélectionnée
  updatePosition();
}

// fonction de mise à jour de la case sélectionnée selon l'interactivité au clavier
void updatePosition()
{
  if (isKeyPressedUp    || isKeyPressedW)
    selectedTileIndex -= tileCountX;
  if (isKeyPressedDown  || isKeyPressedS)
    selectedTileIndex += tileCountX;
  if (isKeyPressedLeft  || isKeyPressedA)
    selectedTileIndex -= 1;
  if (isKeyPressedRight || isKeyPressedD)
    selectedTileIndex += 1;

  if (selectedTileIndex >= tileCountTotal)
    selectedTileIndex -= tileCountTotal;
  else if (selectedTileIndex < 0)
    selectedTileIndex += tileCountTotal;
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
