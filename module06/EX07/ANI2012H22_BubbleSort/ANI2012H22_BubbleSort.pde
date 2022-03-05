// ANI2012H22_BubbleSort.pde
// Animation d'un algorithme de tri à bulles qui opère sur une liste de 12 éléments numériques animés en cercle.

import java.util.Collections; // librairie java qui contient la fonction 'shuffle'

// classe de type Ball
class Ball
{
  float positionX;
  float positionY;

  float targetX;
  float targetY;

  int value;

  Ball(float x, float y, int v)
  {
    positionX = x;
    positionY = y;
    value = v;
  }

  void target(float x, float y)
  {
    targetX = x;
    targetY = y;
  }

  void update()
  {
    // converger vers la position de destination
    positionX = positionX + (targetX - positionX) * speed;
    positionY = positionY + (targetY - positionY) * speed;
  }

  void render()
  {
    fill(255.0f / count * (value - 1), 0, 0);
    stroke(91, 0, 0);
    strokeWeight(3);
    ellipse(positionX, positionY, 32, 32);

    fill(255);
    textSize(18);
    text(value, positionX, positionY);
  }
}

// paramètres
int count = 20;
float speed = 0.075f;
float threshold = 1.0f;

// variables
int index;

float centerX;
float centerY;

float angle;
float offset;

float radius;

float timeNow;
float timeLast;
float timeElapsed;
float timeDelay;

ArrayList<Ball> list;

float[][] anchors;

Ball ball;

void setup()
{
  size(512, 512);
  frameRate(60);
  background(255);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);

  timeNow = timeLast = timeElapsed = timeDelay = 0.0f;

  // taille relative au canevas
  radius = height / 3.0f;

  // calculer l'angle qui sépare chaque sommet du polygone
  offset = radians(360.0f / count);

  // ramener en haut l'origine de l'angle de rotation autour du cercle
  angle = -PI / 2.0f;

  // calculer la position du centre du polygone
  centerX = width / 2.0f;
  centerY = height / 2.0f;

  // instancier une liste de balles
  list = new ArrayList<Ball>();

  // tableau à deux dimensions contenant les positions x et y des points d'ancrage
  anchors = new float[count][2];

  // calculer les positions x et y des points d'ancrage et les stocker dans le tableau
  for (index = 0; index < count; ++index)
  {
    // calculer la position du point d'ancrage
    anchors[index][0] = centerX + cos(angle) * radius;
    anchors[index][1] = centerY + sin(angle) * radius;

    // incrémenter l'angle pour la prochaine balle
    angle += offset;
  }

  // génération des balles
  for (index = 0; index < count; ++index)
  {
    // instanciation d'une nouvelle balle
    ball = new Ball(centerX, centerY, index + 1);

    // assigner le point d'ancrage correspondant à sa position
    ball.target(anchors[index][0], anchors[index][1]);

    // ajouter la balle à la liste
    list.add(ball);
  }

  // mélanger les balles de la liste
  randomize();
}

void draw()
{
  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f;
  timeLast = timeNow;
  timeDelay += timeElapsed;

  // estompement progressif du frame précédent
  noStroke();
  fade(92);

  // dessiner un polygone dont chaque sommet est à un des points d'ancrage
  stroke(32);
  fill(192,32);
  beginShape();
  for (index = 0; index < count; ++index)
    vertex(anchors[index][0], anchors[index][1]);
  endShape(CLOSE);

  // dessiner une ellipse grisée à chaque point d'ancrage
  for (index = 0; index < count; ++index)
  {
    fill(127, 127, 127);
    stroke(31);
    strokeWeight(5);
    ellipse(anchors[index][0], anchors[index][1], 32, 32);
  }

  // mise à jour et rendu de chaque balle
  for (index = 0; index < list.size(); ++index)
  {
    ball = list.get(index);
    ball.update();
    ball.render();
  }

  // déclencher périodiquement une itération de l'algorithme de tri
  if (timeDelay > threshold)
  {
    bubbleSort();

    timeDelay -= threshold;
  }
}

// fonction qui permet de mélanger les balles de la liste
void randomize()
{
  // invoquer la fonction utilitaire qui permet de mélanger une collection
  Collections.shuffle(list);

  // faire correspondre les points d'ancrage aux nouvelles positions dans la liste
  for (index = 0; index < count; ++index)
  {
    list.get(index).targetX = anchors[index][0];
    list.get(index).targetY = anchors[index][1];
  }
}

// fonction qui implémente l'algorithme de tri à bulles
void bubbleSort()
{
  Ball temp;

  for (index=0;  index < list.size() - 1;  ++index)
  {
    if (list.get(index).value > list.get(index + 1).value)
    {
      // interchanger les deux balles (swap)
      temp = list.get(index);

      list.set(index, list.get(index + 1));
      list.get(index).targetX = anchors[index][0];
      list.get(index).targetY = anchors[index][1];

      list.set(index + 1, temp);
      list.get(index + 1).targetX = anchors[index + 1][0];
      list.get(index + 1).targetY = anchors[index + 1][1];

      println("swap ball " + index +" and " + (index + 1));

      return; // <- afin de faire qu'une seule étape de tri par appel de fonction, pour permettre de voir l'animation de l'algorithme
    }
  }

  // si ce code est exécuté, c'est que la liste est maintenant triée.
  println("array is now sorted");

  // mélanger les balles à nouveau et recommencer l'animation
  randomize();
}

void fade(float decay)
{
  fill(127, decay);
  rect(0, 0, width, height);
}

void keyReleased()
{
  if (key == ' ')
    randomize();
  if (key == 'b')
    bubbleSort();
}
