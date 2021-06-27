% google coding interview questions solved in prolog. 
% the sumof2 clause  or twoSum clauses do not need to be recursive themselves.
% The clauses use the recursion in member and backtracking to get the answers
% will only print the true cases

%[3, 5, 2, -4, 8, 11] and the sum is 7
/*

?- twoSum([3, 5, 2, -4, 8, 11],7).
5 + 2 = 7
true ;
2 + 5 = 7
true ;
-4 + 11 = 7
true ;
11 + -4 = 7
true ;

?- sumof2([0,0,-5,30212],[-10,40,-3,9],-8).
-5 + -3 = -8
true ; 
*/


sumof2(List1,List2,Num):-
    member(Mem1,List1),
    member(Mem2,List2),
    Num is Mem1 + Mem2,
    write(Mem1), write(' + '),write(Mem2), write(' = '),write(Num).


twoSum(List,Num):-
    member(Mem1,List),
    member(Mem2,List),
    Num is Mem1 + Mem2,
    write(Mem1), write(' + '),write(Mem2), write(' = '),write(Num).