// ANI2012H22_Diaporama.pde
// Animation de type diaporama où des images descendent perpétuellement de haut en bas avec une illusion de profondeur.

// paramètres
int count = 12;

float maxdepth = 100.0f;

float speedX = 0.0f;
float speedY = 0.05f;

String filePath = "wintersmall.jpg";

// variables
Slide[] list;

Slide slide;

Slide tmp;

int index;
int indexSwap;

float timeLast;
float timeElapsed;

boolean flag;

void setup()
{
  size(800, 600);
  frameRate(60);

  flag = true;

  timeElapsed = timeLast = 0;

  // instancier la liste d'images
  list = new Slide[count];

  // initialiser chacune des images
  for (index = 0; index < count; ++index)
  {
    slide = new Slide(filePath);

    slide.mode = CENTER;
    slide.positionX = random(0, width);
    slide.positionY = random(-(height + height / 4.0f), -height / 4.0f);
    slide.positionZ = random(0, maxdepth);

    slide.init();

    list[index] = slide;
  }

  // trier les images selon leur profondeur sur l'axe Z (bubble sort)
  while (flag)
  {
    flag = false;
    for (index=0;  index < count-1;  ++index)
    {
      if (list[index].positionZ > list[index+1].positionZ)
      {
        tmp = list[index];
        list[index] = list[index+1];
        list[index+1] = tmp;
        flag = true;
      }
    }
  }
}

void draw()
{
  background(0);

  // calculer le temps écoulé depuis le dernier frame en fraction de seconde
  timeElapsed = millis() - timeLast;
  timeLast = millis();

  // boucler sur la liste de slides
  for (index = 0; index < count; ++index)
  {
    slide = list[index];
    slide.update(timeElapsed);
    slide.render();

    // ramener les images en haut de la fenêtre d'affichage lorsqu'elles sortent par le bas
    if (slide.positionY > height + slide.resolutionY)
    {
      slide.positionX = random(0.0f, width);
      slide.positionY = random(-(height + height / 4.0f), -height / 4.0f);
    }
  }
}
