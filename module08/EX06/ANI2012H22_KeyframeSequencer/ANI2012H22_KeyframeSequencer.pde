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

float defaultAttributePositionX;
float defaultAttributePositionY;
float defaultAttributeRotation;
float defaultAttributeScale = 64.0f;

float interactiveAttributeScaleMin = 0.25f;
float interactiveAttributeScaleMax = 100.0f;
float interactiveAttributeScaleDelta = 0.25f;

float interactiveAttributeRotationMin = 0.25f;
float interactiveAttributeRotationMax = 100.0f;
float interactiveAttributeRotationDelta = 0.25f;

float offsetHorizontal = 64.0f;

boolean isTimelineActive = true;

int defaultInterpolationMode = 1;

int defaultSelectedAttribute = 1;

// variables

Sequencer sequencer;
AnimationClip animationClip;

float keyframeTimestamp;
float keyframeValue;

float attributePositionX;
float attributePositionY;
float attributeRotation;
float attributeScale;

float interactiveAttributePositionX;
float interactiveAttributePositionY;
float interactiveAttributeRotation;
float interactiveAttributeScale;

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

int selectedAttribute = defaultSelectedAttribute;
int interpolationMode = defaultInterpolationMode;

void setup()
{
  size(1024, 512);

  textSize(32);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  // initialiser les variables temporeles
  timeNow = timeLast = timeElapsed = 0.0f;

  // valuer initiale de la ligne du temps
  timelinePlayhead = 0.0f;
  timelinePositionStartX = offsetHorizontal;
  timelinePositionStartY = height - height / 8;
  timelinePositionEndX = width - offsetHorizontal;
  timelinePositionEndY = timelinePositionStartY;
  timelinePositionDelta = timelinePositionEndX - timelinePositionStartX;
  timelineMarkerHalfSize = 32.0f;

  // valeur par défaut des attributs
  defaultAttributePositionX = width/2;
  defaultAttributePositionY = height/2;

  // valeur courante de l'outil d'animation
  interactiveAttributeRotation = defaultAttributeRotation;
  interactiveAttributeScale = defaultAttributeScale;

  // instancier un clip d'animation
  animationClip = new AnimationClip();

  // instancier un séquencer
  sequencer = new Sequencer();

  // faire le lien entre le séquenceur et le clip d'animation
  sequencer.clip = animationClip;
}

void draw()
{
  background(63);

  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f * timeScale;
  timeLast = timeNow;

  // mise à jour de la ligne du temps
  updateTimeline();

  // mise à jour du pointeur
  updatePointer();

  // mise à jour de l'animation
  updateAnimation();
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

void updatePointer()
{
  // garder une copie de la position courante du curseur
  interactiveAttributePositionX = mouseX;
  interactiveAttributePositionY = mouseY;

  // dessiner un aperçu de l'élément visuel avec la valeur courante des attributs d'animation
  stroke(0, 127);
  strokeWeight(4);
  fill(191, 64);
  rect(interactiveAttributePositionX, interactiveAttributePositionY, interactiveAttributeScale, interactiveAttributeScale);
}

void updateAnimation()
{
  // mise à jour du séquenceur
  sequencer.update(timelinePlayhead);

  // valeur courante des attributs d'animation
  attributePositionX = sequencer.attributeCurrentValuePositionX;
  attributePositionY = sequencer.attributeCurrentValuePositionY;
  attributeRotation = sequencer.attributeCurrentValueRotation;
  attributeScale = sequencer.attributeCurrentValueScale;

  // dessiner l'élément visuel avec la valeur courante de l'animation
  stroke(0);
  strokeWeight(4);
  fill(255);
  rect(attributePositionX, attributePositionY, attributeScale, attributeScale);
}

void selectAttribute(int idAttribute)
{
  selectedAttribute = idAttribute;
  
  switch (selectedAttribute)
  {
  case 1:
    break;
  case 2:
    break;
  case 3:
    break;

  default:
    break;
  }
  
  println("change selected attribute to: " + selectedAttribute);
}

void keyPressed()
{
  // modifier la vitesse du temps
  if (keyCode == UP)
  {
    //
    switch (selectedAttribute)
    {
    case 1:
      timeScale = constrain(timeScale + timeScaleDelta, timeScaleMin, timeScaleMax);
      break;
    case 2:
      interactiveAttributeScale = constrain(interactiveAttributeScale + interactiveAttributeScaleDelta, interactiveAttributeScaleMin, interactiveAttributeScaleMax);
      break;
    case 3:
      attributeRotation += 1.0f;
      break;

    default:
      break;
    }
  }
  if (keyCode == DOWN)
  {
    switch (selectedAttribute)
    {
    case 1:
      timeScale = constrain(timeScale - timeScaleDelta, timeScaleMin, timeScaleMax);
      break;
    case 2:
      break;
    default:
      break;
    }
  }

  // état actif ou inactif de la ligne du temps
  if (key == ' ')
    isTimelineActive = !isTimelineActive;
}

void keyReleased()
{
  if (key == '1')
    selectAttribute(1);
  if (key == '2')
    selectAttribute(2);
  if (key == '3')
    selectAttribute(3);
  if (key == '4')
    selectAttribute(4);
  if (key == ' ')
    saveFrame("render####.png");
}

void mousePressed()
{
  // TODO no alpha
  
}

void mouseReleased()
{
  // valeur courante des attributs d'animation
  attributePositionX = interactiveAttributePositionX;
  attributePositionY = interactiveAttributePositionY;
  attributeRotation = interactiveAttributeRotation;
  attributeScale = interactiveAttributeScale;

  // enregistrer une pose clé sur chacune des courbes d'animation actives
  sequencer.record(timelinePlayhead, attributePositionX, attributePositionY, attributeRotation, attributeScale);
}
