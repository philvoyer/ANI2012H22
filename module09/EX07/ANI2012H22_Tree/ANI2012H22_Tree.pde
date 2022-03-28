// ANI2012H22_Tree.pde
// Génère et dessine un arbre créé à partir d'une fonction récursive.

// paramètres
int depthCurrent = 5;
int depthMax = 8;

float angle = PI / 6.0f;
float theta = PI / 128.0f;

boolean isRandomized = false;

// variables
int seed;

float factor;

boolean isKeyPressedLeft;
boolean isKeyPressedRight;

void setup()
{
  size(512, 512);
  stroke(0);
  strokeWeight(6);
  fill(255);

  seed = millis();
}

void draw()
{
  background(191);

  // valeur initiale de la séquence de nombres pseudo-aléatoires
  randomSeed(seed);

  // position initiale
  translate(width / 2.0f, height);

  // appel de la fonction récursive qui dessine chacune des branches de l'arbre
  tree(height / 3.0f, 0);

  // modifier l'angle interactivement
  if (isKeyPressedLeft)
    angle -= theta;
  if (isKeyPressedRight)
    angle += theta;
}

// fonction récursive qui dessine l'arbre branche par branche
void tree(float segment, int level)
{
  factor = isRandomized == true ? random(0.5f, 1.25f) : 1.0f;

  // dessiner la branche
  line(0, 0, 0, -segment * factor);

  // déplacer l'origine au bout de la branche
  translate(0, -segment * factor);

  // appliquer le facteur de décroissance de la taille
  segment *= 0.66f;

  // incrémenter le nombre de niveaux
  ++level;

  // valider la condition d'arrêt
  if (level < depthCurrent)
  {
    factor = isRandomized == true ? random(0.5f, 1.5f) : 1.0f;

    // dessiner la branche de droite
    pushMatrix();
    rotate(angle * factor);
    tree(segment, level);
    popMatrix();

    // ajouter optionnellement un peu de hasard au niveau de la rotation
    factor = isRandomized == true ? random(0.5f, 1.5f) : 1.0f;

    // dessiner la branche de gauche
    pushMatrix();
    rotate(-angle * factor);
    tree(segment,level);
    popMatrix();

    // dessiner une ellipse à l'embranchement
    ellipse(0, 0, 12, 12);
  }
}

void keyPressed()
{
  if (keyCode == LEFT)
    isKeyPressedLeft = true;
  if (keyCode == RIGHT)
    isKeyPressedRight = true;
}

void keyReleased()
{
  if (keyCode == ' ')
    isRandomized = !isRandomized;
  if (keyCode == LEFT)
    isKeyPressedLeft = false;
  if (keyCode == RIGHT)
    isKeyPressedRight = false;
  if (keyCode == UP)
  {
    depthCurrent = ++depthCurrent < depthMax ? depthCurrent : depthMax;
    println("current depth : " + depthCurrent);
  }
  if (keyCode == DOWN)
  {
    depthCurrent = --depthCurrent > 0 ? depthCurrent : 0;
    println("current depth : " + depthCurrent);
  }
  if (key == 'r')
  {
    seed = millis();
    println("new random seed: " + seed);
  }
}
