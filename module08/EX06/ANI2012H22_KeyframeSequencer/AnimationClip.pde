// ANI2012H22_KeyframeSequencer/AnimationClip.pde
// Classe de type AnimationClip

class AnimationClip
{
  TreeMap<String, AnimationCurve> curveCollection;

  float start = Float.POSITIVE_INFINITY;
  float end = Float.NEGATIVE_INFINITY;
  
  AnimationClip()
  {
    curveCollection = new TreeMap<String, AnimationCurve>();

    // ajouter des courbes d'animation dans la collection
    curveCollection.put("positionX", new AnimationCurve("positionX"));
    curveCollection.put("positionY", new AnimationCurve("positionY"));
    curveCollection.put("rotation", new AnimationCurve("rotation"));
    curveCollection.put("scale", new AnimationCurve("scale"));

    print();
  }
  
  void updateExtents(float timestamp)
  {
    if (timestamp <= start)
      start = timestamp;
    if (timestamp >= end)
      end = timestamp;  
      
    println("update clip extents start: " + start + " end: " + end);
  }

  void print()
  {
    AnimationCurve animationCurve;
    for (String key : curveCollection.keySet()) {
      animationCurve = curveCollection.get(key);
      //animationCurve.print();
      println("animation curve for attribute: " + key + " value: " + curveCollection.get(key));
    }
  }
}
