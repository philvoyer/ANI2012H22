// ANI2012H22_LSystem.pde
// Génération de 3 types de structures récursives différentes à partir d'un système de Lindenmayer.

// paramètres
int pattern = 2;
int depthCurrent = 0;
int depthMax = 20;

float theta = radians(1.0f);

// pattern 1 : Algae
String pattern1Axiom = "|X";
float  pattern1Size  = 128.0f;
float  pattern1Ratio = 0.85f;
float  pattern1Angle = radians(25.0f);
int    pattern1Color = color(0, 223, 0);

// pattern 2 : Tree
String pattern2Axiom = "|";
float  pattern2Size  = 128.0f;
float  pattern2Ratio = 0.5f;
float  pattern2Angle = radians(30.0f);
int    pattern2Color = color(223, 223, 0);

// pattern 3 : Dragon
String pattern3Axiom = "|X";
float  pattern3Size  = 4.0f;
float  pattern3Ratio = 1.0f;
float  pattern3Angle = radians(90.0f);
int    pattern3Color = color(223, 0, 223);

// variables
String sequence;

float positionStartX;
float positionStartY;

boolean isKeyPressedLeft;
boolean isKeyPressedRight;

LSystem lsystem;

void setup()
{
  size(512, 512);
  noFill();

  lsystem = new LSystem();

  configuration();
}

void draw()
{
  background(0);

  translate(positionStartX, positionStartY);
  rotate(-PI / 2.0f);

  lsystem.render();

  if (isKeyPressedLeft)
    lsystem.angle -= theta;
  if (isKeyPressedRight)
    lsystem.angle += theta;
}

void configuration()
{
  depthCurrent = 1;

  lsystem.listRules = new ArrayList<LSystemRule>();

  switch (pattern)
  {
    case 1:
      positionStartX = width / 2.0f;
      positionStartY = height - height / 4.0f;
      lsystem.axiom = pattern1Axiom;
      lsystem.size  = pattern1Size;
      lsystem.ratio = pattern1Ratio;
      lsystem.angle = pattern1Angle;
      lsystem.listRules.add(new LSystemRule('X', "[+|X][-|Y]"));
      lsystem.listRules.add(new LSystemRule('Y', "-|X"));
      stroke(pattern1Color);
      println("pattern 1");
      break;

    case 2:
      positionStartX = width / 2.0f;
      positionStartY = height - height / 8.0f;
      lsystem.axiom = pattern2Axiom;
      lsystem.size  = pattern2Size;
      lsystem.ratio = pattern2Ratio;
      lsystem.angle = pattern2Angle;
      lsystem.listRules.add(new LSystemRule('|', "||+[+|-|-|]-[-|+|+|]"));
      stroke(pattern2Color);
      println("pattern 2");
      break;

    case 3:
      positionStartX = width / 2.0f;
      positionStartY = height / 2.0f;
      lsystem.axiom = pattern3Axiom;
      lsystem.size  = pattern3Size;
      lsystem.ratio = pattern3Ratio;
      lsystem.angle = pattern3Angle;
      lsystem.listRules.add(new LSystemRule('X', "X+Y|+"));
      lsystem.listRules.add(new LSystemRule('Y', "-|X-Y"));
      stroke(pattern3Color);
      println("pattern 3");
      break;

    default:
      println("unknow pattern");
  }

  lsystem.reset();
}

void generate()
{
  lsystem.reset();

  for (int i = 0; i < depthCurrent; ++i)
  {
    lsystem.scaleDown();
    lsystem.compute();
  }
}

void keyPressed()
{
  if (keyCode == LEFT)
    isKeyPressedLeft = true;
  if (keyCode == RIGHT)
    isKeyPressedRight = true;
}

void keyReleased()
{
  if (key == '1')
  {
    pattern = 1;
    configuration();
  }
  if (key == '2')
  {
    pattern = 2;
    configuration();
  }
  if (key == '3')
  {
    pattern = 3;
    configuration();
  }
  if (keyCode == UP)
  {
    depthCurrent = ++depthCurrent < depthMax ? depthCurrent : depthMax;
    println("current depth : " + depthCurrent);
    generate();
  }
  if (keyCode == DOWN)
  {
    depthCurrent = --depthCurrent > 0 ? depthCurrent : 0;
    println("current depth : " + depthCurrent);
    generate();
  }
  if (keyCode == LEFT)
    isKeyPressedLeft = false;
  if (keyCode == RIGHT)
    isKeyPressedRight = false;
}
