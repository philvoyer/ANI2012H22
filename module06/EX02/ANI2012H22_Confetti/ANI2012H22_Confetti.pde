// ANI2012H22_Confetti.pde
// Instanciation et affichage de plusieurs confettis avec des attributs aléatoires

// classe de type Confetti
class Confetti
{
  float positionX; // position en X du confetti
  float positionY; // position en Y du confetti

  float radius;    // taille du confetti

  color colorFill; // couleur du confetti

  // constructeur
  Confetti(float x, float y, float r, color c)
  {
    positionX = x;
    positionY = y;
    radius    = r;
    colorFill = c;
  }

  // fonction d'affichage
  void render()
  {
    fill(colorFill);
    ellipse(positionX, positionY, radius, radius);
  }
}

// paramètres
int count = 1000;

float sizeMin = 5.0;
float sizeMax = 35.0;

// variables
int index;

// tableau de confettis
Confetti[] table;

// référence vers un confetti
Confetti confetti;

void setup()
{
  size(512, 512);
  noStroke();

  // instanciation d'un tableau pouvant contenir tous les confettis
  table = new Confetti[count];

  // boucler sur chacun des confettis à créer
  for (index = 0; index < count; ++index)
  {
    // instanciation d'un nouveau confetti
    confetti = new Confetti(0, 0, 0, 0);

    // assigner le nouveau confetti dans la position du tableau qui correspond à l'index de la boucle
    table[index] = confetti;
  }

  init();
}

void init()
{
  // boucler sur chacun des confettis
  for (index = 0; index < count; ++index)
  {
    // déterminer une valeur aléatoire pour chaque attribut du confetti
    table[index].positionX = random(0, width);
    table[index].positionY = random(0, height);
    table[index].radius    = random(sizeMin, sizeMax);
    table[index].colorFill = color(random(0.0f, 256.0f), random(0.0f, 256.0f), random(0.0f, 256.0f));
  }
}

void draw()
{
  background(191);

  // boucler sur chacun des confettis
  for (index = 0; index < count; ++index)
  {
    // dessiner le confetti
    table[index].render();
  }
}

// réinitialiser les attributs des confettis quand une touche du clavier est relâchée
void keyReleased()
{
  init();
}

// réinitialiser les attributs des confettis lors d'un clic
void mouseReleased()
{
  init();
}
