// ANI2012H22_Array_Java.java | Programmation Java avec Processing
// Exemples de tableaux avec 1, 2 ou 3 dimensions.

int indexX = 0;
int indexY = 0;
int indexZ = 0;

int countX = 0;
int countY = 0;
int countZ = 0;

// 1. tableau à une dimension

countX = 5;

int[] array1D = {1, 2, 3, 4, 5};

for (indexX = 0; indexX < countX; ++indexX)
  println("la valeur à l'index [" + indexX + "] est " + array1D[indexX]);


// 2. tableau à deux dimensions

countX = 9;
countY = 2;

int[][] array2D = {{ 1,  2}, { 3,  4}, { 5,  6},
                   { 7,  8}, { 9, 10}, {11, 12},
                   {13, 14}, {15, 16}, {17, 18}};

for (indexX = 0; indexX < countX; ++indexX)
{
  for (indexY = 0; indexY < countY; ++indexY)
    println("la valeur à l'index [" + indexX + "][" + indexY + "] est " + array2D[indexX][indexY]);
}


// 3. tableau à trois dimensions

countX = 3;
countY = 9;
countZ = 3;

int[][][] array3D = {{{ 1,  2,  3}, { 4,  5,  6}, { 7,  8,  9},
                      {10, 11, 12}, {13, 14, 15}, {16, 17, 18},
                      {19, 20, 21}, {22, 23, 24}, {25, 26, 27}},
                     {{28, 29, 30}, {31, 32, 34}, {35, 36, 37},
                      {38, 39, 40}, {41, 42, 43}, {44, 45, 46},
                      {47, 48, 49}, {50, 51, 52}, {53, 54, 55}},
                     {{56, 57, 58}, {59, 60, 61}, {62, 63, 64},
                      {65, 66, 67}, {68, 69, 70}, {71, 72, 73},
                      {74, 75, 76}, {77, 78, 79}, {80, 81, 82}}};

for (indexX = 0; indexX < countX; ++indexX)
{
  for (indexY = 0; indexY < countY; ++indexY)
  {
    for (indexZ = 0; indexZ < countZ; ++indexZ)
      println("la valeur à l'index [" + indexX + "][" + indexY + "][" + indexZ + "] est " + array3D[indexX][indexY][indexZ]);
  }
}
