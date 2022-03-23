// ANI2012H22_KeyframeSequencer/Sequencer.pde
// Classe de type Sequencer

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

  void record(float timestamp, float attributePositionX, float attributePositionY, float attributeRotation, float attributeScale)
  {
    println("sequencer record new keyframes at: " + timestamp);
    clip.curveCollection.get("translateX").addKeyframe(timestamp, attributePositionX);
    clip.curveCollection.get("translateY").addKeyframe(timestamp, attributePositionY);
    clip.curveCollection.get("rotation").addKeyframe(timestamp, attributeRotation);
    clip.curveCollection.get("scale").addKeyframe(timestamp, attributeScale);
  }

  void print()
  {
    // println(tag + " = (" + x + " " + y + " " + z +")");
  }
}
