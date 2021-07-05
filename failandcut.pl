%%enjoys(vincent,X):- big_kahuna_burger(X),!,fail.
%%vincent enjoys burgers except for big kahuna burgers
%% it if big kahuna burger is true it will cut (not back track)
%% and fail return false.

%% here we have added a negation as failure clause
%%neg(Goal):- Goal,!, fail.
%%neg(Goal). 

enjoys(vincent,X):- 
    burger(X), 
    \+ big_kahuna_burger(X).

%%enjoys(vincent,X):- burger(X).

burger(X):- big_mac(X).
burger(X):- big_kahuna_burger(X).
burger(X):- whopper(X).

big_mac(a).
big_mac(c).
big_kahuna_burger(b).

whopper(d).