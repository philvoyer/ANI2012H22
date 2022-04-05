# ANI2012H22_Selection.py | Programmation Python avec Maya | coding=utf-8#
# Exemples en lien avec l'énumération et la sélection d'éléments présents dans une scène Maya.

def enumerate(sequence):
  """fonction qui affiche dans la console une énumération de tous les éléments d'une séquence sous forme de texte"""

  count = len(sequence)
  if count != 0:
    print "\n<énumération " + str(sequence) + ">"
    for index in range(0, count):
      print "\t%s" % str(sequence[index])
    print "<énumération>\n"
  else:
    print "<séquence vide>\n"


print "\n<début de l'exécution>\n"


# 1. lister tous les éléments de la scène

print "<ex1. lister tous les éléments de la scène>\n"

sequence = maya.cmds.ls()

if len(sequence) == 0:
  print "<la scène est vide>\n"
else:
  enumerate(sequence)


# 2. lister tous les éléments sélectionnés de la scène

print "\n<ex2. lister tous les éléments sélectionnés de la scène>\n"

sequence = maya.cmds.ls(selection=True)

if len(sequence) == 0:
  print "<il n'y a pas d'élément sélectionné dans la scène>\n"
else:
  enumerate(sequence)


# 3. extraire le premier élément d'une sélection

print "\n<ex3. extraire le premier élément d'une sélection>\n"

sequence = maya.cmds.ls(selection=True, head=1)

if len(sequence) == 0:
  print "<pas de premier élément, car il n'y a pas d'élément sélectionné dans la scène>\n"
else:
  enumerate(sequence)

# 4. extraire les 2 premiers éléments d'une sélection

print "\n<ex4. extraire les 2 premiers éléments d'une sélection>\n"

sequence = maya.cmds.ls(selection=True, head=2)

if len(sequence) < 2:
  print "<pas assez d'éléments sélectionnés dans la scène>\n"
else:
  enumerate(sequence)


# 5. extraire le dernier élément d'une sélection

print "\n<ex5. extraire le dernier élément d'une sélection>\n"

sequence = maya.cmds.ls(selection=True, tail=1)

if len(sequence) == 0:
  print "<pas de dernier élément, car il n'y a pas d'élément sélectionné dans la scène>\n"
else:
  enumerate(sequence)


# 6. extraire les 2 derniers éléments d'une sélection

print "\n<ex6. extraire les 2 derniers éléments d'une sélection>\n"

sequence = maya.cmds.ls(selection=True, tail=2)

if len(sequence) < 2:
  print "<pas assez d'éléments sélectionnés dans la scène>\n"
else:
  enumerate(sequence)


# 7. sélectionner tous les éléments de la scène

print "\n<ex7. sélectionner tous les éléments de la scène>\n"

maya.cmds.select(all=True)
sequence = maya.cmds.ls(selection=True)

if len(sequence) == 0:
  print "<la scène est vide>\n"
else:
  enumerate(sequence)


# 8. désélectionner tous les éléments présents dans la sélection active

print "\n<ex8. désélectionner tous les éléments présents dans la sélection active>\n"

maya.cmds.select(clear=True)
sequence = maya.cmds.ls(selection=True)

if len(sequence) == 0:
  print "<il n'y a pas d'élément sélectionné dans la scène>\n"
else:
  enumerate(sequence) # pas supposé être exécuté car on vient de tout désélectionner


# 9. ajouter un élément à la sélection par nom

print "\n<ex9. ajouter un élément à la sélection par nom>\n"

maya.cmds.polySphere(radius=10, name='sphere')
maya.cmds.select('sphere', add=True)
sequence = maya.cmds.ls(selection=True)

if len(sequence) == 0:
  print "<il n'y a pas d'élément appelé 'sphere' dans la scène>\n"
else:
  enumerate(sequence)


# 10. sélectionner toutes les transformations géométriques de la scène (transform)

print "\n<ex10. sélectionner toutes les transformations géométriques de la scène (transform)>\n"

sequence = maya.cmds.ls(type='transform')

if len(sequence) == 0:
  print "<il n'y a pas de transformation géométrique dans la scène>\n"
else:
  enumerate(sequence)


# 11. sélectionner toutes les formes visuelles de la scène (shape)

print "\n<ex11. sélectionner toutes les formes visuelles de la scène (shape)>\n"

sequence = maya.cmds.ls(type='shape')

if len(sequence) == 0:
  print "<il n'y a pas de forme visuelle dans la scène>\n"
else:
  enumerate(sequence)


# 12. sélectionner tous les maillages géométriques de la scène (mesh)

print "\n<ex12. sélectionner tous les maillages géométriques de la scène (mesh)>\n"

sequence = maya.cmds.ls(type='mesh')

if len(sequence) == 0:
  print "<il n'y a pas de maillage géométrique dans la scène>\n"
else:
  enumerate(sequence)


# 13. sélectionner toutes les lumières de la scène (light)

print "\n<ex13. sélectionner toutes les lumières de la scène (light)>\n"

sequence = maya.cmds.ls(type='light')

if len(sequence) == 0:
  print "<il n'y a pas de lumière dans la scène>\n"
else:
  enumerate(sequence)


# 14. sélectionner tous les joints d'animation de la scène

print "\n<ex14. sélectionner tous les joints d'animation de la scène>\n"

sequence = maya.cmds.ls(type='joint')

if len(sequence) == 0:
  print "<il n'y a pas de joint d'animation dans la scène>\n"
else:
  enumerate(sequence)


# 15. extraire la position et la rotation du premier élément d'une sélection

print "\n<ex15. extraire la position et la rotation du premier élément d'une sélection>\n"

index = 0;

sequence = maya.cmds.ls(selection=True, type='transform')

# valider s'il y a au moins un élément sélectionné
if len(sequence) == 0:
  # transformation par défaut si aucun élément sélectionné
  selectionPosition = (0, 0, 0)
  selectionRotation = (0, 0, 0)
else:
  # extraire la position et l'orientation du premier élément de la liste des éléments sélectionnés
  selectionPosition = maya.cmds.xform(sequence[index], query=True, worldSpace=True, translation=True)
  selectionRotation = maya.cmds.xform(sequence[index], query=True, worldSpace=True, rotation=True)

print "<position : %s>" % selectionPosition
print "<rotation : %s>" % selectionRotation


print "\n<fin de l'exécution>\n"
