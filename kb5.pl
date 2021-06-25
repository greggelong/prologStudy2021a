loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).
   
jealous(X,Y):-  
	loves(X,Z),  
	loves(Y,Z),
	X \= Y.

%% without checking if X = Y
%% ?- jealous(Who1,Who2).
%% Who1 = Who2, Who2 = vincent ;
%% Who1 = vincent,
%% Who2 = marsellus ;
%% Who1 = marsellus,
%% Who2 = vincent ;
%% Who1 = Who2, Who2 = marsellus ;
%% Who1 = Who2, Who2 = pumpkin ;
%% Who1 = Who2, Who2 = honey_bunny.

%% after adding X\=Y.
%% ?- jealous(Who1,Who2).
%% Who1 = vincent,
%% Who2 = marsellus ;
%% Who1 = marsellus,
%% Who2 = vincent ;