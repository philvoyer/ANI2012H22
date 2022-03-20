// ANI2012H22_Turntable.pde
// Exemple d'un programme qui simule une table tournante.

// paramètres
float rpm33 = 33.0f;
float rpm45 = 45.0f;
float rpm78 = 78.0f;

float timeScaleMin = 0.25f;
float timeScaleMax = 10.0f;
float timeScaleDelta = 0.25f;

float offsetHorizontal = 64.0f;

color buttonColorPlay = color(255, 255, 127);
color buttonColorOn = color(191, 191, 63);
color buttonColorOff = color(222, 222, 222);

float stickerRadiusRatio = 1.0f / 3.0f;

// variables
boolean isTurntableActive;

float rpm;

float diskCenterX;
float diskCenterY;

float diskRadius;

float stickerRadius;

float timeNow;
float timeLast;
float timeElapsed;

float angleCurrent;
float anglePrevious;
float angleDelta;

float pointerLastX;
float pointerLastY;

float pointerCurrentX;
float pointerCurrentY;

float pointerDeltaX;
float pointerDeltaY;

boolean isMousePressed;

void setup()
{
  size(512, 512);

  textSize(32);
  textAlign(CENTER, CENTER);

  rectMode(CENTER);
  ellipseMode(CENTER);

  timeNow = timeLast = timeElapsed = 0.0f;

  diskCenterX = width/2;
  diskCenterY = height/2;

  diskRadius = min(width, height) * 0.8f;

  stickerRadius = stickerRadiusRatio * diskRadius;

  changeRPM(33);

  isTurntableActive = true;
  isMousePressed = false;
}

void draw()
{
  background(63);

  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f;
  timeLast = timeNow;

  // calculer le scratch
  updateScratch();

  // faire tourner le disque seulement si la table tournante est active
  if (isTurntableActive)
  {
    if (!isMousePressed)
      angleCurrent += angleDelta * timeElapsed;
    else
      applyScratch();
  }

  // dessiner le disque dans son orientation acutelle
  drawDisk();

  // afficher le RPM
  fill(255);
  text("RPM " + round(rpm), width/2, height - height/16);
}

void updateScratch()
{
  if (isMousePressed)
  {
    pointerLastX = pointerCurrentX;
    pointerLastY = pointerCurrentY;

    pointerCurrentX = mouseX;
    pointerCurrentY = mouseY;

    pointerDeltaX = pointerCurrentX - pointerLastX;
    pointerDeltaY = pointerCurrentY - pointerLastY;
  }
}

void applyScratch()
{
  if (abs(pointerDeltaX) > abs(pointerDeltaY))
  {
    if (pointerCurrentY > diskCenterY)
      angleCurrent -= pointerDeltaX * timeElapsed;
    else
      angleCurrent += pointerDeltaX * timeElapsed;
  }
  else
  {
    if (pointerCurrentX > diskCenterX)
      angleCurrent += pointerDeltaY * timeElapsed;
    else
      angleCurrent -= pointerDeltaY * timeElapsed;
  }
}

void drawDisk()
{
  // dessiner la base de la table tournante
  stroke(127);
  strokeWeight(6);
  noFill();
  rect(diskCenterX, diskCenterY, width * 0.98f, height * 0.98f);
  strokeWeight(4);
  rect(diskCenterX, diskCenterY, width * 0.82f, height * 0.82f);

  // translater l'origine au centre de la fenêtre d'affichage
  translate(diskCenterX, diskCenterY);

  // rotation autour de l'origine
  rotate(angleCurrent);

  // dessiner la silouhette du disque
  stroke(127);
  strokeWeight(4);
  fill(63);
  ellipse(0, 0, diskRadius, diskRadius);

  // dessiner le centre du disque
  stroke(127);
  strokeWeight(4);
  noFill();
  rect(0, 0, stickerRadius/2, stickerRadius/2);
  ellipse(0, 0, stickerRadius, stickerRadius);

  // dessiner une ligne sur le disque (repère visuel)
  stroke(0);
  strokeWeight(8);
  line(0, 0, diskRadius/4, diskRadius/4);
}

void changeRPM(float rpmNew)
{
  println("change turntable RPM from: " + rpm + " to: " + rpmNew);
  rpm = rpmNew;
  angleDelta = rpm * 2 * PI / 60.0f;
}

void keyReleased()
{
  if (key == ' ')
  {
    isTurntableActive = !isTurntableActive;

    if (isTurntableActive)
      println("turntable is now ON");
    else
      println("turntable is now OFF");
  }

  if (key == '1')
    changeRPM(rpm33);
  if (key == '2')
    changeRPM(rpm45);
  if (key == '3')
    changeRPM(rpm78);
}

void mousePressed()
{
  isMousePressed = true;

  pointerCurrentX = pointerLastX = mouseX;
  pointerCurrentY = pointerLastY = mouseY;
}

void mouseReleased()
{
  isMousePressed = false;
}
