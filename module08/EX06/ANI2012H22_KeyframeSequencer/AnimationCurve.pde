// ANI2012H22_KeyframeSequencer/AnimationCurve.pde
// Classe de type AnimationCurve

class AnimationCurve
{
  TreeMap<Float, Keyframe> keyframeCollection;

  boolean isActive;
  
  String name;
  
  Keyframe currentKeyframe;
  
  AnimationCurve(String attributeName)
  {
    keyframeCollection = new TreeMap<Float, Keyframe>();
    isActive = true;
    name = attributeName;
  }

  void addKeyframe(float keyframeTimestamp, float keyframeValue)
  {
    if (isActive)
    {
      keyframeCollection.put(keyframeTimestamp, new Keyframe(keyframeTimestamp, keyframeValue));
      println("add keyframe to animation curve '" + name + "' at timestamp: " + keyframeTimestamp + " with value: " + keyframeValue + " keyframe count: " + keyframeCollection.size());
    }
  }

  void print()
  {
    println("keyframe count: " + keyframeCollection.size());
    for (float key : keyframeCollection.keySet()) {
      System.out.println(key + " ,ID = "+ keyframeCollection.get(key) );
    }
  }
}
