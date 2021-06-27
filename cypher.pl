

caesar(a,z).
caesar(b,a).
caesar(c,b).
caesar(d,c).
caesar(e,d).
caesar(f,e).
caesar(g,f).
caesar(h,g).
caesar(i,h).
caesar(j,i).
caesar(k,j).
caesar(l,k).
caesar(m,l).
caesar(n,m).
caesar(o,n).
caesar(p,o).
caesar(q,p).
caesar(r,q).
caesar(s,r).
caesar(t,s).
caesar(u,t).
caesar(v,u).
caesar(w,v).
caesar(x,w).
caesar(y,x).
caesar(z,y).

%% cipher(EnglishList,CodedList).

% ?- cipher([g,r,e,g],X).
% X = [f, q, d, f].

% ?- cipher(X,[f,q,d,f]).
% X = [g, r, e, g].



cipher([],[]).

cipher([H1|T1],[H2|T2]):-
    caesar(H1,H2),
    cipher(T1,T2).
    