# ANI2012H22_Type_Python.py | Programmation Python avec Maya | coding=utf-8
# Exemples d'instanciation d'objets dont le type est déterminé par une classe.

# classe parent
class Entity:

  def __init__(self, n):
    self.name = n

  def update(self):
    #...
    pass

# classe enfant
class SubEntity(Entity):

  def __init__(self, n, x, y):
    self.name = n
    self.positionX = x
    self.positionY = y

  def update(self):
    #...
    pass

obj1 = Entity("objet 1")
obj2 = SubEntity("objet 2", 3, 4)

print "une instance de la classe Entity avec le nom: %s" % obj1.name
print "une instance de la classe SubEntity avec le nom: %s et la position: (%d, %d)" % (obj2.name, obj2.positionX, obj2.positionY)

obj1.update()
obj2.update()
