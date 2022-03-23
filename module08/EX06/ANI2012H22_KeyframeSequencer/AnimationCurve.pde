// ANI2012H22_KeyframeSequencer/AnimationCurve.pde
// Classe de type AnimationCurve

class AnimationCurve
{
  TreeMap<Float, Keyframe> keyframeCollection;

  AnimationCurve()
  {
    keyframeCollection = new TreeMap<Float, Keyframe>();
  }

  void print()
  {
    println(" keyframe count: " + keyframeCollection.size());
    for (float key : keyframeCollection.keySet()) {
      System.out.println(key + " ,ID = "+ keyframeCollection.get(key) );
    }
  }
}
