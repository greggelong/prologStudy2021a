word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big kahuna burger').
word(noun, hedgehog).
word(verb,eats).
word(verb,likes).
word(inter,who).
word(inter,what).
word(inter,when).
word(be, is).


question(Word1,Word2,Word3,Word4):-
		word(inter, Word1),
		word(be, Word2),
		word(determiner, Word3),
		word(noun, Word4),
		write(Word1), write(" "),
		write(Word2), write(" "),
		write(Word3), write(" "),
		write(Word4), write(" ").


sentence(Word1,Word2,Word3,Word4,Word5):-
		word(determiner,Word1),
		word(noun,Word2),
		word(verb,Word3),
		word(determiner,Word4),
		word(noun,Word5),
		write(Word1), write(" "),
		write(Word2), write(" "),
		write(Word3), write(" "),
		write(Word4), write(" "),
		write(Word5).