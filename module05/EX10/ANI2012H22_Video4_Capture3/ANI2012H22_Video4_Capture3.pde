// ANI2012H22_Video4_Capture3.pde
// Exemple de capture vidéo avec une caméra et filtrage (touches 1-6).
// Dépendance : Video 2.0 | GStreamer-based video library for Processing.

import processing.video.*;

// paramètres
int cameraFPS = 30;

float frequency = 3000.0f;

boolean isAnimated = false;

// variables
String[] cameraList;

Capture camera;

int activeFilterMode;

float filterLevel;

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

  setFilterMode(int(random(1.0f, 7.0f)));
}

void draw()
{
  // valider si la caméra fonctionne bien
  if (camera.available() == true)
  {
    // lire le frame courant du flux vidéo
    camera.read();

    // dessiner le frame courant dans la fenêtre d'affichage
    image(camera, 0, 0, width, height);

    switch (activeFilterMode)
    {
      case 1:
        filter(INVERT);
        break;
      case 2:
        filter(GRAY);
        break;
      case 3:
        filter(ERODE);
        break;
      case 4:
        filter(DILATE);
        break;
      case 5:
        if (isAnimated)
          filterLevel = max(2.0f, 16.0f + int(oscillate(millis(), 16.0f, frequency * 4.0f)));
        else
          filterLevel = 4.0f;
        filter(POSTERIZE, filterLevel);
        break;
      case 6:
        if (isAnimated)
          filterLevel = 4.0f + int(oscillate(millis(), 4.0f, frequency));
        else
          filterLevel = 2.0f;
        filter(BLUR, filterLevel);
        break;
    }
  }

  if (isAnimated)
    println("<filter level: " + filterLevel + ">");
}

void setFilterMode(int filterMode)
{
  activeFilterMode = filterMode < 0 ? 0 : filterMode > 6 ? 6: filterMode;

  switch (activeFilterMode)
  {
    case 1:
      println("blend mode: INVERT");
      break;
    case 2:
      println("blend mode: GRAY");
      break;
    case 3:
      println("blend mode: ERODE");
      break;
    case 4:
      println("blend mode: DILATE");
      break;
    case 5:
      println("blend mode: POSTERIZE");
      break;
    case 6:
      println("blend mode: BLUR");
      break;
  }
}

// fonction d'interactivité au clavier
void keyReleased()
{
  if (key == '1')
    setFilterMode(1);
  if (key == '2')
    setFilterMode(2);
  if (key == '3')
    setFilterMode(3);
  if (key == '4')
    setFilterMode(4);
  if (key == '5')
    setFilterMode(5);
  if (key == '6')
    setFilterMode(6);
  if (key == ' ')
    isAnimated = !isAnimated;
}

// fonction d'oscillation
float oscillate(float time, float amplitude, float period)
{
  return amplitude * sin(time * 2 * PI / period);
}
