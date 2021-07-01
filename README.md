## Learn Prolog now Notes

Coming back to after a few years of it on the back burner

I am using both SWI-prolog and GNU-prolog

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


## Chapter seven Context Free Grammars and Definite Clause Grammars


I have written more than a few scrips in javaScript and 

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