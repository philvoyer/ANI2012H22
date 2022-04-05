# ANI2012H22_Editor.py | Programmation Python avec Maya | coding=utf-8
# Exemple d'un outil avec interface graphique qui est directement intégré dans Maya.
# Fonctionnalités :
# + Assignation de transformations géométriques
# + Assignation d'une couleur de sommet
# + Validation ajout et retrait d'un attribut
# + Diverses commandes à activer avec un bouton
# + Sauvegarde et chargement des données dans un fichier externe.

import random
import cPickle

class CustomEditorWindow(object):
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
    self.window = 'CustomEditorWindow'

    # titre de la fenêtre
    self.title = 'Editor'

    # dimensions de la fenêtre (largeur, hauteur)
    self.size = (500, 300)

    # texte du bouton d'action
    self.actionName = 'Appliquer && Fermer'

    # option qui détermine si la fenêtre doit flotter ou être ancrée.
    self.isDockable = False

    # dictionnaire de données utilisé pour opération de sauvegarde/chargement
    self.dictionaryData = {}


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
      sizeable=True)

    # mode de disposition des éléments à la racine de la fenêtre
    self.layoutFormRoot = maya.cmds.formLayout(numberOfDivisions=100)

    # invoquer la fonction de création des menus
    self.createMenu()

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


  def createMenu(self):
    """fonction de création de la barre de menu"""

    # menu 'options' (début)

    self.menuEdit = maya.cmds.menu(label='options')

    self.menuEditItemReset = maya.cmds.menuItem(
      label='réinitialiser',
      command=self.callbackMenuReset)

    maya.cmds.menuItem(divider=True) # marqueur de division

    self.menuEditItemSave = maya.cmds.menuItem(
      label='sauvegarger',
      command=self.callbackMenuSave)

    self.menuEditItemLoad = maya.cmds.menuItem(
      label='ouvrir',
      command=self.callbackMenuLoad)

    maya.cmds.menuItem(divider=True)

    self.menuEditQuit = maya.cmds.menuItem(
      label='quitter',
      command=self.callbackMenuQuit)

    # menu 'options' (fin)


    # menu 'aide' (début)

    self.menuHelp = maya.cmds.menu(label='aide')

    self.menuHelpItem = maya.cmds.menuItem(
      label='aide %s' %self.title,
      command=self.callbackMenuHelp)

    # menu 'aide' (fin)


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
        [self.layoutTab,'top'  , 0],
        [self.layoutTab,'left' , 2],
        [self.layoutTab,'right', 2]),
      attachControl=(
        [self.layoutTab,'bottom', 5, self.buttonApply]))

  def createControl(self):
    """fonction de création des contrôles interactifs de l'outil"""

    # mode de disposition en formulaire
    self.layoutFormContent = maya.cmds.formLayout(numberOfDivisions=100)


    # panneau rétractable 'Transformation' (début)

    # mode de disposition en panneau rétractable
    self.layoutFrameTransform = maya.cmds.frameLayout(label='Transformation', collapsable=True)

    # définition des contraintes de disposition
    maya.cmds.formLayout(
      self.layoutFormContent, edit=True,
      attachForm=(
        [self.layoutFrameTransform,'left' , 0],
        [self.layoutFrameTransform,'right', 0],
        [self.layoutFrameTransform,'top'  , 0]))

    # mode de disposition à l'intérieur du frame layout
    maya.cmds.columnLayout()

    # zones de texte contenant les valeurs numériques de transformation (translation)
    self.textboxTranslation = maya.cmds.floatFieldGrp(
      label='Translation ',
      numberOfFields=3, # notez que 4 valeurs doivent quand même être spécifiées
      value=[0.0, 0.0, 0.0, -1.0])

    # zones de texte contenant les valeurs numériques de transformation (rotation)
    self.textboxRotation = maya.cmds.floatFieldGrp(
      label='Rotation ',
      numberOfFields=3,
      value=[0.0, 0.0, 0.0, -1.0])

    # zones de texte contenant les valeurs numériques de transformation (proportion)
    self.textboxProportion = maya.cmds.floatFieldGrp(
      label='Proportion ',
      numberOfFields=3,
      value=[1.0, 1.0, 1.0, -1.0])

    # panneau rétractable 'Transformation' (fin)


    # remonter de 2 niveaux dans la hiérarchie
    maya.cmds.setParent('..') # frame > subform
    maya.cmds.setParent('..') # subform > form


    # panneau rétractable 'Shading' (début)

    # mode de disposition en panneau rétractable
    self.layoutFrameShading = maya.cmds.frameLayout(label='Shading', collapsable=True)

    # définition des contraintes de disposition
    maya.cmds.formLayout(
      self.layoutFormContent, edit=True,
      attachForm=(
        [self.layoutFrameShading,'left' , 0],
        [self.layoutFrameShading,'right', 0],
        [self.layoutFrameShading,'top'  , 5]),
      attachControl=(
        [self.layoutFrameShading,'top', 0, self.layoutFrameTransform]))

    # mode de disposition à l'intérieur du frame layout
    maya.cmds.columnLayout()

    # contrôle permettant la sélection d'une couleur et de son opacité
    self.colorPicker = maya.cmds.colorSliderGrp(label='Vertex Color ')

    # panneau rétractable 'Shading' (fin)


    # remonter de 2 niveaux dans la hiérarchie
    maya.cmds.setParent('..') # frame > subform
    maya.cmds.setParent('..') # subform > form


    # panneau rétractable 'Command' (début)

    # mode de disposition en panneau rétractable
    self.layoutFrameCommand = maya.cmds.frameLayout(label='Commands', collapsable=True)

    # définition des contraintes de disposition
    maya.cmds.formLayout(
      self.layoutFormContent, edit=True,
      attachForm=(
        [self.layoutFrameCommand,'left' , 0],
        [self.layoutFrameCommand,'right', 0],
        [self.layoutFrameCommand,'top'  , 0]),
      attachControl=(
        [self.layoutFrameCommand,'top', 0, self.layoutFrameShading])
    )

    # mode de disposition à l'intérieur du frame layout
    maya.cmds.rowColumnLayout(numberOfColumns=5)

    # définir la taille des boutons (largeur, hauteur)
    self.buttonWidth  = 96
    self.buttonHeight = 32

    # création des boutons
    self.buttonCommand1 = maya.cmds.button(
      label='Reset',
      width=self.buttonWidth,
      height=self.buttonHeight,
      command=self.callbackButtonCommand1)

    self.buttonCommand2 = maya.cmds.button(
      label='Random',
      width=self.buttonWidth,
      height=self.buttonHeight,
      command=self.callbackButtonCommand2)

    self.buttonCommand3 = maya.cmds.button(
      label='Extrude',
      width=self.buttonWidth,
      height=self.buttonHeight,
      command=self.callbackButtonCommand3)

    self.buttonCommand4 = maya.cmds.button(
      label='-',
      width=self.buttonWidth,
      height=self.buttonHeight,
      command=self.callbackButtonCommand4)

    self.buttonCommand5 = maya.cmds.button(
      label='-',
      width=self.buttonWidth,
      height=self.buttonHeight,
      command=self.callbackButtonCommand5)

    # panneau rétractable 'Command' (fin)


    # remonter de 2 niveaux dans la hiérarchie
    maya.cmds.setParent('..') # frame > subform
    maya.cmds.setParent('..') # subform > form


    # panneau rétractable 'Attribute' (début)

    # mode de disposition en panneau rétractable
    self.layoutFrameAttribute = maya.cmds.frameLayout(label='Attributes ', collapsable=True)

    # définition des contraintes de disposition
    maya.cmds.formLayout(
      self.layoutFormContent, edit=True,
      attachForm=(
        [self.layoutFrameAttribute,'left' , 0],
        [self.layoutFrameAttribute,'right', 0],
        [self.layoutFrameAttribute,'top'  , 5]),
      attachControl=(
        [self.layoutFrameAttribute,'top', 0, self.layoutFrameCommand]))

    # mode de disposition à l'intérieur du frame layout
    maya.cmds.flowLayout()

    # contrôle permettant saisir le nom d'un attribut
    maya.cmds.text( label=' Name ' )
    self.textboxAttributeName = maya.cmds.textField(width=110)

    # contrôle permettant d'afficher et saisir la valeur d'un attribut
    maya.cmds.text( label=' Value ' )
    self.textboxAttributeValue = maya.cmds.textField(width=110)

    # bouton permettant de valider l'existence de l'attribut sur l'objet sélectionné
    self.buttonAttributeHas = maya.cmds.button(
      label='Has',
      width=60,
      height=20,
      command=self.callbackButtonAttributeHas)

    # bouton permettant d'ajouter l'attribut sur l'objet sélectionné
    self.buttonAttributeAdd = maya.cmds.button(
      label='Add',
      width=60,
      height=20,
      command=self.callbackButtonAttributeAdd)

    # bouton permettant d'enlever l'attribut sur l'objet sélectionné
    self.buttonAddAttributeRemove = maya.cmds.button(
      label='Remove',
      width=60,
      height=20,
      command=self.callbackButtonAttributeRemove)

    # panneau rétractable 'Attribute' (fin)


  def destroy(self):
    """fonction permettant de détruire les contrôles de la fenêtre"""

    # valider l'existence d'une fenêtre flottante
    if maya.cmds.window(self.window, exists=True):
      maya.cmds.deleteUI(self.window, window=True)
      print "destroy window"

    if self.isDockable:
      # valider l'existence d'une fenêtre ancrable
      if maya.cmds.dockControl(self.windowDock, exists=True):
        maya.cmds.deleteUI(self.windowDock, control=True)
        print "destroy dock"


  def reset(self):
    """fonction appelée lors de l'activation du menu 'Reset' permettant de réinitialiser les données de l'outil"""

    # initialiser les champs textes à zéro (floatFieldGrp a 4 valeurs, même si seulement 3 sont affichées)
    maya.cmds.floatFieldGrp(self.textboxTranslation, edit=True, value=[0.0, 0.0, 0.0, -1.0])
    maya.cmds.floatFieldGrp(self.textboxRotation,    edit=True, value=[0.0, 0.0, 0.0, -1.0])
    maya.cmds.floatFieldGrp(self.textboxProportion,  edit=True, value=[1.0, 1.0, 1.0, -1.0])

    # initialiser la couleur à blanc
    maya.cmds.colorSliderGrp(self.colorPicker, edit=True, rgbValue=[1.0, 1.0, 1.0])


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

      print "<noeud sélectionné: %s>" % (self.target)

      # extraction de la valeur de translation
      valueTranslation = maya.cmds.floatFieldGrp(self.textboxTranslation, query=True, value=True)
      # extraction de la valeur de rotation
      valueRotation = maya.cmds.floatFieldGrp(self.textboxRotation, query=True, value=True)
      # extraction de la valeur de proportion
      valueProportion = maya.cmds.floatFieldGrp(self.textboxProportion, query=True, value=True)

      # appliquer la transformation
      maya.cmds.xform(self.target[0], objectSpace=True, translation=valueTranslation, rotation=valueRotation, scale=valueProportion)

      # extraction de la valeur de couleur
      color = maya.cmds.colorSliderGrp(self.colorPicker, query=True, rgbValue=True)

      # affecter à l'objet comme couleur de sommet
      maya.cmds.polyColorPerVertex(self.target[0], colorRGB=color, colorDisplayOption=True)

    else:
      print "<sélection vide>"


  # fonctions de callback des menus

  def callbackMenuReset(self, *args):
    """fonction appelée lors de l'activation du menu 'Reset' permettant de réinitialiser les données de l'outil"""
    self.reset()


  def callbackMenuSave(self, *args):
    """fonction appelée lors de l'activation du menu 'Save' permettant de sauvegarder des données à l'externe de Maya"""

    filePath = ''
    fileExtension = 'dat'
    fileFilter = '<format de fichier .%s>' % fileExtension

    # afficher l'interface de sélection de fichier
    try:  # 'fileDialog2' pour Maya 2011 et plus
      filePath = maya.cmds.fileDialog2(fileFilter=fileFilter, fileMode=0)
    except: # 'fileDialog' sinon
      filePath = maya.cmds.fileDialog(directoryMask='*.%s' % fileExtension, mode=1)

    # annuler si aucun chemin n'est retourné
    if filePath is None or len(filePath) < 1:
      return

    # prendre le premier élément si une liste de chemins fut retournée
    if isinstance(filePath, list):
      filePath = filePath[0]

    # ouverture du fichier en écriture
    try:
      file = open(filePath, 'w')
    except:
      maya.cmds.confirmDialog(title='erreur', button=['OK'], message="échec de l'écriture de : %s" % filePath)
      raise

    # extraction des données de l'outil
    valueTranslation = maya.cmds.floatFieldGrp(self.textboxTranslation, query=True, value=True)
    valueRotation    = maya.cmds.floatFieldGrp(self.textboxRotation, query=True, value=True)
    valueProportion  = maya.cmds.floatFieldGrp(self.textboxProportion, query=True, value=True)
    valueColor       = maya.cmds.colorSliderGrp(self.colorPicker, query=True, rgbValue=True)

    # ajouter les données extraites de l'outil vers le dictionnaire
    self.dictionaryData.update({
      'translation': valueTranslation,
      'rotation': valueRotation,
      'proportion': valueProportion,
      'color': valueColor})

    # sérialisation des données du dictionnaire dans le fichier
    cPickle.dump(self.dictionaryData, file)

    # fermeture du fichier
    file.close()


  def callbackMenuLoad(self, *args):
    """fonction appelée lors de l'activation du menu 'Load' permettant de charger des données externes à Maya"""

    filePath = ''
    fileExtension = 'dat'
    fileFilter = '<format de fichier .%s>' % fileExtension

    # afficher l'interface de sélection de fichiers
    try:  # 'fileDialog2' pour Maya 2011 et plus
      filePath = maya.cmds.fileDialog2(fileFilter=fileFilter, fileMode=1)
    except: # 'fileDialog' sinon
      filePath = maya.cmds.fileDialog(directoryMask='*.%s' % fileExtension, mode=0)

    # annuler si aucun chemin n'est retourné
    if filePath is None or len(filePath) < 1:
      return

    # prendre le premier élément si une liste de chemins fut retournée
    if isinstance(filePath, list):
      filePath = filePath[0]

    # ouverture du fichier en lecture
    try:
      file = open(filePath, 'r')
    except:
      maya.cmds.confirmDialog(title='Error', button=['OK'], message='Unable to read file: %s' % filePath)
      raise

    # dé-sérialisation des données du ficher dans le dictionnaire
    self.dictionaryData = cPickle.load(file)

    # fermeture du fichier
    file.close()

    # extraction des données du dictionnaire
    valueTranslation = self.dictionaryData['translation']
    valueRotation    = self.dictionaryData['rotation']
    valueProportion  = self.dictionaryData['proportion']
    valueColor       = self.dictionaryData['color']

    # ajouter une 4ième valeur pour le floatFieldGrp (même si seulement 3 sont utilisées)
    valueTranslation.append(-1.0)
    valueRotation.append(-1.0)
    valueProportion.append(-1.0)

    # extraction des données vers les contrôles de l'outil
    maya.cmds.floatFieldGrp(self.textboxTranslation, edit=True, value=valueTranslation)
    maya.cmds.floatFieldGrp(self.textboxRotation, edit=True, value=valueRotation)
    maya.cmds.floatFieldGrp(self.textboxProportion, edit=True, value=valueProportion)
    maya.cmds.colorSliderGrp(self.colorPicker, edit=True, rgbValue=valueColor)


  def callbackMenuQuit(self, *args):
    """fonction appelée lors de l'activation du menu 'Quit' permettant de quitter l'outil"""
    self.destroy()


  def callbackMenuHelp(self, *args):
    """fonction appelée lors de l'activation du menu 'aide' qui permet d'ouvrir une page web qui pourrait contenir de l'aide sur l'outil"""
    maya.cmds.launch(web='https://google.com')


  # fonctions de callback des boutons

  def callbackButtonCommand1(self, *args):
    """fonction appelée lors de l'activation du bouton 1"""

    print 'commande : RESET'

    self.reset()
    self.applyToSelection()


  def callbackButtonCommand2(self, *args):
    """fonction appelée lors de l'activation du bouton 2"""

    print 'commande : RANDOM'

    # définition de l'espace à l'intérieur duquel la position aléatoire doit être choisie
    rangePosition = 10
    tresholdA = -rangePosition
    tresholdB =  rangePosition

    # génération d'une position aléatoire sur les trois axes à l'intérieur du seuil
    randomX = random.uniform(tresholdA, tresholdB)
    randomY = random.uniform(tresholdA, tresholdB)
    randomZ = random.uniform(tresholdA, tresholdB)

    # assigner la position aléatoire aux champs textes du floatFieldGrp
    maya.cmds.floatFieldGrp(self.textboxTranslation, edit=True, value=[randomX, randomY, randomZ, -1.0])

    self.applyToSelection()


  def callbackButtonCommand3(self, *args):
    """fonction appelée lors de l'activation du bouton 3"""

    print 'commande : EXTRUDE'

    if self.selectTarget():
      # sélectionner le modèle
      shape = self.target[0]

      # compter le nombre de faces du modèle
      polycount = maya.cmds.polyEvaluate(shape, face=True)

      # extrusion des faces du modèle
      for index in range(0, polycount):
        face = '%s.f[%s]'%(shape, index)
        maya.cmds.polyExtrudeFacet(face, localTranslateZ=1, constructionHistory=0)
        maya.cmds.polyExtrudeFacet(face, localTranslateZ=1, constructionHistory=0, localScale=[0.5, 0.5, 0.5])


  def callbackButtonCommand4(self, *args):
    """fonction appelée lors de l'activation du bouton 4"""

    print "<bouton 4 placeholder>"


  def callbackButtonCommand5(self, *args):
    """fonction appelée lors de l'activation du bouton 5"""

    print "<bouton 5 placeholder>"


  def callbackButtonAttributeHas(self, *args):
    """fonction appelée lors de l'activation du bouton 'Has' (attribute)"""

    if self.selectTarget():
      # extraire le premier noeud de l'objet
      objectName = self.target[0]
      # extraire le nom de l'attribut à partir du champ texte
      attributeName = maya.cmds.textField(self.textboxAttributeName, query=True, text=True)
      # valider si l'attribut existe déjà sur l'objet
      if maya.cmds.objExists("%s.%s" % (objectName, attributeName)):
        # lire la valeur de l'attribut
        attributeValue = maya.cmds.getAttr("%s.%s" % (objectName, attributeName))
        # écrire la valeur de l'attribut dans le champ texte
        maya.cmds.textField(self.textboxAttributeValue, edit=True, text=attributeValue)
      else:
        message = "attibute not found"
        maya.cmds.textField(self.textboxAttributeValue, edit=True, text=message)
        print message
    else:
      print "<sélection vide>"


  def callbackButtonAttributeAdd(self, *args):
    """fonction appelée lors de l'activation du bouton 'Add' (attribute)"""

    if self.selectTarget():
      # extraire le premier noeud de l'objet
      objectName = self.target[0]
      # extraire le nom de l'attribut à partir du champ texte
      attributeName = maya.cmds.textField(self.textboxAttributeName, query=True, text=True)
      # extraire la valeur de l'attribut à partir du champ texte
      attributeValue = str(maya.cmds.textField(self.textboxAttributeValue, query=True, text=True))
      # valider si l'attribut existe déjà sur l'objet
      if not maya.cmds.objExists("%s.%s" % (objectName, attributeName)):
        # ajouter l'attribut avec une valeur par défaut
        maya.cmds.addAttr(objectName, longName=attributeName, dataType='string')
      # écrire la valeur de l'attribut
      maya.cmds.setAttr("%s.%s" % (objectName, attributeName), attributeValue, type='string')
    else:
      print "<sélection vide>"


  def callbackButtonAttributeRemove(self, *args):
    """fonction appelée lors de l'activation du bouton 'Remove' (attribute)"""

    if self.selectTarget():
      # extraire le premier noeud de l'objet
      objectName = self.target[0]
      # extraire le nom de l'attribut à partir du champ texte
      attributeName = maya.cmds.textField(self.textboxAttributeName, query=True, text=True)
      # valider si l'attribut existe déjà sur l'objet
      if maya.cmds.objExists("%s.%s" % (objectName, attributeName)):
        # supprimer l'attribut
        maya.cmds.deleteAttr(objectName, attribute=attributeName)
      else:
        message = "attibute not found"
        maya.cmds.textField(self.textboxAttributeValue, edit=True, text=message)
        print message
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
tool = CustomEditorWindow()

# initialisation et affichage de la fenêtre
tool.showUI()

print "\n<fin de l'exécution>\n"
