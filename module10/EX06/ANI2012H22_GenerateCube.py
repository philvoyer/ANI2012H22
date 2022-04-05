# ANI2012H22_GenerateCube.py | Programmation Python avec Maya | coding=utf-8
# Création d'un cube par programmation.

import maya

# paramètres du programme
size = 10
division = 3

print "<generate a new cube with size: %s division: %s>" % (size, division)

cube = maya.cmds.polyCube(
  width=size,
  height=size,
  depth=size,
  subdivisionsX=division,
  subdivisionsY=division,
  subdivisionsZ=division)

print cube
