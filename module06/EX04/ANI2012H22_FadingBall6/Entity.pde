// ANI2012H22_FadingBall6/Entity.pde
// Classe de type Entity, la racine de l'hiérarchie de classes.

class Entity
{
  float positionX;
  float positionY;

  float radius;

  Entity(float x, float y, float r)
  {
    positionX = x;
    positionY = y;

    radius = r;
  }

  void update(){}

  void render(){}
}
