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

iv(prp,_,  lam(X,some(Y,and(n_bicycle_1(Y),and(s_supports(Y,X)))))) --> [cycling].
iv(dcl,sg, lam(X,some(Y,and(n_bicycle_1(Y),and(s_supports(Y,X)))))) --> [cycles].
iv(dcl,pl, lam(X,some(Y,and(n_bicycle_1(Y),and(s_supports(Y,X)))))) --> [cycle].
iv(bse,_,  lam(X,some(Y,and(n_bicycle_1(Y),and(s_supports(Y,X)))))) --> [cycle].
iv(psp,_,  lam(X,some(Y,and(n_bicycle_1(Y),and(s_supports(Y,X)))))) --> [cycled].

iv(prp,_,  lam(X,some(Y,and(s_supports(Y,X))))) --> [standing];[sitting];[walking];[running];[lying].
iv(dcl,sg, lam(X,some(Y,and(s_supports(Y,X))))) --> [stands];[sits];[walks];[runs];[lies].
iv(dcl,pl, lam(X,some(Y,and(s_supports(Y,X))))) --> [stand];[sit];[walk];[run];[lie].
iv(bse,_,  lam(X,some(Y,and(s_supports(Y,X))))) --> [stand];[sit];[walk];[run];[lie].
iv(psp,_,  lam(X,some(Y,and(s_supports(Y,X))))) --> [stood];[sat];[walked];[run];[lain].

iv(prp,_,  lam(X,some(Y,and(n_water_1(Y), and(s_supports(Y,X)))))) --> [swimming].
iv(dcl,sg, lam(X,some(Y,and(n_water_1(Y), and(s_supports(Y,X)))))) --> [swims].
iv(dcl,pl, lam(X,some(Y,and(n_water_1(Y), and(s_supports(Y,X)))))) --> [swim].
iv(bse,_,  lam(X,some(Y,and(n_water_1(Y), and(s_supports(Y,X)))))) --> [swim].
iv(psp,_,  lam(X,some(Y,and(n_water_1(Y), and(s_supports(Y,X)))))) --> [swum].

iv(prp,_,  lam(X,and(not(some(Y),and(s_supports(Y,X)))))) --> [flying].
iv(dcl,sg, lam(X,and(not(some(Y),and(s_supports(Y,X)))))) --> [flies].
iv(dcl,pl, lam(X,and(not(some(Y),and(s_supports(Y,X)))))) --> [fly].
iv(bse,_,  lam(X,and(not(some(Y),and(s_supports(Y,X)))))) --> [fly].
iv(psp,_,  lam(X,and(not(some(Y),and(s_supports(Y,X)))))) --> [flown].

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

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [eating];[crunching];[munching];[biting];[touching].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [eats];[crunches];[munches];[bites];[touches].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [eat];[crunch];[munch];[bite];[touch].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [eat];[crunch];[munch];[bite];[touch].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_touches(X,Y)))))) --> [eaten];[crunched];[munched];[bitten];[touched].

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


