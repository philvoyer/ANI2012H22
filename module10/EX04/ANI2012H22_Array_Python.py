# ANI2012H22_Array_Python.py | Programmation Python avec Maya | coding=utf-8
# Exemples de tableaux avec 1, 2 ou 3 dimensions.

indexX = 0
indexY = 0
indexZ = 0

countX = 0
countY = 0
countZ = 0

# 1. tableau à une dimension

countX = 5

array1D = [1, 2, 3, 4, 5]

for indexX in range(countX):
  print "la valeur à l'index [%d] est %d" % (indexX, array1D[indexX])


# 2. tableau à deux dimensions

countX = 9
countY = 2

array2D = [[ 1,  2], [ 3,  4], [ 5,  6],
           [ 7,  8], [ 9, 10], [11, 12],
           [13, 14], [15, 16], [17, 18]]

for indexX in range(countX):
  for indexY in range(countY):
    print "la valeur à l'index [%d][%d] est %d" % (indexX, indexY, array2D[indexX][indexY])


# 3. tableau à trois dimensions

countX = 3
countY = 9
countZ = 3

array3D = [[[ 1,  2,  3], [ 4,  5,  6], [ 7,  8,  9],
            [10, 11, 12], [13, 14, 15], [16, 17, 18],
            [19, 20, 21], [22, 23, 24], [25, 26, 27]],
           [[28, 29, 30], [31, 32, 34], [35, 36, 37],
            [38, 39, 40], [41, 42, 43], [44, 45, 46],
            [47, 48, 49], [50, 51, 52], [53, 54, 55]],
           [[56, 57, 58], [59, 60, 61], [62, 63, 64],
            [65, 66, 67], [68, 69, 70], [71, 72, 73],
            [74, 75, 76], [77, 78, 79], [80, 81, 82]]]

for indexX in range(countX):
  for indexY in range(countY):
    for indexZ in range(countZ):
      print "la valeur à l'index [%d][%d][%d] est %d" % (indexX, indexY, indexZ, array3D[indexX][indexY][indexZ])
