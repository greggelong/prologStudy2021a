listwithout([],_,[]).

listwithout([E|T], E, W):- listwithout(T,E,W),!.
%listwithout([H|T], E, W):- H = E, listwithout(T,E,W),!.
listwithout([H|T],E,[H|T2]):- listwithout(T,E,T2).
