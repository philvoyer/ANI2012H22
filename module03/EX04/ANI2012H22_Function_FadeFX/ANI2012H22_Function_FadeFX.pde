// ANI2012H22_Function_FadeFX.pde
// Exemple d'utilisation d'une fonction pour générer l'animation d'un estompement progressif en pleine fenêtre.

// L’estompement progressif est une animation où tout ce qui est dessiné dans la fenêtre disparait progressivement à chaque mise à jour de l’affichage pour finalement converger vers la couleur d’arrière-plan de la scène.

// Cet effet visuel est plutôt facile à réaliser et fait en sorte que le contenu
// de la fenêtre d'affichage change ou disparait progressivement au fil du temps.

// L'astuce est de ne pas effacer le contenu de la fenêtre d'affichage à chaque frame au début de la fonction draw
// et de plutôt dessiner un rectangle semi-transparent par-dessus tout le contenu de la fenêtre comme dernière étape de la fonction.
// Cet effet peut être ajouté assez facilement par-dessus n'importequel type de contenu visuel.

// Cette technique sera entre autres utilisée dans certains des exemples du cours pour créer un effet de persistance visuelle des éléments rendus dans la fenêtre d'affichage.

// paramètre : couleur d'arrière-plan
int colorBack = 15;

// paramètre : niveau de transparence dans l'intervalle [0, 255]
// l'effet est plus intéressant avec des valeurs assez basses, car l'estompement se fait sur une plus longue période de temps.
float currentIntensity = 7.0f;

void setup()
{
  size(960, 540);
  frameRate(60);
  background(255); // < remarquez que cette fonction n'est plus utilisée au début de la fonction draw( ) pour effacer le contenu
}

void draw()
{
  // dessiner le contenu de la scène normalement (rien dans cet exemple)
  // ...

  // invocation de la fonction d'atténuation
  fade(currentIntensity);
}

// fonction qui atténue progressivement le contenu de la fenêtre
void fade(float intensity)
{
  // pas de ligne de contour
  noStroke();

  // couleur de remplissage de l'arrière-plan avec semi-transparence
  fill(colorBack, intensity);

  // dessiner un rectangle qui recouvre toute la fenêtre d'affichage
  rect(0, 0, width, height);
}

// réinitialiser la couleur de remplissage quand une touche du clavier est relâchée
// incrémenter et décrémenter l'intensité de l'effet avec les touches haut et bas.
void keyReleased()
{
  if (keyCode == UP)
    currentIntensity = clamp(++currentIntensity, 0.0f, 255.0f);
  if (keyCode == DOWN)
    currentIntensity = clamp(--currentIntensity, 0.0f, 255.0f);

  println("current intensity: " + currentIntensity);

  background(255);
}

// réinitialiser la couleur de remplissage lors d'un clic
void mouseReleased()
{
  background(255);
}

// fonction qui permet de borner un nombre réel entre une valeur minimale et maximale
float clamp(float value, float min, float max)
{
  if (value < min)
    return min;
  else if (value > max)
    return max;
  else
    return value;
}
