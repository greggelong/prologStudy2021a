loop(0).

loop(N):- 
    N > 0, 
    write('The value is: '),write(N), nl,
    M is N-1,
    loop(M).

%% terminates recursion when range is same number
range(Last,Last):- write(Last),nl, write('end'),nl.

range(First,Last):- 
        First =\=Last,
        write(First), nl,
        N is First+1,
        range(N,Last).

sumto(1,1).

sumto(N,S):-  
        N>1, 
        N1 is N-1,
        sumto(N1,S1),
        S is S1+N.

sqrRange(First,First):- Sq is First^2, write(First), write(" sq "), write(Sq), nl.

sqrRange(First,Last):- 
        First=\=Last,
        Sq is First^2, % calculate the sqr
        write(First), write(" sq "), write(Sq), nl,
        N is First+1, % increace to last
        sqrRange(N,Last).
