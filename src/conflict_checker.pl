#!/usr/bin/env swipl

:- initialization main.

:- use_module(library(lists)).
:- dynamic(touches/2).
:- dynamic(supports/2).
:- dynamic(near/2).
:- dynamic(member_of/2).
:- dynamic(part_of/2).
assert_touches([]).
assert_touches([(D1, D2) | T]) :-
	assert(touches(D1, D2)),
	assert_touches(T).
assert_supports([]).
assert_supports([(D1, D2) | T]) :-
	assert(supports(D1, D2)),
	assert_supports(T).
assert_near([]).
assert_near([(D1, D2) | T]) :-
	assert(near(D1, D2)),
	assert_near(T).
assert_member_of([]).
assert_member_of([(D1, D2) | T]) :-
	assert(member_of(D1, D2)),
	assert_member_of(T).
assert_part_of([]).
assert_part_of([(D1, D2) | T]) :-
	assert(part_of(D1, D2)),
	assert_part_of(T).

assert_f([]).
assert_f([f(2, s_touches, R) | T]) :- 
	assert_touches(R),
	assert_f(T).
assert_f([f(2, s_supports, R) | T]) :- 
	assert_supports(R),
	assert_f(T).
assert_f([f(2, s_near, R) | T]) :- 
	assert_near(R),
	assert_f(T).
assert_f([f(2, s_member_of, R) | T]) :- 
	assert_member_of(R),
	assert_f(T).
assert_f([f(2, s_part_of, R) | T]) :- 
	assert_part_of(R),
	assert_f(T).
assert_f([_ | T]) :- assert_f(T).

model2kb(model(_, F)) :- assert_f(F).

check_touches(L) :- 
	findall((D1, D2), (touches(D1, D2), \+ touches(D2, D1)), L).

check_supports_touches(L) :-
	findall((D1, D2), (supports(D1,D2), \+ touches(D1,D2)), L).

check_supports_symmetric(L):-
	findall((D1,D2), (supports(D1,D2),supports(D2,D1)), L).

check_near(L):-
	findall((D1, D2), (near(D1, D2), \+ near(D2, D1)), L).

check_part_of(L):-
	findall((D1,D2), (part_of(D1,D2), part_of(D2,D1)),L). 

conflicts(F, L) :-
	assert_f(F),
	check_touches(TP),
	check_supports_symmetric(SP),
	check_supports_touches(STP),
	check_near(NP),
	check_part_of(PP),
	L = [touches(TP), supports_symmetric(SP), supports_touches(STP), 
	     near(NP), part_of(PP)],
	retractall(touches(_, _)),
	retractall(supports(_, _)),
	retractall(near(_, _)),
	retractall(member_of(_, _)),
	retractall(part_of(_, _)).

swap_pairs([], []).
swap_pairs([(H1, H2) | T], [(H2, H1) | T2]) :- swap_pairs(T, T2).

write_error_if_non_empty([], _, _).
write_error_if_non_empty(L, Header, Footer) :-
	write('\t'), write(Header), nl,
	write('\t\t'), write(L), nl,
	write('\t\t'), write(Footer),nl.

fixed(model(D, F), [], model(D, F)).

fixed(model(D, F), [part_of(PP) | CL], 
	model(D, [f(2, s_part_of, PL) | FF])) :-
	(select(f(2, s_part_of, PO), F, PF); (PO = [], PF = F)),
	fixed(model(D, PF), CL, model(D, FF)),
	subtract(PO, PP, TPL), 
	swap_pairs(PP, RPP),
	subtract(TPL, RPP, PL).

fixed(model(D, F), [near(NP) | CL], model(D, [f(2, s_near, NL) | FF])) :-
	(select(f(2, s_near, NO), F, NF);(NO = [], NF = F)),
	fixed(model(D, NF), CL, model(D, FF)),
	swap_pairs(NP, NNP),
	append(NO, NNP, NL).

fixed(model(D, F), [touches(TP) | CL], model(D, [f(2, s_touches, TL) |RNFF])) :-
	select(supports_touches(SP), CL, NCL),
	(select(f(2, s_touches, TO), F, NF); (TO = [], NF = F)),
	fixed(model(D, NF), NCL, model(D, FF)),
	swap_pairs(SP, RSP),
	append(SP, RSP, FSP),
	swap_pairs(TP, RTP),
	append(TO, RTP, TF),
	append(TF, FSP, FTF),
	list_to_set(FTF, TL),
	((select(f(2, s_near, NL), FF, NFF),
		subtract(NL, TL, NNL),
		intersection(NL, TL, I),
		write_error_if_non_empty(I, 
			'Found objects that are s_near and are s_touches.',
			'Removing s_near relation.'),
		RNFF = [f(2, s_near, NNL) | NFF]); RNFF = FF).

fixed(model(D, F), [supports_symmetric([]) | CL], model(D, FF)) :-
	fixed(model(D, F), CL, model(D, FF)).

fixed(model(D, F), [supports_symmetric(SP) | CL], 
	model(D, [f(2, s_supports, SL) | FF])) :-
	select(f(2, s_supports, SO), F, NF),
	fixed(model(D, NF), CL, model(D, FF)),
	write('\tFound a pair of objects that support each other.'), nl,
	write('\t\t'), write(SP), nl,
	write('\t\tRemoving mutual support relations.'), nl,
	subtract(SO, SP, TSL), 
	swap_pairs(SP, RSP),
	subtract(TSL, RSP, SL).

fixed(model(D, F), model(D, RF)) :-
	conflicts(F, CL),
	fixed(model(D, F), CL, model(D, NF)),
	delete(NF, f(2, _, []), RF).
fixed(model(D, F, G), model(D, RF, G)) :-
	fixed(model(D, F), model(D, RF)).

map_absolute_file_name([], _, []).
map_absolute_file_name(['..' | Entries], Dir, Out) :-
	map_absolute_file_name(Entries, Dir, Out).
map_absolute_file_name(['.' | Entries], Dir, Out) :-
	map_absolute_file_name(Entries, Dir, Out).
map_absolute_file_name([Entry | Entries], Dir, [OutEntry | OutEntries]) :-
	file_name_extension(_, 'mod', Entry),
	map_absolute_file_name(Entries, Dir, OutEntries),
	absolute_file_name(Entry, OutEntry, [relative_to(Dir)]).
map_absolute_file_name([_ | Entries], Dir, Out) :- 
	map_absolute_file_name(Entries, Dir, Out).

write_list_tail(Stream, [F]) :-
	tab(Stream, 7),
	writeq(Stream, F),
	write(Stream, ']').

write_list_tail(Stream, [F | T]) :-
	tab(Stream, 7),
	writeq(Stream, F),
	write(Stream, ','),
	nl(Stream),
	write_list_tail(Stream, T).

write_list(Stream, [F]) :-
	tab(Stream, 6),
	write(Stream, '['),
	writeq(Stream, F),
	write(Stream, ']').

write_list(Stream, [F | T]) :-
	tab(Stream, 6),
	write(Stream, '['),
	writeq(Stream, F),
	write(Stream, ','),
	nl(Stream),
	write_list_tail(Stream, T).


write_model(Stream, model(D, F)) :-
	write(Stream, 'model('),
	writeq(Stream, D), write(Stream, ','), nl(Stream),
	write_list(Stream, F),
	write(Stream, ').'),
	nl(Stream).

write_model(Stream, model(D, F, G)) :-
	write(Stream, 'model('),
	writeq(Stream, D), write(Stream, ','), nl(Stream),
	write_list(Stream, F), write(Stream, ','), nl(Stream),
	write_list(Stream, G),
	write(Stream, ').'),
	nl(Stream).

process_file(File, OutFile) :-
	file_base_name(File, Base),
	open(File, read, Stream),
	read(Stream, Model),
	close(Stream),
	write('Processing: '), write(Base), nl,
	fixed(Model, FModel),
	open(OutFile, write, WStream),
	write_model(WStream, FModel),
	nl(WStream),
	close(WStream).

processs_files([], _).

processs_files([H | T], OutDir) :- 
	file_name_extension(_, 'mod', H),
	file_base_name(H, Base),
	absolute_file_name(Base, OutFile, [relative_to(OutDir)]),
	process_file(H, OutFile),
	processs_files(T, OutDir).

process_directory(Dir, OutDir) :-
	directory_files(Dir, Entries),
	map_absolute_file_name(Entries, Dir, AbsEntries),
	processs_files(AbsEntries, OutDir).

setup(Dir, OutDir) :-
	exists_directory(Dir),
	exists_directory(OutDir).

setup(Dir, OutDir) :-
	exists_directory(Dir),
	make_directory(OutDir).

main :-
	current_prolog_flag(argv, [Dir, OutDir]),
	setup(Dir, OutDir),
	process_directory(Dir, OutDir),
	halt.

main :-
	write('Usage: conflict_checker.pl input_dir output_dir'), nl,
	halt.
