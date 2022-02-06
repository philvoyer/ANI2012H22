// ANI2012H22_CellularAutomaton/Neuron
// Cellule d'un automate cellulaire dont le comportement est inspiré par le "Brian's Brain".

class CellNeuron extends Cell
{
  final static int CELL_STATE_TRIGGER = 1;
  final static int CELL_STATE_REST = 2;
  final static int CELL_STATE_IDLE = 3;

  color colorFillTrigger;
  color colorFillRest;
  color colorFillIdle;

  CellNeuron()
  {
    super();
    init();
  }

  void init()
  {
    colorFillTrigger = #F888FF;
    colorFillRest    = #FFFFFF;
    colorFillIdle    = #111111;

    probability = random(0.0f, 1.0f);

    if (probability < 0.333f)
      state = CELL_STATE_TRIGGER;
    else if (probability < 0.666f)
      state = CELL_STATE_REST;
    else
      state = CELL_STATE_IDLE;
  }

  void update()
  {
    super.update();

    count = 0;

    for (index = 0; index < 8; ++index)
    {
      if (neighbors[index].state == CELL_STATE_TRIGGER)
        count++;
    }

    switch (state)
    {
      case CELL_STATE_TRIGGER:
        stateNext = CELL_STATE_REST;
        break;
      case CELL_STATE_REST:
        stateNext = CELL_STATE_IDLE;
        break;
      case CELL_STATE_IDLE:
        if (count == 2)
          stateNext = CELL_STATE_TRIGGER;
        else
          stateNext = state;
        break;
    }
  }

  void render()
  {
    switch (state)
    {
      case CELL_STATE_TRIGGER:
        fill(colorFillTrigger, system.alpha);
        break;
      case CELL_STATE_REST:
        fill(colorFillRest, system.alpha);
        break;
      case CELL_STATE_IDLE:
        fill(colorFillIdle, system.alpha);
        break;
      default:
        println("error" + state);
        break;
    }

    rect(
      positionX,
      positionY,
      system.size,
      system.size);
  }
}
