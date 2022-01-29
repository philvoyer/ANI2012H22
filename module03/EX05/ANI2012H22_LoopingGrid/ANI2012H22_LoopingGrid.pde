// ANI2012H22_LoopingGrid.pde
// Animation des résultats de différents exemples de boucles et
// utilisation de fonctions mathématiques de base.
// Le résultat de chaque boucle est encodé dans un dégradé de couleur,
// puis il est conservé dans un tableau à deux dimensions.

// paramètres
int tileSize = 32;
boolean isAnimated = true;
color colorStroke = color(91, 0, 15);

// variables
int index;

int indexX;
int indexY;

int divisionCountX;
int divisionCountY;

int tilePositionX;
int tilePositionY;

int tileOffsetX;

int tileShift;

int colorStep;

// tableau à deux dimensions qui contient le résultat de chaque boucle
int[][] table;

void setup()
{
  size(960, 322);
  frameRate(10);
  strokeWeight(4);
  stroke(colorStroke);
  rectMode(CORNER);

  // initialisation des variables
  tileShift = 0;

  divisionCountX = int(width / float(tileSize));
  divisionCountY = int(height / float(tileSize));

  colorStep = int(255.0f / divisionCountX);

  // instanciation du tableau à deux dimensions
  table = new int[divisionCountX][divisionCountY];

  // initialisation du tableau (mettre toutes les cases à zéro)
  for (indexX = 0; indexX < divisionCountX; ++indexX)
  {
    for (indexY = 0; indexY < divisionCountY; ++indexY)
    {
      table[indexX][indexY] = 0;
    }
  }

  // à remarquer : en programmation, le premier index d'un tableau n'est pas 1 mais 0
  // la première dimension du tableau est les colonnes et la seconde dimension est les rangées
  // la première case du tableau, celle de la colonne 1 de la rangé 1 est donc : table[0][0]
  // la case située à la quatrième colonne de la troisième rangée est ici : table[3][2]
  // la case située à la troisième colonne de la quatrième rangée est ici : table[2][3]
  // la case située à la dernière colonne de la dernière rangée est ici : table[divisionCountX - 1][divisionCountX - 1]

  // rangée 1. boucle croissante
  for (index = 0; index < divisionCountX; ++index)
  {
    table[index][0] = colorStep * index;
  }

  // rangée 2. boucle décroissante
  for (index = divisionCountX - 1; index >= 0; --index)
  {
    table[index][1] = colorStep * (divisionCountX - index);
  }

  // rangée 3. boucle croissante avec incrémentation de 2 sur les indices pairs
  for (index = 0; index < divisionCountX; index += 2)
  {
    table[index][2] = colorStep * index;
  }

  // rangée 4. boucle croissante avec incrémentation de 2 sur indices impairs
  for (index = 1; index < divisionCountX; index += 2)
  {
    table[index][3] = colorStep * index;
  }

  // rangée 5. boucle croissante avec incrémentation de 3
  for (index = 0; index < divisionCountX; index += 3)
  {
    table[index][4] = colorStep * (index + 2);
  }

  // rangée 6. boucle croissante avec mapping selon une fonction trigonométrique (sinus de 90 degrés par indice)
  for (index = 0; index < divisionCountX; ++index)
  {
    table[index][5] = int(map(sin(radians(index * 90.0f)), -1.0f, 1.0f, 0.0f, 255.0f));
  }

  // rangée 7. boucle croissante avec mapping selon une fonction trigonométrique (cosinus de 90 degrés par indice)
  for (index = 0; index < divisionCountX; ++index)
  {
    table[index][6] = int(map(cos(radians(index * 90.0f)), -1.0f, 1.0f, 0.0f, 255.0f));
  }

  // rangée 8. boucle croissante avec mapping selon une fonction trigonométrique (cosinus de 45 degrés par indice)
  for (index = 0; index < divisionCountX; ++index)
  {
    table[index][7] = int(map(cos(radians(index * 45.0f)), -1.0f, 1.0f, 0.0f, 255.0f));
  }

  // rangée 9. boucle croissante avec valeurs aléatoires (distribution uniforme)
  for (index = 0; index < divisionCountX; ++index)
  {
    table[index][8] = int(random(255.0f));
  }

  // rangée 10. boucle croissante avec valeurs aléatoires (fonction de bruit)
  for (index = 0; index < divisionCountX; ++index)
  {
    table[index][9] = int(noise(index) * 255.0f);
  }
}

void draw()
{
  // délai de quelques frames avant de lancer la boucle d'animation
  if (frameCount > 20)
  {
    if (isAnimated)
    {
      // variable utilisée pour décaler l'animation d'une case à chaque étape
      ++tileShift;

      // faire boucler l'animation sur l'intervalle des indices en X du tableau
      if (tileShift >= divisionCountX)
        tileShift = 0;
    }
  }

  // affichage du contenu du tableau sous forme d'une grille de rectangles colorés
  for (indexX = 0; indexX < divisionCountX; ++indexX)
  {
    for (indexY = 0; indexY < divisionCountY; ++indexY)
    {
      // décalage de la tuile en X
      tileOffsetX = indexX + tileShift;

      // afin de rester dans les limites du tableau
      if (tileOffsetX >= divisionCountX)
        tileOffsetX -= divisionCountX;

      // coordonnées de la case dans la fenêtre d'affichage
      tilePositionX = tileSize * indexX;
      tilePositionY = tileSize * indexY;

      // les valeurs précalculées dans le tableau sont utilisées pour colorer chaque case en ton de gris
      fill(table[tileOffsetX][indexY]);
      rect(tilePositionX, tilePositionY, tileSize, tileSize);
    }
  }
}

void keyReleased()
{
  // pauser ou relancer l'animation
  isAnimated = !isAnimated;
}
