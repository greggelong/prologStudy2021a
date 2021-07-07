average1(A,B,C):- C is (A+B)/2, write(C), nl.

sqprod(A,B,C):- C is sqrt(A*B), write(C), nl.

larger(A,B):- A > B, write(A).
larger(A,B):- A < B, write(B).
larger(A,B):- A == B, write(same).





