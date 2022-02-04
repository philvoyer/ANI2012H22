// ANI2012H22_ImageImportVector.pde
// Importation d'un fichier image de type vectoriel et affichage en pleine fenêtre.
// Le fichier à importer doit avoir le format .svg et se trouver dans le répertoire /data.

// paramètre
String file = "graph.svg";

// variable
PShape shape; // classe de Processing pour les formes vectorielles

void setup()
{
  size(512, 512);

  // mode où l'origine de l'image vectorielle est au centre
  shapeMode(CENTER);

  // chargement du fichier
  shape = loadShape(file);
}

void draw()
{
  // couleur d'arrière-plan
  background(100);

  // afficher l'image vectorielle au centre de la scène
  shape(shape, width / 2.0f , height / 2.0f, 512, 512);

  // exporter le contenu de la fenêtre d'affichage dans une image non vectorielle
  saveFrame("render.png");

  // faire une seule mise à jour
  noLoop();
}
