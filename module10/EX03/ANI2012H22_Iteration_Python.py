# ANI2012H22_Iteration_Python.py | Programmation Python avec Maya | coding=utf-8
# Exemples de structures de contrôle itératives.

# 1. boucle 'for'

print "boucle de 10 itérations avec un 'for'"

for index in range(10):
  print "\tloop %i" % (index)


# 2. boucle 'while'

print "\nboucle de 10 itérations avec un 'while'"

index = 0

while (index < 10):
  print "\tloop %i" % (index)
  index = index + 1
