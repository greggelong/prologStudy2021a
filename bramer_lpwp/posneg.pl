test(X):-X>0, write('positive'),nl.
test(X):- X = 0, write('zero'),nl.
test(X):- X<0, write('negative'),nl.

