%% see this great video. He steps us through the stack
%% https://www.youtube.com/watch?v=xl7NzdcgqXo


len([],0).
len([_|T],N):- 
	len(T,X),
	N is X +1.



%% accumulator length
%% accLen(List,Acc,Length)

accLen([_|T],A,L):- 
	Anew is A+1,
	%%write(Anew),write('  '),
	%%write(T),nl,  

	accLen(T,Anew,L).

accLen([],A,A).


%% this extra predicate so it is simple  to call

leng(List,Length):- accLen(List,0,Length).



