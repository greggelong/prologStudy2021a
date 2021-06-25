tran(jedan,one).
tran(dva,two).
tran(tri,three).
tran(cetiri,four).
tran(pet,five).
tran(sest,six).
tran(sedam,seven).
tran(osam,eight).
tran(devet,nine). 


listtran([],[]).

listtran([G|Tg],[E|Te]):-
  tran(G,E),
  listtran(Tg,Te).