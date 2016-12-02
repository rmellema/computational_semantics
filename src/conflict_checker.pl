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

check_member_of([]).

check_near(L):-
	findall((D1, D2), (near(D1, D2), \+ near(D2, D1)), L).
	%	findall((D1,D2), (near(D1,D2), touches(D1,D2)),L). 

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

fixed(model(D, F), [touches(TP) | CL], model(D, [f(2, s_touches, TL) |FF])) :-
	write('bliep'), nl,
	select(supports_touches(SP), CL, NCL),
	%	select(near(NP), NCL, NNCL),
	(select(f(2, s_touches, TO), F, NF); (TO = [], NF = F)),
	fixed(model(D, NF), NCL, model(D, FF)),
	write('blaap'), nl,
	swap_pairs(SP, RSP),
	write('RSP = '), write(RSP), nl,
	append(SP, RSP, FSP),
	write('FSP = '), write(FSP), nl,
	swap_pairs(TP, RTP),
	append(TO, RTP, TF),
	write('FTF = '), write(FTF), nl,
	append(TF, FSP, FTF),
	%subtract(FTF, NP, NFTF),
	list_to_set(FTF, TL).


fixed(model(D, F), [supports_symmetric(SP) | CL], 
	model(D, [f(2, s_supports, SL) | FF])) :-
	select(f(2, s_supports, SO), F, NF),
	fixed(model(D, NF), CL, model(D, FF)),
	subtract(SO, SP, TSL), 
	swap_pairs(SP, RSP),
	subtract(TSL, RSP, SL).


