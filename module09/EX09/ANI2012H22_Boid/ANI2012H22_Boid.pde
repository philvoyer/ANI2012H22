// ANI2012H22_Boid.pde
// Simulation d'un système dynamique où chaque boid à un comportement de cohésion, d'alignement
// et de séparation qui sont déterminés en fonction des autres boids à sa proximité.

// paramètres
int count = 100;

float boidRadius = 10.0f;

float boidMaxspeed = 2.0f;
float boidMaxforce = 0.03f;

float boidThresholdSeparation = 50.0f;
float boidThresholdCohesion = 50.0f;
float boidThresholdAligment = 50.0f;

float boidWeightSeparation = 1.50f;
float boidWeightCohesion = 1.00f;
float boidWeightAligment = 0.75f;

color colorBack = 0;

// variables
Crowd crowd;
Boid boid;

void setup()
{
  size(960, 540);
  frameRate(60);
  noStroke();

  rectMode(CORNER);

  // instanciation du groupe de boids
  crowd = new Crowd();

  // initialisation du groupe de boids
  for (int index = 0; index < count; ++index)
  {
    // instanciation d'un nouveau boid
    boid = new Boid(width / 2.0f, height / 2.0f);

    // configuration du nouveau boid
    configuration(boid);

    // ajouter le nouveau boid au système de boids
    crowd.add(boid);
  }
}

void draw()
{
  fade(16);

  // mise à jour des contrôles interactifs
  updateMouse();

  // mise à jour du système de boids
  crowd.update();

  // rendu du système de boids
  crowd.render();
}

void updateMouse()
{
  if (mousePressed == true)
  {
    // créer un nouveau boid seulement un frame sur deux
    if (frameCount % 2 == 0)
    {
      // faire apparaitre le boid à la position du curseur
      boid = new Boid(mouseX, mouseY);
      configuration(boid);
      crowd.add(boid);
    }
  }
}

// fonction de configuration d'un nouveau boid selon les paramètres du programme
void configuration(Boid b)
{
  // propriétés
  b.radius = boidRadius;
  b.maxspeed = boidMaxspeed;
  b.maxforce = boidMaxforce;

  // valeurs des seuils des différents comportements
  b.thresholdCohesion = boidThresholdCohesion;
  b.thresholdAligment = boidThresholdAligment;
  b.thresholdSeparation = boidThresholdSeparation;

  // valeurs de pondération des différents comportements
  b.weightSeparation = boidWeightSeparation;
  b.weightCohesion = boidWeightCohesion;
  b.weightAligment = boidWeightAligment;
}

void fade(float intensity)
{
  rectMode(CORNER);
  noStroke();
  fill(colorBack, intensity);
  rect(0, 0, width, height);
}
