# ANI2012A22_Logic_Python.py | Programmation Python avec Maya | coding=utf-8
# Exemples de structures de contrôle logiques.

# variables

condition = True
number = 0

# 1. branchement conditionnel sans alternative

# le bloc d'instruction est exécuté seulement si la condition est vraie.

if condition:
  print "branchement 1.2"


# 2. branchement conditionnel avec alternative

if condition:
  print "branchement 2.1"
else:
  print "branchement 2.2"


# 3. branchement conditionnel avec alternative sous forme compacte

condition = False if condition == True else True

if condition:
  print "branchement 3.1"
else:
  print "branchement 3.2"


# 4. séquence de branchements conditionnels

if condition:
  print "branchement 4.1"
elif number == 0:
  print "branchement 4.2"
else:
  print "branchement 4.3"


# 5. branchements conditionnels multiples

# Python n'a pas d'opérateur switch
# cependant on peu le simuler avec un dictionnaire de clés et de valeurs

switch = {
  1: "branchement 5.1",
  2: "branchement 5.2",
  3: "branchement 5.3"}

print switch.get(number, "branchement 5.4")
