// ANI2012H22_Color7_Rainbow.pde
// Programme qui permet de dessiner un arc-en-ciel.
// L'arc-en-ciel est généré dans une image en mémoire pendant l'initialisation du programme.
// Cette technique permet d'optimiser les performances en évitant de recalculer la valeur de chaque pixel à tous les frames.

// paramètres du programme
int resolutionX = 512;                 // largeur de la fenêtre d'affichage en pixels
int resolutionY = 512;                 // hauteur de la fenêtre d'affichage en pixels
int imageScale = 1;                    // proportion de l'image par rapport à la fenêtre d'affichage (permet d'exporter une image plus grande)
float rainbowOriginRatioX = 1.0f / 2.0f; // ratio de positionnement de l'arc-en-ciel sur l'axe horizontal
float rainbowOriginRatioY = 1.0f / 3.0f; // ratio de positionnement de l'arc-en-ciel sur l'axe vertical
float borderOffsetWidth = 1.0f / 16.0f;  // distance entre les bordures horizontales de l'image et le début de l'arc-en-ciel

// variable globale du programme
PGraphics renderbuffer;                // image en mémoire dans laquelle l'arc-en-ciel sera dessiné

// fonction pour configurer la résolution de la fenêtre d'affichage à partir des paramètres
void settings()
{
  size(resolutionX, resolutionY);
}

// fonction d'initialisation du programme
void setup()
{
  // fréquence de mise à jour (nombre d'images par secondes)
  frameRate(60);

  // génération d'un nouvel arc-en-ciel
  generateRainbow();
}

// fonction de mise à jour du programme
void draw()
{
  // espace de couleur RGB (red/rouge, green/vert, blue/bleu)
  colorMode(RGB);

  // couleur de l'arrière-plan
  background(255, 255, 255); // couleur blanche

  // dessiner l'image dans la fenêtre d'affichage du programme
  image(renderbuffer, 0, 0, resolutionX, resolutionY);
}

// fonction qui dessine un arc-en-ciel dan une image en mémoire
void generateRainbow()
{
  // variables locales
  int renderbufferResolutionX = resolutionX * imageScale;
  int renderbufferResolutionY = resolutionY * imageScale;
  float originX = renderbufferResolutionX * rainbowOriginRatioX;
  float originY = renderbufferResolutionY - renderbufferResolutionY * rainbowOriginRatioY;
  float distanceMin = renderbufferResolutionY / 6.0;
  float distanceMax = renderbufferResolutionY / 2.0 - renderbufferResolutionY * borderOffsetWidth;

  // création d'une image en mémoire
  renderbuffer = createGraphics(renderbufferResolutionX, renderbufferResolutionY);

  // commencer l'algorithme de dessin
  renderbuffer.beginDraw();

  // espace de couleur HSB (hue/teinte, saturation/saturation, brightness/luminosité)
  renderbuffer.colorMode(HSB, 100);

  // itération sur les rangées de pixels de l'image
  for (int indexY = 0; indexY < renderbufferResolutionY; ++indexY)
  {
    // itération sur les colonnes de pixels de l'image
    for (int indexX = 0; indexX < renderbufferResolutionX; ++indexX)
    {
      // calculer la distance entre le pixel et l'origine de l'arc-en-ciel
      float distance = distanceFromRainbowOrigin(indexX, indexY, originX, originY);

      // évaluation des conditions pour déterminer si le pixel fait partie de l'arc-en-ciel
      if (distance >= distanceMin && distance <= distanceMax && indexY <= originY)
      {
        // choisir une teinte de couleur en fonction de la distance par rapport à l'origine de l'arc-en-ciel
        renderbuffer.stroke(map(distance, distanceMin, distanceMax, 0, 100), 100, 100);

        // dessiner un pixel avec cette teinte de couleur
        renderbuffer.point(indexX, indexY);
      }
    }
  }
  // terminer l'algorithme de dessin
  renderbuffer.endDraw();
}

// fonction qui calcule la distance entre la position d'un pixel et l'origine de l'arc-en-ciel
float distanceFromRainbowOrigin(float positionX, float positionY, float originX, float originY)
{
  float deltaX = positionX - originX; // différence entre position du pixel et origine de l'arc-en-ciel sur l'axe horizontal
  float deltaY = positionY - originY; // différence entre position du pixel et origine de l'arc-en-ciel sur l'axe vertical

  // calcul de la distance (racine carrée de la somme des différences à la puissance 2)
  return sqrt(deltaX * deltaX + deltaY * deltaY);
}

void keyReleased()
{
  renderbuffer.save("rainbow.png"); // sauvegarde de l'image en mémoire vers un fichier image
}
