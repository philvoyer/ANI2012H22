// ANI2012H22_KeyframeSequencer.pde
// Exemple d'un programme qui simule une animation faite avec des courbes d'animation et des poses clés.
// ATTENTION : l'exemple est en cours de développement, il n'est pas terminé, mettez le à jour dans quelques heures.

// The TreeMap class sorts the map values in ascending order.
// It also implements the SortedMap interface internally, so a map instance is created using a new keyword.
//The interface has the methods:
//keySet() which returns a set of the keys in ascending order
//values() which returns a collection of all values in the ascending order of the corresponding keys
//import java.util.TreeMap;

import java.util.TreeMap;

// paramètres
float timelineDuration = 10.0f;

float timeScale = 1.0f;
float timeScaleMin = 0.25f;
float timeScaleMax = 100.0f;
float timeScaleDelta = 0.25f;

float offsetHorizontal = 64.0f;

boolean isTimelineActive = true;

// variables

Sequencer sequencer;
AnimationClip animationClip;

float keyframeTimestamp;
float keyframeValue;

float attributePositionX;
float attributePositionY;
float attributeRotation;
float attributeScale;

float timelinePlayhead;
float timelinePlayheadPosition;

float timelinePositionStartX;
float timelinePositionStartY;
float timelinePositionEndX;
float timelinePositionEndY;
float timelinePositionDelta;
float timelineMarkerHalfSize;

float timeNow;
float timeLast;
float timeElapsed;

void setup()
{
  size(1024, 512);

  textSize(32);
  textAlign(CENTER, CENTER);

  timeNow = timeLast = timeElapsed = 0.0f;

  timelinePlayhead = 0.0f;

  timelinePositionStartX = offsetHorizontal;
  timelinePositionStartY = height - height / 8;
  timelinePositionEndX = width - offsetHorizontal;
  timelinePositionEndY = timelinePositionStartY;
  timelinePositionDelta = timelinePositionEndX - timelinePositionStartX;
  timelineMarkerHalfSize = 32.0f;

  //
  animationClip = new AnimationClip(); //<>//

  //
  sequencer = new Sequencer();
  sequencer.clip = animationClip;
}

void draw()
{
  background(63);

  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f * timeScale;
  timeLast = timeNow;

  //
  updateTimeline();

  //
  sequencer.update(timelinePlayhead);
}

void updateTimeline()
{
// valider si la ligne du temps est active
  if (isTimelineActive)
  {
    // mettre à jour la position de la tête de lecture sur la ligne du temps
    timelinePlayhead += timeElapsed;

    // valider si la tête de lecture est à la fin de la ligne du temps
    if (timelinePlayhead >= timelineDuration)
    {
      // retrancher le temps écoulé
      timelinePlayhead -= timelineDuration;
    }
  }

  // calculer la position de la tête de lecture sur la ligne du temps
  timelinePlayheadPosition = timelinePlayhead / timelineDuration * timelinePositionDelta + timelinePositionStartX;

  // dessiner la ligne horizontale de la ligne du temps
  stroke(0);
  strokeWeight(8);
  line(timelinePositionStartX, timelinePositionStartY, timelinePositionEndX, timelinePositionEndY);

  // dessiner le marqueur du début de la ligne du temps
  stroke(127);
  strokeWeight(12);
  line(timelinePositionStartX, timelinePositionStartY - timelineMarkerHalfSize, timelinePositionStartX, timelinePositionStartY + timelineMarkerHalfSize);

  // dessiner le marqueur de fin de la ligne du temps
  stroke(127);
  strokeWeight(12);
  line(timelinePositionEndX, timelinePositionEndY - timelineMarkerHalfSize, timelinePositionEndX, timelinePositionEndY + timelineMarkerHalfSize);

  // dessiner la tête de lecture de la ligne du temps
  stroke(255, 0, 0);
  strokeWeight(12);
  line(timelinePlayheadPosition, timelinePositionStartY - timelineMarkerHalfSize, timelinePlayheadPosition, timelinePositionStartY + timelineMarkerHalfSize);
  stroke(0);
  strokeWeight(2);
  line(timelinePlayheadPosition, timelinePositionStartY - timelineMarkerHalfSize, timelinePlayheadPosition, timelinePositionStartY + timelineMarkerHalfSize);
}

void keyPressed()
{
  // modifier la vitesse du temps
  if (keyCode == UP)
    timeScale = constrain(timeScale + timeScaleDelta, timeScaleMin, timeScaleMax);
  if (keyCode == DOWN)
    timeScale = constrain(timeScale - timeScaleDelta, timeScaleMin, timeScaleMax);

  // état actif ou inactif de la ligne du temps
  if (key == ' ')
    isTimelineActive = !isTimelineActive;
}

void mousePressed()
{

}

void mouseReleased()
{
  attributePositionX = mouseX;
  attributePositionY = mouseY;
  attributeRotation = 0;
  attributeScale = 1;

  sequencer.record(attributePositionX, attributePositionY, attributeRotation, attributeScale);
}
