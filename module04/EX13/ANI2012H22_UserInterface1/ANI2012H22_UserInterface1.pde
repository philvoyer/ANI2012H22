// ANI2012H22_UserInterface1.pde
// Exemples d'utilisation de contrôles d'interface interactifs avec souris.
// Démonstration d'un bouton, de cases à cocher, de boutons radio et d'une barre de progression.

// paramètres
int count = 8;

float buttonWidth = 128;
float buttonHeight = 64;

float checkboxWidth = 64;
float checkboxHeight = 64;

float radioBackground = 64;
float radioSelected = 42;

float sliderWidth = 256;
float sliderHeight = 16;

float offset = 92;

// variables
final int CONTROL_TYPE_BUTTON = 0;
final int CONTROL_TYPE_CHECKBOX = 1;
final int CONTROL_TYPE_RADIO = 2;
final int CONTROL_TYPE_SLIDER = 3;

int[] type = {
  CONTROL_TYPE_BUTTON,
  CONTROL_TYPE_CHECKBOX,
  CONTROL_TYPE_CHECKBOX,
  CONTROL_TYPE_CHECKBOX,
  CONTROL_TYPE_RADIO,
  CONTROL_TYPE_RADIO,
  CONTROL_TYPE_RADIO,
  CONTROL_TYPE_SLIDER};

float[] positionX = {255.0f, 255.0f - offset, 255.0f, 255.0f + offset, 255.0f - offset, 255.0f, 255.0f + offset, 255.0f};
float[] positionY = {100.0f, 200.0f, 200.0f, 200.0f, 300.0f, 300.0f, 300.0f, 400.0f};

boolean[] stateActive   = {true,  true,  true,  true,  true,  true,  true,  true};
boolean[] stateOver     = {false, false, false, false, false, false, false, false};
boolean[] statePress    = {false, false, false, false, false, false, false, false};
boolean[] stateRelease  = {false, false, false, false, false, false, false, false};
boolean[] stateSelected = {false, false, false, false, false, false, false, false};

int index = 0;
int backgroundColor = 31;

color colorLight = color(127, 127, 127);
color colorDark  = color(92, 92, 92);

float sliderValue;

void setup()
{
  size(512, 512);
  frameRate(60);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}

void draw()
{
  background(backgroundColor);

  updateInput();
  updateInterface();
}

// fonction de mise à jour des états des contrôles par rapport aux états de la souris
void updateInput()
{
  for (int index = 0; index < count; ++index)
  {
    if (stateActive[index])
    {
      switch (type[index])
      {
        case CONTROL_TYPE_BUTTON:

          stateOver[index] = isInside(index, buttonWidth / 2.0f, buttonHeight / 2.0f);

          if (stateOver[index] && mousePressed == true)
            statePress[index] = true;
          else
            statePress[index] = false;

          break;

        case CONTROL_TYPE_CHECKBOX:

          stateOver[index] = isInside(index, checkboxWidth / 2.0f, checkboxHeight / 2.0f);

          if (stateOver[index] && mousePressed == true)
            statePress[index] = true;
          else
            statePress[index] = false;

          break;

        case CONTROL_TYPE_RADIO:

          stateOver[index] = isInside(index, radioBackground / 2.0f, radioSelected / 2.0f);

          if (stateOver[index] && mousePressed == true)
            statePress[index] = true;
          else
            statePress[index] = false;

          break;

        case CONTROL_TYPE_SLIDER:

          stateOver[index] = isInside(index, sliderWidth / 2.0f, sliderHeight / 2.0f);

          if (stateOver[index] && mousePressed == true)
            statePress[index] = true;
          else
            statePress[index] = false;
          break;

        default:
          break;
      }
    }
  }
  sliderValue = int(oscillate(millis(), 128, 10000, 0, 0));
}

// affichage de l'interface et de ses contrôles
void updateInterface()
{
  for (int index = 0; index < count; ++index)
  {
    if (stateActive[index])
    {
      switch (type[index])
      {
        case CONTROL_TYPE_BUTTON:

          if (statePress[index])
          {
            fill(colorDark);

            rect(
              positionX[index],
              positionY[index],
              buttonWidth,
              buttonHeight);
          }
          else if (stateOver[index])
          {
            fill(colorLight);

            rect(
              positionX[index],
              positionY[index],
              buttonWidth  * 1.1f,
              buttonHeight * 1.1f);
          }
          else if (stateRelease[index])
          {
            fill(colorLight);

            rect(
              positionX[index],
              positionY[index],
              buttonWidth,
              buttonHeight);
          }
          else
          {
            fill(colorLight);

            rect(
              positionX[index],
              positionY[index],
              buttonWidth,
              buttonHeight);
          }

          break;

        case CONTROL_TYPE_CHECKBOX:

          fill(colorLight);

          rect(
            positionX[index],
            positionY[index],
            checkboxWidth,
            checkboxHeight);

          if (stateSelected[index])
          {
            fill(colorDark);

            ellipse(
              positionX[index],
              positionY[index],
              radioSelected,
              radioSelected);
          }

          break;

        case CONTROL_TYPE_RADIO:

          fill(colorLight);

          ellipse(
            positionX[index],
            positionY[index],
            radioBackground,
            radioBackground);

          if (stateSelected[index])
          {
            fill(colorDark);

            ellipse(
              positionX[index],
              positionY[index],
              radioSelected,
              radioSelected);
          }

          break;

        case CONTROL_TYPE_SLIDER:

          fill(colorLight);

          rect(
            positionX[index],
            positionY[index],
            sliderWidth,
            sliderHeight);

          fill(colorDark);

          ellipse(
            positionX[index] + sliderValue,
            positionY[index],
            radioSelected,
            radioSelected);

          break;

        default:
          break;
      }
    }
  }
}

// fonction de mise à jour des états des contrôles lorsqu'un bouton de la souris est relaché
void mouseReleased()
{
  for (int index = 0; index < count; ++index)
  {
    if (stateActive[index])
    {
      switch (type[index])
      {
        case CONTROL_TYPE_BUTTON:

          if (statePress[index])
            callbackButton(index);

          break;

        case CONTROL_TYPE_CHECKBOX:

          if (statePress[index])
            callbackCheckbox(index);

          break;

        case CONTROL_TYPE_RADIO:

          if (statePress[index])
            callbackRadio(index);

          break;

        case CONTROL_TYPE_SLIDER:

          if (statePress[index])
            callbackSlider();

          break;

        default:
          break;
      }
    }
  }
}

// fonction qui valide si la position du curseur est à l'intérieur de la boîte qui délimite le contrôle
boolean isInside(int index, float w, float h)
{
  if (mouseX >= positionX[index] - w && mouseX < positionX[index] + w &&
     mouseY >= positionY[index] - h && mouseY < positionY[index] + h )
    return true;
  else
    return false;
}

// fonction d'événement du bouton standard
void callbackButton(int index)
{
  backgroundColor = int(random(0, 255));
  println("button trigger");
}

// fonction d'événement des boutons pressions
void callbackCheckbox(int index)
{
  stateSelected[index] = !stateSelected[index];

  if (stateSelected[index])
    println("checkbox " + index + " ON");
  else
    println("checkbox " + index + " OFF");
}

// fonction d'événement des boutons radios
void callbackRadio(int index)
{
  stateSelected[index] = !stateSelected[index];

  for (int optionIndex = 0; optionIndex < count; ++optionIndex)
  {
    if (optionIndex != index)
    {
      if (type[optionIndex] == CONTROL_TYPE_RADIO)
        stateSelected[optionIndex] = false;
    }
  }

  println("radio " + (index-3));
}

// fonction d'événement de la barre de défilement
void callbackSlider()
{
  println("slider position: " + sliderValue);
}

// fonction d'animation par oscillation
float oscillate(float time, float amplitude, float period, float shift, float offset)
{
  return amplitude * sin((time - shift) * 2 * PI / period) + offset;
}
