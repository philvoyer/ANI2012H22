// ANI2012H22_ImageExport.pde
// Exportation du contenu de la fenêtre d'affichage dans différents types de format de fichier image (.tiff, .jpg, .png)
// et exportation de plusieurs frames consécutifs dans une séquence de fichiers numérotés.
// Les images sont exportées dans le répertoire du script principal du programme.

void setup()
{
  size(512, 512);

  // une mise à jour par seconde
  frameRate(1);

  // configurer l'alignement du texte
  textAlign(CENTER, CENTER);

  // configurer la taille du texte
  textSize(128);
}

void draw()
{
  // couleur d'arrière-plan
  background(64);

  // affichage minimaliste (numéro du frame courant au centre de la fenêtre d'affichage)
  text(frameCount, width / 2.0f, height / 2.0f);

  if (frameCount == 1)
  {
    // exporter un fichier image dans le format par défaut (.tif, car aucune extension est spécifiée)
    save("render_frame_0" + frameCount);
  }

  if (frameCount == 2)
  {
    // exporter un fichier image dans le format .jpg
    save("render_frame_0" + frameCount + ".jpg");
  }

  if (frameCount == 3)
  {
    // exporter un fichier image dans le format .png (format recommandé pour la plupart des besoins)
    save("render_frame_0" + frameCount + ".png");
  }

  if (frameCount == 4)
  {
    // exporter un fichier image avec le caractère # dans le nom
    saveFrame("render_frame_0" + frameCount + "#.png");
  }

  if (frameCount >= 5)
  {
    // exporter un fichier image avec un numéro séquentiel (fonctionne avec ##, ### ou ####)
    saveFrame("render_frame_##.png");
  }

  // afficher le numéro du frame courant dans la console
  println("frame " + frameCount);

  // arrêter les mises à jour après un certain nombre de frames
  if (frameCount >= 10)
    noLoop();
}
