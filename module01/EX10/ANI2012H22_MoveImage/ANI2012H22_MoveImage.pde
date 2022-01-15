// ANI2012H22_MoveImage.pde
// Animation de la position d'une image en fonction des touches du clavier ou d'un clic de souris

// paramètre
float speed = 3.0f;

// variables
float positionX;
float positionY;

boolean isKeyPressedUp = false;
boolean isKeyPressedDown = false;
boolean isKeyPressedLeft = false;
boolean isKeyPressedRight = false;

boolean isMouseButtonPressed = false;

PImage img;

// fonction d'initialisation
void setup()
{
  size(512, 512);
  frameRate(60);

  positionX = width / 2.0f;
  positionY = height / 2.0f;

  // charger une image (à partir du répertoire /data)
  img = loadImage("gertie.jpg");

  // pour que la coordonnée (0, 0) soit au centre de l'image
  imageMode(CENTER);
}

// fonction de mise à jour de l'affichage
void draw()
{
  background(63);

  // dans les instructions qui suivent, portez votre attention sur les opérateurs '+=' et '-='
  // '+=' est un opérateur d'addition sous forme compacte,      'a += b' est l'équivalent de 'a = a + b'
  // '-=' est un opérateur de soustraction sous forme compacte, 'a -= b' est l'équivalent de 'a = a - b'

  if (isKeyPressedUp)
    positionY -= speed;
  if (isKeyPressedDown)
    positionY += speed;
  if (isKeyPressedLeft)
    positionX -= speed;
  if (isKeyPressedRight)
    positionX += speed;

  if (isMouseButtonPressed)
  {
    positionX = mouseX;
    positionY = mouseY;
  }

  // dessiner l'image à la position courante, au tiers de sa résolution d'origine
  image(img, positionX, positionY, img.width / 3.0f, img.height / 3.0f);
}

// fonction appelée lorsqu'un bouton du clavier est enfoncé
void keyPressed()
{
  updateKeyboard(true);
}

// fonction appelée lorsqu'un bouton du clavier est relâché
void keyReleased()
{
  updateKeyboard(false);
}

// fonction appelée lorsqu'un bouton de la souris est enfoncé
void mousePressed()
{
  updateMouse(true);
}

// fonction appelée lorsqu'un bouton de la souris est relâché
void mouseReleased()
{
  updateMouse(false);
}

// fonction de mise à jour de l'état des boutons de la souris
void updateMouse(boolean state)
{
  isMouseButtonPressed = state;
}

// fonction de mise à jour de l'état des touches du clavier
void updateKeyboard(boolean state)
{
  if (keyCode == UP)
    isKeyPressedUp = state;
  if (keyCode == DOWN)
    isKeyPressedDown = state;
  if (keyCode == LEFT)
    isKeyPressedLeft = state;
  if (keyCode == RIGHT)
    isKeyPressedRight = state;
}
