// ANI2012H22_Particles/ParticleSnow.pde
// Classe de type ParticleSnow, qui hérite de la classe ParticlePhysic.

class ParticleSnow extends ParticlePhysic
{
  final static float probabilitySpawn = 0.618f;

  ParticleSnow()
  {
    super();

    colorDiffuse = #FFFFFF;

    lifetime = 5.0f;

    mass = 1.0f;
    speed = 0.0f;
    speedMax = 5.0f;

    noise.set(0.01f, 0.0f, 0.0f);
  }

  void init()
  {
    super.init();

    ps.space.x = width;
    ps.space.y = 32;

    // position initiale aléatoire mais en haut de l'écran
    position.x = ps.origin.x + random(0.0f, 1.0f) * ps.space.x  - ps.space.x / 2.0f;
    position.y = 0 + random(0.0f, 1.0f) * ps.space.y;

    // valeurs initiales des variables de physiques
    force.set(0.0f, 0.0f, 0.0f);
    acceleration.set(0.0f, 0.0f, 0.0f);
    velocity.set(0.0f, 0.0f, 0.0f);
    applyForce(0.0f, 1.0f, 0.0f);
  }

  void update()
  {
    // appliquer une force pour ajoute un peu de mouvement aléatoire sur l'axe X
    applyForce(random(-noise.x, noise.x), 0.0f, 0.0f);

    // appeler l'update de la classe parent
    super.update();

    // arêter le déplacement lorsque la particule touche au sol
    if (position.y >= height)
      velocity.set(0.0f, 0.0f, 0.0f);
  }

  void render()
  {
    fill(colorDiffuse, 127);
    ellipse(position.x, position.y, 16, 16);
  }
}
