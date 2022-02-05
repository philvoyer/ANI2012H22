// ANI2012H22_ImageAnimation1.pde
// Animation en boucle d'une séquence d'images.

// paramètres
String filePrefix = "balle";
String fileExtension = ".png";

// nombre d'image dans l'animation
int animationFrameCount = 28;

// variables
PImage[] animation;

String fileName;

int keyframe;

void setup()
{
  size(800, 300);
  frameRate(12);

  // initialiser le tableau qui contiendra les images de l'animation
  animation = new PImage[animationFrameCount];

  for (keyframe = 1; keyframe <= animationFrameCount; ++keyframe)
  {
    // construire le nom du fichier en fonction du keyframe
    // la fonction nf() permet de formatter un nombre vers une chaîne de 4 caractères
    // afin de correspondre au nom du fichier de chaque image
    fileName = filePrefix + nf(keyframe, 4) + fileExtension;

    // importer l'image qui correspond au nom de fichier
    animation[keyframe - 1] = loadImage(fileName);
  }

  keyframe = 0;
}

void draw()
{
  background(0);

  // déterminer le keyframe courant
  keyframe = frameCount % animationFrameCount;

  // afficher l'image courante de l'animation
  image(animation[keyframe], 0, 0);
}
