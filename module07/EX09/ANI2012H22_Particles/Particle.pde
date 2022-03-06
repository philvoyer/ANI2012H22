// ANI2012H22_Particles/Particle.pde
// Classe de type Particle.

class Particle
{
  ParticleSystem ps;

  Vector3D position;

  color colorDiffuse;

  boolean isExpired;

  float lifetime;

  float timer;

  float timeStart;
  float timeFrame;
  float timeElapsed;
  float timeActive;

  Particle()
  {
    position = new Vector3D();

    colorDiffuse = #FFFFFF;

    isExpired = true;
  }

  void setPosition(float x, float y, float z)
  {
    position.x = x;
    position.y = y;
    position.z = z;
  }

  void randomize(float x, float y, float z)
  {
    position.x = random(0.0f, 1.0f) * x - x / 2.0f;
    position.y = random(0.0f, 1.0f) * y - y / 2.0f;
    position.z = random(0.0f, 1.0f) * z - z / 2.0f;
  }

  void init()
  {
    isExpired = false;

    timer = 0;
    timeStart = millis();
    timeFrame = timeStart;
    timeActive = 0;
  }

  void update()
  {
    timeElapsed = (millis() - timeFrame) / 1000.0f;
    timer += timeElapsed;

    if (timer > lifetime)
      isExpired = true;

    timeFrame = millis();
    timeActive = timeFrame - timeStart;
  }

  void render()
  {
    fill(colorDiffuse, 127);
    ellipse(position.x, position.y, 32, 32);
  }

  void print(String tag)
  {
    println("particle" + tag + " = (" + position.x + " " + position.y + " " + position.z +")");
  }
}
