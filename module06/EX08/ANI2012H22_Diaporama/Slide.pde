// ANI2012H22_Diaporama/Slide.pde
// Classe de type Slide, qui hérite de Sprite.

class Slide extends Sprite
{
  float positionZ;

  float scale;

  float velocityX;
  float velocityY;

  float opacity;

  Slide(String n)
  {
    super(n);
  }

  void init()
  {
    super.init();

    scale = positionZ / maxdepth;

    opacity = map(positionZ / maxdepth, 0.0f, 1.0f, 64.0f, 255.0f);
  }

  void update(float timeElasped)
  {
    super.update(timeElasped);

    sizeX = resolutionX * scale;
    sizeY = resolutionY * scale;

    velocityX = speedX * scale * timeElasped;
    velocityY = speedY * scale * timeElasped;

    positionX = positionX + velocityX;
    positionY = positionY + velocityY;
  }

  void render()
  {
    imageMode(mode);

    tint(opacity, opacity, opacity, 255);

    image(imgData, positionX, positionY, sizeX, sizeY);
  }
}
