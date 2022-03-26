// ANI2012H22_KochSnowflake/Koch.pde
// Classe de type flocon de Koch.

class Koch
{
  Vector positionFrom;
  Vector positionTo;

  Koch(Vector v1, Vector v2)
  {
    positionFrom = v1.clone();
    positionTo = v2.clone();
  }

  // fonction d'affichage du segment de forme fractale
  void render()
  {
    line(
      positionFrom.x,
      positionFrom.y,
      positionTo.x,
      positionTo.y);
  }

  // fonction qui calcule la position du point 1 de la forme fractale
  Vector computePosition1()
  {
    Vector v = positionFrom.clone();
    return v;
  }

  // fonction qui calcule la position du point 2 de la forme fractale
  Vector computePosition2()
  {
    Vector v = positionTo.clone();
    v.minus(positionFrom);
    v.multiply(1.0f / 3.0f);
    v.add(positionFrom);
    return v;
  }

  // fonction qui calcule la position du point 3 de la forme fractale
  Vector computePosition3()
  {
    Vector v = positionFrom.clone();
    Vector w = positionTo.clone();
    w.minus(positionFrom);
    w.multiply(1.0f / 3.0f);
    v.add(w);
    w.rotateZ(-radians(60));
    v.add(w);
    return v;
  }

  // fonction qui calcule la position du point 4 de la forme fractale
  Vector computePosition4()
  {
    Vector v = positionTo.clone();
    v.minus(positionFrom);
    v.multiply(2.0f / 3.0f);
    v.add(positionFrom);
    return v;
  }

  // fonction qui calcule la position du point 5 de la forme fractale
  Vector computePosition5()
  {
    Vector v = positionTo.clone();
    return v;
  }
}
