# ANI2012H22_KeyframeTransformTranslate.py | Programmation Python avec Maya | coding=utf-8
# Générer une séquence d'animation par transformation de l'attribut de translation.

# extraire le premier élément de la sélection
target = maya.cmds.ls(selection=True, head=1)

print "\n<début de l'exécution>\n"

# création des poses clés si la sélection n'est pas vide
if len(target) > 0:
  maya.cmds.setKeyframe(target, time=10, attribute='translateX', value=1.0)
  maya.cmds.setKeyframe(target, time=10, attribute='translateZ', value=0.0)

  maya.cmds.setKeyframe(target, time=20, attribute='translateX', value=0.0)
  maya.cmds.setKeyframe(target, time=20, attribute='translateZ', value=1.0)

  maya.cmds.setKeyframe(target, time=30, attribute='translateX', value=-2.0)
  maya.cmds.setKeyframe(target, time=30, attribute='translateZ', value=0.0)

  maya.cmds.setKeyframe(target, time=40, attribute='translateX', value=0.0)
  maya.cmds.setKeyframe(target, time=40, attribute='translateZ', value=-2.0)

  maya.cmds.setKeyframe(target, time=50, attribute='translateX', value=3.0)
  maya.cmds.setKeyframe(target, time=50, attribute='translateZ', value=0.0)

  maya.cmds.setKeyframe(target, time=60, attribute='translateX', value=0.0)
  maya.cmds.setKeyframe(target, time=60, attribute='translateZ', value=3.0)

  maya.cmds.setKeyframe(target, time=70, attribute='translateX', value=-3.0)
  maya.cmds.setKeyframe(target, time=70, attribute='translateZ', value=0.0)

  maya.cmds.setKeyframe(target, time=80, attribute='translateX', value=0.0)
  maya.cmds.setKeyframe(target, time=80, attribute='translateZ', value=-3.0)

  maya.cmds.setKeyframe(target, time=90, attribute='translateX', value=4.0)
  maya.cmds.setKeyframe(target, time=90, attribute='translateZ', value=0.0)

  maya.cmds.setKeyframe(target, time=100, attribute='translateX', value=0.0)
  maya.cmds.setKeyframe(target, time=100, attribute='translateZ', value=4.0)

else:
  print "<faire une sélection avant d'exécuter le script>"

print "\n<fin de l'exécution>\n"
