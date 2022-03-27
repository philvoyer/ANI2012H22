// ANI2012H22_Henon/Henon.pde
// Classe de type attracteur de Henon.

class Henon
{
  float alphaX, alphaY, betaX, betaY, k;

  Henon(float positionX, float positionY)
  {
    alphaX = positionX;
    alphaY = positionY;
  }

  void update()
  {
    k = alphaY - alphaX * alphaX;

    alphaY = (alphaX * sinus) + (k * cosinus);
    alphaX = (alphaX * cosinus) - (k * sinus);

    betaX = centerX + frequency * alphaX;
    betaY = centerY + frequency * alphaY;
  }

  void render()
  {
    if (betaX > 0 && betaX < width && betaY > 0 && betaY < height)
      point(betaX, betaY);
  }
}
