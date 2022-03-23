// ANI2012H22_KeyframeSequencer/Keyframe.pde
// Classe de type Keyframe

class Keyframe
{
  float timestamp;
  float value;

  Keyframe(float keyframeTimestamp, float keyframeValue)
  {
    timestamp = keyframeTimestamp;
    value = keyframeValue;
  }

  void print()
  {
    println("keyframe timestamp: " + timestamp + " value: " + value);
  }
}
