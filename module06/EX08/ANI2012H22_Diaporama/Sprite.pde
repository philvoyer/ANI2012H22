// ANI2012H22_Diaporama/Sprite.pde
// Classe de type Sprite.

class Sprite
{
  PImage imgData;
  String name;

  float positionX;
  float positionY;

  float resolutionX;
  float resolutionY;

  float sizeX;
  float sizeY;

  int mode;

  Sprite(String n)
  {
    name = n;
  }

  void init()
  {
    imgData = loadImage(name);

    resolutionX = imgData.width;
    resolutionY = imgData.height;
  }

  void update(float timeElapsed)
  {
    sizeX = resolutionX;
    sizeY = resolutionY;

    timeElapsed = timeElapsed;
  }

  void render()
  {
    imageMode(mode);
    image(imgData, positionX, positionY, sizeX, sizeY);
  }
}
