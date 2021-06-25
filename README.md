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

with the linux subsystem I can run the code if I first

do a command Terminal:Create New Integrated Terminal with Profile

and choose the Ubuntu Linux as the subsystem.




I have also linked VS code  with my github and published the folder there

Now I am editing the document on my Linux Dell after having cloned the repo

using $ git clone https://github.com/greggelong/prologStudy2021a.git

I will do the next Chapter of learn prolog now on my dell. and push the 

changes. I like working with proglog on my Dell and since I am not writing 

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

unification and 



