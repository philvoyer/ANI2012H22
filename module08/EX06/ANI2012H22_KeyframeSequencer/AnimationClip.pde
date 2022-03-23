// ANI2012H22_KeyframeSequencer/AnimationClip.pde
// Classe de type AnimationClip

class AnimationClip
{
  TreeMap<String, AnimationCurve> curveCollection;

  AnimationClip()
  {
    curveCollection = new TreeMap<String, AnimationCurve>();

    // ajouter des courbes d'animation dans la collection
    curveCollection.put("translateX", new AnimationCurve("translateX"));
    curveCollection.put("translateY", new AnimationCurve("translateY"));
    curveCollection.put("rotation", new AnimationCurve("rotation"));
    curveCollection.put("scale", new AnimationCurve("scale"));

    print();
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
