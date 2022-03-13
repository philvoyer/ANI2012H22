// ANI2012H22_DigitalClock.pde
// Exemples d'éléments temporels affichés sous forme digitale.
// Le premier élément temporel affiche le temps courant,
// le second affiche la valeur courante d'un chronomètre qui commence au lancement du programme et
// le dernier affiche la valeur courante d'un chronomètre dont la vitesse est pondérée.

// paramètres
float timeScale = 10.0f;
float timeScaleMin = 0.25f;
float timeScaleMax = 100.0f;
float timeScaleDelta = 0.25f;

// variables
String currentTimeClock;
String currentTimeChrono;
String currentTimeScaled;

int clockHour;
int clockMinute;
int clockSecond;

int chronoHour;
int chronoMinute;
int chronoSecond;

int scaledHour;
int scaledMinute;
int scaledSecond;

float timeStart;
float timeNow;
float timeNowScaled;
float timeLast;

int hourPerDay = 24;
int secondPerMinute = 60;
int minutePerHour = 60;
int millisecondPerSecond = 1000;
int millisecondPerMinute = millisecondPerSecond * 60;
int millisecondPerHour = millisecondPerMinute * 60;

void setup()
{
  size(512, 512);
  textAlign(CENTER, CENTER);
  timeStart = timeNow = timeLast = timeNowScaled = 0.0f;
}

void draw()
{
  background(63);

  // mise à jour des variables temporelles
  updateTime();

  // convertir les éléments temporels dans une chaîne de caractères formattée
  currentTimeClock = "";
  currentTimeClock += clockHour + ":";
  currentTimeClock += nf(clockMinute, 2) + ":";
  currentTimeClock += nf(clockSecond, 2);

  currentTimeChrono = "";
  currentTimeChrono += chronoHour + ":";
  currentTimeChrono += nf(chronoMinute, 2) + ":";
  currentTimeChrono += nf(chronoSecond, 2);

  currentTimeScaled = "";
  currentTimeScaled += scaledHour + ":";
  currentTimeScaled += nf(scaledMinute, 2) + ":";
  currentTimeScaled += nf(scaledSecond, 2);

  // afficher les éléments temporels
  textSize(32);
  text("Heure courante", width/2, height/2 - 144);
  textSize(64);
  text(currentTimeClock, width/2, height/2 - 96);
  textSize(32);
  text("Chronomètre", width/2, height/2 - 16);
  textSize(64);
  text(currentTimeChrono, width/2, height/2 + 32);
  textSize(32);
  text("Chronomètre x" + timeScale, width/2, height/2 + 112);
  textSize(64);
  text(currentTimeScaled, width/2, height/2 + 160);
}

void updateTime()
{
  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeNowScaled += (timeNow - timeLast) * timeScale;
  timeLast = timeNow;

  // aller chercher le temps courant de l'ordinateur
  clockHour = hour();
  clockMinute = minute();
  clockSecond = second();

  // transformer le temps courant du chronomètre à vitesse normale
  chronoHour = (int) ((timeNow / millisecondPerHour) % hourPerDay);
  chronoMinute = (int) ((timeNow / millisecondPerMinute) % minutePerHour);
  chronoSecond = (int) (timeNow / millisecondPerSecond) % secondPerMinute;

  // transformer le temps courant du chronomètre à vitesse pondérée
  scaledHour = (int) ((timeNowScaled / millisecondPerHour) % hourPerDay);
  scaledMinute = (int) ((timeNowScaled / millisecondPerMinute) % minutePerHour);
  scaledSecond = (int) (timeNowScaled / millisecondPerSecond) % secondPerMinute;
}

void keyPressed()
{
  // modifier la vitesse du temps
  if (keyCode == UP)
    timeScale = constrain(timeScale + timeScaleDelta, timeScaleMin, timeScaleMax);
  if (keyCode == DOWN)
    timeScale = constrain(timeScale - timeScaleDelta, timeScaleMin, timeScaleMax);
}
