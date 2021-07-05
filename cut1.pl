%% cut free code 10.1
p(X):- a(X).
p(X):- b(X), c(X), !, d(X), e(X).
p(X):- f(X).

a(1).
b(1).
b(2).
c(1).
c(2).
d(2).
e(2).
f(3).


max(X,Y,Y):- X =< Y,!. %% green cut a cut that can be take out and have an equivalent clause
max(X,Y,X):- X > Y. 