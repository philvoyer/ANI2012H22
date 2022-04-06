# ANI2012H22_Attribute.py | Programmation Python avec Maya | coding=utf-8
# Exemples de manipulations d'attributs d'animation assignés à des noeuds dans une scène Maya.

def attribute_has(nodeName, attributeName):
  """fonction qui valide l'existence d'un attribut sur un noeud"""

  # valider si le noeud possède l'attribut
  if maya.cmds.objExists("%s.%s" % (nodeName, attributeName)):
    return True
  else:
    return False


def attribute_add(nodeName, attributeName):
  """fonction pour ajouter d'un nouvel attribut numérique sur un noeud"""

  # valider si le noeud possède l'attribut
  if not maya.cmds.objExists("%s.%s" % (nodeName, attributeName)):
    # ajouter un attribut sur le noeud avec une borne inférieure, supérieure et une valeur par défaut
    maya.cmds.addAttr(nodeName, longName=attributeName, minValue=0.0, maxValue=100.0, defaultValue=0.0)
  else:
    print u"<fonction 'attribute_add' annulée, car l'attribut '%s' existe déjà sur le noeud '%s'>" % (attributeName, nodeName)


def attribute_remove(nodeName, attributeName):
  """fonction pour supprimer un attribut assigné à un noeud"""

  # valider si l'attribut existe déjà sur le noeud
  if maya.cmds.objExists("%s.%s" % (nodeName, attributeName)):
    # supprimer l'attribut
    maya.cmds.deleteAttr(nodeName, attribute=attributeName)
  else:
    print u"<fonction 'attribute_remove' annulée, car l'attribut '%s' n'existe pas sur le noeud '%s'>" % (attributeName, nodeName)


def attribute_read(nodeName, attributeName):
  """fonction de lecture d'une valeur d'un attribut assigné à un noeud"""

  # valider si le noeud possède l'attribut
  if maya.cmds.objExists("%s.%s" % (nodeName, attributeName)):
    # extraire et retourner la valeur de l'attribut
    return maya.cmds.getAttr("%s.%s" % (nodeName, attributeName))
  else:
    print u"<fonction 'attribute_read' annulée, car l'attribut '%s' n'existe pas sur le noeud '%s'>" % (attributeName, nodeName)
    return None


def attribute_write(nodeName, attributeName, attributeValue):
  """fonction d'écriture d'une valeur dans un attribut assigné à un noeud"""

  # valider si le noeud possède l'attribut
  if maya.cmds.objExists("%s.%s" % (nodeName, attributeName)):
    # assigner la nouvelle valeur de l'attribut
    maya.cmds.setAttr("%s.%s" % (nodeName, attributeName), attributeValue)
  else:
    print u"<fonction 'attribute_write' annulée, car l'attribut '%s' n'existe pas sur le noeud '%s'>" % (attributeName, nodeName)


def attribute_connect(nodeName1, attributeName1, nodeName2, attributeName2):
  """fonction pour créer une connexion entre deux attributs de deux noeuds différents"""

  attribute1 = "%s.%s" % (nodeName1, attributeName1)
  attribute2 = "%s.%s" % (nodeName2, attributeName2)

  # valider l'existence de l'attribut sur les deux noeuds
  if not maya.cmds.objExists(attribute1):
    print u"<fonction 'attribute_connect' annulée, car l'attribut '%s' n'existe pas sur le noeud '%s'>" % (attributeName1, nodeName1)
  if not maya.cmds.objExists(attribute2):
    print u"<fonction 'attribute_connect' annulée, car l'attribut '%s' n'existe pas sur le noeud '%s'>" % (attributeName2, nodeName2)

  # création d'une connexion entre les deux attributs
  maya.cmds.connectAttr(attribute1, attribute2)


print "\n<début de l'exécution>"


# 1. noeuds avec attributs

print "\n<ex1. noeuds avec attributs>"

print "<générer deux nouvelles primitives géométriques (un cube et une sphère)>"

# création de deux primitives géométriques (cube et sphère)
newCube = maya.cmds.polyCube();
newSphere = maya.cmds.polySphere()

print "<aller chercher une référence vers le noeud de transformation des deux primitives géométriques>"

# aller chercher le premier noeud des deux primitives géométriques
# le premier noeud est celui de transformation et le second est la shape
transformNodeCube = newCube[0]
transformNodeSphere = newSphere[0]

print u"<le noeud '%s' possède déjà des attributs (ex. transformation) et il peut s'en faire assigner des nouveaux>" % transformNodeCube
print u"<le noeud '%s' possède déjà des attributs (ex. transformation) et il peut s'en faire assigner des nouveaux>" % transformNodeSphere


# 2. modifier un attribut de transformation

print "\n<ex2. modifier un attribut de transformation>"

currentTranslateZ = attribute_read(transformNodeCube, 'translateZ')
currentRotateY = attribute_read(transformNodeCube, 'rotateY')

print "<avant écriture la valeur de translateZ est %s>" % str(currentTranslateZ)
print "<avant écriture la valeur de rotateY est %s>" % str(currentRotateY)

attribute_write(transformNodeCube, 'translateZ', 5.0)
attribute_write(transformNodeCube, 'rotateY', 45.0)

print "<après écriture la valeur de translateZ est %s>" % str(attribute_read(transformNodeCube, 'translateZ'))
print "<après écriture la valeur de rotateY est %s>" % str(attribute_read(transformNodeCube, 'rotateY'))


# 3. ajouter un nouvel attribut

print "\n<ex3. ajouter un nouvel attribut>"

print "<définition du nom d'un nouvel attribut>"

myNewAttribute = 'newAttributeName'

print "<nom de l'attribut : %s>" % myNewAttribute

print u"<le noeud '%s' possède l'attribut '%s' ? %s>" % (transformNodeCube, myNewAttribute, attribute_has(transformNodeCube, myNewAttribute))

print "<tentative de manipulation d'un attribut inexistant sur un noeud>"
attribute_read(transformNodeCube, myNewAttribute)
attribute_write(transformNodeCube, myNewAttribute, 0.0)
attribute_remove(transformNodeCube, myNewAttribute)

print "<ajouter le nouvel attribut sur le cube>"
attribute_add(transformNodeCube, myNewAttribute)

print "<ajouter le nouvel attribut sur la sphère>"
attribute_add(transformNodeSphere, myNewAttribute)

print u"<le noeud '%s' possède l'attribut '%s' ? %s>" % (transformNodeCube, myNewAttribute, attribute_has(transformNodeCube, myNewAttribute))

print u"<le noeud '%s' possède l'attribut '%s' ? %s>" % (transformNodeSphere, myNewAttribute, attribute_has(transformNodeSphere, myNewAttribute))


# 4. suppression d'un attribut

print "\n<ex4. suppression d'un attribut>"

print "<supprimer l'attribut sur la sphère>"
attribute_remove(transformNodeSphere, myNewAttribute)

print u"<le noeud '%s' possède l'attribut '%s' ? %s>" % (transformNodeCube, myNewAttribute, attribute_has(transformNodeCube, myNewAttribute))

print u"<le noeud '%s' possède l'attribut '%s' ? %s>" % (transformNodeSphere, myNewAttribute, attribute_has(transformNodeSphere, myNewAttribute))
print "<ajouter le nouvel attribut sur la sphère>"

attribute_add(transformNodeSphere, myNewAttribute)

print "<ajouter le nouvel attribut sur le cube>"
attribute_add(transformNodeCube, myNewAttribute)

print u"<le noeud '%s' possède l'attribut '%s' ? %s>" % (transformNodeCube, myNewAttribute, attribute_has(transformNodeCube, myNewAttribute))

print u"<le noeud '%s' possède l'attribut '%s' ? %s>" % (transformNodeSphere, myNewAttribute, attribute_has(transformNodeSphere, myNewAttribute))


# 5. modifier la valeur d'un attribut

print "\n<ex5. modifier la valeur d'un attribut>"

print "<écrire une valeur numérique dans l'attribut du cube (12.3)>"
attribute_write(transformNodeCube, myNewAttribute, 12.3)

print "<écrire une nouvelle valeur numérique dans l'attribut du cube (45.6)>"
attribute_write(transformNodeCube, myNewAttribute, 45.6)

print "<écrire une valeur numérique dans l'attribut de la sphère (78.9)>"
attribute_write(transformNodeSphere, myNewAttribute, 78.9)

print "<la valeur de l'attribut sur le cube est %s>" % str(attribute_read(transformNodeCube, myNewAttribute))
print "<la valeur de l'attribut sur la sphère est %s>" % str(attribute_read(transformNodeSphere, myNewAttribute))


# 6. créer une connexion entre deux attributs

print "\n<ex6. créer une connexion entre deux attributs>"

print "<connecter la translation en X du cube sur la translation en Y de la sphère>"

attribute_connect(transformNodeCube, 'translateX', transformNodeSphere, 'translateY')

print "<connecter la translation en Z de la sphère sur la rotation en Y du cube>"

attribute_connect(transformNodeSphere, 'translateZ', transformNodeCube, 'rotateY')

print "<connecter le nouvel attribut des deux objets>"

attribute_connect(transformNodeCube, myNewAttribute, transformNodeSphere, myNewAttribute)

print "<lire la valeur de l'attribut sur les deux objets>"

print u"<la valeur de l'attribut '%s' du noeud '%s' est %s>" % (myNewAttribute, transformNodeCube, attribute_read(transformNodeCube, myNewAttribute))
print u"<la valeur de l'attribut '%s' du noeud '%s' est %s>" % (myNewAttribute, transformNodeSphere, attribute_read(transformNodeSphere, myNewAttribute))

print "<modifier la valeur d'un des attributs connectés dans l'éditeur de Maya pour voir le comportement>"

print "\n<fin de l'exécution>"
