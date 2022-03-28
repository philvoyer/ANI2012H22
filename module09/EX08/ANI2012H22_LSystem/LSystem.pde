// ANI2012H22_LSystem/LSystem.pde
// Classe de type LSystem.

class LSystem
{
  int generation;

  int indexSequence;
  int indexRule;

  float size;

  float angle;
  float ratio;

  float segment;

  char symbol;

  String axiom;
  String sequence;

  StringBuffer generationCurrent;
  StringBuffer generationNext;

  LSystemRule rule;

  ArrayList<LSystemRule> listRules;

  LSystem()
  {
    generationCurrent = new StringBuffer();
    generationNext = new StringBuffer();
  }

  // fonction qui réinitialise le système
  void reset()
  {
    generation = 1;
    segment = size;

    generationCurrent.delete(0, generationCurrent.length());
    generationNext.delete(0, generationNext.length());

    generationCurrent.append(axiom);

    println("generation " + generation + " : " + generationCurrent.toString());
  }

  // fonction qui calcule la prochaine génération du système
  void compute()
  {
    if (generationNext.length() > 0)
      generationNext.delete(0, generationNext.length());

    for (indexSequence = 0; indexSequence < generationCurrent.length(); ++indexSequence)
    {
      symbol = generationCurrent.charAt(indexSequence);

      String replace = "" + symbol;

      for (indexRule = 0; indexRule < listRules.size(); ++indexRule)
      {
        rule = listRules.get(indexRule);

        if (rule.input == symbol)
        {
          replace = rule.output;
          break;
        }
      }
      generationNext.append(replace);
    }

    if (generationCurrent.length() > 0)
      generationCurrent.delete(0, generationCurrent.length());

    generationCurrent.append(generationNext);
    ++generation;

    println("generation " + generation + " : " + generationCurrent.toString());
  }

  // fonction qui dessine la génération courante du système
  void render()
  {
    for (indexSequence = 0; indexSequence < generationCurrent.length(); ++indexSequence)
    {
      symbol = generationCurrent.charAt(indexSequence);

      switch (symbol)
      {
        case '|':
          strokeWeight(2);
          line(0, 0, segment, 0);
          translate(segment, 0);
          strokeWeight(3);
          point(0, 0);
          break;

        case 'X':
          // do nothing
          break;

        case 'Y':
          // do nothing
          break;

        case '+':
          rotate(angle);
          break;

        case '-':
          rotate(-angle);
          break;

        case '[':
          pushMatrix();
          break;

        case ']':
          popMatrix();
          break;

        default:
          println("unknow symbol: " + symbol);
      }
    }
  }

  // fonction qui réduit la proportion des éléments dessinés par le système
  void scaleDown()
  {
    segment *= ratio;
  }
}
