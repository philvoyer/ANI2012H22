// ANI2012H22_ImageSampling.pde
// Création de trois images de destination différentes à partir de l'échantillonnage d'une image source.

// paramètres
String file = "forest.jpg";

// définir la résolution des images de destination
int imageWidth = 256;
int imageHeight = 256;

// définir la valeur des espacements verticaux et horizontaux
int offsetVertical = 32;
int offsetHorizontal = 32;

// variables
PImage imageSource;

PImage image1;
PImage image2;
PImage image3;

void setup()
{
  // ajuster la dimension de la fenêtre en fonction de la résolution de l'image source et des espacements
  size(896, 320);

  // importer l'image source
  imageSource = loadImage(file);

  // instanciation des trois images de destination
  image1 = createImage(imageWidth, imageHeight, RGB);
  image2 = createImage(imageWidth, imageHeight, RGB);
  image3 = createImage(imageWidth, imageHeight, RGB);

  // copier différentes sections de l'image source dans les images de destination
  image1.copy(imageSource, imageWidth * 0, 0, imageWidth, imageHeight, 0, 0, imageWidth, imageHeight);
  image2.copy(imageSource, imageWidth * 1, 0, imageWidth, imageHeight, 0, 0, imageWidth, imageHeight);
  image3.copy(imageSource, imageWidth * 2, 0, imageWidth, imageHeight, 0, 0, imageWidth, imageHeight);

  noLoop();
}

void draw()
{
  background(31);

  // dessiner l'image de gauche
  image(
    image1,
    offsetHorizontal,
    offsetVertical,
    imageWidth,
    imageHeight);

  // dessiner l'image du centre
  image(
    image2,
    imageWidth * 1 + offsetHorizontal * 2,
    offsetVertical,
    imageWidth,
    imageHeight);

  // dessiner l'image de droite
  image(
    image3,
    imageWidth * 2 + offsetHorizontal * 3,
    offsetVertical,
    imageWidth,
    imageHeight);
}
