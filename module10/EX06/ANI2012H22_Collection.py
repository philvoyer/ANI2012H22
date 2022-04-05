# ANI2012H22_Collection.py | Programmation Python avec Maya | coding=utf-8
# Exemples de manipulations de différents types de collection (tuple, liste et dictionnaire).

import sys

print "\n<début de l'exécution>\n"

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

# 1. tuple

print "\n<ex1. tuples d'éléments de même type>\n"

tupleOfInteger = (1, 2, 3)
tupleOfFloat   = (1.5, 2.5, 3.5)
tupleOfBoolean = (True, False, True, False)
tupleOfString  = ('abc', 'xyz', 'rgb')

# tupleOfInteger[0] = 4 # cause une erreur, car un tuple est immuable
# Error: line 1: 'tuple' object does not support item assignment

enumerate(tupleOfInteger)
enumerate(tupleOfFloat)
enumerate(tupleOfBoolean)
enumerate(tupleOfString)


# 2. liste

print "\n<ex2. listes d'éléments de même type>\n"

listOfInteger = [1, 2, 3]
listOfFloat   = [1.5, 2.5, 3.5]
listOfBoolean = [True, False, True, False]
listOfString  = ['abc', 'xyz', 'rgb']

listOfInteger[0] = 4 # possible, car une liste est mutable

enumerate(listOfInteger)
enumerate(listOfFloat)
enumerate(listOfBoolean)
enumerate(listOfString)


# 3. tuple vs liste

print "\n<ex3. comparaison d'une même séquence sous forme de tuple et de liste>\n"

numberSequenceAsTuple = tuple(range(32))
numberSequenceAsList = list(range(32))

print "<séquence sous forme de tuple : %s>" % str(numberSequenceAsTuple)
print "<séquence sous forme de liste : %s>\n" % str(numberSequenceAsList)

sizeAsTuple = sys.getsizeof(numberSequenceAsTuple)
sizeAsList = sys.getsizeof(numberSequenceAsList)

print "<taille en mémoire de numberSequenceAsTuple : %d octets>" % sizeAsTuple
print "<taille en mémoire de numberSequenceAsList : %d octets>\n" % sizeAsList

if sizeAsTuple < sizeAsList:
  print "<le tuple occupe moins de mémoire que la liste>\n"
else:
  print "<la liste occupe moins de mémoire que le tuple>\n"


# 4. listes d'éléments avec des types différents

print "\n<ex4. listes d'éléments avec des types différents>\n"

listOfDifferentTypes1 = [True, 1, 2.3, 'text']
listOfDifferentTypes2 = ['abc', "xyz", '''rgb''', 6]
listOfDifferentTypes3 = [1+2, 3/4, len('text')]

enumerate(listOfDifferentTypes1)
enumerate(listOfDifferentTypes2)
enumerate(listOfDifferentTypes3)


# 5. listes imbriquées dans une liste

print "\n<ex5. listes imbriquées dans une liste>\n"

listOfLists1 = [[1, 2, 3], [1.5, 2.5, 3.5], [True, False, True, False]]
listOfLists2 = [tupleOfInteger, tupleOfFloat, tupleOfBoolean]
listOfLists3 = [listOfInteger, listOfFloat, listOfBoolean]
listOfLists4 = [listOfLists1, [tupleOfInteger, tupleOfFloat, tupleOfBoolean], [listOfInteger, listOfFloat, listOfBoolean]]

print "<listOfLists1 : %s >" % str(listOfLists1)
print "<listOfLists2 : %s >" % str(listOfLists2)
print "<listOfLists3 : %s >" % str(listOfLists3)
print "<listOfLists4 : %s >" % str(listOfLists4)

enumerate(listOfLists1)
enumerate(listOfLists3)
enumerate(listOfLists4)
enumerate(listOfLists2)


# 6. dictionnaire de clés et de valeurs

print "\n<ex6. création d'un dictionnaire qui contient les 6 possibilités d'ordre de rotation {clé : ordre de rotation}>\n"

dictRotationOrder = {
  0 : 'xyz',
  1 : 'yzx',
  2 : 'zxy',
  3 : 'xzy',
  4 : 'yxz',
  5 : 'zyx'
}

enumerate(dictRotationOrder)

# itération sur les paires de clés et valeurs du dictionnaire
print "<dictionnaire>"

for key, value in dictRotationOrder.iteritems():
  print "\t%s : %s" % (key, value)

print "<dictionnaire>\n"


print "\n<fin de l'exécution>\n"
