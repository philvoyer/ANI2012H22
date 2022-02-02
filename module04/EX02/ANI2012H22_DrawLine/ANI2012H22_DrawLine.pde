// ANI2012H22_DrawLine.pde
// Dessine une séquence de lignes de taille croissante.

size(1280, 128);

// taille initiale
float weight = 1.0f;

// distante entre les lignes
float offset = 15.0f;

// boucle pour dessiner 35 lignes de taille croissante
for (int index = 1; index <= 35; ++index)
{
  // taille de la ligne
  strokeWeight(weight);

  // dessiner une ligne en fonction de la position x et y de ses deux sommets
  line(
    index * (weight + offset),
    height / 4.0f,
    index * (weight + offset) + (offset * 7.0f),
    height / 4.0f * 3.0f);

  // incrémenter la taille pour la prochaine ligne
  weight += 0.5f;
}
