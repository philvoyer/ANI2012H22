// ANI2012H22_FrameCounter.pde
// Exemple minimaliste d'un programme avec une boucle de rendu.
// Une boucle de rendu a une fonction de mise à jour de l'affichage qui est exécutée périodiquement.
// Le programme incrémente une variable à chaque itération de cette fonction et affiche sa valeur au centre de la fenêtre d'affichage.
// Il est à noter que Processing offre déjà une variable globale appelée 'frameCount' qui contient la même valeur.

// déclaration d'une variable pour compter le nombre de frames depuis le lancement du programme
int frameCounter;

// fonction d'initialisation
// cette fonction est appelée automatiquement par Processing au lancement du programme
void setup()
{
  // résolution de la fenêtre d'affichage
  size(256, 256);

  // fréquence de mise à jour de l'affichage
  frameRate(60);

  // initialisation de nombre de frames
  frameCounter = 0;

  // taille du texte
  textSize(64);

  // alignement du texte (horizontal et vertical)
  textAlign(CENTER, CENTER);
}

// fonction de mise à jour de l'affichage
// cette fonction est appelée automatiquement par Processing à chaque mise à jour du programme (en fonction du 'frameRate')
void draw()
{
  // effacer le contenu de la fenêtre d'affichage
  background(frameCounter % 255);
  // le modulo (%) 255 permet d'utiliser le reste de la division par 255 pour obtenir une valeur numérique entre 0 et 255 pour chaque valeur de 'frameCounter'
  // au-delà de 255, le partie entière de la division est ignorée par l'opérateur de modulo et la partie restante recommence à 0
  // cette valeur est ensuite utilisée pour animer la couleur de l'arrière-plan avec un niveau de gris différent pour chaque frame

  // incrémenter le nombre de frames
  frameCounter = frameCounter + 1;

  // afficher le nombre de frames dans la console
  println("frame count: " + frameCounter);

  // afficher le nombre de frames au centre la fenêtre d'affichage
  text(frameCounter, width / 2.0f, height / 2.0f);
}
