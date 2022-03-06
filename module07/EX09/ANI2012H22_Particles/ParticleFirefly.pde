// ANI2012H22_Particles/ParticleFirefly.pde
// Classe de type ParticleFirefly, qui hérite de la classe Particle.

class ParticleFirefly extends Particle
{
  final static float probabilitySpawn = 0.25f;

  ParticleFirefly()
  {
    super();

    colorDiffuse = #22FF44;

    lifetime = 5.0f;
  }

  void init()
  {
    super.init();

    ps.space.x = width;
    ps.space.y = height;

    // position initiale aléatoire
    position.x = ps.origin.x + random(0.0f, 1.0f) * ps.space.x - ps.space.x / 2.0f;
    position.y = ps.origin.y + random(0.0f, 1.0f) * ps.space.y - ps.space.y / 2.0f;
  }

  void update()
  {
    // appeler l'update de la classe parent
    super.update();

    // mouvement aléatoire de la particule
    position.x += (random(0.0f, 1.0f) * 512.0f - 256.0f) * timeElapsed;
    position.y += (random(0.0f, 1.0f) * 512.0f - 256.0f) * timeElapsed;
  }

  void render()
  {
    fill(colorDiffuse, 127);
    ellipse(position.x, position.y, 24, 24);
  }
}
