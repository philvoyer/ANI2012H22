// ANI2012H22_Video1_Playback.pde
// Exemple de l'importation et de la lecture d'un fichier vidéo.
// Dépendance: Video 2.0 | GStreamer-based video library for Processing.

import processing.video.*;

// paramètres
String file = "automaton.mp4";

boolean isPlaying = true;

// variable
Movie movie;

void setup()
{
  // résolution du vidéo
  size(960, 540);

  // chargement du fichier vidéo en mémoire
  movie = new Movie(this, file);

  // jouer le vidéo en boucle
  movie.loop();
}

void draw()
{
  // appliquer une teinte
  tint(0, 191, 0);

  // dessiner le frame courant du vidéo
  image(movie, 0, 0);
}

// fonction appelée quand un nouveau frame du vidéo est prêt à être lu
void movieEvent(Movie movie)
{
  movie.read();
}

// fonction d'interactivité au clavier
void keyReleased()
{
  if (isPlaying)
  {
    isPlaying = false;
    movie.pause();
  }
  else
  {
    isPlaying = true;
    movie.play();
  }
}
