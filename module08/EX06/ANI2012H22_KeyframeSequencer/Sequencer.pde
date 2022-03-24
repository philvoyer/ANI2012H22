// ANI2012H22_KeyframeSequencer/Sequencer.pde
// Classe de type Sequencer

class Sequencer
{
  AnimationClip clip;

  float timeCurrent;

  float attributeCurrentValuePositionX;
  float attributeCurrentValuePositionY;
  float attributeCurrentValueRotation;
  float attributeCurrentValueScale;

  Sequencer() {
  }

  void update(float timelinePlayhead)
  {
    timeCurrent = timelinePlayhead;

    // évaluer la valeur courante des différents attributs d'animation
    attributeCurrentValuePositionX = evaluate("positionX", timelinePlayhead);
    attributeCurrentValuePositionY = evaluate("positionY", timelinePlayhead);
    attributeCurrentValueRotation = evaluate("rotation", timelinePlayhead);
    attributeCurrentValueScale = evaluate("scale", timelinePlayhead);
  }

  void record(float timestamp, float attributePositionX, float attributePositionY, float attributeRotation, float attributeScale)
  {
    println("sequencer record new keyframes at: " + timestamp);

    //
    clip.updateExtents(timestamp);

    //
    clip.curveCollection.get("positionX").addKeyframe(timestamp, attributePositionX);
    clip.curveCollection.get("positionY").addKeyframe(timestamp, attributePositionY);
    clip.curveCollection.get("rotation").addKeyframe(timestamp, attributeRotation);
    clip.curveCollection.get("scale").addKeyframe(timestamp, attributeScale);
  }

  // fonction qui permet d'évaluer la valeur courante d'un attribut d'animation
  // en fonction de la position de la tête de lecture de la ligne du temps
  float evaluate(String attributeName, float timestamp)
  {
    Keyframe keyframe1;
    Keyframe keyframe2;

    float keyframeValue1 = 0.0f;
    float keyframeValue2 = 0.0f;

    float keyframeTimestamp1 = 0.0f;
    float keyframeTimestamp2 = 0.0f;

    float valueInterpolated = 0.0f;

    float progression;

    AnimationCurve curve;

    // valider si la tête de lecture de la ligne du temps est à l'extérieur du clip d'animation
    if (timestamp < clip.start || timestamp > clip.end)
      return 0.0f;
    else // la tête de lecture de la ligne du temps est à l'intérieur du clip d'animation
    {
      // aller chercher une référence sur la courbe d'animation de l'attribut en cours d'évaluation
      curve = clip.curveCollection.get(attributeName);

      if (curve != null)
      {
        // boucler sur les poses clés de la courbe d'animation
        for (float keyframeTimestamp : curve.keyframeCollection.keySet())
        {
          // valider si la tête de lecture est avant la pose clé courante
          if (keyframeTimestamp <= timestamp)
          {
            // garder une copie des états de la pose première pose clé avant la tête de lecture
            keyframe1 = curve.keyframeCollection.get(keyframeTimestamp);
            keyframeTimestamp1 = keyframe1.timestamp;
            keyframeValue1 = keyframe1.value;
          }
          else // la tête de lecture est après la pose clé courante, la pose clé 1 est donc confirmé et la pose clé 2 est la suivante
          {
            // garder une copie des états de la première pose clé après la tête de lecture
            keyframe2 = curve.keyframeCollection.get(keyframeTimestamp);
            keyframeTimestamp2 = keyframe2.timestamp;
            keyframeValue2 = keyframe2.value;

            // calculer la progression entre les 2 poses clés
            progression = (timestamp - keyframeTimestamp1) / (keyframeTimestamp2 - keyframeTimestamp1);

            // interpolation linéaire entre la valeurs des 2 poses clés
            switch (interpolationMode)
            {
              case 1: // interpolation linaire
                valueInterpolated = interpolationLinear(keyframeValue1, keyframeValue2, progression);
                break;
              case 2: // interpolation avec accélération et décélération
                valueInterpolated = interpolationSmoothstep(keyframeValue1, keyframeValue2, progression);
                break;
            }

            // retourner la valeur courante de l'attribut d'animation
            return valueInterpolated;
          }
        }
        return 0.0f;
      }
      else
        return 0.0f;
    }
  }

  // fonction qui calcule une interpolation linéaire entre deux valeurs numériques
  float interpolationLinear(float value1, float value2, float t)
  {
    if (t < 0.0f)
      return value1;

    if (t > 1.0f)
      return value2;

    return (1.0f - t) * value1 + t * value2;
  }

  // fonction qui calcule une interpolation entre deux valeurs numériques avec la fonction 'smoothstep'
  float interpolationSmoothstep(float value1, float value2, float t)
  {
    if (t < 0.0f)
      return t = 0.0f;

    if (t > 1.0f)
      return t = 1.0f;

    t = t * t * (3.0f - 2.0f * t);

    return (1.0 - t) * value1 + t * value2;
  }
}
