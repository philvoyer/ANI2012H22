// ANI2012H22_TransformFunctions.pde
// Exemples de fonctions utilitaires de transformation (dist, norm, map, lerp).

// paramètres
int count = 10;

float thresholdMin = 0.0f;
float thresholdMax = 255.0f;

// variables
float value;

float positionX1;
float positionY1;
float positionX2;
float positionY2;

void setup()
{
  size(512, 512);
  noLoop();

  // deux positions aléatoires
  positionX1 = random(width);
  positionY1 = random(height);
  positionX2 = random(width);
  positionY2 = random(height);

  // 1. distance entre deux positions avec la fonction 'dist'
  value = dist(positionX1, positionY1, positionX2, positionY2);

  println("ex1 - distance: " + value);


  // 2. normalisation d'une valeur dans l'intervalle [0, 1] avec la fonction 'norm'
  value = random(thresholdMin, thresholdMax + 1.0f);

  value = norm(value, thresholdMin, thresholdMax);

  println("ex2 - norm: " + value);


  // 3. conversion d'une valeur d'un intervalle vers un autre intervalle avec la fonction 'map'
  value = random(0, width);

  value = map(value, 0, width, thresholdMin, thresholdMax);

  println("ex3 - map: " + value);


  // 4. interpolation linéaire entre deux valeurs avec la fonction 'lerp'
  print("ex4 - lerp: ");

  for (int index = 0; index < count; ++index)
  {
    value = lerp(thresholdMin, thresholdMax, index / (float) count);
    print(value + " ");
  }

  print("\n");
}

void draw()
{
  textSize(18);
  textAlign(CENTER, CENTER);

  text("Exemples de fonctions utilitaires de transformation\n(voir résultats dans la console)", width / 2.0f, height / 2.0f);
}
