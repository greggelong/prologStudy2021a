%% 0 is a numeral

numeral(0).

%% If X is a numeral then so is succ(X)

numeral(succ(X)) :- numeral(X).


%% base case 0 add Y = Y
add(0,X,X).

add(succ(X),Y,succ(Z)) :- add(X,Y,Z).

