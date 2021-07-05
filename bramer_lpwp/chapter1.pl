dog(fido).
dog(rover).
dog(tom).
dog(henry).
cat(mary).
cat(harry).
cat(bill).
cat(steve).

animal(X):- dog(X).
animal(X):- cat(X).


% ?- findall(X,animal(X),List).
% List = [fido, rover, tom, henry, mary, harry, bill, steve].

% ?- findall(X,dog(X),List).
% List = [fido, rover, tom, henry].

% ?- findall(X,cat(X),List).
% List = [mary, harry, bill, steve].


