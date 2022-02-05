// ANI2012H22_Video2_Capture1.pde
// Exemple de capture vidéo avec une caméra.
// Dépendance: Video 2.0 | GStreamer-based video library for Processing.

import processing.video.*;

// variables
String[] cameraList;

Capture camera;

void setup()
{
  size(800, 600);
  frameRate(30);

  // obtenir la liste des modes supportés par la caméra
  cameraList = Capture.list();

  // valider s'il y a au moins un mode supporté par la caméra
  if (cameraList.length != 0)
  {
    println("modes de caméra: " + cameraList.length);

    // énumération des modes supportés par la caméra
    for (int index = 0; index < cameraList.length; ++index)
      println(cameraList[index]);

    // sélectionner la première caméra
    camera = new Capture(this, cameraList[0]);

    // lancer la capture vidéo
    camera.start();
  }
  else
  {
    println("no camera available for capture");
  }
}

void draw()
{
  // valider si la caméra fonctionne bien
  if (camera.available() == true)
  {
    // lire le frame courant du flux vidéo
    camera.read();

    // dessiner le frame courant dans la fenêtre d'affichage
    //set(0, 0, camera);
    image(camera, 0, 0, width, height);
  }
}
