%nani chapter2

%% rooms that match the drawing
%% five clauses all facts
room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

%% define the locatons two-argument predicate clause 
%% first argument mean the thing second its location

location(desk,office).
location(apple,kitchen).
location(flashlight,desk).
location('washing machine', cellar).
location(nani,'washing machine').
location(broccoli,kitchen).
location(crackers,kitchen).
location(computer, office).

%% at the momet these are just oneway doors

door(office, hall).
door(kitchen, office).
door(hall, 'dining room').
door(kitchen, cellar).
door('dining room', kitchen).

%% some facts about properties of things

edible(apple).
edible(crackers).

tastes_yuchy(broccoli).

%% inital status of flashlight

turned_off(flashlight).

%% initial location of player

here(kitchen).


% a complicated query to locate an item inside another item
% in the office

% ?- location(X,Y), location(Y,office),location(X,Y).
% X = flashlight,
% Y = desk ;


/*

Merritt gives a nice example of the declartive and procedural meaning of prolog code

The query: 

?- location(X,kitchen), edible(X).

Has two interpretations, declarative and procedural

Logically (declaratively) it means "Is there an X such that X
is located in the kitchen and X is edible?" 

The procedural interpretation is: "First find an X located in the kitchen, and then test to see if it is
edible. If it is not, go back and find another X in the kitchen and test it.
Repeat until successful, or until there are no more XS in the kitchen. "
*/