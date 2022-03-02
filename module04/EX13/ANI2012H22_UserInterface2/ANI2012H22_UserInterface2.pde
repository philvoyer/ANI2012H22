// ANI2012H22_UserInterface2.pde
// Exemple d'une interface utilisateur avec 3 sections.
// Chaque section à sa propre fonction d'affichage.

// paramètre
int sectionActiveAtStartup = 1;

// variables
int sectionActive = sectionActiveAtStartup;

void setup()
{
  size(512, 512);
  textSize(64);
  textAlign(CENTER, CENTER);
}

void draw()
{
  switch (sectionActive)
  {
    case 1:
      drawSection1();
      break;
    case 2:
      drawSection2();
      break;
    case 3:
      drawSection3();
      break;
  }
}

void drawSection1()
{
  background(0);

  fill(255);
  text("Section 1", width/2, height/2);

  // ...
}


void drawSection2()
{
  background(127);

  fill(0);
  text("Section 2", width/2, height/2);

  // ...
}


void drawSection3()
{
  background(255);

  fill(0);
  text("Section 3", width/2, height/2);

  // ...
}

void keyReleased()
{
  if (key == '1')
    sectionActive = 1;

  if (key == '2')
    sectionActive = 2;

  if (key == '3')
    sectionActive = 3;
}
