// ANI2012H22_Boid/Crowd.pde
// Classe de type Crowd.

class Crowd
{
  ArrayList<Boid> system;

  Crowd()
  {
    system = new ArrayList<Boid>();
  }

  // fonction de mise à jour du système de boids
  void update()
  {
    for (Boid b : system)
    {
      b.updateBehaviors(system);
      b.updateMotion();
      stayInScreen(b);
    }
  }

  // fonction de rendu du système de boids
  void render()
  {
    for (Boid b : system)
    {
      b.render();
    }
  }

  // fonction qui permet d'ajouter un nouveau boid au système
  void add(Boid b)
  {
    system.add(b);
    println("boid count: " + system.size());
  }

  // fonction qui permet de ramener les boids à l'extrémité opposée quand ils sortent de la fenêtre d'affichage
  void stayInScreen(Boid b)
  {
    if (b.position.x < -b.radius)
      b.position.x = width + b.radius;
    if (b.position.y < -b.radius)
      b.position.y = height + b.radius;
    if (b.position.x > width + b.radius)
      b.position.x = -b.radius;
    if (b.position.y > height + b.radius)
      b.position.y = -b.radius;
  }
}
