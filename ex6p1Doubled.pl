doubled([],[]).
doubled([H1|T1],[H2a,H2b|T2]):-
    H2a = H1,
    H2b = H1,
    doubled(T1,T2).

% this only doubles the letter
append([],L,L).
append([H|T],L2,[H|L3]):- append(T,L2,L3).


doubled2(L,D):-
    append(L,L,D).

    

    