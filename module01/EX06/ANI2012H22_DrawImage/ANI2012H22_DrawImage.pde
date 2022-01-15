// ANI2012H22_DrawImage.pde
// Exemple d'importation et d'affichage d'une image cadrée sur la fenêtre.
// Le fichier image doit se trouver dans un répertoire appelé 'data' situé au même endroit que le fichier du code source du programme.

// déclaration d'une variable de type 'PImage' pour référencer l'image
// 'PImage' est une classe de Processing qui permet de créer des instances d'images et de partager des fonctionnalités communes.
PImage img;

// fonction d'initialisation
void setup()
{
  // fenêtre d'affichage avec les mêmes dimensions que l'image
  size(512, 770); // <- correspond à la résolution l'image

  // importer l'image à partir du répertoire /data
  img = loadImage("gertie.jpg");
}

// fonction de mise à jour de l'affichage
void draw()
{
  // dessiner l'image à l'origine du système de coordonnées (coin supérieur gauche)
  image(img, 0, 0);
}
