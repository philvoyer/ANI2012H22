// ANI2012H22_Particles/ParticleSystem.pde
// Classe de type ParticleSystem.

class ParticleSystem
{
  final static int PARTICLE_TYPE_NONE    = 0;
  final static int PARTICLE_TYPE_FIREFLY = 1;
  final static int PARTICLE_TYPE_PHYSIC  = 2;
  final static int PARTICLE_TYPE_SNOW    = 3;
  final static int PARTICLE_TYPE_FLAME   = 4;

  int index;

  int count;
  int type;

  int activeParticleCount;

  float timeStart;
  float timeNow;
  float timeLast;
  float timeElapsed;

  float timeScale = 1.0f;

  float probabilitySpawn;

  // collection de systèmes de particules
  ArrayList<Particle> system;

  // collection de particules actives
  ArrayList<Particle> particleActive;

  // collection de particules inactives
  ArrayList<Particle> particleReady;

  // itérateur de projectiles
  Iterator<Particle> iterator;

  Vector3D space;
  Vector3D origin;

  Particle particle;

  ParticleSystem()
  {
    count = 10;
    type = PARTICLE_TYPE_SNOW;
    init();
  }

  ParticleSystem(int size, int type)
  {
    count = size;
    this.type = type;
    init();
  }

  void init()
  {
    system = new ArrayList<Particle>();

    particleActive = new ArrayList<Particle>();
    particleReady = new ArrayList<Particle>();

    origin = new Vector3D(width / 2.0f, height / 2.0f, 0.0f);
    space = new Vector3D();

    for (index = 0; index < count; ++index)
    {
      switch (type)
      {
        case PARTICLE_TYPE_FIREFLY:
          particle = new ParticleFirefly();
          probabilitySpawn = ParticleFirefly.probabilitySpawn;
          break;
       case PARTICLE_TYPE_PHYSIC:
          particle = new ParticlePhysic();
          probabilitySpawn = ParticlePhysic.probabilitySpawn;
          break;
        case PARTICLE_TYPE_SNOW:
          particle = new ParticleSnow();
          probabilitySpawn = ParticleSnow.probabilitySpawn;
          break;
        case PARTICLE_TYPE_FLAME:
          particle = new ParticleFlame();
          probabilitySpawn = ParticleFlame.probabilitySpawn;
          break;
      }

      particle.ps = this;
      particle.position.copy(origin);

      system.add(particle);
      particleReady.add(particle);
    }

    timeStart = millis();
    timeLast= timeStart;
  }

  void update()
  {
    // mise à jour des variables en lien avec le temps
    timeNow = millis();
    timeElapsed = (timeNow - timeLast) / 1000.0f;
    timeLast = timeNow;

    // mise à jour de l'émetteur de particules
    updateEmitter();

    // nombre de particules actives
    activeParticleCount = particleActive.size();

    // valider s'il y a des particules actives
    if (activeParticleCount > 0)
    {
      // boucler sur la collection de particules actives
      for (index = 0; index < particleActive.size(); ++index)
      {
        // référence vers la particule situé à cet index de la collection
        particle = particleActive.get(index);

        // valider si la particule est expirée
        if (!particle.isExpired)
        {
          // mettre à jour la particule
          particle.update();
        }
        else
        {
          // recycler la particule si elle est expirée
          recycle(particle);
        }
      }

      // FFT est-ce vraiment nécessaire ?

      // obtenir un itérateur pour la collection de particules actives
      iterator = particleActive.iterator();

      // boucle avec itérateur et un 'while' car présence d'un 'remove' qui modifie la taille de la collection
      while (iterator.hasNext())
      {
        particle = iterator.next();

        if (!particle.isExpired)
          particle.render();
      }
    }
  }

  void addParticule(float positionX, float positionY)
  {
    if (particleReady.size() > 0)
    {
      particle = particleReady.get(0);

      particle.init();

      particle.position.x = positionX;
      particle.position.y = positionY;

      particleReady.remove(0);
      particleActive.add(particle);
    }
    else
      print("particles system overload");
  }

  void updateEmitter()
  {
    if (random(0.0f, 1.0f) < probabilitySpawn)
    {
      if (particleReady.size() > 0)
      {
        particle = particleReady.get(0);

        particle.init();

        particleReady.remove(0);
        particleActive.add(particle);
      }
      else
        print("sytem overload");
    }
  }

  void recycle(Particle p)
  {
    particleActive.remove(p);
    particleReady.add(p);
  }

  void print(String tag)
  {
    println("particle system " + tag + " (" + particleActive.size() + " " + particleReady.size() + " " + count + ")");
  }
}
