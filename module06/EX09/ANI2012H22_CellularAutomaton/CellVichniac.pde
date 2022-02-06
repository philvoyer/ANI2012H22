// ANI2012H22_CellularAutomaton/Vichniac
// Cellule d'un automate cellulaire dont le comportement est inspiré par le "Vichniac Vote".

class CellVichniac extends Cell
{
  final static int CELL_STATE_GREEN = 1;
  final static int CELL_STATE_BLUE = 2;

  color colorFillRed;
  color colorFillBlue;

  CellVichniac()
  {
    super();
    init();
  }

  void init()
  {
    colorFillRed  = #00CC00;
    colorFillBlue = #0000CC;

    probability = random(0.0f, 1.0f);
    state = probability < 0.7f ? CELL_STATE_GREEN : CELL_STATE_BLUE;
  }

  void update()
  {
    super.update();

    if (state == CELL_STATE_GREEN)
      count = 1;
    else
      count = 0;

    for (index = 0; index < 8; ++index)
    {
      if (neighbors[index].state == CELL_STATE_GREEN)
        count++;
    }

    if (count <= 4)
      stateNext = CELL_STATE_BLUE;
    else if (count > 4)
      stateNext = CELL_STATE_GREEN;

    if (count == 4 || count == 5)
    {
      if (stateNext == CELL_STATE_GREEN)
        stateNext = CELL_STATE_BLUE;
      else
        count = CELL_STATE_GREEN;
    }
  }

  void render()
  {
    switch (state)
    {
      case CELL_STATE_BLUE:
        fill(colorFillBlue, system.alpha);
        break;
      case CELL_STATE_GREEN:
        fill(colorFillRed, system.alpha);
        break;
    }

    rect(
      positionX,
      positionY,
      system.size,
      system.size);
  }
}
