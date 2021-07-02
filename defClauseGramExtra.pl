/*

Changing a simple grammar to deal with a more realistic and 

grammars such as accounting for subject/object, singular/plural, gender, etc

are a topic I have dealt with before in Python and JavaScript 

and I have dealt with them in, what LPN refers to as the naive way, by adding 

extra clauses to capture subject and object ect.

https://github.com/greggelong/cfg_description

This has the benefit of being explicit and easy to read at least.



 s  -->  np_subject,vp.
   
   np_subject  -->  det,n.
   np_object    -->  det,n.
   np_subject  -->  pro_subject.
   np_object    -->  pro_object.
   
   vp  -->  v,np_object.
   vp  -->  v.
   
   det  -->  [the].
   det  -->  [a].
   
   n  -->  [woman].
   n  -->  [man].
   
   pro_subject  -->  [he].
   pro_subject  -->  [she].
   pro_object  -->  [him].
   pro_object  -->  [her].
   
   v  -->  [shoots]. 


   but it can be improved on by simply adding extra arguments. 
   in the following un-commented code.

   */

s --> np(subject), vp. % pronoun must be a subject form in the subject

np(_) --> det, n.  % sub and ob have same form for noun eg the man shoots the man
np(X) --> pro(X).  % sub and ob are different for pro nouns he shoots him
% so the extra argument needs to be passed, add there is no determiner.

vp --> v, np(object). % pronoun must be an object form in the predicate.
vp --> v.  

%% Both definite and indefinite articles are types of determiners. in this grammar

det --> [the].
det --> [a].

n --> [woman].
n --> [man].

%% the pronoun clause has cases for each argument subject and object
pro(subject) --> [he].
pro(subject) --> [she].
pro(object) --> [him].
pro(object) --> [her].

v --> [shoots].


/*

you can see how it works from the prolog terminal

?- np(object,X,[]).
X = [the, woman] ;
X = [the, man] ;
X = [a, woman] ;
X = [a, man] ;
X = [him] ;
X = [her].

?- np(subject,X,[]).
X = [the, woman] ;
X = [the, man] ;
X = [a, woman] ;
X = [a, man] ;
X = [he] ;
X = [she].

*/