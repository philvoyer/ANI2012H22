// ANI2012H22_Tempo.pde
// Exemple d'un programme qui simule un tempo en BPM (Beats Per Minutes).

// paramètres

float bpmDefault = 60;
float bpmDelta = 5.0f;
float bpmMin = 0.0f;
float bpmMax = 240.0f;

float fadeIntensity = 7.0f;

int colorBack = 15;

// variables
float bpm;

float timeNow;
float timeLast;
float timeElapsed;
float timeDelay;
float timeBetweenBeat;

int beatCount = 0;
int secondPerMinute = 60;

void setup()
{
  size(512, 512);

  timeNow = timeLast = timeElapsed = timeDelay = timeBetweenBeat = 0.0f;

  // BPM initial
  changeBPM(bpmDefault);
}

void draw()
{
  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f;
  timeLast = timeNow;
  timeDelay += timeElapsed;

  // valider si le temps écoulé correspond au temps entre 2 beats
  if (timeDelay >= timeBetweenBeat)
  {
    // retrancher le temps écoulé
    timeDelay -= timeBetweenBeat;

    // émettre un beat
    beat();
  }

  // affichage à l'écran
  fill(255);
  textSize(64);
  textAlign(CENTER, CENTER);
  text("BPM", width/2, height/2 - 32);
  text(round(bpm), width/2, height/2 + 32);

  // effet d'estompement progressif
  fade(fadeIntensity);
}

// fonction pour changer le BPM
void changeBPM(float bpmNew)
{
  println("change BPM from: " + round(bpm) + " to: " + round(bpmNew));
  bpm = bpmNew;
  timeDelay = 0.0f;

  // calculer le temps entre 2 beats
  timeBetweenBeat = secondPerMinute / bpm;
}

// fonction qui émet un beat
void beat()
{
  background(255);
  ++beatCount;
  println("beat " + beatCount + " @ " + round(bpm) + " BPM");
}

void fade(float intensity)
{
  noStroke();
  fill(colorBack, intensity);
  rect(0, 0, width, height);
}

float clamp(float value, float min, float max)
{
  if (value < min)
    return min;
  else if (value > max)
    return max;
  else
    return value;
}

void keyReleased()
{
  float bpmNew = bpm;

  if (keyCode == UP)
    bpmNew = clamp(bpm + bpmDelta, bpmMin, bpmMax);
  if (keyCode == DOWN)
    bpmNew = clamp(bpm - bpmDelta, bpmMin, bpmMax);

  changeBPM(bpmNew);
}

void mouseReleased()
{
  beat();
}
