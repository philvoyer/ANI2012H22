// ANI2012H22_CellularAutomaton/CellGameOfLife
// Cellule d'un automate cellulaire dont le comportement est inspiré par le "Conway's Game of Life".

class CellGameOfLife extends Cell
{
  final static int CELL_STATE_DEAD = 1;
  final static int CELL_STATE_ALIVE = 2;

  color colorFillDead;
  color colorFillAlive;

  CellGameOfLife()
  {
    super();
    init();
  }

  void init()
  {
    colorFillDead = #111111;
    colorFillAlive = #FFFFFF;

    probability = random(0.0f, 1.0f);

    state = probability < 0.5f ? CELL_STATE_DEAD : CELL_STATE_ALIVE;
  }

  void update()
  {
    super.update();

    count = 0;

    for (index = 0; index < 8; ++index)
    {
      if (neighbors[index].state == CELL_STATE_ALIVE)
        ++count;
    }

    if (state == CELL_STATE_ALIVE)
    {
      if (count == 2)
        stateNext = CELL_STATE_ALIVE;
      else if (count == 3)
        stateNext = CELL_STATE_ALIVE;
      else
        stateNext = CELL_STATE_DEAD;
    }
    else
    {
      if (count == 3)
        stateNext = CELL_STATE_ALIVE;
      else
        stateNext = CELL_STATE_DEAD;
    }
  }

  void render()
  {
    switch (state)
    {
      case CELL_STATE_DEAD:
        fill(colorFillDead, system.alpha);
        break;
      case CELL_STATE_ALIVE:
        fill(colorFillAlive, system.alpha);
        break;
    }

    rect(
      positionX,
      positionY,
      system.size,
      system.size);
  }
}
