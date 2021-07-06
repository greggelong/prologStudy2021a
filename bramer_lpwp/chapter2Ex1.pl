animal(mammal,tiger,carnivore,stripes).
animal(mammal,hyena,carnivore,ugly).
animal(mammal,lion,carnivore,mane).
animal(mammal,zebra,herbivore,stripes).
animal(bird,eagle,carnivore,large).
animal(bird,sparrow,scavenger,small).
animal(reptile,snake,carnivore,long).
animal(reptile,lizred,scavenger,small).

% ?- findall(X,animal(mammal, X,_,_),List).
% List = [tiger, hyena, lion, zebra].


% ?- animal(mammal,X,carnivore,_).
% X = tiger ;
% X = hyena ;
% X = lion ;

% ?- animal(reptile,X,_,mane).
% false.

% ?- animal(mammal,X,_,stripes).
% X = tiger ;
% X = zebra.