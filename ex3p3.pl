directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz). 
%% needed to add another clause to say if you have a direct train
%% that you are connected in both directions.


connected(X,Y):- directTrain(Y,X).

travelFromTo(X,Y):- directTrain(X,Y).

travelFromTo(X,Y):- connected(X,Y).

travelFromTo(X,Y):- 
   connected(X,Z);
   directTrain(X,Z),
   travelFromTo(Z,Y),
   X \= Y.


list_connections(Place):-
   connected(Place,X),
   tab(2),
   write(X),
   nl,
   fail.
list_connections(_). 
