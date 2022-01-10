// ANI2012H22_DrawText.pde
// Affiche le sigle du cours au centre de la fenêtre d'affichage.

// fonction qui configure la largeur et la hauteur de la fenêtre d'affichage
size(256, 256);

// fonction qui configure la couleur du texte
fill(255, 127, 63);

// fonction qui configure l'alignement du texte
textAlign(CENTER); // 'CENTER' est une variable constante définie par Processing, les constantes sont souvent en lettres majuscules

// fonction qui configure la taille du texte
textSize(32);

// fonction pour afficher du texte (premier paramètre) à une position X (second paramètre) et Y (troisième paramètre)
text("ANI-2012", width / 2, height / 2);

// le caractère '"' permet de délimiter une chaîne de caractère (du texte)
// le caractère '/' est l'opérateur de division, il permet de calculer la position centrale de la fenêtre d'affichage
// la largeur 'width' et la hauteur 'height' sont divisées par 2, puis le résultat des calculs est passé à la fonction sous forme de paramètres
