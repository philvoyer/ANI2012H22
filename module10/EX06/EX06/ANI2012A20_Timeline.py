# ANI2012A20_Timeline.py | Programmation Python avec Maya | coding=utf-8
# Exemple de programme qui fait la création d'une animation constituée de deux lignes de temps qui contiennent des ensembles de poses clés avec des valeurs aléatoires.

import random

# paramètres du programme
count = 10
speed = 1
theta = 45
ratio = 0.5

# classe de type Keyframe
class Keyframe:

  def __init__(self, t, a, v):
    """constructeur de la classe"""

    self.time = t
    self.attribute = a
    self.value = v

  def trace(self):
    """fonction qui affiche dans la console les données de la pose clé"""

    print "\t\t<keyframe time: %s attribute: %s value: %s >" % (self.time, self.attribute, self.value)


# classe de type Timeline
class Timeline:

  def __init__(self, n, t, s):
    """constructeur de la classe"""

    self.name = n
    self.target = t
    self.start = s
    self.keyframes = []

  def add_keyframe(self, k):
    """fonction qui ajoute une pose clé dans la ligne de temps"""

    self.keyframes.append(k)

  def trace(self):
    """fonction qui affiche les données de la ligne de temps dans la console"""

    print "\n\t<timeline>"

    for keyframe in self.keyframes:
        keyframe.trace()

    print "\t<timeline>\n"

  def bake(self):
    """fonction qui écrit les poses clés dans le système d'animation de Maya"""

    if self.target is not None:
      for keyframe in self.keyframes:
        maya.cmds.setKeyframe(
          self.target,
          time = keyframe.time,
          attribute = keyframe.attribute,
          value = keyframe.value)
    else:
      print "<annulé, car aucun objet sur lesquels on peut appliquer les poses clés>"


# classe de type Animation
class Animation:

  def __init__(self, n):
    """constructeur de la classe"""

    self.name = n
    self.timelines = {}

  def add_timeline(self, t):
    """fonction qui ajoute une ligne de temps dans l'animation"""

    self.timelines.update({t.name : t})

  def trace(self):
    """fonction qui affiche l'ensemble des données de l'animation dans la console"""

    print "\n<animation>"

    for key, timeline in self.timelines.iteritems():
      print "\n\t<%s : %s>" % (key, timeline)
      timeline.trace()

    print "<animation>\n"

  def bake(self):
    """fonction qui écrit les poses clés dans le système d'animation de Maya"""

    print "\n<bake animation>\n"

    for key, timeline in self.timelines.iteritems():
      timeline.bake()


print "\n<début de l'exécution>\n"


# 1. initialisation de la scène animée

print "\n<instanciation d'une pyramide sur laquelle l'animation sera appliquée>\n"

target = maya.cmds.polyPyramid(name='pyramid', numberOfSides=4, subdivisionsHeight=1, subdivisionsCaps=1)

print "\n<instanciation d'une nouvelle animation>\n"

animation = Animation('nom animation')

print "\n<instanciation des lignes de temps>\n"

timeline1 = Timeline('ligne de temps 1', target,  1)
timeline2 = Timeline('ligne de temps 2', target, 16)

print "\n<ajouter la ligne de temps à l'animation>\n"

animation.add_timeline(timeline1)
animation.add_timeline(timeline2)


# 2. Générer des poses clés une à la fois

print "\n<ex1. ajouter les poses clés dans la première ligne de temps une à la fois>\n"
print "<l'attribut et la valeur sont spécifiés directement>\n"

keyframe1 = Keyframe(1, 'translateX', 1)
keyframe2 = Keyframe(2, 'translateX', 2)
keyframe3 = Keyframe(3, 'translateX', 3)
keyframe4 = Keyframe(4, 'translateX', 5)
keyframe5 = Keyframe(5, 'translateX', 8)

timeline1.add_keyframe(keyframe1)
timeline1.add_keyframe(keyframe2)
timeline1.add_keyframe(keyframe3)
timeline1.add_keyframe(keyframe4)
timeline1.add_keyframe(keyframe5)


# 3. Générer des poses clés à partir d'une structure itérative

print "\n<ex2. ajouter les poses clés dans la première ligne de temps par itération>"
print "<l'attribut et la valeur sont déterminés au hasard >\n"

# liste d'attributs d'animation
keyframeAttributes = [
  'translateX', 'translateY', 'translateZ',
  'rotateX',    'rotateY',    'rotateZ',
  'scaleX',     'scaleY',     'scaleZ']

for index in range(6, 11):
  timeline1.add_keyframe(
    Keyframe(
      index,
      random.choice(keyframeAttributes),
      random.randint(-5, 5)))


# 4. Générer des poses clés à partir de la technique de compréhension de liste

print "\n<ex3. ajouter les poses clés dans la première ligne de temps par technique de compréhension de liste>\n"
print "<l'attribut est le même que la séquence précédente, mais la valeur est doublée>\n"

sequence = [Keyframe(keyframe.time + 5, keyframe.attribute, keyframe.value * 3) for keyframe in timeline1.keyframes[5:10]]

for index in range(len(sequence)):
  timeline1.add_keyframe(sequence[index])


# 5. Générer des poses clés à partir d'une fonction génératrice

print "\n<ex4. ajouter les poses clés dans la seconde ligne de temps avec une fonction génératrice>\n"
print "<l'attribut est choisi au hasard parmi une liste de transformations représentées sous forme de tuple>\n"

# liste de primitives de transformation
transforms = []

transforms.append(('move_forward',  'translateZ',  speed))
transforms.append(('move_backward', 'translateZ', -speed))
transforms.append(('move_right',    'translateX',  speed))
transforms.append(('move_left',     'translateX', -speed))
transforms.append(('rotate_right',  'rotateY',     theta))
transforms.append(('rotate_left',   'rotateY',    -theta))

def frame_generator(count):
  index = 0
  while index < count:
    transform = random.choice(transforms)
    keyframe = Keyframe(timeline2.start + index, transform[1], transform[2])
    yield keyframe
    index += 1

sequence = list(frame_generator(100))

for index in range(len(sequence)):
  timeline2.add_keyframe(sequence[index])


# afficher le contenu de l'animation sous forme textuelle dans la console
animation.trace()

# ajouter les poses clés de l'animation dans la scène maya
animation.bake()


print "\n<fin de l'exécution>\n"
