// ANI2012H22_StepSequencer.pde
// Exemple d'un programme qui simule un 'step sequencer',
// qui permet de jouer un son à chaque étape si le bouton est activé.
// Dépendance: Sound 2.3.1 | Provides a simple way to work with audio.

import processing.sound.*;

// paramètres
int stepCount = 8;

boolean[] buttonStateActive = {true, false, true, false, true, false, true, true};
boolean[] buttonStatePlayed = {false, false, false, false, false, false, false, false};

boolean useSoundSampleOrSynthesizer = true;

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
SoundFile beat;
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

  // charger l'échantillon audio en mémoire
  beat = new SoundFile(this, "beat.mp3");
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

      // réinitialiser les boutons
      for (int index = 0; index < stepCount; ++index)
        buttonStatePlayed[index] = false;
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

  // itération sur chacun des boutons
  for (int index = 0; index < stepCount; ++index)
  {
    // calculer la position du début du bouton
    buttonPositionX = timelinePositionStartX + buttonSize * index;

    // valider si le bouton à cet index est actif
    if (buttonStateActive[index])
    {
      // valider si la tête de lecture de la ligne du temps est dans le bouton courant
      if (timelinePlayheadPosition >= buttonPositionX && timelinePlayheadPosition < buttonPositionX + buttonSize)
      {
        // jouer un son car le bouton où se trouve la tête de lecture de la ligne du temps est actif
        if (useSoundSampleOrSynthesizer)
        {
          if (!buttonStatePlayed[index])
          {
            // jouer un échantillon audio à partir d'un fichier externe
            beat.play();
            buttonStatePlayed[index] = true;
          }
        }
        else
        {
          if (!buttonStatePlayed[index])
          {
            // jouer une fréquence avec le synthétiseur
            playNote(440.0f);
            buttonStatePlayed[index] = true;
          }
          else
          {
            // arrêter le synthétiseur un peu avant la fin du bouton
            if (timelinePlayheadPosition >= buttonPositionX + buttonSize - buttonSize/8)
              oscillator.stop();
          }
        }

        fill(buttonColorPlay);
      }
      else
        fill(buttonColorOn);
    }
    else
      fill(buttonColorOff);

    rect(buttonPositionX, buttonPositionY, buttonSize, buttonSize);
  }

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

// fonction pour changer l'état d'un bouton
void toggleButtonState(int buttonIndex)
{
  if (buttonIndex < 0 || buttonIndex >= stepCount)
    return;

  println("toggle button " + (buttonIndex + 1) + " state from: " + buttonStateActive[buttonIndex] + " to: " + !buttonStateActive[buttonIndex]);

  buttonStateActive[buttonIndex] = !buttonStateActive[buttonIndex];
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

void keyReleased()
{
  if (key == '1')
    toggleButtonState(0);
  if (key == '2')
    toggleButtonState(1);
  if (key == '3')
    toggleButtonState(2);
  if (key == '4')
    toggleButtonState(3);
  if (key == '5')
    toggleButtonState(4);
  if (key == '6')
    toggleButtonState(5);
  if (key == '7')
    toggleButtonState(6);
  if (key == '8')
    toggleButtonState(7);
  if (key == '9')
  {
    useSoundSampleOrSynthesizer = true;
    oscillator.stop();
    println("utiliser l'échantillon audio");
  }
  if (key == '0')
  {
    useSoundSampleOrSynthesizer = false;
    oscillator.stop();
    println("utiliser le synthétiseur");
  }
}
