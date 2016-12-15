#!/usr/bin/env swipl

:- initialization main.

check_domain([], []).
check_domain([E | D], []) :-
	write('< '),
	write(E), nl,
	check_domain(D, []).
check_domain([], [E | D]) :-
	write('> '),
	write(E), nl,
	check_domain([], D).
check_domain([E1 | D1], D2) :-
	select(E1, D2, ND2),
	check_domain(D1, ND2).
check_domain([E1 | D1], D2) :-
	\+ member(E1, D2),
	write('< '), write(E1), nl,
	check_domain(D1, D2).

write_if_different(_, _, [], []).
write_if_different(_, _, L1, L2) :-
	subtract(L1, L2, []),
	subtract(L2, L1, []).
write_if_different(A, N, L1, L2) :-
	subtract(L1, L2, RL),
	subtract(L2, L1, []),
	write('< '), write(f(A, N, RL)), nl.
write_if_different(A, N, L1, L2) :-
	subtract(L1, L2, []),
	subtract(L2, L1, RL),
	write('> '), write(f(A, N, RL)), nl.
write_if_different(A, N, L1, L2) :-
	subtract(L1, L2, RL1),
	subtract(L2, L1, RL2),
	write('< '), write(f(A, N, RL1)), nl,
	write('> '), write(f(A, N, RL2)), nl.

check_function([], []).
check_function([E | F], []) :-
	write('< '),
	write(E), nl,
	check_function(F, []).
check_function([], [E | F]) :-
	write('> '),
	write(E), nl,
	check_function([], F).
check_function([f(A, N, L1) | F1], F2) :-
	select(f(A, N, L2), F2, NF2),
	write_if_different(A, N, L1, L2),
	check_function(F1, NF2).
check_function([f(A, N, L1) | F1], F2) :-
	\+ member(f(A, N, _), F2),
	write('< '), write(f(A, N, L1)), nl,
	check_function(F1, F2).

check_g(_, _).

process_model(model(D1, F1),     model(D2, F2)) :-
	check_domain(D1, D2),
	check_function(F1, F2).
process_model(model(D1, F1, _),  model(D2, F2)) :-
	process_model(model(D1, F1), model(D2, F2)).
process_model(model(D1, F1),     model(D2, F2, _)) :-
	process_model(model(D1, F1), model(D2, F2)).
process_model(model(D1, F1, G1), model(D2, F2, G2)) :-
	process_model(model(D1, F1), model(D2, F2)),
	check_g(G1, G2).

write_header(File1, File2) :-
	file_base_name(File1, Base),
	file_base_name(File2, Base),
	write('--- '), write(Base), nl.
write_header(File1, File2) :-
	write('<<< '), write(File1), nl,
	write('>>> '), write(File2), nl.

process_file(File1, File2) :-
	open(File1, read, Stream1),
	read(Stream1, Model1),
	close(Stream1),
	open(File2, read, Stream2),
	read(Stream2, Model2),
	close(Stream2),
	write_header(File1, File2),
	process_model(Model1, Model2).

process_file_list([], []).
process_file_list([Abs1 | T1], [Abs2 | T2]) :-
	process_file(Abs1, Abs2),
	process_file_list(T1, T2).

assert_equal([], []).
assert_equal([Abs1 | T1], [Abs2 | T2]) :-
	file_base_name(Abs1, Base),
	file_base_name(Abs2, Base),
	assert_equal(T1, T2).
assert_equal(_, _) :-
	write('Directories have different .mod files. Aborting'), nl,
	halt(1).

process_directory(Dir1, Dir2) :-
	directory_files(Dir1, Entries1),
	directory_files(Dir2, Entries2),
	map_absolute_file_name(Entries1, Dir1, Abs1),
	map_absolute_file_name(Entries2, Dir2, Abs2),
	assert_equal(Abs1, Abs2),
	process_file_list(Abs1, Abs2).

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


main(File1, File2) :-
	exists_file(File1),
	exists_file(File2),
	process_file(File1, File2).
main(File1, File2) :-
	exists_directory(File1),
	exists_directory(File2),
	process_directory(File1, File2).
main(File1, File2) :-
	exists_directory(File1),
	exists_file(File2),
	write('First file is a directory, but second file is regular file, aborting'),
	nl, halt.
main(File1, File2) :-
	exists_file(File1),
	exists_directory(File2),
	write('First file is a fegular file, but second file is directory, aborting'),
	nl, halt.

main :-
	current_prolog_flag(argv, [File1, File2]),
	main(File1, File2),
	halt.

main :-
	write('Usage: model_diff.pl file1 file2'), nl,
	halt.
