// ANI2012H22_KeyframeSequencer.pde
// Exemple d'un programme qui simule une animation faite avec des courbes d'animation et des poses clés.

// importer la librairie Java pour les collections de type dictionnaire ordonnée.
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

float interactiveAttributeScaleMin = 1.00f;
float interactiveAttributeScaleMax = 1000.0f;
float interactiveAttributeScaleDelta = 1.00f;

float interactiveAttributeRotationMin = -PI * 8.0f;
float interactiveAttributeRotationMax = PI * 8.0f;
float interactiveAttributeRotationDelta = PI / 32.0f;

float offsetHorizontal = 64.0f;

boolean isTimelineActive = true;

int defaultInterpolationMode = 1;

int defaultSelectedAttribute = 1;

color colorPreviewStroke = color(0, 127);
color colorPreviewFill = color(191, 164);

color colorNormalStroke = color(0);
color colorNormalFill = color(255);

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

boolean isMouseButtonPressed;

boolean isKeyPressedArrowUp;
boolean isKeyPressedArrowDown;

void setup()
{
  size(1024, 512);

  textSize(32);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  // valeurs initiales de certaines variables
  isMouseButtonPressed = false;
  isKeyPressedArrowUp = false;
  isKeyPressedArrowDown = false;

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

  // mise à jour des attributs interactifs
  updateAttribute();

  // mise à jour de l'animation
  updateAnimation();
}

// fonction pour mettre à jour la ligne du temps
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

// fonction pour mettre à jour l'aperçu de l'élément avec les attributs courants
void updatePointer()
{
  // garder une copie de la position courante du curseur
  interactiveAttributePositionX = mouseX;
  interactiveAttributePositionY = mouseY;

  if (!isMouseButtonPressed)
  {
    strokeWeight(4);
    stroke(colorPreviewStroke);
    fill(colorPreviewFill);
  }
  else
  {
    strokeWeight(4);
    stroke(colorNormalStroke);
    fill(colorNormalFill);
  }

  pushMatrix();

  // appliquer la valeur courante de l'attribut de rotation
  translate(interactiveAttributePositionX, interactiveAttributePositionY);
  rotate(interactiveAttributeRotation);

  // dessiner un aperçu de l'élément visuel avec la valeur courante des attributs d'animation
  rect(0, 0, interactiveAttributeScale, interactiveAttributeScale);

  popMatrix();
}

// fonction qui fait la mise à jour de l'animation
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
  strokeWeight(4);
  stroke(colorNormalStroke);
  fill(colorNormalFill);
  pushMatrix();
  translate(attributePositionX, attributePositionY);
  rotate(attributeRotation);
  rect(0, 0, attributeScale, attributeScale);
  popMatrix();
}

// fonction pour sélectionner l'attribut itéractif
void selectAttribute(int idAttribute)
{
  // nouvel attribut interactif sélectionné.
  selectedAttribute = idAttribute;

  switch (selectedAttribute)
  {
  case 1:
    println("change selected attribute to: " + selectedAttribute + " (timeline speed)");
    break;
  case 2:
    println("change selected attribute to: " + selectedAttribute + " (scale)");
    break;
  case 3:
    println("change selected attribute to: " + selectedAttribute + " (rotation)");
    break;
  case 4:
    interpolationMode = 1;
    println("change interpolation mode to: 'lerp'");
    break;
  case 5:
    interpolationMode = 2;
    println("change interpolation mode to: 'smoothstep'");
    break;

  default:
    break;
  }
}

// fonction pour mettre à jour les attributs interactifs
void updateAttribute()
{
  if (isKeyPressedArrowUp)
  {
    switch (selectedAttribute)
    {
    case 1:
      timeScale = constrain(timeScale + timeScaleDelta, timeScaleMin, timeScaleMax);
      break;
    case 2:
      interactiveAttributeScale = constrain(interactiveAttributeScale + interactiveAttributeScaleDelta, interactiveAttributeScaleMin, interactiveAttributeScaleMax);
      break;
    case 3:
      interactiveAttributeRotation = constrain(interactiveAttributeRotation + interactiveAttributeRotationDelta, interactiveAttributeRotationMin, interactiveAttributeRotationMax);
      break;
   }
  }

  if (isKeyPressedArrowDown)
  {
    switch (selectedAttribute)
    {
    case 1:
      timeScale = constrain(timeScale - timeScaleDelta, timeScaleMin, timeScaleMax);
      break;
    case 2:
      interactiveAttributeScale = constrain(interactiveAttributeScale - interactiveAttributeScaleDelta, interactiveAttributeScaleMin, interactiveAttributeScaleMax);
      break;
    case 3:
      interactiveAttributeRotation = constrain(interactiveAttributeRotation - interactiveAttributeRotationDelta, interactiveAttributeRotationMin, interactiveAttributeRotationMax);
      break;
    }
  }
}

void keyPressed()
{
  if (keyCode == UP)
    isKeyPressedArrowUp = true;
  if (keyCode == DOWN)
    isKeyPressedArrowDown = true;
}

void keyReleased()
{
  if (keyCode == UP)
    isKeyPressedArrowUp = false;
  if (keyCode == DOWN)
    isKeyPressedArrowDown = false;
  if (key == '1')
    selectAttribute(1);
  if (key == '2')
    selectAttribute(2);
  if (key == '3')
    selectAttribute(3);
  if (key == '4')
    selectAttribute(4);
  if (key == '5')
    selectAttribute(4);
  if (key == 'i')
    sequencer.clip.print();
  if (key == ' ')
    isTimelineActive = !isTimelineActive;
}

void mousePressed()
{
  isMouseButtonPressed = true;
}

void mouseReleased()
{
  isMouseButtonPressed = false;

  // valeur courante des attributs d'animation
  attributePositionX = interactiveAttributePositionX;
  attributePositionY = interactiveAttributePositionY;
  attributeRotation = interactiveAttributeRotation;
  attributeScale = interactiveAttributeScale;

  // enregistrer une pose clé sur chacune des courbes d'animation actives
  sequencer.record(timelinePlayhead, attributePositionX, attributePositionY, attributeRotation, attributeScale);
}
