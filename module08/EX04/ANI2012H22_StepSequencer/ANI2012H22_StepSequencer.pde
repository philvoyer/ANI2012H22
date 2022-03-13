// ANI2012H22_StepSequencer.pde
// Exemple d'un programme qui simule un 'step sequencer',
// qui permet de jouer un échantillon à chaque étape si le bouton est activé.
// Dépendance: Sound 2.3.1 | Provides a simple way to work with audio.

import processing.sound.*;

// paramètres
int stepCount = 8;

boolean[] buttonStateActive = {true, false, true, false, true, false, true, true};

float timelineDuration = 8.0f;

float bpm = 120;

float timeScaleMin = 0.25f;
float timeScaleMax = 10.0f;
float timeScaleDelta = 0.25f;

float offsetHorizontal = 64.0f;

color buttonColorPlay = color(255, 255, 127);
color buttonColorOn = color(191, 191, 63);
color buttonColorOff = color(222, 222, 222);

boolean isTimelineActive = true;

// variables
SinOsc oscillator;

float amplitude;
float frequency;
float panning;

float buttonSize;
float buttonPositionX;
float buttonPositionY;

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
float timeScale;

boolean isPlayingSound;

void setup()
{
  size(1024, 512);

  textSize(32);
  textAlign(CENTER, CENTER);

  rectMode(CORNER);

  timeNow = timeLast = timeElapsed = 0.0f;

  timelinePlayhead = 0.0f;

  timelinePositionStartX = offsetHorizontal;
  timelinePositionStartY = height - height / 4;
  timelinePositionEndX = width - offsetHorizontal;
  timelinePositionEndY = timelinePositionStartY;
  timelinePositionDelta = timelinePositionEndX - timelinePositionStartX;
  timelineMarkerHalfSize = 32.0f;

  buttonSize = timelinePositionDelta / 8.0f;
  buttonPositionY = height/4;

  // calculer le 'timeScale' en fonction du BPM initial
  timeScale = bpm / 60.0f;

  // création d'un oscillateur basé sur un sinus
  oscillator = new SinOsc(this);

  // volume de la note (intervalle normalisé entre [0, 1])
  amplitude = 0.618f;

  // fréquence de la note (ex. 440 Hertz = le 'LA' du 4e octave)
  frequency = 440.0f;

  // position panoramique de gauche à droite dans l'intervalle [-1, 1]
  panning = 0;
}

void draw()
{
  background(63);

  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f * timeScale;
  timeLast = timeNow;

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

  // dessiner les boutons du séquenceur
  strokeWeight(4);

  isPlayingSound = false;

  for (int index = 0; index < stepCount; ++index)
  {
    buttonPositionX = timelinePositionStartX + buttonSize * index;

    if (buttonStateActive[index])
    {
      if (timelinePlayheadPosition >= buttonPositionX && timelinePlayheadPosition < buttonPositionX + buttonSize)
      {
        fill(buttonColorPlay);
        if (timelinePlayheadPosition < buttonPositionX + buttonSize - buttonSize/8)
        {
          isPlayingSound = true;
          playNote(440.0f);
        }
      }
      else
        fill(buttonColorOn);
    }
    else
      fill(buttonColorOff);

    rect(buttonPositionX, buttonPositionY, buttonSize, buttonSize);
  }

  if (!isPlayingSound)
    oscillator.stop();

  // afficher le BPM
  fill(255);
  text("BPM " + round(bpm), width/2, height - height/8);
}

// fonction qui permet de jouer une note en fonction d'une fréquence
void playNote(float f)
{
  frequency = f;

  oscillator.freq(frequency);
  oscillator.amp(amplitude);
  oscillator.pan(panning);

  oscillator.play();
}

void keyPressed()
{
  // modifier la vitesse du temps
  if (keyCode == UP)
    timeScale = constrain(timeScale + timeScaleDelta, timeScaleMin, timeScaleMax);
  if (keyCode == DOWN)
    timeScale = constrain(timeScale - timeScaleDelta, timeScaleMin, timeScaleMax);

  // calculer le BPM en fonction du nouveau 'timeScale'
  bpm = timeScale * 60.0f;

  // état actif ou inactif de la ligne du temps
  if (key == ' ')
    isTimelineActive = !isTimelineActive;
}

void mouseReleased()
{
  // valider si la position en Y du curseur n'est pas dans la rangée des boutons
  if (mouseY < buttonPositionY || mouseY > buttonPositionY + buttonSize)
    return;
  else
  {
    // valider si la position en X du curseur est sur un des boutons
    for (int index = 0; index < stepCount; ++index)
    {
      buttonPositionX = timelinePositionStartX + buttonSize * index;

      if (mouseX >= buttonPositionX && mouseX < buttonPositionX + buttonSize)
      {
        // changer l'état du bouton
        if (buttonStateActive[index])
          buttonStateActive[index] = false;
        else
          buttonStateActive[index] = true;

        return;
      }
    }
  }
}
