// ANI2012H22_KeyframeSequencer/Sequencer.pde
// Classe de type

class Sequencer
{
  float timeCurrent;
  
  Sequencer()
  {
  }

  void update(float timelinePlayhead)
  {
    timeCurrent = timelinePlayhead;
  }
  
  void print(String tag)
  {
    // println(tag + " = (" + x + " " + y + " " + z +")");
  }
}
