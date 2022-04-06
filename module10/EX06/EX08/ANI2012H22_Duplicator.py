# ANI2012H22_Duplicator.py | Programmation Python avec Maya | coding=utf-8
# Exemple d'un outil avec interface graphique qui est directement intégré dans Maya.
# Il permet de dupliquer le premier élément d'une sélection avec un nombre de copies et une distance paramétrable.

class DuplicatorToolWindow(object):
  """classe permettant d'instancier une instance de fenêtre d'interface"""

  @classmethod
  def showUI(cls):
    """fonction d'affichage de la fenêtre"""

    # instanciation d'une instance de la classe
    win = cls()

    # invoquer la fonction de construction de la fenêtre
    win.create()

    # retourner la référence vers l'instance de fenêtre
    return win


  def __init__(self):
    """fonction d'initialisation de la classe"""

    # identifiant unique de la fenêtre
    self.window = 'DuplicatorToolWindow'

    # titre de la fenêtre
    self.title = 'Duplicateur'

    # dimensions de la fenêtre (largeur, hauteur)
    self.size = (1, 1) # en fonction du layout du contenu

    # texte du bouton d'action
    self.actionName = 'Appliquer && Fermer'

    # option qui détermine si la fenêtre doit flotter ou être ancrée.
    self.isDockable = False


  def destroy(self):
    """fonction permettant de détruire les contrôles de la fenêtre"""

    # valider l'existence d'une fenêtre flottante
    if maya.cmds.window(self.window, exists=True):
      maya.cmds.deleteUI(self.window, window=True)

    if self.isDockable:
      # valider l'existence d'une fenêtre ancrable
      if maya.cmds.dockControl(self.windowDock, exists=True):
        maya.cmds.deleteUI(self.windowDock, control=True)


  def create(self):
    """fonction d'instanciation de la fenêtre"""

    # valider si une instance de la fenêtre existe déjà
    if maya.cmds.window(self.window, exists=True):
      # si oui, supprimer l'instance de la fenêtre précédente
      maya.cmds.deleteUI(self.window, window=True)

    # instancier et configurer un contrôle de type fenêtre
    self.window = maya.cmds.window(
      self.window,
      title=self.title,
      widthHeight=self.size,
      menuBar=True,
      maximizeButton=False,
      toolbox=True,
      resizeToFitChildren=True,
      sizeable=False)

    # mode de disposition des éléments à la racine de la fenêtre
    self.layoutFormRoot = maya.cmds.formLayout(numberOfDivisions=100)

    # invoquer la fonction de création de boutons
    self.createButton()

    # invoquer la fonction de création des contrôles
    self.createControl()

    if self.isDockable:
      # ancrer la fenêtre à même l'interface de Maya
      allowedAreas = ['right', 'left']
      self.windowDock = maya.cmds.dockControl(area='right', label=self.title, content=self.window, allowedArea=allowedAreas)

    # affichage de la fenêtre active (celle qui vient d'être créée)
    maya.cmds.showWindow()


  def createButton(self):
    """fonction de création des boutons"""

    # définir la taille des boutons (largeur, hauteur) avec écarts
    self.commonBtnSize = ((self.size[0]-(5+5+4+4))/3, 26)

    # création des boutons
    self.buttonAction = maya.cmds.button(
      label=self.actionName,
      height=self.commonBtnSize[1],
      command=self.callbackButtonAction)

    self.buttonApply = maya.cmds.button(
      label='Appliquer',
      height=self.commonBtnSize[1],
      command=self.callbackButtonApply)

    self.buttonClose = maya.cmds.button(
      label='Fermer',
      height=self.commonBtnSize[1],
      command=self.callbackButtonClose)

    # définition des contraintes de disposition des boutons
    maya.cmds.formLayout(
      self.layoutFormRoot, edit=True,
      attachForm=(
        [self.buttonAction, 'left'  , 5],
        [self.buttonAction, 'bottom', 5],
        [self.buttonApply , 'bottom', 5],
        [self.buttonClose , 'bottom', 5],
        [self.buttonClose , 'right' , 5]),
      attachPosition=(
        [self.buttonAction, 'right', 1, 33],
        [self.buttonClose , 'left' , 0, 67]),
      attachControl=(
        [self.buttonApply,'left' , 4, self.buttonAction],
        [self.buttonApply,'right', 4, self.buttonClose]),
      attachNone=(
        [self.buttonAction,'top'],
        [self.buttonApply, 'top'],
        [self.buttonClose, 'top']))

    # mode de disposition en onglet
    self.layoutTab = maya.cmds.tabLayout(scrollable=True, tabsVisible=False, height=1, childResizable=True)

    # définition des contraintes de disposition
    maya.cmds.formLayout(
      self.layoutFormRoot, edit=True,
      attachForm=(
        [self.layoutTab,'top', 0],
        [self.layoutTab,'left', 2],
        [self.layoutTab,'right', 2]),
      attachControl=(
        [self.layoutTab,'bottom', 5, self.buttonApply]))


  def createControl(self):
    """fonction de création des contrôles interactifs de l'outil"""

    # mode de disposition en formulaire
    self.layoutFormContent = maya.cmds.formLayout()

    # mode de disposition à l'intérieur du frame layout
    maya.cmds.columnLayout()

    # zones de texte contenant le nombre d'instances par dimension
    self.textboxCount = maya.cmds.floatFieldGrp(
      label='Copies ',
      numberOfFields=1,
      value=[1, 0, 0, 0])

    # zones de texte contenant le nombre d'instances par dimension
    self.textboxOffset = maya.cmds.floatFieldGrp(
      label='Distance ',
      numberOfFields=1,
      value=[1, 0, 0, 0])


  def selectTarget(self):
    """sélection de l'élément sur lequel les actions seront appliquées (premier objet)"""

    # sélection du premier élément de la liste des objets sélectionnés
    self.target = maya.cmds.ls(selection=True, head=1)

    # valider s'il y a au moins un élément de sélectionné
    if len(self.target) > 0:
      return True
    else:
      return False


  def applyToSelection(self):
    """fonction permettant d'appliquer les données de l'outil sur l'objet sélectionné"""

    if self.selectTarget():

      print "<élément sélectionné : %s>" % self.target

      # extraction de la valeur du nombre d'instances par dimension
      count = maya.cmds.floatFieldGrp(self.textboxCount, query=True, value=True)

      # extraction de la valeur de la distance entre les instances par dimension
      offset = maya.cmds.floatFieldGrp(self.textboxOffset, query=True, value=True)

      # dupliquer la première copie
      maya.cmds.duplicate(self.target[0])

      # déplacer la copie selon la distance
      maya.cmds.move(offset[0], 0, 0, relative=True, objectSpace=True)

      # créer les autres copies avec la même transformation par rapport à la précédente
      for index in range(int(count[0]-1)):
        maya.cmds.duplicate(smartTransform=True)

      print "<duplication copies: %s distance: %s>" % (count, offset)

    else:
      print "<sélection vide>"


  def callbackButtonAction(self, *args):
    """fonction appelée lors de l'activation du bouton 'Appliquer & Fermer'"""

    self.applyToSelection()
    self.destroy()


  def callbackButtonApply(self, *args):
    """fonction appelée lors de l'activation du bouton 'Appliquer'"""

    self.applyToSelection()


  def callbackButtonClose(self, *args):
    """fonction appelée lors de l'activation du bouton 'Fermer'"""

    self.destroy()


print "\n<début de l'exécution>\n"

# instanciation de la fenêtre
tool = DuplicatorToolWindow()

# initialisation et affichage de la fenêtre
tool.showUI()

print "\n<fin de l'exécution>\n"
