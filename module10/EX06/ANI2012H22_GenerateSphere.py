# ANI2012H22_GenerateSphere.py | Programmation Python avec Maya | coding=utf-8
# Création d'une sphère par programmation.

import maya

# paramètres du programme
diameter = 10
divisionX = 12
divisionY = 8

print "<generate a new sphere with diameter: %s divisionX: %s divisionY: %s>" % (diameter, divisionX, divisionY)

sphere = maya.cmds.polySphere(
  radius=diameter/2,
  axis=(0, 1, 0),
  subdivisionsX=divisionX,
  subdivisionsY=divisionY)

print sphere
