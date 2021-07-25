:- use_module(library(turtlee)).


go:-
	turtle_init,
	write("initialized turtle"),nl,
	%% turtle_moveto(-120,0),
	drawside(300,3).

drawside(Length,0):- turtle_draw(Length).

drawside(Length,Level):-
		NewLen is Length/3,
		NewLev is Level -1,
		drawside(NewLen,NewLev),
		turtle_turn(60),
		drawside(NewLen,NewLev),
		turtle_turn(-120),
		drawside(NewLen,NewLev),
		turtle_turn(60),
		drawside(NewLen,NewLev).











