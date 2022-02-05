// ANI2012H22_Audio1_File.pde
// Exemple où un son est chargé en mémoire à partir d'un fichier externe (.mp3).
// Le son peut ensuite être joué à partir d'une touche du clavier.
// Le fichier à importer doit se trouver dans le répertoire /data qui accompagne le script principal.
// Dépendance: Sound 2.3.1 | Provides a simple way to work with audio.

// importer la librairie audio de Processing
import processing.sound.*;

// instance de la classe qui permet de charger en mémoire et de jouer le fichier audio
SoundFile pianoChord;

void setup()
{
  size(640, 360);
  noLoop();

  // charger le fichier audio en mémoire
  pianoChord = new SoundFile(this, "chord.mp3");
}

void draw()
{
  textSize(24);
  textAlign(CENTER, CENTER);

  text("Presser une touche ou faire un clic pour jouer le son.", width / 2.0f, height / 2.0f);
}

void keyReleased()
{
  // jouer le son
  pianoChord.play();
}

void mouseReleased()
{
  // jouer le son
  pianoChord.play();
}
