// ANI2012H22_DrawTriangleAtPosition.pde
// Dessine un triangle équilatérale à une position précise.
// Le premier triangle est au centre de la fenêtre d'affichage.
// D'autres triangles peuvent être dessinés à la position d'un clic de souris.

// paramètre
float triangleEdgeSize = 200;

// variables
float positionTriangleX;
float positionTriangleY;

void setup()
{
  size(512, 512);
  strokeWeight(4);
  fill(127);

  // position initiale au centre de la fenêtre d'affichage
  positionTriangleX = width / 2.0f;
  positionTriangleY = height / 2.0f;
}

void draw()
{
  drawTriangle(positionTriangleX, positionTriangleY, triangleEdgeSize);
}

// fonction qui permet de dessiner un triangle équilatérale centré sur une position avec des arêtes d'une longueur paramétrable
void drawTriangle(float x, float y, float edgeSize)
{
  // équation l'altitude d'un triangle équilatérale
  float altitude = sqrt(3.0f) / 2.0f * edgeSize;

  // calculer la moitié de l'altitude
  float altitudeHalf = altitude / 2.0f;

  // calculer la moitié de la longueur d'une arête
  float edgeSizeHalf = edgeSize / 2.0f;

  // position du sommet en bas à gauche
  float vertex1X = -edgeSizeHalf;
  float vertex1Y =  altitudeHalf;

  // position du sommet en bas à droite
  float vertex2X =  edgeSizeHalf;
  float vertex2Y =  altitudeHalf;

  // position du sommet en haut au centre
  float vertex3X =  0;
  float vertex3Y = -altitudeHalf;

  // comme les sommets ont été calculés à l'origine, on fait une translation vers la position passé en paramètre
  triangle(
    vertex1X + x, vertex1Y + y,
    vertex2X + x, vertex2Y + y,
    vertex3X + x, vertex3Y + y);
}

void mouseReleased()
{
  positionTriangleX = mouseX;
  positionTriangleY = mouseY;
  triangleEdgeSize = random(10, 300);
  fill(int(random(256)), int(random(256)), int(random(256)));
}
