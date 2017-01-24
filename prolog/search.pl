:- use_module(library(apply)).
:- use_module(library(lists)).
:- [model_checker].

make_assingment([], [], []).
make_assingment([V | Vs], [X | Xs], [g(V, X) | G]) :- 
	make_assingment(Vs, Xs, G).

remove_some(some(_, F1), F2) :- 
	remove_some(F1, F2).
remove_some(all(X, F1), all(X, F2)) :- 
	remove_some(F1, F2).
remove_some(not(F1), not(F2)) :- 
	remove_some(F1, F2).
remove_some(and(F1, G1), and(F2, G2)) :- 
	remove_some(F1, F2), 
	remove_some(G1, G2).
remove_some(or(F1, G1), or(F2, G2)) :- 
	remove_some(F1, F2), 
	remove_some(G1, G2).
remove_some(imp(F1, G1), imp(F2, G2)) :- 
	remove_some(F1, F2), 
	remove_some(G1, G2).
remove_some(eq(X, Y), eq(X, Y)).
remove_some(pred(Sym, Arity, Terms), pred(Sym, Arity, Terms)).

relevance_calculation(model(D, _), Objects, Relevance) :-
	length(D, DomainSize),
	length(Objects, RelevantObjects),
	Relevance is RelevantObjects / DomainSize.

relevance(Query, Model, Relevance) :-
	wff(Query, SomeWff, [], Vars),
	remove_some(SomeWff, Wff),
	make_assingment(Vars, _, G),
	findall(G, satisfy(Wff, Model, G, true), GS),
	maplist(make_assingment, _, Domains, GS),
	maplist(relevance_calculation(Model), Domains, Relevances),
	max_list(Relevances, Relevance).

