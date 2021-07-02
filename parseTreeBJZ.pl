%% After all, in effect a DCG has to work out what the tree structure is when recognising a sentence. 
%% So we just need to find a way of keeping track of the structure that the DCG finds. 
%% We do this by adding extra arguments. Here’s how: 

s(s(NP,VP)) --> np(NP), vp(VP).

np(np(DET,N)) --> det(DET), n(N).

vp(vp(V,NP)) --> v(V), np(NP).
vp(v(V)) --> v(V).

det(det(the)) --> [the].  % need to add the content to both the extra argument and the list
det(det(a)) --> [a].

n(n(woman)) --> [woman].
n(n(man)) --> [man].

v(v(shoots)) --> [shoots].


/*
?- s(Tree, [a, woman, shoots],[]).
Tree = s(np(det(a), n(woman)), v(v(shoots))).

?- s(Tree, Sent,[]).
Tree = s(np(det(the), n(woman)), vp(v(shoots), np(det(the), n(woman)))),
Sent = [the, woman, shoots, the, woman] ;
Tree = s(np(det(the), n(woman)), vp(v(shoots), np(det(the), n(man)))),
Sent = [the, woman, shoots, the, man] ;
Tree = s(np(det(the), n(woman)), vp(v(shoots), np(det(a), n(woman)))),
Sent = [the, woman, shoots, a, woman] ;
Tree = s(np(det(the), n(woman)), vp(v(shoots), np(det(a), n(man)))),
Sent = [the, woman, shoots, a, man] ;
Tree = s(np(det(the), n(woman)), v(v(shoots))),
Sent = [the, woman, shoots] ;
Tree = s(np(det(the), n(man)), vp(v(shoots), np(det(the), n(woman)))),
Sent = [the, man, shoots, the, woman] ;
Tree = s(np(det(the), n(man)), vp(v(shoots), np(det(the), n(man)))),
Sent = [the, man, shoots, the, man] ;
Tree = s(np(det(the), n(man)), vp(v(shoots), np(det(a), n(woman)))),
Sent = [the, man, shoots, a, woman] ;
Tree = s(np(det(the), n(man)), vp(v(shoots), np(det(a), n(man)))),
Sent = [the, man, shoots, a, man] ;
Tree = s(np(det(the), n(man)), v(v(shoots))),
Sent = [the, man, shoots] 

*/