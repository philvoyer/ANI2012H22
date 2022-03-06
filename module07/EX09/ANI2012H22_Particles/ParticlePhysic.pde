// ANI2012H22_Particles/ParticlePhysic.pde
// Classe de type ParticlePhysic, qui hérite de la classe Particle.

class ParticlePhysic extends Particle
{
  final static float probabilitySpawn = 0.618f;

  Vector3D force;
  Vector3D acceleration;
  Vector3D velocity;
  Vector3D noise;

  float mass;
  float speed;
  float speedMax;

  ParticlePhysic()
  {
    super();

    colorDiffuse = #9900DD;

    lifetime = 5.0f;

    mass = 1.0f;
    speed = 0.0f;
    speedMax = 999.0f;

    force = new Vector3D(0.0f, 0.0f, 0.0f);
    acceleration = new Vector3D(0.0f, 0.0f, 0.0f);
    velocity = new Vector3D(0.0f, 0.0f, 0.0f);
    noise = new Vector3D(1.0f, 1.0f, 0.0f);
  }

  void init()
  {
    super.init();

    ps.space.x = width;
    ps.space.y = height;

    // position initiale aléatoire
    position.x = ps.origin.x + random(0.0f, 1.0f) * ps.space.x - ps.space.x / 2.0f;
    position.y = ps.origin.y + random(0.0f, 1.0f) * ps.space.y - ps.space.y / 2.0f;

    // valeurs initiales des variables de physiques
    force.set(0.0f, 0.0f, 0.0f);
    acceleration.set(0.0f, 0.0f, 0.0f);
    velocity.set(0.0f, 0.0f, 0.0f);
    applyForce(random(-noise.x, noise.x), random(-noise.y, noise.y), 0.0f);
  }

  void update()
  {
    // appeler l'update de la classe parent
    super.update();

    // accélération en fonction de la force
    acceleration.set(
      force.x * timeElapsed,
      force.y * timeElapsed,
      force.z * timeElapsed);

    // pondérer l'accélération en fonction de la masse
    acceleration.divide(mass);

    // ajouter l'accélération à la vélocité
    velocity.add(acceleration);

    // s'assurer de ne pas dépasser la vitesse maximale
    if (velocity.magnitude() > speedMax)
    {
      velocity.normalize();
      velocity.scale(speedMax);
    }

    // calculer la vitesse courante
    speed = velocity.magnitude();

    // appliquer la vélocité pour faire bouger la position
    position.add(velocity);
  }

  void render()
  {
    fill(colorDiffuse,127);
    ellipse(position.x, position.y, 16, 16);
  }

  // fonction pour appliquer une force à une particule physique
  void applyForce(float x, float y, float z)
  {
    force.add(x, y, z);
  }
}
