%nani chapter5

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

%% (updated) at the momet these are just oneway doors

door(office, hall).
door(kitchen, office).
door(hall, 'dining room').
door(kitchen, cellar).
door('dining room', kitchen).

%% add connect\2 to have two way doors
connect(X,Y):- door(X,Y).
connect(X,Y):- door(Y,X).

%% some facts about properties of things

edible(apple).
edible(crackers).

tastes_yuchy(broccoli).

%% inital status of flashlight

turned_off(flashlight).

%% initial location of player

here(kitchen).

%% list things for look
%% need to add another clause so it 
%% will not end in fail and can be used with other clauses

list_things(Place):-
    location(X,Place),
    tab(2),
    write(X),
    nl,
    fail.
list_things(_).

%% a similar rule to list connections

list_connections(Place):-
    connect(Place,X),
    tab(2),
    write(X),
    nl,
    fail.
list_connections(_).
 

 %% now the look command that uses list connections
 %% and list things

look:-
    here(Place),
    write('You are in the '),write(Place),nl,
    write('You can see:'),nl,
    list_things(Place), 
    write('You can go:'),nl,
    list_connections(Place).


%% look_in function for exercise

look_in(Place):-
    location(Thing,Place),
    tab(2),
    write(Thing),
    nl,
    fail.

look_in(_).

