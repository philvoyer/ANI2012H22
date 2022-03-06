// ANI2012H22_Particles/ParticleFlame.pde
// Classe de type ParticleFlame, qui hérite de la classe ParticlePhysic.

class ParticleFlame extends ParticlePhysic
{
  final static float probabilitySpawn = 0.9f;

  color colorFinal;

  ParticleFlame()
  {
    super();

    colorDiffuse = #FFFF40;
    colorFinal   = #FF6600;

    lifetime = 3.5f;

    mass = 0.5f;
    speed = 0.0f;
    speedMax = 1.0f;

    noise.set(0.05f, 0.0f, 0.0f);
  }

  void init()
  {
    super.init();

    ps.space.x = width;
    ps.space.y = 32;

    // position initiale aléatoire mais en bas de l'écran
    position.x = ps.origin.x + random(0.0f, 1.0f) * ps.space.x  - ps.space.x / 2.0f;
    position.y = height - random(0.0f, 1.0f) * ps.space.y;

    // valeurs initiales des variables de physiques
    force.set(0.0f, 0.0f, 0.0f);
    acceleration.set(0.0f, 0.0f, 0.0f);
    velocity.set(0.0f, 0.0f, 0.0f);

    // force qui fait progressivement monter la particule vers le haut
    applyForce(0.0f, -0.5f, 0.0f);
  }

  void update()
  {
    // appliquer une force pour ajoute un peu de mouvement aléatoire sur l'axe X
    applyForce(random(-noise.x, noise.x), 0.0f, 0.0f);

    // appeler l'update de la classe parent
    super.update();
  }

  void render()
  {
    // couleur de la particule en fonction de sa durée de vie
    fill(
      lerpColor(colorDiffuse, colorFinal, timeActive / (lifetime * 1000.0f)),
      int(map(timeActive, 0.0f, lifetime * 1000.0f, 192.0f, 0.0f)));

    // rayon de la particule en fonction de sa durée de vie
    ellipse(
      position.x,
      position.y,
      int(map(timeActive, 0.0f, lifetime * 1000.0f, 16.0f, 64.0f)),
      int(map(timeActive, 0.0f, lifetime * 1000.0f, 16.0f, 64.0f)));
  }
}
