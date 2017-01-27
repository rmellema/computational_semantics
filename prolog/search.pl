:- use_module(library(apply)).
:- use_module(library(lists)).

:- [utils].
:- [model_checker].
:- [semdcg].

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

read_query(Stream, Query) :-
	read(Stream, Sentence),
	s(Sem, Sentence, []),
	betaConvert(Sem, Query).

filter_models(_, _, [], []).
filter_models(Wff, Vars, [path(P, M) | AllModels], [path(P, M) | Models]) :-
	g(Vars, M, G),
	satisfy(Wff, M, G, true), !,
	filter_models(Wff, Vars, AllModels, Models).
filter_models(Wff, Vars, [_ | AllModels], Models) :-
	filter_models(Wff, Vars, AllModels, Models).
filter_models(Query, AllModels, Models) :-
	wff(Query, Wff, [], Vars),
	filter_models(Wff, Vars, AllModels, Models).

rel_list_to_paths([], []).
rel_list_to_paths([(_, P, _) | T], [P | PT]) :- rel_list_to_paths(T, PT).

sort_models(Query, Models, SortedModels) :-
	findall((R, P, M), (member(path(P, M), Models), relevance(Query, M, R)), MR),
	sort(1, @>=, MR, SMR),
	rel_list_to_paths(SMR, SortedModels).

search(Stream, Models, SortedPaths) :-
	read_query(Stream, Query),
	filter_models(Query, Models, TrueModels),
	\+ length(TrueModels, 0), !,
	sort_models(Query, TrueModels, SortedPaths).
search(_, _, []).
search(Models, RelMods) :-
	search(user_input, Models, RelMods).

main(Limit) :-
	load_directory('./data/', Models),
	search(Models, RelPaths),
	take(Limit, RelPaths, First),
	maplist(change_ext('mod', 'jpg'), First, ImgPaths),
	write_list(ImgPaths).
main() :- main(5).
