# ANI2012H22_KeyframeTransformScale.py | Programmation Python avec Maya | coding=utf-8
# Générer une séquence d'animation par transformation de l'attribut de proportion.

# extraire le premier élément de la sélection
target = maya.cmds.ls(selection=True, head=1)

print "\n<début de l'exécution>\n"

# création des poses clés si la sélection n'est pas vide
if len(target) > 0:

  maya.cmds.setKeyframe(target, time=0,  attribute='scaleX', value=1.0)
  maya.cmds.setKeyframe(target, time=20, attribute='scaleX', value=2.0)

  maya.cmds.setKeyframe(target, time=20, attribute='scaleX', value=2.0)
  maya.cmds.setKeyframe(target, time=40, attribute='scaleX', value=1.0)

  maya.cmds.setKeyframe(target, time=50, attribute='scaleY', value=1.0)
  maya.cmds.setKeyframe(target, time=70, attribute='scaleY', value=2.0)

  maya.cmds.setKeyframe(target, time=70, attribute='scaleY', value=2.0)
  maya.cmds.setKeyframe(target, time=90, attribute='scaleY', value=1.0)

  maya.cmds.setKeyframe(target, time=100, attribute='scaleZ', value=1.0)
  maya.cmds.setKeyframe(target, time=120, attribute='scaleZ', value=2.0)

  maya.cmds.setKeyframe(target, time=120, attribute='scaleZ', value=2.0)
  maya.cmds.setKeyframe(target, time=140, attribute='scaleZ', value=1.0)

  maya.cmds.setKeyframe(target, time=150, attribute='scaleX', value=1.0)
  maya.cmds.setKeyframe(target, time=150, attribute='scaleY', value=1.0)
  maya.cmds.setKeyframe(target, time=150, attribute='scaleZ', value=1.0)
  maya.cmds.setKeyframe(target, time=170, attribute='scaleX', value=2.0)
  maya.cmds.setKeyframe(target, time=170, attribute='scaleY', value=2.0)
  maya.cmds.setKeyframe(target, time=170, attribute='scaleZ', value=2.0)

  maya.cmds.setKeyframe(target, time=170, attribute='scaleX', value=2.0)
  maya.cmds.setKeyframe(target, time=170, attribute='scaleY', value=2.0)
  maya.cmds.setKeyframe(target, time=170, attribute='scaleZ', value=2.0)
  maya.cmds.setKeyframe(target, time=190, attribute='scaleX', value=1.0)
  maya.cmds.setKeyframe(target, time=190, attribute='scaleY', value=1.0)
  maya.cmds.setKeyframe(target, time=190, attribute='scaleZ', value=1.0)

else:
  print "<faire une sélection avant d'exécuter le script>"

print "\n<fin de l'exécution>\n"
