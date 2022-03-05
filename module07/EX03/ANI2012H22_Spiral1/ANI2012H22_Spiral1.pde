// ANI2012H22_Spiral1.pde
// Dessine une spirale du centre vers l'extérieur à partir d'une ellipse répétée à chaque itération d'une boucle avec une position déterminée par un angle et une amplitude qui s'incrémentent à chaque fois que le code est exécuté.

size(512, 512);
noLoop();
noStroke();
fill(0);
ellipseMode(CENTER);

// paramètre
float radius = 16;

// variables
float angle = 0;
float amplitude = 0;

float positionX = 0;
float positionY = 0;

float centerX = width / 2.0f;
float centerY = height / 2.0f;

int loop = 0;

while (loop < 10000)
{
  positionX = centerX + cos(angle) * amplitude;
  positionY = centerY + sin(angle) * amplitude;

  ellipse(positionX, positionY, radius, radius);

  angle += radians(1.0f);
  amplitude += 0.1f;

  ++loop;
}
