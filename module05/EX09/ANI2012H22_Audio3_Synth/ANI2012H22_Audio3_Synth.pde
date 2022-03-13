// ANI2012H22_Audio3_Synth.pde
// Exemple d'un programme qui simule un synthétiseur qui peut de générer des notes de musiques.
// Le synthétiseur peut jouer les notes d'une gamme en DO majeur avec les touches de 1 à 8 du clavier.
// Le volume et la position panoramique des notes jouées par le synthétiseur peuvent être ajustés avec les flèches du clavier.
// Dépendance: Sound 2.3.1 | Provides a simple way to work with audio.

import processing.sound.*;

// paramètres

float offsetAmplitude = 0.1f;
float offsetPanning = 0.2f;

// variables

SinOsc oscillator;

float amplitude;
float frequency;
float panning;

color backgroundColor;

void setup()
{
  size(640, 360);
  frameRate(10);

  // création d'un oscillateur basé sur un sinus
  oscillator = new SinOsc(this);

  // volume de la note (intervalle normalisé entre [0, 1])
  amplitude = 0.618f;

  // fréquence de la note (ex. 440 Hertz = le 'LA' du 4e octave)
  frequency = 440.0f;

  // position panoramique de gauche à droite dans l'intervalle [-1, 1]
  panning = 0;

  colorMode(HSB, 100, 100, 100);
  backgroundColor = color (10, 10, 10);
}

void draw()
{
  background(backgroundColor);

  textSize(24);
  textAlign(CENTER, CENTER);

  text("Presser une touche de 1 à 8 pour jouer une note.", width / 2.0f, height / 2.0f);
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

// fonction qui permet monter le volume
void volumeUp()
{
  amplitude += offsetAmplitude;

  if (amplitude > 1.0f)
    amplitude = 1.0f;

  oscillator.amp(amplitude);
}

// fonction qui permet baisser le volume
void volumeDown()
{
  amplitude -= offsetAmplitude;

  if (amplitude < 0.001f)
    amplitude = 0.001f;

  oscillator.amp(amplitude);
}

// fonction qui permet de changer la position panoramique vers la gauche
void panLeft()
{
  panning -= offsetPanning;

  if (panning < -1.0f)
    panning = -1.0f;

  oscillator.pan(panning);
}

// fonction qui permet de changer la position panoramique vers la droite
void panRight()
{
  panning += offsetPanning;

  if (panning > 1.0f)
    panning = 1.0f;

  oscillator.pan(panning);
}

// fonction qui permet de choisir une fréquence aléatoire
void randomFrequency()
{
  frequency = random(100.0f, 1000.0f);
  oscillator.freq(frequency);
}

void keyPressed()
{
  if (key == '1') // DO (4e octave)
  {
    playNote(261.63f);
    backgroundColor = color(10, 100, 100);
  }
  if (key == '2') // RE
  {
    playNote(293.66f);
    backgroundColor = color(20, 100, 100);
  }
  if (key == '3') // MI
  {
    playNote(329.63f);
    backgroundColor = color(30, 100, 100);
  }
  if (key == '4') // FA
  {
    playNote(349.23f);
    backgroundColor = color(40, 100, 100);
  }
  if (key == '5') // SOL
  {
    playNote(392.00f);
    backgroundColor = color(50, 100, 100);
  }
  if (key == '6') // LA
  {
    playNote(440.00f);
    backgroundColor = color(60, 100, 100);
  }
  if (key == '7') // SI
  {
    playNote(493.88f);
    backgroundColor = color(70, 100, 100);
  }
  if (key == '8') // DO (5e octave)
  {
    playNote(523.25f);
    backgroundColor = color(80, 100, 100);
  }

  if (keyCode == UP)
    volumeUp();
  if (keyCode == DOWN)
    volumeDown();

  if (keyCode == LEFT)
    panLeft();
  if (keyCode == RIGHT)
    panRight();

  if (keyCode == ' ')
  {
    randomFrequency();
    playNote(frequency);
    backgroundColor = color(random(100), random(100), random(100));
  }
}
