// ANI2012H22_ImageAnimation2.pde
// Animation en boucle d'une séquence d'images à l'endroit puis à l'envers à la moitié de la vitesse.

// paramètres
String filePrefix = "balle";
String fileExtension = ".png";

int animationFrameCount = 28;

int speedFull = 24;
int speedHalf = 12;

// variables
PImage[] animation;

String fileName;

int keyframe;

boolean direction;

void setup()
{
  size(800, 300);
  frameRate(24);

  // direction initiale (vers l'avant)
  direction = true;

  // initialiser le tableau qui contiendra les images de l'animation
  animation = new PImage[animationFrameCount];

  for (keyframe = 1; keyframe <= animationFrameCount; ++keyframe)
  {
    // construire le nom du fichier en fonction du keyframe
    fileName = filePrefix + nf(keyframe, 4) + fileExtension;

    // importer l'image qui correspond au nom de fichier
    animation[keyframe - 1] = loadImage(fileName);
  }

  keyframe = 0;
}

void draw()
{
  background(0);

  if (direction == true) // direction avant
  {
    if (keyframe < animationFrameCount - 1)
      keyframe++;
    else
    {
      // changer de direction
      direction = false;

      // vitesse ralentie
      frameRate(speedHalf);
    }
  }
  else // direction arrière
  {
    if (keyframe > 0)
      keyframe--;
    else
    {
      // changer de direction
      direction = true;

      // vitesse normale
      frameRate(speedFull);
    }
  }

  // afficher l'image courante de l'animation
  image(animation[keyframe], 0, 0);
}
