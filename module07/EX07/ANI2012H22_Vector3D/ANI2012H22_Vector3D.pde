// ANI2012H22_Vector3D.pde
// Tests unitaires d'une classe de type vecteur 3D.

// paramètres
Vector3D v1 = new Vector3D(1.0f, 0.0f, 0.0f);
Vector3D v2 = new Vector3D(0.0f, 1.0f, 0.0f);
Vector3D v3 = new Vector3D(0.0f, 0.0f, 1.0f);

// variable
Vector3D result;

void setup()
{
  size(512, 512);
  noLoop();
  textAlign(CENTER, CENTER);
  textSize(32);

  result = new Vector3D();

  testVector3D();
}

void draw()
{
  text("Tests unitaires\nclasse Vector3D\n(voir résultats dans la console)", width/2, height/2);
}

void testVector3D()
{
  println("Test des méthodes de la classe Vector3D");

  // 1. afficher la valeur courante d'un vecteur dans la console
  v1.print("v1");
  v2.print("v2");
  v3.print("v3");

  // 2. addition de 2 vecteurs
  result.set(1.0f, 0.0f, 0.0f);
  result.add(v1);
  result.print("addition");

  // 3. différence entre 2 vecteurs (soustraction)
  result.set(1.0f, 0.0f, 0.0f);
  result.minus(v1);
  result.print("minus");

  // 4. magnitude (longueur) d'un vecteur
  println("magnitude = " + v1.magnitude());

  // 5. distance entre 2 vecteurs
  println("magnitude = " + v1.distance(v2));

  // 6. angle entre 2 vecteurs
  println("angle between v1 and v2 = " + v1.angleBetween(v2));

  // 7. angle entre 1 vecteur et l'axe X (orientation dans un plan 2D)
  println("angle between v2 and X axis = " + v2.heading());

  // 8. produit scalaire entre 2 vecteurs (retourne une mesure de la différence entre 2 vecteurs)
  println("v1 dot v2 = " + v1.dot(v2));
  println("v2 dot v1 = " + v2.dot(v1));

  // 9. produit croisé entre 2 vecteurs (retourne un vecteur perpendiculaire aux 2 vecteurs)
  result = v1.cross(v2);
  result.print("v1 cross v2");

  result = v2.cross(v1);
  result.print("v2 cross v1");

  result = v1.cross(v2).cross(v3);
  result.print("v1 cross v2 cross v3");

  // 10. produit scalaire et produit croisé combinés ensemble
  println("v1 cross v2 dot v3 = " + v1.cross(v2).dot(v3));

  // 11. positions aléatoires dans une boîte définie par 3 paramètres (largeur x hauteur x profondeur)
  result.randomize(1, 3, 10, true);
  result.print("randomize centered");

  result.randomize(1, 3, 10, false);
  result.print("randomize uncentered");
}
