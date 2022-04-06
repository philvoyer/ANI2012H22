# ANI2012A20_Oscillator.py | Programmation Python avec Maya | coding=utf-8
# Création d'une séquence d'animation par oscillation de différents attributs.

import math

# paramètres l'animation
frameFirst = 1
frameLast = 240
frequency = 0.1
amplitude = 10

# liste d'attributs d'animation
keyframeAttributes = [
  'translateX', 'translateY', 'translateZ',
  'rotateX',    'rotateY',    'rotateZ',
  'scaleX',     'scaleY',     'scaleZ']

def oscillator(frequency, amplitude, t):
  """fonction qui retourne la valeur d'une oscillation en fonction de ses paramètres"""
  return amplitude * math.sin(frequency * t)

# prendre le premier élément de la sélection
target = maya.cmds.ls(selection=True)

print "<génération des poses clés dans l'intervalle [%s, %s]>" % (frameFirst, frameLast)

# génération des poses clés
if len(target) > 0:
  for index in range(frameFirst, frameLast):

    # mise à jour de l'oscillateur
    oscillation = oscillator(frequency, amplitude, index)

    print "<oscillation: %s>" % str(oscillation)

    # poses clés sur trois différents attributs en fonction de la valeur courante de l'oscillateur
    maya.cmds.setKeyframe(target[0], attribute=keyframeAttributes[0], value=oscillation * 1.0, t=index)
    maya.cmds.setKeyframe(target[0], attribute=keyframeAttributes[4], value=oscillation * 5.0, t=index)
    maya.cmds.setKeyframe(target[0], attribute=keyframeAttributes[8], value=oscillation * 0.2, t=index)
else:
  print "<faire une sélection avant d'exécuter le script>"
