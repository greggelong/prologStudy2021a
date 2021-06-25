happy(vincent).
listens2Music(butch).
playsAirGuitar(vincent):-
	listens2Music(vincent),
	happ(vincent).
playsAirGuitar(butch):-
	happy(butch).
playsAirGuitar(butch):-
	listens2Music(butch).

%% or playsAirGuitar(butch) has two rules for locical disjuction 
%% but could be done with one and ;
%% playsAirGuitar(butch):-
%% 	happy(butch);
%%   listens2Music(butch).
%%
