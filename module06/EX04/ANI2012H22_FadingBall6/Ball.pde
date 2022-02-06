// ANI2012H22_FadingBall6/Ball.pde
// Classe de type Ball, qui hérite de Entity, et dont hérite FadingBall.

class Ball extends Entity
{
  color colorFill;

  Ball(float x, float y, float r, color c)
  {
    super(x, y, r);
    colorFill = c;
  }

  void update()
  {
    super.update();
  }

  void render()
  {
    super.render();
    fill(colorFill);
  }
}
