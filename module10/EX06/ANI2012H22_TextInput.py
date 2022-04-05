# ANI2012H22_TextInput.py | Programmation Python avec Maya | coding=utf-8
# Exemples d'interfaces graphiques simples qui permettent de demander à l'utilisateur de saisir une information au clavier.

print "\n<début de l'exécution>\n"

# 1. saisir un texte

# fenêtre avec champ texte éditable et bouton de confirmation
# retourne la valeur saisie dans le champ texte sous forme de texte

promptStatus = maya.cmds.promptDialog(title="exemple 1", message="Saisir une valeur en format texte :", button="OK")

if promptStatus == "OK":
  promptValue = maya.cmds.promptDialog(query=True, text=True)

print u"\n<ex1. valeur de retour : %s>" % promptValue


# 2. saisir un nombre

# fenêtre avec champ texte éditable et bouton de confirmation
# retourne la valeur saisie dans le champ texte sous forme d'un nombre entier

promptStatus = maya.cmds.promptDialog(title="exemple 2", message="Saisir une valeur numérique :", button="OK")

if promptStatus == "OK":
  promptValue = maya.cmds.promptDialog(query=True, text=True)

print u"\n<ex2. valeur de retour : %s>" % promptValue

try:
  number = int(promptValue)
except ValueError:
  print "<cette valeur ne peut pas être convertie en nombre>"
else:
  print "<cette valeur peut être convertie en nombre>"
  print "<la valeur sous forme numérique est : %d>" % number


# 3. saisir un nombre entre deux bornes

# fenêtre avec champ texte éditable et bouton de confirmation
# retourne la valeur saisie dans le champ texte sous forme d'un nombre entier et valide la borne inférieure et supérieure

promptStatus = maya.cmds.promptDialog(title="exemple 3", message="Saisir une valeur numérique dans l'intervalle [1, 10]:", button="OK")

if promptStatus == "OK":
  promptValue = maya.cmds.promptDialog(query=True, text=True)

print u"\n<ex3. valeur de retour : %s>" % promptValue

try:
  number = int(promptValue)
except ValueError:
  print "<cette valeur ne peut pas être convertie en nombre>"
else:
  print "<cette valeur peut être convertie en nombre>"
  if number >= 1 and number <= 10:
    print "<la valeur est dans l'intervalle [1, 10]>"
  else:
    print "<la valeur n'est pas dans l'intervalle [1, 10]>"


# 4. saisir le nom d'un élément de la scène et le sélectionner

# fenêtre avec champ texte éditable et bouton de confirmation.
# permet de sélectionner un élément de la scène par son nom

promptStatus = maya.cmds.promptDialog(title="exemple 4", message="Saisir le nom d'un élément à sélectionner :", button="OK")

if promptStatus == "OK":
  promptValue = maya.cmds.promptDialog(query=True, text=True)

print u"\n<ex4. valeur de retour : %s>" % promptValue

if maya.cmds.objExists(promptValue):
  maya.cmds.select(promptValue, add=True)
  print u"<sélection de l'élément %s>" % promptValue
else:
  print u"<l'élément %s n'est pas présent dans la scène>" % promptValue


print "\n<fin de l'exécution>\n"
