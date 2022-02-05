// ANI2012H22_Video3_Capture2.pde
// Exemple de capture vidéo avec une caméra et teinte.
// Dépendance : Video 2.0 | GStreamer-based video library for Processing.

import processing.video.*;

// paramètres
int cameraFPS = 30;

int tintRed   = 255;
int tintGreen = 224;
int tintBlue  = 92;
int tintAlpha = 255;

float frequency = 5000.0f;

float shift = frequency / 3.0f;

// variables
String[] cameraList;

Capture camera;

void setup()
{
  size(800, 600);
  frameRate(cameraFPS);

  // obtenir la liste des modes supportés par la caméra
  cameraList = Capture.list();

  // valider s'il y a au moins un mode supporté par la caméra
  if (cameraList.length != 0)
  {
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
  // oscillation de la teinte
  tintRed   = 128 + int(oscillate(millis() - shift * 0.0f, 128.0f, frequency));
  tintGreen = 128 + int(oscillate(millis() - shift * 1.0f, 128.0f, frequency));
  tintBlue  = 128 + int(oscillate(millis() - shift * 2.0f, 128.0f, frequency));

  // appliquer la teinte
  tint(tintRed, tintGreen, tintBlue, tintAlpha);

  // valider si la caméra fonctionne bien
  if (camera.available() == true)
  {
    // lire le frame courant du flux vidéo
    camera.read();

    // dessiner le frame courant dans la fenêtre d'affichage
    image(camera, 0, 0, width, height);
  }
}

// fonction d'oscillation
float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
