// ANI2012H22_BlendImage.pde
// Animation de la composition entre deux images selon différents modes.
// Touches du clavier de 1 à 0 pour changer de mode.

// paramètres
int activeBlendMode = 3;
int speed = 3;

String fileSource = "imgSource.png";
String fileBlend = "imgBlend.png";

// variables
PImage imgSource;
PImage imgBlend;

int dividingLine;

void setup()
{
  size(512, 512);
  frameRate(60);

  stroke(255, 255, 0);
  strokeWeight(8);

  imgSource = loadImage(fileSource);
  imgBlend = loadImage(fileBlend);

  dividingLine = 0;
}

void draw()
{
  // afficher l'image source en arrière-plan
  background(imgSource);

  // composition entre les deux images
  switch (activeBlendMode)
  {
    case 1:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, BLEND);
      break;
    case 2:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, ADD);
      break;
    case 3:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, SUBTRACT);
      break;
    case 4:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, DARKEST);
      break;
    case 5:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, LIGHTEST);
      break;
    case 6:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, DIFFERENCE);
      break;
    case 7:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, EXCLUSION);
      break;
    case 8:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, MULTIPLY);
      break;
    case 9:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, SCREEN);
      break;
    case 0:
      blend(imgBlend, 0, 0, dividingLine, width, 0, 0, dividingLine, width, REPLACE);
      break;
  }

  // faire boucler la ligne de transition
  if ((dividingLine += speed) > width)
  {
    dividingLine = 0;

    setBlendMode(int(random(10.0f)));
  }

  // afficher la ligne de transition
  line(dividingLine, 0, dividingLine, height);
}

// fonction pour configurer le mode de composition
void setBlendMode(int blendMode)
{
  activeBlendMode = blendMode < 0 ? 0 : blendMode > 9 ? 9: blendMode;

  switch (activeBlendMode)
  {
    case 1:
      println("blend mode: BLEND");
      break;
    case 2:
      println("blend mode: ADD");
      break;
    case 3:
      println("blend mode: SUBTRACT");
      break;
    case 4:
      println("blend mode: DARKEST");
      break;
    case 5:
      println("blend mode: LIGHTEST");
      break;
    case 6:
      println("blend mode: DIFFERENCE");
      break;
    case 7:
      println("blend mode: EXCLUSION");
      break;
    case 8:
      println("blend mode: MULTIPLY");
      break;
    case 9:
      println("blend mode: SCREEN");
      break;
    case 0:
      println("blend mode: REPLACE");
      break;
  }
}

// fonction d'interactivité au clavier
void keyReleased()
{
  if (key == '1')
    setBlendMode(1);
  if (key == '2')
    setBlendMode(2);
  if (key == '3')
    setBlendMode(3);
  if (key == '4')
    setBlendMode(4);
  if (key == '5')
    setBlendMode(5);
  if (key == '6')
    setBlendMode(6);
  if (key == '7')
    setBlendMode(7);
  if (key == '8')
    setBlendMode(8);
  if (key == '9')
    setBlendMode(9);
  if (key == '0')
    setBlendMode(0);
}
