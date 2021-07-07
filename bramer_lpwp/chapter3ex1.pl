
mother(ann,henry).
mother(ann,mary).
mother(jane,mark).
mother(jane,francis).
mother(annette,jonathan).
mother(mary,bill).
mother(janice,louise).
mother(lucy,janet).
mother(louise,caroline).
mother(caroline,david).
mother(caroline,janet).
mother(nancy,greg).

father(bud,nancy).
father(greg,chuco).
father(henry,jonathan).
father(john,mary).
father(francis,louise).
father(john,mark).
father(gavin,lucy).
father(john,francis).

parent(victoria,george).
parent(victoria,edward).
parent(X,Y):-mother(X,Y).
parent(X,Y):-father(X,Y).
parent(elizabeth,charles).
parent(elizabeth,andrew).

ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z), ancestor(Z,Y).

child_of(A,B):- parent(B,A).

grandfather_of(A,B):- father(A,C), parent(C,B).

grandmother_of(A,B):- mother(A,C), parent(C,B).

great_grandfather(A,B):- grandfather_of(A,C), parent(C,B).