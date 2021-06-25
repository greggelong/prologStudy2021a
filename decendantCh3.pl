%% caroline is a child of bridget
%% the order is a b c d e

has_child(anne, bridget).
has_child(bridget,caroline).
has_child(caroline,donna).
has_child(donna, emily).

has_descendant(X,Y):- has_child(X,Y).

has_descendant(X,Y):- 
		has_child(X,Z),
		%%has_child(Z,Y).
		%% let's make it recursive
		has_descendant(Z,Y).

		
