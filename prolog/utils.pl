:- [model_checker].

take(_, [], []).
take(0, _, []).
take(N, [H | T], [H | ST]) :-
	M is N -1,
	take(M, T, ST).

write_list([]).
write_list([H | T]) :- write(H), nl, write_list(T).

map_absolute_file_name([], _, _, []).
map_absolute_file_name(['..' | Entries], Dir, Ext, Out) :- !,
	map_absolute_file_name(Entries, Dir, Ext, Out).
map_absolute_file_name(['.' | Entries], Dir, Ext, Out) :- !,
	map_absolute_file_name(Entries, Dir, Ext, Out).
map_absolute_file_name([Entry | Entries], Dir, Ext, [OutEntry | OutEntries]) :-
	file_name_extension(_, Ext, Entry), !,
	map_absolute_file_name(Entries, Dir, Ext, OutEntries),
	absolute_file_name(Entry, OutEntry, [relative_to(Dir)]).
map_absolute_file_name([_ | Entries], Dir, Ext, Out) :- 
	map_absolute_file_name(Entries, Dir, Ext, Out).

read_all([], []).
read_all([P | Paths], [path(P, M) | Models]) :-
	open(P, read, Stream),
	read(Stream, FM),
	close(Stream),
	part(FM, M),
	read_all(Paths, Models).

load_directory(Dir, Models) :-
	directory_files(Dir, Entries),
	map_absolute_file_name(Entries, Dir, 'mod', Paths),
	read_all(Paths, Models).

change_ext(_, _, [], []).
change_ext(Old, New, OPath, NPath) :-
	file_name_extension(Base, Old, OPath),
	file_name_extension(Base, New, NPath).


