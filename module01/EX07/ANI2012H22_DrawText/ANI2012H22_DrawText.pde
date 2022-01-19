// ANI2012H22_DrawText.pde
// Exemple d'affichage de texte avec une police de caractères.
// La police de caractères doit d'abord être encodée avant d'être chargée en mémoire par un programme.
// (dans l'éditeur de Processing > menu Tools > Create Font...)

// variables primitives
float positionX;
float positionY;

// 'PFont' est une classe de Processing pour la gestion des polices de caractères
PFont typo;

// fonction d'initialisation
void setup()
{
  // résolution de la fenêtre d'affichage
  size(512, 512);

  // importer la police de caractères à partir du répertoire /data
  typo = loadFont("HelveticaNeue-Medium-64.vlw");

  // configurer la police de caractères courante
  textFont(typo);

  // calculer la position du centre de la fenêtre d'affichage
  positionX = width / 2.0f;
  positionY = height / 2.0f;
}

// fonction de mise à jour de l'affichage
void draw()
{
  // couleur d'arrière-plan
  background(31);

  // couleur du texte
  fill(223);

  // alignement du texte
  textAlign(CENTER, CENTER);

  // taille du texte
  textSize(64);

  // afficher le nom de la police de caractères
  text("Helvetica Neue", positionX, positionY);
}
