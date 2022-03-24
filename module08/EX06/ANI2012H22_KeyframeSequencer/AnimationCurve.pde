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

  // fonction pour ajouter une pose clé dans la courbe d'animation
  void addKeyframe(float keyframeTimestamp, float keyframeValue)
  {
    if (isActive)
    {
      keyframeCollection.put(keyframeTimestamp, new Keyframe(keyframeTimestamp, keyframeValue));
      println("add keyframe to animation curve '" + name + "' at timestamp: " + keyframeTimestamp + " with value: " + keyframeValue + " keyframe count: " + keyframeCollection.size());
    }
  }

  // fonction pour afficher les poses clés de la courbe d'animation dans la console
  void print()
  {
    int keyframeIndex = 0;
    Keyframe keyframe;
    for (float key : keyframeCollection.keySet()) {
      keyframe = keyframeCollection.get(key);
      println("keyframe " + ++keyframeIndex + " timestamp: " + keyframe.timestamp + " value: " + keyframe.value);
    }
  }
}
