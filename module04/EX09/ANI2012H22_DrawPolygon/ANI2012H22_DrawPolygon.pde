// ANI2012H22_DrawPolygon.pde
// Dessine une séquence de polygones réguliers avec un nombre de côtés croissant.

size(1280, 128);

strokeWeight(3);

// paramètres
int countPolygon = 12;
int sideMin = 3;

// variables
int side = sideMin;

int indexPolygon;
int indexVertex;

float positionX;
float positionY;

float polygonX;
float polygonY;

float offset;

// angle initiale
float angle = 0.0f;

// diamètre des polygones en fonction de la largeur de la fenêtre d'affichage
float diameter = width / countPolygon;

// rayon des polygones en fonction de la hauteur de la fenêtre d'affichage
float radius = height / 3.0f;

// une itération de la boucle pour chaque polygone
for (indexPolygon = 0; indexPolygon < countPolygon; ++indexPolygon)
{
  // calculer l'angle qui sépare chaque sommet du polygone
  offset = radians(360.0f / side);

  // calculer la position du centre du polygone
  polygonX = radius + indexPolygon * diameter;
  polygonY = height / 2.0f;

  // débuter une nouvelle forme vectorielle
  beginShape();

  // boucle avec une itération pour chaque côté du polygone
  for (indexVertex = 0; indexVertex < side; ++indexVertex)
  {
    // calculer la position du prochain sommet
    positionX = polygonX + cos(angle) * radius;
    positionY = polygonY + sin(angle) * radius;

    // ajouter le sommet au polygone
    vertex(positionX, positionY);

    // incrémenter l'angle pour le prochain sommet
    angle += offset;
  }

  // terminer et rendre la forme vectorielle
  endShape(CLOSE);

  // incrémenter l'index de l'itérateur
  ++side;
}
