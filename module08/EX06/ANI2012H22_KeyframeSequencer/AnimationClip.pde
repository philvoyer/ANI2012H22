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

  // fonction pour étendre les limites du clip d'animation
  void updateExtents(float timestamp)
  {
    if (timestamp <= start)
      start = timestamp;
    if (timestamp >= end)
      end = timestamp;

    println("update clip extents to start: " + start + " end: " + end);
  }

  // fonction pour afficher l'état courant du clip d'animation dans la console
  void print()
  {
    int curveIndex = 0;
    AnimationCurve animationCurve;
    println("animation clip with extents from start: " + start + " to end: " + end + " and animation curve count: " + curveCollection.size());
    for (String key : curveCollection.keySet()) {
      animationCurve = curveCollection.get(key);
      println("animation curve " + ++curveIndex + " for attribute: '" + key + "' keyframe count: " + animationCurve.keyframeCollection.size());
      animationCurve.print();
    }
  }
}
