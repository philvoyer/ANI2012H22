// ANI2012H22_CellularAutomaton/Noise
// Cellule d'un automate cellulaire dont le comportement a été découvert un peu par accident.
// Pendant une séance de prototypage, ce résultat a été obtenu en jouant avec la moyenne des cellules voisines.
// Je trouvais l'animation intéressante, donc j'ai laissé le code au point où il était rendu.
// En programmation graphique, parfois les accidents donnent de jolies choses..

class CellNoise extends Cell
{
  color colorFill;

  color colorFillA;
  color colorFillB;

  float sum;

  int average;

  CellNoise()
  {
    super();
    init();
  }

  void init()
  {
    colorFill = #FFFFFF;

    state = int((positionX / width * 255 + positionY / height * 255) / 2);

    statePrevious = state;
  }

  void update()
  {
    super.update();

    sum = 0;

    for (index = 0; index < 8; ++index)
    {
      sum += neighbors[index].state;
    }

    average = int(sum / 8.0f);

    stateNext = int(state + average - statePrevious);

    if (stateNext > 255)
      stateNext -= 255;
    else if (stateNext < 0)
      stateNext += 255;
  }

  void render()
  {
    colorFill = stateNext;

    fill(colorFill, system.alpha);

    rect(
      positionX,
      positionY,
      system.size,
      system.size);
  }
}
