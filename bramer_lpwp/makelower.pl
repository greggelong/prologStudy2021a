% readin:- get0(X),process(X).
% process(42). %% terminate on *
% process(X):- X=\=42,write(X),put(X+32),nl, readin.
% %% nested recursive call that terminates on *


makelower:- get0(X), process(X).
process(10):- nl. %% terminate on return
process(32):- put(32), makelower. %% if space put space


%% if x is upper case
process(X):-
    X >= 65,
    X =<90,
    L is X +32,  %% caculate lower case
    put(L),
    makelower.

%% all other chars
%% the placement of this clause makes it work
process(X):-        

    put(X),
    makelower.

    

