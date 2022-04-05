# ANI2012H22_KeyframeTransformRotate.py | Programmation Python avec Maya | coding=utf-8
# Générer une séquence d'animation par transformation de l'attribut de rotation.

# extraire le premier élément de la sélection
target = maya.cmds.ls(selection=True, head=1)

print "\n<début de l'exécution>\n"

# création des poses clés si la sélection n'est pas vide
if len(target) > 0:

  maya.cmds.setKeyframe(target, time=0, attribute='rotateX', value=0.0)
  maya.cmds.setKeyframe(target, time=20, attribute='rotateX', value=180.0)

  maya.cmds.setKeyframe(target, time=20, attribute='rotateX', value=180.0)
  maya.cmds.setKeyframe(target, time=40, attribute='rotateX', value=0.0)

  maya.cmds.setKeyframe(target, time=50, attribute='rotateY', value=0.0)
  maya.cmds.setKeyframe(target, time=70, attribute='rotateY', value=180.0)

  maya.cmds.setKeyframe(target, time=70, attribute='rotateY', value=180.0)
  maya.cmds.setKeyframe(target, time=90, attribute='rotateY', value=0.0)

  maya.cmds.setKeyframe(target, time=100, attribute='rotateZ', value=0.0)
  maya.cmds.setKeyframe(target, time=120, attribute='rotateZ', value=180.0)

  maya.cmds.setKeyframe(target, time=120, attribute='rotateZ', value=180.0)
  maya.cmds.setKeyframe(target, time=140, attribute='rotateZ', value=0.0)

else:
  print "<faire une sélection avant d'exécuter le script>"

print "\n<fin de l'exécution>\n"
