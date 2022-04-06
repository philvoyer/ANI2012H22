# ANI2012A20_Tween.py | Programmation Python avec Maya | coding=utf-8
# Exemples d'interpolations de valeurs numériques avec les fonctions 'lerp' et 'smoothstep'.

# paramètres du programme
size = 10

# valeurs minimum et maximum de la transition
positionFrom = -20
positionTo = 20

# durée de l'interpolation
duration = 120

print "\n<début de l'exécution>\n"


# 1. interpolation linéaire

print "<interpolation linéaire deux valeurs numériques (lerp)>\n"

def lerp(x1, x2, t):
  """fonction qui calcule une interpolation linéaire entre deux valeurs numériques"""

  if t < 0.0:
    return x1

  if t > 1.0:
    return x2

  return (1.0 - t) * x1 + t * x2


# création d'un cube
maya.cmds.polyCube(name='cube', width=size, height=size, depth=size)

# vider la sélection
maya.cmds.select(clear=True)

# sélectionner le cube
maya.cmds.select('cube', add=True)

# extraire le node de transformation du cube
target = maya.cmds.ls(selection=True, head=True)[0]

print "<lerp>"

for index in range(duration + 1):

  # déterminer la position de la tête de lecture entre les deux bornes selon l'index de la boucle (dans l'intervalle [0, 1])
  playhead = index / float(duration)

  # invocation de la fonction d'interpolation dont la valeur de retour dépend de la position de la tête de lecture
  position = lerp(positionFrom, positionTo, playhead)

  # création d'une pose clé sur l'attribut de translation en X du cube à la position courante de l'interpolation
  maya.cmds.setKeyframe(target, time=index, attribute='translateX', value=position)

  # trace des différentes valeurs utilisées pour le calcul d'interpolation
  print "\t<from:\t%s\tto:\t%s\tplayhead:\t%0.2f\tposition:\t%0.2f>" % (positionFrom, positionTo, playhead, position)

print "<lerp>\n"


# 2. interpolation avec accélération et décélération

print "<interpolation deux valeurs numériques avec accélération et décélération (smoothstep)>\n"

def smoothstep(x1, x2, t):
  """fonction qui calcule une interpolation deux valeurs numériques avec accélération et décélération"""

  if t < 0.0:
    t = 0.0

  if t > 1.0:
    t = 1.0

  t = t * t * (3.0 - 2.0 * t)

  return (1.0 - t) * x1 + t * x2


# création d'une sphère
maya.cmds.polySphere(name='sphere', radius=size * 0.618)

# vider la sélection
maya.cmds.select(clear=True)

# sélectionner la sphère
maya.cmds.select('sphere', add=True)

# extraire le node de transformation de la sphère
target = maya.cmds.ls(selection=True, head=True)[0]

print "<smoothstep>"

for index in range(duration + 1):

  # déterminer la position de la tête de lecture entre les deux bornes selon l'index de la boucle (dans l'intervalle [0, 1])
  playhead = index / float(duration)

  # invocation de la fonction d'interpolation dont la valeur de retour dépend de la position de la tête de lecture
  position = smoothstep(positionFrom, positionTo, playhead)

  # création d'une pose clé sur l'attribut de translation en X du cube à la position courante de l'interpolation
  maya.cmds.setKeyframe(target, time=index, attribute='translateX', value=position)

  # trace des différentes valeurs utilisées pour le calcul d'interpolation
  print "\t<from:\t%s\tto:\t%s\tplayhead:\t%0.2f\tposition:\t%0.2f>" % (positionFrom, positionTo, playhead, position)

print "<smoothstep>\n"


print "\n<fin de l'exécution>\n"
