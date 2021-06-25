%%This records the obvious fact that the empty list contains exactly as many a s as b s.

a2b([],[]).

a2b([a|Ta], [b|Tb]):- a2b(Ta,Tb).

