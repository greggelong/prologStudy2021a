easy(1).
easy(2).
easy(3).

gizmo(a,1).
gizmo(b,3).
gizmo(a,2).
gizmo(d,5).
gizmo(c,3).
gizmo(a,3).
gizmo(c,4).


harder(a,1).
harder(c,X).
harder(b,4).
harder(d,2).


/*
?- harder(a,X).
X = 1.

?- harder(c,X).
true.

?- harder(X,1).
X = a ;
X = c ;
false.

?- harder(X,4).
X = c ;
X = b ;


*/


