// ANI2012H22_Particles/Vector3D.pde
// Classe de type Vector3D (un vecteur en 3 dimensions).
// Cette classe peut aussi fonctionner en 2 dimensions,
// simplement ignorer la composante en Z et la laisser à 0.

class Vector3D
{
  float x;
  float y;
  float z;

  Vector3D()
  {
    x = y = z = 0.0f;
  }

  Vector3D(float valueX, float valueY, float valueZ)
  {
    x = valueX;
    y = valueY;
    z = valueZ;
  }

  void set(float valueX, float valueY, float valueZ)
  {
    x = valueX;
    y = valueY;
    z = valueZ;
  }

  void copy(Vector3D v)
  {
    x = v.x;
    y = v.y;
    z = v.z;
  }

  Vector3D clone()
  {
    Vector3D v = new Vector3D();

    v.x = x;
    v.y = y;
    v.z = z;

    return v;
  }

  void randomize(float rangeX, float rangeY, float rangeZ, boolean centered)
  {
    if (centered)
    {
      x = random(0.0f, 1.0f) * rangeX - rangeX / 2.0f;
      y = random(0.0f, 1.0f) * rangeY - rangeY / 2.0f;
      z = random(0.0f, 1.0f) * rangeZ - rangeZ / 2.0f;
    }
    else
    {
      x = random(0.0f, 1.0f) * rangeX;
      y = random(0.0f, 1.0f) * rangeY;
      z = random(0.0f, 1.0f) * rangeZ;
    }
  }

  void add(float valueX, float valueY, float valueZ)
  {
    x += valueX;
    y += valueY;
    z += valueZ;
  }

  void add(Vector3D v)
  {
    x += v.x;
    y += v.y;
    z += v.z;
  }

  void minus(float valueX, float valueY, float valueZ)
  {
    x -= valueX;
    y -= valueY;
    z -= valueZ;
  }

  void minus(Vector3D v)
  {
    x -= v.x;
    y -= v.y;
    z -= v.z;
  }

  void divide(float value)
  {
    if (value != 0)
    {
      x /= value;
      y /= value;
      z /= value;
    }
  }

  void multiply(float value)
  {
    x *= value;
    y *= value;
    z *= value;
  }

  void factor(float valueX, float valueY, float valueZ)
  {
    x *= valueX;
    y *= valueY;
    z *= valueZ;
  }

  float magnitude()
  {
    return sqrt(x * x + y * y + z * z);
  }

  float distance(Vector3D v)
  {
    float deltaX = v.x - x;
    float deltaY = v.y - y;
    float deltaZ = v.z - z;

    return sqrt(deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ);
  }

  void normalize()
  {
    float length = magnitude();

    if (length > 0)
      divide(length);
  }

  void scale(float length)
  {
    normalize();
    multiply(length);
  }

  boolean isNull()
  {
    return x == 0 && y == 0 && z == 0;
  }

  void rotateZ(float angle)
  {
    float tmp = x;
    x = x   * cos(angle) - y * sin(angle);
    y = tmp * sin(angle) + y * cos(angle);
  }

  float angleBetween(Vector3D v)
  {
    if (isNull() || v.isNull())
      return 0;

    float phi = magnitude() * v.magnitude();
    float theta = dot(v);

    theta /= phi;

    return acos(theta);
  }

  float heading()
  {
    return atan2(y, x);
  }

  float dot(Vector3D v)
  {
    return x * v.x + y * v.y + z * v.z;
  }

  Vector3D cross(Vector3D v)
  {
    Vector3D u = new Vector3D();

    u.x = y * v.z - z * v.y;
    u.y = z * v.x - x * v.z;
    u.z = x * v.y - y * v.x;

    return u;
  }

  void print(String tag)
  {
    println(tag + " = (" + x + " " + y + " " + z +")");
  }
}
