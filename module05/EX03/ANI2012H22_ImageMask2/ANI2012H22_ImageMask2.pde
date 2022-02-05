// ANI2012H22_ImageMask2.pde
// Exemple de l'application de différents masques sur une image (touches 1, 2, 3, 4).

// paramètres
String fileSource = "winter.jpg";

String fileMask1 = "mask1.png";
String fileMask2 = "mask2.png";
String fileMask3 = "mask3.png";
String fileMask4 = "mask4.png";

// variables
PImage imgSource;

PImage imgMask;

PImage imgMask1;
PImage imgMask2;
PImage imgMask3;
PImage imgMask4;

void setup()
{
  size(640, 505);

  // charger les images en mémoires
  imgSource = loadImage(fileSource);

  imgMask1 = loadImage(fileMask1);
  imgMask2 = loadImage(fileMask2);
  imgMask3 = loadImage(fileMask3);
  imgMask4 = loadImage(fileMask4);

  // sélectionner un masque au hasard
  switch (int(random(1.0f, 5.0f)))
  {
    case 1:
      imgMask = imgMask1;
      break;
    case 2:
      imgMask = imgMask2;
      break;
    case 3:
      imgMask = imgMask3;
      break;
    case 4:
      imgMask = imgMask4;
      break;
  }
}

void draw()
{
  // couleur d'arrière-plan
  background(31);

  // appliquer le masque sur l'image source
  imgSource.mask(imgMask);

  // dessiner l'image masquée
  image(imgSource, 0, 0);
}

void keyReleased()
{
  if (key == '1')
    imgMask = imgMask1;
  if (key == '2')
    imgMask = imgMask2;
  if (key == '3')
    imgMask = imgMask3;
  if (key == '4')
    imgMask = imgMask4;
}
