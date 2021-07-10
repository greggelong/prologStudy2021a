/* added touch thing that uses member to check if it ist there 
and bang that is just for the radiator 
a loc_list list_things that work from a call
to room(R,F) */



:- dynamic here/1. 
:- dynamic key_place/2.
:- dynamic have_key/1.


room(kitchen,'second floor').
room('living room','second floor').
room(bathroom,'second floor').
room('back bedroom','second floor').
room('front bedroom','second floor').
room('back closet','second floor').
room('front closet','second floor').
room('back porch','second floor').
room('front porch','second floor').
room('back porch stairs','second floor').

room('back porch stairs','first floor').
room(kitchen,'first floor').
room('living room','first floor').
room(bathroom,'first floor').
room('back bedroom','first floor').
room('front bedroom','first floor').
room('back closet','first floor').
room('front closet','first floor').
room('back porch','first floor').
room('front porch','first floor').
room('yard stairs','first floor').
room('basement stairs','first floor').

room('yard stairs',yard).
room('concrete patch',yard).
room('grass patch',yard).
room(shed,yard).
room('outside basement stairs',yard).

 
room('outside basement stairs',basement).
room('basement stairs',basement).
room('work shop',basement).
room(furnace,basement).
room('toilet',basement).
room('front room',basement).

room_list:- bagof(Room,room(Room,Floor),List), write(List),nl.
 

door(room(kitchen,'second floor'), room('back bedroom','second floor')).
door(room('back porch','second floor'), room(kitchen,'second floor')).
door(room(kitchen,'second floor'), room('living room','second floor')).
door(room(kitchen,'second floor'), room(bathroom,'second floor')).
door(room('living room','second floor'), room(bathroom,'second floor')).
door(room('living room','second floor'), room('front bedroom','second floor')).
door(room('living room','second floor'), room('front porch','second floor')).
door(room('front bedroom','second floor'), room('front porch','second floor')).
door(room('front bedroom','second floor'), room('front closet','second floor')).
door(room('back bedroom','second floor'), room('back closet','second floor')).
door(room('front closet','second floor'), room('back closet','second floor')).
door(room('back porch','second floor'), room('back porch stairs','second floor')).
%% door(room('back porch stairs','second floor'), room('back porch stairs','first floor')). dont need connet just chek if on stairs is enough
door(room('back porch stairs','first floor'), room('back porch','first floor')).
door(room('back porch','first floor'),room('yard stairs','first floor')).

door(room(kitchen,'first floor'), room('back bedroom','first floor')).
door(room('back porch','first floor'), room(kitchen,'first floor')).
door(room(kitchen,'first floor'), room('living room','first floor')).
door(room(kitchen,'first floor'), room(bathroom,'first floor')).
door(room('living room','first floor'), room(bathroom,'first floor')).
door(room('living room','first floor'), room('front bedroom','first floor')).
door(room('living room','first floor'), room('front porch','first floor')).
door(room('front bedroom','first floor'), room('front porch','first floor')).
door(room('front bedroom','first floor'), room('front closet','first floor')).
door(room('back bedroom','first floor'), room('back closet','first floor')).
door(room('back bedroom','first floor'),room('basement stairs','first floor')).
door(room('front closet','first floor'), room('back closet','first floor')).
 
door(room('basement stairs',basement),room('work shop',basement)).
door(room('work shop',basement),room('front room',basement)).
door(room('work shop',basement),room(furnace,basement)).
door(room('front room',basement),room('toilet',basement)).
door(room('front room',basement),room('outside basement stairs',basement)).


door(room('concrete patch',yard),room('outside basement stairs',yard)).
door(room('yard stairs',yard),room('concrete patch',yard)).
door(room('concrete patch',yard),room('grass patch',yard)).
door(room('grass patch',yard),room(shed,yard)).

connect(X,Y):- door(X,Y).
connect(X,Y):- door(Y,X).

hide_rec:-
	random_select(Place,[room('living room','second floor'), room('front bedroom','second floor'), room(bathroom,'second floor'),room('front porch','second floor'),room(kitchen,'second floor')],_),
	write(Place),nl,
	asserta(key_place(record,Place)).

loc_list(['pale green fridge', table, 'four chairs', 'homemade curtians over windows', radiator, 'bright yellow wall mounted dial telephone with handset and coil cord'], room(kitchen,'second floor')).
loc_list(['trundle bed', bookcase, 'dresser', 'homemade curtians over windows', radiator, recordplayer, toys], room('back bedroom','second floor')).



here(room(kitchen,'second floor')).


list_connections(room(R,F)):-
	connect(room(R,F),room(Ra,_)),
	tab(2),
	write(Ra),
	nl,
	fail.
list_connections(_).

list_things(room(R,F)):-
	loc_list(List,room(R,F)),
	member(X,List),
	tab(2),
	write(X),
	nl,
	fail.
list_things(_).	

list_keys(room(R,F)):-
	key_place(Key,room(R,F)),
	tab(2),
	write(Key),
	nl,
	fail.  %% incase more than one key in a room force backtrack
list_keys(_).		


look:-
	here(room(R,F)),
	write('you are at the '),
	write(R),
	write(' on the '),
	write(F),nl,
	write('You can see:'),nl,
	list_things(room(R,F)),
	list_keys(room(R,F)),
	write('you can go to '),nl,
	list_connections(room(R,F)).
	
goto(Place):-         %% page 63
	can_go(Place),
	move(Place),
	look.

touch(record):-
	here(room(R,F)),
	key_place(record,room(R,F)),
	write('You picked up the record, and found the FIRST KEY!!!'),nl,
	retract(key_place(record,room(R,F))),
	asserta(have_key(record)).
	
	
touch(recordplayer):-
	here(room('back bedroom','second floor')),
	have_key(record),
	write('You put on Burl Ives, he is singing The Little White Duck'),nl,
	write('Quack, quack, quack'),nl,
	write('You have solved the first puzzle'),nl,
	!.  %% stop bactracking 
	
touch(recordplayer):-
	here(room('back bedroom','second floor')),nl,
	write('You need a record').
	
	
		
	
	
touch(toys):- 
	here(room('back bedroom','second floor')),
	write('Hi! I am the Six Million Dollar Man action figure'),nl.

touch(Thing):- 
	member(Thing,[and,the,green,over]), %% add words that you dont woant to touch
	write('You can''t touch that!'),
	!. %% fail .  %% tried with negation but it didnt work so did it this way 
%% but pay attention this touch returns false while the othere three return true
%% cut works just fine on its own dont need a fail now it returns true like the other three 
touch(Thing):-
	here(room(R,F)),
	loc_list(List,room(R,F)), %% maybe you could fide string function that would allow you to look for a word in the string in the list
	member(Thing,List),  
	write('you are touching the '),
	write(Thing),
	nl.

touch(Thing):-
	here(room(R,F)),
	loc_list(List,room(R,F)),
	member(String,List),
	atomic_list_concat(Slist, ' ',String), %% found it  atomic_list_concat
	member(Thing,Slist),
	
	write('you are touching the '),
	write(Thing),
	nl.
touch(Thing):-
	write('there is no '), write(Thing), write(' here'),
	nl.

bang_on(radiator):-
	here(room(R,F)),
	loc_list(List,room(R,F)), %% maybe you could fide string function that would allow you to look for a word in the string in the list
	member(radiator,List),  
	write('you are sending a message by banging on the radiator!'),nl,
	write('BANG BANG BANG'),
	nl.
	
bang_on(_):-
	write('Don''t bang on that!!!'),
	nl.	

down:-
	here(room('back porch stairs','second floor')),
	retract(here(_)),   
	asserta(here(room('back porch stairs','first floor'))),
	look.
down:-
	here(room('yard stairs','first floor')),
	retract(here(_)),   
	asserta(here(room('yard stairs',yard))),
	look.
down:-
	here(room('basement stairs','first floor')),
	retract(here(_)),   
	asserta(here(room('basement stairs',basement))),
	look.
down:-
	here(room('outside basement stairs',yard)),
	retract(here(_)),   
	asserta(here(room('outside basement stairs',basement))),
	look.

down:-
	write('you are not on the stairs'),nl,
	fail.



up:-
	here(room('back porch stairs','first floor')),
	retract(here(_)),   
	asserta(here(room('back porch stairs','second floor'))),
	look.
up:-
	here(room('yard stairs',yard)),
	retract(here(_)),   
	asserta(here(room('yard stairs','first floor'))),
	look.
up:-
	here(room('basement stairs',basement)),
	retract(here(_)),   
	asserta(here(room('basement stairs','first floor'))),
	look.
up:-
	here(room('outside basement stairs',basement)),
	retract(here(_)),   
	asserta(here(room('outside basement stairs',yard))),
	look.
up:-
	write('you are not on the stairs'),nl,
	fail.
 
	
can_go(Place):-
	here(room(X,Floor)),   %% floor checks which floor you are on 
	connect(room(Place,Floor),room(X,Floor));
	connect(room(Place,_),room(stairs,_)).
can_go(_):-
	write('You can''t get there from here'),nl, %% put two single quotes for contractions
	fail.
	
move(Place):-             
	retract(here(room(_,Floor))),  %% so not to get a singleton v 
	asserta(here(room(Place,Floor))).


map:-
	here(room(_,'second floor')),
	write('               Second Floor                    '),nl,
	write('    ---------------------------------------    '),nl,
	write(' B  |               |b| |                  |F  '),nl,
	write(' a  | back bedroom  |c|f|   front bedroom  |r  '),nl,
	write(' c P|               | |c|                   o P'),nl,
	write(' k o|------  -------------------  ---------|n o'),nl,
	write('   r|                                      |t r'),nl,
	write(' = c   kitchen      |Bath|   living room      c'),nl,
	write(' = h|               |Room|                 |  h'),nl,
	write(' =  ---------------------------------------    '),nl,
	nl.

map:-
	here(room(_,'first floor')),
	write('                First Floor                    '),nl,
	write('    ---------------------------------------    '),nl,
	write(' B  |            ||||b| |                  |F  '),nl,
	write(' a  | back bedroom  |c|f|   front bedroom  |r  '),nl,
	write(' c P|               | |c|                  |o P'),nl,
	write(' k o|------  -------------------  ---------|n o'),nl,
	write('   r|                                      |t r'),nl,
	write(' = c   kitchen      |Bath|   living room      c'),nl,
	write(' = h|               |Room|                 |  h'),nl,
	write(' =  ---------------------------------------    '),nl,
	nl.

map:-
	here(room(_,yard)),
	write('                    Yard                 '),nl,
	write('    ------------------------------------- '),nl,
	write(' B  |      |         |                  | B'),nl,
	write(' r  | shed |         |                  | a'),nl,
	write(' i W|      |         |    concrete   |||||s'),nl,
	write(' c a|-------         |      patch       | e'),nl,
	write(' k l|      grass     |                  | m'),nl,
	write('   l|       patch    |              ||||| e'),nl,
	write('    |                |                  | n'),nl,
	write('    ------------------------------------- t'),nl,
	nl.

map:-
	here(room(_,basement)),
	write('                 Basement                 '),nl,
	write('   ---------------------------------------'),nl,
	write(' B | toilet|  furnace   ||||              |'),nl,
	write(' a |-------- -----------      work room   |'),nl,
	write(' c ||||                   |               |'),nl,
	write(' k |                      |---------------|'),nl,
	write('   |      front room                      |'),nl,
	write('   |                                      |'),nl,
	write('   |                                      |'),nl,
	write('    -------------------------------------- '),nl,
	nl.
