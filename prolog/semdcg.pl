
/* --------------------------------------------------
   Usage from command line
-------------------------------------------------- */

% swipl -g "[semdcg],parse,halt."
% swipl -g "[semdcg],parse('a cat smiles','out.txt'),halt."
% swipl -g "[semdcg],parse_from_file('in.txt','out.txt'),halt."
% swipl -g "[semdcg],Exp=[_,_,_,_],s(_,Exp,[]),write(Exp),nl,fail;halt."

 
/* --------------------------------------------------
   Load other modules
-------------------------------------------------- */

:- use_module(library(porter_stem)).
:- use_module(betaConversion,[betaConvert/2]).

:- [grammar].  % grammar and closed lexical classes
:- [lexicon].  % open lexical classes

/* -------------------------------------------------
   Main predicates
------------------------------------------------- */

parse:- 
   parse1(user_input,user_output).

parse(Atom,FileOut):-
   open(FileOut,write,StreamOut),
   downcase_atom(Atom,Down),
   tokenize_atom(Down,Tokens),
   interpret(Tokens,StreamOut),
   close(StreamOut).

parse_from_file(FileIn,FileOut):-
   open(FileIn,read,StreamIn),
   open(FileOut,write,StreamOut),
   parseN(StreamIn,StreamOut),
   close(StreamIn),
   close(StreamOut).



/* ------------------------------------------------
   Tokenizing and parsing (one sentence)
------------------------------------------------ */

parse1(StreamIn,StreamOut):-
   read_line_to_codes(StreamIn,Input),
   atom_codes(Atom,Input), 
   downcase_atom(Atom,Down),
   tokenize_atom(Down,Tokens),
   interpret(Tokens,StreamOut).


/* ------------------------------------------------
   Tokenizing and parsing (multiple sentences)
------------------------------------------------ */

parseN(StreamIn,StreamOut):-
   read_line_to_codes(StreamIn,Input),
   parseN(StreamIn,Input,StreamOut).

parseN(_,end_of_file,_):- !.

parseN(StreamIn,Input,StreamOut):-
   atom_codes(Atom,Input), 
   downcase_atom(Atom,Down),
   tokenize_atom(Down,Tokens),
   interpret(Tokens,StreamOut),
   parseN(StreamIn,StreamOut).


/* ------------------------------------------------
   Interpretation
------------------------------------------------ */

interpret(Tokens,Stream):-
   s(Sem,Tokens,[]), !, 
   betaConvert(Sem,Red),
   numbervars(Red,23,_),
   format(Stream,'~p~n',[Red]).

interpret(Tokens,Stream):-
   format(Stream,'-----~nno parse for ~p~n',[Tokens]).
