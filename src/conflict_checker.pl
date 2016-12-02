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

check_supports(L):-
	findall((D1,D2), 
		((supports(D1,D2), \+ touches(D1,D2)), 
			(supports(D1,D2),supports(D2,D1))),
		L).

check_member_of([]).

check_near(L):-
	findall((D1,D2), (near(D1,D2), touches(D1,D2)),L). 
	
check_part_of(L):-
	findall((D1,D2), (part_of(D1,D2), part_of(D2,D1)),L). 

conflicts(F, L) :-
	assert_f(F),
	check_touches(TP),
	L1 = [touches(TP)],
	check_supports(SP),
	L2 = [supports(SP) | L1],
	check_near(NP),
	L3 = [near(NP) | L2],
	check_member_of(MP),
	L4 = [member_of(MP) | L3],
	check_part_of(PP),
	L5 = [part_of(PP) | L4],
	L = L5,
	retractall(touches(_, _)),
	retractall(supports(_, _)),
	retractall(near(_, _)),
	retractall(member_of(_, _)),
	retractall(part_of(_, _)).
