
:- use_module(library(lists),[member/2, select/3]).


/* ========================================================================
   X-variant of an assignment
======================================================================== */

variant(X,G,D,[g(X,V)|H]):-
   select(g(Y,_),G,H), X==Y, !,
   member(V,D).
   

/* ========================================================================
   Existential Quantification
======================================================================== */

satisfy(some(X,Formula),model(D,F),G,true):-
   variant(X,G,D,H),
   satisfy(Formula,model(D,F),H,true).

satisfy(some(X,Formula),model(D,F),G,false):-
   var(X),
   setof(V,member(V,D),All),
   setof(V,
         (
          member(V,D),
          satisfy(Formula,model(D,F),[g(X,V)|G],false)
         ),
         All).


/*========================================================================
   Universal Quantification
========================================================================*/

satisfy(all(X,Formula),Model,G,Polarity):- 
   satisfy(not(some(X,not(Formula))),Model,G,Polarity).


/*========================================================================
   Conjunction
========================================================================*/

satisfy(and(Formula1,Formula2),Model,G,true):- 
   satisfy(Formula1,Model,G,true),
   satisfy(Formula2,Model,G,true).

satisfy(and(Formula1,Formula2),Model,G,false):- 
   satisfy(Formula1,Model,G,false);
   satisfy(Formula2,Model,G,false).


/*========================================================================
   Disjunction
========================================================================*/

satisfy(or(Formula1,Formula2),Model,G,true):- 
   satisfy(Formula1,Model,G,true);
   satisfy(Formula2,Model,G,true).

satisfy(or(Formula1,Formula2),Model,G,false):- 
   satisfy(Formula1,Model,G,false),
   satisfy(Formula2,Model,G,false).


/*========================================================================
   Implication
========================================================================*/

satisfy(imp(Formula1,Formula2),Model,G,Polarity):- 
   satisfy(or(not(Formula1),Formula2),Model,G,Polarity).


/*========================================================================
   Negation
========================================================================*/

satisfy(not(Formula),Model,G,true):- 
   satisfy(Formula,Model,G,false).

satisfy(not(Formula),Model,G,false):- 
   satisfy(Formula,Model,G,true).


/*========================================================================
   Equality
========================================================================*/

satisfy(eq(X,Y),Model,G,true):- 
   i(X,Model,G,Value1),
   i(Y,Model,G,Value2),
   Value1 = Value2.

satisfy(eq(X,Y),Model,G,false):- 
   i(X,Model,G,Value1),
   i(Y,Model,G,Value2),
   \+ Value1 = Value2.


/*========================================================================
   One-place predicates
========================================================================*/

satisfy(pred(Symbol,1,[Argument]),model(D,F),G,true):-
   i(Argument,model(D,F),G,Value), 
   f(1,Symbol,F,Values),  
   member(Value,Values).

satisfy(pred(Symbol,1,[Argument]),model(D,F),G,false):-
   i(Argument,model(D,F),G,Value), 
   f(1,Symbol,F,Values),  
   \+ member(Value,Values).


/*========================================================================
   Two-place predicates
========================================================================*/

satisfy(pred(Symbol,2,[Arg1,Arg2]),model(D,F),G,true):-
   i(Arg1,model(D,F),G,Value1),
   i(Arg2,model(D,F),G,Value2), 
   f(2,Symbol,F,Values),
   member((Value1,Value2),Values).

satisfy(pred(Symbol,2,[Arg1,Arg2]),model(D,F),G,false):-
   i(Arg1,model(D,F),G,Value1),
   i(Arg2,model(D,F),G,Value2), 
   f(2,Symbol,F,Values),
   \+ member((Value1,Value2),Values).


/* ========================================================================
   Interpretation of Constants and Variables
======================================================================== */

i(X,model(_,_),G,Value):- var(X), member(g(Y,Value),G), X==Y, !.
i(X,model(_,F),_,Value):- atom(X), member(f(0,X,Value),F), !.


/* ========================================================================
   Returning function value. Return empty set if symbol does not exist.
======================================================================== */

f(Arity,Symbol,F,Values):- member(f(Arity,Symbol,Values),F), !.
f(_,_,_,[]).


/* ========================================================================
   Checking well-formedness and collecting all variables
======================================================================== */

wff(some(X,F1),some(X,F2),L1,L2):- !, wff(F1,F2,[X|L1],L2).
wff(all(X,F1),all(X,F2),L1,L2):- !, wff(F1,F2,[X|L1],L2).
wff(not(F1),not(F2),L1,L2):- !, wff(F1,F2,L1,L2).
wff(and(F1,G1),and(F2,G2),L1,L3):- !, wff(F1,F2,L1,L2), wff(G1,G2,L2,L3).
wff(or(F1,G1),or(F2,G2),L1,L3):- !, wff(F1,F2,L1,L2), wff(G1,G2,L2,L3).
wff(imp(F1,G1),imp(F2,G2),L1,L3):- !, wff(F1,F2,L1,L2), wff(G1,G2,L2,L3).
wff(eq(X,Y),eq(X,Y),L,L):- !, term(X), term(Y).
wff(F,pred(Sym,1,[Term]),L,L):- F =.. [Sym,Term], !, term(Term).
wff(F,pred(Sym,2,[Term1,Term2]),L,L):- F =.. [Sym,Term1,Term2], !, term(Term1), term(Term2).


/* ========================================================================
   Checking Terms
======================================================================== */

term(X):- var(X), !.
term(X):- atom(X), !.


/* ========================================================================
   Initialising assignment function g
======================================================================== */

g(L1,M,G):-select(X,L1,L2), member(Y,L2), X==Y, !, g(L2,M,G).
g(L,M,G):- h(L,M,G).

h([],_,[]).
h([X|L1],model([D|Dom],F),[g(X,D)|L2]):- h(L1,model([D|Dom],F),L2).


/* ========================================================================
   Part of an extended model
======================================================================== */

part(model(D,F,_),model(D,F)):- !.
part(model(D,F),model(D,F)):- !.


/* ========================================================================
   Main
======================================================================== */

main(Formula,File):-
   open(File,read,Stream),
   read(Stream,ExtendedModel),
   part(ExtendedModel,Model),
   close(Stream), 
   wff(Formula,Wff,[],Vars),
   g(Vars,Model,G), 
   satisfy(Wff,Model,G,true), !,
   format('\\includegraphics[width=120pt,height=90pt]{~p}~n',[File]).

main(_,_).



