
p.

q :- p.

%% this shows affirming the consequent fallacy

dodishes(wife).


happy(wife).


happy(wife):- dodishes(me).

%% affirming the consequet


/*
?- happy(wife).
true.

?- dodishes(me).
false.


*/

potus(biden).

american(X):- potus(X).


