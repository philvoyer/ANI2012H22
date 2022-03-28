// ANI2012H22_Boid/Boid.pde
// Classe de type Boid.

class Boid
{
  // paramètres
  float radius;

  float maxspeed;
  float maxforce;

  float thresholdSeparation;
  float thresholdCohesion;
  float thresholdAligment;

  float weightSeparation;
  float weightCohesion;
  float weightAligment;

  // variables
  int count;

  float distance;
  float angle;

  Vector3D force;
  Vector3D acceleration;
  Vector3D velocity;
  Vector3D position;

  Vector3D steering;

  Vector3D steeringSeparation;
  Vector3D steeringAligment;
  Vector3D steeringCohesion;

  Vector3D sum;
  Vector3D delta;

  Boid(float x, float y)
  {
    angle = random(TWO_PI);

    steering = new Vector3D();
    force = new Vector3D(0.0f, 0.0f, 0.0f);
    acceleration = new Vector3D(0.0f, 0.0f, 0.0f);
    velocity = new Vector3D(cos(angle), sin(angle), 0.0f);
    position = new Vector3D(x, y, 0.0f);

    delta = new Vector3D();
    sum = new Vector3D();

    steeringSeparation = new Vector3D();
    steeringAligment = new Vector3D();
    steeringCohesion = new Vector3D();
  }

  // fonction de mise à jour qui déterminent la force causée par l'ensemble des comportements
  void updateBehaviors(ArrayList<Boid> system)
  {
    // initialiser la force à zéro
    force.set(0.0f, 0.0f, 0.0f);

    // déterminer la force brute causée par chaque comportement
    steeringSeparation.copy(separation(system));
    steeringCohesion.copy(cohesion(system));
    steeringAligment.copy(alignment(system));

    // pondérer la force de chaque comportement selon les paramètres du programme
    steeringSeparation.multiply(weightSeparation);
    steeringCohesion.multiply(weightCohesion);
    steeringAligment.multiply(weightAligment);

    // additionner dans un seul vecteur la force pondérée de chaque comportement
    force.add(steeringSeparation);
    force.add(steeringCohesion);
    force.add(steeringAligment);
  }

  // fonction de mise à jour du mouvement selon les principes de la physique
  void updateMotion()
  {
    // initialiser l'accélération à zéro
    acceleration.set(0.0f, 0.0f, 0.0f);

    // déterminer l'accélération selon la force
    acceleration.add(force);

    // déterminer la vélocité par addition de l'accélération avec la vélocité précédente
    velocity.add(acceleration);

    // limiter la vélocité à la vitesse maximale
    if (velocity.magnitude() > maxspeed)
      velocity.scale(maxspeed);

    // déterminer la nouvelle position par addition de la vélocité avec la position précédente
    position.add(velocity);

    // déterminer l'angle selon la direction de la vélocité
    angle = velocity.heading() + radians(90.0f);
  }

  // fonction qui calcule le mouvement causé par le comportement de séparation
  Vector3D separation(ArrayList<Boid> system)
  {
    sum.set(0.0f, 0.0f, 0.0f);

    count = 0;

    for (Boid other : system)
    {
      delta.copy(position);
      delta.minus(other.position);

      distance = delta.magnitude();

      if ((distance > 0.0f) && (distance < thresholdSeparation))
      {
        delta.normalize();
        delta.divide(distance);
        sum.add(delta);
        ++count;
      }
    }

    if (count > 0)
    {
      steering.copy(sum);
      steering.divide(count);

      steering.scale(maxspeed);

      steering.minus(velocity);
      steering.scale(maxforce);
    }
    else
    {
      steering.set(0.0f, 0.0f, 0.0f);
    }

    return steering;
  }

  // fonction qui calcule le mouvement causé par le comportement de cohésion
  Vector3D cohesion(ArrayList<Boid> system)
  {
    sum.set(0.0f, 0.0f, 0.0f);

    count = 0;

    for (Boid other : system)
    {
      delta.copy(position);
      delta.minus(other.position);

      distance = delta.magnitude();

      if ((distance > 0.0f) && (distance < thresholdCohesion))
      {
        sum.add(other.position);
        ++count;
      }
    }

    if (count > 0)
    {
      steering.copy(sum);
      steering.divide(count);

      steering.minus(position);
      steering.scale(maxspeed);

      steering.minus(velocity);
      steering.scale(maxforce);
    }
    else
    {
      steering.set(0.0f, 0.0f, 0.0f);
    }

    return steering;
  }

  // fonction qui calcule le mouvement causé par le comportement d'alignement
  Vector3D alignment(ArrayList<Boid> system)
  {
    sum.set(0.0f, 0.0f, 0.0f);

    count = 0;

    for (Boid other : system)
    {
      delta.copy(position);
      delta.minus(other.position);

      distance = delta.magnitude();

      if ((distance > 0.0f) && (distance < thresholdAligment))
      {
        sum.add(other.velocity);
        ++count;
      }
    }

    if (count > 0)
    {
      steering.copy(sum);
      steering.divide(count);

      steering.scale(maxspeed);

      steering.minus(velocity);
      steering.scale(maxforce);
    }
    else
    {
      steering.set(0.0f, 0.0f, 0.0f);
    }

    return steering;
  }

  // fonction qui permet de rendre le boid selon sa transformation courante
  void render()
  {
    fill(255, 255);

    pushMatrix();

    translate(position.x, position.y);
    rotate(angle);

    beginShape(TRIANGLES);
    vertex(0.0f, -radius / 2.0f);
    vertex(-radius, radius * 2.0f);
    vertex(radius, radius * 2.0f);
    endShape();

    ellipse(0.0f, radius * 2.0f, radius * 2.0f, radius * 2.0f);

    popMatrix();
  }
}
