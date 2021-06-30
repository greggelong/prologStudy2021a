s(X):- X = [_,_,_], 
	member(house(red,english,_),X),
	member(house(_,spanish,jaguar),X),
	member(house(_,japanese,_),X),
	member(house(blue,_,_),X),
	member(house(green,_,_),X),
	member(house(_,_,snail),X),
	member(house(_,_,zebra),X),
	%% japanese lives to the  right of snail  Note I needed to add round bracketes
	(X = [house(_,_,snail),house(_,japanese,_),_];
	X = [_,house(_,_,snail),house(_,japanese,_)];
	X = [house(_,_,snail),_,house(_,japanese,_)]),
	%% snail keeper lives to the left of blue house
	(X = [house(_,_,snail),house(blue,_,_),_];
	X = [_,house(_,_,snail),house(blue,_,_)];
	X = [house(_,_,snail),_,house(blue,_,_)]).




