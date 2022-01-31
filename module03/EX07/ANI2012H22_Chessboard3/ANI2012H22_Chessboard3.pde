// ANI2012H22_Chessboard3.pde
// Génération d'une grille avec animation de la case sélectionnée
// et possibilité de changer le contenu des cases avec le clavier et la souris.

// paramètres
int tileCountX = 16;
int tileCountY = 16;

// modes : P pour Pion, F pour Fou, C pour Cavalier, T pour Tour, D pour Dame, R pour Roi
String[] mode = {"P", "F", "C", "T", "D", "R"};

int selectedModeIndex = 0;

int colorBlack = 63;
int colorWhite = 191;

color colorSelected = color(191, 191, 0);

// variables
String grid[][];
String tileContent;

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
  frameRate(20);
  noStroke();
  rectMode(CORNER);
  textAlign(CENTER, CENTER);

  reset();
}

void draw()
{
  background(0);

  // dessiner la grille en 3 étapes (1. arrière-plan 2. sélection 3. contenu)
  drawGridBackground();
  drawSelectedTile();
  drawGridContent();

  // mise à jour de la case sélectionnée
  updatePosition();
}

// fonction qui permet d'initialiser la scène
void reset()
{
  // calculer le diamètre des cases en fonction de la résolution de la fenêtre
  tileSizeX = width / tileCountX;
  tileSizeY = height / tileCountY;

  // calculer le nombre de cases
  tileCountTotal = tileCountX * tileCountY;

  // choisir la position sélectionnée au hasard
  selectedTileIndex = int(random(tileCountTotal));

  // instanciation du tableau à deux dimensions
  grid = new String[tileCountX][tileCountY];

  // initialisation du tableau (vider toutes les cases)
  for (int indexX = 0; indexX < tileCountX; ++indexX)
  {
    for (int indexY = 0; indexY < tileCountY; ++indexY)
    {
      grid[indexX][indexY] = str(getTileIndexFromCoord(indexX, indexY));
    }
  }
}

// fonction pour dessiner l'arrière-plan de la grille (motif d'échiquier)
void drawGridBackground()
{
  for (int indexY = 0; indexY < tileCountY; ++indexY)
  {
    for (int indexX = 0; indexX < tileCountX; ++indexX)
    {
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
}

// fonction pour dessiner la case séletionnée
void drawSelectedTile()
{
  // dessiner la case sélectionnée plus large que les autres
  fill(colorSelected);
  rect(
    tileSizeX * getTileCoordXFromIndex(selectedTileIndex) - tileSizeX * 0.1f,
    tileSizeY * getTileCoordYFromIndex(selectedTileIndex) - tileSizeY * 0.1f,
    tileSizeX * 1.2f,
    tileSizeY * 1.2f);
}

// fonction pour dessiner le contenu des case
void drawGridContent()
{
  for (int indexY = 0; indexY < tileCountY; ++indexY)
  {
    for (int indexX = 0; indexX < tileCountX; ++indexX)
    {
      // affichage du contenu de la case
      tilePositionX = tileSizeX * indexX;
      tilePositionY = tileSizeY * indexY;

      // lire le contenu de la case dans le tableau
      tileContent = grid[indexX][indexY];

      // dessiner le contenu de la case
      fill(255, 0, 0);
      text(tileContent, tilePositionX + tileSizeX/2.0f, tilePositionY + tileSizeY/2.0f);
    }
  }
}

// fonction qui permet de changer le contenu de la tuile sélectionnée en fonction du mode courant
void changeTileContent()
{
  int coordX = getTileCoordXFromIndex(selectedTileIndex);
  int coordY = getTileCoordYFromIndex(selectedTileIndex);
  grid[coordX][coordY] = mode[selectedModeIndex];
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

int getTileIndexFromPosition(int x, int y)
{
  int coordX = int(x * tileCountX / (float) width);
  int coordY = int(y * tileCountY / (float) height);
  int index = coordY * tileCountX + coordX;
  println("coordx: " + coordX + " coordY: " + coordY + " tile index: " + index);
  return index;
}

int getTileIndexFromCoord(int x, int y)
{
  return y * tileCountX + x;
}

int getTileCoordXFromIndex(int index)
{
  return index % tileCountX;
}

int getTileCoordYFromIndex(int index)
{
  return index / tileCountX;
}

void updateKeyboard(boolean state)
{
  if (key == ' ')
    changeTileContent();
  if (key == '1')
    selectedModeIndex = 1;
  if (key == '2')
    selectedModeIndex = 2;
  if (key == '3')
    selectedModeIndex = 3;
  if (key == '4')
    selectedModeIndex = 4;
  if (key == '5')
    selectedModeIndex = 5;
  if (key == '6')
    selectedModeIndex = 6;
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

void keyPressed()
{
  updateKeyboard(true);
}

void keyReleased()
{
  updateKeyboard(false);
}

void mouseReleased()
{
  println("click at (" + mouseX + ", " + mouseY + ")");
  selectedTileIndex = getTileIndexFromPosition(mouseX, mouseY);
}
