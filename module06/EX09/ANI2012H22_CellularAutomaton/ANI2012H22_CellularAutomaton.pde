// ANI2012H22_CellularAutomaton.pde
// Animation d'un système dynamique basé sur le principe des automates cellulaires.

// paramètres
int defaultType = Automaton.TYPE_CELL_NONE;

float resolution = 5;

float frequency = 0.15f;

int alpha = 31;

boolean isRecording = false;

// variable
Automaton ca;

void setup()
{
  size(960, 540);
  frameRate(60);
  strokeWeight(1);
  blendMode(BLEND);
  rectMode(CORNER);

  if (defaultType == Automaton.TYPE_CELL_NONE)
  {
    switch (randomCellType())
    {
      case 1:
        defaultType = Automaton.TYPE_CELL_GAMEOFLIFE;
        break;
      case 2:
        defaultType = Automaton.TYPE_CELL_VICHNIAC;
        break;
      case 3:
        defaultType = Automaton.TYPE_CELL_NEURON;
        break;
      case 4:
        defaultType = Automaton.TYPE_CELL_NOISE;
        break;
    }
  }

  // instanciation de l'automate cellulaire
  ca = new Automaton(defaultType, ceil(width / resolution), ceil(height / resolution), resolution, frequency, alpha);
}

void draw()
{
  ca.update();

  if (isRecording == true)
    saveFrame("render####.png");
}

void changeSystem(int id)
{
  switch (id)
  {
    case 1:
      defaultType = Automaton.TYPE_CELL_GAMEOFLIFE;
      break;
    case 2:
      defaultType = Automaton.TYPE_CELL_VICHNIAC;
      break;
    case 3:
      defaultType = Automaton.TYPE_CELL_NEURON;
      break;
    case 4:
      defaultType = Automaton.TYPE_CELL_NOISE;
      break;
  }

  ca.type = defaultType;
  ca.init();
  ca.restart();
}

int randomCellType()
{
  return int(random(1.0f, 5.0f));
}

void keyReleased()
{
  if (key == '1')
    changeSystem(1);
  else if (key == '2')
    changeSystem(2);
  else if (key == '3')
    changeSystem(3);
  else if (key == '4')
    changeSystem(4);
  else if (key == ' ')
    ca.restart();
  else if (key == 'r')
    isRecording = false;
  else
    changeSystem(randomCellType());

  println("released " + frameCount);
}

void keyPressed()
{
  if (key == 'r')
    isRecording = true;
}

void mouseReleased()
{
  changeSystem(randomCellType());
}
