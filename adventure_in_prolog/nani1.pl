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


