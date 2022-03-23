// ANI2012H22_KeyframeSequencer/Sequencer.pde
// Classe de type

class Sequencer
{
  AnimationClip clip;

  float timeCurrent;

  Sequencer()
  {
  }

  void update(float timelinePlayhead)
  {
    timeCurrent = timelinePlayhead;
  }

  void record(float attributePositionX, float attributePositionY, float attributeRotation, float attributeScale)
  {
    
  }

  void print()
  {
    // println(tag + " = (" + x + " " + y + " " + z +")");
  }
}
