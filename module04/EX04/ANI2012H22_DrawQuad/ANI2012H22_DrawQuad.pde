// ANI2012H22_DrawQuad.pde
// Dessine une séquence de quadrilatères dont les quatre sommets ont des positions aléatoires.

size(512, 512);

// couleur d'arrière-plan (un ton de gris aléatoire)
background(int(random(0.0f, 1.0f) * 255.0f));

// valeur initiale du compteur avant la boucle while
int counter = 0;

// boucle pour dessiner 16 quadrilatères
while (counter <= 16)
{
  // épaisseur du trait
  strokeWeight(1.5f);

  // couleur du trait (un ton de gris aléatoire)
  stroke(int(random(0.0f, 1.0f) * 255.0f));

  // couleur de remplissage (un ton de gris aléatoire)
  fill(int(random(0.0f, 1.0f) * 255.0f));

  // dessiner un quadrilatère en fonction de la position x et y de ses quatre sommets
  quad(
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height,
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height,
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height,
    random(0.0f, 1.0f) * width,
    random(0.0f, 1.0f) * height);

  // incrémenter le compteur utilisé par la boucle while
  ++counter;
}
