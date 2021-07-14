## Learn Prolog now Notes

Coming back to prolog after a few years of putting it on the back burner.

link to earlier repositories:
https://github.com/greggelong/greg-family

I am using both SWI-prolog and GNU-prolog.

There are some differences in the procedural input and output and  of each.

but the declarative logic programing is mostly identical.

I am mostly working on my new Surface Laptop Go Model 1943 i5

and I am using a I have SWI prolog on the Windows 10.

but I also have a copy running from my Linux Ubuntu system

I can access the folder on the windows c drive using this path

/mnt/c/Users/gkrei/Documents/Prolog/prologStudy2021

I set up visual studio code to wit vsc-prolog which works pretty well.

with the Linux subsystem I can run the code if I first

do a command Terminal:Create New Integrated Terminal with Profile

and choose the Ubuntu Linux as the subsystem.




I have also linked VS code  with my github and published the folder there

Now I am editing the document on my Linux Dell after having cloned the repo

using $ git clone https://github.com/greggelong/prologStudy2021a.git

I will do the next Chapter of learn prolog now on my dell. and push the 

changes. I like working with prolog on my Dell and since I am not writing 

demanding JavaScript for the browser my slow computer works just fine

also It will hep me review my command line git. Which has become pretty rusty


I have just changed and pushed the above from my Dell 

now I am making changes to the readme directly on GitHub 

to see if I can pull the changes ;)

### some git notes: just about all the git i will need

git clone 

git status 

- if changes this will give an option to git add or 
- they changed files will be in red

git add {file name}  // or git add .  for multiple files

git status // again to see the files ready to 

git commit -m "some message"

git push origin master  

the origin is set from the clone

then you enter GitHub user name and password

then if I have made changes on the other computer or github directly use first use

git fetch //to see if there are any changes

git status // to see what to do

git pull  // to pull the changes

another small change ;0 let's see if i can see it with a git status from dell

i saw it

when working on swipl from Linux terminal you can use 

the command 'make.'  to reload changed files.

More git stuff:

it's been a while since i have been pushing and pulling

and GitHub has changed it authentication policy

Basic authentication using a password to Git is deprecated 

and will soon no longer work. 

so I made a token and I will try that pat.


***
Git on VS code on surface laptop go 

remember you also need to commit then push changes made here

you do it through source control with the check and message and then

push to github from the ... menu





## lists chapter 4

Prolog lists are really something else. 

They don't really have indexes as in other procedural programing languages.  

they just use things like []  and | to divide head from tail

and if you need to search through a list you use recursion

but some really cool stuff can just with pattern matching

take for example exercise 4.4 from learn prolong now:

> Exercise  4.4 Write a predicate swap12(List1,List2) which checks whether List1 is identical to List2 , except that the first two elements are exchanged. 


``` prolog

swap12([X,Y|Z],[Y,X|Z]).

```

To do this you don't even need to loop through the list 

just divide the head and tail in the right place and 

unification and matching.  


```prolog

tran(jedan,one).
tran(dva,two).
tran(tri,three).
tran(cetiri,four).
tran(pet,five).
tran(sest,six).
tran(sedam,seven).
tran(osam,eight).
tran(devet,nine). 


listtran([],[]).

listtran([G|Tg],[E|Te]):-
  tran(G,E),
  listtran(Tg,Te).

```

This is a simple list translator for numbers in Serbian

and English it is based on the list exercises


## chapter 5 introduces Arithmetic and its use in lists

look at this clause to check if something is even

```prolog
isEven(X):- 0 is mod(X,2).

```

so elegant and simple

'is' tells Prolog not to treat it as a regular term.

and How do you get a length of a list

well, you use logic

```prolog
len([],0).
len([_|T],N):- 
	len(T,X),
	N is X +1.

```

See this great video. He steps us through the stack,

of recursive calls. You can also put on trace and follow it

through a query of len([1,2,3,4],X).


https://www.youtube.com/watch?v=xl7NzdcgqXo


## chapter 6 more lists 

I made a solver for the red blue green house puzzle.

I did not only solve for zebra but coded up all the rules in 

a very explicit way.  I assumed that the meaning of to the right or to the 

left of meant to the right of or left of on the street and not immediately 

to the right of or left of.  I came to the format thinking about defining

grammars. Which is the topic of Chapter 7.

```prolog
s(X):- X = [_,_,_], 
	member(house(red,english,_),X),
	member(house(_,spanish,jaguar),X),
	member(house(_,japanese,_),X),
	member(house(blue,_,_),X),
	member(house(green,_,_),X),
	member(house(_,_,snail),X),
	member(house(_,_,zebra),X),
	%% japanese lives to the  right of snail  Note I needed to add round bracketes
	(X = [house(_,_,snail),house(_,japanese,_),_];
	X = [_,house(_,_,snail),house(_,japanese,_)];
	X = [house(_,_,snail),_,house(_,japanese,_)]),
	%% snail keeper lives to the left of blue house
	(X = [house(_,_,snail),house(blue,_,_),_];
	X = [_,house(_,_,snail),house(blue,_,_)];
	X = [house(_,_,snail),_,house(blue,_,_)]).

```

---

### note on swi prolog use 

 working_directory(_,'c:/users/english teacher/documents/prologStudy2021a').

 using this to change the directory on swi-prolog at school.

  working_directory(_,'C:/Users/gkrei/Documents/Prolog/prologStudy2021/').

  using this to change the directory os swi-prolog for windows 10 at home.  


## Chapter seven Context Free Grammars and Definite Clause Grammars


I have written more than a few scripts in javaScript and 

Python using context free grammars.  I have used them to 

create L-systems for fractals, generate sentences in English 

and Chinese and even used them to simulate Cuko the dog.

In Prolog the main advantage is that the grammar works easily in both directions.

It can recognize syntactically correct sentences as well as create them with 

a simple prompt.  

Definite Clause Grammars are:

> essentially syntactic sugar, user-friendly notation that lets us write grammars in a natural way.

here is a simple example.

```prolog

s --> np, vp.

np --> det, n.

vp --> v, np.
vp --> v.

det --> [the].
det --> [a].

n --> [woman].
n --> [man].

v --> [shoots].

```

is actually compiled and saved in prolog as:

```prolog

s(X,Z):- np(X,Y), vp(Y,Z).

np(X,Z):- det(X,Y), n(Y,Z).

vp(X,Z):- v(X,Y), np(Y,Z).

vp(X,Z):- v(X,Z).

det([the|W], W).
det([a|W],W).

n([woman|W],W).
n([man|W], W).

v([shoots|W],W).

```

## Chapter eight More definite clause grammar.

Changing a simple grammar to deal with a more realistic and complex 

grammar syntax (such as accounting for subject/object, singular/plural, gender, etc. . .)

can present challenges.

I have dealt with before in Python and JavaScript 

and I have dealt with them in, what LPN refers to as the naive way, by adding 

extra clauses to capture subject and object or singular plural.

See my javaScript context free grammar:

https://github.com/greggelong/cfg_description

Although naive as it may be, it has the benefit of being explicit and easy to read.

but you can improve this by adding arguments to clauses in the grammar.

For example, the 'np' noun phrase clause can be modified to take an argument, np(X).

In the example below it can be used to ensure that a noun phrase in the subject 

uses a subjective pronoun, and a noun phrase in the predicate uses a objective pronoun.

```prolog

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


```

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


## Max Bramer Logic Programming with Prolog

After finishing with learning prolog now

I am going on to the most recent prolog book

LPWP the second edition in 2013  not that  recent

but pretty good for a prolog book.  

Bramer's style is very different. It appeals to the imperative programer in me

that wants to do things.  Like print, convert, find.  As opposed to the declarative programmer

that is all about the logic of the clauses.  A good example of this is he has so far used

recursion in several examples but did not devote a chapter to it as other prolog books do.

And in Chapter 5 we already cover input and output with out having discussed more prolog-y topics

like lists.  

His exercises also are somewhat imperative in out look for example

in the chapter 4 on mathematical operations he has you write 

a clause that gets an average of two numbers, but he does not make you 

unify the two to some third variable. for example average(Num1,num2,AVG).

he just has you write the answer as output.  



## Turbo Prolog

A real blast from the past.  I am now using DosBox to run 

Borland's Turbo Prolog.  I used this in my under-grad days.

I was given a free copy by my teacher.  At the time

I found it very difficult to understand logic programming

having only done procedural programming.  

It is similar to standard prolog.

I love the interface.  It is really time travelling to go

through the Turbo prolog book and exercises.

![turboProlog.png](/turboProlog/turboProlog.png)



## Adventure in prolog also going through Merritt's book

Aip is fun and I have included in the folder an adventure game 

about my childhood home that in the same spirit of the book.

Merritt has you apply forced failure and backtracking to look around 

rooms.  He has you use dynamic predicates to manipulate the world.

I translated similar logic to python and javaScript but the here the interaction is 

by checking in a list, dictionary or object.  

In chapter 3 

Merritt gives a nice example of the declarative and procedural meaning of prolog code

The query: 

?- location(X,kitchen), edible(X).

Has two interpretations, declarative and procedural

Logically (declaratively) it means "Is there an X such that X
is located in the kitchen and X is edible?" 

The procedural interpretation is: "First find an X located in the kitchen, and then test to see if it is
edible. If it is not, go back and find another X in the kitchen and test it.
Repeat until successful, or until there are no more XS in the kitchen. "


## N.B. in Chapter seven you must use the anonymous variable _

With swi-prolog :

you must use the anonymous variable when retracting the dynamic here/1 clause 

it must also be marked as dynamic using the at the top of the knowledge base  :- dynamic here/1.

here wasn't being retracted with a regular variable and can lead to being in more than one place

at a time.  

```prolog

move(Place):-
    can_go(Place),
    retract(here(_)),
    asserta(here(Place)),
    look.


```
