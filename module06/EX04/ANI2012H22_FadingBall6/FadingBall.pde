// ANI2012H22_FadingBall6/FadingBall.pde
// Classe de type FadingBall, qui hérite de Ball, qui elle hérite de Entity.

class FadingBall extends Ball
{
  color colorFill;

  float oscillation;

  FadingBall(float x, float y, float r, color c)
  {
    super(x,y,r,c);
  }

  void update()
  {
    super.update();
    radius = oscillation;
  }

  void render()
  {
    super.render();
    ellipse(positionX, positionY, radius, radius);
  }
}
