// ANI2012H22_Projectiles/Projectile.pde
// Classe de type Projectile.

class Projectile
{
  // position du projectile
  float positionX;
  float positionY;

  // rayon du projectile
  float radius;

  // état actif ou inactif du projectile
  boolean isActive;

  // constructeur de la classe (rien de spécial à faire)
  Projectile(){}

  void render()
  {
    if (isActive)
    {
      // projectile rouge
      stroke(63, 0, 0);
      fill(191, 0, 0);
    }
    else
    {
      // projectile vert
      stroke(0, 63, 0);
      fill(0, 127, 0);
    }

    // dessiner le projectile
    ellipse(positionX, positionY, radius, radius);
  }
}
