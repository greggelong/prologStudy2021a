person(bill,male).
person(george,male).
person(alfred,male).
person(carol,female).
person(margaret,female).
person(jane,female).

couple(X,Y):- person(X,male), person(Y,female).


% ?- findall((X,Y),couple(X,Y),List).
% List = [(bill, carol),  (bill, margaret),  (bill, jane),  (george, carol),  (george, margaret),  (george, jane),  (alfred, carol),  (alfred, margaret),  (..., ...)].