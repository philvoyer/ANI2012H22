// ANI2012H22_CellularAutomaton/Cell.pde
// Classe qui symbolise une cellule d'un automate cellulaire.
// Les différents types de cellules qui définissent le comportement de l'automate cellulaire héritent de cette classe parent.

class Cell
{
  final static int CELL_STATE_NONE = 0;

  Cell[] neighbors;

  int count;

  int index;

  int indexX;
  int indexY;

  float positionX;
  float positionY;

  boolean isActive;

  int state;
  int statePrevious;
  int stateNext;

  float probability;

  float timeStart;
  float timeNow;
  float timeActive;

  Automaton system;

  Cell()
  {
    neighbors = new Cell[8];
    init();
  }

  void init()
  {
    state = statePrevious = stateNext = 0;
    timeStart = millis();
    isActive = true;
  }

  void update()
  {
    timeActive = timeNow - timeStart;
  }

  void evolve()
  {
    statePrevious = state;
    state = stateNext;
  }

  void render(){}

  void print(String tag)
  {
    println("cell " + tag + " (" + indexX + " " + indexY + " " + positionX + " " + positionY + " " + state + ")");
  }
}
