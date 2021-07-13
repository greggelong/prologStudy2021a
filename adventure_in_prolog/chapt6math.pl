c_to_f(C,F):-
	F is C * 9/5 +32.

f_to_c(F,C):-
	C is (F-32)*5/9.
	

%% only works one direction
%% the is not straight patern matching
%% is just evaluaties the arithmetich expression
/*
?- c_to_f(C,100).
ERROR: Arguments are not sufficiently instantiated
ERROR: In:
ERROR:    [9] 100 is ... / 5+32
ERROR:    [7] <user>
ERROR: 

*/



freezing(F):-
	F =< 32.
