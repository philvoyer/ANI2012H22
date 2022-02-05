// ANI2012H22_Audio2_Input.pde
// Exemple d'un programme qui analyse le signal audio capté à partir du microphone l'ordinateur
// à partir de l'algorithme de transformation de Fourier (Fast Fourrier Transform) et
// de dessiner une représentation visuelle de l'intensité de chacune des bandes de fréquences.
// Dépendance: Sound 2.3.1 | Provides a simple way to work with audio.

// importer la librairie audio de Processing
import processing.sound.*;

// paramètres
int numberOfAudioBand = 512; // doit être une puissance de 2 (ex. 512, 256, 128, 64, 32, 16 bandes)

float amplification = 50.0f; // facteur d'amplification du signal

color colorBack = color(0, 0, 0);

// tableau des couleurs de chaque bande audio
color[] colorBand = new color[512];

// instance de la classe qui permet d'accéder à l'entrée audio de l'ordinateur (microphone)
AudioIn in;

// instance de la classe qui permet d'analyser le spectre audio
FFT fft;

// spectre audio du signal audio en entrée (un tableau avec une valeur numérique par bande)
float[] audioSpectrum = new float[512];

// variable pour la largeur et la hauteur des bandes
float bandWidth;
float bandHeight;

void setup()
{
  size(512, 360);

  rectMode(CORNER);

  // instanciation de la classe qui permet d'accéder à l'entrée audio de l'ordinateur
  in = new AudioIn(this, 0);

  // instanciation de la classe qui permet d'analyser le spectre audio
  fft = new FFT(this, numberOfAudioBand);

  // activer l'entrée audio
  in.start();

  // connecter l'entrée audio avec l'analyseur de spectre audio
  fft.input(in);

  reset();
}

void draw()
{
  fade(32);

  // analyser le spectre audio pour déterminer l'amplitude de chaque bande
  fft.analyze(audioSpectrum);

  // une itération pour chacune des bandes
  for(int index = 0; index < numberOfAudioBand; ++index)
  {
    // calculer la hauteur de la bande en fonction de l'analyse du spectre audio
    bandHeight = height - audioSpectrum[index] * height * amplification;

    // dessiner un rectangle selon la valeur courante de la bande
    if(numberOfAudioBand == 512)
    {
      stroke(colorBand[index]);
      line(index, height, index, bandHeight);
    }
    else
    {
      noStroke();
      fill(colorBand[index]);
      rect(index * bandWidth, bandHeight, index * bandWidth + bandWidth, height);
    }
  }
}

void reset()
{
  // initialiser la largeur des bandes
  bandWidth = width / (float) numberOfAudioBand;

  for(int index = 0; index < numberOfAudioBand; ++index)
  {
    colorBand[index] = color(
      map(index, 0, numberOfAudioBand, 255, 0),
      map(index, 0, numberOfAudioBand, 0, 255), 0);
  }

  println("setup audio spectrum for : " + numberOfAudioBand + " bands");
}

void keyReleased()
{
  if (key == '1')
    numberOfAudioBand = 512;
  if (key == '2')
    numberOfAudioBand = 256;
  if (key == '3')
    numberOfAudioBand = 128;
  if (key == '4')
    numberOfAudioBand = 64;
  if (key == '5')
    numberOfAudioBand = 32;
  if (key == '6')
    numberOfAudioBand = 16;
  if (key == '7')
    numberOfAudioBand = 8;
  if (key == '8')
    numberOfAudioBand = 4;
  if (key == '9')
    numberOfAudioBand = 2;
  if (key == '0')
    numberOfAudioBand = 1;

  reset();
}

void fade(float decay)
{
  rectMode(CORNER);
  noStroke();
  fill(colorBack, decay);
  rect(0, 0, width, height);
}
