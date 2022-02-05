// ANI2012H22_Color5_HSB2.pde
// Programme qui génère une image HSB avec trois variations de dégradé (touches 1, 2, 3).

// paramètres
int resolution = 512;

int maxValueHue = 360;
int maxValueSaturation = 100;
int maxValueBrightness = 100;

// variables
boolean regenerate;

int indexX;
int indexY;
int indexB;

int mode;

void setup()
{
  size(512, 512);

  regenerate = true;

  mode = int(random(1.0f, 4.0f));

  colorMode(HSB, maxValueHue, maxValueSaturation, maxValueBrightness);
}

void draw()
{
  if (regenerate)
  {
    generateGradient();
    regenerate = false;
  }
}

void generateGradient()
{
  for (indexX = 0; indexX < resolution; ++indexX)
  {
    for (indexY = 0; indexY < resolution; ++indexY)
    {
      // sélectionner la couleur selon les indices des boucles et le mode
      switch (mode)
      {
        case 1: // génération d'un arc-en-ciel en mode de couleur HSB avec dégradé de la teinte (hue)
          stroke(
            map(indexX, 0, resolution, 0, maxValueHue), // Hue (teinte)
            maxValueSaturation,                         // Saturation
            maxValueBrightness);                        // Brightness (luminosité)

          break;

        case 2: // génération d'un arc-en-ciel en mode de couleur HSB avec dégradé de la teinte (hue) et de la saturation
          stroke(
            map(indexX, 0, resolution, 0, maxValueHue),         // Hue (teinte)
            map(indexY, 0, resolution, 0, maxValueSaturation),  // Saturation
            maxValueBrightness);                                // Brightness (luminosité)

          break;

        case 3: // génération d'un arc-en-ciel en mode de couleur HSB avec dégradé de la teinte (hue) et de la saturation et deux variations de luminosité (brightness)
          if (indexX < resolution / 2)
            indexB = resolution;
          else
            indexB = resolution / 2;

          stroke(
            map(indexX, 0, resolution, 0, maxValueHue),         // Hue (teinte)
            map(indexY, 0, resolution, 0, maxValueSaturation),  // Saturation
            map(indexB, 0, resolution, 0, maxValueBrightness)); // Brightness (luminosité)

          break;
      }

      // afficher un point avec cette couleur
      point(indexX, indexY);
    }
  }
}

void keyReleased()
{
  if (key == '1')
  {
    mode = 1;
    regenerate = true;
    println("ex1: dégradé de la teinte (hue)");
  }

  if (key == '2')
  {
    mode = 2;
    regenerate = true;
    println("ex2: dégradé de la teinte (hue) et de la saturation");
  }

  if (key == '3')
  {
    mode = 3;
    regenerate = true;
    println("ex3: dégradé de la teinte (hue), de la saturation et de 2 niveau de luminosité (brightness)");
  }
}
