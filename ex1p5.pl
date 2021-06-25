%% wizard(ron).
%% witch(ron).
%% wizard(hermione).
%% witch(hermione).
%% wizard(Y).
%% witch(Y).



hasWand(harry).

quidditchPlayer(harry).

wizard(ron).
wizard(X):- hasBroom(X), hasWand(X).

hasBroom(X):- quidditchPlayer(X).



