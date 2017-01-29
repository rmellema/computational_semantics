% intransitive verbs
%
iv(prp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiling].
iv(dcl,sg, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiles].
iv(dcl,pl, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(bse,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(psp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiled].

iv(prp,_,  lam(X,some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_closed_1(Y)))))) --> [sleeping].
iv(dcl,sg, lam(X,some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_closed_1(Y)))))) --> [sleeps].
iv(dcl,pl, lam(X,some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_closed_1(Y)))))) --> [sleep].
iv(bse,_,  lam(X,some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_closed_1(Y)))))) --> [sleep].
iv(psp,_,  lam(X,some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_closed_1(Y)))))) --> [slept].

iv(prp,_,  lam(X,some(Z,s_near(Z,X)),some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [looking];[staring].
iv(dcl,sg, lam(X,some(Z,s_near(Z,X)),some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [looks];[stares].
iv(dcl,pl, lam(X,some(Z,s_near(Z,X)),some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [look];[stare].
iv(bse,_,  lam(X,some(Z,s_near(Z,X)),some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [look];[stare].
iv(psp,_,  lam(X,some(Z,s_near(Z,X)),some(Y,and(n_eye_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [looked];[stared].

iv(prp,_,  lam(X,some(Y,and(n_bicycle_1(Y),s_supports(Y,X))))) --> [cycling].
iv(dcl,sg, lam(X,some(Y,and(n_bicycle_1(Y),s_supports(Y,X))))) --> [cycles].
iv(dcl,pl, lam(X,some(Y,and(n_bicycle_1(Y),s_supports(Y,X))))) --> [cycle].
iv(bse,_,  lam(X,some(Y,and(n_bicycle_1(Y),s_supports(Y,X))))) --> [cycle].
iv(psp,_,  lam(X,some(Y,and(n_bicycle_1(Y),s_supports(Y,X))))) --> [cycled].

iv(prp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [standing];[sitting];[perching];[walking];[running];[lying];[leaning].
iv(dcl,sg, lam(X,some(Y,s_supports(Y,X)))) --> [stands];[sits];[perches];[walks];[runs];[lies];[leans].
iv(dcl,pl, lam(X,some(Y,s_supports(Y,X)))) --> [stand];[sit];[perch];[walk];[run];[lie];[lean].
iv(bse,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stand];[sit];[perch];[walk];[run];[lie];[lean].
iv(psp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stood];[sat];[perched];[walked];[run];[lain];[leant].

iv(prp,_,  lam(X,some(Y,and(n_water_1(Y),s_supports(Y,X))))) --> [swimming].
iv(dcl,sg, lam(X,some(Y,and(n_water_1(Y),s_supports(Y,X))))) --> [swims].
iv(dcl,pl, lam(X,some(Y,and(n_water_1(Y),s_supports(Y,X))))) --> [swim].
iv(bse,_,  lam(X,some(Y,and(n_water_1(Y),s_supports(Y,X))))) --> [swim].
iv(psp,_,  lam(X,some(Y,and(n_water_1(Y),s_supports(Y,X))))) --> [swum].

iv(prp,_,  lam(X, not(some(Y,s_supports(Y,X))))) --> [flying]. 
iv(dcl,sg, lam(X, not(some(Y,s_supports(Y,X))))) --> [flies].
iv(dcl,pl, lam(X, not(some(Y,s_supports(Y,X))))) --> [fly].
iv(bse,_,  lam(X, not(some(Y,s_supports(Y,X))))) --> [fly].
iv(psp,_,  lam(X, not(some(Y,s_supports(Y,X))))) --> [flown].

iv(prp,_,  lam(X,or(n_player_1(X), n_player_2(X)))) --> [playing]. 
iv(dcl,sg, lam(X,or(n_player_1(X), n_player_2(X)))) --> [plays]. 
iv(dcl,pl, lam(X,or(n_player_1(X), n_player_2(X)))) --> [play]. 
iv(bse,_,  lam(X,or(n_player_1(X), n_player_2(X)))) --> [play]. 
iv(psp,_,  lam(X,or(n_player_1(X), n_player_2(X)))) --> [played].

iv(prp, _,  lam(X, some(Y, eq(Y, X)))) --> [being].
iv(dcl, sg, lam(X, some(Y, eq(Y, X)))) --> [is].
iv(dcl, pl, lam(X, some(Y, eq(Y, X)))) --> [are].
iv(bse, _, lam(X, some(Y, eq(Y, X)))) --> [am].
iv(psp, _, lam(X, some(Y, eq(Y, X)))) --> [were].

% transitive verbs
%
tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [riding].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [rides].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ride].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ride].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ridden].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(X,Y)))))) --> [holding];[wearing];[carrying].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_supports(X,Y)))))) --> [wears];[holds];[carries].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_supports(X,Y)))))) --> [wear];[hold];[carry].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_supports(X,Y)))))) --> [wear];[hold];[carry].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(X,Y)))))) --> [worn];[held];[carried].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [touching];[playing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [touches];[plays].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [touch];[play].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [touch];[play].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [touched];[played].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,and(n_food_1(Y),s_near(X,Y))))))) --> [eating];[crunching];[munching];[biting].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,and(n_food_1(Y),s_near(X,Y))))))) --> [eats];[crunches];[munches];[bites].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,and(n_food_1(Y),s_near(X,Y))))))) --> [eat];[crunch];[munch];[bite].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,and(n_food_1(Y),s_near(X,Y))))))) --> [eat];[crunch];[munch];[bite].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,and(n_food_1(Y),s_near(X,Y))))))) --> [eaten];[crunched];[munched];[bitten].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,and(n_writing_implement_1(Y),s_touches(X,Y))))))) --> [writing];[drawing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,and(n_writing_implement_1(Y),s_touches(X,Y))))))) --> [writes];[draws].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,and(n_writing_implement_1(Y),s_touches(X,Y))))))) --> [write];[draw].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,and(n_writing_implement_1(Y),s_touches(X,Y))))))) --> [write];[draw].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,and(n_writing_implement_1(Y),s_touches(X,Y))))))) --> [written];[drawn].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_part_of(Y,X)))))) --> [having].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_part_of(Y,X)))))) --> [has].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_part_of(Y,X)))))) --> [have].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_part_of(Y,X)))))) --> [have].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_part_of(Y,X)))))) --> [had].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chasing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chases].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chase].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chased].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chased].

% ditransitive verbs
%
dv(prp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sending].
dv(dcl,sg, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sends].
dv(dcl,pl, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(bse,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sent].

