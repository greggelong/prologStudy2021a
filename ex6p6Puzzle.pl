 

%% I couldnt set this up on my own
%% still need to look it up

prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).
sublist(SubL,L) :- suffix(S,L), prefix(SubL,S).

zebra_owner(ZebraOwner) :-
    Street = [_, _, _],
    member(house(red, englishman, _), Street),
    member(house(_, spanish, jaguar), Street),
    member(house(_, ZebraOwner, zebra), Street),
    sublist([house(_, _, snail), house(_, japanese, _)], Street),
    sublist([house(_, _, snail), house(blue, _, _)], Street).