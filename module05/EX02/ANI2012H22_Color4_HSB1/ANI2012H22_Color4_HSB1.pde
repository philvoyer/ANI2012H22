// ANI2012H22_Color4_HSB1.pde
// Programme qui génère une animation en boucle d'un arc-en-ciel avec décalage sur l'axe horizontal.
// Flèches en haut et en bas pour changer la vitesse de l'animation.
// Flèches à gauche et à droite pour changer la direction de l'animation.
// Barre d'espacement pour inverser la direction de l'animation.

// paramètres
int resolution = 512;
int speed = 5;
boolean direction = true;

// variables
int index;
int shift;
int value;

float hue;

void setup()
{
  size(512, 512);
  frameRate(60);

  // configurer le mode de couleur
  colorMode(HSB, 100);

  shift = 0;
}

void draw()
{
  // remplir la fenêtre d'affichage avec une ligne d'une couleur différente pour chaque colonne de pixels
  for (index = 0; index < resolution; ++index)
  {
    // couleur en fonction de l'index de la colonne et la valeur de décalage
    value = index + shift;

    // faire boucler la valeur de la couleur
    value = cycle(value, 0, resolution);

    // calculer la teinte proportionnelement au nombre de colonnes
    hue = map(value, 0, resolution, 0, 100);

    // couleur courante en mode HSB
    stroke(hue, 100, 100);

    // dessiner une ligne qui occupe toute la colonne
    line(index, 0, index, resolution);
  }

  // incrémenter la valeur de décalage
  if (direction)
    shift += speed;
  else
    shift -= speed;

  // faire boucler la valeur de décalage
  shift = cycle(shift, 0, resolution);
}

// fonction qui permet de boucler sur l'intervalle entre la borne inférieure et supérieure
int cycle(int value, int min, int max)
{
  if (value < min)
    return value + max;
  else if (value >= max)
    return value - max;
  else
    return value;
}

void keyReleased()
{
  if (keyCode == UP)
    speed += 1;
  if (keyCode == DOWN)
    speed -= 1;
  if (keyCode == LEFT)
    direction = true;
  if (keyCode == RIGHT)
    direction = false;
  if (key == ' ')
    direction = !direction; // inverser la direction de l'animation
}
