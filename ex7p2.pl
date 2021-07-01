/*
need to change the first s clause
from 
s --> [].  empty

to
s -- [ab].

if you just comment out the  empty set clause and don't add 
an escape you will overflow your stack

*/

% two ways to do it

s --> l,r.
%s --> [ab].  
s --> l,s,r.

l --> [a].
r --> [b].